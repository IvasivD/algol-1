unit UnitLngTranslateEdit;

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
  cxButtonEdit, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, dxmdaset, StdCtrls, Buttons, ExtCtrls, cxGridLevel, cxClasses,
  cxGridCustomView, ImgList,UnitEditText,UnitIBQuery,UnitGTranslate,
  cxContainer, cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxTextEdit,IBQuery,UnitProc,Core,OptSet,
  cxPCdxBarPopupMenu, cefvcl, cxPC, ceflib, OleCtrls, SHDocVw,FrmProgress,UnitADOQuery,ADODB,IBCustomDataSet;

const MessageAskTranslateText = 'Ви дійсно хочете зробити переклад по виділених позиціях?';
      MessageAskTranslitText  = 'Ви дійсно хочете транслітерувати по виділених позиціях?';
      MeesageOriginalNotFound = 'Оригінального тексту потрібного для перекладу не знайдено!';
      MessNotSelectLNGDescript ='Не вибрано мови для редагування і перегляду.';
      MessFileTranslateForLngNotFound = 'Не знайдено файл - переклад для вибраної мови.';
      WaitTranslate = 'Переклад';
type
  TFieldTranslateShema = record
     ElemMain: TDBShema;
     FieldNameOwnerTable : string;
     FieldRealNameMainTable : string;
     FieldTranslateId: string;
     FieldIdRelWithOwnerTable:string;
  end;
  TFieldTranslateShemaArr = array of TFieldTranslateShema;

  TLngIdent = record
    id:Integer;
    lngName:string;
    Ident:string;
  end;
  TLngIdentArr = array of TLngIdent;

  TLngIdentTemplate = record
    LngIdent:TLngIdent;
    TableInd:Integer;
    Template:string;
    DelWords:TStringList;
    UpperCase:Integer;  // 0- default 1- UpperCase  2- LowerCase 
  end;
  TLngIdentTemplateArr = array of TLngIdentTemplate;

  TTranslateTextLng = record
    LngIdent:TLngIdent;
    Text:WideString;
    TableInd:Integer;
    Template:string;
    DelWords:TStringList;
    UpperCase:Integer;  // 0- default 1- UpperCase  2- LowerCase
  end;
  TTranslateTextLngArr = array of TTranslateTextLng;

  TTranslateLngArr = record
    idMainTableRelWithTransalteTable:Variant;
    FieldNameInTranslateTableName :string;
    lngTexts : TTranslateTextLngArr;
    ElemMain : TDBShema;
  end;

  
  TFrmLngTranslateEdit = class(TForm)
    CtrlPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    MemDatTranslate: TdxMemData;
    MemDatTranslatename: TStringField;
    MemDatTranslateSrc: TDataSource;
    ViewRepositary: TcxGridViewRepository;
    ViewLngTranslate: TcxGridDBTableView;
    ViewLngTranslateRecId: TcxGridDBColumn;
    ViewLngTranslateid: TcxGridDBColumn;
    ViewLngTranslatename: TcxGridDBColumn;
    ViewLngTranslatelngName: TcxGridDBColumn;
    MemDatTranslatelngName: TStringField;
    ImageListIcon: TImageList;
    MemDatTranslateidlng: TIntegerField;
    Panel1: TPanel;
    butTranslate: TSpeedButton;
    ViewLngTranslateidlng: TcxGridDBColumn;
    MemDatTranslateIdent: TStringField;
    ViewLngTranslateIdent: TcxGridDBColumn;
    EdOriginalText: TcxTextEdit;
    LabelTextOriginal: TLabel;
    ImCmbIdentOrigialLng: TcxImageComboBox;
    butSelectAll: TSpeedButton;
    MemDatTranslateTmpl: TStringField;
    ButTransliteral: TSpeedButton;
    MemDatTranslateUpperCase: TIntegerField;
    MemDatTranslateTableInd: TIntegerField;
    ViewLngTranslateTmpl: TcxGridDBColumn;
    ViewLngTranslateUpperCase: TcxGridDBColumn;
    ViewLngTranslateTableInd: TcxGridDBColumn;
    PageControl: TcxPageControl;
    TabTranslateText: TcxTabSheet;
    TabTranslateHTML: TcxTabSheet;
    GridLngTranslate: TcxGrid;
    GridLngTranslateDBTableView1: TcxGridDBTableView;
    GridLngTranslateLevel1: TcxGridLevel;
    ViewLngTranslateHTML: TcxGridDBTableView;
    ViewLngTranslateHTMLRecId: TcxGridDBColumn;
    ViewLngTranslateHTMLidlng: TcxGridDBColumn;
    ViewLngTranslateHTMLlngName: TcxGridDBColumn;
    ViewLngTranslateHTMLaText: TcxGridDBColumn;
    ViewLngTranslateHTMLIdent: TcxGridDBColumn;
    ViewLngTranslateHTMLTmpl: TcxGridDBColumn;
    ViewLngTranslateHTMLUpperCase: TcxGridDBColumn;
    ViewLngTranslateHTMLTableInd: TcxGridDBColumn;
    GridLngTranslateHTMLDBTableView1: TcxGridDBTableView;
    GridLngTranslateHTMLLevel1: TcxGridLevel;
    GridLngTranslateHTML: TcxGrid;
    WebBrowserLngText: TChromium;
    WebBrowserParse: TWebBrowser;
    butEditDecript: TSpeedButton;
    procedure ViewLngTranslateCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure ViewLngTranslateFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure ViewLngTranslateCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure butTranslateClick(Sender: TObject);
    procedure butSelectAllClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButTransliteralClick(Sender: TObject);
    procedure ViewLngTranslateHTMLFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure butEditDecriptClick(Sender: TObject);
  private
    FTextOriginal : Variant;
    FElem : TDBShema;
    FFieldName :string;
    FParamTextLng : TTranslateLngArr;
    FDefIdent     : string;
    FOptTranslateText :TOptTranslateText;
    FRootPathToFile : string;
    FPathToImages   : string;
    FFileTextOriginal :string;
    FGoogleTranslateElem : TGoogleTranslate;
    FWebSourcePath:string;
    procedure FTranslitCurrText;
    function  FTranslateCurrentViewRec(CaptionTranslate:Widestring; RecIndex:Integer; ProgressBarPos:Integer=-1;ProgresBarMax:Integer =-1  ):Variant;
    procedure FUpdateTranslatedText(aText:Widestring);
    procedure FSaveTranslatedTextToFile( aFileName:Widestring );
    procedure FTranslateSelected;
    //procedure FParseCurrHTMLInnerTextAndTranslateObject( CurrElem:variant; CurrIdent:string );
    procedure FParseCurrHTMLInnerTextAndTranslate( CaptionTranslate:WideString; RecIndex:Integer; ProgressBarPos:Integer=-1; ProgresBarMax:Integer=-1 );
    procedure FTranslateSelectedHTML;
    procedure FPrepareMemData( ShowOriginalTextAsDefTextInGrdTranslate:Boolean );
    procedure FPrepare( aViewStyle:TcxGridTableViewStyles; ShowOriginalTextAsDefTextInGrdTranslate:Boolean=False );
    function  FMakeSaveData:TTranslateTextLngArr;
    procedure FLoadHTMLTextToBrowser( HTMLText:string );
    { Private declarations }
  public
    { Public declarations }
  end;
  function  ShowTranslateEditText( TextOriginal:Variant;
                               ParamTextLng:TTranslateLngArr;
                               ViewStyle:TcxGridTableViewStyles; DefIdent:String;
                               aOptTranslateText :TOptTranslateText=optTranslateText ):boolean;
                               
  function SaveDataTranslate( Elem:TDBShema; aParamTextLng : TTranslateLngArr;  SaveData:TTranslateTextLngArr):boolean;
  function SaveDataTranslateHtmlFile( Elem:TDBShema; aParamTextLng : TTranslateLngArr; SaveData:TTranslateTextLngArr;
                                      RootPath, FileTextOriginal,IdentLng :Widestring ):boolean;

  procedure PrepareCmbSelectLng( CmbLng:TcxImageComboBox;aLngIdent : TLngIdentArr; DefValue:Variant );
  procedure PrepareCmbSelectLngImageAtantion( CmbLng:TcxImageComboBox; aLngIdent : TLngIdentArr;
                                              PathRootTo, FileName:String; ImageList:TImageList; ImageIndex:Integer );


  function TranslitText( LngIdentFrom, LngIdentTo, OriginalText :Widestring ):Widestring;
  function TranslateData( CaptionTranslate:WideString; IdentTable:Integer; IdentOriginal, TextOriginal,
                        IdentTo :Widestring; aParamTextLng : TTranslateLngArr;
                        ProgressBarPos:Integer=-1;ProgresBarMax:Integer =-1;
                        aOptTranslateText :TOptTranslateText=optTranslateText  ):Variant;

  function TranslitData( IdentTable:Integer; IdentOriginal, TextOriginal,
                          IdentTo :Widestring; aParamTextLng : TTranslateLngArr ):Variant;

  procedure PrepareIdentLngCmBox( aLngIdentArr:TLngIdentArr; ImgCmb:TcxImageCombobox; DefIdent:String );
  function GetListIdLng( aElemLanguages:TDBShema ):TLngIdentArr;overload;
  function GetListIdLng(DBParam:TConnectDBParam):TLngIdentArr;overload;
  function GetListTeplatesForIdLng( FieldTranslateShema:TFieldTranslateShemaArr ):TLngIdentTemplateArr;
  function GetObjLngById( aLngIdent:TLngIdentArr; idLng:Integer ):TLngIdent;
  function GetObjLngIdentTemplateById( LngIdentTemplateArr:TLngIdentTemplateArr;TableInd , idLng:Integer ):TLngIdentTemplate;
  Function MakeElemActiveLng( ConDBParam:TConnectDBParam ):TDBShema;

  function DeleteMaskValue(aText:Widestring):Widestring;
  Function GenFNameForTranslate( FieldMainTable,IdLng:String ):string;
  function ClearTextFromTemplateStr(aText:Widestring;IdentTable:Integer; Ident:String;aParamTextLng : TTranslateLngArr ):Widestring;
  function PrepareOriginalTextToTemplate(aText:Widestring;IdentTable:Integer; Ident:String; aParamTextLng : TTranslateLngArr):Widestring;
  Function GenFNameForTranslateTemplate( FieldMainTable,IdLng:String ):string;
  function GetTemplateForOriginalTextByIdent(TableInd:Integer;  Ident:String;aParamTextLng : TTranslateLngArr):TTranslateTextLng;
  function MakeSQLPartForLngColumn( ElemOwner:TDBShema; CurrParam:TTranslateOptions; aLngIdent:TLngIdentArr;
                                    FieldIdMainTableRelWithTranslateTable,FieldNameOwnerTable:String ):string;
  function GetTranslateLngArrForElem( Elem:TDBShema; FieldName:String ):TTranslateLngArr;
  function GetTranslateLngArrFromFiles( RootPathToFile, FileTextOriginal:String; ConDBParam:TConnectDBParam ):TTranslateLngArr;
  function CheckOnOriginalText(OriginalText:Widestring;ShowMessageError:Boolean=True):Boolean;
  function CheckOnOriginalFileText(OriginalFileText:Widestring;ShowMessageError:Boolean=True):Boolean;
  procedure ShowTranslateLng( ElemOwner:TDBShema; OriginalText:WideString; FieldName, DefIdent:string;
                              ViewStyle:TcxGridTableViewStyles;aOptTranslateText :TOptTranslateText=optTranslateText );
  function ShowTranslateLngHTML( ElemOwner:TDBShema; aGoogleTranslateElem:TGoogleTranslate;WebSourcePath, RootPathToFile,PathToImages, FileTextOriginal:Widestring;
                                 DefIdent:string; ViewStyle:TcxGridTableViewStyles ):Boolean;
