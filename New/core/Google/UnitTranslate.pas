unit UnitTranslate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, OleCtrls, SHDocVw, UnitGoogleMaps,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
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
  cxPCdxBarPopupMenu, cxPC,UnitProc, cefvcl,ceflib,Clipbrd,cefgui,UnitGTranslate;

type


 { TGoogleTranslate =class
   private
     FTimerReload:TTimer;
     FElemGoogle:TGoogleMaps;
     FChromium: TChromium;
     FWebBrowser:TWebBrowser;
     FResultTranslate :WideString;
     FLastMessage :Widestring;
     FLastUlrLoad :Widestring;
     FCloseFormAfterTranslate:Boolean;
     FmarkerSendTranslate : Boolean;

     procedure PseudoTranslate( Url:String );
     procedure FNewChromium(aOwner:TComponent);
     procedure FLoadUrl(aUrl:String);
     procedure FOnTimerReload(Sender: TObject);

    // procedure ChromiumLoadEnd(Sender: TObject;
    //  const browser: ICefBrowser; const frame: ICefFrame;
    //  httpStatusCode: Integer);
     procedure ChromiumLoadEnd(Sender: TObject;
     const browser: ICefBrowser; const frame: ICefFrame;
     httpStatusCode: Integer; out Result: Boolean);


   public
      constructor Create(FrmOwner:TForm);
      Destructor  Close;
      function  FGetScriptForParse:string;
      procedure FSendCommandForGetTranslateText(frame: ICefFrame);
      procedure SetUrl(aUrl:string);
      procedure SetBrowser(Browser:TChromium);
      //procedure ChromiumConsoleMessage(Sender: TObject;
      //const browser: ICefBrowser; const message, source: ustring;
      //line: Integer; out Result: Boolean);

      procedure ChromiumConsoleMessage(Sender: TObject;
      const browser: ICefBrowser; message, source: ustring; line: Integer;
      out Result: Boolean);


      procedure RefreshNewChromium;
      function Translate( LngFrom, LngTo, TextForTranslate:Widestring;
                          TextNeedConvertToUrl:Boolean = true; OptTranslate: TOptTranslateText=optTranslateText ):Widestring;
   end;  }

  TFormGtranslater = class(TForm)
    PanelTop: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    butTranslate: TButton;
    EditLngTo: TEdit;
    EditLngFrom: TEdit;
    MemTextFrom: TMemo;
    Splitter1: TSplitter;
    PageControlTransl: TcxPageControl;
    TabChrome: TcxTabSheet;
    TabIE: TcxTabSheet;
    WebBrowser: TWebBrowser;
    Chromium: TChromium;
    TimerAutoRun: TTimer;
    Panel2: TPanel;
    Edit1: TEdit;
    Button1: TButton;
    Panel3: TPanel;
    Edit2: TEdit;
    Button2: TButton;
    Button3: TButton;
    procedure butTranslateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TimerAutoRunTimer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);

  private
    ElemGoogle:TGoogleMaps;
    FTextNeedConvertToUrl:Boolean;
    FAutoTranslate :Boolean;
    FResultTranslate:Widestring;
    FOptTranslateText: TOptTranslateText;
    FTextTranstale :Widestring;
    //FGoogleTranslateElem : TGoogleTranslate;
    FOptTranslBrowser:TOptTranslateBrowser;
    function  FGetCurrUrl:string;
    procedure FPrepareToIETranslate;
    procedure FPrepareToChromiumTranslate;

    procedure FSendCommandForGetTranslateText(frame: ICefFrame);
    procedure FWebBrowserDocumentComplete(Sender: TObject;
              const pDisp: IDispatch; var URL: OleVariant);
    { Private declarations }
  public
    ParamLngFrom:WideString;
    ParamLngTo:WideString;
    ParamTextForTranslate:WideString;

    procedure Translate;

    { Public declarations }
  end;

  TGoogleTranslateIE =class
  private
      FFormTranslate:TFormGtranslater;
      FWebBrowser : TWebBrowser;
      FTimerAutoRun: TTimer;
      FElemGoogle:TGoogleMaps;
      FResultTranslate:Widestring;
      FAutoTranslate:Boolean;
      FLngFrom:Widestring;
      FLngTo :Widestring;
      FText :Widestring;
      procedure FOnFormShow(Sender: TObject);
      procedure FPrepareToIETranslate;
      procedure FWebBrowserDocumentComplete(Sender: TObject; const pDisp: IDispatch; var URL: OleVariant);
      procedure FTimerAutoRunTimer(Sender: TObject);
      procedure FTranslate;
  public
      constructor Create;
      Destructor  Close;
      Function Translate( LngFrom,LngTo:String; aText:Widestring;
                          TextNeedConvertToUrl:Boolean = true; OptTranslate: TOptTranslateText=optTranslateText ):Widestring;
  end;


 procedure CloseHromiumLib;
 procedure LoadHromiumLib;
 //function PrepareTextHTMLBeforeTranslate(aTextHTML:Widestring):Widestring;
 //function PrepareTextHTMLAfterTranslate(aTextHTML:String):String;

 function ShowTranslateText( LngFrom,LngTo,TextForTranslate:Widestring; TextNeedConvertToUrl:Boolean = true;
                            AutoTranslate :Boolean = True; OptTranslateText: TOptTranslateText = optTranslateText;
                            OptTranslBrowser:TOptTranslateBrowser=optTranslateChrome  ):Widestring;
