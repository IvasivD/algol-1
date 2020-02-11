unit SetFrame;

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
  cxMaskEdit, cxDropDownEdit, cxImageComboBox, StdCtrls, cxTextEdit,
  ComCtrls, Buttons, ExtCtrls, cxSpinEdit, cxCheckBox,MSHTML_TLB,DHTMLEDLib_TLB;

const DefWithValue = 500;
      DefHeightValue = 500;
type
  TOptInsertObject =(optInObjFrame,optInObjVideo);
  TSizeStyle = record
    value:String;
    StrechPrc:Boolean;
  end;
  TFrmUpdateIFrame = class(TForm)
    Panel1: TPanel;
    SbtOK: TSpeedButton;
    SbtClose: TSpeedButton;
    PageControl: TPageControl;
    TabProperty: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EdPicture: TcxTextEdit;
    EdAlt: TcxTextEdit;
    GroupBoxAlign: TGroupBox;
    Label4: TLabel;
    SelAlign: TcxImageComboBox;
    GroupBoxInterval: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    EdHSpace: TcxTextEdit;
    EdVSpace: TcxTextEdit;
    GroupBoxSize: TGroupBox;
    EdWidth: TcxSpinEdit;
    EdHeight: TcxSpinEdit;
    LbWidth: TLabel;
    LbHeight: TLabel;
    GroupBoxAdd: TGroupBox;
    Label5: TLabel;
    EdBorder: TcxSpinEdit;
    ChBxAutoPlay: TcxCheckBox;
    ChBxRepeatPlay: TcxCheckBox;
    Label13: TLabel;
    EdName: TcxTextEdit;
    CheckWidth: TcxCheckBox;
    CheckHeight: TcxCheckBox;
    ButSelSrc: TButton;
    ChBxMutePlay: TcxCheckBox;
    procedure SbtOKClick(Sender: TObject);
    procedure SbtCloseClick(Sender: TObject);
    procedure EdHSpaceKeyPress(Sender: TObject; var Key: Char);
    procedure EdNameKeyPress(Sender: TObject; var Key: Char);
    procedure cxCheckWidthPropertiesEditValueChanged(Sender: TObject);
    procedure cxCheckHeightPropertiesEditValueChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ButSelSrcClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    FTypeObject:TOptInsertObject;
    function  FGetSrc:string;
    procedure ReadParamVideo( HTMLEl :IHTMLElement);
    procedure ReadParam( HTMLEl :IHTMLElement);
    procedure ReadParamYoutube( url:Widestring );
    procedure SetParam( HTMLEl :IHTMLElement);
    procedure SetParamVide( HTMLEl :IHTMLElement);
    procedure NewObject(DHTML:TDHTMLEdit);

    function  FFormingCurrHTML:widestring;
    function  FPrepareYoutubeUrl(idYoutube:Widestring):String;
    function  FYoutubeUrlWithoutParam( url:Widestring ):WideString;

    function  FGetMaskSelectFileSrc:string;
    function  FGetHeightParam:string;
    function  FGetWidthParam:string;
    function  FGetPlayVideoParam:string;
    procedure RefreshControl;
    { Private declarations }
  public
    { Public declarations }
  end;
  function  InsertIframeObject( DHTML:TDHTMLEdit; Anew:Boolean; aFileNameWhenNew:string='' ):Boolean;
  function  InsertIframeYouTube( DHTML:TDHTMLEdit; Anew:Boolean; aFileNameWhenNew:string='' ):boolean;
  function  InsertVideoObject( DHTML:TDHTMLEdit; Anew:Boolean; aFileNameWhenNew:string='' ):Boolean;
  function  ElemIsIFrameAndYoutube(DHTML:TDHTMLEdit):boolean;
  function  ElemIsObjectAndVideo(DHTML:TDHTMLEdit):boolean;
var
  FrmUpdateIFrame: TFrmUpdateIFrame;

implementation
uses UnitProc,UnitHTMLEditor;
{$R *.dfm}