var
  FrmLngTranslateEdit: TFrmLngTranslateEdit;

implementation


{$R *.dfm}

function  ShowTranslateEditText( TextOriginal:Variant;
                                 ParamTextLng:TTranslateLngArr;
                                 ViewStyle:TcxGridTableViewStyles; DefIdent:String;
                                 aOptTranslateText :TOptTranslateText=optTranslateText ):boolean;
begin
  if not CheckOnOriginalText(TextOriginal) then Exit;

  try
    Application.CreateForm( TFrmLngTranslateEdit, FrmLngTranslateEdit );

    FrmLngTranslateEdit.FTextOriginal := TextOriginal;
    FrmLngTranslateEdit.FElem := ParamTextLng.ElemMain;
    FrmLngTranslateEdit.FParamTextLng := ParamTextLng;
    FrmLngTranslateEdit.FDefIdent     := DefIdent;
    FrmLngTranslateEdit.FOptTranslateText := aOptTranslateText;
    FrmLngTranslateEdit.butEditDecript.Visible := False;
    FrmLngTranslateEdit.PageControl.ActivePage := FrmLngTranslateEdit.TabTranslateText;
    FrmLngTranslateEdit.FPrepare( ViewStyle );

    if FrmLngTranslateEdit.ShowModal = mrOk then
    begin
      Result := SaveDataTranslate( FrmLngTranslateEdit.FElem, ParamTextLng, FrmLngTranslateEdit.FMakeSaveData  );
    end
    else result := false;

  finally
    FrmLngTranslateEdit.Free;
  end;
end;

function  ShowTranslateEditHtml( aGoogleTranslateElem:TGoogleTranslate;WebSourcePath, RootPathToFile,PathToImages, FileTextOriginal:Widestring;
                                 ParamTextLng:TTranslateLngArr;
                                 ViewStyle:TcxGridTableViewStyles; DefIdent:String ):boolean;
var FileText:TStringList;
    IdentLng:string;
begin
  if not CheckOnOriginalFileText( FileTextOriginal ) then Exit;

  try
    FileText:=TStringList.Create;
    FileText.LoadFromFile( FileTextOriginal );

    Application.CreateForm( TFrmLngTranslateEdit, FrmLngTranslateEdit );

    FrmLngTranslateEdit.FGoogleTranslateElem := aGoogleTranslateElem;
    FrmLngTranslateEdit.FWebSourcePath := WebSourcePath;
    FrmLngTranslateEdit.FTextOriginal := FileText.Text;
    FrmLngTranslateEdit.FElem := ParamTextLng.ElemMain;
    FrmLngTranslateEdit.FParamTextLng := ParamTextLng;
    FrmLngTranslateEdit.FDefIdent     := DefIdent;
    FrmLngTranslateEdit.FOptTranslateText := optTranslateHtml;
    FrmLngTranslateEdit.FRootPathToFile := RootPathToFile;
    FrmLngTranslateEdit.FPathToImages := PathToImages;
    FrmLngTranslateEdit.FFileTextOriginal := FileTextOriginal;
    FrmLngTranslateEdit.PageControl.ActivePage := FrmLngTranslateEdit.TabTranslateHTML;
    FrmLngTranslateEdit.ButTransliteral.Visible := False;
    FrmLngTranslateEdit.LabelTextOriginal.Visible := False;
    FrmLngTranslateEdit.EdOriginalText.Visible := False;
    FrmLngTranslateEdit.butEditDecript.Visible := True;
    FrmLngTranslateEdit.butEditDecript.Left := FrmLngTranslateEdit.ButTransliteral.Left;
    FrmLngTranslateEdit.FPrepare( ViewStyle, False );

    if FrmLngTranslateEdit.ShowModal = mrOk then
    begin
      if FrmLngTranslateEdit.ImCmbIdentOrigialLng.EditValue <> null then
        IdentLng := VarToStr( FrmLngTranslateEdit.ImCmbIdentOrigialLng.EditValue )
      else IdentLng := DefIdent;

      result:= SaveDataTranslateHtmlFile( FrmLngTranslateEdit.FElem, ParamTextLng, FrmLngTranslateEdit.FMakeSaveData,
                                          RootPathToFile, FileTextOriginal, IdentLng );
    end
    else result := false;

  finally
    FileText.Free;
    FrmLngTranslateEdit.Free;
  end;
end;

procedure ShowTranslateLng( ElemOwner:TDBShema; OriginalText:WideString; FieldName, DefIdent:string;
                            ViewStyle:TcxGridTableViewStyles; aOptTranslateText :TOptTranslateText=optTranslateText );
