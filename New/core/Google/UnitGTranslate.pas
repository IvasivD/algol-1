unit UnitGTranslate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cefvcl, ceflib, Clipbrd, cefgui, StdCtrls, ExtCtrls,UnitGoogleMaps,UnitProc,
  Buttons, ComCtrls;

type
  TOptTranslateText = (optTranslateText, optTranslateHTML);
  TOptTranslateBrowser = (optTranslateIE,optTranslateChrome);

   TGoogleTranslate =class
   private
     FTimerReload:TTimer;
     FElemGoogleMaps:TGoogleMaps;
     FChromium: TChromium;
     FResultTranslate :WideString;
     FLastMessage :Widestring;
     FLastUlrLoad :Widestring;
     FCloseFormAfterTranslate:Boolean;
     FmarkerSendTranslate : Boolean;
     FOptTranslateText : TOptTranslateText;
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
      procedure Load(aUrl: string);
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
   end;


  TFrmGtranslate = class(TForm)
    Panel1: TPanel;
    PanelCaption: TPanel;
    LbProgres: TLabel;
    Chromium: TChromium;
    Panel2: TPanel;
    butRefresh: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ProgressBar: TProgressBar;
    procedure FormShow(Sender: TObject);
    procedure butRefreshClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
    FResultTranslate:WideString;
    FElemGoogle:TGoogleTranslate;

    FLngFrom :String;
    FLngTo  :String;
    FTextForTranslate : Widestring;
    FOptTranslateText : TOptTranslateText;

  public
    { Public declarations }
    CurrUrl:string;
    procedure Translate;
  end;



function PrepareTextHTMLBeforeTranslate(aTextHTML:Widestring):Widestring;
function PrepareTextHTMLAfterTranslate(aTextHTML:String):String;
Function ShowGTranslateText( CaptionTranslate:Widestring; LngFrom,LngTo,TextForTranslate:Widestring;
                             ProgressBarPos:Integer=-1;ProgresBarMax:Integer =-1;
                             TextNeedConvertToUrl:Boolean = true;
                             OptTranslateText: TOptTranslateText = optTranslateText; HeightForm:Integer=-1 ) : Widestring;

var
  FrmGtranslate: TFrmGtranslate;

implementation

{$R *.dfm}

Function ShowGTranslateText( CaptionTranslate:Widestring; LngFrom,LngTo,TextForTranslate:Widestring;
                             ProgressBarPos:Integer=-1;ProgresBarMax:Integer =-1;
                             TextNeedConvertToUrl:Boolean = true;
                             OptTranslateText: TOptTranslateText = optTranslateText; HeightForm:Integer=-1 ) : Widestring;
begin
  try
    Application.CreateForm(TFrmGtranslate, FrmGtranslate);
    FrmGtranslate.LbProgres.Caption := CaptionTranslate;
    FrmGtranslate.FElemGoogle  := TGoogleTranslate.Create(FrmGtranslate);
    FrmGtranslate.PanelCaption.Left := (FrmGtranslate.Width div 2) - (FrmGtranslate.PanelCaption.Width div 2);
    FrmGtranslate.PanelCaption.Top  := (FrmGtranslate.Height div 2) -(FrmGtranslate.PanelCaption.Height div 2);
    FrmGtranslate.ProgressBar.Visible := ProgresBarMax <>-1;
    if FrmGtranslate.ProgressBar.Visible then FrmGtranslate.ProgressBar.Position := ProgressBarPos;

    if (HeightForm <> -1) and ( HeightForm > FrmGtranslate.PanelCaption.Height ) then
      FrmGtranslate.Height := HeightForm;

    FrmGtranslate.Width := 355;

    FrmGtranslate.FLngFrom := LngFrom;
    FrmGtranslate.FLngTo := LngTo;

    if OptTranslateText = optTranslateHTML then
       TextForTranslate:= PrepareTextHTMLBeforeTranslate( Widestring(TextForTranslate) );

    FrmGtranslate.FTextForTranslate:= TextForTranslate;
    FrmGtranslate.FElemGoogle.FOptTranslateText:= OptTranslateText;


    FrmGtranslate.CurrUrl :=  FrmGtranslate.FElemGoogle.FElemGoogleMaps.GetUrlTranslate( LngFrom,LngTo,TextForTranslate, TextNeedConvertToUrl );
    FrmGtranslate.ShowModal;
    if OptTranslateText = optTranslateHTML then
      FrmGtranslate.FResultTranslate := PrepareTextHTMLAfterTranslate( FrmGtranslate.FResultTranslate );

    result := FrmGtranslate.FResultTranslate;
  finally
    FrmGtranslate.FElemGoogle.Close;
    FrmGtranslate.Free;
  end;
