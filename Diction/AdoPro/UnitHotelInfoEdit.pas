unit UnitHotelInfoEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
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
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, cxImageComboBox,ServMod,UnitProc,Core,cxGridDBTableView,
  dxSkinscxPCPainter, cxPCdxBarPopupMenu, ComCtrls, cxPC, AzComboBox,
  cxRadioGroup, cxGroupBox, UnitFrameSearchCity, TourCmnlIf, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  UnitFrameDescriptionWebHTML, cxMemo, cxGridLevel, cxClasses, ServUn,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid, ImgList,OptSet,
  UnitFramePhotoList, UnitHtlServ,UnitHtlDocFrm,DocFileUn, UnitEditText,
  cxCheckBox, Grids, DBGrids, UnitUpdateImages,UnitFrameUpdateImages,
  cxCheckListBox, cxCalendar, UnitHookControlChangeValue, UnitFrameComRequisites,
  UnitComRequisites,TourConsts,TourStrMag, UnitCompBr,UnitLngTranslateEdit,OrderUn,
  UnitListViewDataIcons, UnitControlDrawImage,UnitProjectProc,ServModDic;

type
  TImgFilterObject = record
    Tableid:Integer;
    Elem:TDBShema;
  end;

  TFrmHotelInfoEdit = class(TForm)
    CtrlPanel: TPanel;
    AddManLabel: TLabel;
    AddDateLabel: TLabel;
    BtnSaveData: TBitBtn;
    CancelBtn: TBitBtn;
    PageControlMain: TcxPageControl;
    TabHotel: TcxTabSheet;
    TabDescription: TcxTabSheet;
    LbHotelKind: TLabel;
    CmbHotelKind: TcxExtLookupComboBox;
    LbName: TLabel;
    EdNameHotel: TcxTextEdit;
    ButCountryOficialLng: TSpeedButton;
    StarsDBComboBox: TcxImageComboBox;
    Label8: TLabel;
    HotelOfficeBtn: TSpeedButton;
    Label9: TLabel;
    HtlGroupComboBox: TComboBoxEx;
    WebHotelLabel: TLabel;
    URLBtn: TSpeedButton;
    EdWebUrl: TcxTextEdit;
    cxGroupBox1: TcxGroupBox;
    CmbHtlClassComboBox1: TcxExtLookupComboBox;
    CmbHtlClassComboBox2: TcxExtLookupComboBox;
    CmbHtlClassComboBox3: TcxExtLookupComboBox;
    GroupBoxGalery: TcxGroupBox;
    PhotoPanel: TPanel;
    RBAllImg: TcxRadioButton;
    RBHtlImg: TcxRadioButton;
    RBBldImg: TcxRadioButton;
    RbRommImg: TcxRadioButton;
    Bevel2: TBevel;
    Label1: TLabel;
    FrameSearchCity: TFrameSearchCity;
    Panel1: TPanel;
    Panel2: TPanel;
    HtlBldImgsEditBtn: TSpeedButton;
    Label2: TLabel;
    GridBuilds: TcxGrid;
    GridBuildsDBTableView1: TcxGridDBTableView;
    GridBuildsLevel1: TcxGridLevel;
    Panel3: TPanel;
    Panel4: TPanel;
    butEditRoom: TSpeedButton;
    HtlRoomImgsEditBtn: TSpeedButton;
    Label3: TLabel;
    GridHtlRoom: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    TabDoc: TcxTabSheet;
    TabLogImport: TcxTabSheet;
    GridDocDBTableView1: TcxGridDBTableView;
    GridDocLevel1: TcxGridLevel;
    GridDoc: TcxGrid;
    Panel5: TPanel;
    HtlDocLaunchBtn: TSpeedButton;
    GridImport: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    Panel6: TPanel;
    ImportBtn: TSpeedButton;
    PanelMemo: TPanel;
    MemoHotelDesript: TcxMemo;
    Panel10: TPanel;
    SpeedButton6: TSpeedButton;
    Label5: TLabel;
    PageControlRoomInf: TcxPageControl;
    TabServiceInHotel: TcxTabSheet;
    TabBuilding: TcxTabSheet;
    TabRoom: TcxTabSheet;
    cxTabSheet4: TcxTabSheet;
    PageControlDescript: TcxPageControl;
    TabDescriptBuilding: TcxTabSheet;
    TabDescriptApartment: TcxTabSheet;
    HotelServiceListView: TListView;
    BldServiceListView: TListView;
    RoomServiceListView: TListView;
    Panel12: TPanel;
    ListViewHotelLargeBtn: TSpeedButton;
    ListViewHotelListBtn: TSpeedButton;
    ListViewHotelDetailBtn: TSpeedButton;
    ButEditServiceInHotel: TSpeedButton;
    Panel13: TPanel;
    ListViewBuildLargeBtn: TSpeedButton;
    ListViewBuildlListBtn: TSpeedButton;
    ListViewBuildDetailBtn: TSpeedButton;
    ButEditServiceInBuild: TSpeedButton;
    Panel14: TPanel;
    ListViewRoomlLargeBtn: TSpeedButton;
    ListViewRoomListBtn: TSpeedButton;
    ListViewRoomDetailBtn: TSpeedButton;
    ButEditServiceInRoom: TSpeedButton;
    LargeImageList: TImageList;
    SmallImageList: TImageList;
    FramePhotoListInfo: TFramePhotoList;
    DisableCheckBox: TcxCheckBox;
    ShowWebCheckBox: TcxCheckBox;
    butAddBuild: TSpeedButton;
    butEditBuild: TSpeedButton;
    butDelBuild: TSpeedButton;
    Bevel1: TBevel;
    Label7: TLabel;
    HtlGroupImageList: TImageList;
    HtlHtlImgsEditBtn: TSpeedButton;
    butAddRoom: TSpeedButton;
    butDelRoom: TSpeedButton;
    Bevel3: TBevel;
    Panel9: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    butEditRoomBed: TSpeedButton;
    Label4: TLabel;
    butAddRoomBed: TSpeedButton;
    butDelRoomBed: TSpeedButton;
    GridBedInApartment: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    Panel11: TPanel;
    butAddRoomVariant: TSpeedButton;
    buDelRoomVariant: TSpeedButton;
    Panel15: TPanel;
    GridRoomVariantDBTableView1: TcxGridDBTableView;
    GridRoomVariantLevel1: TcxGridLevel;
    GridRoomVariant: TcxGrid;
    Label10: TLabel;
    PanelUpdate: TPanel;
    butRefreshDic: TSpeedButton;
    butEditDoc: TSpeedButton;
    butDelDoc: TSpeedButton;
    butAddDoc: TSpeedButton;
    Bevel4: TBevel;
    Bevel5: TBevel;
    BevelMainSpliterMoveRows: TBevel;
    butMoveUp: TSpeedButton;
    butMoveDown: TSpeedButton;
    DocCopyToBtn: TSpeedButton;
    DocRenameBtn: TSpeedButton;
    Bevel6: TBevel;
    DocOpenFolderBtn: TSpeedButton;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    Bevel7: TBevel;
    butRefreshImport: TSpeedButton;
    EdPathCityName: TcxTextEdit;
    ImageListLng: TImageList;
    FrameApartmentDescriptionWebHTML: TFrameDescriptionWebHTML;
    FrameBuildDescriptionWebHTML: TFrameDescriptionWebHTML;
    FrameDescriptionWebHTMLHotel: TFrameDescriptionWebHTML;
    procedure URLBtnClick(Sender: TObject);
    procedure ButEditServiceInHotelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure RBAllImgClick(Sender: TObject);
    procedure ListViewHotelLargeBtnClick(Sender: TObject);
    procedure ListViewBuildLargeBtnClick(Sender: TObject);
    procedure ListViewRoomlLargeBtnClick(Sender: TObject);
    procedure butAddBuildClick(Sender: TObject);
    procedure butEditBuildClick(Sender: TObject);
    procedure butDelBuildClick(Sender: TObject);
    procedure BtnSaveDataClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure CmbHtlClassComboBox1PropertiesInitPopup(Sender: TObject);
    procedure CmbHtlClassComboBox2PropertiesInitPopup(Sender: TObject);
    procedure CmbHtlClassComboBox3PropertiesInitPopup(Sender: TObject);
    procedure HtlBldImgsEditBtnClick(Sender: TObject);
    procedure HtlHtlImgsEditBtnClick(Sender: TObject);
    procedure HtlRoomImgsEditBtnClick(Sender: TObject);
    procedure butEditRoomClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExtLookupVariantBedPropertiesChange(Sender: TObject);
    procedure butAddRoomClick(Sender: TObject);
    procedure butDelRoomClick(Sender: TObject);
    procedure butDelRoomBedClick(Sender: TObject);
    procedure butEditRoomBedClick(Sender: TObject);
    procedure butAddRoomBedClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure HotelOfficeBtnClick(Sender: TObject);
    procedure buDelRoomVariantClick(Sender: TObject);
    procedure butAddRoomVariantClick(Sender: TObject);
    procedure HtlDocLaunchBtnClick(Sender: TObject);
    procedure butRefreshDicClick(Sender: TObject);
    procedure butAddDocClick(Sender: TObject);
    procedure butEditDocClick(Sender: TObject);
    procedure butDelDocClick(Sender: TObject);
    procedure butMoveUpClick(Sender: TObject);
    procedure butMoveDownClick(Sender: TObject);
    procedure DocOpenFolderBtnClick(Sender: TObject);
    procedure DocCopyToBtnClick(Sender: TObject);
    procedure DocRenameBtnClick(Sender: TObject);
    procedure ImportBtnClick(Sender: TObject);
    procedure ButCountryOficialLngClick(Sender: TObject);
    procedure butRefreshImportClick(Sender: TObject);
    procedure CmbHtlClassComboBox1PropertiesChange(Sender: TObject);
  private
    FImgrecNo: Integer;
    FCanUpdate: Boolean;
    FIsNew   : Boolean;
    FHookControlChangeValue : THookControlChangeValue;
    FCurrManager:Integer;
    //FLevMngPermis:Integer;
    FCurManagerName:Widestring;
    FPathToImage : WideString;
    FPathToHtml : WideString;
    FIconDrawControlShema : TIconDrawControlShema;

    FHotelServ: TListViewDataIcons;
    FBuildServ: TListViewDataIcons;
    FRoomServ : TListViewDataIcons;

    procedure FRefreshAllSrv;
    procedure FRefreshHtlSrv;
    procedure FRefreshRoomSrv;
    procedure FRefreshBldSrv;

    procedure FListViewEn(aListView:TListView;En:Boolean);
    procedure FRefreshControls;
    procedure FPrepare( isNew:Boolean );
    procedure FPrepareLngControls;
    function  FGetParamImg:TViewFieldImgUpd;
    procedure FPrepareControls;
    procedure FPrepareShowNamePath;
    procedure FShowData;
    procedure FPrepareDataGrid( isNew:Boolean );
    function  FSaveData:Boolean;

    function  FCheckError( ShowErrorMes:Boolean = true ):Boolean;
    function  FCheckBuildAndRoom( ShowErrorMes:Boolean = true ):Boolean;

    procedure FRefreshChangeControl(Sender: TObject);
    function  FgetViewFieldImgUpdPrperty:TViewFieldImgUpd;

    procedure ViewHtlRoomDblClick(Sender: TObject);
    procedure ViewBedInApartmentClick(Sender: TObject);

    procedure ViewHotelDocDblClick(Sender: TObject);
    procedure ViewHotelDocFocusedRecordChanged(
              Sender: TcxCustomGridTableView; APrevFocusedRecord,
              AFocusedRecord: TcxCustomGridRecord;
              ANewItemRecordFocusingChanged: Boolean);

    procedure ViewBuildsFocusedRecordChanged(
              Sender: TcxCustomGridTableView; APrevFocusedRecord,
              AFocusedRecord: TcxCustomGridRecord;
              ANewItemRecordFocusingChanged: Boolean);

    procedure ViewHtlRoomFocusedRecordChanged( Sender: TcxCustomGridTableView; APrevFocusedRecord,
              AFocusedRecord: TcxCustomGridRecord;
              ANewItemRecordFocusingChanged: Boolean);

    function GetSelCountryName:Variant;
    function GetSelCountryEn_Name:String;

    function GetSelCountryIsLat_Name:Boolean;
    procedure ViewViewHtlBuildDblClick(Sender: TObject);
    Procedure FShowUdateImageFor(TableIndex:Integer);
    procedure FRefreshRoomVariant;
    procedure FDoDocOpenFolder;
    procedure FDoDocRename(const NewName: String);
    function  FGetCurrentPathToHotelDescript:Widestring;
    function  FGetCurrentPathToHotelImage:Widestring;
    function  FGetCurrentPathToBuildDescript:Widestring;
    function  FGetCurrentPathToBuildImage:Widestring;
    function  FGetCurrentPathToRoomDescript:Widestring;
    function  FGetCurrentPathToRoomImage:Widestring;

    { Private declarations }
  public
    function CurrImageTableId : TImgFilterObject;
    { Public declarations }
  end;
  function  GetHotelDocFileName( NameEng,HotelDocId, FileName:Widestring ): String;
  function  GetDocStorePath: String;
  procedure ShowEditHotelInfo( isNew:Boolean; aCurrManager:Integer; aCurManagerName:Widestring; CanUpdate:Boolean  );
  //procedure UpdateImage ( ImdUpd:TViewFieldImgUpd );
  function  GetParamService:TParamListShowDataIcon;
