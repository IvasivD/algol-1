unit UnitPreviewResult;

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
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls, StdCtrls,IBQuery,
  frxpngimage, cxPCdxBarPopupMenu, cxPC, cxContainer, cxTextEdit,UnitTranslate,
  Buttons, cxTL, cxMaskEdit, cxTLdxBarBuiltInMenu, cxInplaceContainer,
  cxDBTL, cxTLData, cxDBLookupComboBox,ADODB;

type
  TFrmCountryDetail = class(TForm)
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    Panel1: TPanel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Panel2: TPanel;
    Panel3: TPanel;
    ImgFlag: TImage;
    ImgGerb: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Panel4: TPanel;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    cxTabSheet2: TcxTabSheet;
    Splitter1: TSplitter;
    Panel5: TPanel;
    cxGrid3: TcxGrid;
    cxGrid3DBTableView1: TcxGridDBTableView;
    cxGrid3Level1: TcxGridLevel;
    Panel6: TPanel;
    Panel7: TPanel;
    Splitter2: TSplitter;
    cxGrid4: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid5: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    Panel8: TPanel;
    Button1: TButton;
    EdDelWord: TcxTextEdit;
    Label3: TLabel;
    Label4: TLabel;
    EdChangeFrom: TcxTextEdit;
    Label5: TLabel;
    EdChangeTo: TcxTextEdit;
    SpeedButton1: TSpeedButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    EdRevers: TcxTextEdit;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    cxTabSheet3: TcxTabSheet;
    cxGrid6DBTableView1: TcxGridDBTableView;
    cxGrid6Level1: TcxGridLevel;
    cxGrid6: TcxGrid;
    cxGrid7: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridLevel3: TcxGridLevel;
    Splitter3: TSplitter;
    Panel9: TPanel;
    Button5: TButton;
    cxTabSheet4: TcxTabSheet;
    cxGrid8DBTableView1: TcxGridDBTableView;
    cxGrid8Level1: TcxGridLevel;
    cxGrid8: TcxGrid;
    Splitter4: TSplitter;
    Panel10: TPanel;
    Button6: TButton;
    cxGrid9DBTableView1: TcxGridDBTableView;
    cxGrid9Level1: TcxGridLevel;
    cxGrid9: TcxGrid;
    Button7: TButton;
    Edit: TEdit;
    Button8: TButton;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    SpeedButton4: TSpeedButton;
    EdRegionDel: TcxTextEdit;
    EdRegionFrom: TcxTextEdit;
    EdRegionTo: TcxTextEdit;
    ChCaseChar: TCheckBox;
    Button9: TButton;
    cxTabSheet5: TcxTabSheet;
    Panel11: TPanel;
    cxGrid10: TcxGrid;
    cxGrid10DBTableView1: TcxGridDBTableView;
    cxGrid10Level1: TcxGridLevel;
    Splitter5: TSplitter;
    cxGrid11DBTableView1: TcxGridDBTableView;
    cxGrid11Level1: TcxGridLevel;
    cxGrid11: TcxGrid;
    Button10: TButton;
    Button11: TButton;
    Label9: TLabel;
    EdAreaDel: TcxTextEdit;
    Label10: TLabel;
    EdAreaFrom: TcxTextEdit;
    EdAreaTo: TcxTextEdit;
    ChAreaCaseChar: TCheckBox;
    SpeedButton5: TSpeedButton;
    cxTabSheet6: TcxTabSheet;
    Splitter6: TSplitter;
    cxGrid12DBTableView1: TcxGridDBTableView;
    cxGrid12Level1: TcxGridLevel;
    cxGrid12: TcxGrid;
    cxGrid13DBTableView1: TcxGridDBTableView;
    cxGrid13Level1: TcxGridLevel;
    cxGrid13: TcxGrid;
    Panel12: TPanel;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
  private
    procedure LoadImage(Img:TImage; TypeValueId:Integer );
    procedure ViewFocusedRecordChanged( Sender: TcxCustomGridTableView; APrevFocusedRecord, AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure RefreshFiles;
    procedure AutoCorrectRegionReplaseDel;
    procedure AutoCorrectRegionRevers(Word:Widestring);
    function  PrepareText(aText:Widestring):Widestring;
    function  PrepareReversText(aText:Widestring; WordToRevers:Widestring):Widestring;

    procedure AutoCorrectRegionFromEnCurrent;
    procedure AutoCorrectRegionFromEn;
    procedure AutoCorrectRegionFromOriginal;
    procedure AutoCorrectRegionFromOriginalCurrent;

    procedure ViewRegionFromFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;
procedure ShowCountryDetail;
var
  FrmCountryDetail: TFrmCountryDetail;

implementation

uses
  UnitDM, UnitProc;

{$R *.dfm}

procedure ShowCountryDetail;
begin
  try
    Application.CreateForm(TFrmCountryDetail, FrmCountryDetail);
    Elem_Country.ViewList.OnFocusedRecordChanged := FrmCountryDetail.ViewFocusedRecordChanged ;
    Elem_Country.View.DataController.GotoFirst;
    Elem_Region.AddFocusedRecordChanged( FrmCountryDetail.ViewRegionFromFocusedRecordChanged );

    FrmCountryDetail.ShowModal;
  finally
    FrmCountryDetail.Free;
  end;
end;

procedure TFrmCountryDetail.LoadImage( Img:TImage; TypeValueId:Integer );
var StreamFile:TMemoryStream;
    NewGraphic: TGraphic;
    Folder:String;
begin
  try
    Elem_CountryDetail.View.BeginUpdate;
    Elem_CountryDetail.SaveBookmark;
    if Elem_CountryDetail.DB.Locate('COUNTRY_DET_TYPE_ID',TypeValueId,[] ) then
    begin
      try
        Folder :=  ExtractFilePath(Application.ExeName)+'Temp\';
        ExistsDir(Folder);
        StreamFile:=  Elem_CountryDetail.DBGetBlobData('AFILE');
        if not Elem_CountryDetail.Db.FieldByName('AFILE').IsNull then
        begin
          //Img.Picture.Graphic:=NewGraphic;// . LoadFromStream( StreamFile );
          try
            StreamFile.SaveToFile( Folder+'NewFile.png' );
            Img.Picture.LoadFromFile( Folder+'NewFile.png' );
          except
          end;
          //Img.Picture.Graphic.LoadFromStream( StreamFile );// LoadFromFile(Folder+'NewFile.png');// .LoadFromStream( StreamFile );
        end;
      finally
        StreamFile.Free;
        DelDir( Folder ,'*.*');
      end;
    end;
  finally
    Elem_CountryDetail.GotoBookmark;
    Elem_CountryDetail.View.EndUpdate;
  end;
end;


procedure TFrmCountryDetail.ViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  RefreshFiles;
end;


procedure TFrmCountryDetail.RefreshFiles;
begin
  LoadImage( ImgFlag, 1 );
  LoadImage( ImgGerb, 2 );
end;



procedure TFrmCountryDetail.FormShow(Sender: TObject);
begin
  RefreshFiles;
 // Elem_Country.View.GetColumnByFieldName('COUNTRY_ID').SortOrder:= soAscending;
 // Elem_Region.View.GetColumnByFieldName('REGION_ID').SortOrder:= soAscending;
  //Elem_City.View.GetColumnByFieldName('CITY_ID').SortOrder:= soAscending;
end;

function TFrmCountryDetail.PrepareText(aText:Widestring):Widestring;
begin
  if EdDelWord.Text<> '' then
  begin
   ReplaseON(aText,EdDelWord.Text,'');
  end;
  if EdChangeFrom.Text<>'' then
  begin
   ReplaseON(aText,EdChangeFrom.Text,EdChangeTo.Text);
  end;
  result := aText;
end;

function TFrmCountryDetail.PrepareReversText( aText:Widestring; WordToRevers:Widestring ):Widestring;
var IndPos:Integer;
begin
  IndPos := AnsiPos( WordToRevers, aText );
  if IndPos <> 0 then
  begin
    ReplaseOn(aText,WordToRevers,'');
    aText := aText+' '+WordToRevers;
  end;
  result := Trim(aText);
end;

procedure TFrmCountryDetail.AutoCorrectRegionReplaseDel;
var CurrText:Widestring;
    NewTextEn:Widestring;
    NewTextRus:Widestring;
    NewTextUa:Widestring;
begin
  Elem_Region.DB.First;
  while not Elem_Region.DB.Eof do
  begin
     NewTextUa := Elem_Region.DB.FieldByName('TITLE_UA').AsString;
     NewTextRus:= Elem_Region.DB.FieldByName('TITLE_RU').AsString;
     NewTextEn := Elem_Region.DB.FieldByName('TITLE_EN').AsString;

     NewTextRus := PrepareText(NewTextRus);
     NewTextUa  := PrepareText(NewTextUa);
     NewTextEn  := PrepareText(NewTextEn);
    
     Elem_Region.DB.Edit;
     Elem_Region.DB.FieldByName('TITLE_UA').AsString := UpFirstChar(NewTextUa);
     Elem_Region.DB.FieldByName('TITLE_RU').AsString := UpFirstChar(NewTextRus);
     Elem_Region.DB.FieldByName('TITLE_EN').AsString := UpFirstChar(NewTextEn);
     Elem_Region.DB.Next;
  end;
end;

procedure TFrmCountryDetail.AutoCorrectRegionRevers(Word:Widestring);
var CurrText:Widestring;
    NewTextRus:Widestring;
    NewTextUa:Widestring;

begin
  Elem_Region.DB.First;
  while not Elem_Region.DB.Eof do
  begin
     NewTextUa := Elem_Region.DB.FieldByName('TITLE_UA').AsString;
     NewTextRus:= Elem_Region.DB.FieldByName('TITLE_RU').AsString;

     NewTextRus :=  PrepareReversText( NewTextRus,EdRevers.Text );
     NewTextUa :=  PrepareReversText( NewTextUa,EdRevers.Text );

     Elem_Region.DB.Edit;
     Elem_Region.DB.FieldByName('TITLE_UA').AsString := UpFirstChar(NewTextUa);
     Elem_Region.DB.FieldByName('TITLE_RU').AsString := UpFirstChar(NewTextRus);

     Elem_Region.DB.Next;
  end;
end;


procedure TFrmCountryDetail.AutoCorrectRegionFromEnCurrent;
var CurrText:Widestring;
    NewTextRus:Widestring;
    NewTextUa:Widestring;
begin
   CurrText := Elem_Region.DB.FieldByName('TITLE_EN').AsString;
   CurrText := PrepareText(CurrText);

   NewTextRus := ShowTranslateText( 'en','ru', CurrText  ) ;
   NewTextUa := ShowTranslateText( 'en','uk', CurrText  ) ;

   NewTextRus := PrepareText(NewTextRus);
   NewTextUa := PrepareText(NewTextUa);

   Elem_Region.DB.Edit;
   Elem_Region.DB.FieldByName('TITLE_UA').AsString := NewTextUa;
   Elem_Region.DB.FieldByName('TITLE_RU').AsString := NewTextRus;
end;

procedure TFrmCountryDetail.AutoCorrectRegionFromEn;
var CurrText:Widestring;
    NewTextRus:Widestring;
    NewTextUa:Widestring;

begin
  Elem_Region.DB.First;
  while not Elem_Region.DB.Eof do
  begin
     AutoCorrectRegionFromEnCurrent;
     Elem_Region.DB.Next;
  end;
end;

procedure TFrmCountryDetail.AutoCorrectRegionFromOriginalCurrent;
var CurrText:Widestring;
    NewTextEng:Widestring;
    NewTextRus:Widestring;
    NewTextUa:Widestring;
begin
   CurrText := Elem_Region.DB.FieldByName('TITLE_ORIGINAL').AsString;
   CurrText := PrepareText(CurrText);

   NewTextEng := ShowTranslateText( 'auto','en', CurrText  ) ;
   NewTextRus := ShowTranslateText( 'en','ru', NewTextEng  ) ;
   NewTextUa  := ShowTranslateText( 'ru','uk', NewTextRus  ) ;

   if not CheckCyrillicSymbol(NewTextRus) then NewTextRus := TranslitLatToRus( NewTextEng );
   if not CheckCyrillicSymbol(NewTextUa)  then NewTextUa := TranslitLatToUkr( NewTextEng );

   NewTextEng := PrepareText(NewTextEng);
   NewTextRus := PrepareText(NewTextRus);
   NewTextUa  := PrepareText(NewTextUa);

   Elem_Region.DB.Edit;
   Elem_Region.DB.FieldByName('TITLE_EN').AsString := NewTextEng;
   Elem_Region.DB.FieldByName('TITLE_UA').AsString := NewTextUa;
   Elem_Region.DB.FieldByName('TITLE_RU').AsString := NewTextRus;
   Elem_Region.DB.Post;
end;

procedure TFrmCountryDetail.AutoCorrectRegionFromOriginal;


begin
  Elem_Region.DB.First;
  while not Elem_Region.DB.Eof do
  begin
     AutoCorrectRegionFromOriginalCurrent;

     Elem_Region.DB.Next;
  end;
end;

procedure TFrmCountryDetail.Button1Click(Sender: TObject);
begin
  AutoCorrectRegionFromEn;
end;

procedure TFrmCountryDetail.SpeedButton1Click(Sender: TObject);
begin
  AutoCorrectRegionReplaseDel;
end;

procedure TFrmCountryDetail.Button2Click(Sender: TObject);
begin
  Elem_City.DBClose;
  TIBQuery(Elem_City.DB).SQL.Text :='SELECT  * from  CITIES where REGION_ID='+ Elem_Region.getValueIdStr;
  Elem_City.DBOpen;
  Elem_City.DBOpen;
end;

procedure TFrmCountryDetail.Button3Click(Sender: TObject);
begin
 AutoCorrectRegionFromOriginal;
end;

procedure TFrmCountryDetail.Button4Click(Sender: TObject);
begin
  AutoCorrectRegionRevers( EdRevers.Text );
end;

procedure TFrmCountryDetail.SpeedButton2Click(Sender: TObject);
begin
  AutoCorrectRegionFromOriginalCurrent;
end;

procedure TFrmCountryDetail.SpeedButton3Click(Sender: TObject);
begin
  AutoCorrectRegionFromEnCurrent;
end;


procedure TFrmCountryDetail.Button5Click(Sender: TObject);
begin
  // FindSimilarCountry;
end;

procedure TFrmCountryDetail.Button6Click(Sender: TObject);
begin
  FindSimilarRegion;
end;

procedure TFrmCountryDetail.Button7Click(Sender: TObject);
begin
  FindSimilarRegionToID( Elem_Region.DB.FieldByName('COUNTRY_ID').AsInteger,Elem_Region.DB.FieldByName('TITLE_UA').AsString,false);
end;

procedure TFrmCountryDetail.Button8Click(Sender: TObject);
begin
  Elem_RegionTo.SetFilterOnView( ['NAME'],[Edit.Text],['like'],fboOr);

end;

procedure TFrmCountryDetail.ViewRegionFromFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  Edit.Text := Elem_Region.DB.FieldByName('TITLE_UA').AsString;
  //Button8.click;
end;

procedure TFrmCountryDetail.SpeedButton4Click(Sender: TObject);
begin
   CorrectDatasetReplaseDel( Elem_Region.DB, ['TITLE_UA','TITLE_RU','TITLE_EN'], EdRegionDel.Text, EdRegionFrom.Text, EdRegionTo.Text, ChCaseChar.Checked );
end;

procedure TFrmCountryDetail.Button9Click(Sender: TObject);
var aList:TStringList;
begin
  aList:=TStringList.Create;
  Elem_RegionTO.db.First;
  While not Elem_RegionTO.db.Eof do
  begin
    if not Elem_Region.DB.Locate('REGION_ID_TO', Elem_RegionTO.GetValueId,[]) then
      aList.Add( Elem_RegionTO.DB.fieldByName('NAME').AsString );

    Elem_RegionTO.db.Next;
  end;
  aList.SaveToFile( ExtractFilePath(Application.ExeName)+'NotAssingnRegion.TXT' );
  aList.Free;
end;

procedure TFrmCountryDetail.Button10Click(Sender: TObject);
begin
  FindSimilarArea;
end;

procedure TFrmCountryDetail.Button11Click(Sender: TObject);
var aList:TStringList;
begin
  aList:=TStringList.Create;
  Elem_AreaTO.db.First;
  While not Elem_AreaTO.db.Eof do
  begin
    if not Elem_Area.DB.Locate( 'AREA_ID_TO', Elem_AreaTO.GetValueId, [] ) then
      aList.Add( Elem_AreaTO.DB.fieldByName('NAME').AsString );

    Elem_AreaTO.db.Next;
  end;
  aList.SaveToFile( ExtractFilePath(Application.ExeName)+'NotAssingnArea.TXT' );
  aList.Free;
end;

procedure TFrmCountryDetail.SpeedButton5Click(Sender: TObject);
begin
  CorrectDatasetReplaseDel( Elem_Area.DB, ['TITLE_UA','TITLE_RU','TITLE_EN'], EdAreaDel.Text, EdAreaFrom.Text, EdAreaTo.Text, ChAreaCaseChar.Checked );

  //,'TITLE_RU','TITLE_EN'
end;

procedure TFrmCountryDetail.Button12Click(Sender: TObject);
begin
 FindSimilarCity;
end;

procedure TFrmCountryDetail.Button13Click(Sender: TObject);
begin
  DM.GenTranslateSQL('','', Elem_Country,Elem_CounrtyTO, 'COUNTRY_ID_TO', 'ID_COUNTRIES', 'COUNTRIES_LNG' );
end;

procedure TFrmCountryDetail.Button14Click(Sender: TObject);
begin
  DM.GenTranslateSQL('','', Elem_Region,Elem_RegionTO, 'REGION_ID_TO','ID_PROVINCES', 'PROVINCES_LNG' );
end;

procedure TFrmCountryDetail.Button15Click(Sender: TObject);
begin
  DM.GenTranslateSQL('','', Elem_Area,Elem_AreaTO, 'AREA_ID_TO','ID_TOWNSHIPS', 'TOWNSHIPS_LNG' );
end;

procedure TFrmCountryDetail.Button16Click(Sender: TObject);
var aValue:Variant;
    Count:Integer;
begin
  Elem_Country.DB.First;
  try
    Elem_City.View.DataController.DataSource := nil;
    Elem_CityTO.View.DataController.DataSource := nil;

   DM.GenTranslateSQL('','COUNTRY_NAME', Elem_City,Elem_CityTO, 'CITY_ID_TO','ID_CIIES', 'CITIES_LNG' );
  finally
    Elem_City.View.DataController.DataSource := Elem_City.DS;
    Elem_CityTO.View.DataController.DataSource := Elem_CityTO.DS;
  end;
  //Elem_Country.DB.Locate(Elem_Country.FieldKod,80,[]);
 { while not Elem_Country.DB.Eof do
  begin
     //TIBQuery(Elem_City.DB).FetchAll;

     Elem_City.DBClose;
     Elem_City.DBQuerySetParamValue('COUNTRY_ID', Elem_Country.GetValueId );
     Elem_City.DBOpen;
     TIBQuery(Elem_City.DB).FetchAll;

     Elem_CityTo.DBClose;
     Elem_CityTo.DBQuerySetParamValue('COUNTRY_ID_TO', Elem_Country.GetValueId );
     Elem_CityTo.DBOpen;
     TIBQuery(Elem_CityTo.DB).FetchAll;

     //TIBQuery(Elem_City.DB).FetchAll;
     //ShowMessage( IntToStr( Elem_City.DBRecordCount ) );

     DM.GenTranslateSQL(Elem_Country.DB.FieldByName('TITLE_UA').asString, Elem_City,Elem_CityTO, 'CITY_ID_TO','ID_CIIES', 'CITIES_LNG' );
     Elem_Country.DB.Next;
  end;  }
  { Elem_City.DBOpen;
   TIBQuery(Elem_City.DB).FetchAll;
   Elem_City.DB.First;
   while not Elem_City.DB.Eof do
   begin
     ShowMessage(  Elem_City.DB.FieldByName('TITLE_RU').AsString  );
     Elem_City.DB.Next;
   end; }
  {Elem_Country.DB.First;
  Elem_City.DBOpen;
  Elem_CityTO.DBOpen;

  while not Elem_Country.DB.Eof do
  begin
     //TIBQuery(Elem_City.DB).FetchAll;
     ShowMessage( IntToStr( Elem_City.DBRecordCount ) );

     //DM.GenTranslateSQL( Elem_City,Elem_CityTO, 'CITY_ID_TO','ID_CIIES', 'CITIES_LNG' );
     Elem_Country.DB.Next;
  end;}
end;

procedure TFrmCountryDetail.Button17Click(Sender: TObject);
begin
  Elem_Country.DB.First;
  Elem_City.DBOpen;
  Elem_CityTO.DBOpen;

end;

end.

'TITLE_UA','TITLE_RU','TITLE_EN'




 //Elem_City.DBQuerySetParamValue('COUNTRY_ID', Elem_Country.GetValueId );
     //Elem_City.DBOpen;
     // TIBQuery(Elem_City.DB).FetchAll;

    { aValue:=Elem_Country.GetValueByFieldName('COUNTRY_ID_TO');
     Elem_CityTO.DBQuerySetParamValue( 'COUNTRY_ID_TO', aValue );
     Elem_CityTo.DBOpen;  }

     {Count:=0;
     while not Elem_City.DB.Eof do
     begin

        Inc(Count);
        Elem_City.DB.Next;

     end; }
