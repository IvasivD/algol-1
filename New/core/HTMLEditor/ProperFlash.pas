unit ProperFlash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxSpinEdit, Buttons, ExtCtrls, cxCheckBox, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,mshtml_TLB,
  StdCtrls, ComCtrls, cxRadioGroup, cxImageComboBox,DHTMLEDLib_TLB ,ActiveX,IeConst,ComObj,OleCtrls, OleCtnrs,
  cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TFrm_ProperFlash = class(TForm)
    PageControl: TPageControl;
    TabProperty: TTabSheet;
    TabMain: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    Label3: TLabel;
    cxChBxColorFonFlash: TcxCheckBox;
    PanColFonFlash: TPanel;
    SbtSelColorFon: TSpeedButton;
    Label4: TLabel;
    cxChBxTranspFlash: TcxCheckBox;
    Label5: TLabel;
    Bevel2: TBevel;
    Label6: TLabel;
    Label7: TLabel;
    SpEdMaketThick: TcxSpinEdit;
    Label8: TLabel;
    SpEdMaketIntervGorizont: TcxSpinEdit;
    Label9: TLabel;
    SpEdMaketIntervVertikal: TcxSpinEdit;
    Label10: TLabel;
    Bevel3: TBevel;
    cxChBxSetSize: TcxCheckBox;
    LbWidth: TLabel;
    EdWidth: TcxSpinEdit;
    LbHeight: TLabel;
    EdHeight: TcxSpinEdit;
    cxChBxSaveProporc: TcxCheckBox;
    Label17: TLabel;
    Bevel5: TBevel;
    Label18: TLabel;
    EdKodClass: TcxTextEdit;
    Label19: TLabel;
    EdBaseClass: TcxTextEdit;
    Label20: TLabel;
    EdPageIncludeModuleNetscape: TcxTextEdit;
    OpenDialog: TOpenDialog;
    CbxQualityFlash: TcxImageComboBox;
    cbxScaleFlash: TcxImageComboBox;
    cbxAlingFlash: TcxImageComboBox;
    cbxAlingMaket: TcxImageComboBox;
    Panel3: TPanel;
    SbtOK: TSpeedButton;
    SbtClose: TSpeedButton;
    Label14: TLabel;
    EdNameFlash: TcxTextEdit;
    EdIUrlFlash: TcxTextEdit;
    Button1: TButton;
    Label16: TLabel;
    Bevel4: TBevel;
    cxChBxAutoPlay: TcxCheckBox;
    cxChBxRepeatPlay: TcxCheckBox;
    cxChBxShowMenu: TcxCheckBox;
    cxChBxPropSWlive: TcxCheckBox;
    CheckWidth: TcxCheckBox;
    CheckHeight: TcxCheckBox;
    Label13: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure SbtOKClick(Sender: TObject);
    procedure SbtCloseClick(Sender: TObject);
    procedure SbtSelColorFonClick(Sender: TObject);
    procedure cxChBxColorFonFlashPropertiesChange(Sender: TObject);
    procedure SpEdSizeWidthPropertiesChange(Sender: TObject);
    procedure SpEdSizeHeightPropertiesChange(Sender: TObject);
    procedure cxRBtWidthPercClick(Sender: TObject);
    procedure cxRBtWidthPixelClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ObjInspMouseOverButtonClick(Sender: TObject;
      AbsoluteIndex: Integer);
    procedure CheckWidthPropertiesEditValueChanged(Sender: TObject);
    procedure cxChBxSetSizePropertiesEditValueChanged(Sender: TObject);
    procedure cxChBxSaveProporcPropertiesEditValueChanged(Sender: TObject);
    procedure CheckHeightPropertiesEditValueChanged(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);

  private

    procedure RefreshControl;
    function  FGetWidthParam:string;
    function  FGetHeightParam:string;
    { Private declarations }
  public
    { Public declarations }
    HTMLEditSetupIni:String;
    procedure ReadAllParamHtmlFlash(AHtmlFlash:String);
    Function  FormingHtmlFlash:String;
    procedure GetPropFlash(DHTML:TDHTMLEdit);
    procedure SetDefaultPropFlash;

  end;
  //****************************************************************************
  procedure InsertFlash(AHtmlFlash:String;IniOption:String;Modify:Boolean=false);
  procedure SetParamToComboBox(ParamName:String;ComboBox:TcxImageComboBox);
  function  ElemIsObjectAndFlash(DHTML:TDHTMLEdit):boolean;
  function  GetMovie( HTMLEl:IHTMLElement ):string;