var ParamTranslateArr:TTranslateLngArr;
begin
  ParamTranslateArr := GetTranslateLngArrForElem( ElemOwner, FieldName );
  ShowTranslateEditText( OriginalText ,  ParamTranslateArr, ViewStyle, DefIdent,aOptTranslateText );

  ElemOwner.RequeryCurrentRecord;
end;

function ShowTranslateLngHTML( ElemOwner:TDBShema; aGoogleTranslateElem:TGoogleTranslate; WebSourcePath, RootPathToFile,PathToImages, FileTextOriginal:Widestring;
                               DefIdent:string; ViewStyle:TcxGridTableViewStyles ):Boolean;
var ParamTranslateArr:TTranslateLngArr;
begin
  result:= false;
  ParamTranslateArr := GetTranslateLngArrFromFiles( RootPathToFile, FileTextOriginal,  ElemOwner.DBGetParamConnect );
  result := ShowTranslateEditHtml( aGoogleTranslateElem,WebSourcePath, RootPathToFile,PathToImages,FileTextOriginal,ParamTranslateArr, ViewStyle, DefIdent );

  if result then ElemOwner.RequeryCurrentRecord;
end;

procedure PrepareCmbSelectLng( CmbLng:TcxImageComboBox; aLngIdent : TLngIdentArr; DefValue:Variant );
var i:Integer;
    AlistData, AListDataValue : TStringList;
    SaveEdValue :Variant;
    Found : Boolean;
begin
  try
    SaveEdValue := CmbLng.EditValue;
    AlistData := TStringList.Create;
    AListDataValue := TStringList.Create;

    Found := False;
    //*******************************************
    for i:=0 to Length(aLngIdent)-1 do
    begin
      if SaveEdValue = aLngIdent[i].id then Found:=True;
      AlistData.Add( aLngIdent[i].lngName );
      AListDataValue.Add( IntToStr( aLngIdent[i].id ) );
    end;
    //*******************************************
    FormingImageComboboxColumnByComboboxItem( CmbLng.Properties.Items, AlistData, AListDataValue, True );
    if SaveEdValue <> null then
      if Found then CmbLng.EditValue := SaveEdValue;

    if CmbLng.EditValue=null then CmbLng.EditValue :=DefValue; 
  finally
    AlistData.Free;
    AListDataValue.Free;
  end;
end;

procedure PrepareCmbSelectLngImageAtantion( CmbLng:TcxImageComboBox; aLngIdent : TLngIdentArr;
                                            PathRootTo, FileName:String; ImageList:TImageList; ImageIndex:Integer );
var i:Integer;
    CurrPathFile:string;
    SetImageIndex:Integer;
procedure SetNewImageIndex( IdLng:Variant; aImgIndex:Integer );
var i:Integer;
begin
  for i:=0 to CmbLng.Properties.Items.Count-1 do
  begin
    if CmbLng.Properties.Items[i].Value = IdLng then
      CmbLng.Properties.Items[i].ImageIndex := aImgIndex;
  end;
end;
//*******************************************************
begin
  CmbLng.Properties.Images := ImageList;
  for i:=0 to Length(aLngIdent)-1 do
  begin
    CurrPathFile := PathRootTo + AddNolForLengthNumber( IntToStr( aLngIdent[i].id ), 4 ) + '\' + FileName;
    if FileExists( CurrPathFile ) then SetImageIndex := -1
    else SetImageIndex := ImageIndex;

    SetNewImageIndex( aLngIdent[i].id, SetImageIndex );
  end;
end;

procedure TFrmLngTranslateEdit.ViewLngTranslateCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  Sender.BeginUpdate;
  Sender.OptionsData.Editing:=true;
  Sender.EndUpdate;
end;

procedure TFrmLngTranslateEdit.ViewLngTranslateFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if ( PageControl.ActivePage = TabTranslateText ) then     //( Sender.IsControlFocused ) and 
    Sender.OptionsData.Editing:=false;
end;
//******************************************************************************
procedure PrepareIdentLngCmBox( aLngIdentArr:TLngIdentArr; ImgCmb:TcxImageCombobox; DefIdent:String );
var i:Integer;
    AlistData:TStringList;
begin
  try
    AlistData := TStringList.Create;
    AlistData.add('auto');
    for i:=0 to Length(aLngIdentArr)-1 do
      AlistData.Add( aLngIdentArr[i].Ident );

    FormingImageComboBox( ImgCmb, AlistData, true );
    ImgCmb.EditValue :=  DefIdent ;

  finally
    AlistData.Free;
  end;
end;
//******************************************************************************
function GetListIdLng( aElemLanguages:TDBShema ):TLngIdentArr;
var len:Integer;
begin
  aElemLanguages.DBOpen;
  TDBShema(aElemLanguages).DB.First;
  While not TDBShema(aElemLanguages).DB.Eof do
  begin
    len := Length(result);
    SetLength(result,len+1);

    result[len].id := TDBShema(aElemLanguages).DB.FieldByName('ID').AsInteger ;
    result[len].lngName := TDBShema(aElemLanguages).DB.FieldByName('NAME').AsString ;
    result[len].Ident := LowerCase( TDBShema(aElemLanguages).DB.FieldByName('IDENT').AsString ) ;
    
    TDBShema(aElemLanguages).DB.Next;
  end;
end;
//******************************************************************************
function GetListIdLng(DBParam:TConnectDBParam):TLngIdentArr;
var aElemLanguages : TDBShema;
begin
  try
    aElemLanguages:= MakeElemActiveLng( DBParam );
    result := GetListIdLng( aElemLanguages );
  finally
    aElemLanguages.Close;
  end;
end;
//******************************************************************************
function GetListTeplatesForIdLng( FieldTranslateShema:TFieldTranslateShemaArr ):TLngIdentTemplateArr;
var i:Integer;
    DSMain:TDatasource;
    SQL:WideString;
    SQLDetail:WideString;

    CurrParam:TTranslateOptions;
    DBParam:TConnectDBParam;
    aDBLng:TDataset;
    aDBDetailLng:TDataset;
    len:Integer;
    lenDetail:Integer;
begin
  for i:=0 to Length(FieldTranslateShema)-1 do
  begin
   try
    DBParam := FieldTranslateShema[i].ElemMain.DBGetParamConnect;
    CurrParam := FieldTranslateShema[i].ElemMain.GetParamTranslateTableByFiedlName( FieldTranslateShema[i].FieldRealNameMainTable );

    SQL := 'select LNG_TRANSLATE_TEMPLATE.*,languages.name,languages.ident from LNG_TRANSLATE_TEMPLATE '+
    ' left join languages on LNG_TRANSLATE_TEMPLATE.id_lng = languages.id '+
    ' where TABLE_IND = '+IntToStr( CurrParam.IndTableTemplate );

    SQLDetail :='select * from LNG_TRANSL_TEMP_DETAIL WHERE ID_LNG_TRANSLATE_TEMPLATE =:ID order By AORDER';
  except
   //ShowMessage('22');
  end;
    try
      DSMain:=TDatasource.Create(nil);

      if DBParam.IBDatabaseConnection <>nil then
      begin
        aDBLng := UnitIBQuery.CreateDataSet( DBParam.PathDB, DBParam.UID, DBParam.Password, nil, SQL );
        aDBDetailLng := UnitIBQuery.CreateDataSet( DBParam.PathDB, DBParam.UID, DBParam.Password, nil, SQLDetail, false);
      end;

      if DBParam.ADOConnection <>nil then
      begin
        aDBLng := UnitADOQuery.CreateDataSet( DBParam.ADOConnection , SQL );
        aDBDetailLng := UnitADOQuery.CreateDataSet( DBParam.ADOConnection, SQLDetail, cmdText, false);
      end;

      DSMain.DataSet := aDBLng;
      if aDBDetailLng is TIBCustomDataSet then TIBQuery( aDBDetailLng).DataSource := DSMain;
      if aDBDetailLng is TCustomADODataSet then TADODataSet( aDBDetailLng).DataSource := DSMain;

      aDBDetailLng.Open;

      while not aDBLng.Eof do
      begin
        len := Length( Result );
        SetLength(Result , len+1);
        Result[len].LngIdent.id :=  aDBLng.fieldByName('ID_LNG').AsInteger;
        Result[len].LngIdent.lngName :=  aDBLng.fieldByName('NAME').asString;
        Result[len].LngIdent.Ident :=  aDBLng.fieldByName('IDENT').asString;
        Result[len].Template  := aDBLng.fieldByName('ATEMPLATE').asString;
        Result[len].UpperCase := aDBLng.fieldByName('UPPERCASE').AsInteger;
        Result[len].TableInd  := CurrParam.IndTableTemplate;

        aDBDetailLng.First;
        Result[len].DelWords:=TStringList.Create;
        while not aDBDetailLng.Eof do
        begin
          Result[len].DelWords.Add(  aDBDetailLng.FieldByName('NAME').AsString );
          aDBDetailLng.Next;
        end;
        aDBLng.Next;
      end;

    finally
      DSMain.Free;
      DestroyDB( aDBLng );
      DestroyDB( aDBDetailLng );
    end;
  end;