function ElemIsIFrameAndYoutube(DHTML:TDHTMLEdit):boolean;
var ctrlrange: ihtmlcontrolrange;
    AFlag:OleVariant;
    src:OleVariant;
begin
  result:=False;
  ctrlrange := DHTML.DOM.selection.createRange as ihtmlcontrolrange;
  if CompareText(ctrlrange.commonParentElement.tagName , 'IFRAME')=0 then
  begin
   src:= ctrlrange.commonParentElement.getAttribute('src',AFlag);
   if (src<>null) and (src<>'') then
   result:= AnsiPos('www.youtube.com',string(src)) <> 0;
  end;
end;

function ElemIsObjectAndVideo(DHTML:TDHTMLEdit):boolean;
var ctrlrange: ihtmlcontrolrange;
    AFlag:OleVariant;
    src:OleVariant;
    ElemFirstChild:OleVariant;
    k:Integer;
    s:string;
begin
  result:=False;
  ctrlrange := DHTML.DOM.selection.createRange as ihtmlcontrolrange;

  if CompareText(ctrlrange.commonParentElement.tagName , 'OBJECT')=0 then
    result:=AnsiPos('<video', ctrlrange.commonParentElement.innerHTML ) <> 0;
end;

function PrepareAttributeSize( AValuStr:Widestring ):TSizeStyle;
begin
  if AnsiPos('%',AValuStr)<>0 then Result.StrechPrc:=True
  else Result.StrechPrc:=False;

  ReplaseOn(AValuStr,'"','');
  ReplaseOn(AValuStr,'px','');
  ReplaseOn(AValuStr,'%','');

  result.value:=AValuStr;
end;

function GetStyleAttribute(HTMLEl :IHTMLElement; attributeName:Widestring):TSizeStyle;
var AValue:OleVariant;
    AFlag:OleVariant;
    AValuStr:Widestring;
begin
  result.value:='';
  result.StrechPrc:=false;
  AValue:=HTMLEl.style.getAttribute(attributeName ,AFlag);
  if (AValue = null)or(AValue = '') then AValue:=HTMLEl.getAttribute( attributeName ,AFlag);
  if (AValue <> null)or(AValue = '') then
    result := PrepareAttributeSize( AValue );
end;

procedure TFrmUpdateIFrame.ReadParam( HTMLEl :IHTMLElement);
var AFlag:OleVariant;
    Astr:OleVariant;
    aStrValue:WideString;
    aValueSize:TSizeStyle;
begin
   Astr := HTMLEl.getAttribute('src',AFlag);
   if (Astr<>null) then
   begin
     EdPicture.text:=Astr;
     if (GroupBoxAdd.Visible)and(self.FTypeObject = optInObjFrame) then ReadParamYoutube( Astr );
   end;

   Astr := HTMLEl.getAttribute( 'id', AFlag );
   if (Astr=null)or(Astr='') then Astr := HTMLEl.getAttribute( 'name', AFlag );
   if (Astr<>null)and(Astr<>'') then EdName.Text:= Astr;

   Astr := HTMLEl.getAttribute('alt',AFlag);
   if (Astr<>null) then EdAlt.text :=Astr;

   Astr := HTMLEl.getAttribute('border',AFlag);
   if (Astr<>null) then EdBorder.text :=Astr;

   Astr := HTMLEl.getAttribute('hspace',AFlag);
   if (Astr<>null) then
   begin
     aStrValue:=Astr;
     if (aStrValue<>'')and(aStrValue<>'0')then EdHSpace.text :=aStrValue;
   end;

   Astr := HTMLEl.getAttribute('vspace',AFlag);
   if (Astr<>null) then
   begin
     aStrValue := Astr;
     if (aStrValue<>'')and(aStrValue<>'0')then Edvspace.text :=aStrValue;
   end;

   Astr := HTMLEl.getAttribute('align',AFlag);
   if (Astr<>null) then SelAlign.EditValue:=Astr;

   aValueSize:= GetStyleAttribute(HTMLEl, 'width');
   if aValueSize.value<>'' then
   begin
     EdWidth.EditValue:=aValueSize.value;
     CheckWidth.Checked :=aValueSize.StrechPrc;
   end;
   
   aValueSize:= GetStyleAttribute(HTMLEl, 'height');
   if aValueSize.value<>'' then
   begin
     EdHeight.EditValue:= aValueSize.value;
     CheckHeight.Checked := aValueSize.StrechPrc;
   end;