var
  Frm_ProperFlash: TFrm_ProperFlash;

implementation

uses UnitProc;

{$R *.dfm}
//******************************************************************************
procedure InsertFlash(AHtmlFlash:String;IniOption:String;Modify:Boolean=false);
var FlashHtmlCode:String;
begin
 try
    Application.CreateForm(TFrm_ProperFlash, Frm_ProperFlash);
    Frm_ProperFlash.HTMLEditSetupIni := IniOption;
    with Frm_ProperFlash do
         begin //1
           ReadAllParamHtmlFlash(AHtmlFlash);

           Frm_ProperFlash.ShowModal;
           //*******************************************************************
        end;   //1

 finally
   FreeAndNil(Frm_ProperFlash);
 end;
end;
//******************************************************************************
function ElemIsObjectAndFlash(DHTML:TDHTMLEdit):boolean;
var ctrlrange: ihtmlcontrolrange;
    AFlag:OleVariant;
    src:OleVariant;
begin
  result:=False;
  ctrlrange := DHTML.DOM.selection.createRange as ihtmlcontrolrange;
  if CompareText(ctrlrange.commonParentElement.tagName , 'OBJECT')=0 then
  begin
   src:=GetMovie( ctrlrange.commonParentElement );
   if (src<>null) and (src<>'') then
    result:=  ExtractFileExt( src )='.swf';
  end;
end;
procedure SetParamToComboBox(ParamName:String;ComboBox:TcxImageComboBox);
var i:integer;
    find:boolean;
    CurValue:string;
begin
  find:=false;
  for i:=0 to ComboBox.Properties.Items.Count-1 do
      begin //1
        if ComboBox.Properties.Items.Items[i].Value<>null then
           CurValue :=LowerCase(ComboBox.Properties.Items.Items[i].Value)
            else CurValue :='';
        if (not find)and(CurValue='default') then ComboBox.ItemIndex :=0;
        if CurValue=LowerCase(ParamName) then
           begin //2
             find :=true;
             ComboBox.ItemIndex :=i;
             break;
           end; //2
      end; //1
 if ComboBox.ItemIndex =-1 then ComboBox.ItemIndex :=0;     
end;
//******************************************************************************
procedure TFrm_ProperFlash.ReadAllParamHtmlFlash(AHtmlFlash:string);
var RdParam:String;
    ctrlrange: ihtmlcontrolrange;
    HTMLEl          :IHTMLElement;
begin
 { if not self.IsElem('TABLE') then exit;
  ctrlrange :=DHTML.DOM.selection.createRange as ihtmlcontrolrange;
  HTMLEl:=ctrlrange.commonParentElement;

  HTMLEl.
 }
  RdParam :=ReadParam(AHtmlFlash,'name="quality"'); SetParamToComboBox(RdParam,CbxQualityFlash);
  RdParam :=ReadParam(AHtmlFlash,'name="scale"');   SetParamToComboBox(RdParam,cbxScaleFlash);
  RdParam :=ReadParam(AHtmlFlash,'name="bgcolor"');
  //***********************************************************
    if RdParam<>'' then
       begin
        cxChBxColorFonFlash.Checked :=true;
        PanColFonFlash.Color := HtmlToColor(RdParam);
       end;
  //***********************************************************
  RdParam :=ReadParam(AHtmlFlash,'name="wmode"');
    if LowerCase(RdParam)='transparent' then cxChBxTranspFlash.Checked :=true;
  //***********************************************************
  RdParam :=ReadParam(AHtmlFlash,'name="play"');
    if LowerCase(RdParam)='false' then cxChBxAutoPlay.Checked :=false;
  //***********************************************************
  RdParam :=ReadParam(AHtmlFlash,'name="loop"');
    if LowerCase(RdParam)='false' then cxChBxRepeatPlay.Checked :=false;
  //***********************************************************
 RdParam :=ReadParam(AHtmlFlash,'name="menu"');
    if LowerCase(RdParam)='false' then cxChBxShowMenu.Checked :=false;
 //***********************************************************
 RdParam :=ReadParam(AHtmlFlash,'name="swliveconnect"');
    if LowerCase(RdParam)='true' then cxChBxPropSWlive.Checked :=true;
 //***********************************************************
 RdParam :=ReadParam(AHtmlFlash,'border=');
    if RdParam<>'' then
       SpEdMaketThick.Value :=RdParam;
 //***********************************************************
 RdParam :=ReadParam(AHtmlFlash,'width=');
    if RdParam<>'' then EdWidth.Value :=RdParam;
    if AnsiPos('%',RdParam)<>0 then CheckWidth.Checked :=true
                               else CheckWidth.Checked:=false;
 //***********************************************************
 RdParam :=ReadParam(AHtmlFlash,'height=');
    if RdParam<>'' then EdHeight.Value :=RdParam;
    if AnsiPos('%',RdParam)<>0 then CheckHeight.Checked :=true
                               else CheckHeight.Checked:=false;
 //***********************************************************
 RdParam :=ReadParam(AHtmlFlash,'align='); SetParamToComboBox(RdParam,cbxAlingMaket);
 //***********************************************************
 RdParam :=ReadParam(AHtmlFlash,'hspace=');
    if RdParam<>'' then SpEdMaketIntervGorizont.Value :=RdParam;
 //***********************************************************
 RdParam :=ReadParam(AHtmlFlash,'vspace=');
    if RdParam<>'' then SpEdMaketIntervVertikal.Value :=RdParam;
 //***********************************************************