end;
//******************************************************************************
function GetObjLngById( aLngIdent:TLngIdentArr; idLng:Integer ):TLngIdent;
var i:integer;
begin
  for i:=0 to Length(aLngIdent)-1 do
  begin
    if  aLngIdent[i].id = idLng then
    begin
      Result := aLngIdent[i];
      break;
    end;
  end;
end;
//******************************************************************************
function GetObjLngIdentTemplateById( LngIdentTemplateArr:TLngIdentTemplateArr;TableInd , idLng:Integer ):TLngIdentTemplate;
var i:Integer;
begin

  for i:=0 to Length(LngIdentTemplateArr)-1 do
    if ( LngIdentTemplateArr[i].TableInd = TableInd ) and (LngIdentTemplateArr[i].LngIdent.id = idLng )then
    begin
      Result :=  LngIdentTemplateArr[i];
      break;
    end;
end;
//******************************************************************************
Function MakeElemActiveLng( ConDBParam:TConnectDBParam  ):TDBShema;
var SQL :string;
    aDBLng:TDataset;
begin
  SQL :='select * from languages  where ACTIVE_TRANSLATE = 1 ';
  
  if ConDBParam.IBDatabaseConnection <> nil then
     aDBLng := UnitIBQuery.CreateDataSet( ConDBParam.PathDB, ConDBParam.UID, ConDBParam.Password, nil, SQL )
  else
  if ConDBParam.ADOConnection <> nil then
     aDBLng := UnitADOQuery.CreateDataSet( ConDBParam.ADOConnection, SQL )
  else
  if ConDBParam.DatabaseConnection <> nil then
     aDBLng := UnitIBQuery.CreateDataSet( ConDBParam.DatabaseConnection, SQL );

  result := TDBShemaView.Create( aDBLng, nil, 'languages', 'ID' );
end;
//******************************************************************************
Function GenFNameForTranslate( FieldMainTable,IdLng:String ):string;
begin
  result := 'lng_' + FieldMainTable + '_' + IdLng;
end;
//******************************************************************************
Function GenFNameForTranslateTemplate( FieldMainTable,IdLng:String ):string;
begin
  result := 'lng_' + FieldMainTable + '_TEMPL_' + IdLng;
end;
//******************************************************************************
function GetPathToFileHTMLLng(RootPath,FileOriginalName:widestring;LngId:Integer):widestring;
begin
  result := RootPath + AddNolForLengthNumber( IntToStr( LngId ) , 4 ) + '\' + ExtractFileName( FileOriginalName );
end;
//******************************************************************************
function MakeSQLPartForLngColumn( ElemOwner:TDBShema; CurrParam:TTranslateOptions; aLngIdent:TLngIdentArr;
                                  FieldIdMainTableRelWithTranslateTable,FieldNameOwnerTable:String ):string;
var j:Integer;
    Sep:string;
begin
  result:='';
  Sep :=',';
  for j:=0 to Length(aLngIdent)-1 do
  begin
    Result := Result + '(select first 1 '+CurrParam.FieldName+' from '+CurrParam.TableName+
        ' where '+ ElemOwner.TableName + '.' + FieldIdMainTableRelWithTranslateTable + ' = '+CurrParam.TableName + '.' + CurrParam.FieldIdParentName+' and '+
        CurrParam.FieldLndIdName+' = '+IntToStr(aLngIdent[j].id)+') '+ GenFNameForTranslate( FieldNameOwnerTable,IntToStr( aLngIdent[j].id) )+Sep;
  end;
end;
//******************************************************************************
Function GetLngTexts( FieldName:String; aLngIdent:TLngIdentArr; DBTranslate:TDataset ) : TTranslateTextLngArr;
var i:Integer;
    len:Integer;
    CurrIdLen:WideString;
begin
  for i:=0 to DBTranslate.FieldCount - 1 do
  begin

    if ( AnsiPos(LowerCase( 'lng_'+FieldName+'_'), LowerCase( DBTranslate.Fields[i].FieldName) ) <> 0 ) then
    begin
      CurrIdLen:= DBTranslate.Fields[i].FieldName ;

      ReplaseON( CurrIdLen, 'lng_'+FieldName+'_', '' );
      len := Length(Result);
      SetLength(Result,len+1);
      Result[len].LngIdent.id := StrToInt(CurrIdLen);
      Result[len].LngIdent.lngName := GetObjLngById( aLngIdent, Result[len].LngIdent.id ).lngName;
      Result[len].LngIdent.Ident   := GetObjLngById( aLngIdent, Result[len].LngIdent.id ).Ident;
      Result[len].Text    := DBTranslate.Fields[i].AsString ;
    end;
  end;
end;
//******************************************************************************
Function GetLngTextsFromFiles( RootPathToFile, FileTextOriginal:String; ConDBParam:TConnectDBParam ) : TTranslateTextLngArr;
var i:Integer;
    len:Integer;
    CurrIdLen:WideString;
    PathToFileLng:WideString;
    FileText : TStringList;
    ElemLng:TDBShema;
    aLngIdent:TLngIdentArr;
begin
  try
    ElemLng := MakeElemActiveLng( ConDBParam );
    aLngIdent:= GetListIdLng( ElemLng );

    FileText:=TStringList.Create;

    for i:=0 to Length(aLngIdent)-1 do
    begin
      len := Length(Result);
      SetLength(Result,len+1);
      Result[len].LngIdent.id := aLngIdent[I].id;
      Result[len].LngIdent.lngName := GetObjLngById( aLngIdent, Result[len].LngIdent.id ).lngName;
      Result[len].LngIdent.Ident   := GetObjLngById( aLngIdent, Result[len].LngIdent.id ).Ident;
      PathToFileLng := GetPathToFileHTMLLng(RootPathToFile, FileTextOriginal, aLngIdent[i].id );

      if FileExists( PathToFileLng ) then
      begin
        FileText.LoadFromFile( PathToFileLng );
        Result[len].Text:= FileText.Text;
      end else  Result[len].Text:= '';

    end;
  finally
    FileText.Free;
  end;
end;
//******************************************************************************
function GetLngTextsForCurrElemId( Elem:TDBShema; FieldName:String ):TTranslateTextLngArr;
var CurrParam:TTranslateOptions;
    ElemLng:TDBShema;
    aLngIdent:TLngIdentArr;
    DBTranslateIB:TIBQuery;
    DBTranslateADO:TADODataset;
    SQL:string;
