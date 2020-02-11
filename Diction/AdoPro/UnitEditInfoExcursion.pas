unit UnitEditInfoExcursion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  cxPCdxBarPopupMenu, cxContainer, cxEdit, cxSpinEdit, StdCtrls,
  cxRadioGroup, cxGroupBox, cxCheckBox, cxMaskEdit, cxDropDownEdit,OrderUn,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, Buttons, cxTextEdit,OptSet,cxGridDBTableView,
  cxPC, ExtCtrls, cefvcl, cxImageComboBox, cxTimeEdit,UnitLngTranslateEdit,ServMod,UnitProc,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,ServModDic,
  cxGridTableView, cxGrid, ServModIB, UnitFrameSearchCity, ADODB, Core, UnitHookControlChangeValue,
  UnitFrameDescriptionWebHTML;

const MessErrorInputData = 'Вкажість %s екскурсії';
      MessErrorInputDataGroupMin = 'Мінімальна кількість туристів для групи повинна бути не менше 1';
      MessErrorInputDataGroupMaxLessThenMin = 'Максимальна кількість туристів для групи повинна бути більшою або такою ж як мінімальна';
type
  TFrm_UnitEditInfoExcursion = class(TForm)
    CtrlPanel: TPanel;
    CancelBtn: TBitBtn;
    PageControl: TcxPageControl;
    TabInfo: TcxTabSheet;
    TabDescript: TcxTabSheet;
    LbName: TLabel;
    EdNameExcursion: TcxTextEdit;
    ButCountryOficialLng: TSpeedButton;
    LbTypePlace: TLabel;
    CmbTypPlaceExcursion: TcxExtLookupComboBox;
    ChNeedGuide: TcxCheckBox;
    ChRequired: TcxCheckBox;
    cxGroupBox1: TcxGroupBox;
    RbCheckIndividual: TcxRadioButton;
    RbCheckGoup: TcxRadioButton;
    LbGroupMin: TLabel;
    EdGroupMin: TcxSpinEdit;
    LbGroupMax: TLabel;
    EdGroupMax: TcxSpinEdit;
    GrBoxTime: TcxGroupBox;
    Label7: TLabel;
    TimeStart: TcxTimeEdit;
    LbDuration: TLabel;
    TimeDuration: TcxTimeEdit;
    EdDurationDays: TcxSpinEdit;
    Label8: TLabel;
    Label9: TLabel;
    TimeExcursFinish: TcxTimeEdit;
    GroupBxTypeTrip: TcxGroupBox;
    CmbTypTripExcursion: TcxExtLookupComboBox;
    LabelKindTransport: TLabel;
    CmbKindTransport: TcxExtLookupComboBox;
    LnContent: TLabel;
    CmbTypContentExcursion: TcxExtLookupComboBox;
    PanelLeft: TPanel;
    Panel19: TPanel;
    butAddExcursLayout: TSpeedButton;
    butEditExcursLayout: TSpeedButton;
    butDelExcursLayout: TSpeedButton;
    butMoveUpExcursLayout: TSpeedButton;
    butMoveDownExcursLayout: TSpeedButton;
    butRefreshExcursLayout: TSpeedButton;
    Bevel4: TBevel;
    GridMDCountryDescriptInvisible: TcxGrid;
    GridMDCountryDescriptInvisibleDBTableView1: TcxGridDBTableView;
    GridMDCountryDescriptInvisibleLevel1: TcxGridLevel;
    SplitterExcursDesript: TSplitter;
    Bevel3: TBevel;
    GridLayoutExcursionDBTableView1: TcxGridDBTableView;
    GridLayoutExcursionLevel1: TcxGridLevel;
    GridLayoutExcursion: TcxGrid;
    Label2: TLabel;
    Bevel1: TBevel;
    butDicPlaceExcursion: TSpeedButton;
    butDicContentExcursion: TSpeedButton;
    butDicTripExcursion: TSpeedButton;
    ButShowLog: TSpeedButton;
    cxGroupBox2: TcxGroupBox;
    Panel1: TPanel;
    ParentObjDBGrid: TcxGrid;
    ParentObjDBGridDBTableView1: TcxGridDBTableView;
    ParentObjDBGridLevel1: TcxGridLevel;
    butAddSeObject: TSpeedButton;
    butDelSeObject: TSpeedButton;
    FrameSearchCityObj: TFrameSearchCity;
    EXCURS_CITY_LINKS: TADOQuery;
    EXCURS_CITY_LINKSSrc: TDataSource;
    EXCURS_CITY_LINKSID: TIntegerField;
    EXCURS_CITY_LINKSID_EXCURSION: TIntegerField;
    EXCURS_CITY_LINKSID_CITY_ADM_UNIT: TIntegerField;
    EXCURS_CITY_LINKSNAME: TStringField;
    cxGridViewRepository1: TcxGridViewRepository;
    ViewObjCityExcurs: TcxGridDBTableView;
    ViewObjCityExcursID: TcxGridDBColumn;
    ViewObjCityExcursID_CITY_ADM_UNIT: TcxGridDBColumn;
    ViewObjCityExcursID_OBJ_CITY_ADM_UNIT: TcxGridDBColumn;
    ViewObjCityExcursNAME: TcxGridDBColumn;
    FrameSearchCityExcurs: TFrameSearchCity;
    LabelCitiName: TLabel;
    BtnSaveData: TBitBtn;
    FrameDescriptionWebHTMLExcurs: TFrameDescriptionWebHTML;
    procedure ButCountryOficialLngClick(Sender: TObject);
    procedure TabDescriptShow(Sender: TObject);
    procedure TimeStartPropertiesChange(Sender: TObject);
    procedure TimeDurationPropertiesChange(Sender: TObject);
    procedure RbCheckIndividualClick(Sender: TObject);
    procedure CmbTypTripExcursionPropertiesChange(Sender: TObject);
    procedure TimeStartPropertiesEditValueChanged(Sender: TObject);
    procedure butRefreshExcursLayoutClick(Sender: TObject);
    procedure butAddExcursLayoutClick(Sender: TObject);
    procedure butEditExcursLayoutClick(Sender: TObject);
    procedure butDelExcursLayoutClick(Sender: TObject);
    procedure butMoveUpExcursLayoutClick(Sender: TObject);
    procedure butMoveDownExcursLayoutClick(Sender: TObject);
    procedure DMServIBViewExcursLayoutDesriptFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure butDicPlaceExcursionClick(Sender: TObject);
    procedure butDicContentExcursionClick(Sender: TObject);
    procedure butDicTripExcursionClick(Sender: TObject);
    procedure ButShowLogClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure butAddSeObjectClick(Sender: TObject);
    procedure butDelSeObjectClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BtnSaveDataClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);

  private
    FNew:Boolean;
    FPathToHtml:string;
    FPathToImage:string;
    FCanUpdate :boolean;
    FLngIdent : TLngIdentArr;
    Elem_EXCURS_CITY_LINKS :TDBShemaView;
    FHookControlChangeValue : THookControlChangeValue;

    procedure FGotoCityAndNewExcursion( idCity,idExcurs:Variant );
    function  FSaveData : boolean;
    procedure FReadData ;

    procedure FDestroy;
    procedure FPrepare;
    procedure InitElements( MainElem:TDBShema );
    procedure FRefreshControls;
    procedure FActionRefreshControls( Sender: TObject );
    function  FCheckError:Boolean;
    procedure FCloseElem;

    procedure FAddObjLink( IdObjCityUnitAdmin:Variant );
    procedure FRefreshLngDescriptForExcursion;
    procedure FPrepareCmbSelectLng( CmbLng:TcxImageComboBox; aLngIdent : TLngIdentArr );
    function FCheckFindFileTranslateForLngId( LngId:variant;FileName:String;MessageError:Boolean=true ):Boolean;
    function FGetFolderSelectedLNG:String;
    function FGetRootCurrentPathToExcursionDescriptHTML:String;
    function FCheckSelectedLNGForDescriptExcursion(ShowMessage:Boolean):Boolean;
    function FGetCurrentPathFileToExcursionDescriptHTML:Widestring;
    function FGetCurrentPathToExcursionDescriptIMAGES:Widestring;

    procedure DMServIBViewExcursLayoutDesriptCellDblClick(
              Sender: TcxCustomGridTableView;
              ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
              AShift: TShiftState; var AHandled: Boolean);

   procedure LayoutExcursionFocusedRecordChanged(
             Sender: TcxCustomGridTableView; APrevFocusedRecord,
             AFocusedRecord: TcxCustomGridRecord;
             ANewItemRecordFocusingChanged: Boolean);

    procedure FRefreshControlsExcursDesript;
    { Private declarations }
  public
    { Public declarations }
  end;

