unit UnitFrameDicCity;

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
  cxContainer, Menus, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, ExtCtrls, Buttons, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,UnitProc,Core,UnitGTranslate,
  cxGridDBTableView, cxGrid, CityNewForm, UnitDictionGrid,UnitLngTranslateEdit,UnitLngTranslate,
  cxTL, cxTLdxBarBuiltInMenu, cxInplaceContainer, cxDBTL, cxTLData, Grids,
  DBGrids, ImgList, ActnList, UnitFrameSearchCityAdmUnit, UnitFrameDic,
  UnitFrameSearchCity, Clipbrd;

CONST
   DefMessForCheckDeleteRegion ='Для видалення адмін. одиниці потрібно видалити всі вкладені рівні цієї адмін. одиниці.';
type
  TParamFrameDicCity = Record
    GoogleTranslate : TGoogleTranslate;

    ElemCounry : TDBShemaView;
    ElemCityAdminUnitRegion:TDBShemaTree;
    ElemCityAdminUnit :TDBShemaTree;
    ElemAdminUnitQry  :TDBShemaView;
    ElemAdminUnitSubQry :TDBShemaView;
    ElemAdminUnitSubRelQry :TDBShema;
    ElemCountryTemplAdmUnit : TDBShemaTree;
    ElemCityAdmUntItemsType : TDBShemaView;
    ElemCITYADMUNITINFOQry :TDBShemaView;
    ElemCityAdminUnitIMG :TDBShemaView;
    ElemResortCountry:TDBShemaView;
    ElemOBJECTLINKS : TDBShemaView;
    PathToImageCity : string;
    PathToHtmlCity  : string;

    LogProc : TShowLogProc;
  end;

  TFrameDicCity = class(TFrame)
    Panel3: TPanel;
    DBTreeCityRegionSrc: TDataSource;
    ImageList: TImageList;
    PMMainTopTree: TPopupMenu;
    butMainAddToLevelRegion: TMenuItem;
    butMainAddToSubLevelRegion: TMenuItem;
    butMainEditRegion: TMenuItem;
    butMainDelRegion: TMenuItem;
    PMAddTopTree: TPopupMenu;
    butAddToLevel: TMenuItem;
    butAddToSubLevel: TMenuItem;
    ActionList: TActionList;
    AddNodeLevelTopTree: TAction;
    AddChildNodeLevelTopTree: TAction;
    EditNodeLevelTopTree: TAction;
    DelNodeLevelTopTree: TAction;
    AddNodeLevelTopTreeDetail: TAction;
    AddChildNodeLevelTopTreeDetail: TAction;
    EditNodeLevelTopTreeDetail: TAction;
    DelNodeLevelTopTreeDetail: TAction;
    TreeListTemplateAdmUnitSrc: TDataSource;
    DBTreeListTemplateAdmUnit: TcxDBTreeList;
    PanelRegion: TPanel;
    DBTreeListRegion: TcxDBTreeList;
    PanelTopCityRegion: TPanel;
    PanelSelectRegionArea: TPanel;
    Panel5: TPanel;
    FrameSearchCity: TFrameSearchCity;
    PanelRefresh: TPanel;
    butRefresh: TSpeedButton;
    Bevel1: TBevel;
    PanelUpdate: TPanel;
    butAdd: TSpeedButton;
    butEdit: TSpeedButton;
    butDel: TSpeedButton;
    BevelMainSpliterMoveRows: TBevel;
    PanelLng: TPanel;
    ButTranslateLng: TSpeedButton;
    Bevel2: TBevel;
    PanelLog: TPanel;
    ButShowLog: TSpeedButton;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    butCopyTreeValue: TMenuItem;

    procedure AddNodeLevelTopTreeExecute(Sender: TObject);
    procedure AddChildNodeLevelTopTreeExecute(Sender: TObject);
    procedure butMainDelRegionClick(Sender: TObject);
    procedure DelNodeLevelTopTreeExecute(Sender: TObject);
    procedure DBTreeListRegionFocusedNodeChanged(Sender: TcxCustomTreeList;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure DBTreeListCityFocusedNodeChanged(Sender: TcxCustomTreeList;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure DBTreeListRegionDblClick(Sender: TObject);
    procedure butRefreshClick(Sender: TObject);
    procedure butAddClick(Sender: TObject);
    procedure butEditClick(Sender: TObject);
    procedure ButTranslateLngClick(Sender: TObject);
    procedure ButShowLogClick(Sender: TObject);
    procedure PMMainTopTreePopup(Sender: TObject);
    procedure butCopyTreeValueClick(Sender: TObject);
  private
    FCurrManager:Integer;
    FCanUpdate :Boolean;
    FSqlWhere : WideString;
    FSqlWhereGlobalSearch : WideString;
    FParamFrame:TParamFrameDicCity;
    FSaveUpdateFormCityAdminUnitRegion:Boolean;
    FOptAdd :TOptAddTreeNode;
    FValueCopyStr :Widestring;

    procedure ShowCityRegionTranslate( SqlWhere:WideString );
    procedure ShowCityTranslate( SqlWhere:WideString );

    procedure FPrepareColumnsTreeRegionViewForUpdate;
    procedure FDestroyColumnsTreeRegionViewForUpdate;
    procedure FTreeCityAdminRegionIDADMINUNITPropertiesInitPopup( Sender: TObject );
    procedure FTreeCityAdminRegionIDADMINUNITPropertiesCloseUp( Sender: TObject );

    //procedure FTreeCityAdminIDADMINUNITPropertiesInitPopup( Sender: TObject);
    function  FGetFilterID_ADMIN_UNITForCurrNodeAdd( OptAdd:TOptAddTreeNode ):TVarArrVariant;
    { Private declarations }
  public
    procedure IntitDicCityFrame( ParamFrame:TParamFrameDicCity; CanUpdate:Boolean; CurrManager:Integer );
    procedure DeactiveDicCityFrame;
    procedure SetManager(CurrManager:Integer);
    procedure ShowUpdateAdminUnitRegion( OptAdd : TOptAddTreeNode );
    procedure SetEnabledUpdate(CanUpdate:Boolean);
    procedure RefreshControls;
    { Public declarations }
  end;

procedure AfterCitySearch( aOwnerSearchFrame:TComponent; id:Variant; idMainParent : TIdMainParent );
implementation

uses
  FrmProgress;

{$R *.dfm}

procedure TFrameDicCity.DeactiveDicCityFrame;
begin
  DBTreeCityRegionSrc.DataSet := nil;
  DBTreeListRegion.Styles.StyleSheet := nil;
  self.FParamFrame.ElemCityAdminUnitRegion.SetTree( nil );


  self.FParamFrame.ElemCityAdminUnitRegion.UpdateForm := FSaveUpdateFormCityAdminUnitRegion;
  FDestroyColumnsTreeRegionViewForUpdate;

  TreeListTemplateAdmUnitSrc.DataSet := nil;
end;

procedure AfterCitySearch( aOwnerSearchFrame:TComponent; id:Variant; idMainParent : TIdMainParent );
begin
  if idMainParent.id = null then
  begin
    if TFrameDicCity(aOwnerSearchFrame.Owner).FParamFrame.ElemCityAdminUnitRegion.DBLocate('ID', id, [] ) then
      TFrameDicCity(aOwnerSearchFrame.Owner).FParamFrame.ElemCityAdminUnitRegion.Tree.SetFocus;
  end
  else
   if idMainParent.aType = 1 then
   begin
     if TFrameDicCity(aOwnerSearchFrame.Owner).FParamFrame.ElemCityAdminUnitRegion.DBLocate('ID', id, [] ) then
      TFrameDicCity(aOwnerSearchFrame.Owner).FParamFrame.ElemCityAdminUnitRegion.Tree.SetFocus;
   end
   else
   if TFrameDicCity(aOwnerSearchFrame.Owner).FParamFrame.ElemCityAdminUnitRegion.DBLocate('ID', idMainParent.id, []) then
     if TFrameDicCity(aOwnerSearchFrame.Owner).FParamFrame.ElemCityAdminUnit.DBLocate('ID', id, [] ) then
       TFrameDicCity(aOwnerSearchFrame.Owner).FParamFrame.ElemCityAdminUnit.GetActiveCloneElem.Tree.SetFocus;
end;

procedure TFrameDicCity.IntitDicCityFrame( ParamFrame:TParamFrameDicCity; CanUpdate:Boolean; CurrManager:Integer );
begin
  self.FParamFrame := ParamFrame;
  self.FCurrManager := CurrManager;

  ParamFrame.ElemCityAdminUnitRegion.PreviewVirtualOnTree( DBTreeListRegion );
  DBTreeCityRegionSrc.DataSet := ParamFrame.ElemCityAdminUnitRegion.DB;
  ParamFrame.ElemCityAdminUnitRegion.SetTree( DBTreeListRegion );
  FSaveUpdateFormCityAdminUnitRegion := self.FParamFrame.ElemCityAdminUnitRegion.UpdateForm;
  self.FParamFrame.ElemCityAdminUnitRegion.UpdateForm := True;

  //self.FParamFrame.ElemCityAdminUnitRegion.SetValidateBeforePost( CheckUpdateCityRegion );
  FPrepareColumnsTreeRegionViewForUpdate;
  FrameSearchCity.Prepare( ParamFrame.ElemCounry,True, True, FrameSearchCity.Width - FrameSearchCity.PanelControl.Width, AfterCitySearch,
                           nil, ParamFrame.ElemCounry.View.Styles );

  TreeListTemplateAdmUnitSrc.DataSet := ParamFrame.ElemCountryTemplAdmUnit.DB;
  ParamFrame.ElemCountryTemplAdmUnit.PreviewVirtualOnTree( DBTreeListTemplateAdmUnit );

  self.FCanUpdate := CanUpdate;
  SetEnabledUpdate( CanUpdate );
  RefreshControls;
end;


function TFrameDicCity.FGetFilterID_ADMIN_UNITForCurrNodeAdd( OptAdd:TOptAddTreeNode ):TVarArrVariant;
var aNode:TcxTreeListNode;
    aNodeChildren:TcxTreeListNode;
    aNodeSub:TcxTreeListNode;
    UntilLevel  : Integer;
    IndColSingleNode : integer;

procedure AddValueToArr(valFilter:variant);
var len:Integer;
begin
  len := Length( result );
  SetLength( result, len+1 );
  result[len] := valFilter;
end;
//***************************************
procedure AddNodesTemplate( aNode:TcxTreeListNode );
begin
  while aNode <> nil do
  begin
    AddValueToArr( aNode.Values[IndColSingleNode] );
    aNode := aNode.getNextSibling;
  end;
end;

begin
  SetLength( result, 0 );
  DBTreeListTemplateAdmUnit.FullExpand;

  aNode := DBTreeListTemplateAdmUnit.TopNode;
  IndColSingleNode := DBTreeListTemplateAdmUnit.GetColumnByFieldName( 'ID_ADMIN_UNIT' ).ItemIndex;
  while aNode <> nil do
  begin
    aNodeChildren := TreeFindLevelElemForNode( aNode, DBTreeListRegion.FocusedNode.Level, False );

    if ( OptAdd  in [ OptTreeNodeAddInsert , OptTreeNodeAddLast, OptTreeNodeAddNone ] ) and ( DBTreeListRegion.FocusedNode.Level > 0 ) then
    begin
      if TreeCompareNodesByFieldValue( DBTreeListRegion.FocusedNode.Parent, aNodeChildren.Parent, 'ID_ADMIN_UNIT','ID_ADMIN_UNIT' ) then
        AddNodesTemplate( aNodeChildren );
    end
    else
    if (OptAdd in [OptTreeNodeAddSub] )  then
    begin
      if ( DBTreeListRegion.FocusedNode.Level = 0 ) then aNodeChildren := aNode;

      if TreeCompareNodesByFieldValue( DBTreeListRegion.FocusedNode, aNodeChildren, 'ID_ADMIN_UNIT','ID_ADMIN_UNIT' ) then
        AddNodesTemplate( aNodeChildren.getFirstChild );
    end
    else 
    if DBTreeListRegion.FocusedNode.Level = 0 then
      AddValueToArr( aNode.Values[IndColSingleNode] );

    aNode := aNode.getNextSibling;
  end;

  if Length(result)=0 then AddValueToArr(null);
end;

procedure TFrameDicCity.FTreeCityAdminRegionIDADMINUNITPropertiesInitPopup( Sender: TObject);
var masArrValue :TVarArrVariant;
begin
  masArrValue := FGetFilterID_ADMIN_UNITForCurrNodeAdd( FOptAdd );
  self.FParamFrame.ElemAdminUnitQry.SetFilterOnViewList(['ID'],masArrValue,['='] );
end;

procedure TFrameDicCity.FTreeCityAdminRegionIDADMINUNITPropertiesCloseUp( Sender: TObject );
begin
  self.FParamFrame.ElemAdminUnitQry.ClearFilterOnViewList;
end;

{procedure TFrameDicCity.FTreeCityAdminIDADMINUNITPropertiesInitPopup( Sender: TObject);
begin
  self.FParamFrame.ElemAdminUnitQry.SetFilterOnViewList(['ID_CITY_ADM_UNT_ITEMS_TYPE'],[1],['<>'] );
end;}

procedure TFrameDicCity.FPrepareColumnsTreeRegionViewForUpdate;
begin
  if self.FParamFrame.ElemCityAdminUnitRegion.GetViewForClone <> nil then
  begin
    TcxExtLookupComboBoxProperties(self.FParamFrame.ElemCityAdminUnitRegion.GetViewForClone.GetColumnByFieldName('ID_ADMIN_UNIT').Properties).OnInitPopup :=
    FTreeCityAdminRegionIDADMINUNITPropertiesInitPopup;

    TcxExtLookupComboBoxProperties(self.FParamFrame.ElemCityAdminUnitRegion.GetViewForClone.GetColumnByFieldName('ID_ADMIN_UNIT').Properties).OnCloseUp :=
    FTreeCityAdminRegionIDADMINUNITPropertiesCloseUp;
  end;

  {if self.FParamFrame.ElemCityAdminUnit.GetViewForClone <> nil then
  begin
    TcxExtLookupComboBoxProperties(self.FParamFrame.ElemCityAdminUnit.GetViewForClone.GetColumnByFieldName('ID_ADMIN_UNIT').Properties).OnCloseUp :=
    FTreeCityAdminIDADMINUNITPropertiesInitPopup;
  end;}
end;

procedure TFrameDicCity.FDestroyColumnsTreeRegionViewForUpdate;
begin
  if self.FParamFrame.ElemCityAdminUnitRegion.GetViewForClone <> nil then
  begin
    TcxExtLookupComboBoxProperties( self.FParamFrame.ElemCityAdminUnitRegion.GetViewForClone.GetColumnByFieldName('ID_ADMIN_UNIT').Properties ).OnInitPopup := nil;
    TcxExtLookupComboBoxProperties( self.FParamFrame.ElemCityAdminUnitRegion.GetViewForClone.GetColumnByFieldName('ID_ADMIN_UNIT').Properties ).OnCloseUp := nil;
  end;

  //if self.FParamFrame.ElemCityAdminUnit.GetViewForClone <> nil then
  //  TcxExtLookupComboBoxProperties(self.FParamFrame.ElemCityAdminUnit.GetViewForClone.GetColumnByFieldName('ID_ADMIN_UNIT').Properties).OnInitPopup := nil;
end;

procedure TFrameDicCity.RefreshControls;
begin
  butAdd.Enabled :=  ( self.FParamFrame.ElemCounry.View.ViewData.RowCount <> 0) and ( self.FCurrManager > 0 );
  butEdit.Enabled := ( butAdd.Enabled ) and (  self.FParamFrame.ElemCityAdminUnitRegion.Tree.FocusedNode <> nil ) and ( self.FCurrManager > 0 );
  butDel.Enabled := butEdit.Enabled;
  ButTranslateLng.Enabled := ( butEdit.Enabled ) and ( self.FParamFrame.ElemCityAdminUnitRegion.GetMainParamTranslateTable.FieldName <> '');
  //**********
  butAddToLevel.Enabled := butAdd.Enabled;
  butAddToSubLevel.Enabled := ( butAdd.Enabled ) and (  self.FParamFrame.ElemCityAdminUnitRegion.Tree.FocusedNode <> nil ) and ( self.FCurrManager > 0 );
  //**********
  butMainAddToLevelRegion.Enabled := butAddToLevel.Enabled;
  butMainAddToSubLevelRegion.Enabled :=butAddToSubLevel.Enabled;
  butMainEditRegion.Enabled := butEdit.Enabled;
  butMainDelRegion.Enabled := butDel.Enabled;
end;

procedure TFrameDicCity.SetEnabledUpdate( CanUpdate:Boolean );
begin
  FCanUpdate := CanUpdate;
  RefreshControls;
end;

procedure TFrameDicCity.ShowCityRegionTranslate( SqlWhere:WideString );
var FieldTranslateShema:TFieldTranslateShemaArr;
begin
  AddLngFieldColumnToShema( FieldTranslateShema, self.FParamFrame.ElemCityAdminUnitRegion  , 'NAME', 'NAME' );
  ShowLngTranslate( self.FParamFrame.ElemCityAdminUnitRegion, self.FParamFrame.GoogleTranslate, FieldTranslateShema, 'оригінал', True, 1000, self.FCurrManager, SqlWhere,
                   'left join ADMIN_UNIT on CITY_ADM_UNIT.id_admin_unit = ADMIN_UNIT.id' );
end;

procedure TFrameDicCity.ShowCityTranslate( SqlWhere:WideString );
var FieldTranslateShema : TFieldTranslateShemaArr;
begin
  AddLngFieldColumnToShema( FieldTranslateShema, self.FParamFrame.ElemCityAdminUnit  , 'NAME', 'NAME' );
  ShowLngTranslate( self.FParamFrame.ElemCityAdminUnit, self.FParamFrame.GoogleTranslate, FieldTranslateShema, 'оригінал', True, 1000,self.FCurrManager, SqlWhere ,
                    'left join ADMIN_UNIT on CITY_ADM_UNIT.id_admin_unit = ADMIN_UNIT.id' );
end;

procedure TFrameDicCity.SetManager( CurrManager: Integer );
begin
  self.FCurrManager := CurrManager;
  RefreshControls;
end;

procedure TFrameDicCity.ShowUpdateAdminUnitRegion( OptAdd : TOptAddTreeNode );
begin
  self.FParamFrame.ElemCityAdmUntItemsType.DB.Locate( FParamFrame.ElemCityAdmUntItemsType.FieldKod, 1,[] );
  FOptAdd := OptAdd;

  if FOptAdd = OptTreeNodeAddInsert then self.FParamFrame.ElemCityAdminUnitRegion.InsertNode;
  if FOptAdd = OptTreeNodeAddSub then self.FParamFrame.ElemCityAdminUnitRegion.AddSubNode;
  if FOptAdd = OptTreeNodeAddNone then self.FParamFrame.ElemCityAdminUnitRegion.DB.Edit;

  self.FParamFrame.ElemCityAdminUnitRegion.RequeryCurrentRecord;
  RefreshControls;
end;

procedure TFrameDicCity.AddNodeLevelTopTreeExecute(Sender: TObject);
begin
  ShowUpdateAdminUnitRegion( OptTreeNodeAddInsert );
end;

procedure TFrameDicCity.AddChildNodeLevelTopTreeExecute(Sender: TObject);
begin
  ShowUpdateAdminUnitRegion( OptTreeNodeAddSub );
end;

procedure TFrameDicCity.butMainDelRegionClick(Sender: TObject);
begin
  if butDel.Enabled then butDel.Click;
end;

procedure TFrameDicCity.DelNodeLevelTopTreeExecute(Sender: TObject);
begin
  if  self.FParamFrame.ElemCityAdminUnitRegion.Tree.FocusedNode <> nil then
  begin
    if ( ( self.FParamFrame.ElemCityAdminUnitRegion.Tree.FocusedNode.HasChildren ) or
         ( self.FParamFrame.ElemCityAdminUnit.Tree.FocusedNode <> nil ) ) then
      MyShowMessageDlg( DefMessForCheckDeleteRegion, mtError, but_OK )
    else
    begin
      self.FParamFrame.ElemCityAdminUnitRegion.DeleteFocusedNode;
      RefreshControls;
    end;
  end;
end;

procedure TFrameDicCity.DBTreeListRegionFocusedNodeChanged(
  Sender: TcxCustomTreeList; APrevFocusedNode,
  AFocusedNode: TcxTreeListNode);
begin
  if self.FParamFrame.ElemCityAdminUnitRegion.Tree <> nil then RefreshControls;
  self.FParamFrame.ElemCityAdminUnit.TreeExpandAll;
end;

procedure TFrameDicCity.DBTreeListCityFocusedNodeChanged(
  Sender: TcxCustomTreeList; APrevFocusedNode,
  AFocusedNode: TcxTreeListNode);
begin
  if self.FParamFrame.ElemCityAdminUnit.Tree <> nil then RefreshControls;
end;

procedure TFrameDicCity.DBTreeListRegionDblClick(Sender: TObject);
begin
  if butEdit.Enabled then butEdit.Click;
end;

procedure TFrameDicCity.butRefreshClick(Sender: TObject);
begin
  self.FParamFrame.ElemCityAdminUnitRegion.Requery;
end;

procedure TFrameDicCity.butAddClick(Sender: TObject);
begin
  PMAddTopTree.Popup( TControl(Sender).ClientOrigin.X , TControl(Sender).ClientOrigin.Y + TControl(Sender).Height );
end;

procedure TFrameDicCity.butEditClick(Sender: TObject);
begin
  ShowUpdateAdminUnitRegion( OptTreeNodeAddNone );
end;

procedure TFrameDicCity.ButTranslateLngClick(Sender: TObject);
begin
  ShowCityRegionTranslate('( ADMIN_UNIT.ID_CITY_ADM_UNT_ITEMS_TYPE = 1 )');
end;

procedure TFrameDicCity.ButShowLogClick(Sender: TObject);
begin
  if @FParamFrame.LogProc <> nil then
    FParamFrame.LogProc( nil,FParamFrame.ElemCounry.DBGetParamConnect, FParamFrame.ElemCounry.GetCurrManagerId, -1, [ FParamFrame.ElemCityAdminUnitRegion.TableName ] );
end;

procedure TFrameDicCity.PMMainTopTreePopup(Sender: TObject);
var aValue : variant;
begin
  SynchronizeButtonPanelAndPmenu( PanelTopCityRegion, PMMainTopTree );

  if self.FParamFrame.ElemCityAdminUnitRegion is TDBShemaTree then
  begin
    aValue := TDBShemaTree( self.FParamFrame.ElemCityAdminUnitRegion ).GetFocusedTreeValueForFocusedItem;
    if aValue <>null then

      ChangeKeyBoardLayout( klUkrainian );
      FValueCopyStr := VarToStr( aValue );
  end;
end;

procedure TFrameDicCity.butCopyTreeValueClick(Sender: TObject);
begin
  Clipboard.AsText := FValueCopyStr;
end;

end.