begin
  try
    ElemLng := MakeElemActiveLng( Elem.DBGetParamConnect );
    aLngIdent:= GetListIdLng( ElemLng );
    CurrParam := TDBShema( Elem ).GetParamTranslateTableByFiedlName( FieldName );

    SQL := MakeSQLPartForLngColumn( Elem, CurrParam, aLngIdent, Elem.FieldKod, CurrParam.FieldName );
    if Sql[Length(Sql)] = ',' then Delete(Sql,Length(Sql),1);
    SQL := 'SELECT '+Elem.TableName+'.'+Elem.FieldKod+','+ Elem.TableName+'.'+FieldName+', '+SQL+' FROM '+Elem.TableName+
           ' WHERE '+Elem.TableName+'.'+Elem.FieldKod+'='+Elem.GetValueIdStr;

    //*************************************************
    if Elem.DBGetParamConnect.IBDatabaseConnection <> nil then
    begin
      try
        DBTranslateIB := UnitIBQuery.CreateDataSet( Elem.DBGetParamConnect.PathDB, Elem.DBGetParamConnect.UID,Elem.DBGetParamConnect.Password, nil, SQL );
        result := GetLngTexts( FieldName, aLngIdent, DBTranslateIB );
      finally
        UnitIBQuery.DestroyDS( DBTranslateIB );
      end;
    end;
    //*************************************************
    if Elem.DBGetParamConnect.ADOConnection <> nil then
    begin
      try
        DBTranslateADO := UnitADOQuery.CreateDataSet( Elem.DBGetParamConnect.ADOConnection, SQL );
        result := GetLngTexts( FieldName, aLngIdent, DBTranslateADO );
      finally
        UnitADOQuery.DestroyDS( DBTranslateADO );
      end;
    end;
    //*************************************************
  finally
    ElemLng.Close;
  end;
end;
//******************************************************************************
function GetTranslateLngArrForElem( Elem:TDBShema; FieldName:String):TTranslateLngArr;
var CurrParam:TTranslateOptions;
begin
   CurrParam := TDBShema( Elem ).GetParamTranslateTableByFiedlName( FieldName );
   result.idMainTableRelWithTransalteTable := Elem.GetValueId;
   result.FieldNameInTranslateTableName := CurrParam.FieldName;
   result.ElemMain := Elem;
   if result.FieldNameInTranslateTableName<>'' then
     result.lngTexts := GetLngTextsForCurrElemId(Elem, FieldName);
end;
//******************************************************************************
function GetTranslateLngArrFromFiles( RootPathToFile, FileTextOriginal:String; ConDBParam:TConnectDBParam ):TTranslateLngArr;
begin
   result.idMainTableRelWithTransalteTable := null;
   result.FieldNameInTranslateTableName := '';
   result.ElemMain := nil;
   result.lngTexts := GetLngTextsFromFiles( RootPathToFile, FileTextOriginal, ConDBParam );
end;
//******************************************************************************
procedure TFrmLngTranslateEdit.FPrepareMemData( ShowOriginalTextAsDefTextInGrdTranslate:Boolean );
var i:Integer;
    but:TcxEditButton;
    IdentArr:TLngIdentArr;
    len:Integer;
begin
  if not MemDatTranslate.Active then MemDatTranslate.Open;
  while not MemDatTranslate.Eof do MemDatTranslate.Delete;
  EdOriginalText.Text := FTextOriginal;
  SetLength(IdentArr,0);

  for i:=0 to Length( FParamTextLng.lngTexts )-1 do
  begin
    MemDatTranslate.Insert;
    MemDatTranslate.FieldByName('idlng').AsInteger := FParamTextLng.lngTexts[i].LngIdent.id;
    MemDatTranslate.FieldByName('lngName').AsString := FParamTextLng.lngTexts[i].LngIdent.lngName;
    MemDatTranslate.FieldByName('aText').AsString := FParamTextLng.lngTexts[i].Text;
    MemDatTranslate.FieldByName('Ident').AsString := FParamTextLng.lngTexts[i].LngIdent.Ident;
    MemDatTranslate.FieldByName('Tmpl').AsString  := FParamTextLng.lngTexts[i].Template;
    MemDatTranslate.FieldByName('UpperCase').AsInteger := FParamTextLng.lngTexts[i].UpperCase;
    MemDatTranslate.FieldByName('TableInd').AsInteger := FParamTextLng.lngTexts[i].TableInd;

    if (ShowOriginalTextAsDefTextInGrdTranslate) and (FParamTextLng.lngTexts[i].LngIdent.Ident = self.FDefIdent) then
      MemDatTranslate.FieldByName('aText').AsString := FTextOriginal;

    MemDatTranslate.Post;
    //**************************
    len := Length(IdentArr);
    SetLength(IdentArr,len+1);
    IdentArr[len].id := FParamTextLng.lngTexts[i].LngIdent.id;
    IdentArr[len].lngName := FParamTextLng.lngTexts[i].LngIdent.lngName;
    IdentArr[len].Ident := FParamTextLng.lngTexts[i].LngIdent.Ident;
  end;

  //but := TcxButtonEditProperties( ViewLngTranslateAction.Properties ).Buttons.Add;
  //but.Kind := bkGlyph;
  //but.ImageIndex := 0;

  PrepareIdentLngCmBox( IdentArr , ImCmbIdentOrigialLng, FDefIdent );
  FrmLngTranslateEdit.PageControl.HideTabs := True;
end;
//******************************************************************************
function TFrmLngTranslateEdit.FMakeSaveData:TTranslateTextLngArr;
var i:Integer;
    len:Integer;
    lenDetail:Integer;
    CurrIdentLngObj:TTranslateTextLng;
begin
  MemDatTranslate.First;

  while not MemDatTranslate.Eof do
  begin
    len := Length(Result);
    SetLength(Result,len+1);

    Result[len].LngIdent.id :=MemDatTranslate.FieldByName('idlng').AsInteger;
    Result[len].LngIdent.lngName :=MemDatTranslate.FieldByName('lngName').AsString;
    Result[len].LngIdent.Ident :=MemDatTranslate.FieldByName('Ident').AsString;
    Result[len].Text     := MemDatTranslate.FieldByName('aText').AsString;
    Result[len].TableInd := MemDatTranslate.FieldByName('TableInd').AsInteger;

    //lenDetail:=Length( Result[len].DelWords );
    //SetLength( Result[len].DelWords , lenDetail+1);

    //CurrIdentLngObj := GetObjLngIdentTemplateById( FLngIdentTemplateArr:TLngIdentTemplateArr; TableInd , idLng:Integer ):TLngIdentTemplate;
    CurrIdentLngObj := GetTemplateForOriginalTextByIdent(Result[len].TableInd, Result[len].LngIdent.Ident, self.FParamTextLng);

    //CurrIdentLngObj.DelWords
    Result[len].DelWords := CurrIdentLngObj.DelWords;
    //CurrIdentLngObj.LngIdent
    //CurrLngObj := GetObjLngById( self.FParamTextLng, Result[len].LngIdent.Ident ):TLngIdent;
    //CurrLngObj. self.FParamTextLng.lngTexts[].DelWords

    //For i:=0 to Length(self.FParamTextLng)
    //Result[len].DelWords := self.FParamTextLng
    MemDatTranslate.Next;
  end;

end;
//******************************************************************************
procedure TFrmLngTranslateEdit.FPrepare( aViewStyle:TcxGridTableViewStyles; ShowOriginalTextAsDefTextInGrdTranslate:Boolean=False );
begin
  ViewLngTranslate.Styles:= aViewStyle ;
  ViewLngTranslateHTML.Styles := aViewStyle;
  ViewLngTranslateHTML.Styles.Inactive :=aViewStyle.Selection;
  FPrepareMemData( ShowOriginalTextAsDefTextInGrdTranslate );
end;
//******************************************************************************
function SaveDataTranslate( Elem:TDBShema; aParamTextLng : TTranslateLngArr; SaveData:TTranslateTextLngArr ):boolean;
var i:Integer;
    SqlUpdate:Widestring;
    CurrParam:TTranslateOptions;
begin
   CurrParam := TDBShema(Elem).GetParamTranslateTableByFiedlName( aParamTextLng.FieldNameInTranslateTableName );
   for i:=0 to Length(SaveData)-1 do
   begin
     UpdateLanguageFieldNameValue( TDBShema(Elem), CurrParam.TableName, CurrParam.FieldIdParentName,
                                   CurrParam.FieldLndIdName, CurrParam.FieldName, CurrParam.FieldChange ,
                                   SaveData[i].Text, aParamTextLng.idMainTableRelWithTransalteTable, SaveData[i].LngIdent.id, 0 );
   end;
   result := True;
end;
//******************************************************************************
function SaveDataTranslateHtmlFile( Elem:TDBShema; aParamTextLng : TTranslateLngArr; SaveData:TTranslateTextLngArr; RootPath, FileTextOriginal, IdentLng : Widestring ):boolean;
var i:Integer;
    SqlUpdate:Widestring;
    //CurrParam:TTranslateOptions;
    PathToSaveFile:Widestring;
    TextHTML:TStringList;