var
  FrmHotelInfoEdit: TFrmHotelInfoEdit;
  FilterTableIndex:Integer;
implementation

{$R *.dfm}

procedure ShowEditHotelInfo( isNew:Boolean; aCurrManager:Integer; aCurManagerName:Widestring; CanUpdate:Boolean );
begin
  try
    Application.CreateForm(TFrmHotelInfoEdit, FrmHotelInfoEdit);

    FrmHotelInfoEdit.FCurrManager := aCurrManager ;
    FrmHotelInfoEdit.FCurManagerName := aCurManagerName;
    FrmHotelInfoEdit.FCanUpdate := CanUpdate;
    FrmHotelInfoEdit.FPrepare( isNew );
    FrmHotelInfoEdit.ShowModal;
  finally
    FrmHotelInfoEdit.Free;
    FrmHotelInfoEdit:=nil;
  end;
end;

function GetImgElem(TableInd:Integer):TDBShemaView;
begin
  if TableInd = 0 then result := Elem_HtlImgQry;
  if TableInd = 1 then result := Elem_HtlBuildQry;
  if TableInd = 2 then result := Elem_HtlRoomQry;
end;

function GetImgField(TableInd:Integer):string;
begin
  if TableInd = 0 then result := 'OBJECTID';
  if TableInd = 1 then result := 'BUILDID';
  if TableInd = 2 then result := 'OBJECTID';
end;

function GetImgObjValue(TableInd:Integer; CurrElem:TDBShema ):Variant;
begin
  if TableInd = 0 then  result := 0;
  if TableInd = 1 then  result := CurrElem.GetValueId;
  if TableInd = 2 then  result := CurrElem.GetValueId;
end;

procedure FilterDBImage( DataSet: TDataSet; var Accept: Boolean );
var CurrTableId : TImgFilterObject;
    FieldId : String;
    AValue:Variant;
begin
  if FrmHotelInfoEdit <> nil then
  begin
    CurrTableId := FrmHotelInfoEdit.CurrImageTableId;
    if CurrTableId.Tableid <> -1 then
    begin
      FieldId := GetImgField(CurrTableId.Tableid);
      AValue := GetImgObjValue( CurrTableId.Tableid, CurrTableId.Elem );

      Accept := ( DataSet.FieldByName('TableId').AsInteger >= CurrTableId.Tableid ) and
                ( ( CurrTableId.Tableid > 0 ) and ( DataSet.FieldByName(FieldId).AsInteger =  AValue ) ) or
                ( CurrTableId.Tableid = 0 ) ;
    end
    else Accept := True;
  end;
end;

procedure FilterDBImageUpdate( DataSet: TDataSet; var Accept: Boolean );
var FieldId:string;
    CurrElem:TDBShemaView;
    AValue:Variant;
begin
  if FilterTableIndex <> -1 then
  begin
    CurrElem := GetImgElem( FilterTableIndex );
    FieldId :=GetImgField( FilterTableIndex );
    AValue := GetImgObjValue( FilterTableIndex, CurrElem );

    Accept := ( DataSet.FieldByName('TableId').AsInteger = FilterTableIndex ) and
              ( DataSet.FieldByName(FieldId).AsInteger =  AValue )
  end
  else Accept := True;
end;

