unit UnitFrameDescriptionWebHTML;

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
  cefvcl, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxGridTableView,
  ExtCtrls, Buttons,UnitProc,Core,UnitLngTranslateEdit, ImgList, UnitGTranslate,OptSet,OrderUn;

type
  TPropertyDescriptWeb = record
     WebSourcePath:string;

     PathToImage:string;
     PathRootToHtml:string;
     MessNotSelectLNGDescript:string;
     MessFileTranslateForLngNotFound:string;
     ElemFor:TDBShema;
     ViewStyle:TcxGridTableViewStyles;
     LocalLang:Integer;
     PathToHtmlEditor:string;
     GoogleTranslateElem:TGoogleTranslate;
     ShowTopPanel : boolean;
  end;

  TFrameDescriptionWebHTML = class(TFrame)
    PanelDescriptHTML: TPanel;
    PanelTop: TPanel;
    butEditDecript: TSpeedButton;
    BevelLng: TBevel;
    ButCountryDescriptLng: TSpeedButton;
    WebBrowserDicDesctript: TChromium;
    ImageListLng: TImageList;
    Panel1: TPanel;
    CmbSelectLngDescript: TcxImageComboBox;
    procedure butEditDecriptClick(Sender: TObject);
    procedure CmbSelectLngDescriptPropertiesChange(Sender: TObject);
    procedure ButCountryDescriptLngClick(Sender: TObject);

  private
    FMessNotSelectLNGDescript : TPropertyDescriptWeb;
    FLngIdent : TLngIdentArr;

    function FCheckSelectedLNGForDescript(ShowMessage:Boolean):Boolean;
    function FGetCurrentPathFileToDescriptHTML:Widestring;
    function FGetFolderSelectedLNG:String;
    function FGetCurrentPathToDescriptHTML:Widestring;
    function FGetCurrentPathToDescriptIMAGES:Widestring;
    function FShowBrowserCurrentPathToDescriptHTML:Boolean;
    procedure FRefreshLngDescriptForExcursion;
    function FCheckFindFileTranslateForLngId( LngId:variant;FileName:String;MessageError:Boolean=true ):Boolean;
    { Private declarations }
  public
    procedure Prepare( aMessNotSelectLNGDescript : TPropertyDescriptWeb; UseMultiLng:Boolean = True );
    procedure RefreshShowCurrDescription;
    procedure SetEnabled( En:Boolean );
    function  GetHtmlSource:widestring;
    function  GetHtmlInnerText:widestring;
    procedure SetHtmlInnerText( aText:String );
    { Public declarations }
  end;

  function PepareFrameDesription( Elem:TDBShema; PathDescript,PathImage:String; ViewStyle:TcxGridTableViewStyles; ShowTopPanel : boolean=true ):TPropertyDescriptWeb;

implementation

uses ceflib;

{$R *.dfm}

function TFrameDescriptionWebHTML.FCheckSelectedLNGForDescript(ShowMessage:Boolean):Boolean;
begin
  if CmbSelectLngDescript.EditValue <> null then
    Result := True
  else
  begin
    if ShowMessage then
      MyShowMessageDlg( FMessNotSelectLNGDescript.MessNotSelectLNGDescript, mtError, but_Ok );
    Result := False;
  end;
end;

function TFrameDescriptionWebHTML.FGetFolderSelectedLNG:String;
begin
  if ( CmbSelectLngDescript.EditValue <> null ) and ( CmbSelectLngDescript.Visible ) then
    result := AddNolForLengthNumber( CmbSelectLngDescript.EditValue, 4 )
  else result :='';
end;

function TFrameDescriptionWebHTML.FGetCurrentPathToDescriptHTML:Widestring;
begin
  if FGetFolderSelectedLNG <> '' then
  begin
    if ExtractFileName( self.FMessNotSelectLNGDescript.PathRootToHtml) ='' then
      result := self.FMessNotSelectLNGDescript.PathRootToHtml + FGetFolderSelectedLNG+ '\'
      else result := self.FMessNotSelectLNGDescript.PathRootToHtml;
  end
  else result :='';
end;