begin
 try
   TextHTML := TStringList.Create;
   //CurrParam := TDBShema(Elem).GetParamTranslateTableByFiedlName( aParamTextLng.FieldNameInTranslateTableName );
   for i:=0 to Length(SaveData)-1 do
   begin
     if SaveData[i].Text <> '' then
     begin
       PathToSaveFile := GetPathToFileHTMLLng(RootPath,ExtractFileName( FileTextOriginal ), SaveData[i].LngIdent.id );
       ExistsDir( PathToSaveFile );
       TextHTML.Text  := SaveData[i].Text;
       TextHTML.SaveToFile( PathToSaveFile );
     end;
   end;
   result := True;
   
 finally
   TextHTML.Free;
 end;
end;
//******************************************************************************
function CheckOnOriginalText(OriginalText:Widestring;ShowMessageError:Boolean=True):Boolean;
begin
  if OriginalText ='' then
  begin
    result := false;
    if ShowMessageError then
      MyShowMessageDlg( MeesageOriginalNotFound, mtError, but_Ok );
  end
  else result := true;
end;
//******************************************************************************
function CheckOnOriginalFileText(OriginalFileText:Widestring;ShowMessageError:Boolean=True):Boolean;
var FoundText:Boolean;
    FileText:TStringList;
begin
  FoundText := False;
  if FileExists(OriginalFileText) then
  begin
    try
      FileText := TStringList.Create;
      FileText.LoadFromFile( OriginalFileText );
      result := CheckOnOriginalText( FileText.Text, ShowMessageError );
    finally
      FileText.Free;
    end;
  end;
end;
//******************************************************************************
function TranslateData( CaptionTranslate:WideString; IdentTable:Integer; IdentOriginal, TextOriginal,
                        IdentTo :Widestring; aParamTextLng : TTranslateLngArr;
                        ProgressBarPos:Integer=-1;ProgresBarMax:Integer =-1;
                        aOptTranslateText :TOptTranslateText=optTranslateText ):Variant;
begin
  result := null;
  TextOriginal := PrepareOriginalTextToTemplate( TextOriginal,IdentTable, IdentOriginal, aParamTextLng );
  ReplaseOn(TextOriginal,'?','');

  if ( IdentTo <> null ) and (TextOriginal <> '')then
  begin
    //Result := ShowTranslateText(  IdentOriginal, IdentTo, TextOriginal, True, True, aOptTranslateText );
    //Result := GoogleTranslate.Translate( IdentOriginal, IdentTo, TextOriginal, True );
    //Result := ShowGTranslateText( WaitTranslate, IdentOriginal, IdentTo, TextOriginal );
    result := ShowGTranslateText( CaptionTranslate, IdentOriginal, IdentTo, TextOriginal,ProgressBarPos, ProgresBarMax, True, optTranslateText, 280 );
    result := ClearTextFromTemplateStr( Result,IdentTable, IdentTo, aParamTextLng );
  end;
end;
//******************************************************************************
function TranslitData( IdentTable:Integer; IdentOriginal, TextOriginal,
                        IdentTo :Widestring; aParamTextLng : TTranslateLngArr ):Variant;
begin
  result := null;
  TextOriginal := PrepareOriginalTextToTemplate( TextOriginal,IdentTable, IdentOriginal, aParamTextLng );
  ReplaseOn( TextOriginal, '?', '' );

  if ( IdentTo <> null ) and (TextOriginal <> null)then
  begin
    Result := TranslitText( IdentOriginal, IdentTo, TextOriginal );
    result := ClearTextFromTemplateStr( Result,IdentTable, IdentTo, aParamTextLng );
  end;
end;
//******************************************************************************
procedure TFrmLngTranslateEdit.ViewLngTranslateCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var ColorSelection:TColor;
    OldColorBrash:TColor;
    OldColorFont:TColor;
    IndCollngName:Integer;
    IndCollText:Integer;
begin
  OldColorBrash:= ACanvas.Brush.Color;
  OldColorFont := ACanvas.Font.Color;

  IndCollngName := TcxGRidDBTableView(Sender).GetColumnByFieldName('lngName').Index;
  IndCollText := TcxGRidDBTableView(Sender).GetColumnByFieldName('aText').Index;
  //***************************************
  if (AViewInfo.GridRecord.Focused) and (AViewInfo.Item.Focused)  then
  begin
    if TcxGRidDBTableView(Sender).Styles.Selection<>nil then
        ColorSelection:=TcxGRidDBTableView(Sender).Styles.Selection.Color
    else ColorSelection:= $006F3700;

    if (OldColorBrash=ACanvas.Brush.Color) then ACanvas.Brush.Color := ColorSelection;
    if (OldColorFont=ACanvas.Font.Color) then ACanvas.Font.Color := clWhite;
    ACanvas.FillRect(AViewInfo.Bounds);
  end; 
  //***************************************  
  if ( AViewInfo.Item.Index = IndCollngName ) and (VarToStr( AViewInfo.GridRecord.Values[IndCollText] ) = '') then
  begin
    ViewDrawFillRect( Sender, AViewInfo, ACanvas );
    ShowTextImageInCell( Sender, ACanvas, AViewInfo, ImageListIcon, 0, OptImgPosRight );
    ADone := True;
  end;
end;
//******************************************************************************
function GetTemplateForOriginalTextByIdent( TableInd:Integer; Ident:String; aParamTextLng : TTranslateLngArr ):TTranslateTextLng;
var i:Integer;
begin
  for i:=0 to Length(aParamTextLng.lngTexts)-1 do
  begin
    if (aParamTextLng.lngTexts[i].TableInd = TableInd) and
       (aParamTextLng.lngTexts[i].LngIdent.Ident = Ident) then
    begin
      result := aParamTextLng.lngTexts[i];
      Break;
    end;
  end;
end;
//******************************************************************************
function DeleteMaskValue(aText:Widestring):Widestring;
var i:Integer;
    ind:Integer;
    CurrStrMaskValue:WideString;
begin
  ind := AnsiPos('#',aText);
  while ind <> 0 do
  begin
    CurrStrMaskValue :='';
    for i:=ind to Length(aText) do
    if not (Char(aText[i]) in [',',';',' ','!','?','-','_','+','&','^','@','$','*','(',')'] ) then
      CurrStrMaskValue:= CurrStrMaskValue+aText[i];

    ReplaseON(aText, CurrStrMaskValue,';');
    ind := AnsiPos('#',aText);
  end;
  result := aText;
end;
//******************************************************************************
function ClearTextFromTemplateStr(aText:Widestring;IdentTable:Integer; Ident:String;aParamTextLng : TTranslateLngArr ):Widestring;
var i:Integer;
    TemplObj:TTranslateTextLng;
    Templ:Widestring;
    UpperCase:Boolean;
    aTextTmpl:WideString;
    sListDelWord:TStringList;
begin
   TemplObj := GetTemplateForOriginalTextByIdent(IdentTable, Ident,aParamTextLng);

   Templ := TemplObj.Template;
   if ( TemplObj.DelWords <> nil ) and (TemplObj.DelWords.Count <> 0) then
   begin
      //****************************
      for i:=0 to TemplObj.DelWords.Count-1 do
      begin
        ReplaseON(aText,' '+TemplObj.DelWords.Strings[i],'');
        ReplaseON(aText,TemplObj.DelWords.Strings[i]+' ','');
      end;
      //****************************
   end;
   result := Trim(aText);
   if TemplObj.UpperCase=1 then Result := UpFirstChar( Result );
   if TemplObj.UpperCase=2 then Result := LowerCase( Result );
   if TemplObj.UpperCase=3 then Result := AllWordsInUpFirstChar( Result );
end;
//******************************************************************************
function PrepareOriginalTextToTemplate( aText:Widestring;IdentTable:Integer; Ident:String; aParamTextLng : TTranslateLngArr ):Widestring;
var Template:Widestring;
begin
  Template := GetTemplateForOriginalTextByIdent(IdentTable, Ident, aParamTextLng ).Template;
  if Template <> '' then
  begin
     ReplaseOn(Template,'#NAME',aText);
     result := Template;
  end
  else result := aText;