function ShowEditInfoExcursion( New:Boolean; PathToHtml, PathToImage:String; CanUpdate:Boolean ):Boolean;

var
  Frm_UnitEditInfoExcursion: TFrm_UnitEditInfoExcursion;

implementation

uses TestMain;

{$R *.dfm}

function ShowEditInfoExcursion( New:Boolean; PathToHtml, PathToImage:String; CanUpdate:Boolean ):Boolean;
begin
  try
    try
      Screen.Cursor := crHourGlass;
      
      Application.CreateForm( TFrm_UnitEditInfoExcursion, Frm_UnitEditInfoExcursion );
      Frm_UnitEditInfoExcursion.FNew := New;
      Frm_UnitEditInfoExcursion.FCanUpdate := CanUpdate;
      Frm_UnitEditInfoExcursion.FPathToHtml := PathToHtml;
      Frm_UnitEditInfoExcursion.FPathToImage:= PathToImage;

      Frm_UnitEditInfoExcursion.FPrepare;
    finally
      Screen.Cursor := crDefault;
    end;
    
    Frm_UnitEditInfoExcursion.ShowModal;
    {begin
      Frm_UnitEditInfoExcursion.FSaveData( New );
      result := True;
    end
    else result := False; }


  finally
    Frm_UnitEditInfoExcursion.Free;
  end;