function GetDocStorePath: String;
begin
  Result := IncludeTrailingPathDelimiter( GetHotelDocFolder(
    Elem_BrHotelQry.DB.FieldByName('COUNTRY_ENG').AsString, Elem_BrHotelQry.GetValueIdStr ));

  if Elem_HtlImgQry.DB.FieldByName('TABLEID').AsInteger = HtlBuildImage then
    result :=  IncludeTrailingPathDelimiter(Result + Elem_HtlImgQry.DB.FieldByName('OBJECTID').AsString );

  if Elem_HtlImgQry.DB.FieldByName('TABLEID').AsInteger = HtlRoomImage then
    result :=  IncludeTrailingPathDelimiter(Result + Elem_HtlImgQry.DB.FieldByName('BUILDID').AsString +
      PathDelim + Elem_HtlImgQry.DB.FieldByName('OBJECTID').AsString );

  Result := CheckLastSleshOnPath( GetLocalFileName(Result) , TRue);
end;

function GetHotelDocFileName( NameEng,HotelDocId, FileName:Widestring ): String;
begin
  Result := IncludeTrailingPathDelimiter( GetHotelDocFolder(NameEng,HotelDocId ) ) + FileName;
end;

function TFrmHotelInfoEdit.FGetCurrentPathToHotelDescript:Widestring;
begin
  result := self.FPathToHtml + AddNolForLengthNumber( Elem_BrHotelQry.GetValueIdStr, 4 ) + '\Hotel\';
end;

function TFrmHotelInfoEdit.FGetCurrentPathToHotelImage:Widestring;
begin
  result := self.FPathToImage + AddNolForLengthNumber( Elem_BrHotelQry.GetValueIdStr, 4 ) + '\Hotel\';
end;

function TFrmHotelInfoEdit.FGetCurrentPathToBuildDescript:Widestring;
begin
  result := self.FPathToHtml + AddNolForLengthNumber( Elem_BrHotelQry.GetValueIdStr, 4 ) + '\Building\';
end;

function TFrmHotelInfoEdit.FGetCurrentPathToBuildImage:Widestring;
begin
  result := self.FPathToImage + AddNolForLengthNumber( Elem_BrHotelQry.GetValueIdStr, 4 ) + '\Building\';
end;

function TFrmHotelInfoEdit.FGetCurrentPathToRoomDescript:Widestring;
begin
  result := self.FPathToHtml + AddNolForLengthNumber( Elem_BrHotelQry.GetValueIdStr, 4 ) + '\Room\';
end;

function TFrmHotelInfoEdit.FGetCurrentPathToRoomImage:Widestring;
begin
  result := self.FPathToImage + AddNolForLengthNumber( Elem_BrHotelQry.GetValueIdStr, 4 ) + '\Room\';
end;

procedure TFrmHotelInfoEdit.FPrepare( isNew:Boolean );
var PropertyDescriptWebBuild:TPropertyDescriptWeb;
    PropertyDescriptWebRoom:TPropertyDescriptWeb;
    PropertyDescriptWebHotel:TPropertyDescriptWeb;
begin
  FPathToImage  := OptionSet.WebPathToImage+'HOTELS\';
  FPathToHtml   := OptionSet.WebPathToHtml+'HOTELS\';

  FIsNew := isNew;
  Elem_HtlImgQry.AddFilterFunct( FilterDBImage );

  PageControlRoomInf.ActivePage := TabServiceInHotel;
  PageControlDescript.ActivePage := TabDescriptBuilding;

  Elem_BrCountryQry.DBOpen;
  Elem_ExpandNameQry.DBOpen;
  Elem_HotelKindQry.DBOpen;
  Elem_HtlSrvLnkQry.DBOpen;
  Elem_BldSrvLnkQry.DBOpen;
  Elem_RoomSrvLnkQry.DBOpen;

  Elem_HtlBuildQry.DBOpen;
  Elem_HtlRoomQry.DBOpen;
  Elem_SERVGROUPQry.DBOpen;
  Elem_SERVICEQry.DBOpen;
  Elem_RoomBedQry.DBOpen;
  Elem_HotelCLASSQry.DBOpen;
  Elem_RoomVariantQry.DBOpen;
  Elem_BuildsQry.DBOpen;
  Elem_RoomTypeQry.DBOpen;
  Elem_BedTypeQry.DBOpen;
  Elem_HtlDocQry.DBOpen;
  Elem_ImportLog.DBOpen;
  Elem_CompEnterpriseHoteQry.DBOpen;

  FPrepareControls;

  FHotelServ:= TListViewDataIcons.Create(GetParamService,HotelServiceListView);
  FBuildServ:= TListViewDataIcons.Create(GetParamService,BldServiceListView);
  FRoomServ := TListViewDataIcons.Create(GetParamService,RoomServiceListView);

  FRefreshAllSrv;

  FShowData;

  FRefreshControls;
  FHookControlChangeValue := THookControlChangeValue.Create(self, FRefreshChangeControl );
  FHookControlChangeValue.AddControl( FrameSearchCity );

  PropertyDescriptWebHotel := PepareFrameDesription( Elem_BrHotelQry,  FGetCurrentPathToHotelDescript, FGetCurrentPathToHotelImage,Elem_BrHotelQry.View.Styles  );
  PropertyDescriptWebBuild := PepareFrameDesription( Elem_HtlBuildQry, FGetCurrentPathToBuildDescript, FGetCurrentPathToBuildImage,Elem_BrHotelQry.View.Styles );
  PropertyDescriptWebRoom :=  PepareFrameDesription( Elem_HtlRoomQry,  FGetCurrentPathToRoomDescript , FGetCurrentPathToRoomImage,Elem_BrHotelQry.View.Styles );

  FrameBuildDescriptionWebHTML.Prepare(PropertyDescriptWebBuild);
  FrameApartmentDescriptionWebHTML.Prepare(PropertyDescriptWebRoom);
  FrameDescriptionWebHTMLHotel.Prepare( PropertyDescriptWebHotel );
end;

function GetParamService:TParamListShowDataIcon;
begin
  result.FieldName :='Name';
  result.FieldCommnets:='COMMENTS';
  result.FieldLargeIcon :='LARGEICON';
  result.FieldSmallIcon :='SMALLICON';
  result.FieldCurrencyShort :='CURRENCYSHORT';
  result.FieldCost := 'COST';
  result.FieldHaveCost :='HAVECOST';
  result.FieldLinkId :='LINKID';
end;

procedure TFrmHotelInfoEdit.FPrepareLngControls;
var paramImgValue : array of  TparamImgValue;
    paramImgValueCl1 : array of TparamImgValue;
    paramImgValueCl2 : array of TparamImgValue;
    paramImgValueCl3 : array of TparamImgValue;
begin
  SetLength( paramImgValue,2);
  paramImgValue[0].fieldName := 'LNGNOTFOUND';
  paramImgValue[0].value  := 0;
  paramImgValue[0].Umova  := '<>';
  paramImgValue[0].IndImg := 0;

  paramImgValue[1].fieldName := 'LNGCHANGE';
  paramImgValue[1].value  := 0;
  paramImgValue[1].Umova  := '<>';
  paramImgValue[1].IndImg := 0;
  //*****************************************
  SetLength( paramImgValueCl1,2);
  paramImgValueCl1[0].fieldName :='LNGNOTFOUND_Cl1';
  paramImgValueCl1[0].value  := 0;
  paramImgValueCl1[0].Umova  := '<>';
  paramImgValueCl1[0].IndImg := 0;

  paramImgValueCl1[1].fieldName :='LNGNOTFOUND_Cl1';
  paramImgValueCl1[1].value  := 0;
  paramImgValueCl1[1].Umova  := '<>';
  paramImgValueCl1[1].IndImg := 0;
  //*****************************************
  SetLength( paramImgValueCl2,2);
  paramImgValueCl2[0].fieldName :='LNGNOTFOUND_Cl2';
  paramImgValueCl2[0].value  := 0;
  paramImgValueCl2[0].Umova  := '<>';
  paramImgValueCl2[0].IndImg := 0;

  paramImgValueCl2[1].fieldName :='LNGNOTFOUND_Cl2';
  paramImgValueCl2[1].value  := 0;
  paramImgValueCl2[1].Umova  := '<>';
  paramImgValueCl2[1].IndImg := 0;
  //*****************************************
  SetLength( paramImgValueCl3,2);
  paramImgValueCl3[0].fieldName :='LNGNOTFOUND_Cl3';
  paramImgValueCl3[0].value  := 0;
  paramImgValueCl3[0].Umova  := '<>';
  paramImgValueCl3[0].IndImg := 0;

  paramImgValueCl3[1].fieldName :='LNGNOTFOUND_Cl3';
  paramImgValueCl3[1].value  := 0;
  paramImgValueCl3[1].Umova  := '<>';
  paramImgValueCl3[1].IndImg := 0;
  //*****************************************

  FIconDrawControlShema := TIconDrawControlShema.Create;
  FIconDrawControlShema.AddControl( EdNameHotel, ImageListLng, Elem_BrHotelQry.DB, paramImgValue );
  FIconDrawControlShema.AddControl( CmbHtlClassComboBox1,ImageListLng, Elem_BrHotelQry.DB, paramImgValueCl1 );
  FIconDrawControlShema.AddControl( CmbHtlClassComboBox2,ImageListLng, Elem_BrHotelQry.DB, paramImgValueCl2 );
  FIconDrawControlShema.AddControl( CmbHtlClassComboBox3,ImageListLng, Elem_BrHotelQry.DB, paramImgValueCl3 );