var
  FormGtranslater: TFormGtranslater;

implementation

{$R *.dfm}

function ShowTranslateText(LngFrom,LngTo,TextForTranslate:Widestring; TextNeedConvertToUrl:Boolean = true;
                           AutoTranslate :Boolean = True; OptTranslateText: TOptTranslateText = optTranslateText;
                           OptTranslBrowser:TOptTranslateBrowser=optTranslateChrome ):Widestring;
begin
  try
   Application.CreateForm(TFormGtranslater, FormGtranslater);
   FormGtranslater.ElemGoogle:=TGoogleMaps.Create();

   //FormGtranslater.FGoogleTranslateElem := TGoogleTranslate.Create( FormGtranslater );
   FormGtranslater.FOptTranslBrowser := OptTranslBrowser;
   //FormGtranslater.FGoogleTranslateElem.SetBrowser( FormGtranslater.Chromium );

   FormGtranslater.EditLngFrom.Text := LowerCase( LngFrom );
   FormGtranslater.EditLngTo.Text := LowerCase( LngTo );
   FormGtranslater.FTextNeedConvertToUrl := TextNeedConvertToUrl;

   //FormGtranslater.FGoogleTranslateElem.FmarkerSendTranslate := False;
   FormGtranslater.FOptTranslateText:= OptTranslateText;

   FormGtranslater.FAutoTranslate:=AutoTranslate;
   //FormGtranslater.PanelTop.Visible := not AutoTranslate;

   if OptTranslateText = optTranslateHTML then
     TextForTranslate := PrepareTextHTMLBeforeTranslate( TextForTranslate );

   FormGtranslater.FTextTranstale := TextForTranslate;
   FormGtranslater.MemTextFrom.Lines.Text := TextForTranslate;

   if OptTranslBrowser = optTranslateIE then
     FormGtranslater.FPrepareToIETranslate
   else
   if OptTranslBrowser = optTranslateChrome then
     FormGtranslater.FPrepareToChromiumTranslate;

   FormGtranslater.ShowModal;
   result := FormGtranslater.FResultTranslate;

   if OptTranslateText = optTranslateHTML then
     result:= PrepareTextHTMLAfterTranslate( result );

  finally
   //FormGtranslater.FGoogleTranslateElem.free;
   FormGtranslater.ElemGoogle.Free;
   FormGtranslater.free;
  end;
end;



procedure TFormGtranslater.FPrepareToChromiumTranslate;
begin
  //Chromium.OnConsoleMessage := FGoogleTranslateElem.ChromiumConsoleMessage; //11
  //Chromium.OnLoadEnd := FGoogleTranslateElem.ChromiumLoadEnd;               //11
  PageControlTransl.ActivePage := TabChrome;