end;

procedure TFrm_UnitEditInfoExcursion.FGotoCityAndNewExcursion( idCity,idExcurs:Variant );
begin
  {try
    Elem_ExcursCityQry.GetActiveCloneElem.View.BeginUpdate;
    Elem_ExcursCityQry.Requery;
    if Elem_ExcursCityQry.GetActiveCloneElem.DB.Locate( Elem_ExcursCityQry.FieldKod, idCity, [] ) then
    begin
      try
        Elem_EXCURSIONQry.GetActiveCloneElem.View.BeginUpdate;
        Elem_EXCURSIONQry.GetActiveCloneElem.Requery;
        Elem_EXCURSIONQry.GetActiveCloneElem.DBLocateSimple( Elem_EXCURSIONQry.FieldKod, idHotel );
      finally
        Elem_EXCURSIONQry.GetActiveCloneElem.View.EndUpdate;
      end;
    end;
  finally
    Elem_ExcursCityQry.GetActiveCloneElem.View.EndUpdate;
  end; }
end;

function TFrm_UnitEditInfoExcursion.FSaveData : boolean;
begin
  result := False;
  if not FCheckError then Exit;

  if self.FNew then Elem_EXCURSIONQry.DB.Insert
  else Elem_EXCURSIONQry.DB.Edit;

  Elem_EXCURSIONQry.DB.FieldByName('NAME').AsString := EdNameExcursion.Text;
  Elem_EXCURSIONQry.DB.FieldByName('TYPEPLACE').Value := CmbTypPlaceExcursion.EditValue;
  Elem_EXCURSIONQry.DB.FieldByName('TYPECONTENT').Value := CmbTypContentExcursion.EditValue;
  Elem_EXCURSIONQry.DB.FieldByName('TYPETRIP').Value := CmbTypTripExcursion.EditValue;

  Elem_EXCURSIONQry.DB.FieldByName('BEG').Value := TimeStart.EditValue;
  Elem_EXCURSIONQry.DB.FieldByName('STANDDAYS').Value := EdDurationDays.EditValue;
  Elem_EXCURSIONQry.DB.FieldByName('STAND').Value := TimeDuration.EditValue;
  if CmbKindTransport.Enabled then
    Elem_EXCURSIONQry.DB.FieldByName('DRVKIND').Value := CmbKindTransport.EditValue
  else Elem_EXCURSIONQry.DB.FieldByName('DRVKIND').Value := null;

  if RbCheckIndividual.Checked then
  begin
    Elem_EXCURSIONQry.DB.FieldByName('IND_GRP').Value := 0;
    Elem_EXCURSIONQry.DB.FieldByName('PMIN').Value := -1;
    Elem_EXCURSIONQry.DB.FieldByName('PMAX').Value := -1;
  end
  else
  begin
    Elem_EXCURSIONQry.DB.FieldByName('IND_GRP').Value := 1;
    Elem_EXCURSIONQry.DB.FieldByName('PMIN').Value := EdGroupMin.EditValue;
    Elem_EXCURSIONQry.DB.FieldByName('PMAX').Value := EdGroupMax.EditValue;
  end;

  Elem_EXCURSIONQry.DB.FieldByName('NEEDGUIDE').Value := MyIfThen( ChNeedGuide.Checked, 1, 0 );
  Elem_EXCURSIONQry.DB.FieldByName('ISREQUIRED').Value := MyIfThen( ChRequired.Checked, 1, 0 );
  Elem_EXCURSIONQry.DB.fieldByName('ID_CITY_ADM_UNIT').value := FrameSearchCityExcurs.EditValue;

  Elem_EXCURSIONQry.SaveMarkID;
  Elem_EXCURSIONQry.DB.Post;

  Elem_ExcursCityQry.Requery;
  if Elem_ExcursCityQry.DB.Locate(Elem_ExcursCityQry.FieldKod,FrameSearchCityExcurs.EditValue,[]) then
    Elem_EXCURSIONQry.GotoMarkID;

  result := True;

  //FGotoCityAndNewExcursion( idCity,idExcurs:Variant )
  FNew := False;
  FHookControlChangeValue.IsChange := False;
  Elem_EXCURS_CITY_LINKS.ShowEmptyDataOnView(False);

  FRefreshControls;