end;

function TFrmHotelInfoEdit.FGetParamImg:TViewFieldImgUpd;
begin
  result.ElemImages := Elem_HtlImgQry;
  result.FieldId := Elem_HtlImgQry.FieldKod;
  result.FieldFileName := 'FILENAME';
  result.FieldWeb  := 'SHOWWEB';
  result.FieldMemo := 'DESCRIPT';

  result.FieldObject :=  '';
  result.FieldObjValue := '';
end;

{procedure UpdateImage ( ImdUpd:TViewFieldImgUpd  );
var ImgUpdPrperty:TViewFieldImgUpd;
    ImageIndex:Integer;
begin
  if FrmHotelInfoEdit = nil then Exit;

  try
    ImageIndex := FrmHotelInfoEdit.GetImageIndexl;
    FilterTableIndex := ImageIndex;
    Elem_HtlImgQry.AddFilterFunct( FilterDBImageUpdate );
    Elem_HtlImgQry.Refilter;
    Elem_HtlImgQry.SetDefaultValue( ['TABLEID'] , [ImageIndex] );

    ImgUpdPrperty := FGetViewFieldImgUpdPrperty;
    ImgUpdPrperty.FieldObject :=  GetImgField( ImageIndex );
    ImgUpdPrperty.FieldObjValue := GetImgObjValue( ImageIndex, GetImgElem(ImageIndex) );
    ShowUpdateImages( ImgUpdPrperty, GetDocStorePath, OptionSet.WebPathToImage+'no-image.png', Elem_BrHotelQry.View.Styles );
  finally
    Elem_HtlImgQry.AddFilterFunct( FilterDBImage );
    Elem_HtlImgQry.Refilter;
  end;
end;  }


procedure TFrmHotelInfoEdit.FPrepareControls;
begin
  FPrepareLngControls;
  //SetPropInCxColumnExtLookupComboBox( CmbxSearchCountry.Properties, TcxGridDBTableView( Elem_BrCountryQry.ViewList ),'NAME', Elem_BrCountryQry.FieldKod, True, false );
  //SetPropInCxExtLookupComboBox( CmbxSearchCountry, TcxGridDBTableView( Elem_BrCountryQry.ViewList ),'NAME', Elem_BrCountryQry.FieldKod, FCanUpdate, false );
  //SetPropInCxExtLookupComboBox( ExtLookupVariantBed, TcxGridDBTableView( Elem_RoomVariantQry.ViewList) ,'CalcVariantName', Elem_RoomVariantQry.FieldKod,True,false );

  FrameSearchCity.Prepare( Elem_BrCountryQry, False, FCanUpdate, FrameSearchCity.Width * 2,nil,
                           nil, Elem_BrCountryQry.View.Styles );
  SetPropInCxExtLookupComboBox( CmbHotelKind, TcxGridDBTableView( Elem_HotelKindQry.ViewList) ,'NAME', Elem_HotelKindQry.FieldKod, FCanUpdate,false );
  DataSetToListItems( Elem_HTLGRPQry.DB.FieldByName('NAME'), Elem_HTLGRPQry.DB.FieldByName('HOTELGROUPID'), Elem_HTLGRPQry.DB.FieldByName('LOGOIMAGE'),
                      GetGroupLogoFileFolder, HtlGroupComboBox.ItemsEx, HtlGroupImageList);

  SetPropInCxExtLookupComboBox( CmbHtlClassComboBox1, TcxGridDBTableView( Elem_HotelCLASSQry.ViewList ),'NAME', Elem_HotelCLASSQry.FieldKod, FCanUpdate,False );
  SetPropInCxExtLookupComboBox( CmbHtlClassComboBox2, TcxGridDBTableView( Elem_HotelCLASSQry.ViewList ),'NAME', Elem_HotelCLASSQry.FieldKod, FCanUpdate,False );
  SetPropInCxExtLookupComboBox( CmbHtlClassComboBox3, TcxGridDBTableView( Elem_HotelCLASSQry.ViewList ),'NAME', Elem_HotelCLASSQry.FieldKod, FCanUpdate,False );

  GridBuilds.Levels[0].GridView.OnDblClick := ViewViewHtlBuildDblClick;
  GridHtlRoom.Levels[0].GridView.OnDblClick := ViewHtlRoomDblClick;
  GridBedInApartment.Levels[0].GridView.OnDblClick := ViewBedInApartmentClick;
  GridDoc.Levels[0].GridView.OnDblClick := ViewHotelDocDblClick;

  TcxGridDBTableView( GridBuilds.Levels[0].GridView ).OnFocusedRecordChanged := ViewBuildsFocusedRecordChanged;
  TcxGridDBTableView( GridDoc.Levels[0].GridView ).OnFocusedRecordChanged := ViewHotelDocFocusedRecordChanged;
  TcxGridDBTableView( GridHtlRoom.Levels[0].GridView ).OnFocusedRecordChanged := ViewHtlRoomFocusedRecordChanged;

  FramePhotoListInfo.IntitListPhotoFrame( FGetParamImg, OptionSet.WebPathToImage+'no-image.png', Elem_HotelCLASSQry.View.Styles  );
  FramePhotoListInfo.SetShowDateFoto( True, 'Дата фото.' );
  FramePhotoListInfo.SetShowCanUpdateFoto( False );
  //FramePhotoListInfo.SetFunctionUpdateImage( UpdateImage );


  PageControlMain.ActivePage := TabHotel;
end;

procedure TFrmHotelInfoEdit.FRefreshHtlSrv;
begin
  if (self.FHotelServ <> nil) then
  begin
    if (not self.FIsNew) then self.FHotelServ.DrawServiceListBySet( Elem_HtlSrvLnkQry, DMServ.ItsLocalLang )
    else self.FHotelServ.ClearData;
  end;
end;

procedure TFrmHotelInfoEdit.FRefreshBldSrv;
begin
  if self.FBuildServ <> nil then
  begin
    if (not self.FIsNew) then self.FBuildServ.DrawServiceListBySet( Elem_BldSrvLnkQry, DMServ.ItsLocalLang )
    else self.FBuildServ.ClearData;
  end
end;

procedure TFrmHotelInfoEdit.FRefreshRoomSrv;
begin
  if self.FRoomServ <> nil then
  begin
    if (not self.FIsNew) then self.FRoomServ.DrawServiceListBySet( Elem_RoomSrvLnkQry, DMServ.ItsLocalLang )
    else self.FRoomServ.ClearData;
  end;
end;

procedure TFrmHotelInfoEdit.FRefreshAllSrv;
begin
  FRefreshHtlSrv;
  FRefreshBldSrv;
  FRefreshRoomSrv;
end;

procedure TFrmHotelInfoEdit.URLBtnClick(Sender: TObject);
begin
  WebBrowse( Elem_BrHotelQry.DB.FieldByName('URL').AsString );
end;

procedure TFrmHotelInfoEdit.FPrepareShowNamePath;
begin
  EdPathCityName.EditValue :=  FrameSearchCity.GetNamePathForCurrId; //FrameSearchCity.GetSelValueByFieldName('NAMEPATH');
end;

procedure TFrmHotelInfoEdit.FPrepareDataGrid( isNew:Boolean );
begin
  Elem_HtlBuildQry.ShowEmptyDataOnView( isNew, TcxGridDBTableView( GridBuilds.Levels[0].GridView ) );
  Elem_HtlRoomQry.ShowEmptyDataOnView( isNew, TcxGridDBTableView( GridHtlRoom.Levels[0].GridView ) );
  Elem_RoomVariantQry.ShowEmptyDataOnView( isNew, TcxGridDBTableView( GridRoomVariant.Levels[0].GridView ) );
  Elem_RoomBedQry.ShowEmptyDataOnView( isNew, TcxGridDBTableView( GridBedInApartment.Levels[0].GridView ) );
