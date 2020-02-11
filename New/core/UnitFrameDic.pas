unit UnitFrameDic;

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
  cxTextEdit, StdCtrls, Buttons, ExtCtrls, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView, UnitProc,
  cxGridDBTableView, cxGrid,IBQuery,UnitIBQuery,UnitGTranslate, Core,
  cefvcl, cxMaskEdit, cxDropDownEdit, cxImageComboBox,  OptSet, OrderUn,
  UnitFrameDescriptionWebHTML, Grids, DBGrids, cxImage,  cxTLData, cxDBTL,
  cxPCdxBarPopupMenu, cxMemo, cxPC, UnitLngTranslateEdit, UnitLngTranslate,
  cxTL, cxTLdxBarBuiltInMenu, cxInplaceContainer, Menus, ImgList, ActnList, Clipbrd;

type
  TShowLogProc = procedure (aFormActive:TForm; DBParam:TConnectDBParam; ManagerId:Integer; ObjId:Integer; Tables:array of String );
  TParamAlignPanel = record
    IndexPanel : Integer;
    Align : TAlign;
    Splitter : Boolean;
    SplitterAlign : TAlign;
    SpliterOnPanel : Boolean;
  end;

  TParamDescription = record
    DescriptionWebPath:string;
    ImageWebPath:string;
    DescriptionStafField:string;
    DescriptionHeight : Integer;
  end;

  TParamFunction = record
    LogProc : TShowLogProc;
    RefreshFunction : TNotifyEvent;
    AddProcGridView : TUpdateFormGridView;
    AddProcTreeView : TUpdateFormTree;
  end;

  TParamLngDic = record
    WidthLngForm:Integer;
    LngAddSql:string;
    LngJoinSql:string;
  end;

  TParamImgView =  record
    FieldImageShow:string;
    PathFieldImageShow:string;
    FileNameByIdElem:string;
    UseIdFileNameExt:string;
    Align:TAlign;
    Height:Integer;
  end;

  TParamUpdateDic = record
    VisibleUpdate:Boolean;
    EditViewData:Boolean;
    SearchPanel : Boolean;
    SearchFilter :Boolean;
    VisiblePanelButton  :Boolean;
  end;

  TParamAddButton = record
    Action:TAction;
  end;

  TParamAddButtonArr = array of TParamAddButton;

  TParamFormDict = record
    MainElem:TDBShema;
    PanelGridHeight:Integer;
    PanelGridWidth:Integer;
    lng:TParamLngDic;
    Description:TParamDescription;
    Img : TParamImgView;
    Update : TParamUpdateDic;
    Func   : TParamFunction;
    paramAlignPanel: TParamAlignPanel;
    AddButtons : TActionList;
  end;

  TFrameDic = class(TFrame)
    PanelMain: TPanel;
    SplitterBrowserHTML: TSplitter;
    PanelGrid: TPanel;
    PanelImage: TPanel;
    ImagePrew: TcxImage;
    PanelDescription: TPanel;
    PageDesription: TcxPageControl;
    TabHtmlDescript: TcxTabSheet;
    TabTextDescriptStaf: TcxTabSheet;
    MemoDescript: TcxMemo;
    PanelButton: TPanel;
    PageControlData: TcxPageControl;
    TabView: TcxTabSheet;
    GridMain: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    TabTree: TcxTabSheet;
    DBTreeList: TcxDBTreeList;
    PMAddDetailTree: TPopupMenu;
    butAddToLevel: TMenuItem;
    butAddToSubLevel: TMenuItem;
    TreeDS: TDataSource;
    PMMainDetailTree: TPopupMenu;
    butMainAddToLevel: TMenuItem;
    butMainAddToSubLevel: TMenuItem;
    butMainEdit: TMenuItem;
    N3: TMenuItem;
    butMainDel: TMenuItem;
    ImageList: TImageList;
    FrameDescriptionWebHTMLDic: TFrameDescriptionWebHTML;
    PanelUpdate: TPanel;
    butAdd: TSpeedButton;
    butEdit: TSpeedButton;
    butDel: TSpeedButton;
    BevelMainSpliterMoveRows: TBevel;
    PanelRefresh: TPanel;
    butRefresh: TSpeedButton;
    Bevel1: TBevel;
    PanelMoveUpDown: TPanel;
    butMoveUp: TSpeedButton;
    butMoveDown: TSpeedButton;
    BevelMainSpliterLng: TBevel;
    PanelLng: TPanel;
    ButTranslateLng: TSpeedButton;
    Bevel2: TBevel;
    PanelLog: TPanel;
    ButShowLog: TSpeedButton;
    PanelAddButton: TPanel;
    Bevel3: TBevel;
    ImageListButton: TImageList;
    PanelSearchText: TPanel;
    PanelButSearch: TPanel;
    butSearch: TSpeedButton;
    PanelTextSearch: TPanel;
    EdSearch: TcxTextEdit;
    PMGridView: TPopupMenu;
    MbutRefresh: TMenuItem;
    N4: TMenuItem;
    MbutAdd: TMenuItem;
    MbutEdit: TMenuItem;
    MbutDel: TMenuItem;
    N7: TMenuItem;
    MbutMoveUp: TMenuItem;
    MbutMoveDown: TMenuItem;
    N10: TMenuItem;
    MbutTranslateLng: TMenuItem;
    N12: TMenuItem;
    MButShowLog: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    MbutMoveUp1: TMenuItem;
    N1: TMenuItem;
    N6: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N11: TMenuItem;
    N13: TMenuItem;
    butCopyGridValue: TMenuItem;
    N14: TMenuItem;
    butCopyTreeValue: TMenuItem;
    procedure butRefreshClick(Sender: TObject);
    procedure butAddClick(Sender: TObject);
    procedure butEditClick(Sender: TObject);
    procedure butDelClick(Sender: TObject);
    procedure butMoveUpClick(Sender: TObject);
    procedure butMoveDownClick(Sender: TObject);
    procedure ButTranslateLngClick(Sender: TObject);
    procedure DBTreeListFocusedNodeChanged(Sender: TcxCustomTreeList;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure butMainAddToLevelClick(Sender: TObject);
    procedure butMainAddToSubLevelClick(Sender: TObject);
    procedure DBTreeListDblClick(Sender: TObject);
    procedure butAddToLevelClick(Sender: TObject);
    procedure butAddToSubLevelClick(Sender: TObject);
    procedure ButShowLogClick(Sender: TObject);
    procedure PMMainDetailTreePopup(Sender: TObject);
    procedure butSearchClick(Sender: TObject);
    procedure EdSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PanelDescriptionResize(Sender: TObject);
    procedure EdSearchPropertiesChange(Sender: TObject);
    procedure PMGridViewPopup(Sender: TObject);
    procedure butCopyGridValueClick(Sender: TObject);
    procedure butCopyTreeValueClick(Sender: TObject);
  private
    { Private declarations }
    Elem : TDBShema;
    FAlign : TAlign;
    FSearchAct : Boolean;
    FAllFrameRefres : TList;

    FParamDicFormMain: TParamFormDict;
    FSaveCellDblClick:TcxGridCellClickEvent;
    FSaveUpdateForm:Boolean;
    FSaveFocusedRecordChangedEvent : TcxGridFocusedRecordChangedEvent;
    FGoogleTranslate : TGoogleTranslate;
    FSaveElemView:TcxGridDBTableView;

    procedure FInitElem( aElem : TDBShema );
    procedure FPrepareAddPanelButton( ParamAction:TActionList );
    procedure FPepareFrameDesription;

    procedure FClearFilterSearchText;
    procedure FSynhronizePanelButtonAndPM;
    procedure FPrepareUpdatePanel( Param:TParamFormDict );
    procedure FPrepare( aElem:TDBShema );

    function  FMainElemIsNotEmpty:Boolean;
    function  FElemIsNotEmpty( aElem:TDBShema ):Boolean;
    procedure FRefresh(JustSelf:Boolean=false);
    procedure ViewInfoCellDblClick(
              Sender: TcxCustomGridTableView;
              ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
              AShift: TShiftState; var AHandled: Boolean);
    procedure ViewInfoFocusedRecordChanged(
              Sender: TcxCustomGridTableView; APrevFocusedRecord,
              AFocusedRecord: TcxCustomGridRecord;
              ANewItemRecordFocusingChanged: Boolean);
    procedure ViewSortingChange( Sender: TObject );

  protected
    FCurrManager:Integer;
    FUpdate : Boolean;
    FValueCopyStr : String;
    procedure FUpdateToolActions( Value: Integer );
  public
    { Public declarations }
    procedure Init( Elem:TDBShema; CurrManager :Integer; aParamDicForm: TParamFormDict );
    procedure DestroyFrame;
    procedure RefreshControls(aCurrManager:integer);
    procedure SelfRefresh;
    procedure SetUpdate( CanUpdate:Boolean );
    procedure AddAllFrameRefres(aList: TList);
  published
    property EnabledUpdate : Integer write FUpdateToolActions ;
    property ParamDicFormMain : TParamFormDict read FParamDicFormMain write FParamDicFormMain;
  end;

  procedure ShowLngDic( aElem:TDBShemaView; CurrManager : Integer; aWidthLngForm:Integer=-1; aLngAddSql:string='';AddSqlJoin:string='' );overload;
  procedure ShowLngDic( aElem:TDBShemaTree; CurrManager : Integer; aWidthLngForm:Integer=-1; aLngAddSql:string='';AddSqlJoin:string='' );overload;

  procedure PrepareDefaultParamDic( var aParamDicForm: TParamFormDict );

implementation

{$R *.dfm}

procedure ShowLngDic( aElem:TDBShemaView; CurrManager:Integer; aWidthLngForm:Integer=-1; aLngAddSql:string=''; AddSqlJoin:string='' );
var i:integer;
    AutoWidth:Boolean;
    CurrParam:TTranslateOptions;
    FieldTranslateShema:TFieldTranslateShemaArr;
begin
  try
    aElem.View.BeginUpdate;
    aElem.DB.DisableControls;

    for i:=0 to aElem.View.ColumnCount -1 do
    begin
      CurrParam:= aElem.GetParamTranslateTableByFiedlName( aElem.View.Columns[i].DataBinding.FieldName );
      if CurrParam.FieldName <> '' then
        AddLngFieldColumnToShema( FieldTranslateShema, aElem, CurrParam.FieldName, CurrParam.FieldName );
    end;

    if Length(FieldTranslateShema) > 2 then AutoWidth := False
    else AutoWidth := True;

    if Length(FieldTranslateShema) <> 0 then
      ShowLngTranslate( aElem, nil, FieldTranslateShema, 'оригінал', AutoWidth, aWidthLngForm,CurrManager, aLngAddSql, AddSqlJoin );

  finally
    aElem.DB.EnableControls;
    aElem.View.EndUpdate;
  end;
end;

procedure ShowLngDic( aElem:TDBShemaTree; CurrManager:Integer; aWidthLngForm:Integer=-1; aLngAddSql:string=''; AddSqlJoin:string='' );
var i:integer;
    AutoWidth:Boolean;
    CurrParam:TTranslateOptions;
    FieldTranslateShema:TFieldTranslateShemaArr;
begin

  try

    aElem.Tree.BeginUpdate;
    aElem.DB.DisableControls;
    for i:=0 to aElem.Tree.ColumnCount -1 do
    begin
      CurrParam:= aElem.GetParamTranslateTableByFiedlName( TcxDBTreeListColumn( aElem.Tree.Columns[i] ).DataBinding.FieldName );
      if CurrParam.FieldName <> '' then
        AddLngFieldColumnToShema( FieldTranslateShema, aElem, CurrParam.FieldName, CurrParam.FieldName );
    end;

    if Length(FieldTranslateShema) > 2 then AutoWidth := False
    else AutoWidth:=True;

    if Length(FieldTranslateShema) <> 0 then
      ShowLngTranslate( aElem, nil, FieldTranslateShema, 'оригінал', AutoWidth, aWidthLngForm,CurrManager, aLngAddSql, AddSqlJoin );

  finally
    aElem.DB.EnableControls;
    aElem.Tree.EndUpdate;
  end;

end;

procedure PrepareDefaultParamDic(var aParamDicForm: TParamFormDict);
begin
  aParamDicForm.MainElem := nil;
  aParamDicForm.Func.AddProcGridView := nil;
  aParamDicForm.Func.AddProcTreeView := nil;
  aParamDicForm.Func.LogProc := nil;
  aParamDicForm.Func.RefreshFunction := nil;
  aParamDicForm.PanelGridHeight := -1;
  aParamDicForm.PanelGridWidth  := -1;
  aParamDicForm.lng.WidthLngForm := -1;
  aParamDicForm.lng.LngAddSql := '';
  aParamDicForm.lng.LngJoinSql:= '';
  aParamDicForm.Description.DescriptionWebPath := '';
  aParamDicForm.Description.DescriptionStafField := '';
  aParamDicForm.Description.DescriptionHeight := -1;
  aParamDicForm.Img.FieldImageShow := '';
  aParamDicForm.Img.PathFieldImageShow := '';
  aParamDicForm.Img.FileNameByIdElem  :='';
  aParamDicForm.Img.UseIdFileNameExt := '';
  aParamDicForm.Img.Align:=alClient;
  aParamDicForm.Img.Height:=-1;

  aParamDicForm.Update.VisiblePanelButton := True;
  aParamDicForm.Update.VisibleUpdate := True;
  aParamDicForm.Update.SearchPanel := True;
  aParamDicForm.Update.SearchFilter:= False;
  aParamDicForm.Update.EditViewData := TRue;
  aParamDicForm.paramAlignPanel.IndexPanel := -1;
  aParamDicForm.paramAlignPanel.Align := alNone;
  aParamDicForm.paramAlignPanel.Splitter := False;
  aParamDicForm.paramAlignPanel.SplitterAlign := alNone;
  aParamDicForm.paramAlignPanel.SpliterOnPanel:= False;

  aParamDicForm.AddButtons:=nil;
end;

procedure TFrameDic.Init( Elem: TDBShema; CurrManager :Integer; aParamDicForm: TParamFormDict );
begin
  self.FCurrManager := CurrManager;
  self.FParamDicFormMain := aParamDicForm;

  if self.FParamDicFormMain.MainElem = nil then
  begin
    if Elem.MainElement <> nil then
      self.FParamDicFormMain.MainElem := Elem.MainElement
    else
      self.FParamDicFormMain.MainElem := Elem.RelationElement;
  end;

  FUpdate := True;
  self.FPrepare( Elem );

end;

procedure TFrameDic.SetUpdate( CanUpdate:Boolean );
begin
  FUpdate := CanUpdate;
  self.FRefresh( True );
end;

procedure TFrameDic.DestroyFrame;
begin
  ActiveFormBeforeEditData := GetFormForComponent( self ); 

  if Elem is TDBShemaView then
  begin
    TDBShemaView(Elem).View.OnCellDblClick := nil;
    TDBShemaView(Elem).View.OnFocusedRecordChanged := nil;

    TDBShemaView(Elem).View.OnCellDblClick := nil;
    TDBShemaView(Elem).FocusedRecordChanged := nil;

    TDBShemaView(Elem).View.Free;
    TDBShemaView(Elem).ClearView;
  end;

  if Elem<> nil then Elem.Close;
  ActiveFormBeforeEditData := nil;
end;

procedure TFrameDic.FInitElem( aElem : TDBShema );
begin
  self.FAllFrameRefres := nil;

  ActiveFormBeforeEditData := GetFormForComponent( self );
  if aElem is TDBShemaView then
  begin
    PageControlData.ActivePage := TabView;

    Elem := TDBShemaView(aElem).Clone;
    GridMain.Levels[0].GridView := TDBShemaView( Elem ).View;

    if TDBShemaView(Elem).View.DataController.FocusedRecordIndex >=0 then
      TDBShemaView(Elem).ViewFocusRowIndex;

    TDBShemaView(Elem).View.OnCellDblClick := ViewInfoCellDblClick;
    TDBShemaView(Elem).FocusedRecordChanged := ViewInfoFocusedRecordChanged;
    TDBShemaView(Elem).View.DataController.OnSortingChanged := ViewSortingChange;
    TDBShemaView(Elem).VisibleCheckColumn( False );
    TDBShemaView(Elem).VisibleOrderColumn( True );
    TDBShemaView(Elem).SetFocusOnView;

  end;

  if aElem is TDBShemaTree then
  begin

    PageControlData.ActivePage := TabTree;
    Elem := TDBShemaTree(aElem).Clone;
    TreeDS.DataSet := Elem.DB;
    TDBShemaTree(Elem).PreviewVirtualOnTree( DBTreeList );

    TDBShemaTree(Elem).SetTree( DBTreeList );
    PageControlData.ActivePage := TabTree;
    if not butEdit.Visible then DBTreeList.PopupMenu :=nil;

  end;

end;

procedure TFrameDic.ViewInfoCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if ( butEdit.Enabled ) and ( PanelUpdate.Visible ) then butEdit.Click;
end;

procedure TFrameDic.FPepareFrameDesription;
var PropDescriptWeb:TPropertyDescriptWeb;
begin
  PropDescriptWeb.ElemFor := Elem;
  PropDescriptWeb.WebSourcePath := OptionSet.WebSourcePath;
  PropDescriptWeb.PathToImage := Self.FParamDicFormMain.Description.ImageWebPath;
  PropDescriptWeb.PathRootToHtml := Self.FParamDicFormMain.Description.DescriptionWebPath;
  PropDescriptWeb.MessNotSelectLNGDescript := MessNotSelectLNGDescript;
  PropDescriptWeb.MessNotSelectLNGDescript := MessFileTranslateForLngNotFound;
  PropDescriptWeb.LocalLang := nLocalLang;
  PropDescriptWeb.PathToHtmlEditor := OptionSet.HtmlEditor;// ExtractFilePath(Application.ExeName)+'HTMLEditor.exe';
  PropDescriptWeb.GoogleTranslateElem := FGoogleTranslate;
  FrameDescriptionWebHTMLDic.Prepare( PropDescriptWeb );
end;

procedure TFrameDic.FPrepareAddPanelButton( ParamAction:TActionList );
Const WidthButton = 23;
var i:integer;

function AddButton( Act:TAction;Ind:Integer):TSpeedButton;
var CurrBut:TSpeedButton;
    CurrICo : TBitmap;
begin
  CurrBut := TSpeedButton.Create(self);
  CurrBut.Parent :=PanelAddButton;
  CurrBut.Caption :=Act.Caption;
  CurrBut.Hint := Act.Hint;
  CurrBut.Left := Ind * WidthButton + 2;
  CurrBut.Width := WidthButton;
  CurrBut.Top := butRefresh.Top; 
  CurrBut.Flat := true;
  CurrBut.GroupIndex := Act.GroupIndex;
  if CurrBut.GroupIndex <> 0 then CurrBut.AllowAllUp :=True;
  CurrBut.Name :='Butt_Add_'+Act.Name;

  if Act.ImageIndex <> -1 then
  begin
    try
      CurrICo:=TBitmap.Create;
      ParamAction.Images.GetBitmap( Act.ImageIndex, CurrICo );
      CurrBut.Glyph.Assign( CurrICo );

      CurrBut.Action := Act;
      CurrBut.Caption :='';
    finally
      CurrICo.free;
    end;
  end;

  if Act.Tag = 10 then
  begin
    CurrBut.Down := True;
    Act.ActionComponent  := CurrBut;
    Act.Execute;
  end;

  result:= CurrBut;
end;

begin
  PanelAddButton.Visible := ParamAction <> nil;
  if not PanelAddButton.Visible then exit;

  PanelAddButton.Width:=8;
  for i:=0 to ParamAction.ActionCount -1 do
  begin
    PanelAddButton.Width := PanelAddButton.Width + AddButton( TAction(ParamAction.Actions[i]) ,i).Width ;
  end;
  PanelAddButton.Width  := PanelAddButton.Width +1;
end;

procedure TFrameDic.FPrepareUpdatePanel( Param:TParamFormDict );
begin
  PanelButton.Visible :=  Param.Update.VisiblePanelButton;
  PanelUpdate.Visible := Param.Update.VisibleUpdate;
  PanelLng.Visible := ( Param.Update.VisibleUpdate ) and ( Elem.GetMainParamTranslateTable.FieldName <> '' );

  if Param.Update.VisibleUpdate = false then
  begin
    PanelSearchText.left := butAdd.Left;
    PanelSearchText.Width := Self.Width - PanelSearchText.left  ;
  end;

  PanelMoveUpDown.Visible := (Elem.FieldNumber <>'')and(Param.Update.VisibleUpdate);
  PanelSearchText.Visible :=  Param.Update.SearchPanel;
  PanelLog.Visible := {(self.FParamDicFormMain.Update.VisibleUpdate ) and} (@FParamDicFormMain.Func.LogProc <> nil);

  FPrepareAddPanelButton(self.FParamDicFormMain.AddButtons);
  ImageListIndexToSpeedButton( butSearch, ImageListButton, MyIfThen(Param.Update.SearchFilter, 1,0) );

  if not PanelButton.Visible then
  begin
    GridMain.PopupMenu := nil;
    DBTreeList.PopupMenu := nil;
  end;

end;

procedure TFrameDic.FSynhronizePanelButtonAndPM;
begin
{  MbutRefresh.Visible := butRefresh.Visible;
  MbutRefresh.Enabled := butRefresh.Enabled;

  MbutAdd.Visible := butAdd.Visible;
  MbutAdd.Enabled := butAdd.Enabled;

  MbutEdit.Visible := butEdit.Visible;
  MbutEdit.Enabled := butEdit.Enabled;

  MbutDel.Visible := butDel.Visible;
  MbutDel.Enabled := butDel.Enabled;

  MbutMoveUp.Visible := butMoveUp.Visible;
  MbutMoveUp.Enabled := butMoveUp.Enabled;

  MbutMoveDown.Visible := butMoveDown.Visible;
  MbutMoveDown.Enabled := butMoveDown.Enabled;

  MButTranslateLng.Visible := ButTranslateLng.Visible;
  MButTranslateLng.Enabled := ButTranslateLng.Enabled;

  MButShowLog.Visible := ButShowLog.Visible;
  MButShowLog.Enabled := ButShowLog.Enabled; }
end;

procedure TFrameDic.FPrepare( aElem:TDBShema );
var DBParam : TConnectDBParam;
begin
  aElem.DBOpen;
  FSearchAct := False;

  FInitElem( aElem );
  FPrepareUpdatePanel( self.FParamDicFormMain );

  PageControlData.HideTabs := True;
  MemoDescript.Style := EdSearch.Style;
  MemoDescript.StyleDisabled := EdSearch.StyleDisabled;
  MemoDescript.Enabled := False;

  if self.FParamDicFormMain.Description.DescriptionWebPath <>'' then
  begin
    FPepareFrameDesription;
    PageDesription.ActivePage := TabHtmlDescript;
  end;

  TabHtmlDescript.TabVisible := self.FParamDicFormMain.Description.DescriptionWebPath <> '';
  TabTextDescriptStaf.TabVisible := self.FParamDicFormMain.Description.DescriptionStafField <> '';

  PanelDescription.Visible := GetCountVisiblePages( PageDesription )>0;
  PageDesription.HideTabs := GetCountVisiblePages( PageDesription )<=1;

  SplitterBrowserHTML.Visible := PanelDescription.Visible;
  PanelImage.Visible := ( self.FParamDicFormMain.Img.FieldImageShow <>'') or
                        ( self.FParamDicFormMain.Img.FileNameByIdElem<>'' ) or
                        ( Self.FParamDicFormMain.Img.UseIdFileNameExt <>'' ) ;

  if PanelImage.Visible then
  begin
    ImagePrew.Align := self.FParamDicFormMain.Img.Align;
    if self.FParamDicFormMain.Img.Height<> -1 then
      ImagePrew.Height := self.FParamDicFormMain.Img.Height;
  end;

  ButTranslateLng.Enabled:= Elem.GetMainParamTranslateTable.FieldName <> '';
  FRefresh;
end;

function TFrameDic.FElemIsNotEmpty( aElem:TDBShema ):Boolean;
begin
  if aElem is TDBShemaView then
  begin
    if TDBShemaView(aElem).View <> nil then
      result := (TDBShemaView(aElem).View.ViewData.RowCount <> 0)or(TDBShemaView(aElem).View.ViewData.RowCount <> 0)
    else result := not aElem.DB.IsEmpty;
  end;

  if aElem is TDBShemaTree then
  begin
    if TDBShemaTree( aElem ).tree <> nil then
      result := TDBShemaTree( aElem ).Tree.TopNode <> Nil
    else result := not aElem.DB.IsEmpty;
  end;
end;

function TFrameDic.FMainElemIsNotEmpty:Boolean;
begin
  result := FElemIsNotEmpty( self.FParamDicFormMain.MainElem );
end;

procedure TFrameDic.FRefresh( JustSelf:Boolean=false );
var CurrFilePic:String;
begin
  if self.Name='' then exit;
  if Elem = nil then exit;

  ActiveFormBeforeEditData := GetFormForComponent( self );
  butAdd.Enabled := ( ( (( self.FParamDicFormMain.MainElem <> nil )  and ( FMainElemIsNotEmpty )  ) or
                      (  self.FParamDicFormMain.MainElem =  nil ) ) and (  self.FCurrManager > 0 ) and Elem.CheckRoleInsert) and ( FUpdate );
                      
  butDel.Enabled :=  ( FElemIsNotEmpty( Elem ) ) and (self.FCurrManager > 0) and (Elem.CheckRoleDelete )and ( FUpdate );
  butEdit.Enabled := ( ( FElemIsNotEmpty( Elem ) ) and (self.FParamDicFormMain.Update.EditViewData) )  and (self.FCurrManager > 0) and ( Elem.CheckRoleUpdate ) and ( FUpdate );
  butTranslateLng.Enabled:= ( Elem.GetMainParamTranslateTable.FieldName <> '') and ( FUpdate );

  butMoveUp.Enabled := (Elem.FieldNumber <>'') and ( CheckMoveUpRow(Elem) ) and ( self.FCurrManager > 0 ) and (Elem.CheckRoleUpdate)and ( FUpdate );
  butMoveDown.Enabled := (Elem.FieldNumber <>'') and ( CheckMoveDownRow(Elem) ) and (self.FCurrManager > 0)and (Elem.CheckRoleUpdate)and ( FUpdate );

  butTranslateLng.Enabled:= (Elem.GetMainParamTranslateTable.FieldName <> '') and ( FElemIsNotEmpty( Elem ) )and (Elem.CheckRoleUpdate)and ( FUpdate );
  ButShowLog.Enabled := Elem.CheckRoleLogAny( self.FCurrManager ) ;

  if (Elem is TDBShemaTree)and(TDBShemaTree( Elem ).Tree<>nil) then
  begin
    if TDBShemaTree( Elem ).AutoExpand then
      TDBShemaTree( Elem ).TreeExpandAll;

    butAddToLevel.Enabled := ( butAdd.Enabled) and ( FUpdate );;
    butAddToSubLevel.Enabled := ( butAdd.Enabled ) and ( TDBShemaTree( Elem ).Tree.FocusedNode <> nil ) and ( FUpdate );;

    butMainAddToLevel.Enabled := (butAdd.Enabled) and ( FUpdate );
    butMainAddToSubLevel.Enabled :=( butAddToSubLevel.Enabled ) and ( FUpdate );
    butMainEdit.Enabled := ( butEdit.Enabled ) and ( FUpdate );
    butMainDel.Enabled := ( butDel.Enabled ) and ( FUpdate );
  end;

  if PanelDescription.Visible then
    FrameDescriptionWebHTMLDic.RefreshShowCurrDescription;

  if (PanelImage.Visible)and(Self.FParamDicFormMain.Img.PathFieldImageShow <> '' )   then
  begin
    if ( Self.FParamDicFormMain.Img.FieldImageShow <>'') then
    begin
      CurrFilePic := Self.FParamDicFormMain.Img.PathFieldImageShow + Elem.DB.FieldByName( Self.FParamDicFormMain.Img.FieldImageShow ).AsString;
      LoadPhotoToImage( ImagePrew, CurrFilePic,'' );
    end
    else
     if (Self.FParamDicFormMain.Img.FileNameByIdElem <> '') then
     begin
       CurrFilePic := Self.FParamDicFormMain.Img.PathFieldImageShow + Elem.GetValueIdStr+'\'+Self.FParamDicFormMain.Img.FileNameByIdElem;
       LoadPhotoToImage( ImagePrew, CurrFilePic  ,'' );
     end
     else
     if Self.FParamDicFormMain.Img.UseIdFileNameExt<>'' then
     begin
       CurrFilePic := Self.FParamDicFormMain.Img.PathFieldImageShow + Elem.GetValueIdStr+Self.FParamDicFormMain.Img.UseIdFileNameExt;
       LoadPhotoToImage( ImagePrew, CurrFilePic  ,'' );
     end;
  end;

  if self.FParamDicFormMain.Description.DescriptionStafField <> '' then
    MemoDescript.Text := Elem.DB.FieldByName( self.FParamDicFormMain.Description.DescriptionStafField ).AsString;

  if ( not JustSelf )and ( @FParamDicFormMain.Func.RefreshFunction <> nil ) then Self.FParamDicFormMain.Func.RefreshFunction( Elem );
end;

procedure TFrameDic.RefreshControls(aCurrManager:integer);
begin
  if self.Elem = nil then exit;
  self.FCurrManager := aCurrManager;
  self.Elem.CurrUserId := aCurrManager;
  FRefresh;
end;

procedure TFrameDic.SelfRefresh;
begin
  FRefresh(True);
end;

procedure TFrameDic.ViewInfoFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var i:integer;
begin
  //if not ( Elem.DB.State in [dsBrowse] ) then exit;

  if Sender.IsControlFocused then
  begin
    if FAllFrameRefres<>nil then
      for i:=0 to FAllFrameRefres.Count-1 do
        TFrameDic(FAllFrameRefres.Items[i]).FRefresh(True)
    else
     self.FRefresh;
  end
  else self.FRefresh;    
end;

procedure TFrameDic.ViewSortingChange( Sender: TObject );
begin
  FRefresh;
end;

procedure TFrameDic.FUpdateToolActions( Value: Integer );
begin
  self.FCurrManager := Value;
  self.Elem.CurrUserId := self.FCurrManager;
  FRefresh;
end;

procedure TFrameDic.butRefreshClick(Sender: TObject);
begin
  //ShowMessage( TDBShemaView(Elem).View.Name );
  Elem.Requery;
  FRefresh;
end;

procedure TFrameDic.FClearFilterSearchText;
begin
  if (EdSearch.Text <> '')and(self.FParamDicFormMain.Update.SearchFilter) then
    EdSearch.Text := '';
end;

procedure TFrameDic.butAddClick(Sender: TObject);
begin
  if not FieldNumberIsSorted( Elem ) then MyShowMessageDlg( WarningSortColumnOrder, mtError, but_OK )
  else
  begin
    FClearFilterSearchText;
    
    if Elem is TDBShemaView then
    begin
      if @self.FParamDicFormMain.Func.AddProcGridView = nil then
      begin
        TDBShemaView(Elem).DBInsert(True);
      end
      else
      begin
        Elem.UpdateForm := False;
        self.FParamDicFormMain.Func.AddProcGridView( True, self.FCurrManager );
      end;

      Elem.RequeryCurrentRecord;
    end
    else PMAddDetailTree.Popup( TControl(Sender).ClientOrigin.X , TControl(Sender).ClientOrigin.Y + TControl(Sender).Height );

    FRefresh;
  end;
end;

procedure TFrameDic.butEditClick(Sender: TObject);
begin
  if not PanelButton.Visible then exit;
  if not PanelUpdate.Visible then exit;

  if Elem is TDBShemaView then
  begin
    if @self.FParamDicFormMain.Func.AddProcGridView = nil then
    begin
      //Elem.UpdateForm := True;
      //Elem.DB.Edit;
      TDBShemaView(Elem).DBEdit(True);
    end
    else
    begin
      Elem.UpdateForm := False;
      self.FParamDicFormMain.Func.AddProcGridView( False, self.FCurrManager );
    end;
  end
  else
  if Elem is TDBShemaTree then
  begin
    if @self.FParamDicFormMain.Func.AddProcTreeView = nil then
    begin
      Elem.UpdateForm := True;
      Elem.DB.Edit;
    end
    else
     self.FParamDicFormMain.Func.AddProcTreeView( OptTreeNodeAddNone, self.FCurrManager );
  end;

  Elem.RequeryCurrentRecord;
  FRefresh;
end;

procedure TFrameDic.butDelClick(Sender: TObject);
begin
  if not FieldNumberIsSorted( Elem) then MyShowMessageDlg( WarningSortColumnOrder, mtError, but_OK )
  else
  begin
    if Elem is TDBShemaView then TDBShemaView(Elem).DeleteRecordFromView
    else Elem.DB.Delete;

    FRefresh;
  end;
end;

procedure TFrameDic.butMoveUpClick(Sender: TObject);
begin
  MoveUpRow( Elem );
  FRefresh;
end;

procedure TFrameDic.butMoveDownClick(Sender: TObject);
begin
  MoveDowRow( Elem );
  FRefresh;
end;

procedure TFrameDic.ButTranslateLngClick(Sender: TObject);
begin
  if Elem is TDBShemaView then
    ShowLngDic( TDBShemaView(Elem), self.FCurrManager, FParamDicFormMain.lng.WidthLngForm, FParamDicFormMain.lng.LngAddSql,FParamDicFormMain.lng.LngJoinSql );

  if Elem is TDBShemaTree then
    ShowLngDic( TDBShemaTree(Elem), self.FCurrManager, FParamDicFormMain.lng.WidthLngForm, FParamDicFormMain.lng.LngAddSql,FParamDicFormMain.lng.LngJoinSql );
end;

procedure TFrameDic.DBTreeListFocusedNodeChanged(Sender: TcxCustomTreeList;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
  FRefresh;
end;

procedure TFrameDic.butMainAddToLevelClick(Sender: TObject);
begin
  if Elem is TDBShemaTree then
  begin
    if @self.FParamDicFormMain.Func.AddProcTreeView = nil then
    begin
      Elem.UpdateForm := True;
      TDBShemaTree(Elem).InsertNode;
    end
    else
    begin
      Elem.UpdateForm := False;
      self.FParamDicFormMain.Func.AddProcTreeView ( OptTreeNodeAddInsert, self.FCurrManager );
    end;
  end;
end;

procedure TFrameDic.butAddToLevelClick(Sender: TObject);
begin
  if Elem is TDBShemaTree then
  begin
    if @self.FParamDicFormMain.Func.AddProcTreeView = nil then
    begin
      Elem.UpdateForm := True;
      TDBShemaTree(Elem).InsertNode;
    end
    else
    begin
      Elem.UpdateForm := False;
      self.FParamDicFormMain.Func.AddProcTreeView ( OptTreeNodeAddInsert, self.FCurrManager );
    end;
  end;
  Elem.RequeryCurrentRecord;
end;

procedure TFrameDic.butMainAddToSubLevelClick(Sender: TObject);
begin
  if Elem is TDBShemaTree then
  begin
    if @self.FParamDicFormMain.Func.AddProcTreeView = nil then
    begin
      Elem.UpdateForm := True;
      TDBShemaTree(Elem).AddSubNode;
    end
    else
    begin
      Elem.UpdateForm := False;
      self.FParamDicFormMain.Func.AddProcTreeView ( OptTreeNodeAddSub, self.FCurrManager );
    end;
  end;
  Elem.RequeryCurrentRecord;
end;

procedure TFrameDic.butAddToSubLevelClick(Sender: TObject);
begin
  if Elem is TDBShemaTree then TDBShemaTree(Elem).AddSubNode;
  Elem.RequeryCurrentRecord;
end;

procedure TFrameDic.DBTreeListDblClick(Sender: TObject);
begin
  if ( butEdit.Enabled ) and ( butEdit.Visible ) then butEdit.Click;
end;

procedure TFrameDic.ButShowLogClick(Sender: TObject);
begin

  if @FParamDicFormMain.Func.LogProc <> nil then FParamDicFormMain.Func.LogProc( nil, self.Elem.DBGetParamConnect, self.Elem.GetCurrManagerId, -1, [ self.Elem.TableName ] ); //TForm(self.Owner)
end;

procedure TFrameDic.butSearchClick(Sender: TObject);
begin
  if Elem is TDBShemaView then
    TDBShemaView(Elem).SearchTextOnViewAllColumns( EdSearch.Text );

  if Elem is TDBShemaTree then
    TDBShemaTree(Elem).SearchTextOnViewAllColumns( EdSearch.Text );

  EdSearch.SetFocus;
end;

procedure TFrameDic.EdSearchKeyDown( Sender: TObject; var Key: Word; Shift: TShiftState );
begin
  if not FParamDicFormMain.Update.SearchFilter then 
    if Key = VK_Return then butSearch.Click;
end;

procedure TFrameDic.PanelDescriptionResize(Sender: TObject);
begin
  FrameDescriptionWebHTMLDic.Width := PanelDescription.Width;
  FrameDescriptionWebHTMLDic.Height := PanelDescription.Height;
end;

procedure TFrameDic.EdSearchPropertiesChange(Sender: TObject);
begin
  if FParamDicFormMain.Update.SearchFilter then
  begin
    if Elem is TDBShemaView then
      SetFilterOnWievForAllColumns( TcxgridDBTableView( GridMain.Levels[0].GridView ), EdSearch.Text, ['like'], False );
  end;
end;

procedure TFrameDic.PMGridViewPopup(Sender: TObject);
var aValue:Variant;
begin
  SynchronizeButtonPanelAndPmenu( PanelButton, PMGridView );

  if Elem is TDBShemaView then
  begin
    butCopyGridValue.Enabled := (TDBShemaView(Elem).HitTestCol<>nil) and (TDBShemaView(Elem).HitTestCol.FocusedCellViewInfo <> nil) ;
    aValue := TDBShemaView(Elem).GetFocusedViewValueForFocusedItem;
    if aValue <>null then

      ChangeKeyBoardLayout( klUkrainian );
      FValueCopyStr := VarToStr( aValue );
  end;
end;


procedure TFrameDic.PMMainDetailTreePopup(Sender: TObject);
var aValue:Variant;
begin
  SynchronizeButtonPanelAndPmenu( PanelButton, PMMainDetailTree );
  if Elem is TDBShemaTree then
  begin
    aValue := TDBShemaTree(Elem).GetFocusedTreeValueForFocusedItem;
    if aValue <>null then

      ChangeKeyBoardLayout( klUkrainian );
      FValueCopyStr := VarToStr( aValue );
  end;

  FRefresh;
end;

procedure TFrameDic.butCopyGridValueClick(Sender: TObject);
begin
  Clipboard.AsText := FValueCopyStr;
end;

procedure TFrameDic.butCopyTreeValueClick(Sender: TObject);
begin
  Clipboard.AsText := FValueCopyStr;
end;

procedure TFrameDic.AddAllFrameRefres(aList: TList);
begin
  self.FAllFrameRefres:=aList;
end;

end.