end;

procedure TFrm_UnitEditInfoExcursion.FDestroy;
begin
  FCloseElem;
  Elem_EXCURS_LAYOUT_DESCRIPTQry.AddFocusedRecordChanged( nil );
  Elem_EXCURS_LAYOUT_DESCRIPTQry.AddCellDblClick( nil );
  TcxGridDBTableView(GridLayoutExcursion.Levels[0].GridView).OnFocusedRecordChanged := nil;
  FHookControlChangeValue.Close;
end;

procedure TFrm_UnitEditInfoExcursion.FPrepare;
var PropExcursInf:TPropertyDescriptWeb;
begin
  InitElements( Elem_EXCURSIONQry );
  PageControl.ActivePage := TabInfo;

  PropExcursInf := PepareFrameDesription( Elem_EXCURS_LAYOUT_DESCRIPTQry, FGetCurrentPathFileToExcursionDescriptHTML,FGetCurrentPathToExcursionDescriptIMAGES, Elem_BrCountryQry.View.Styles );
  FrameDescriptionWebHTMLExcurs.Prepare( PropExcursInf );

  Elem_EXCURSION_PLACEQry.DBOpen;
  Elem_EXCURS_TYPE_CONTENTQry.DBOpen;
  Elem_EXCURS_TYPE_TRIPQry.DBOpen;
  Elem_DRVKINDQry.DBOpen;
  Elem_EXCURS_LAYOUT_DESCRIPTQry.DBOpen;
  Elem_EXCURS_LAYOUT_DESCRIPTQry.UpdateForm := True;
  Elem_EXCURS_LAYOUT_DESCRIPTQry.AddFocusedRecordChanged( DMServIBViewExcursLayoutDesriptFocusedRecordChanged );
  Elem_EXCURS_LAYOUT_DESCRIPTQry.AddCellDblClick( DMServIBViewExcursLayoutDesriptCellDblClick );

  TcxGridDBTableView(GridLayoutExcursion.Levels[0].GridView).OnFocusedRecordChanged := LayoutExcursionFocusedRecordChanged;

  FrameSearchCityExcurs.Prepare( Elem_BrCountryQry, False, FCanUpdate, FrameSearchCityExcurs.Width * 2,nil,
                                  nil, Elem_BrCountryQry.View.Styles );
  FrameSearchCityExcurs.SetOnChangeControl ( FActionRefreshControls );

  SetPropInCxExtLookupComboBox( CmbTypPlaceExcursion, TcxGridDBTableView( Elem_EXCURSION_PLACEQry.ViewList) ,'NAME',Elem_EXCURSION_PLACEQry.FieldKod,True,false );
  SetPropInCxExtLookupComboBox( CmbTypContentExcursion, TcxGridDBTableView( Elem_EXCURS_TYPE_CONTENTQry.ViewList) ,'NAME',Elem_EXCURS_TYPE_CONTENTQry.FieldKod,True,false );
  SetPropInCxExtLookupComboBox( CmbTypTripExcursion, TcxGridDBTableView( Elem_EXCURS_TYPE_TRIPQry.ViewList) ,'NAME',Elem_EXCURS_TYPE_TRIPQry.FieldKod,True,false );
  SetPropInCxExtLookupComboBox( CmbKindTransport, TcxGridDBTableView( Elem_DRVKINDQry.ViewList) ,'KIND',Elem_DRVKINDQry.FieldKod,True,false );

  FrameSearchCityObj.Prepare( Elem_BrCountryQry, True, self.FCanUpdate, FrameSearchCityObj.Width * 2,nil, nil, Elem_BrCountryQry.View.Styles );
  FrameSearchCityObj.SetOnChangeControl ( FActionRefreshControls );

  FReadData;

  FHookControlChangeValue := THookControlChangeValue.Create( self, FActionRefreshControls );
  FHookControlChangeValue.AddControl( FrameSearchCityExcurs );
  //FHookControlChangeValue.AddControl( FrameSearchCityObj );