end;

procedure TFrmHotelInfoEdit.FShowData;
begin
  if not FisNew then
  begin
    MemoHotelDesript.Text :=  Elem_BrHotelQry.DB.FieldByName('Comments').AsString;
    //CmbxSearchCountry.EditValue := Elem_BrHotelQry.DB.fieldByName('COUNTRYID').value;

    EdNameHotel.Text := Elem_BrHotelQry.DB.fieldByName('NAME').asString;
    StarsDBComboBox.EditValue := Elem_BrHotelQry.DB.fieldByName('STARS').asString;
    HtlGroupComboBox.ItemIndex := Elem_BrHotelQry.DB.fieldByName('GroupId').asInteger;
    EdWebUrl.Text := Elem_BrHotelQry.DB.fieldByName('URL').asString;
    CmbHtlClassComboBox1.EditValue := Elem_BrHotelQry.DB.fieldByName('CATCLASS1').asInteger;
    CmbHtlClassComboBox2.EditValue := Elem_BrHotelQry.DB.fieldByName('CATCLASS2').asInteger;
    CmbHtlClassComboBox3.EditValue := Elem_BrHotelQry.DB.fieldByName('CATCLASS3').asInteger;

    //if {(CmbxSearchCountry.EditValue <> null)and}(CmbxSearchCountry.EditValue <> 0) then
    FrameSearchCity.SetValue( Elem_BrHotelQry.DB.fieldByName('ID_CITY_ADM_UNIT').value );
    FPrepareShowNamePath;

    DisableCheckBox.Checked:= Elem_BrHotelQry.DB.FieldByName('DISABLED').asBoolean ;
    ShowWebCheckBox.Checked:= Elem_BrHotelQry.DB.FieldByName('SHOWWEB').asBoolean;
    CmbHotelKind.EditValue := Elem_BrHotelQry.DB.fieldByName('HOTELKIND').value ;
  end
  else
  begin
    MemoHotelDesript.Text :='';
    //CmbxSearchCountry.EditValue := Elem_BrCountryQry.GetValueId;
    FrameSearchCity.SetValue( null );
    DisableCheckBox.Checked := false;
    ShowWebCheckBox.Checked := false;
    StarsDBComboBox.EditValue  :='';
    HtlGroupComboBox.ItemIndex := -1;
    EdWebUrl.Text :='';
    CmbHtlClassComboBox1.EditValue := null;
    CmbHtlClassComboBox2.EditValue := null;
    CmbHtlClassComboBox3.EditValue := null;
    CmbHotelKind.EditValue := null;
  end;

  FPrepareDataGrid( FisNew );
  FRefreshRoomVariant;
end;

function TFrmHotelInfoEdit.FCheckBuildAndRoom( ShowErrorMes:Boolean = true ):Boolean;
var MessError:string;
begin
  MessError := '';

  if Elem_HtlBuildQry.View.DataController.RowCount = 0 then
    MessError := 'Додайте споруду';

  if Elem_HtlRoomQry.View.DataController.RowCount = 0 then
    MessError := 'Додайте номер';

  if MessError <> '' then
  begin
    Result := False;
    MyShowMessageDlg( MessError, mtError, but_OK );
  end
  else Result := True;
  
end;

function TFrmHotelInfoEdit.FCheckError( ShowErrorMes:Boolean = true ):Boolean;
begin
  Result := False;
  //if ValidateValueControl( CmbxSearchCountry, 'Виберіть країну'  ) then
    if ValidateValueControl(FrameSearchCity.EdSearchCity, 'Виберіть місто,курорт'  ) then
      if ValidateValueControl(EdNameHotel, 'Вкажіть назву готелю'  ) then
        if ValidateValueControl(CmbHotelKind, 'Вкажіть тип готелю'  ) then
          if ValidateValueControl(StarsDBComboBox, 'Вкажіть категорію готелю' ) then Result := True;
end;

function TFrmHotelInfoEdit.FSaveData:Boolean;
var CurrCityId:Variant;
begin
  result := False;
  if not FCheckError then exit;

  if not FIsNew then Elem_BrHotelQry.DB.edit
  else Elem_BrHotelQry.DB.Insert;

  //if Elem_BrHotelQry.DB.fieldByName('ID_CITY_ADM_UNIT').Value = null then
  //  Elem_BrHotelQry.DB.fieldByName('CITYID').value :=19;// Тимчасово потім забрати коли Delete Column CITYID

  Elem_BrHotelQry.DB.fieldByName('ID_CITY_ADM_UNIT').value :=  FrameSearchCity.EditValue;
  Elem_BrHotelQry.DB.FieldByName('Comments').AsString :=  MemoHotelDesript.Text;
  Elem_BrHotelQry.DB.fieldByName('COUNTRYID').value :=  Elem_BrCountryQry.GetValueId; 

  Elem_BrHotelQry.DB.FieldByName('DISABLED').asBoolean := DisableCheckBox.Checked;
  Elem_BrHotelQry.DB.FieldByName('SHOWWEB').asBoolean := ShowWebCheckBox.Checked;
                 
  Elem_BrHotelQry.DB.FieldByName('URL').asString := EdWebUrl.EditingText;
  Elem_BrHotelQry.DB.fieldByName('NAME').asString := EdNameHotel.Text;
  Elem_BrHotelQry.DB.fieldByName('STARS').asString := StarsDBComboBox.EditValue;
  Elem_BrHotelQry.DB.fieldByName('GroupId').asInteger := HtlGroupComboBox.ItemIndex;

  Elem_BrHotelQry.DB.fieldByName('CATCLASS1').value := CmbHtlClassComboBox1.EditValue;
  Elem_BrHotelQry.DB.fieldByName('CATCLASS2').value := CmbHtlClassComboBox2.EditValue;
  Elem_BrHotelQry.DB.fieldByName('CATCLASS3').value := CmbHtlClassComboBox3.EditValue;
  Elem_BrHotelQry.DB.fieldByName('HOTELKIND').value := CmbHotelKind.EditValue;
  Elem_BrHotelQry.DB.fieldByName('ADDMANID').value := self.FCurrManager;

  Elem_BrHotelQry.SaveMarkID;
  Elem_BrHotelQry.DB.Post;
  CurrCityId := Elem_BrHotelQry.DB.fieldByName('ID_CITY_ADM_UNIT').value;

  Elem_BrHotelQry.RequeryCurrentRecord;
  result := True;

  if self.FIsNew then
  begin
    Elem_HCityQry.Requery;
    if Elem_HCityQry.DB.Locate( Elem_HCityQry.FieldKod, CurrCityId,[] ) then
      Elem_BrHotelQry.GotoMarkID;
  end;

  self.FIsNew := False;
  FPrepareDataGrid( self.FIsNew );
  FHookControlChangeValue.IsChange := False;
  FRefreshControls;
end;

procedure TFrmHotelInfoEdit.ButEditServiceInHotelClick(Sender: TObject);
var ElemServicesUpdate:TElemServicesUpdate;
begin
  if not FCheckBuildAndRoom then exit;
  
  ElemServicesUpdate.ElemHtlSrvLnk := Elem_HtlSrvLnkQry;
  ElemServicesUpdate.ElemBldSrvLnk := Elem_BldSrvLnkQry;
  ElemServicesUpdate.ElemRoomSrvLnk:= Elem_RoomSrvLnkQry;

  ElemServicesUpdate.ElemSERVGROUP := Elem_SERVGROUPQry;
  ElemServicesUpdate.ElemService := Elem_SERVICEQry;
  ElemServicesUpdate.ElemCurrency := Elem_CurrencyQry;
  ElemServicesUpdate.Elem_BrHotelQry := Elem_BrHotelQry;
  ElemServicesUpdate.Elem_HtlBuildQry := Elem_HtlBuildQry;
  ElemServicesUpdate.Elem_HtlRoomQry := Elem_HtlRoomQry;

  ExecuteHotelServiceMaster( ElemServicesUpdate, PageControlRoomInf.ActivePageIndex );
  FRefreshAllSrv;
end;