end;

procedure TFormGtranslater.FPrepareToIETranslate;
begin
  //Chromium.OnConsoleMessage := FGoogleTranslateElem.ChromiumConsoleMessage; //11
  //Chromium.OnLoadEnd := FGoogleTranslateElem.ChromiumLoadEnd;               //11

  WebBrowser.OnDocumentComplete := FWebBrowserDocumentComplete;
  PageControlTransl.ActivePage := TabIE;
end;

function TFormGtranslater.FGetCurrUrl:string;
var aText:Widestring;
begin
   if FAutoTranslate then aText := FTextTranstale
   else aText:= MemTextFrom.Text;
   result := ElemGoogle.GetUrlTranslate( EditLngFrom.Text, EditLngTo.Text, aText, FTextNeedConvertToUrl );
end;

procedure TFormGtranslater.Translate;
var Url:Widestring;
begin
  try
    Url := FGetCurrUrl;

    if Self.FOptTranslBrowser = optTranslateIE then WebBrowser.Navigate( Url );
    if Self.FOptTranslBrowser = optTranslateChrome then
    begin
      //FGoogleTranslateElem.SetUrl(Url);
      Chromium.Load( Url );
    end;
  except
    ShowMessage('помилка в Translate');
  end;
end;

procedure TFormGtranslater.FSendCommandForGetTranslateText(frame: ICefFrame);
begin
  try
    if (Assigned(frame)) and ( frame.GetUrl<>'about:blank' ) then
      frame.ExecuteJavaScript('console.log( document.getElementById("result_box").innerText );', 'about:blank', 0);
  except
    ShowMessage('помилка в FSendCommandForGetTranslateText');
  end;
end;

procedure TFormGtranslater.butTranslateClick(Sender: TObject);
begin
  Translate;
end;

procedure TFormGtranslater.FormShow(Sender: TObject);
begin
 //PageControlTransl.HideTabs:=True;

 if FAutoTranslate then
   Self.Translate;
    //Chromium.Load('about:version');
   //self.FGoogleTranslateElem.PseudoTranslate(self.FGetCurrUrl);
  //  FGoogleTranslateElem.Translate(EditLngFrom.Text, EditLngTo.Text, self.FTextTranstale, True, FOptTranslateText);
  //Translate;
end;

procedure TFormGtranslater.FormCreate(Sender: TObject);
begin
   FAutoTranslate:=False;
end;

procedure TFormGtranslater.FWebBrowserDocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
 {if not ElemGoogle.FindResultTranslate( WebBrowser ) then
   begin
     sleep(100);
     FResultTranslate := ElemGoogle.ParseResultTranslate( WebBrowser );
     if FResultTranslate = '' then
     begin
       TimerAutoRun.Enabled := True;
       exit;
     end;
   end
   else TimerAutoRun.Enabled := False;

   if FAutoTranslate then
   begin
     FResultTranslate := ElemGoogle.ParseResultTranslate( WebBrowser );
     Close;
   end;}
end;

procedure CloseHromiumLib;
begin
  CefShutDown;
end;

procedure LoadHromiumLib;
begin
   CefLoadLibDefault;
end;

procedure TFormGtranslater.TimerAutoRunTimer(Sender: TObject);
begin
  TimerAutoRun.Enabled := False;

  WebBrowser.Navigate('about:blank');
  while WebBrowser.ReadyState < READYSTATE_INTERACTIVE do Application.ProcessMessages;

  Translate;
end;

{ TGoogleTranslateIE }
constructor TGoogleTranslateIE.Create;
begin
  Application.CreateForm(TFormGtranslater, FFormTranslate);
  FFormTranslate.OnShow := FOnFormShow;
  FFormTranslate.PanelTop.Visible := False;
  FFormTranslate.PageControlTransl.ActivePage := FFormTranslate.TabIE;
  FWebBrowser := FFormTranslate.WebBrowser; //TWebBrowser.Create(FFormTranslate);
  FWebBrowser.Align := alClient;
  FPrepareToIETranslate;
  FTimerAutoRun:=TTimer.Create(FFormTranslate);
  FTimerAutoRun.Enabled := False;
  FTimerAutoRun.OnTimer := FTimerAutoRunTimer;
  FElemGoogle:=TGoogleMaps.Create();