end;

procedure TFrm_UnitEditInfoExcursion.InitElements( MainElem:TDBShema );
begin
  EXCURS_CITY_LINKS.DataSource := MainElem.DS;
  Elem_EXCURS_CITY_LINKS :=  TDBShemaView.Create( EXCURS_CITY_LINKS, ViewObjCityExcurs, 'EXCURS_CITY_LINKS', 'ID', 'gen_excurs_city_links_id' );
  Elem_EXCURS_CITY_LINKS.AddMainElem( MainElem, 'ID_EXCURSION' );
  ViewObjCityExcurs.Styles := TDBShemaView(MainElem).View.Styles;

  Elem_EXCURS_CITY_LINKS.DBOpen;
end;

procedure TFrm_UnitEditInfoExcursion.FCloseElem;
begin
  Elem_EXCURS_CITY_LINKS.Close;
end;

procedure TFrm_UnitEditInfoExcursion.FReadData;
begin
  if not FNew then
  begin
    EdNameExcursion.Text := Elem_EXCURSIONQry.DB.FieldByName('NAME').AsString;
    CmbTypPlaceExcursion.EditValue := Elem_EXCURSIONQry.DB.FieldByName('TYPEPLACE').Value ;
    CmbTypContentExcursion.EditValue := Elem_EXCURSIONQry.DB.FieldByName('TYPECONTENT').Value;
    CmbTypTripExcursion.EditValue := Elem_EXCURSIONQry.DB.FieldByName('TYPETRIP').Value;

    TimeStart.EditValue := Elem_EXCURSIONQry.DB.FieldByName('BEG').Value;
    EdDurationDays.EditValue := Elem_EXCURSIONQry.DB.FieldByName('STANDDAYS').Value;
    TimeDuration.EditValue := Elem_EXCURSIONQry.DB.FieldByName('STAND').Value;
    CmbKindTransport.EditValue := Elem_EXCURSIONQry.DB.FieldByName('DRVKIND').Value;

    if Elem_EXCURSIONQry.DB.FieldByName('IND_GRP').asInteger = 0 then
      RbCheckIndividual.Checked:= True
    else
    begin
      RbCheckGoup.Checked:= True;
      EdGroupMin.EditValue := Elem_EXCURSIONQry.DB.FieldByName('PMIN').Value;
      EdGroupMax.EditValue := Elem_EXCURSIONQry.DB.FieldByName('PMAX').Value;
    end;

    if Elem_EXCURSIONQry.DB.FieldByName('NEEDGUIDE').AsInteger = 1 then
      ChNeedGuide.Checked := True
    else ChNeedGuide.Checked := False;

    if Elem_EXCURSIONQry.DB.FieldByName('ISREQUIRED').AsInteger = 1 then
      ChRequired.Checked := True
    else ChRequired.Checked := False;

    FrameSearchCityExcurs.SetValue( Elem_EXCURSIONQry.DB.fieldByName('ID_CITY_ADM_UNIT').value );

  end
  else
  begin

    CmbTypPlaceExcursion.EditValue := 0;
    CmbTypContentExcursion.EditValue := 0;
    Elem_EXCURS_CITY_LINKS.ShowEmptyDataOnView( True );

  end;
  
  FRefreshControls;
end;