function TFrameDescriptionWebHTML.FGetCurrentPathFileToDescriptHTML:Widestring;
begin
  if FGetFolderSelectedLNG <> '' then
  begin
    if ExtractFileName( FGetCurrentPathToDescriptHTML) = '' then
      result := FGetCurrentPathToDescriptHTML + AddNolForLengthNumber( self.FMessNotSelectLNGDescript.ElemFor.GetValueIdStr,4) + '.php'
    else result := FGetCurrentPathToDescriptHTML;
  end
  else result :='';
end;

function TFrameDescriptionWebHTML.GetHtmlSource:widestring;
begin
  if WebBrowserDicDesctript.Browser.MainFrame <> nil then
    result := WebBrowserDicDesctript.Browser.MainFrame.GetSource
  else result := '';
end;

function TFrameDescriptionWebHTML.GetHtmlInnerText:widestring;
begin
  if WebBrowserDicDesctript.Browser.MainFrame <> nil then
    result := WebBrowserDicDesctript.Browser.MainFrame.Text
  else result := '';
end;

procedure TFrameDescriptionWebHTML.SetHtmlInnerText( aText:String );
var FileHTML:Widestring;
begin
  FileHTML := FGetCurrentPathFileToDescriptHTML;
  if WebBrowserDicDesctript.Browser.GetMainFrame <> nil then
    WebBrowserDicDesctript.Browser.GetMainFrame.LoadString( aText, FileHTML );
end;