procedure TFrmHotelInfoEdit.FormDestroy(Sender: TObject);
begin
  FrameSearchCity.DestroyFrame;
  FHookControlChangeValue.Close;
  FIconDrawControlShema.Close;
  FHotelServ.Free;
  FBuildServ.Free;
  FRoomServ.Free;
end;

procedure TFrmHotelInfoEdit.FListViewEn(aListView:TListView;En:Boolean);
begin
  if En then aListView.Color := TcxGridDBTableView(GridBuilds.Levels[0].GridView).Styles.Content.Color
  else aListView.Color := TcxGridDBTableView(GridBuilds.Levels[0].GridView).Styles.Footer.Color;

  aListView.Enabled := En;
end;

procedure TFrmHotelInfoEdit.FRefreshControls;
begin
  if FIconDrawControlShema <> nil then
    FIconDrawControlShema.RefreshControls;
  
  Elem_HtlImgQry.DB.Filtered := False;
  Elem_HtlImgQry.DB.Filtered := not RBAllImg.Checked;
  if not FisNew then
    FramePhotoListInfo.Refresh( GetDocStorePath, True )
  else FramePhotoListInfo.ClearImage;
  //*********************
 { if ( TcxGridDBTableView( Elem_RoomVariantQry.ViewList).ViewData.RowCount <> 0 ) and (not self.FIsNew) then
    ExtLookupVariantBed.Visible := True
  else
    ExtLookupVariantBed.Visible := False; }
  //*********************
  FramePhotoListInfo.SetEnabled( not self.FIsNew );
  RBAllImg.Enabled := not self.FIsNew;
  RBHtlImg.Enabled := not self.FIsNew;
  RBBldImg.Enabled := not self.FIsNew;
  RbRommImg.Enabled := not self.FIsNew;

  Elem_BuildsQry.GridSetEnabled( GridBuilds, not self.FIsNew );
  Elem_HtlRoomQry.GridSetEnabled( GridHtlRoom, not self.FIsNew );
  Elem_RoomBedQry.GridSetEnabled( GridBedInApartment,not self.FIsNew );
  Elem_RoomVariantQry.GridSetEnabled( GridRoomVariant,not self.FIsNew );

  FListViewEn(HotelServiceListView, not self.FIsNew );
  FListViewEn(BldServiceListView, not self.FIsNew );
  FListViewEn(RoomServiceListView, not self.FIsNew );

  PageControlRoomInf.Enabled := not self.FIsNew;
  ButEditServiceInHotel.Enabled := not self.FIsNew;
  ButEditServiceInBuild.Enabled := not self.FIsNew;
  ButEditServiceInRoom.Enabled := not self.FIsNew;
  //***************************
  FrameDescriptionWebHTMLHotel.SetEnabled( not self.FIsNew );
  FrameBuildDescriptionWebHTML.SetEnabled( not self.FIsNew );
  FrameApartmentDescriptionWebHTML.SetEnabled( not self.FIsNew );
  //***************************
  butAddBuild.Enabled := (not self.FIsNew)and ( Elem_HtlBuildQry.CheckRoleInsert );
  butEditBuild.Enabled := (not self.FIsNew) and (TcxGridDBTableView(GridBuilds.Levels[0].GridView).ViewData.RecordCount>0) and ( Elem_HtlBuildQry.CheckRoleUpdate );
  butDelBuild.Enabled := (not self.FIsNew) and (TcxGridDBTableView(GridBuilds.Levels[0].GridView).ViewData.RecordCount>0) and ( Elem_HtlBuildQry.CheckRoleDelete );
  HtlBldImgsEditBtn.Enabled := (not self.FIsNew);
  //*************
  butAddRoom.Enabled := (not self.FIsNew) and (Elem_HtlRoomQry.CheckRoleInsert);
  butEditRoom.Enabled := (not self.FIsNew) and (TcxGridDBTableView(GridHtlRoom.Levels[0].GridView).ViewData.RecordCount>0)and (Elem_HtlRoomQry.CheckRoleUpdate);
  butDelRoom.Enabled := (not self.FIsNew) and (TcxGridDBTableView(GridHtlRoom.Levels[0].GridView).ViewData.RecordCount>0)and (Elem_HtlRoomQry.CheckRoleDelete  );
  HtlRoomImgsEditBtn.Enabled := (not self.FIsNew);
  //************
  HtlHtlImgsEditBtn.Enabled  := not self.FIsNew;
  //************
  butAddRoomVariant.Enabled  := (Elem_HtlRoomQry.View.ViewData.RowCount <> 0)and(not self.FIsNew) and(Elem_RoomVariantQry.CheckRoleInsert);
  buDelRoomVariant.Enabled   := (Elem_RoomVariantQry.View.ViewData.RowCount <> 0)and(Elem_RoomVariantQry.CheckRoleDelete);;

  butAddRoomBed.Enabled := (not self.FIsNew) and (Elem_RoomVariantQry.View.ViewData.RowCount <> 0) and ( Elem_RoomBedQry.CheckRoleInsert );
  butEditRoomBed.Enabled := (not self.FIsNew) and (TcxGridDBTableView(GridBedInApartment.Levels[0].GridView).ViewData.RecordCount>0)and ( Elem_RoomBedQry.CheckRoleUpdate );
  butDelRoomBed.Enabled := (not self.FIsNew) and (TcxGridDBTableView(GridBedInApartment.Levels[0].GridView).ViewData.RecordCount>0)and ( Elem_RoomBedQry.CheckRoleDelete );

  if Self.FHookControlChangeValue <> nil then
    BtnSaveData.Enabled := Self.FHookControlChangeValue.IsChange
  else BtnSaveData.Enabled := False;

  HotelOfficeBtn.Enabled := ( not self.FIsNew ) and
                            ( FrameSearchCity.EditValue <> null ) and (EdNameHotel.Text <> '' );

  FrameBuildDescriptionWebHTML.RefreshShowCurrDescription;
  FrameApartmentDescriptionWebHTML.RefreshShowCurrDescription;
  //*************
  butEditDoc.Enabled :=  ( Elem_HTLDOCQry.View.ViewData.RowCount <> 0) and (Elem_HTLDOCQry.CheckRoleUpdate );
  butDelDoc.Enabled :=  ( Elem_HTLDOCQry.View.ViewData.RowCount <> 0) and (Elem_HTLDOCQry.CheckRoleDelete );
  butMoveUp.Enabled := ( Elem_HTLDOCQry.CheckMoveUpRow ) and (Elem_HTLDOCQry.CheckRoleUpdate );
  butMoveDown.Enabled := ( Elem_HTLDOCQry.CheckMoveDownRow ) and (Elem_HTLDOCQry.CheckRoleUpdate );
  DocCopyToBtn.Enabled :=  ( Elem_HTLDOCQry.View.ViewData.RowCount <> 0 )and ( Elem_HTLDOCQry.CheckRoleUpdate );
  DocRenameBtn.Enabled :=  ( Elem_HTLDOCQry.View.ViewData.RowCount <> 0 )and ( Elem_HTLDOCQry.CheckRoleUpdate );
  HtlDocLaunchBtn.Enabled :=  ( Elem_HTLDOCQry.View.ViewData.RowCount <> 0 ) and (Elem_HTLDOCQry.CheckRoleAny );
  DocOpenFolderBtn.Enabled := ( Elem_HTLDOCQry.View.ViewData.RowCount <> 0 ) and (Elem_HTLDOCQry.CheckRoleAny ) ;
  //***************************
  TabDoc.Enabled := not self.FIsNew;
  TabLogImport.Enabled := not self.FIsNew;
  TabDescription.Enabled := not self.FIsNew;
  //***************************
  ElemUserRole.RefreshControlRole( Self );
  //***************************
end;

procedure TFrmHotelInfoEdit.SpeedButton6Click(Sender: TObject);
var NewText: Widestring;
begin
  NewText := ShowEditText( MemoHotelDesript.Text, 'Примітка' );
  if NewText <> '^' then
  begin
    MemoHotelDesript.Text := NewText;
  end;
end;

function TFrmHotelInfoEdit.CurrImageTableId:TImgFilterObject;
begin
  if self.name = '' then exit;
  
  if RBAllImg.Checked  then  result.Tableid :=-1;
  if RBHtlImg.Checked  then  result.Tableid := 0;
  if RBBldImg.Checked  then  result.Tableid := 1;
  if RbRommImg.Checked then  result.Tableid := 2;

  result.Elem := GetImgElem(result.Tableid)
end;

procedure TFrmHotelInfoEdit.RBAllImgClick(Sender: TObject);
begin
  FRefreshControls;