procedure TFrm_UnitEditInfoExcursion.FRefreshControls;
begin
  FrameSearchCityExcurs.SetEnabled( FNew );
  FrameSearchCityObj.SetEnabled( not FNew );
  
  TimeExcursFinish.EditValue :=TimeStart.EditingValue + TimeDuration.EditingValue ;
  EdGroupMin.Enabled := RbCheckGoup.Checked;
  EdGroupMax.Enabled := RbCheckGoup.Checked;
  CmbKindTransport.Enabled := CmbTypTripExcursion.EditValue <> 1;
  butAddSeObject.Enabled := FrameSearchCityObj.EditName <> '';
  butDelSeObject.Enabled := TcxGridDBTableView(ParentObjDBGrid.Levels[0].GridView).ViewData.RowCount <> 0;

  if Self.FHookControlChangeValue <> nil then
    BtnSaveData.Enabled := Self.FHookControlChangeValue.IsChange 
  else BtnSaveData.Enabled := False;
end;

procedure TFrm_UnitEditInfoExcursion.FActionRefreshControls( Sender: TObject );
begin
  FRefreshControls;
end;

procedure TFrm_UnitEditInfoExcursion.ButCountryOficialLngClick(
  Sender: TObject);
begin
  if CheckOnOriginalText( EdNameExcursion.Text ) then
    ShowTranslateLng( Elem_EXCURSIONQry, EdNameExcursion.Text,  'NAME', 'uk', Elem_EXCURSIONQry.View.Styles );
end;

function TFrm_UnitEditInfoExcursion.FCheckSelectedLNGForDescriptExcursion(ShowMessage:Boolean):Boolean;
begin

end;

function TFrm_UnitEditInfoExcursion.FGetFolderSelectedLNG:String;
begin

end;

function TFrm_UnitEditInfoExcursion.FGetRootCurrentPathToExcursionDescriptHTML:String;
begin
  result := self.FPathToHtml + 'DESCRIPTION\' + AddNolForLengthNumber( Elem_EXCURS_LAYOUT_DESCRIPTQry.GetValueIdStr, 4 ) + '\';
end;

function TFrm_UnitEditInfoExcursion.FGetCurrentPathFileToExcursionDescriptHTML:Widestring;
begin
  result := self.FPathToHtml +'DESCRIPTION\'+AddNolForLengthNumber( Elem_EXCURSIONQry.GetValueIdStr, 4 ) + '\';
end;

function TFrm_UnitEditInfoExcursion.FGetCurrentPathToExcursionDescriptIMAGES:Widestring;
begin
  result := self.FPathToImage +'DESCRIPTION\'+ AddNolForLengthNumber( Elem_EXCURSIONQry.GetValueIdStr, 4 ) + '\';
end;

function TFrm_UnitEditInfoExcursion.FCheckFindFileTranslateForLngId( LngId:variant;FileName:String;MessageError:Boolean=true ):Boolean;
var CurSelLngObj:TLngIdent;
begin
  if LngId <> null then
  begin
    CurSelLngObj := GetObjLngById( self.FLngIdent, LngId );
    if not FileExists( FileName ) then
    begin
      if MessageError then MyShowMessageDlg( MessFileTranslateForLngNotFound+' "'+CurSelLngObj.lngName+'"', mtError,but_OK);
      result := False;
      exit;
    end
    else result := True;
  end;
end;

procedure TFrm_UnitEditInfoExcursion.TabDescriptShow(Sender: TObject);
begin
  self.FLngIdent := GetListIdLng( Elem_EXCURSIONQry.DBGetParamConnect );
  FRefreshControlsExcursDesript;
end;

procedure TFrm_UnitEditInfoExcursion.TimeStartPropertiesChange(
  Sender: TObject);
begin
  FRefreshControls;
end;

procedure TFrm_UnitEditInfoExcursion.TimeDurationPropertiesChange(
  Sender: TObject);
begin
  FRefreshControls;
end;