end;

procedure TGoogleTranslateIE.FPrepareToIETranslate;
begin
  FWebBrowser.OnDocumentComplete := FWebBrowserDocumentComplete;
end;

procedure TGoogleTranslateIE.FWebBrowserDocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
 (*if not FElemGoogle.FindResultTranslate( FWebBrowser ) then
   begin
    { sleep(100);
     FResultTranslate := FElemGoogle.ParseResultTranslate( FWebBrowser );
     if FResultTranslate = '' then
     begin
       FTimerAutoRun.Enabled := True;
       exit;
     end;}
   end
   else FTimerAutoRun.Enabled := False; *)

   //if FAutoTranslate then
   begin
     FResultTranslate := FElemGoogle.ParseResultTranslate( FWebBrowser );
     ShowMessage(FResultTranslate);
   end;
end;

procedure TGoogleTranslateIE.FOnFormShow(Sender: TObject);
var Url:Widestring;
begin
  Url := FElemGoogle.GetUrlTranslate( FLngFrom, FLngTo, FText, false );
  FWebBrowser.Navigate( Url );
end;

procedure TGoogleTranslateIE.FTranslate;
begin
   FTimerAutoRun.Enabled := False;
   FFormTranslate.Caption:='Зачекайте';
   FFormTranslate.ShowModal;
end;

Function TGoogleTranslateIE.Translate(LngFrom,LngTo:String; aText:Widestring;
                                      TextNeedConvertToUrl:Boolean = true; OptTranslate: TOptTranslateText=optTranslateText ):Widestring;
begin
  FLngFrom:=LngFrom;
  FLngTo :=LngTo;
  FText := aText;
  FTranslate;

  result := FResultTranslate;
end;

procedure TGoogleTranslateIE.FTimerAutoRunTimer(Sender: TObject);
begin
  FTimerAutoRun.Enabled := False;

  FWebBrowser.Navigate('about:blank');
  while FWebBrowser.ReadyState < READYSTATE_INTERACTIVE do Application.ProcessMessages;

  FTranslate;
end;

destructor TGoogleTranslateIE.Close;
begin
  FFormTranslate.Free;
  FElemGoogle.Close;
end;

procedure TFormGtranslater.Button1Click(Sender: TObject);
begin
  WebBrowser.Navigate( Edit1.Text );
end;

procedure TFormGtranslater.Button2Click(Sender: TObject);
begin
  Chromium.Load(Edit2.Text);
end;

procedure TFormGtranslater.Button3Click(Sender: TObject);
begin
  Chromium.Browser.GetFocusedFrame.ExecuteJavaScript('if ( document.getElementsByClassName("tlid-translation translation").length!=0 )  { console.log( document.getElementsByClassName("tlid-translation translation")[0].innerText ); } else console.log(''TypeError''); ', 'about:blank', 0);
end;



end.
// All version GHrome
// https://code.google.com/archive/p/delphichromiumembedded/downloads

//var OptParseHtmlText: TOptParseHtmlText;
{ if not ElemGoogle.FindResultTranslate( WebBrowser ) then
   begin
     sleep(100);
     FResultTranslate := ElemGoogle.ParseResultTranslate( WebBrowser );
     if FResultTranslate = '' then
     begin
       TimerAutoRun.Enabled := True;
       exit;
     end;
   end
   else TimerAutoRun.Enabled := False;

   if FAutoTranslate then
   begin
     if self.FOptTranslateText = optTranslateText then OptParseHtmlText := OptParseHtmlInnerText;
     if self.FOptTranslateText = optTranslateHTML then OptParseHtmlText := OptParseHtmlInnerText;

     FResultTranslate := ElemGoogle.ParseResultTranslate( WebBrowser,OptParseHtmlText );
     Close;
   end; }