end;

procedure TFrmUpdateIFrame.ReadParamVideo( HTMLEl :IHTMLElement);
var StartIndex:Integer;
    HtmlText:WideString;
    HtmlVideo:WideString;
    CurrParamStr:String;
    SizeStyle:TSizeStyle;
begin
  HtmlText := HTMLEl.innerHTML ;
  StartIndex:=AnsiPos('<video',HtmlText);

  if StartIndex <> 0 then
  begin
     ReadParam( HTMLEl );

     EdPicture.Text:= UnitProc.ReadParam( HtmlText,'src');
     ChBxAutoPlay.Checked:= AnsiPos(' autoplay ', HtmlText) <> 0;
     ChBxRepeatPlay.Checked:= AnsiPos(' loop ', HtmlText) <> 0;
     ChBxMutePlay.Checked:= AnsiPos(' muted ', HtmlText) = 0;
   end;
end;

procedure TFrmUpdateIFrame.ReadParamYoutube( url:Widestring );
begin
  if AnsiPos('autoplay=1',url ) <> 0 then ChBxAutoPlay.Checked := True
  else  ChBxAutoPlay.Checked := False;

  if AnsiPos('loop=1',url ) <> 0 then ChBxRepeatPlay.Checked := True
  else ChBxRepeatPlay.Checked := False;
end;

procedure TFrmUpdateIFrame.SetParam( HTMLEl :IHTMLElement);
var AFlag:OleVariant;
begin
   HTMLEl.setAttribute('id',EdName.Text,AFlag);
   HTMLEl.setAttribute('name',EdName.Text,AFlag);
   HTMLEl.setAttribute('src', FGetSrc ,AFlag);
   HTMLEl.setAttribute('alt',EdAlt.text,AFlag);
   HTMLEl.setAttribute('border',EdBorder.text,AFlag);
   HTMLEl.setAttribute('hspace',EdHSpace.text,AFlag);
   HTMLEl.setAttribute('vspace',Edvspace.text,AFlag);
   HTMLEl.setAttribute('align',SelAlign.EditValue,AFlag);
   HTMLEl.setAttribute('width',FGetWidthParam,AFlag);
   HTMLEl.setAttribute('height',FGetHeightParam,AFlag);
   HTMLEl.style.removeAttribute('width',AFlag);
   HTMLEl.style.removeAttribute('height',AFlag);
end;

procedure TFrmUpdateIFrame.SetParamVide( HTMLEl :IHTMLElement);
begin
  HTMLEl.outerHTML:= FFormingCurrHTML ;
end;

function TFrmUpdateIFrame.FGetSrc:string;
var AutoPlayInd:string[1];
    LoopPlayInd:string;
    CurrUrl:WideString;
    idYoutube:WideString;
begin
  if (GroupBoxAdd.Visible)and(FTypeObject = optInObjFrame) then
  begin
    CurrUrl := EdPicture.Text;
    idYoutube:=GetIdYoutubeUrl(CurrUrl);

    if ChBxAutoPlay.Checked then AutoPlayInd:='1'
    else AutoPlayInd:='0';

    if ChBxRepeatPlay.Checked then LoopPlayInd:='1&playlist='+idYoutube
    else LoopPlayInd:='0';

    result:=FPrepareYoutubeUrl(idYoutube)+'?autoplay='+AutoPlayInd+'&loop='+LoopPlayInd;
  end
   else result:= EdPicture.text;
end;