end;
//******************************************************************************
procedure TFrm_ProperFlash.Button1Click(Sender: TObject);
begin
 if OpenDialog.Execute then
    begin
     EdIUrlFlash.Text := OpenDialog.FileName;
     //EdIBaseUrlFlash.Text :=ExtractFilePath(OpenDialog.FileName);
    end
end;
//******************************************************************************
procedure TFrm_ProperFlash.SbtOKClick(Sender: TObject);
begin
 {if EdNameFlash.text='' then
    begin
     ShowMessage('¬каж≥ть ≥м'+#39+'€ об'+#39+'Їкта');
     Exit;
    end; }
 PageControl.ActivePage:=TabProperty;
 SpEdMaketIntervGorizont.SetFocus;
 SpEdMaketIntervVertikal.SetFocus;
 SpEdMaketIntervGorizont.SetFocus;
 ModalResult:=mrOk;

end;
//******************************************************************************
procedure TFrm_ProperFlash.SbtCloseClick(Sender: TObject);
begin
 ModalResult:=mrCancel;
end;
//******************************************************************************
procedure TFrm_ProperFlash.RefreshControl;
begin
 //***************************************************
 EdWidth.Enabled    :=not CheckWidth.Checked ;
 EdHeight.Enabled   :=not CheckHeight.Checked ;
 LbWidth.Enabled   :=EdWidth.Enabled ;
 LbHeight.Enabled  :=EdHeight.Enabled ;

 CheckWidth.Enabled  :=cxChBxSetSize.Checked;
 CheckHeight.Enabled :=cxChBxSetSize.Checked ;

 cxChBxSaveProporc.Enabled:=cxChBxSetSize.Checked ;
 //***************************************************
 if not cxChBxSetSize.Checked then
 begin
   EdWidth.Value  :=160;
   EdHeight.Value :=160;
   CheckWidth.Checked    :=false;
   CheckHeight.Checked   :=false;
 end;
end;
//******************************************************************************
procedure TFrm_ProperFlash.SbtSelColorFonClick(Sender: TObject);
begin
  PanColFonFlash.Color:=ShowDialogColor(TPanel(sender).Color);
end;
//******************************************************************************
procedure TFrm_ProperFlash.cxChBxColorFonFlashPropertiesChange(
  Sender: TObject);
begin
  PanColFonFlash.Enabled     := cxChBxColorFonFlash.Checked;
  SbtSelColorFon.Enabled     := cxChBxColorFonFlash.Checked;
end;
//******************************************************************************
procedure TFrm_ProperFlash.SpEdSizeWidthPropertiesChange(Sender: TObject);
begin
 if (cxChBxSaveProporc.Enabled)and(cxChBxSaveProporc.Checked) then  EdHeight.Value := TcxSpinEdit(Sender).Value;
end;
//******************************************************************************
procedure TFrm_ProperFlash.SpEdSizeHeightPropertiesChange(Sender: TObject);
begin
 if (cxChBxSaveProporc.Enabled)and(cxChBxSaveProporc.Checked) then  EdWidth.Value := TcxSpinEdit(Sender).Value;
end;
//******************************************************************************
procedure TFrm_ProperFlash.cxRBtWidthPercClick(Sender: TObject);
begin
 if TcxRadioButton(Sender).Checked then
    cxChBxSaveProporc.Enabled:=false;
end;
//******************************************************************************
procedure TFrm_ProperFlash.cxRBtWidthPixelClick(Sender: TObject);
begin
 if (CheckWidth.Checked)and(CheckHeight.Checked)then
    cxChBxSaveProporc.Enabled:=true
    else  cxChBxSaveProporc.Enabled:=false;
end;
//******************************************************************************
procedure TFrm_ProperFlash.Button2Click(Sender: TObject);
begin

end;
//******************************************************************************
procedure TFrm_ProperFlash.FormCreate(Sender: TObject);
begin
  PageControl.ActivePage:= TabProperty;
  if HTMLEditSetupIni <> ''  then
  begin
    EdKodClass.Text := ReadIniFile( HTMLEditSetupIni ,'FLASH','KodClass');
    EdBaseClass.Text:= ReadIniFile( HTMLEditSetupIni ,'FLASH','KodBaseClass');
    EdPageIncludeModuleNetscape.Text:=ReadIniFile( HTMLEditSetupIni ,'FLASH','PageIncludeNetScape');
  end;
  SetDefaultPropFlash;
end;
//******************************************************************************
procedure TFrm_ProperFlash.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if HTMLEditSetupIni <> ''  then
  begin
    CreateIniFile( HTMLEditSetupIni,'FLASH','KodClass',EdKodClass.Text);
    CreateIniFile( HTMLEditSetupIni,'FLASH','KodBaseClass', EdBaseClass.Text);
    CreateIniFile( HTMLEditSetupIni,'FLASH','PageIncludeNetScape',EdPageIncludeModuleNetscape.Text);
  end;
end;
//******************************************************************************

function TFrm_ProperFlash.FGetWidthParam:string;
begin
 if not CheckWidth.Checked then result:= IntToStr(EdWidth.EditValue)
 else result:= '100%';
end;

function TFrm_ProperFlash.FGetHeightParam:string;
begin
 if not CheckHeight.Checked then result:= IntToStr(EdHeight.EditValue)
 else result:= '100%';
end;

Function TFrm_ProperFlash.FormingHtmlFlash:String;
var
    HtmlStr:String;
    AWidth :String;
    AHeight:String;
    strEvent:string;
    str:string;
begin
   with Frm_ProperFlash do
      begin //1
       AWidth :=FGetWidthParam;
       AHeight:=FGetHeightParam;

       strEvent:='';
       //***************
       HtmlStr :='<object classid="'+EdKodClass.Text+'"';

       if Trim(EdNameFlash.Text)<>'' then HtmlStr:=HtmlStr + ' id="'+EdNameFlash.Text+'"'+' '+strEvent;
       HtmlStr:=HtmlStr + ' codebase="'+EdBaseClass.Text+'"';
       if SpEdMaketThick.Text<>'0' then cxChBxShowMenu.Checked:=false
          else cxChBxShowMenu.Checked:=true;
      //****************************************************************************
       HtmlStr:=HtmlStr + ' border="'+SpEdMaketThick.Text+'" width="'+AWidth+'" height="'+AHeight+'"';
       //      else HtmlStr:=HtmlStr + ' border="'+'1'+'" width="'+AWidth+'" height="'+AHeight+'"';

       if cbxAlingMaket.Properties.Items.Items[cbxAlingMaket.ItemIndex].Value<>'Default' then
          HtmlStr:=HtmlStr +' align="'+cbxAlingMaket.Properties.Items.Items[cbxAlingMaket.ItemIndex].Value+'"';

       if SpEdMaketIntervGorizont.Value <> 0 then
          HtmlStr:=HtmlStr +' hspace="'+SpEdMaketIntervGorizont.text+'"';

       if SpEdMaketIntervVertikal.Value <> 0 then
          HtmlStr:=HtmlStr +' vspace="'+SpEdMaketIntervVertikal.text+'"';

       HtmlStr :=HtmlStr +' data="'+EdIUrlFlash.Text+'"'+' pluginspage="'+EdPageIncludeModuleNetscape.Text+'"';
       HtmlStr :=HtmlStr +' type="application/x-shockwave-flash"';  


       HtmlStr:=HtmlStr +'>'+#13#10;
       //****************************************************************************
          //HtmlStr:=HtmlStr + '  <param name="movie" value="'+EdIUrlFlash.Text+'">'+#13#10;
          HtmlStr:=HtmlStr + '  <param name="quality" value="'+ CbxQualityFlash.Properties.Items.Items[CbxQualityFlash.ItemIndex].Value+'">'+#13#10;
       //****************************************************************************
       if cbxScaleFlash.Properties.Items.Items[cbxScaleFlash.ItemIndex].Value<>'Showall' then
          HtmlStr:=HtmlStr + '  <param name="scale" value="'+ cbxScaleFlash.Properties.Items.Items[cbxScaleFlash.ItemIndex].Value+'">'+#13#10;
       //****************************************************************************
       if cxChBxColorFonFlash.Checked then
         HtmlStr:=HtmlStr + '  <param name="bgcolor" value="'+ColorToHtml(PanColFonFlash.Color)+'">'+#13#10;
       if cxChBxTranspFlash.Checked   then
          HtmlStr:=HtmlStr + '  <param name="wmode" value="transparent">'+#13#10;
      //***********************************************************
       if not cxChBxAutoPlay.Checked 	then
          HtmlStr :=HtmlStr +'  <param name="play" value="false">'+#13#10
           else HtmlStr :=HtmlStr +'  <param name="play" value="true">'+#13#10;

       if not cxChBxRepeatPlay.Checked then
          HtmlStr :=HtmlStr +'   <param name="loop" value="false">'+#13#10;
       if not cxChBxShowMenu.Checked   then
          HtmlStr :=HtmlStr +'   <param name="menu" value="false">'+#13#10;
      //***********************************************************
      if cxChBxPropSWlive.Checked then
         HtmlStr :=HtmlStr +'   <param name="swliveconnect" value="true">'+#13#10;
      //***********************************************************
      //HtmlStr :=HtmlStr +' <embed src="'+EdIUrlFlash.Text+'"'+' pluginspage="'+EdPageIncludeModuleNetscape.Text+'"';
      //HtmlStr :=HtmlStr +' type="application/x-shockwave-flash"';
      //if Trim(EdNameFlash.Text)<>'' then HtmlStr:=HtmlStr + ' name="'+EdNameFlash.Text+'"';
      //   HtmlStr :=HtmlStr +' width="'+AWidth+'" height="'+AHeight+'"'+' quality="'+CbxQualityFlash.Properties.Items.Items[CbxQualityFlash.ItemIndex].Value+'"';
      //if Trim(EdIBaseUrlFlash.Text)<>'' then  HtmlStr :=HtmlStr +' base="file:///'+Trim(EdIBaseUrlFlash.Text)+'"';

      //HtmlStr :=HtmlStr + '></embed>
      HtmlStr :=HtmlStr + '</object>';
   end; //1
  //****************************************************
  result :=HtmlStr;

  //****************************************************
end;
//******************************************************************************
function GetMovie( HTMLEl:IHTMLElement ):string;
var AFlag:OleVariant;
    AHtmlFlash :String;
    RdParam:Olevariant;
    RdParam_Str:WideString;
begin
  AHtmlFlash :=LowerCase(HTMLEl.outerHTML);
  RdParam := HTMLEl.getAttribute('data',AFlag);
  if (RdParam<>null)and(RdParam<>'') then
    begin
      RdParam_Str := lowerCase(RdParam);
      ReplaseOn(RdParam_Str,'file:///','');
      result :=RdParam_Str;
    end
     else
     begin
       RdParam_Str :=ReadParam(AHtmlFlash,'name="movie"');
       ReplaseOn(RdParam_Str,'file:///','');
       result :=RdParam_Str;
     end;
end;
//******************************************************************************
procedure TFrm_ProperFlash.GetPropFlash(DHTML:TDHTMLEdit);
var ctrlrange: ihtmlcontrolrange;
    RdParam:Olevariant;
    RdParam_Int:integer;
    RdParam_Str:WideString;
    AFlag:OleVariant;
    AHtmlFlash :String;
    HTMLEl:IHTMLElement;

begin
  ctrlrange :=DHTML.DOM.selection.createRange as ihtmlcontrolrange;
  HTMLEl:=ctrlrange.commonParentElement;
  AHtmlFlash :=LowerCase(HTMLEl.outerHTML);
  with Frm_ProperFlash do
       begin //1
         RdParam_Str :=ReadParam(AHtmlFlash,'quality=');
         if RdParam_Str<>'' then
            SetParamToComboBox(RdParam_Str,CbxQualityFlash);
         //**************************************************
         RdParam := HTMLEl.getAttribute('scale',AFlag);
         if RdParam<>null then
            SetParamToComboBox(RdParam , cbxScaleFlash);
         //**************************************************
         RdParam := HTMLEl.getAttribute('bgcolor',AFlag);
         if (RdParam<>null)and(RdParam<>'') then
          RdParam_Str:='#'+RdParam
         else
          begin
           RdParam_Str :=ReadParam(AHtmlFlash,'name="bgcolor"');
           if RdParam_Str<>'' then RdParam := RdParam_Str;
          end;
          if (RdParam_Str<>'') then
          begin
            cxChBxColorFonFlash.Checked :=true;
            PanColFonFlash.Color := HtmlToColor(RdParam_Str);
          end;
         //**************************************************
         RdParam := HTMLEl.getAttribute('wmode',AFlag);
         if (RdParam <> null)and(RdParam<>'') then RdParam_Str:=RdParam
         else  RdParam_Str :=ReadParam(AHtmlFlash,'name="wmode"');

         if (RdParam_Str<>'')and(LowerCase(RdParam_Str)='transparent') then cxChBxTranspFlash.Checked :=true;
         //**************************************************
         RdParam_Str :=ReadParam(AHtmlFlash,'name="play"');
         if (RdParam_Str<>'')and((RdParam_Str='0')or(RdParam_Str='false')) then cxChBxAutoPlay.Checked      :=false;
         if (RdParam_Str<>'')and((RdParam_Str='-1')or(RdParam_Str='true')) then cxChBxAutoPlay.Checked      :=true;

         {and (LowerCase(RdParam)='false') then cxChBxAutoPlay.Checked       :=false;}
         //***********************************************************
         RdParam :=HTMLEl.getAttribute('loop',AFlag);
         if (RdParam<>null)and(RdParam<>'') then RdParam_Str:=RdParam
         else RdParam_Str := ReadParam(AHtmlFlash,'name="loop"');

         if (RdParam_Str<>'') and (LowerCase(RdParam_Str)='false') then cxChBxRepeatPlay.Checked     :=false;
         //***********************************************************
         RdParam :=HTMLEl.getAttribute('menu',AFlag);
         if (RdParam<>null)and(RdParam<>'') then RdParam_Str:=RdParam
         else RdParam_Str := ReadParam(AHtmlFlash,'name="menu"');

         if (RdParam_Str<>'') and (LowerCase(RdParam_Str)='false') then cxChBxShowMenu.Checked      :=false;
         //***********************************************************
         RdParam :=HTMLEl.getAttribute('swliveconnect',AFlag);
         if (RdParam<>null)and(RdParam<>'') then RdParam_Str:=RdParam
         else RdParam_Str := ReadParam(AHtmlFlash,'name="swliveconnect"');

         if (RdParam_Str<>'') and (LowerCase(RdParam_Str)='true')   then cxChBxPropSWlive.Checked    :=true;
         //***********************************************************
         RdParam :=HTMLEl.getAttribute('border',AFlag);
         if (RdParam<>null)and(RdParam<>'') then
            SpEdMaketThick.Value :=StrToInt(RdParam);
         //***********************************************************
         RdParam_Str :=HTMLEl.getAttribute('width',AFlag);
         if AnsiPos('%',RdParam_Str)<>0 then begin CheckWidth.Checked :=true; ReplaseOn(RdParam_Str,'%','');end
         else CheckWidth.Checked:=false;
         if RdParam_Str<>'' then EdWidth.Value :=StrToInt(RdParam_Str);
         //***********************************************************
         RdParam_Str :=HTMLEl.getAttribute('height',AFlag);
         if AnsiPos('%',RdParam_Str)<>0 then begin CheckHeight.Checked :=true; ReplaseOn(RdParam_Str,'%','');end
         else CheckHeight.Checked:=false;
         //***********************************************************
         if EdWidth.text = RdParam_Str then cxChBxSaveProporc.Checked:=true   //зберегти пропрц≥ю
         else cxChBxSaveProporc.Checked:=false;
         //***********************************************************
         if RdParam_Str<>'' then EdHeight.Value :=StrToInt(RdParam_Str);
         //***********************************************************
         RdParam :=HTMLEl.getAttribute('align',AFlag);
         SetParamToComboBox( RdParam, cbxAlingMaket );

         RdParam :=HTMLEl.getAttribute('salign',AFlag);
         if (RdParam<>null)and(RdParam<>'') then
            SetParamToComboBox(RdParam,cbxAlingFlash);
         //***********************************************************
         RdParam_Int :=HTMLEl.getAttribute('hspace',AFlag);
         SpEdMaketIntervGorizont.value :=RdParam_int;
         //***********************************************************
         RdParam_Int :=HTMLEl.getAttribute('vspace',AFlag);
         SpEdMaketIntervVertikal.Value :=RdParam_Int;
         //***********************************************************
         RdParam_Str:= GetMovie( HTMLEl );
         EdIUrlFlash.text:=RdParam_Str;
         {RdParam := HTMLEl.getAttribute('movie',AFlag);
         if (RdParam<>null)and(RdParam<>'') then
            begin
              RdParam_Str := lowerCase(RdParam);
              ReplaseOn(RdParam_Str,'file:///','');
              EdIUrlFlash.text :=RdParam_Str;
            end
             else
             begin
               RdParam_Str :=ReadParam(AHtmlFlash,'name="movie"');
               ReplaseOn(RdParam_Str,'file:///','');
               EdIUrlFlash.text :=RdParam_Str;
             end; }
         //***********************************************************
         RdParam := HTMLEl.getAttribute('id',AFlag);
         if (RdParam<>null)and(RdParam<>'') then
           EdNameFlash.Text :=RdPAram;
         //*************************************************
       end;//1
end;
//******************************************************************************
procedure TFrm_ProperFlash.SetDefaultPropFlash;
begin
    with Frm_ProperFlash do
      begin //1
       CbxQualityFlash.ItemIndex:=0;
       cbxScaleFlash.ItemIndex  :=0;
       cbxAlingFlash.ItemIndex  :=0;
       cbxAlingMaket.ItemIndex  :=0;
       EdWidth.Value      :=160;
       EdHeight.Value     :=160;
       //EdNameFlash.Text          :=obj;
      end;
end;
//******************************************************************************
procedure TFrm_ProperFlash.ObjInspMouseOverButtonClick(Sender: TObject;
  AbsoluteIndex: Integer);
var aStr:string;
    ind:integer;
begin
 {ind:=EventInspector.FocusedNode.AbsoluteIndex;
 //ObjInspector.FocusedNode.Index
 aStr:=MyHTMLEdit.EditFunction(EventInspector.Rows[ind].EditText);
 if aStr<>'*' then
    EventInspector.Rows[ind].EditText:=aStr;
 }
end;
//******************************************************************************
procedure TFrm_ProperFlash.CheckWidthPropertiesEditValueChanged(
  Sender: TObject);
begin
  RefreshControl;
end;
//******************************************************************************
procedure TFrm_ProperFlash.cxChBxSetSizePropertiesEditValueChanged(
  Sender: TObject);
begin
  RefreshControl;
end;
//******************************************************************************
procedure TFrm_ProperFlash.cxChBxSaveProporcPropertiesEditValueChanged(
  Sender: TObject);
begin
  RefreshControl;
end;
//******************************************************************************
procedure TFrm_ProperFlash.CheckHeightPropertiesEditValueChanged(
  Sender: TObject);
begin
  RefreshControl;
end;
//******************************************************************************
procedure TFrm_ProperFlash.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if  Key = Chr(VK_ESCAPE) then SbtClose.Click;
end;
//******************************************************************************
end.
