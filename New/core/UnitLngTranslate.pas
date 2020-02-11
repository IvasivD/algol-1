unit UnitLngTranslate;

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
  cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, cxGridBandedTableView,
  cxGridDBBandedTableView,
  cxTextEdit, Buttons, StdCtrls, ExtCtrls, IBUpdateSQL, Core, cxMaskEdit,UnitIBQuery,IBQuery,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,UnitProc,
  cxCheckComboBox,UnitLngTranslateEdit, Menus, ImgList, cxImageComboBox, UnitGTranslate,
  cxCheckBox, cxTL, cxGridCardView, cxPCdxBarPopupMenu,
  cxTLdxBarBuiltInMenu, cxInplaceContainer, cxTLData, cxDBTL, cxPC;

type
  TTranslateOpt = (TrOptTranslate,TrOptTranslite);

  TFrmLngTranslate = class(TForm)
    ModalPanel: TPanel;
    OkBtn: TBitBtn;
    PanelSearchCountry: TPanel;
    butSearchCountry: TSpeedButton;
    EdSearchCountry: TcxTextEdit;
    Panel2: TPanel;
    butEditTranslate: TSpeedButton;
    Label1: TLabel;
    CmbCheckSelectLng: TcxCheckComboBox;
    ButClearSelectCheckLng: TSpeedButton;
    Label2: TLabel;
    butRefresh: TSpeedButton;
    butTranslate: TSpeedButton;
    PopupMenu: TPopupMenu;
    PButRefresh: TMenuItem;
    PButEdit: TMenuItem;
    PButTranslate: TMenuItem;
    N4: TMenuItem;
    ImageList: TImageList;
    butSelectAll: TSpeedButton;
    ImCmbIdentOrigialLng: TcxImageComboBox;
    Label3: TLabel;
    ChAutoRefreshAfterTranslate: TcxCheckBox;
    butGridAutoWidth: TSpeedButton;
    ButTransliteral: TSpeedButton;
    LSheet: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    cxStyle69: TcxStyle;
    cxStyle70: TcxStyle;
    cxStyle71: TcxStyle;
    cxStyle72: TcxStyle;
    cxStyle73: TcxStyle;
    cxStyle74: TcxStyle;
    cxStyle75: TcxStyle;
    cxStyle76: TcxStyle;
    cxStyle77: TcxStyle;
    cxStyle78: TcxStyle;
    cxStyle79: TcxStyle;
    cxStyle80: TcxStyle;
    cxStyle81: TcxStyle;
    cxStyle82: TcxStyle;
    cxStyle83: TcxStyle;
    cxStyle84: TcxStyle;
    cxStyle85: TcxStyle;
    cxStyle86: TcxStyle;
    cxStyle87: TcxStyle;
    cxStyle88: TcxStyle;
    cxStyle89: TcxStyle;
    cxStyle90: TcxStyle;
    cxStyle91: TcxStyle;
    cxStyle92: TcxStyle;
    cxStyle93: TcxStyle;
    cxStyle94: TcxStyle;
    cxStyle95: TcxStyle;
    cxStyle96: TcxStyle;
    cxStyle97: TcxStyle;
    cxStyle98: TcxStyle;
    cxStyle99: TcxStyle;
    cxStyle100: TcxStyle;
    cxStyle101: TcxStyle;
    cxStyle102: TcxStyle;
    cxStyle103: TcxStyle;
    cxStyle104: TcxStyle;
    cxStyle105: TcxStyle;
    cxStyle106: TcxStyle;
    cxStyle107: TcxStyle;
    cxStyle108: TcxStyle;
    cxStyle109: TcxStyle;
    cxStyle110: TcxStyle;
    cxStyle111: TcxStyle;
    cxStyle112: TcxStyle;
    cxStyle113: TcxStyle;
    cxStyle114: TcxStyle;
    cxStyle115: TcxStyle;
    cxStyle116: TcxStyle;
    cxStyle117: TcxStyle;
    cxStyle118: TcxStyle;
    cxStyle119: TcxStyle;
    cxStyle120: TcxStyle;
    cxStyle121: TcxStyle;
    cxStyle122: TcxStyle;
    cxStyle123: TcxStyle;
    cxStyle124: TcxStyle;
    cxStyle125: TcxStyle;
    cxStyle126: TcxStyle;
    cxStyle127: TcxStyle;
    cxStyle128: TcxStyle;
    cxStyle129: TcxStyle;
    cxStyle130: TcxStyle;
    cxStyle131: TcxStyle;
    cxStyle132: TcxStyle;
    cxStyle133: TcxStyle;
    cxStyle134: TcxStyle;
    cxStyle135: TcxStyle;
    cxStyle136: TcxStyle;
    cxStyle137: TcxStyle;
    cxStyle138: TcxStyle;
    cxStyle139: TcxStyle;
    cxStyle140: TcxStyle;
    cxStyle141: TcxStyle;
    cxStyle142: TcxStyle;
    cxStyle143: TcxStyle;
    cxStyle144: TcxStyle;
    cxStyle145: TcxStyle;
    cxStyle146: TcxStyle;
    cxStyle147: TcxStyle;
    cxStyle148: TcxStyle;
    cxStyle149: TcxStyle;
    cxStyle150: TcxStyle;
    cxStyle151: TcxStyle;
    cxStyle152: TcxStyle;
    cxStyle153: TcxStyle;
    cxStyle154: TcxStyle;
    cxStyle155: TcxStyle;
    cxStyle156: TcxStyle;
    cxStyle157: TcxStyle;
    cxStyle158: TcxStyle;
    cxStyle159: TcxStyle;
    cxStyle160: TcxStyle;
    cxStyle161: TcxStyle;
    cxStyle162: TcxStyle;
    cxStyle163: TcxStyle;
    cxStyle164: TcxStyle;
    cxStyle165: TcxStyle;
    cxStyle166: TcxStyle;
    cxStyle167: TcxStyle;
    cxStyle168: TcxStyle;
    cxStyle169: TcxStyle;
    cxStyle170: TcxStyle;
    cxStyle171: TcxStyle;
    cxStyle172: TcxStyle;
    cxStyle173: TcxStyle;
    cxStyle174: TcxStyle;
    cxStyle175: TcxStyle;
    cxStyle176: TcxStyle;
    cxStyle177: TcxStyle;
    cxStyle178: TcxStyle;
    cxStyle179: TcxStyle;
    cxStyle180: TcxStyle;
    cxStyle181: TcxStyle;
    cxStyle182: TcxStyle;
    cxStyle183: TcxStyle;
    cxStyle184: TcxStyle;
    cxStyle185: TcxStyle;
    cxStyle186: TcxStyle;
    cxStyle187: TcxStyle;
    cxStyle188: TcxStyle;
    cxStyle189: TcxStyle;
    cxStyle190: TcxStyle;
    cxStyle191: TcxStyle;
    cxStyle192: TcxStyle;
    cxStyle193: TcxStyle;
    cxStyle194: TcxStyle;
    cxStyle195: TcxStyle;
    cxStyle196: TcxStyle;
    cxStyle197: TcxStyle;
    cxStyle198: TcxStyle;
    cxStyle199: TcxStyle;
    cxStyle200: TcxStyle;
    cxStyle201: TcxStyle;
    cxStyle202: TcxStyle;
    cxStyle203: TcxStyle;
    cxStyle204: TcxStyle;
    cxStyle205: TcxStyle;
    cxStyle206: TcxStyle;
    cxStyle207: TcxStyle;
    cxStyle208: TcxStyle;
    cxStyle209: TcxStyle;
    cxStyle210: TcxStyle;
    cxStyle211: TcxStyle;
    cxStyle212: TcxStyle;
    cxStyle213: TcxStyle;
    cxStyle214: TcxStyle;
    cxStyle215: TcxStyle;
    cxStyle216: TcxStyle;
    DBCardStyle: TcxGridCardViewStyleSheet;
    DBBandedStyle: TcxGridBandedTableViewStyleSheet;
    DBOtherStyle: TcxGridBandedTableViewStyleSheet;
    DBMonitorStyle: TcxGridBandedTableViewStyleSheet;
    GridTableViewStyle: TcxGridTableViewStyleSheet;
    MyStyle: TcxGridTableViewStyleSheet;
    MyStyleTree: TcxTreeListStyleSheet;
    GridLngTranslate: TcxGrid;
    GridLngTranslateDBTableView1: TcxGridDBTableView;
    GridLngTranslateLevel1: TcxGridLevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmbCheckSelectLngPropertiesChange(Sender: TObject);
    procedure ButClearSelectCheckLngClick(Sender: TObject);
    procedure butSearchCountryClick(Sender: TObject);
    procedure EdSearchCountryKeyPress(Sender: TObject; var Key: Char);
    procedure butRefreshClick(Sender: TObject);
    procedure butEditTranslateClick(Sender: TObject);
    procedure butTranslateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PButRefreshClick(Sender: TObject);
    procedure PopupMenuPopup(Sender: TObject);
    procedure PButTranslateClick(Sender: TObject);
    procedure PButEditClick(Sender: TObject);
    procedure butSelectAllClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure butGridAutoWidthClick(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
    procedure ButTransliteralClick(Sender: TObject);
  private
    FElemLanguages :TDBShema;
    FElemTranslater :TDBShemaView;
    FElemOwner : TDBShema;
    FGridViewAutoWidth:Boolean;
    FGoogleTranslate : TGoogleTranslate;

    FAddSql : string;
    FAddSqlJoin : string;
    FCurrHitTestColOnPopUpMenu : TcxCustomGridTableItem;

    FFieldTranslateShema:TFieldTranslateShemaArr;
    FTitleOriginal:string;
    FcurrView:TcxGridDBBandedTableView;

    FDSTranslate:TDatasource;
    FLngIdent : TLngIdentArr;
    FLngIdentTemplateArr : TLngIdentTemplateArr;
    FCurrManager:Integer;
    //FGoogleTranslate : TGoogleTranslate;
    procedure FRefreshControls;
    procedure FAskTranslateSelected( IndexField:Integer; ShowMessageError:Boolean );
    procedure FAskTransliteSelected( IndexField:Integer; ShowMessageError:Boolean );
    function  FGetIndexFieldForColumn( aColumn:TcxCustomGridTableItem ):Integer;
    procedure FSetFocusOnView;
    function  FGetCurrentTranslateLngArr( IndexField:Integer ):TTranslateLngArr;
    function  FCheckFindOriginalText(IndexField:Integer; ShowMessageError:Boolean=False ):Boolean;
    procedure FTranslateSelected( IndexField:Integer; IdentOriginal:Widestring; OptTranslate: TTranslateOpt; ShowMessageError:Boolean = true  );
    procedure FViewCurrCellDblClick( Sender: TcxCustomGridTableView;
              ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
              AShift: TShiftState; var AHandled: Boolean);

    Function  FGetOriginalText( FieldName:String; View:TcxGridDBTableView ) :Variant;
    Function  FGetLngTexts( FieldName:String; View:TcxGridDBTableView;TableInd:Integer ):TTranslateTextLngArr;
    procedure ViewLngTraslateCustomDrawCell(Sender: TcxCustomGridTableView;
              ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);


    procedure FShowAllColumnInView( View:TcxGridDBTableView;aShow:Boolean;IdLan:Integer=-1 );
    procedure FPrepareShowTranslateColumn(CmbCheck: TcxCheckComboBox; View:TcxGridDBTableView  );

    function  FGetObjLngById(idLng:Integer):TLngIdent;
    procedure FGetListIdLng;
    procedure FDestroyLngIdentArr;
    procedure FPrepare( FieldTranslateShema:TFieldTranslateShemaArr );
    function  FCreateView( aElem:TDBShema; FieldTranslateShema:TFieldTranslateShemaArr; aLngIdent : TLngIdentArr ):TcxGridDBBandedTableView;

    function  FMakeSQL(  aLngIdent : TLngIdentArr; FieldTranslateShema:TFieldTranslateShemaArr ):Widestring;
    Function  FGenFNameForTranslate( FieldMainTable,IdLng:String ):string;
    procedure FPreparareChoiceLng;
    function  FGetCurrOriginaltext( IndexField:Integer ):Variant;
    procedure FUpdateToolActions( Value:Integer );
    { Private declarations }
  public

    procedure ShowEditTranslate( IndexField:Integer; ShowMessageError:Boolean =false );
    procedure RefreshViewColumn;

  published
    property EnabledUpdate:Integer write FUpdateToolActions;
    { Public declarations }
  end;


 procedure ShowLngTranslate( aElemOwner : TDBShema;aGoogleTranslate : TGoogleTranslate; FieldTranslateShema:TFieldTranslateShemaArr; TitleOriginal:string;
                            GridViewAutoWidth:Boolean; WithForm,CurrManager:Integer; AddSql:string=''; AddSqlJoin:string='' ) ;

 procedure AddLngFieldColumnToShema( var FieldTranslateShema:TFieldTranslateShemaArr; ElemMain:TDBShema;
                                     FieldNameOwnerTable:string;
                                     FieldRealNameMainTable:string='';
                                     FieldIdRelWithOwnerTable:String='' );
var
  FrmLngTranslate: TFrmLngTranslate;

implementation

uses
  FrmProgress;

{$R *.dfm}
procedure ShowLngTranslate(  aElemOwner : TDBShema;aGoogleTranslate : TGoogleTranslate;  FieldTranslateShema:TFieldTranslateShemaArr; TitleOriginal:string;
                             GridViewAutoWidth:Boolean; WithForm,CurrManager:Integer; AddSql:string=''; AddSqlJoin:string='' );
begin
  try
    Application.CreateForm( TFrmLngTranslate, FrmLngTranslate );
    FrmLngTranslate.FCurrManager := CurrManager;

    if WithForm<>-1 then FrmLngTranslate.Width := WithForm;

    FrmLngTranslate.FAddSql := AddSql;
    FrmLngTranslate.FAddSqlJoin := AddSqlJoin;
    FrmLngTranslate.FElemOwner := aElemOwner;
    FrmLngTranslate.FGoogleTranslate := aGoogleTranslate;
    FrmLngTranslate.FTitleOriginal := TitleOriginal;
    FrmLngTranslate.FGridViewAutoWidth := GridViewAutoWidth;
    FrmLngTranslate.FFieldTranslateShema := FieldTranslateShema;

    FrmLngTranslate.FPrepare( FrmLngTranslate.FFieldTranslateShema );
    FrmLngTranslate.FUpdateToolActions( FrmLngTranslate.FCurrManager );

    FrmLngTranslate.ShowModal;
    aElemOwner.Requery(True);

  finally


    FreeAndNil( FrmLngTranslate );//.Free;
  end;
end;


procedure AddLngFieldColumnToShema( var FieldTranslateShema:TFieldTranslateShemaArr; ElemMain:TDBShema;
                                  FieldNameOwnerTable:string;
                                  FieldRealNameMainTable:string='';
                                  FieldIdRelWithOwnerTable:String='' );
var Len:Integer;
begin
  if FieldRealNameMainTable = '' then FieldRealNameMainTable := FieldNameOwnerTable;

  Len := Length( FieldTranslateShema );
  SetLength( FieldTranslateShema, Len+1 );
  FieldTranslateShema[len].ElemMain := ElemMain;
  FieldTranslateShema[len].FieldNameOwnerTable := FieldNameOwnerTable;
  FieldTranslateShema[len].FieldRealNameMainTable := FieldRealNameMainTable;
  FieldTranslateShema[len].FieldIdRelWithOwnerTable := FieldIdRelWithOwnerTable;
end;

Function TFrmLngTranslate.FGenFNameForTranslate( FieldMainTable,IdLng:String ):string;
begin
  result := GenFNameForTranslate( FieldMainTable,IdLng );
end;

function TFrmLngTranslate.FMakeSQL( aLngIdent : TLngIdentArr; FieldTranslateShema:TFieldTranslateShemaArr ):Widestring;
var i,j:Integer;
    SqlId:String;
    Sql,Sql2,SqlJoin:String;
    SqlParent:string;
    Sep,Sep2:string[1];
    CurrParam:TTranslateOptions;
begin
  SqlId:='';
  Sql  :='';
  Sql2 :='';
  SqlJoin:='';
  Sep:=',';
  for i:=0 to Length(FieldTranslateShema)-1 do
  begin
    CurrParam := FieldTranslateShema[i].ElemMain.GetParamTranslateTableByFiedlName( FieldTranslateShema[i].FieldRealNameMainTable );

    Sql :=Sql + MakeSQLPartForLngColumn( FElemOwner, CurrParam, aLngIdent,
                                         FieldTranslateShema[i].ElemMain.FieldKod,
                                         FieldTranslateShema[i].FieldNameOwnerTable );

    SqlId := SqlId + FieldTranslateShema[i].ElemMain.TableName+'.'+  FieldTranslateShema[i].ElemMain.FieldKod+Sep;
    Sql2 := Sql2 + FieldTranslateShema[i].ElemMain.TableName+'.'+FieldTranslateShema[i].FieldRealNameMainTable+' '+FieldTranslateShema[i].FieldNameOwnerTable+Sep;

    if FieldTranslateShema[i].ElemMain <> self.FElemOwner then
      SqlJoin := SqlJoin + ' left join '+FieldTranslateShema[i].ElemMain.TableName+' on '+FieldTranslateShema[i].ElemMain.TableName+'.'+
      FieldTranslateShema[i].ElemMain.FieldKod+'='+self.FElemOwner.TableName+'.'+FieldTranslateShema[i].FieldIdRelWithOwnerTable;
  end;
                                     
  if SqlId[Length(SqlId)]=',' then Delete( SqlId,Length(SqlId), 1 );
  if Sql[Length(Sql)] = ',' then Delete( Sql,Length(Sql), 1 );
  if Sql2[Length(Sql2)] = ',' then Delete( Sql2,Length(Sql2), 1 );

  SqlParent :='';
  if FElemOwner.MainElement<>nil then SqlParent := ' WHERE '+FElemOwner.TableName+'.'+FElemOwner.FieldMainKod +'='+FElemOwner.MainElement.GetValueIdStr + MyIfThen( FAddSql<>'',' and '+FAddSql, '' )
  else SqlParent:=MyIfThen(FAddSql<>'',' where '+FAddSql, '');

  result := ' select ' + SqlId+',' + Sql2 + MyIfThen(Sql<>'',','+ Sql,'')+ ' FROM '+FElemOwner.TableName+' '+SqlJoin+' '+FAddSqlJoin+'  '+SqlParent; //' and '+FElemOwner.TableName+'.NAME like ''%`%''';
end;

function TFrmLngTranslate.FCreateView( aElem:TDBShema; FieldTranslateShema:TFieldTranslateShemaArr; aLngIdent : TLngIdentArr ):TcxGridDBBandedTableView;
var i,j:Integer;
    aCol:TcxGridDBBandedColumn;
    aWidthCol:Integer;
    StartIndCol:Integer;
    CurrFieldName:string;
    aBand:TcxGridBand;
    CurrParam:TTranslateOptions;
    CurrWidthColumn:Integer;
begin
  if self.name = '' then exit;
  
  result:=TcxGridDBBandedTableView.Create( aElem.DB.Owner );
  result.Name := aElem.DB.Name+'_Translate'+IntToStr( Random(100) );
  result.Filtering.Visible:=fvNever;
  result.DataController. DataSource := FDSTranslate;
  result.OptionsView.GroupByBox := False;
  result.OptionsView.ColumnAutoWidth := FGridViewAutoWidth;
  result.OptionsSelection.CellSelect := False;
  result.OptionsSelection.MultiSelect := True;
  result.OptionsData.Editing := False;
  result.OnCustomDrawCell := ViewLngTraslateCustomDrawCell;
  result.OnCellDblClick := FViewCurrCellDblClick;

  result.Styles := TcxGridBandedTableViewStyles(MyStyle.Styles);
  result.Styles.BandHeader := result.Styles.Header;
  result.OptionsBehavior.CellHints := True;
  result.PopupMenu := PopupMenu;
  
  StartIndCol := 0;
  //***********Create Id in View***************
  aCol := CreateBandedColumnOnView( result, FElemOwner.FieldKod,0, 0, FieldColumnWidth(FElemOwner,FElemOwner.FieldKod) );
  aCol.Visible := FieldColumnVisible(FElemOwner, FElemOwner.FieldKod );

  result.DataController.KeyFieldNames := FElemOwner.FieldKod;
  //*******************************************
  inc(StartIndCol);
  
  for i:=0 to Length(FieldTranslateShema)-1 do
  begin
    CurrParam := FieldTranslateShema[i].ElemMain.GetParamTranslateTableByFiedlName( FieldTranslateShema[i].FieldRealNameMainTable );
    CurrWidthColumn := FieldColumnWidth( FElemOwner, FieldTranslateShema[i].FieldNameOwnerTable ); //FElemOwner.View.GetColumnByFieldName(FieldTranslateShema[i].FieldNameOwnerTable).Width;
    if CurrParam.WidthColum<>-1 then CurrWidthColumn := CurrParam.WidthColum;

    aBand:= result.Bands.Add;
    aBand.Caption := FieldColumnCaption(FElemOwner,FieldTranslateShema[i].FieldNameOwnerTable); //FElemOwner.View.GetColumnByFieldName( FieldTranslateShema[i].FieldNameOwnerTable ).Caption;
    aBand.Tag := i;

    // Create Column Id Main table To Translate Table
    aCol := CreateBandedColumnOnView( result,  FieldTranslateShema[i].ElemMain.FieldKod, aBand.Index, StartIndCol, 30 );
    aCol.Visible := False;
    aCol.Name:='ViewColumn'+  FElemOwner.FieldKod+'_'+IntToStr(i);

    inc(StartIndCol);
    aCol := CreateBandedColumnOnView( result, FieldTranslateShema[i].FieldNameOwnerTable, aBand.Index, StartIndCol, CurrWidthColumn );
    aCol.Visible := True;
    aCol.Caption := FTitleOriginal;
    aCol.Name := 'ViewColumn'+ FieldTranslateShema[i].FieldNameOwnerTable+'_'+IntToStr(i);
    inc(StartIndCol);

    //*******Column For Translate***************
    for j:=0 to Length(aLngIdent)-1 do
    begin
      CurrFieldName := FGenFNameForTranslate( FieldTranslateShema[i].FieldNameOwnerTable, IntToStr( aLngIdent[j].id ) );
      aCol := CreateBandedColumnOnView( result, CurrFieldName, aBand.Index, StartIndCol, CurrWidthColumn );
      aCol.Visible := True;
      aCol.Caption := aLngIdent[j].lngName;
      aCol.Tag  :=  aLngIdent[j].id ;
      aCol.Name := 'ViewColumn'+ CurrFieldName+'_'+IntToStr(i);
      inc(StartIndCol);
    end;

    StartIndCol:=0;
  end;
end;

procedure TFrmLngTranslate.FGetListIdLng;
begin
  FLngIdent := GetListIdLng( FElemLanguages );
  Try
  FLngIdentTemplateArr := GetListTeplatesForIdLng( FFieldTranslateShema );
  except
  end;  
end;

procedure TFrmLngTranslate.FDestroyLngIdentArr;
var i:integer;
begin
  for i:=0 to Length(FLngIdentTemplateArr)-1 do
    FLngIdentTemplateArr[i].DelWords.Free;
end;

function TFrmLngTranslate.FGetObjLngById( idLng:Integer ) : TLngIdent;
begin
  result := GetObjLngById( FLngIdent, idLng );
end;

procedure TFrmLngTranslate.FPreparareChoiceLng;
var ParamConnect:TConnectDBParam;
begin
  ParamConnect:= FElemOwner.DBGetParamConnect;
  FElemLanguages := MakeElemActiveLng( ParamConnect );
end;

procedure TFrmLngTranslate.FPrepare( FieldTranslateShema:TFieldTranslateShemaArr  );
var i:Integer;
    ParamConnect:TConnectDBParam;
    SqlDB:String;
    FListLngCaption:TStringList;
    FDBTranslate:TIBQuery;
    Progres:TProgressFormProp;
begin
  try
    Progres := ShowProgress( WaitFormCaption );

    FPreparareChoiceLng;
    FElemLanguages.DBOpen;
    ParamConnect := FElemOwner.DBGetParamConnect;
    FGetListIdLng;

   { if FElemOwner is TDBShemaView then
      PageControl.ActivePage := TabView;

    if FElemOwner is TDBShemaTree then
      PageControl.ActivePage := TabTree;

    PageControl.HideTabs := True; }
    PrepareIdentLngCmBox( FLngIdent, ImCmbIdentOrigialLng, 'uk' );

    try
      FListLngCaption := TStringList.Create;
      for i:=0 to Length(self.FLngIdent)-1 do
        FListLngCaption.Add( self.FLngIdent[i].lngName );

      FillDataCheckBox( CmbCheckSelectLng, FListLngCaption );

      SqlDB := Self.FMakeSQL( FLngIdent,  FieldTranslateShema );
      FDBTranslate := CreateDataSet( ParamConnect.PathDB, ParamConnect.UID,ParamConnect.Password,nil, SqlDB );
      FDBTranslate.FetchAll;

      FDSTranslate := TDatasource.Create(self);
      FDSTranslate.DataSet := FDBTranslate;

      FcurrView := FCreateView( FElemOwner, FieldTranslateShema, FLngIdent );
      GridLngTranslate.Levels[0].GridView := FcurrView;

      FElemTranslater :=TDBShemaView.Create( FDBTranslate, TcxGridDBTableView(FcurrView) , self.FElemOwner.TableName, FElemOwner.FieldKod, FElemOwner.GeneratorIdName );

      RefreshViewColumn;
    finally
     FListLngCaption.Free;
    end;

    FRefreshControls;
  finally
    ClosedProgress(Progres.FormProgres)
  end;
end;

procedure TFrmLngTranslate.FormClose(Sender: TObject;
  var Action: TCloseAction);
var FDB:TDataset;
begin
  if Self.FElemTranslater<> nil then
  begin
    FElemTranslater.SetView( nil );
    FDB :=  self.FElemTranslater.DB ;
    self.FElemTranslater.Close;
    DestroyDB( FDB );
    self.FcurrView.Free;
  end;

  if self.FElemLanguages<>nil then Self.FElemLanguages.Close;
  if self.FDSTranslate<>nil then self.FDSTranslate.Free;
  FDestroyLngIdentArr;

  GridLngTranslate.Levels[0].GridView.Free;
  GridLngTranslate.Levels[0].GridView := nil;
end;

procedure TFrmLngTranslate.FShowAllColumnInView( View:TcxGridDBTableView; aShow:Boolean; IdLan:Integer=-1  );
var i:Integer;
begin
  for i:=0 to View.ColumnCount - 1 do
  begin
    if ( View.Columns[i].DataBinding.FieldName <> View.DataController.KeyFieldNames ) and ( View.Columns[i].Tag<>0 ) then
    begin
      if IdLan = -1 then View.Columns[i].Visible := aShow
      else
       if View.Columns[i].Tag = IdLan then View.Columns[i].Visible := aShow;
    end;
  end;
end;

procedure TFrmLngTranslate.FPrepareShowTranslateColumn( CmbCheck: TcxCheckComboBox; View:TcxGridDBTableView );
var i:Integer;
    CurrFieldName:string;
begin
  FShowAllColumnInView( View, CmbCheck.EditValue=0 );

  for i:=0 to Length(self.FLngIdent) - 1 do
   if CheckDataInSelectCheckBox( CmbCheck, self.FLngIdent[i].lngName ) then
     FShowAllColumnInView( View, True, self.FLngIdent[i].id );
end;

procedure TFrmLngTranslate.RefreshViewColumn;
begin
  FPrepareShowTranslateColumn( CmbCheckSelectLng , TcxGridDBTableView(GridLngTranslate.Levels[0].GridView) );
end;

procedure TFrmLngTranslate.CmbCheckSelectLngPropertiesChange( Sender: TObject);
begin
  RefreshViewColumn;
end;

procedure TFrmLngTranslate.ButClearSelectCheckLngClick(Sender: TObject);
begin
  CmbCheckSelectLng.EditValue :=0;
end;

procedure TFrmLngTranslate.butSearchCountryClick(Sender: TObject);
begin
   SearchTextOnViewByAllColumns( TcxGridDBTableView( GridLngTranslate.Levels[0].GridView ), EdSearchCountry.Text );
end;

procedure TFrmLngTranslate.EdSearchCountryKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then butSearchCountry.Click;
end;

procedure TFrmLngTranslate.FSetFocusOnView;
begin
  self.FcurrView.DataController.GotoFirst;
  if self.FcurrView.ViewData.RowCount>0 then
  begin
    self.FcurrView.ViewData.Rows[0].Focused := true;
    self.FcurrView.ViewData.Records[0].Selected := true;
  end;
end;

procedure TFrmLngTranslate.butRefreshClick(Sender: TObject);
begin
   FElemLanguages.Requery;
   
   FElemTranslater.SaveMarkID;
   FElemTranslater.Requery;
   FElemTranslater.GotoMarkID;
end;

procedure TFrmLngTranslate.ViewLngTraslateCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
  ViewDrawFillRect(Sender, AViewInfo, ACanvas );
  if ( not AViewInfo.Focused )and( not AViewInfo.Selected ) then
  begin
    if AViewInfo.Item.Tag = 0 then ACanvas.Brush.Color := $00CCFFFF
    else ACanvas.Brush.Color := $00F0FFFF;
  end;
end;

Function TFrmLngTranslate.FGetLngTexts( FieldName:String; View:TcxGridDBTableView; TableInd:Integer ) : TTranslateTextLngArr;
var i:Integer;
    len:Integer;
    CurrIdLen:WideString;
    IdLng:Integer;
    LngIdent : TLngIdent;
    CurrItentTempl:TLngIdentTemplate;
begin
  for i:=0 to View.ColumnCount - 1 do
  begin
    if (View.Columns[i].Tag <> 0) and( AnsiPos('lng_'+FieldName+'_', View.Columns[i].DataBinding.FieldName ) <> 0 ) then
    begin
      CurrIdLen:= View.Columns[i].DataBinding.FieldName;
      ReplaseON( CurrIdLen, 'lng_'+FieldName+'_', '' );
      IdLng := StrToInt(CurrIdLen);
      LngIdent := FGetObjLngById( idLng );

      if ( CheckDataInSelectCheckBox( CmbCheckSelectLng, LngIdent.lngName ) )or
         ( CmbCheckSelectLng.EditValue = 0 ) then
      begin
        len := Length(Result);
        SetLength(Result,len+1);
        Result[len].TableInd         := TableInd;
        Result[len].LngIdent.id      := IdLng;
        Result[len].LngIdent.lngName := FGetObjLngById( Result[len].LngIdent.id ).lngName;
        Result[len].LngIdent.Ident   := FGetObjLngById( Result[len].LngIdent.id ).Ident;
        Result[len].Text             := VarToStr( View.DataController.Controller.FocusedRecord.Values[i]) ;

        CurrItentTempl               := GetObjLngIdentTemplateById( FLngIdentTemplateArr, TableInd , Result[len].LngIdent.id );
        Result[len].Template         := CurrItentTempl.Template;
        Result[len].UpperCase        := CurrItentTempl.UpperCase;

        Result[len].DelWords         := CurrItentTempl.DelWords;
      end;
    end;
  end;
end;

Function TFrmLngTranslate.FGetOriginalText( FieldName:String; View:TcxGridDBTableView ) :Variant;
var i:Integer;
begin
  for i:=0 to View.ColumnCount - 1 do
  begin
    if ( View.Columns[i].Tag = 0 ) and ( View.Columns[i].DataBinding.FieldName = FieldName ) then
    begin
      result := View.DataController.Controller.FocusedRecord.Values[i];
      break;
    end;
  end;
end;

function TFrmLngTranslate.FGetCurrentTranslateLngArr( IndexField:Integer ):TTranslateLngArr;
var indKeyField:Integer;
    TableInd :Integer;
    CurrParam : TTranslateOptions;
begin
  indKeyField := self.FcurrView.GetColumnByFieldName(  FFieldTranslateShema[IndexField].ElemMain.FieldKod ).Index;
  if self.FcurrView.DataController.Controller.FocusedRecord.Values[indKeyField] = null then Exit;

  CurrParam := FFieldTranslateShema[IndexField].ElemMain.GetParamTranslateTableByFiedlName( FFieldTranslateShema[IndexField].FieldRealNameMainTable );
  result.idMainTableRelWithTransalteTable := self.FcurrView.DataController.Controller.FocusedRecord.Values[indKeyField];
  result.FieldNameInTranslateTableName := FFieldTranslateShema[IndexField].FieldRealNameMainTable;

  result.lngTexts := FGetLngTexts( FFieldTranslateShema[IndexField].FieldNameOwnerTable, TcxGridDBTableView( self.FcurrView), CurrParam.IndTableTemplate );
  result.ElemMain := FFieldTranslateShema[IndexField].ElemMain;
end;

function TFrmLngTranslate.FGetCurrOriginaltext( IndexField:Integer ):Variant;
begin
  result := FGetOriginalText( FFieldTranslateShema[IndexField].FieldNameOwnerTable, TcxGridDBTableView( self.FcurrView)  ) ;
end;

procedure TFrmLngTranslate.ShowEditTranslate( IndexField:Integer; ShowMessageError:Boolean = false );
var ParamTextLng:TTranslateLngArr;
    OriginalText:Variant;
    SaveFieldIdName:String;
begin
  ParamTextLng := FGetCurrentTranslateLngArr( IndexField );
  if FCheckFindOriginalText( IndexField, ShowMessageError ) then
  begin
    OriginalText := VarToStr( FGetCurrOriginaltext( IndexField ) );

    if ShowTranslateEditText( OriginalText , ParamTextLng, MyStyle.Styles, ImCmbIdentOrigialLng.Text ) then
      FElemTranslater.RequeryCurrentRecord;
  end;
end;

procedure TFrmLngTranslate.butEditTranslateClick(Sender: TObject);
begin
  ShowEditTranslate( 0, True  );
end;

function TFrmLngTranslate.FGetIndexFieldForColumn(aColumn:TcxCustomGridTableItem):Integer;
begin
if aColumn is TcxGridDBBandedColumn then
    result := TcxGridDBBandedColumn(aColumn).Position.Band.Tag
  else result := 0;
end;

procedure TFrmLngTranslate.FViewCurrCellDblClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
var indexField:Integer;
begin
  if butEditTranslate.Enabled then
  begin
    indexField := FGetIndexFieldForColumn(ACellViewInfo.Item );
    ShowEditTranslate( indexField, True );
  end;
end;

function TFrmLngTranslate.FCheckFindOriginalText( IndexField:Integer; ShowMessageError:Boolean=False ):Boolean;
var OriginalText:WideString;
begin
  OriginalText := VarToStr( FGetCurrOriginaltext( IndexField ) );
  result:= CheckOnOriginalText( OriginalText, ShowMessageError );
end;

procedure TFrmLngTranslate.FTranslateSelected( IndexField:Integer; IdentOriginal:Widestring; OptTranslate: TTranslateOpt; ShowMessageError:Boolean = true );
var i,j : Integer;
    //Progres : TProgressFormProp;
    ParamTextLng:TTranslateLngArr;
    CurrTranslate:Variant;
    CurrSaveParam:TTranslateTextLngArr;
    CurrLngIdentTemplate:TLngIdentTemplate;
    ParamConnect:TConnectDBParam;
    OriginalText:Variant;
    CurrParam : TTranslateOptions;
    TableInd:Integer;
begin
  ParamConnect:= FElemOwner.DBGetParamConnect;

  try
    //Progres := ShowProgress( WaitTranslate , self.FcurrView.DataController.Controller.SelectedRecordCount );
    LockControl( GridLngTranslate, True );
    self.FElemTranslater.ViewSaveSortColumn;
    self.FElemTranslater.ViewSetSortByField('');

    for i:=0 to self.FcurrView.DataController.Controller.SelectedRecordCount-1 do
    begin
      self.FcurrView.DataController.Controller.SelectedRecords[i].Focused := True;

      if FCheckFindOriginalText(IndexField, ShowMessageError ) then
      begin
       OriginalText := VarToStr( FGetCurrOriginaltext( IndexField ) );
       ParamTextLng := FGetCurrentTranslateLngArr( IndexField );

       //Progres.ProgressCaption.Caption := WaitTranslate+'( '+OriginalText+' )';
       SetLength( CurrSaveParam, Length( ParamTextLng.lngTexts) );

       CurrParam := FFieldTranslateShema[IndexField].ElemMain.GetParamTranslateTableByFiedlName( FFieldTranslateShema[IndexField].FieldRealNameMainTable );
       TableInd := CurrParam.IndTableTemplate;

       for j:= 0 to Length(ParamTextLng.lngTexts) - 1 do
       begin
          if OptTranslate = TrOptTranslate then
            if OriginalText <> '' then
              CurrTranslate := TranslateData( WaitTranslate+'( '+OriginalText+' )', TableInd, IdentOriginal, OriginalText,
                                              ParamTextLng.lngTexts[j].LngIdent.Ident , ParamTextLng, i+1, self.FcurrView.DataController.Controller.SelectedRecordCount )
            else CurrTranslate := null;

          if OptTranslate = TrOptTranslite then
            if OriginalText<>'' then
              CurrTranslate := TranslitData( TableInd, IdentOriginal, OriginalText, ParamTextLng.lngTexts[j].LngIdent.Ident, ParamTextLng )
            else CurrTranslate := null;

          CurrSaveParam[j].Text := CurrTranslate;
          CurrSaveParam[j].LngIdent.id      := ParamTextLng.lngTexts[j].LngIdent.id;
          CurrSaveParam[j].LngIdent.lngName := ParamTextLng.lngTexts[j].LngIdent.lngName;
          CurrSaveParam[j].LngIdent.Ident   := ParamTextLng.lngTexts[j].LngIdent.Ident;

          CurrLngIdentTemplate := GetObjLngIdentTemplateById( FLngIdentTemplateArr, TableInd , ParamTextLng.lngTexts[j].LngIdent.id );
          CurrSaveParam[j].Template := CurrLngIdentTemplate.Template;
          CurrSaveParam[j].UpperCase:= CurrLngIdentTemplate.UpperCase;
          CurrSaveParam[j].DelWords := CurrLngIdentTemplate.DelWords;
       end;

       if SaveDataTranslate( FFieldTranslateShema[IndexField].ElemMain , ParamTextLng, CurrSaveParam  ) then
         if ChAutoRefreshAfterTranslate.checked then
           FElemTranslater.RequeryCurrentRecord;
      end;

      //Progres.ProgressBar.Position:=Progres.ProgressBar.Position+1;
      //Progres.ProgressCaption.Refresh;
      //Progres.ProgressCaption.Repaint;
    end;

  finally
    self.FElemTranslater.ViewRestoreSortColumn;
    LockControl( GridLngTranslate, False );
    // ClosedProgress( Progres.FormProgres );
  end;
  
end;

procedure TFrmLngTranslate.FAskTranslateSelected( IndexField:Integer; ShowMessageError:Boolean );
begin
  if MyShowMessageDlg( MessageAskTranslateText, mtConfirmation, but_YES_NO ) = Res_YES then
    FTranslateSelected( IndexField, ImCmbIdentOrigialLng.Text,TrOptTranslate, ShowMessageError );
end;

procedure TFrmLngTranslate.butTranslateClick(Sender: TObject);
begin
  FAskTranslateSelected( 0, False );
end;

procedure TFrmLngTranslate.FAskTransliteSelected( IndexField:Integer; ShowMessageError:Boolean );
begin
  if MyShowMessageDlg( MessageAskTranslitText, mtConfirmation, but_YES_NO ) = Res_YES then
    FTranslateSelected( IndexField, ImCmbIdentOrigialLng.Text,TrOptTranslite, ShowMessageError );
end;

procedure TFrmLngTranslate.ButTransliteralClick(Sender: TObject);
begin
  FAskTransliteSelected( 0, False );
end;

procedure TFrmLngTranslate.FormShow(Sender: TObject);
begin
  FSetFocusOnView;
end;

procedure TFrmLngTranslate.PButRefreshClick(Sender: TObject);
begin
  butRefresh.Click;
end;

procedure TFrmLngTranslate.PopupMenuPopup(Sender: TObject);
var aCurrHitTest : TcxCustomGridHitTest;
    Mouse:TPoint;
    indexField:Integer;
begin
   GetCursorPos( Mouse );
   with  self.FcurrView.Site.ScreenToClient( Mouse ) do
   begin
     aCurrHitTest:= self.FcurrView.GetHitTest( X, Y );
     FCurrHitTestColOnPopUpMenu := TcxGridRecordCellHitTest( aCurrHitTest ).Item;
     indexField := FGetIndexFieldForColumn( FCurrHitTestColOnPopUpMenu );

     PButEdit.Enabled:= FCheckFindOriginalText(IndexField, False );
     PButTranslate.Enabled:= PButEdit.Enabled;
   end;
end;

procedure TFrmLngTranslate.PButTranslateClick(Sender: TObject);
var indexField:Integer;
begin
  indexField := FGetIndexFieldForColumn( FCurrHitTestColOnPopUpMenu );
  FAskTranslateSelected( IndexField, false);
end;

procedure TFrmLngTranslate.PButEditClick(Sender: TObject);
var indexField:Integer;
begin
  indexField := FGetIndexFieldForColumn( FCurrHitTestColOnPopUpMenu );
  ShowEditTranslate( indexField, True  );
end;

procedure TFrmLngTranslate.butSelectAllClick(Sender: TObject);
begin
  self.FcurrView.DataController.Controller.SelectAll;
end;

procedure TFrmLngTranslate.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_F12)and ( ssCtrl in Shift  ) then
    ChAutoRefreshAfterTranslate.Visible := not ChAutoRefreshAfterTranslate.Visible;