end;
//******************************************************************************
function TFrmLngTranslateEdit.FTranslateCurrentViewRec( CaptionTranslate:Widestring; RecIndex:Integer; ProgressBarPos:Integer=-1;ProgresBarMax:Integer =-1 ):Variant;
var IndexColLngIdent:Integer;
    IndexColLngText :Integer;
    IndexCurrIndTable:Integer;
    CurrIdent:Variant;
    CurrIndTable :Variant;
    //aGoogleTranslate : TGoogleTranslate;
begin
  result := null;
  IndexColLngIdent := ViewLngTranslate.GetColumnByFieldName('Ident').Index;
  IndexCurrIndTable := ViewLngTranslate.GetColumnByFieldName('TableInd').Index;

  CurrIdent := ViewLngTranslate.DataController.Controller.SelectedRecords[RecIndex].Values[ IndexColLngIdent ];
  CurrIndTable := ViewLngTranslate.DataController.Controller.SelectedRecords[RecIndex].Values[ IndexCurrIndTable ];

  if CheckOnOriginalText( EdOriginalText.Text ) then
  begin
    try
      //aGoogleTranslate := TGoogleTranslate.Create( self );
      result := TranslateData( CaptionTranslate, CurrIndTable, ImCmbIdentOrigialLng.EditValue, EdOriginalText.Text,
                              CurrIdent, FParamTextLng, ProgressBarPos, ProgresBarMax );

    finally
     // aGoogleTranslate.Free;
    end;
  end;
end;
//******************************************************************************
procedure TFrmLngTranslateEdit.FUpdateTranslatedText(aText:Widestring);
begin
  if aText <> '' then
  begin
    MemDatTranslate.Edit;
    MemDatTranslate.FieldByName('aText').AsString := aText;
    MemDatTranslate.Post;
  end;
end;
//******************************************************************************
procedure TFrmLngTranslateEdit.FSaveTranslatedTextToFile( aFileName:Widestring );
begin
  SaveTextToFile( MemDatTranslate.FieldByName('aText').AsString, aFileName );
end;
//******************************************************************************
procedure TFrmLngTranslateEdit.FTranslateSelected;
var i:Integer;
    CurrText:WideString;
    IndexColLngId:Integer;
    Progres:TProgressFormProp;
    CaptionTranslate:Widestring;
begin
  try
   // Progres := ShowProgress( WaitTranslate, ViewLngTranslate.DataController.Controller.SelectedRecordCount );
    for i:=0 to ViewLngTranslate.DataController.Controller.SelectedRecordCount - 1 do
    begin
      ViewLngTranslate.DataController.Controller.SelectedRecords[ i ].Focused := True;
      CaptionTranslate:=  WaitTranslate+' ('+ViewLngTranslate.DataController.DataSet.fieldByName('lngName').AsString+')';
      // Progres.ProgressCaption.Caption := WaitTranslate+' ('+ViewLngTranslate.DataController.DataSet.fieldByName('lngName').AsString+')';
      //  Progres.ProgressCaption.Repaint;

      CurrText := FTranslateCurrentViewRec( CaptionTranslate, i, i+1, ViewLngTranslate.DataController.Controller.SelectedRecordCount );
      if CurrText <> '^' then
        FUpdateTranslatedText(CurrText)
      else Break;  

     // Progres.ProgressBar.Position:=Progres.ProgressBar.Position+1;
     // Progres.ProgressCaption.Repaint;
    end;
  finally
   // ClosedProgress(Progres.FormProgres);
  end;
end;
//******************************************************************************
procedure TFrmLngTranslateEdit.FParseCurrHTMLInnerTextAndTranslate(CaptionTranslate:WideString; RecIndex:Integer; ProgressBarPos:Integer=-1; ProgresBarMax:Integer=-1);
var CurrTextNew:WideString;
    aGoogleTranslate : TGoogleTranslate;
    IndexColLngIdent:Integer;
    CurrIdent:WideString;
    ACodeHTML: TStringList;
begin
  IndexColLngIdent := ViewLngTranslateHTML.GetColumnByFieldName('Ident').Index;
  CurrIdent := ViewLngTranslateHTML.DataController.Controller.SelectedRecords[RecIndex].Values[ IndexColLngIdent ];

  PreparePathsAttrFromWebBrowser( WebBrowserParse, 'IMG', '', 'src');
  PreparePathsAttrFromWebBrowser( WebBrowserParse, 'TABLE','TD','background');
  PreparePathsAttrFromWebBrowser( WebBrowserParse, 'OBJECT','','data');
  PreparePathsAttrFromWebBrowser( WebBrowserParse, 'OBJECT','VIDEO','src');

  try
    ACodeHTML := TStringList.Create;
    ACodeHTML.Text := WebBrowserParse.OleObject.Document.documentElement.outerHTML;
    //CurrTextNew := FGoogleTranslateElem.Translate( ImCmbIdentOrigialLng.EditValue, CurrIdent, ACodeHTML.Text, True, optTranslateHTML  );
    CurrTextNew := ShowGTranslateText( CaptionTranslate, ImCmbIdentOrigialLng.EditValue, CurrIdent, ACodeHTML.Text,ProgressBarPos, ProgresBarMax, True, optTranslateHTML, 280 );

    WebBrowserSetHTMLCode( WebBrowserParse, CurrTextNew );

  finally
    ACodeHTML.Free;
  end;

  PreparePathsAttrFromWebBrowser( WebBrowserParse, 'IMG', '', 'src','');
  PreparePathsAttrFromWebBrowser( WebBrowserParse, 'TABLE','TD','background','');
  PreparePathsAttrFromWebBrowser( WebBrowserParse, 'OBJECT','','data','');
  PreparePathsAttrFromWebBrowser( WebBrowserParse, 'OBJECT','VIDEO','src','');

  CurrTextNew := WebBrowserParse.OleObject.Document.body.InnerHTML;
  FUpdateTranslatedText(CurrTextNew );
  FLoadHTMLTextToBrowser( CurrTextNew );
end;
//******************************************************************************
procedure TFrmLngTranslateEdit.FTranslateSelectedHTML;
var i:Integer;
    //Progres:TProgressFormProp;
    CaptionTranslate:Widestring;
begin
   try
     //Progres := ShowProgress( WaitTranslate, ViewLngTranslateHTML.DataController.Controller.SelectedRecordCount );

     for i:= 0 to ViewLngTranslateHTML.DataController.Controller.SelectedRecordCount - 1 do
     begin
       ViewLngTranslateHTML.DataController.Controller.SelectedRecords[ i ].Focused := True;
       WebBrowserSetHTMLCode( WebBrowserParse, self.FTextOriginal );

       //Progres.ProgressCaption.Caption := WaitTranslate+' ('+ViewLngTranslateHTML.DataController.DataSet.fieldByName('lngName').AsString+')';
       //Progres.ProgressCaption.Repaint;
       FParseCurrHTMLInnerTextAndTranslate(CaptionTranslate, i, i+1, ViewLngTranslateHTML.DataController.Controller.SelectedRecordCount);

       //Progres.ProgressBar.Position:=Progres.ProgressBar.Position+1;
     end;

   finally
     //ClosedProgress(Progres.FormProgres);
   end;
end;
//******************************************************************************
procedure TFrmLngTranslateEdit.butTranslateClick(Sender: TObject);
begin
  if CheckOnOriginalText(FTextOriginal) then
    if MyShowMessageDlg( MessageAskTranslateText, mtConfirmation, but_YES_NO ) = Res_YES then
    begin
      if PageControl.ActivePage = TabTranslateText then  self.FTranslateSelected;
      if PageControl.ActivePage = TabTranslateHTML then  self.FTranslateSelectedHTML;
    end;
end;
//******************************************************************************
procedure TFrmLngTranslateEdit.butSelectAllClick(Sender: TObject);
begin
  if PageControl.ActivePage = TabTranslateText then ViewLngTranslate.DataController.Controller.SelectAll;;
  if PageControl.ActivePage = TabTranslateHTML then ViewLngTranslateHTML.DataController.Controller.SelectAll;;
