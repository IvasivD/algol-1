unit EditPicture;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, Buttons, ExtCtrls, cxMaskEdit, cxDropDownEdit,
  StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit, ComCtrls,
  cxImageComboBox,MSHTML_TLB,DHTMLEDLib_TLB,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxSpinEdit,
  cxCheckBox;

type
  TFrmEditPicture = class(TForm)
    PageControl: TPageControl;
    TabProperty: TTabSheet;
    Label1: TLabel;
    EdPicture: TcxTextEdit;
    ButSelPicture: TButton;
    Label2: TLabel;
    EdAlt: TcxTextEdit;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    SbtOK: TSpeedButton;
    SbtClose: TSpeedButton;
    SelAlign: TcxImageComboBox;
    EdHSpace: TcxTextEdit;
    EdVSpace: TcxTextEdit;
    EdBorder: TcxSpinEdit;
    Label13: TLabel;
    EdName: TcxTextEdit;
    chCodeTo64: TcxCheckBox;
    procedure SbtOKClick(Sender: TObject);
    procedure SbtCloseClick(Sender: TObject);
    procedure ButSelPictureClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdHSpaceKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure EdPicturePropertiesChange(Sender: TObject);
  private
    FPathSelectImages:string;
    function  Validate:boolean;
    procedure SetParam( HTMLEl :IHTMLElement);
    procedure ReadParam( HTMLEl :IHTMLElement);
    procedure NewObject(DHTML:TDHTMLEdit);
    function  FGetSrc:widestring;
    { Private declarations }
  public
    { Public declarations }
  end;
function ImageIsBase64(Src:widestring):boolean;
function ShowEditPic(DHTML:TDHTMLEdit;Anew:Boolean;aFileNameWhenNew:string='';aPathSelectImages:string=''):Boolean;

var FrmEditPicture: TFrmEditPicture;

implementation

uses UnitProc;


{$R *.dfm}
function ShowEditPic(DHTML:TDHTMLEdit;Anew:Boolean; aFileNameWhenNew:string='';aPathSelectImages:string=''):Boolean;
var ctrlrange: ihtmlcontrolrange;
    txtrange : ihtmlTxtrange;
    HTMLEl          :IHTMLElement;
    AFlag:OleVariant;
    Astr:OleVariant;
    APicStr:string;
begin
 try
  Application.CreateForm(TFrmEditPicture, FrmEditPicture);
  if not Anew then
    begin

     ctrlrange :=DHTML.DOM.selection.createRange as ihtmlcontrolrange;
     HTMLEl:=ctrlrange.commonParentElement;

     FrmEditPicture.ReadParam( HTMLEl );
   end
   else  FrmEditPicture.EdPicture.text := aFileNameWhenNew;

  FrmEditPicture.FPathSelectImages := aPathSelectImages;
  FrmEditPicture.showmodal;

  if FrmEditPicture.ModalResult=mrOk then
  begin
     if Anew then
       FrmEditPicture.NewObject(DHTML)
     else
       FrmEditPicture.SetParam( HTMLEl );
     result := True;
  end
  else result := False;

 finally
   freeAndNIl(FrmEditPicture);
 end;
end;

function ImageIsBase64(Src:widestring):boolean;
begin
  result := AnsiPos('data:image', Src )<>0;
end;

function TFrmEditPicture.FGetSrc:widestring;
begin
  if not chCodeTo64.Checked then
    result := EdPicture.Text
  else
  begin

    if not ImageIsBase64( EdPicture.Text ) then 
    result:= ConvertFileToBase64( EdPicture.Text , true )
    else result := EdPicture.Text;
    
  end;
end;

procedure TFrmEditPicture.NewObject(DHTML:TDHTMLEdit);
var txtrange : ihtmlTxtrange;
    APicStr:string;
begin
  txtrange:=DHTML.DOM.selection.createRange as ihtmlTxtrange;

  if EdName.text<>''        then APicStr:='id="' + EdName.Text +'"'+' name="'+ EdName.Text +'"';
  if EdPicture.text<>''     then APicStr:=APicStr+' src="' + FGetSrc +'"';
  if EdAlt.Text<>''         then APicStr:=APicStr+' alt="' + EdAlt.Text+'"';
  if EdBorder.text<>''      then APicStr:=APicStr+' border=' + EdBorder.text;
  if EdHSpace.text<>''      then APicStr:=APicStr+' hspace=' + EdHSpace.text;
  if EdVSpace.text<>''      then APicStr:=APicStr+' vspace=' + EdVSpace.text;
  if SelAlign.EditValue<>'' then APicStr:=APicStr+' align=' + '"'+SelAlign.EditValue+'"';
  //if EdWidth.EditText<>''  then APicStr:=APicStr+' Width=' + EdWidth.EditText;
  //if EdHeight.EditText<>'' then APicStr:=APicStr+' Height=' + EdHeight.EditText;

  txtrange.pasteHTML('<image  ' + APicStr+ '>');
end;