function TFrm_UnitEditInfoExcursion.FCheckError:Boolean;
var MessError:string;
begin
  MessError := '';
  
  if FrameSearchCityExcurs.EditValue = null then
    MessError := Format( MessErrorInputData, [AnsiLowerCase( LabelCitiName.Caption) ] )
  else
  if EdNameExcursion.Text = '' then
    MessError := Format( MessErrorInputData, [AnsiLowerCase( LbName.Caption) ] )
  else
  if CmbTypPlaceExcursion.EditValue = null then
    MessError := Format( MessErrorInputData, [AnsiLowerCase( LbTypePlace.Caption) ] )
  else
  if CmbTypContentExcursion.EditValue = null then
    MessError := Format( MessErrorInputData, ['зміст'] )
  else
  if CmbTypTripExcursion.EditValue = null then
    MessError := Format( MessErrorInputData, [AnsiLowerCase( GroupBxTypeTrip.Caption) ] )
  else
  if ( CmbKindTransport.Enabled )and( CmbKindTransport.EditValue = null ) then
    MessError := Format( MessErrorInputData, [AnsiLowerCase( LabelKindTransport.Caption ) ] )
  else
  if TimeStart.EditValue = null then
    MessError := Format( MessErrorInputData, [AnsiLowerCase( GrBoxTime.Caption +' початку') ] )
  else
  if TimeDuration.EditValue = null then
    MessError := Format( MessErrorInputData, [AnsiLowerCase( LbDuration.Caption) ] )
  else
  if RbCheckGoup.Checked then
  begin
    if EdGroupMin.EditValue = null then
      MessError := Format( MessErrorInputData, [LowerCase( LbGroupMin.Caption) ] )
    else
    if EdGroupMax.EditValue = null then
      MessError := Format( MessErrorInputData, [LowerCase( LbGroupMax.Caption) ] )
    else
    if EdGroupMin.EditValue<1 then
      MessError := MessErrorInputDataGroupMin
    else
    if EdGroupMax.EditValue < EdGroupMin.EditValue then
      MessError :=MessErrorInputDataGroupMaxLessThenMin;
  end;

  if MessError<>'' then
  begin
    MyShowMessageDlg(MessError,mtError,but_OK);
    result := False;
  end
  else result := True;
end;

procedure TFrm_UnitEditInfoExcursion.FPrepareCmbSelectLng( CmbLng:TcxImageComboBox; aLngIdent : TLngIdentArr );
begin
  PrepareCmbSelectLng( CmbLng, aLngIdent, nLocalLang );
end;

procedure TFrm_UnitEditInfoExcursion.RbCheckIndividualClick(
  Sender: TObject);
begin
  FRefreshControls;
end;

procedure TFrm_UnitEditInfoExcursion.CmbTypTripExcursionPropertiesChange(
  Sender: TObject);
begin
  FRefreshControls;
end;

procedure TFrm_UnitEditInfoExcursion.TimeStartPropertiesEditValueChanged(
  Sender: TObject);
begin
  FRefreshControls;
end;

procedure TFrm_UnitEditInfoExcursion.butRefreshExcursLayoutClick(
  Sender: TObject);
begin
  Elem_EXCURS_LAYOUT_DESCRIPTQry.Requery;
  FRefreshControlsExcursDesript;
end;

procedure TFrm_UnitEditInfoExcursion.butAddExcursLayoutClick(
  Sender: TObject);
begin
  Elem_EXCURS_LAYOUT_DESCRIPTQry.DB.Insert;
  FRefreshControlsExcursDesript;
end;

procedure TFrm_UnitEditInfoExcursion.butEditExcursLayoutClick(
  Sender: TObject);
begin
  Elem_EXCURS_LAYOUT_DESCRIPTQry.DB.Edit;
  FRefreshControlsExcursDesript;
end;

procedure TFrm_UnitEditInfoExcursion.butDelExcursLayoutClick(
  Sender: TObject);
var PathShowDescript:string;
begin
  PathShowDescript := FGetRootCurrentPathToExcursionDescriptHTML;
  Elem_EXCURS_LAYOUT_DESCRIPTQry.DB.Delete;
  if DirectoryExists( PathShowDescript ) then
    DelDir( PathShowDescript,'*.*' );
    
  FRefreshControlsExcursDesript;
end;

procedure TFrm_UnitEditInfoExcursion.butMoveUpExcursLayoutClick(
  Sender: TObject);
begin
  Elem_EXCURS_LAYOUT_DESCRIPTQry.MoveUpRow;
  FRefreshControlsExcursDesript;
end;

procedure TFrm_UnitEditInfoExcursion.butMoveDownExcursLayoutClick(
  Sender: TObject);
begin
  Elem_EXCURS_LAYOUT_DESCRIPTQry.MoveDownRow;
  FRefreshControlsExcursDesript;
end;