end;



procedure TGoogleTranslate.PseudoTranslate(Url:String);
begin
  self.FLastUlrLoad := Url;
  FChromium.Load( 'about:blank' );
  FmarkerSendTranslate:=True;
end;

{ TGTranslate }

destructor TGoogleTranslate.Close;
begin
  FTimerReload.Free;
  FElemGoogleMaps.Close;
  //CloseHromiumLib;
end;

function PrepareASpecialSymbol( aTextHTML,aChar:String):WideString;
var aWideTextHTML:WideString;
begin
  aWideTextHTML := aTextHTML;
  ReplaseON( aWideTextHTML ,' '+aChar+' ', aChar );
  ReplaseON( aWideTextHTML ,' '+aChar, aChar );
  ReplaseON( aWideTextHTML ,aChar+' ', aChar );
  result := aWideTextHTML;
end;

function PrepareTextHTMLAfterTranslate(aTextHTML:String):String;
var aWideTextHTML:WideString;
begin
  aWideTextHTML := aTextHTML;

  aWideTextHTML := PrepareASpecialSymbol( aWideTextHTML,'&');
  aWideTextHTML := PrepareASpecialSymbol( aWideTextHTML,'\');
  aWideTextHTML := PrepareASpecialSymbol( aWideTextHTML,'#');

  ReplaseON( aWideTextHTML ,'&ltslesh;','</');
  ReplaseON( aWideTextHTML ,'&lt ;','&lt;');
  ReplaseON( aWideTextHTML ,'&gt ;','&gt;');
  ReplaseON( aWideTextHTML ,'&lt;','<');
  ReplaseON( aWideTextHTML ,'&gt;','>');

  aWideTextHTML := PrepareASpecialSymbol( aWideTextHTML,'</');
  aWideTextHTML := PrepareASpecialSymbol( aWideTextHTML,'<');
  ReplaseON( aWideTextHTML ,'& nbsp','&nbsp');
  ReplaseON( aWideTextHTML ,'&lt;','<');
  ReplaseON( aWideTextHTML ,'&gt;','>');
  ReplaseON( aWideTextHTML ,'%20','');
  ReplaseON( aWideTextHTML ,'<br>',#13#10);

  result := aWideTextHTML;
end;

function PrepareTextHTMLBeforeTranslate(aTextHTML:Widestring):Widestring;
begin
  ReplaseON( aTextHTML ,'<','%3C');
  ReplaseON( aTextHTML ,'>','%3E');
  ReplaseON( aTextHTML ,'/','%2F');
  ReplaseON( aTextHTML ,#13#10,'%0A');
  ReplaseON( aTextHTML ,'=','%3D');
  ReplaseON( aTextHTML ,'"','%22');

  //ReplaseON( aTextHTML ,'</','&ltslesh;');
  //ReplaseON( aTextHTML ,'<','&lt;');
  //ReplaseON( aTextHTML ,'>','&gt;');
  //ReplaseON( aTextHTML ,'\','&aslesh;');
  result := aTextHTML;
end;

procedure TGoogleTranslate.FNewChromium(aOwner:TComponent);
begin
  if ( self.FChromium <> nil ) and (self.FChromium.Name = '') then
  begin
    FreeAndNil( self.FChromium );
  end;

  if (FrmGtranslate=nil) then
  begin
    self.FChromium := TChromium.Create( aOwner );
    //self.FChromium.DefaultEncoding := 'windows-1251';
    {self.FChromium.Left:=0;
    self.FChromium.Top:=0;
    self.FChromium.Width := 500;
    self.FChromium.Height := 500;  }

    FChromium.Parent := TWinControl( aOwner );
    self.FChromium.Visible := False;
  end else self.FChromium := FrmGtranslate.Chromium;

  //FChromium.Options := [ coPageCacheDisabled ];
  //self.FChromium.DefaultEncoding := 'windows-1251';
  FChromium.OnConsoleMessage := Self.ChromiumConsoleMessage;//11
  FChromium.OnLoadEnd := ChromiumLoadEnd;                     //11
end;


procedure TGoogleTranslate.RefreshNewChromium;
var aOwner:TComponent;
begin
  if self.FChromium <> nil then
  begin
    aOwner :=self.FChromium.Owner;
    FNewChromium(aOwner);
  end;
end;

constructor TGoogleTranslate.Create( FrmOwner:TForm );
begin
  FElemGoogleMaps := TGoogleMaps.Create();
  FTimerReload := TTimer.Create(nil);
  FTimerReload.Interval := 4500;

  FTimerReload.Enabled := False;
  FTimerReload.OnTimer := FOnTimerReload;

  self.FCloseFormAfterTranslate:= True;
  FNewChromium( FrmOwner );
end;

function TGoogleTranslate.FGetScriptForParse:string;
var FunStr:string;
begin
  if self.FOptTranslateText = optTranslateText then FunStr:='innerText';
  if self.FOptTranslateText = optTranslateHTML then FunStr:='innerHTML';

  result := 'if ( document.getElementsByClassName("tlid-translation translation").length!=0 )  { console.log( document.getElementsByClassName("tlid-translation translation")[0].'+FunStr+' ); } else console.log(''TypeError''); ';
end;

procedure TGoogleTranslate.FSendCommandForGetTranslateText(frame: ICefFrame);
begin
  if (Assigned(frame)) and ( frame.GetUrl <> 'about:blank' ) then
  begin
    //FChromium.Browser.GetFocusedFrame.ExecuteJavaScript('if ( document.getElementsByClassName("tlid-translation translation").length!=0 )  { console.log( document.getElementsByClassName("tlid-translation translation")[0].innerText ); } else console.log(''TypeError''); ', 'about:blank', 0);
    FChromium.Browser.GetFocusedFrame.ExecuteJavaScript( FGetScriptForParse , 'about:blank', 0);
    //self.FTimerReload.Enabled := True;
  end;
end;


//procedure TGoogleTranslate.ChromiumLoadEnd(Sender: TObject;
//  const browser: ICefBrowser; const frame: ICefFrame;
//  httpStatusCode: Integer);
procedure TGoogleTranslate.ChromiumLoadEnd(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  httpStatusCode: Integer; out Result: Boolean);
begin
  Application.ProcessMessages;
  try
   self.FTimerReload.Enabled := False;
   if (httpStatusCode <> 200) then
   begin
     //if self.FLastUlrLoad<> '' then
     //  FChromium.Load( self.FLastUlrLoad );
     Exit;
   end;
   if frame.GetUrl<>'about:blank' then
    begin
      //if (httpStatusCode = 200)and(FrmGtranslate<>nil) then FrmGtranslate.close;
      //self.FTimerReload.Enabled := False;
      FSendCommandForGetTranslateText( frame );
    end;
 finally

   if FmarkerSendTranslate then
   begin
     FmarkerSendTranslate :=False;
     FChromium.Load( self.FLastUlrLoad );
   end;
   //self.FTimerReload.Enabled := True;
 end;
end;

//procedure TGoogleTranslate.ChromiumConsoleMessage(Sender: TObject;
//  const browser: ICefBrowser; const message, source: ustring;
//  line: Integer; out Result: Boolean);
procedure TGoogleTranslate.ChromiumConsoleMessage(Sender: TObject;
  const browser: ICefBrowser; message, source: ustring; line: Integer;
  out Result: Boolean);
begin
  self.FTimerReload.Enabled := False;
  Application.ProcessMessages;
  FLastMessage := message;
  if (AnsiPos('TypeError', message )=0)and
     (message<>'Translating...')and
     (message<>'')and
     (message<>'undefined')and
     (message<>'0') then
  begin
    FResultTranslate:= message;
    if (Trim( message) <>'') then
    begin
      self.FTimerReload.Enabled := False;

      if (self.FCloseFormAfterTranslate )and(FrmGtranslate<>nil)and(FrmGtranslate.Showing) then
      begin
        FrmGtranslate.FResultTranslate := self.FResultTranslate;
        FrmGtranslate.Close;
      end;
    end
    else FLoadUrl( FLastUlrLoad );
  end
  else
  begin
     //FSendCommandForGetTranslateText( browser.GetFocusedFrame );
    if source<>'about:blank' then
      FSendCommandForGetTranslateText( browser.GetFocusedFrame )
    else
    begin
      //FSendCommandForGetTranslateText(browser.GetFocusedFrame);
      FLoadUrl( FLastUlrLoad );
    end;
  end;
end;

procedure TGoogleTranslate.FLoadUrl(aUrl:String);
begin
  self.FTimerReload.Enabled := True;
  self.FLastUlrLoad := aUrl;
  FChromium.Load( aUrl );
end;

function TGoogleTranslate.Translate( LngFrom, LngTo, TextForTranslate:Widestring;
                                     TextNeedConvertToUrl:Boolean = true; OptTranslate: TOptTranslateText=optTranslateText ):Widestring;
var Url:String;
begin
  //self.RefreshNewChromium;
  self.FTimerReload.Enabled := False;
  Url := FElemGoogleMaps.GetUrlTranslate( LngFrom, LngTo, TextForTranslate, TextNeedConvertToUrl );

  self.FResultTranslate := '^';
  if OptTranslate = optTranslateText then   FTimerReload.Interval := 4500;
  if OptTranslate = optTranslateHTML then   FTimerReload.Interval := 8000;

  FLoadUrl( Url );
  //FChromium.Load( Url );
  while self.FResultTranslate='^' do
  begin
    Application.ProcessMessages;
    if self.FResultTranslate ='' then
    begin
      self.FResultTranslate:='^';

      FLoadUrl( FLastUlrLoad );
      //FChromium.Load( FLastUlrLoad );
    end;
  end;

  self.FTimerReload.Enabled := False;
  result := self.FResultTranslate;
  result:= PrepareTextHTMLAfterTranslate( Widestring(Result) );
  FChromium.Load( FChromium.DefaultUrl );

end;

procedure TGoogleTranslate.FOnTimerReload(Sender: TObject);
begin
  self.FTimerReload.Enabled := False;
  //self.RefreshNewChromium;
  FLoadUrl( FLastUlrLoad );
end;

procedure TGoogleTranslate.SetUrl(aUrl: string);
begin
  self.FLastUlrLoad := aUrl;
end;

procedure TGoogleTranslate.Load(aUrl: string);
begin
  FTimerReload.Enabled := False;
  self.FChromium.Load(aUrl);
end;

procedure TGoogleTranslate.SetBrowser( Browser:TChromium );
begin
  if ( self.FChromium <> nil ) and (self.FChromium.Name = '') then
    self.FChromium.Free;
  self.FChromium := Browser;
  FChromium.OnConsoleMessage := Self.ChromiumConsoleMessage;  //11
  FChromium.OnLoadEnd := ChromiumLoadEnd;
end;

procedure TFrmGtranslate.Translate;
var Url:Widestring;
begin
  try
    Url := CurrUrl;
    self.FElemGoogle.SetUrl( Url );
    //if Self.FOptTranslBrowser = optTranslateChrome then
    self.FElemGoogle.Load(Url);
      
  except
    ShowMessage('помилка в Translate');
  end;
end;

procedure TFrmGtranslate.FormShow(Sender: TObject);
begin
  //self.FElemGoogle.Load( 'about:blank' );
  self.Translate;
  //Self.FElemGoogle.Translate( FLngFrom, FLngTo, FTextForTranslate, True, FOptTranslateText )
end;

procedure TFrmGtranslate.butRefreshClick(Sender: TObject);
begin
  self.Translate;
end;

procedure TFrmGtranslate.SpeedButton2Click(Sender: TObject);
begin
  FResultTranslate:='^';
  Close;
end;

end.