function TFrameDescriptionWebHTML.FGetCurrentPathToDescriptIMAGES:Widestring;
begin
  if FGetFolderSelectedLNG <> '' then
    result :=  self.FMessNotSelectLNGDescript.PathToImage  {AddNolForLengthNumber( self.FMessNotSelectLNGDescript.ElemFor.GetValueIdStr, 4 ) + '\'}
  else result :='';
end;

function TFrameDescriptionWebHTML.FShowBrowserCurrentPathToDescriptHTML:Boolean;
var FileHTML:Widestring;
    FileTempHTML:Widestring;
    FileImagePath:Widestring;
    HtmlContent:TStringList;
begin
  FileHTML := FGetCurrentPathFileToDescriptHTML;
  HtmlContent := PrpareBlockFileContentToPrefixPathShow( FileHtml ,  PreparePathToWebPath( self.FMessNotSelectLNGDescript.WebSourcePath ), '#ffffe1' );

  if FileExists(FileHTML) then
  begin
    WebBrowserDicDesctript.Load( FileHTML );
    result:=True;
  end
  else result:=False;

  WebBrowserDicDesctript.Browser.GetMainFrame.LoadString( HtmlContent.Text, FileHTML );
end;

procedure TFrameDescriptionWebHTML.butEditDecriptClick(Sender: TObject);
var HtmlParam:String;
    FileHTML:String;
    FileHTMLTxtCorrectProblem:String;
begin
  if not FCheckSelectedLNGForDescript(True) then Exit;
  if self.FMessNotSelectLNGDescript.ElemFor.GetValueId=null then Exit;

  FileHTML := FGetCurrentPathFileToDescriptHTML;
  if FileHTML <>'' then
  begin
    ExistsDir( FileHTML );

    HtmlParam :='"'+FGetCurrentPathFileToDescriptHTML+'" '+'"content"'+' "'+FGetCurrentPathToDescriptIMAGES+'"';
    if RunExeFileAndWait( self.FMessNotSelectLNGDescript.PathToHtmlEditor+' ' +HtmlParam ,NORMAL_PRIORITY_CLASS ) then
      RefreshShowCurrDescription;
  end;
end;

procedure TFrameDescriptionWebHTML.CmbSelectLngDescriptPropertiesChange(
  Sender: TObject);
begin
  RefreshShowCurrDescription;
end;

procedure TFrameDescriptionWebHTML.RefreshShowCurrDescription;
begin
  FShowBrowserCurrentPathToDescriptHTML;
  FRefreshLngDescriptForExcursion;
end;

procedure TFrameDescriptionWebHTML.FRefreshLngDescriptForExcursion;
begin
  PrepareCmbSelectLngImageAtantion( CmbSelectLngDescript, FLngIdent,
                                    self.FMessNotSelectLNGDescript.PathRootToHtml,
                                    ExtractFileName( FGetCurrentPathFileToDescriptHTML ), ImageListLng, 0 );
end;

procedure TFrameDescriptionWebHTML.Prepare( aMessNotSelectLNGDescript : TPropertyDescriptWeb; UseMultiLng:Boolean = True );
begin
  FMessNotSelectLNGDescript := aMessNotSelectLNGDescript;
  PanelTop.Visible := aMessNotSelectLNGDescript.ShowTopPanel;

  if (UseMultiLng)and(PanelTop.Visible) then
  begin
    self.FLngIdent := GetListIdLng( self.FMessNotSelectLNGDescript.ElemFor.DBGetParamConnect );
    PrepareCmbSelectLng( CmbSelectLngDescript, self.FLngIdent, self.FMessNotSelectLNGDescript.LocalLang );
  end
  else
  begin
    CmbSelectLngDescript.Visible := False;
    ButCountryDescriptLng.Visible := False;
    BevelLng.Visible := False;
  end;

  RefreshShowCurrDescription;
end;

function TFrameDescriptionWebHTML.FCheckFindFileTranslateForLngId( LngId:variant;FileName:String;MessageError:Boolean=true ):Boolean;
var CurSelLngObj:TLngIdent;
begin
  if LngId <> null then
  begin
    CurSelLngObj := GetObjLngById( self.FLngIdent, LngId );
    if not FileExists( FileName ) then
    begin
      if MessageError then MyShowMessageDlg( self.FMessNotSelectLNGDescript.MessFileTranslateForLngNotFound+' "'+CurSelLngObj.lngName+'"', mtError,but_OK);
      result := False;
      exit;
    end
    else result := True;
  end;
end;


procedure TFrameDescriptionWebHTML.ButCountryDescriptLngClick(
  Sender: TObject);
var FileHTML:Widestring;
    CurrSelectedIdent:string;
    CurSelLngObj:TLngIdent;
begin
  if not CmbSelectLngDescript.Visible then exit;
  if self.FMessNotSelectLNGDescript.ElemFor.GetValueId=null then Exit;

  FileHTML := FGetCurrentPathFileToDescriptHTML;
  CurSelLngObj := GetObjLngById( self.FLngIdent, CmbSelectLngDescript.EditValue );
  if not FCheckFindFileTranslateForLngId( CmbSelectLngDescript.EditValue, FileHTML ) then Exit;

  CurrSelectedIdent := CurSelLngObj.Ident;

  if ShowTranslateLngHTML( self.FMessNotSelectLNGDescript.ElemFor, self.FMessNotSelectLNGDescript.GoogleTranslateElem,
                           FMessNotSelectLNGDescript.WebSourcePath,
                           self.FMessNotSelectLNGDescript.PathRootToHtml,
                           FGetCurrentPathToDescriptIMAGES, FileHTML,
                           CurrSelectedIdent, self.FMessNotSelectLNGDescript.ViewStyle ) then RefreshShowCurrDescription;
end;

procedure TFrameDescriptionWebHTML.SetEnabled(En: Boolean);
begin
  WebBrowserDicDesctript.Enabled := En and self.Enabled;
  butEditDecript.Enabled := En and self.Enabled;
  ButCountryDescriptLng.Enabled := En and self.Enabled;
end;

function PepareFrameDesription( Elem:TDBShema; PathDescript,PathImage:String; ViewStyle:TcxGridTableViewStyles; ShowTopPanel : boolean=true ):TPropertyDescriptWeb;
begin
  result.ElemFor := Elem;
  result.WebSourcePath := OptionSet.WebSourcePath;//PathDescript;
  result.PathToImage := PathImage;

  result.PathRootToHtml := PathDescript;
  result.MessNotSelectLNGDescript := MessNotSelectLNGDescript;
  result.MessFileTranslateForLngNotFound := MessFileTranslateForLngNotFound;
  result.LocalLang := nLocalLang;
  result.ViewStyle := ViewStyle;
  result.PathToHtmlEditor := OptionSet.HtmlEditor;//ExtractFilePath(Application.ExeName)+'HTMLEditor.exe';
  result.GoogleTranslateElem := nil;
  result.ShowTopPanel := ShowTopPanel;
end;




end.