function TFrmUpdateIFrame.FPrepareYoutubeUrl(idYoutube:Widestring):String;
begin
  result:='https://www.youtube.com/embed/'+idYoutube+'/';
end;

function TFrmUpdateIFrame.FYoutubeUrlWithoutParam(url:Widestring):WideString;
begin
  result:=ParseUrlWithoutParam(url);
end;

function TFrmUpdateIFrame.FGetWidthParam:string;
begin
 if not CheckWidth.Checked then result:= IntToStr(EdWidth.EditValue)
 else result:= '100%';
end;

function TFrmUpdateIFrame.FGetHeightParam:string;
begin
 if not CheckHeight.Checked then result:= IntToStr(EdHeight.EditValue)
 else result:= '100%';
end;

function TFrmUpdateIFrame.FGetPlayVideoParam:string;
begin
   result:='';
   if ChBxAutoPlay.Checked then result:=result+' autoplay ';
   if ChBxRepeatPlay.Checked then result:=result+' loop ';
   if not ChBxMutePlay.Checked then result:=result+' muted ';
end;

function TFrmUpdateIFrame.FFormingCurrHTML:widestring;
var APicStr:string;
    APicStrObj:string;
begin
  APicStr:='';
  
  if EdName.text<>''        then APicStr:='id="' + EdName.Text +'"';
  APicStrObj := APicStr+' src="' + FGetSrc +'" style="HEIGHT: inherit; WIDTH: inherit" ';

  if EdAlt.Text<>''         then APicStr:=APicStr+' alt="' + EdAlt.Text+'"';
  if EdBorder.text<>''      then APicStr:=APicStr+' border=' + EdBorder.text;
  if EdHSpace.text<>''      then APicStr:=APicStr+' hspace=' + EdHSpace.text;
  if EdVSpace.text<>''      then APicStr:=APicStr+' vspace=' + EdVSpace.text;
  if SelAlign.EditValue<>'' then APicStr:=APicStr+' align=' +'"'+SelAlign.EditValue+'"';
  if EdWidth.EditText<>''   then APicStr:=APicStr+' Width=' +'"'+ FGetWidthParam+'"';
  if EdHeight.EditText<>''  then APicStr:=APicStr+' Height=' +'"'+ FGetHeightParam+'"';

  if self.FTypeObject = optInObjFrame then
  begin
    if (EdPicture.text<>'')     then APicStr:=APicStr+' src="' + FGetSrc +'"';
    APicStr:='<iframe  ' + APicStr+ '/>';
  end;

  if self.FTypeObject = optInObjVideo then APicStr:='<OBJECT '+APicStr+'>'+ '<video  ' + APicStrObj+FGetPlayVideoParam+' controls ></video></OBJECT>';
  result:=APicStr;
end;

procedure TFrmUpdateIFrame.NewObject(DHTML:TDHTMLEdit);
var txtrange : ihtmlTxtrange;
    APicStr:string;
begin
  txtrange:=DHTML.DOM.selection.createRange as ihtmlTxtrange;
  txtrange.pasteHTML( FFormingCurrHTML );
end;

function InsertIframeYouTube( DHTML:TDHTMLEdit; Anew:Boolean; aFileNameWhenNew:string='' ):boolean;
var ctrlrange: ihtmlcontrolrange;
    txtrange : ihtmlTxtrange;
    HTMLEl   : IHTMLElement;