end;

procedure TFrmLngTranslate.FRefreshControls;
begin
  butEditTranslate.Enabled := (FElemTranslater.View.DataController.RowCount<>0) and (self.FCurrManager >0);
  butTranslate.Enabled := (FElemTranslater.View.DataController.RowCount<>0) and (self.FCurrManager >0);
  ButTransliteral.Enabled := (FElemTranslater.View.DataController.RowCount<>0) and (self.FCurrManager >0);
  butSelectAll.Enabled := (FElemTranslater.View.DataController.RowCount<>0) and (self.FCurrManager >0);
  butGridAutoWidth.Down := (FElemTranslater.View.OptionsView.ColumnAutoWidth) and (self.FCurrManager >0);
end;

procedure TFrmLngTranslate.butGridAutoWidthClick(Sender: TObject);
begin
  FElemTranslater.View.OptionsView.ColumnAutoWidth := butGridAutoWidth.Down;
end;

procedure TFrmLngTranslate.OkBtnClick(Sender: TObject);
begin
  self.ModalResult := mrOk;
end;

procedure TFrmLngTranslate.FUpdateToolActions(Value: Integer);
begin
  self.FCurrManager := Value;
  FRefreshControls;
end;



end.

select provinces_lng.ID, provinces_lng.name, COUNTRIES.name,
(select first 1 NAME from COUNTRIES_LNG where COUNTRIES.countryid=COUNTRIES_LNG.id_countries and provinces_lng.id_lng = COUNTRIES_LNG.id_lng ) Country_lng
 from provinces_lng
left join  provinces on provinces_lng.id_provinces =  provinces.provinceid
left join COUNTRIES on COUNTRIES.countryid = provinces.countryid
order by provinces_lng.id_provinces