end;

procedure TFrmHotelInfoEdit.ListViewHotelLargeBtnClick(Sender: TObject);
begin
  FHotelServ.SetListViewStyle( (Sender as TComponent).Tag );
end;

procedure TFrmHotelInfoEdit.ListViewBuildLargeBtnClick(Sender: TObject);
begin
  FBuildServ.SetListViewStyle( (Sender as TComponent).Tag );
end;

procedure TFrmHotelInfoEdit.ListViewRoomlLargeBtnClick(Sender: TObject);
begin
  FRoomServ.SetListViewStyle( (Sender as TComponent).Tag );
end;

procedure TFrmHotelInfoEdit.butAddBuildClick(Sender: TObject);
begin
  Elem_HtlBuildQry.DBInsert(True);
  Elem_HtlBuildQry.RequeryCurrentRecord;
end;

procedure TFrmHotelInfoEdit.butEditBuildClick(Sender: TObject);
begin
  Elem_HtlBuildQry.DBEdit(True);
  Elem_HtlBuildQry.RequeryCurrentRecord;
end;

procedure TFrmHotelInfoEdit.butDelBuildClick(Sender: TObject);
begin
  Elem_HtlBuildQry.DBDelete;
end;

procedure TFrmHotelInfoEdit.BtnSaveDataClick(Sender: TObject);
begin
  self.FSaveData;
end;

procedure TFrmHotelInfoEdit.CancelBtnClick(Sender: TObject);
begin
  self.ModalResult := mrCancel;
end;

function TFrmHotelInfoEdit.GetSelCountryName:Variant;
begin
  result := Elem_BrCountryQry.DB.FieldByName('NAME').value;
end;

function TFrmHotelInfoEdit.GetSelCountryEn_Name:String;
begin
  result := Elem_BrCountryQry.DB.FieldByName('NAME_ENG').asString;
end;

function TFrmHotelInfoEdit.GetSelCountryIsLat_Name:Boolean;
begin
  result := Elem_BrCountryQry.DB.FieldByName('LATNAME').asBoolean;
end;

procedure TFrmHotelInfoEdit.CmbHtlClassComboBox1PropertiesInitPopup(
  Sender: TObject);
begin
  Elem_HotelCLASSQry.SetFilterOnViewList( ['CTYPE'], [1], ['='] );
end;

procedure TFrmHotelInfoEdit.CmbHtlClassComboBox2PropertiesInitPopup(
  Sender: TObject);
begin
  Elem_HotelCLASSQry.SetFilterOnViewList( ['CTYPE'], [2], ['='] );
end;

procedure TFrmHotelInfoEdit.CmbHtlClassComboBox3PropertiesInitPopup(
  Sender: TObject);
begin
  Elem_HotelCLASSQry.SetFilterOnViewList( ['CTYPE'], [3], ['='] );
end;

procedure TFrmHotelInfoEdit.ViewViewHtlBuildDblClick(Sender: TObject);
begin
  if butEditBuild.Enabled then butEditBuild.Click;
end;

function TFrmHotelInfoEdit.FGetViewFieldImgUpdPrperty : TViewFieldImgUpd;
begin
  result.ElemImages := Elem_HtlImgQry;
  result.FieldId := 'HOTELIMAGEID';
  result.FieldFileName := 'FILENAME';
  result.FieldWeb := 'SHOWWEB';
  result.FieldMemo := 'DESCRIPT';
end;

Procedure TFrmHotelInfoEdit.FShowUdateImageFor( TableIndex:Integer );
var ImgUpdPrperty:TViewFieldImgUpd;
begin
  try
    FilterTableIndex := TableIndex;
    Elem_HtlImgQry.AddFilterFunct( FilterDBImageUpdate );
    Elem_HtlImgQry.Refilter;
    ImgUpdPrperty := FGetViewFieldImgUpdPrperty;
    ImgUpdPrperty.FieldObject :=  GetImgField( TableIndex );
    ImgUpdPrperty.FieldObjValue := GetImgObjValue( TableIndex, GetImgElem(TableIndex) );

    Elem_HtlImgQry.SetDefaultValue( ['TABLEID'] , [TableIndex] );
    ShowUpdateImages( ImgUpdPrperty, GetDocStorePath, OptionSet.WebPathToImage+'no-image.png', Elem_BrHotelQry.View.Styles );
  finally
    Elem_HtlImgQry.AddFilterFunct( FilterDBImage );
    Elem_HtlImgQry.Refilter;
  end;
end;

procedure TFrmHotelInfoEdit.HtlHtlImgsEditBtnClick(Sender: TObject);
begin
  FShowUdateImageFor( 0 );
end;

procedure TFrmHotelInfoEdit.HtlBldImgsEditBtnClick(Sender: TObject);
begin
  FShowUdateImageFor( 1 );
end;

procedure TFrmHotelInfoEdit.HtlRoomImgsEditBtnClick(Sender: TObject);
begin
  FShowUdateImageFor( 2 );
end;

procedure TFrmHotelInfoEdit.butAddRoomClick(Sender: TObject);
begin
  Elem_HtlRoomQry.DBInsert(True);
  Elem_HtlRoomQry.RequeryCurrentRecord;
end;

procedure TFrmHotelInfoEdit.butEditRoomClick(Sender: TObject);
begin
  Elem_HtlRoomQry.DBEdit(True);
  Elem_HtlRoomQry.RequeryCurrentRecord;
end;

procedure TFrmHotelInfoEdit.butDelRoomClick(Sender: TObject);
begin
  Elem_HtlRoomQry.DBDelete;
end;

procedure TFrmHotelInfoEdit.ViewHtlRoomDblClick(Sender: TObject);
begin
  if butEditRoom.Enabled then butEditRoom.Click;
end;

procedure TFrmHotelInfoEdit.ViewBedInApartmentClick(Sender: TObject);
begin
  if butEditRoomBed.Enabled then butEditRoomBed.Click;
end;

procedure TFrmHotelInfoEdit.FRefreshRoomVariant;
var indColId:Integer;
begin
  if TcxGridDBTableView( Elem_RoomVariantQry.ViewList).ViewData.RowCount <> 0 then
    indColId := TcxGridDBTableView( Elem_RoomVariantQry.ViewList).GetColumnByFieldName( Elem_RoomVariantQry.FieldKod ).Index;
end;

procedure TFrmHotelInfoEdit.ViewHtlRoomFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  FRefreshRoomVariant;
  FRefreshControls;
end;

procedure TFrmHotelInfoEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  GridBuilds.Levels[0].GridView.OnDblClick := nil;
  GridHtlRoom.Levels[0].GridView.OnDblClick := nil;
  GridBedInApartment.Levels[0].GridView.OnDblClick := nil;
  GridDoc.Levels[0].GridView.OnDblClick := nil;

  TcxGridDBTableView( GridBuilds.Levels[0].GridView ).OnFocusedRecordChanged := nil;
  TcxGridDBTableView( GridHtlRoom.Levels[0].GridView ).OnFocusedRecordChanged := nil;
  TcxGridDBTableView( GridDoc.Levels[0].GridView ).OnFocusedRecordChanged := nil;
end;

procedure TFrmHotelInfoEdit.ExtLookupVariantBedPropertiesChange(
  Sender: TObject);
begin
  FRefreshControls;
end;

procedure TFrmHotelInfoEdit.butAddRoomBedClick(Sender: TObject);
begin
  Elem_RoomBedQry.DBInsert(True);
  FRefreshControls;
end;

procedure TFrmHotelInfoEdit.butEditRoomBedClick(Sender: TObject);
begin
  Elem_RoomBedQry.DBEdit(True);
  FRefreshControls;
end;

procedure TFrmHotelInfoEdit.butDelRoomBedClick(Sender: TObject);
begin
  Elem_RoomBedQry.DBDelete;
  FRefreshControls;
end;

procedure TFrmHotelInfoEdit.FRefreshChangeControl(Sender: TObject);
begin
  FPrepareShowNamePath;
  FRefreshControls;
end;

procedure TFrmHotelInfoEdit.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if BtnSaveData.Enabled then
    if MyShowMessageDlg( AskChangeDataSave, mtConfirmation, but_YES_NO ) = Res_YES then
       CanClose := self.FSaveData;
end;

procedure TFrmHotelInfoEdit.HotelOfficeBtnClick(Sender: TObject);
var CaptEdRequisites : WideString;
    ParamFrame:TParamComRequisitesFrame;
    ParamFrameHotelEnterp: TParamHotelEnterprise;
    CurrCompanyID:Variant;