begin
   try
     Application.CreateForm(TFrmUpdateIFrame, FrmUpdateIFrame);
     FrmUpdateIFrame.Caption :='Об''єкт ютуб';
     FrmUpdateIFrame.GroupBoxAdd.Visible:=true;
     FrmUpdateIFrame.ChBxMutePlay.Visible := false;
     FrmUpdateIFrame.ButSelSrc.Visible := false;
     FrmUpdateIFrame.EdPicture.Width   := FrmUpdateIFrame.EdAlt.Width;
     FrmUpdateIFrame.FTypeObject := optInObjFrame;

     if not Anew then
     begin
       ctrlrange :=DHTML.DOM.selection.createRange as ihtmlcontrolrange;
       HTMLEl:=ctrlrange.commonParentElement;
       FrmUpdateIFrame.ReadParam( HTMLEl );
       FrmUpdateIFrame.EdPicture.Text :=  FrmUpdateIFrame.FYoutubeUrlWithoutParam(FrmUpdateIFrame.EdPicture.Text);
     end
     else
     begin
       FrmUpdateIFrame.EdPicture.Text:= aFileNameWhenNew;
       FrmUpdateIFrame.EdWidth.EditValue := DefWithValue;
       FrmUpdateIFrame.EdHeight.EditValue := DefHeightValue;
     end;

     if FrmUpdateIFrame.ShowModal = mrOk then
     begin
       if not Anew then FrmUpdateIFrame.SetParam( HTMLEl )
       else FrmUpdateIFrame.NewObject(DHTML);

       result := True;
     end
     else result := False;
     
   finally
    FrmUpdateIFrame.Free;
   end;
end;

function InsertIframeObject( DHTML:TDHTMLEdit; Anew:Boolean; aFileNameWhenNew:string='' ):Boolean;
var ctrlrange: ihtmlcontrolrange;
    txtrange : ihtmlTxtrange;
    HTMLEl   : IHTMLElement;
begin
   try
     Application.CreateForm(TFrmUpdateIFrame, FrmUpdateIFrame);
     FrmUpdateIFrame.Caption :='Об''єкт IFRAME';
     FrmUpdateIFrame.GroupBoxAdd.Visible:=false;
     FrmUpdateIFrame.ButSelSrc.Visible := False;
     FrmUpdateIFrame.EdPicture.Width := FrmUpdateIFrame.EdAlt.Width;
     FrmUpdateIFrame.FTypeObject := optInObjFrame;

     if not Anew then
     begin
       ctrlrange :=DHTML.DOM.selection.createRange as ihtmlcontrolrange;
       HTMLEl:=ctrlrange.commonParentElement;
       FrmUpdateIFrame.ReadParam( HTMLEl );
     end
     else
     begin
       FrmUpdateIFrame.EdPicture.Text:= aFileNameWhenNew;
       FrmUpdateIFrame.EdWidth.EditValue := DefWithValue;
       FrmUpdateIFrame.EdHeight.EditValue := DefHeightValue;
     end;
     
     if FrmUpdateIFrame.ShowModal = mrOk then
     begin
       if not Anew then FrmUpdateIFrame.SetParam( HTMLEl )
       else FrmUpdateIFrame.NewObject(DHTML);

       result := True;
     end
     else result := False;

   finally
    FrmUpdateIFrame.Free;
   end;
end;


function InsertVideoObject( DHTML:TDHTMLEdit; Anew:Boolean; aFileNameWhenNew:string='' ):Boolean;
var ctrlrange: ihtmlcontrolrange;
    txtrange : ihtmlTxtrange;
    HTMLEl   : IHTMLElement;
begin
   try
     Application.CreateForm(TFrmUpdateIFrame, FrmUpdateIFrame);
     FrmUpdateIFrame.Caption :='Відео об''єкт';
     FrmUpdateIFrame.GroupBoxAdd.Visible:= True;
     FrmUpdateIFrame.ButSelSrc.Visible  := True;
     FrmUpdateIFrame.FTypeObject := optInObjVideo;
     
     if not Anew then
     begin
       ctrlrange :=DHTML.DOM.selection.createRange as ihtmlcontrolrange;
       HTMLEl:=ctrlrange.commonParentElement;
       FrmUpdateIFrame.ReadParamVideo( HTMLEl );
     end
     else
     begin
       FrmUpdateIFrame.EdPicture.Text:= aFileNameWhenNew;
       FrmUpdateIFrame.EdWidth.EditValue := DefWithValue;
       FrmUpdateIFrame.EdHeight.EditValue := DefHeightValue;
     end;
     
     if FrmUpdateIFrame.ShowModal = mrOk then
     begin
       if not Anew then FrmUpdateIFrame.SetParamVide( HTMLEl )
       else FrmUpdateIFrame.NewObject(DHTML);

       result := True;
     end
     else result := False;

   finally
    FrmUpdateIFrame.Free;
   end;