procedure TFrmEditPicture.SetParam( HTMLEl :IHTMLElement);
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
   //HTMLEl.setAttribute('width',EdWidth.EditValue,AFlag);
   //HTMLEl.setAttribute('height',EdHeight.EditValue,AFlag);
   //HTMLEl.style.removeAttribute('width',AFlag);
   //HTMLEl.style.removeAttribute('height',AFlag);
end;

procedure TFrmEditPicture.ReadParam( HTMLEl :IHTMLElement);
var AFlag:OleVariant;
    Astr:OleVariant;
    aStrValue:WideString;
begin
   Astr:=HTMLEl.getAttribute('src',AFlag);
   if (Astr<>null) then
   begin
     aStrValue:=Astr;
     ReplaseOn(aStrValue,'file:///','');
     ReplaseOn(aStrValue,'file://','');
     EdPicture.text:=aStrValue;
   end;

   Astr:=HTMLEl.getAttribute('id',AFlag);
   if (Astr=null)or(Astr<>'') then
   begin
     Astr:=HTMLEl.getAttribute('name',AFlag);
     EdName.Text:= Astr;
   end;


   Astr:=HTMLEl.getAttribute('alt',AFlag);
   if (Astr<>null)and(Astr<>'') then EdAlt.text :=Astr;

   Astr:=HTMLEl.getAttribute('border',AFlag);
   if (Astr<>null) then EdBorder.text :=Astr;

   Astr:=HTMLEl.getAttribute('hspace',AFlag);
   if (Astr<>null) then
   begin
     aStrValue:=Astr;
     if (aStrValue<>'')and(aStrValue<>'0')then EdHSpace.text := aStrValue;
   end;

   Astr:=HTMLEl.getAttribute('vspace',AFlag);
   if (Astr<>null) then
   begin
     aStrValue:=Astr;
     if (aStrValue <> '' )and(aStrValue <> '0' ) then Edvspace.text := aStrValue;
   end;

   Astr:=HTMLEl.getAttribute('align',AFlag);
   if ( Astr <> null )and( Astr <> '' ) then SelAlign.EditValue:=Astr;

   {aStrValue:= GetStyleAttribute(HTMLEl, 'width');
   if aStrValue<>'' then
     EdWidth.EditValue:=aStrValue;

   aStrValue:= GetStyleAttribute(HTMLEl, 'height');
   if aStrValue<>'' then
     EdHeight.EditValue:= aStrValue;  }
end;

function TFrmEditPicture.Validate:boolean;
begin
 result:=true;

 if Trim(EdPicture.Text)='' then
 begin
   MyShowMessageDlg('Вкажіть файл рисунка.',mtError, but_OK );
   result:=false;
   exit;
 end;

 if (not ImageIsBase64( EdPicture.Text ) )and(not FileExists(EdPicture.Text))  then
 begin
   MyShowMessageDlg('Файл рисунка не знайдено',mtError, but_OK );
   result:=false;
   exit;
 end;

 if (chCodeTo64.Checked)and( MyGetFileSize( EdPicture.Text)/1024 > 4 ) then
 begin
   MyShowMessageDlg('Файл рисунка завеликий для кодування в Base 64. ',mtError, but_OK );
   result:=false;
   exit;
 end;


end;

procedure TFrmEditPicture.SbtOKClick(Sender: TObject);
begin
 if not Validate then exit;
 
 ModalResult:=mrOK;
end;

procedure TFrmEditPicture.SbtCloseClick(Sender: TObject);
begin
 ModalResult:=mrCancel;
end;

procedure TFrmEditPicture.ButSelPictureClick(Sender: TObject);
var AFileDialog:TOpenDialog;
begin
  try
    AFileDialog:=TOpenDialog.Create(self);
    if self.FPathSelectImages <>'' then
      AFileDialog.InitialDir := self.FPathSelectImages;

    AFileDialog.Filter:='Графічні файли (*.jpg,*.png,*.jpeg,*.gif,*.bmp,*.wmf,*.art)|*.jpg;*.png;*.jpeg;*.gif;*.bmp;*.wmf;*.art';

    if Trim(EdPicture.Text)<>'' then AFileDialog.InitialDir:=ExtractFilePath(EdPicture.Text);
    if AFileDialog.Execute then
       EdPicture.Text:= AFileDialog.FileName;
  finally
    freeAndNIl(AFileDialog);
  end;
end;

procedure TFrmEditPicture.FormCreate(Sender: TObject);
begin
  PageControl.ActivePage:=TabProperty;
end;

procedure TFrmEditPicture.EdHSpaceKeyPress(Sender: TObject; var Key: Char);
begin
  Key:= EnableInputJustNumber(Sender, Key,false);
end;

procedure TFrmEditPicture.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if  Key = Chr(VK_ESCAPE) then SbtClose.Click;
end;

procedure TFrmEditPicture.EdPicturePropertiesChange(Sender: TObject);
begin
  if ImageIsBase64( EdPicture.Text )  then
  begin
    FrmEditPicture.chCodeTo64.Checked := true;
    FrmEditPicture.chCodeTo64.Enabled := false;
  end
  else
  FrmEditPicture.chCodeTo64.Enabled := true;
end;

end.