begin
  ParamFrameHotelEnterp.HotelId := Elem_BrHotelQry.GetValueId;
  ParamFrameHotelEnterp.HotelName := EdNameHotel.Text;
  ParamFrameHotelEnterp.HotelKindName := CmbHotelKind.Text;

  ParamFrameHotelEnterp.HotelCountryName := GetSelCountryName;//CmbxSearchCountry.Text;
  ParamFrameHotelEnterp.HoteCityName := FrameSearchCity.EditName;
  ParamFrameHotelEnterp.ElemCompEnterpriseHotel := Elem_CompEnterpriseHoteQry;
  ParamFrameHotelEnterp.ElemHotel := Elem_BrHotelQry;
  ParamFrameHotelEnterp.idCountry := Elem_BrCountryQry.GetValueId; //CmbxSearchCountry.EditValue;
  ParamFrameHotelEnterp.idCity := FrameSearchCity.EditValue;

  CaptEdRequisites := Elem_BrHotelQry.DB.FieldByName('NAME').AsString +' / '+FrameSearchCity.EditName+','+ self.GetSelCountryName +' - Реквізити';
  ParamFrame := GetPrepareComRquisitesFrame;
  ParamFrame.ElemCompanyQry := Elem_CompEnterpriseHoteQry;
  ParamFrame.ParamHotelEnterprise := ParamFrameHotelEnterp;
  ParamFrame.ElemCompContractNumsQry := Elem_CompContractNumsQry;
  ParamFrame.ElemUsersQry := Elem_UsersQry; 

  ShowUpdateRequisites( CaptEdRequisites, ParamFrame, True, self.FCurrManager, DMServ.CurManagerName );
end;

procedure TFrmHotelInfoEdit.buDelRoomVariantClick(Sender: TObject);
begin
  Elem_RoomVariantQry.DBDelete;
  FRefreshControls;
end;

procedure TFrmHotelInfoEdit.butAddRoomVariantClick(Sender: TObject);
begin
  if Elem_RoomVariantQry.DBInsert( False ) then
    Elem_RoomVariantQry.DB.Post;
    
  FRefreshControls;
end;

procedure TFrmHotelInfoEdit.HtlDocLaunchBtnClick(Sender: TObject);
begin
  ShellOpenDocument( GetDocStorePath + Elem_HtlDocQry.DB.FieldByName('FILENAME').asString );
end;

procedure TFrmHotelInfoEdit.butRefreshDicClick(Sender: TObject);
begin
  Elem_HtlDocQry.Requery;
  FRefreshControls;
end;

procedure TFrmHotelInfoEdit.butAddDocClick(Sender: TObject);
begin
  Elem_HtlDocQry.DBInsert( True );
  Elem_HtlDocQry.RequeryCurrentRecord;
  FRefreshControls;
end;

procedure TFrmHotelInfoEdit.butEditDocClick(Sender: TObject);
begin
  Elem_HtlDocQry.DBEdit( True );
  FRefreshControls;
end;

procedure TFrmHotelInfoEdit.butDelDocClick(Sender: TObject);
begin
  Elem_HtlDocQry.DBDelete;
  FRefreshControls;
end;

procedure TFrmHotelInfoEdit.butMoveUpClick(Sender: TObject);
begin
  Elem_HtlDocQry.MoveUpRow;
  FRefreshControls;
end;

procedure TFrmHotelInfoEdit.butMoveDownClick(Sender: TObject);
begin
  Elem_HtlDocQry.MoveDownRow;
  FRefreshControls;
end;


procedure TFrmHotelInfoEdit.FDoDocOpenFolder;
var CurrDocFileName:String;
begin
  CurrDocFileName := GetHotelDocFileName( Elem_BrHotelQry.DB.FieldByName('COUNTRY_ENG').AsString,
                    Elem_HtlDocQry.DB.FieldByName('HOTELID').asString,
                    Elem_HtlDocQry.DB.FieldByName('FILENAME').asString );

  ShellOutward( ExtractFileDir( GetLocalFileName(CurrDocFileName) ), '', '', '', SW_NORMAL );
end;

procedure TFrmHotelInfoEdit.DocOpenFolderBtnClick(Sender: TObject);
begin
  FDoDocOpenFolder;
end;

procedure TFrmHotelInfoEdit.FDoDocRename(const NewName: String);
var CurrFileName:WideString;
begin
  CurrFileName:= GetHotelDocFileName( Elem_BrHotelQry.DB.FieldByName('NAME_ENG').asString,
                                      Elem_HtlDocQry.DB.FieldByName('HOTELID').asString,
                                      Elem_HtlDocQry.DB.FieldByName('FILENAME').asString );

  if RenameFile( CurrFileName,  ExtractFilePath(CurrFileName) + NewName) then
  begin
    Elem_HtlDocQry.DB.Edit;
    Elem_HtlDocQry.DB.FieldByName('FILENAME').asString:= ExtractFileName(NewName);
    Elem_HtlDocQry.DB.Post;
  end;
end;

procedure TFrmHotelInfoEdit.DocCopyToBtnClick(Sender: TObject);
var FName: String;
    CurrDocFileName:String;
begin
  with SaveDialog do
  begin
    FileName := Elem_HtlDocQry.DB.FieldByName('FILENAME').asString;
    Filter := OpenDialog.Filter;
    if Execute then
    begin
      FName := GetUNCFileName(FileName);
      if PosSubString(GetUNCFileName(OptionSet.StoreFolder), FName) = 1
        then ErrorFmtDlg(SHtlDocFrmErrorFolderDis, [ExtractFileDir(FileName)])
      else
      begin
        CurrDocFileName:=GetHotelDocFileName( Elem_BrHotelQry.DB.FieldByName('COUNTRY_ENG').AsString,
                        Elem_HtlDocQry.DB.FieldByName('HOTELID').asString,
                        Elem_HtlDocQry.DB.FieldByName('FILENAME').asString );
        MyCopyFile( CurrDocFileName, FileName);
      end;
    end;
    FRefreshControls;
  end;
end;

procedure TFrmHotelInfoEdit.DocRenameBtnClick(Sender: TObject);
var OldDir, FName: String;
    CurrDocFileName:String;
begin
  with SaveDialog do
  begin
    Filter := OpenDialog.Filter;
    OldDir := InitialDir;
    CurrDocFileName := GetHotelDocFolder( Elem_BrHotelQry.DB.FieldByName('COUNTRY_ENG').asString, Elem_HtlDocQry.DB.FieldByName('HOTELID').asString );
    InitialDir := CurrDocFileName;

    Options := Options + [ofNoChangeDir];
    if Execute then
    begin
      FName := UkraineToEnglish(FileName);
      if PosSubString( GetUNCFileName(CurrDocFileName), GetUNCFileName(FName) ) <> 1 then
        ErrorDlg(SHtlDocFrmErrorFolderChange)
      else
        if FileExists(FileName) then ErrorFmtDlg( SVDlgsFileExistsFatal, [FName] )
      else
        FDoDocRename(FName);
    end;
    Options := Options - [ofNoChangeDir];
    InitialDir := OldDir;
    FRefreshControls;
  end;
end;

procedure TFrmHotelInfoEdit.ImportBtnClick(Sender: TObject);
begin
  WebBrowse( Format('http://www/c/e/?HID=%d&ManId=%d', [ Integer( Elem_BrHotelQry.GetValueId ) , DMServ.CurManager ]) );
end;

procedure TFrmHotelInfoEdit.ButCountryOficialLngClick(Sender: TObject);
begin
  ShowTranslateLng( Elem_BrHotelQry, EdNameHotel.Text, 'NAME', 'uk', Elem_BrHotelQry.View.Styles );
  FRefreshControls;
end;

procedure TFrmHotelInfoEdit.ViewHotelDocDblClick(Sender: TObject);
begin
  if butEditDoc.Enabled then butEditDoc.Click;
end;

procedure TFrmHotelInfoEdit.ViewHotelDocFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  FRefreshControls;
end;

procedure TFrmHotelInfoEdit.ViewBuildsFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  FRefreshControls;
end;

procedure TFrmHotelInfoEdit.butRefreshImportClick(Sender: TObject);
begin
  Elem_ImportLog.Requery;
end;

procedure TFrmHotelInfoEdit.CmbHtlClassComboBox1PropertiesChange(
  Sender: TObject);
begin
  FRefreshControls;
end;

end.