end;

procedure TFrmUpdateIFrame.SbtOKClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TFrmUpdateIFrame.SbtCloseClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TFrmUpdateIFrame.EdHSpaceKeyPress(Sender: TObject;
  var Key: Char);
begin
  Key:= EnableInputJustNumber(Sender, Key,false);
end;

procedure TFrmUpdateIFrame.EdNameKeyPress(Sender: TObject; var Key: Char);
begin
  Key:= EnableInputJustLatAndDigit(Sender, Key);
end;

procedure TFrmUpdateIFrame.RefreshControl;
begin
  LbWidth.Enabled := not CheckWidth.Checked;
  EdWidth.Enabled := not CheckWidth.Checked;

  LbHeight.Enabled := not CheckHeight.Checked;
  EdHeight.Enabled := not CheckHeight.Checked;

  //if (not CheckWidth.Checked) and (EdWidth.EditValue = 100) then EdWidth.EditValue :=DefWithValue;
  //if (not CheckHeight.Checked) and (EdHeight.EditValue = 100) then EdHeight.EditValue :=DefHeightValue;
end;

procedure TFrmUpdateIFrame.cxCheckWidthPropertiesEditValueChanged(
  Sender: TObject);
begin
  RefreshControl;
end;

procedure TFrmUpdateIFrame.cxCheckHeightPropertiesEditValueChanged(
  Sender: TObject);
begin
  RefreshControl;
end;

procedure TFrmUpdateIFrame.FormShow(Sender: TObject);
begin
  RefreshControl;
end;

function TFrmUpdateIFrame.FGetMaskSelectFileSrc:string;
begin
  if  self.FTypeObject = optInObjVideo then result:='Відео файли (*.mp4)|*.mp4';
end;

procedure TFrmUpdateIFrame.ButSelSrcClick(Sender: TObject);
var SelectedFile:string;
begin
  SelectedFile:=MySelectFileDialog( ExtractFilePath( EdPicture.Text ), FGetMaskSelectFileSrc );
  if SelectedFile<>'^' then EdPicture.Text := SelectedFile;
end;

procedure TFrmUpdateIFrame.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if  Key = Chr(VK_ESCAPE) then SbtClose.Click;
end;

end.

{ EdName.Text:= UnitProc.ReadParam( HtmlText,'id=');
     EdPicture.Text:= UnitProc.ReadParam( HtmlText,'src');
     EdAlt.Text:= UnitProc.ReadParam( HtmlText,'alt');
     CurrParamStr:= UnitProc.ReadParam( HtmlText,'border=',#0);
     if CurrParamStr<>'' then EdBorder.Text:= CurrParamStr;

     CurrParamStr := UnitProc.ReadParam( HtmlText,'hspace=',#0);
     if CurrParamStr<>'' then EdHSpace.text :=CurrParamStr;

     CurrParamStr := UnitProc.ReadParam( HtmlText,'vspace=',#0);
     if CurrParamStr<>'' then EdVSpace.text :=CurrParamStr;

     CurrParamStr := UnitProc.ReadParam( HtmlText,'align');
     if CurrParamStr<>'' then SelAlign.EditValue := CurrParamStr;

     SizeStyle:=GetStyleAttribute(HTMLEl, 'width');
     //SizeStyle := PrepareAttributeSize( CurrParamStr );
     if SizeStyle.value <> '' then
     begin
       EdWidth.text := SizeStyle.value;
       CheckWidth.Checked := SizeStyle.StrechPrc;
     end;

     SizeStyle:=GetStyleAttribute(HTMLEl, 'height');
     if SizeStyle.value <> '' then
     begin
       EdHeight.text := SizeStyle.value;
       CheckWidth.Checked := SizeStyle.StrechPrc;
     end;  }
     