end;
//******************************************************************************
procedure TFrmLngTranslateEdit.FormShow(Sender: TObject);
begin
   if MemDatTranslate.Locate('Ident',ImCmbIdentOrigialLng.EditValue,[]) then
   begin
     if (FrmLngTranslateEdit.PageControl.ActivePage = FrmLngTranslateEdit.TabTranslateText)and
        (ViewLngTranslate.ViewData.RowCount>0) then
     begin
       //ViewLngTranslate.DataController.GotoFirst;
       if ViewLngTranslate.ViewData.DataController.FocusedRowIndex <> -1 then
       begin
         ViewLngTranslate.ViewData.Rows[ViewLngTranslate.ViewData.DataController.FocusedRowIndex].Focused:=true;
         ViewLngTranslate.ViewData.Records[ViewLngTranslate.ViewData.DataController.FocusedRowIndex].Selected:=true;
       end;
     end;
     //***************************************************
     if (FrmLngTranslateEdit.PageControl.ActivePage = FrmLngTranslateEdit.TabTranslateHTML)and
        (ViewLngTranslateHTML.ViewData.RowCount>0) then
     begin
       //ViewLngTranslateHTML.DataController.GotoFirst;
       if ViewLngTranslateHTML.ViewData.DataController.FocusedRowIndex<>-1 then
       begin
         ViewLngTranslateHTML.ViewData.Rows[ViewLngTranslateHTML.ViewData.DataController.FocusedRowIndex].Focused:=true;
         ViewLngTranslateHTML.ViewData.Records[ViewLngTranslateHTML.ViewData.DataController.FocusedRowIndex].Selected:=true;
       end;
     end;
   end;
end;
//******************************************************************************
function TranslitText( LngIdentFrom, LngIdentTo, OriginalText :Widestring ):Widestring;
begin
  result := OriginalText;
  
  if (LngIdentFrom='uk')and(LngIdentTo='en') then Result := TranslitUkrToLat( OriginalText );
  if (LngIdentFrom='uk')and(LngIdentTo='ru') then Result := TranslitUkrToRus( OriginalText );
  if (LngIdentFrom='ru')and(LngIdentTo='uk') then Result := TranslitRusToUkr( OriginalText );
  if (LngIdentFrom='ru')and(LngIdentTo='en') then Result := TranslitRusToLat( OriginalText );
  if (LngIdentFrom='en')and(LngIdentTo='uk') then Result := TranslitLatToUkr( OriginalText );
  if (LngIdentFrom='en')and(LngIdentTo='ru') then Result := TranslitLatToRus( OriginalText );
end;
//******************************************************************************
procedure TFrmLngTranslateEdit.FTranslitCurrText;
var i:Integer;
    CurrText:WideString;
    IndexColLngId:Integer;
    IdentTo:WideString;
    UpCase:Integer;
begin
  for i:=0 to ViewLngTranslate.DataController.Controller.SelectedRecordCount - 1 do
  begin
    ViewLngTranslate.DataController.Controller.SelectedRecords[ i ].Focused:=True;
    IdentTo := ViewLngTranslate.DataController.DataSet.FieldByName('Ident').AsString;
    UpCase := ViewLngTranslate.DataController.DataSet.FieldByName('UpperCase').asInteger;
    CurrText := TranslitText( ImCmbIdentOrigialLng.EditValue, IdentTo, EdOriginalText.Text );

    if CurrText <> null then
    begin
     if UpCase=1 then CurrText := UpFirstChar(CurrText);
     if UpCase=2 then CurrText := LowerCase(CurrText);
     if UpCase=3 then CurrText := AllWordsInUpFirstChar( CurrText );

     ViewLngTranslate.DataController.DataSet.Edit;
     ViewLngTranslate.DataController.DataSet.FieldByName('aText').AsString := CurrText;
     ViewLngTranslate.DataController.DataSet.Post;
     end;
  end;

end;
//******************************************************************************
procedure TFrmLngTranslateEdit.ButTransliteralClick(Sender: TObject);
begin
  if CheckOnOriginalText(FTextOriginal) then
    if MyShowMessageDlg( MessageAskTranslitText, mtConfirmation, but_YES_NO ) = Res_YES then
      FTranslitCurrText;
end;
//******************************************************************************
procedure TFrmLngTranslateEdit.FLoadHTMLTextToBrowser( HTMLText:string );
var HtmlContent:TStringList;
begin
  try
    HtmlContent := PrpareBlockContentToPrefixPathShow( HTMLText, PreparePathToWebPath( FWebSourcePath ), '#ffffe1' );
    WebBrowserLngText.Load( WebBrowserLngText.DefaultUrl );
    if ( HtmlContent.Count <> 0)and(HTMLText<>'') then
    begin
      WebBrowserLngText.Load( FFileTextOriginal );
      WebBrowserLngText.Browser.GetMainFrame.LoadString( HtmlContent.Text, FFileTextOriginal );
    end;

  finally
    HtmlContent.Free;
  end;
end;
//******************************************************************************
procedure TFrmLngTranslateEdit.ViewLngTranslateHTMLFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  if ( PageControl.ActivePage = TabTranslateHTML )  then
    FLoadHTMLTextToBrowser( MemDatTranslate.fieldByName('aText').AsString );
end;
//******************************************************************************
procedure TFrmLngTranslateEdit.FormDestroy(Sender: TObject);
begin
   WebBrowserLngText.Load( WebBrowserLngText.DefaultUrl );
end;
//******************************************************************************
procedure TFrmLngTranslateEdit.butEditDecriptClick(Sender: TObject);
var PathToSaveTempFile:string;
    HtmlParam:string;
    CurrHtmlCode:WideString;
begin
 try

   PathToSaveTempFile := GetPathToFileHTMLLng( FRootPathToFile,'~Temp.php', MemDatTranslate.FieldByName('idlng').AsInteger );
   CurrHtmlCode := MemDatTranslate.FieldByName('aText').AsString;
   if (PathToSaveTempFile <>''){and( Trim( CurrHtmlCode ) <>'' )} then
   begin
     if CurrHtmlCode= '' then CurrHtmlCode := '<HTML></HTML>';
     ExistsDir( PathToSaveTempFile );
     
     SaveTextToFile( CurrHtmlCode , PathToSaveTempFile );

     HtmlParam :='"'+PathToSaveTempFile+'" '+'"content"'+' "'+self.FPathToImages+'"';
     if RunExeFileAndWait( OptionSet.HtmlEditor +HtmlParam ,NORMAL_PRIORITY_CLASS ) then
     begin
       FUpdateTranslatedText( GetTextFromFile( PathToSaveTempFile ) );
       if MemDatTranslate.FieldByName('Ident').AsString = self.FDefIdent then
         self.FTextOriginal := MemDatTranslate.FieldByName('aText').AsString;
     end;
   end;

 finally
   DeleteFile(PathToSaveTempFile);
 end;
end;
//******************************************************************************
end.



{if FParamTextLng.idInTranslateUpdate <> null then
         SqlUpdate:='UPDATE '+FParamTextLng.TableTranslate+' SET '+
                    FParamTextLng.FieldIdMainTableRelWithTranslateTable+' = '+ VarToStr(FParamTextLng.idMainTableRelWithTransalteTable)+','+
                    FParamTextLng.FieldIdetLngInTranslateTableName+' = '+MemDatTranslate.FieldByName('idlng').asString+','+
                    FParamTextLng.FieldNameInTranslateTableName+' = '+MemDatTranslate.FieldByName('aText').asString +' WHERE '+
                    FParamTextLng.FieldTranslateId+' = '+MemDatTranslate.FieldByName('id_Update').asString
       else
         SqlUpdate:='INSERT '+FParamTextLng.TableTranslate+
                    ' ('+FParamTextLng.FieldIdMainTableRelWithTranslateTable+','+
                                FParamTextLng.FieldIdetLngInTranslateTableName+','+
                                FParamTextLng.FieldNameInTranslateTableName+','+
                                FParamTextLng.FieldTranslateId+') VALUES ( '+
                     VarToStr(FParamTextLng.idMainTableRelWithTransalteTable)+','+
                     MemDatTranslate.FieldByName('idlng').asString+','+
                     MemDatTranslate.FieldByName('aText').asString+','+
                     MemDatTranslate.FieldByName('id_Update').asString+');';
                   
       UpdateSql( Self.FParamConnect.PathDB, Self.FParamConnect.UID, Self.FParamConnect.Password, SqlUpdate );}