procedure TFrm_UnitEditInfoExcursion.FRefreshControlsExcursDesript;
begin
  butEditExcursLayout.Enabled :=Elem_EXCURS_LAYOUT_DESCRIPTQry.View.ViewData.RowCount <> 0;
  butDelExcursLayout.Enabled :=Elem_EXCURS_LAYOUT_DESCRIPTQry.View.ViewData.RowCount <> 0;
  butMoveUpExcursLayout.Enabled := Elem_EXCURS_LAYOUT_DESCRIPTQry.CheckMoveUpRow;
  butMoveDownExcursLayout.Enabled := Elem_EXCURS_LAYOUT_DESCRIPTQry.CheckMoveDownRow;
end;

procedure TFrm_UnitEditInfoExcursion.FRefreshLngDescriptForExcursion;
begin

end;

procedure TFrm_UnitEditInfoExcursion.DMServIBViewExcursLayoutDesriptFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  FRefreshControlsExcursDesript;
end;

procedure TFrm_UnitEditInfoExcursion.butDicPlaceExcursionClick(
  Sender: TObject);
begin
  ShowDicExcursionPlace( FormMenuTop.ButExcursionPlace.Caption );
end;

procedure TFrm_UnitEditInfoExcursion.butDicContentExcursionClick(
  Sender: TObject);
begin
  ShowDicExcursionByContent( FormMenuTop.ButDicExcursionByContext.Caption );
end;

procedure TFrm_UnitEditInfoExcursion.butDicTripExcursionClick(
  Sender: TObject);
begin
  ShowDicExcursionByTypeTrip( FormMenuTop.ButDicExcursionByTrip.Caption );
end;

procedure TFrm_UnitEditInfoExcursion.DMServIBViewExcursLayoutDesriptCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  butEditExcursLayout.Click;
end;

procedure TFrm_UnitEditInfoExcursion.ButShowLogClick(Sender: TObject);
begin
  ShowLog( self, Elem_EXCURS_CITY_LINKS.DBGetParamConnect, Elem_EXCURS_CITY_LINKS.GetCurrManagerId,  -1, [] );
end;

procedure TFrm_UnitEditInfoExcursion.FormDestroy(Sender: TObject);
begin
  FDestroy;
end;

procedure TFrm_UnitEditInfoExcursion.FAddObjLink( IdObjCityUnitAdmin:Variant );
begin
  if IdObjCityUnitAdmin <> null then
  begin

    if not Elem_EXCURS_CITY_LINKS.DB.Locate('ID_CITY_ADM_UNIT', IdObjCityUnitAdmin,[] ) then       //CmbxSearchCountry.EditValue
    begin
      Elem_EXCURS_CITY_LINKS.DBInsert;
      Elem_EXCURS_CITY_LINKS.DB.FieldByName('ID_CITY_ADM_UNIT').Value := IdObjCityUnitAdmin;       //CmbxSearchCountry.EditValue;
      Elem_EXCURS_CITY_LINKS.DBPost;
      Elem_EXCURS_CITY_LINKS.RequeryCurrentRecord;
    end;

  end
  else MyShowMessageDlg( 'Виберіть Об''єкт', mtError, but_OK );
end;

procedure TFrm_UnitEditInfoExcursion.butAddSeObjectClick(Sender: TObject);
begin
  FAddObjLink( FrameSearchCityObj.EditValue );
  FRefreshControls;
end;

procedure TFrm_UnitEditInfoExcursion.butDelSeObjectClick(Sender: TObject);
begin
  Elem_EXCURS_CITY_LINKS.DBDelete(True);
  FRefreshControls;
end;

procedure TFrm_UnitEditInfoExcursion.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if BtnSaveData.Enabled then
    if MyShowMessageDlg( AskChangeDataSave, mtConfirmation, but_YES_NO ) = Res_YES then
      CanClose := self.FSaveData;
end;

procedure TFrm_UnitEditInfoExcursion.BtnSaveDataClick(Sender: TObject);
begin
  FSaveData;
end;

procedure TFrm_UnitEditInfoExcursion.CancelBtnClick(Sender: TObject);
begin
  if Elem_EXCURSIONQry.DB.State in [dsInsert,dsEdit] then
    Elem_EXCURSIONQry.DB.Cancel;
end;

procedure TFrm_UnitEditInfoExcursion.LayoutExcursionFocusedRecordChanged(
         Sender: TcxCustomGridTableView; APrevFocusedRecord,
         AFocusedRecord: TcxCustomGridRecord;
         ANewItemRecordFocusingChanged: Boolean);
begin
  FrameDescriptionWebHTMLExcurs.RefreshShowCurrDescription;
  FRefreshControlsExcursDesript;
end;

end.


