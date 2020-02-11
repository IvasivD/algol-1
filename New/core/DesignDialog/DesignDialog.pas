unit DesignDialog;

interface
uses                                                                                                            
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ImgList, ExtCtrls, ComCtrls, StdCtrls, ActnList , Buttons,cxImage ,cxCheckListBox,
  cxLookAndFeelPainters,cxRichEdit,cxEdit ;

const BeetwenBlock=16;
type
  TblockTextA = record

    PrefixText:WideString;
    MessageStr:WideString;
    PrefixSeek:Integer;

    PrefixAlignment:TAlignMent;
    Alignment:TAlignMent;
    FontSize:Integer;
    FontColor:TColor;
    FontStyle:TFontStyles;
    FontColorPrefix:TColor;
  end;
 PblockTextA = ^TblockTextA;

 TDynamicBlockText = record
   key:Integer;
   txtBlock:TblockTextA;
 end;

 TArrDynamicBlockText = array of TDynamicBlockText;
 PDynamicBlockText = ^TDynamicBlockText;

 TblockText = record
  block:TblockTextA;
  DynBlock:TArrDynamicBlockText;
  aControl:TRichEdit;
 end;
 TArrBlockText = array of TblockText;

 PblockText = ^TblockText;

 TblockCheck = record

    key:integer;
    Text:WideString;
    State:TcxCheckBoxState;
    Enabled:Boolean;
    imageIndex:Integer;
    butImageIndex:Integer;
 end;
 TArrBlockCheck = array of TblockCheck;

 TDialogTextResult = record
    button:Integer;
 end;

 TCheckResult = record
    key:Integer;
    check:boolean;
 end;
 TArrCheckBlock = array of TCheckResult;

 TDialogCheckResult = record
    button:Integer;
    ChBx:TArrCheckBlock;
 end;

 TDialogRadioResult = record
   button:Integer;
   selectKey:Integer;
 end;


TDesignDialog=class
 private
  FMesFormTitle:WideString;
  FMesCaption:WideString;
  FCaptionLoyaut:TTextLayout;

  FimageList:TImageList;
  FimageListIcon:TImageList;
  FImageListButton:TImageList;

  FimageIndexButton:array of Integer;
  FCaptionFontSize:Integer;
  FCaptionFontColor:TColor;
  FCaptionFontStyle:TFontStyles;

  FImageIndex:Integer;
  FWidth:integer;
  FHeight:integer;

  FButCaption:array of  WideString;
  FAlignmentCaption : TAlignMent;

  procedure FcopyMasStr(masFrom: array of WideString;var mastTo: array of WideString);
  procedure FcopyMasInt(masFrom: array of integer;var mastTo: array of integer);
  procedure FShowDialog(aForm:TForm); overload;
  procedure FCalculateHeightCaption(aForm:TForm);

  function  FReadAlignment(var aText: WideString): TAlignMent;
  function  FGetImageGlyphForButt( but:TBitBtn;IndBut:integer ):Integer;
  function  FgetHeightBlock(aform:TForm; aBlckText: TArrBlockText):Integer;
  procedure FshowBottomButton(aForm:TForm;Mes_Width,Sel:Integer);
  function  FgetHeightTextBlock(SText: TRichEdit):integer;
  procedure FSetAutoHeightTextBlock(SText:TRichEdit);

 public
 constructor Create(MesFormTitle , MesCaption:WideString; ImageIndex:Integer; ButCaption: array of WideString); overload;
 destructor  Destroy;overload;

 procedure setSizeDialog(Width:Integer; Height: Integer=-1);
 procedure setCaptionProperty(FontSize:Integer=8; FontColor:TColor=clBlack; FontStyle:TFontStyles=[fsBold]);

 procedure setImageList(imageList:TImageList);
 procedure setImageListIcon(imageList: TImageList);
 procedure setImageListButton(imageList: TImageList;ImageIndexes:array of integer);
 procedure setImageIndexButton(ImageIndexes:array of integer );
 procedure setCaptionLayout(CaptionLoyaut:TTextLayout);

 function ShowDialog:TDialogTextResult; virtual;
end;

TDesignDialogText=class(TDesignDialog)
 private
   FblckText: TArrBlockText;

   procedure FprepareBlockText(currBlckText: TArrBlockText);
   procedure FShowText(aForm:TForm ;aParent:TWinControl ; SText:TRichEdit );
   procedure FPrepareTextBlock(aForm:TForm ;aParent:TWinControl; SText: TRichEdit; blcText:TblockTextA);

   procedure FShowDialogTextCurrBlock(aForm: TForm;var Top_Block:integer;indexBlock,Left_Block,Left_Block_Prefix:Integer;var blcText:TblockText );
   procedure FShowDialogText(aForm:TForm;var aTop:Integer;currBlckText: TArrBlockText); overload;
   function  FFindText(SText:TRichEdit; keyElem:Widestring; posStartLine:integer ):Integer;
   procedure FCalculateFormSize(aForm: TForm);

 public
   constructor Create(MesFormTitle , MesCaption:WideString; blckText: TArrBlockText; ImageIndex:Integer; ButCaption: array of WideString); overload;
   function    ShowDialog:TDialogTextResult; overload;
   procedure   addBlockText(aBlcText:TBlockText);

end;


TDesignDialogCheck=class(TDesignDialogText)
 private

  FblckBeforeCaptionControlCheck: TArrBlockText;
  FblckTextCheck:TArrBlockCheck;

  FmasCheckResult:TArrCheckBlock;
  FCheckBoxList:TcxCheckListBox;
  
  procedure FSetAllState(aCheck: Boolean;AcceptIndex:Integer);

  function  FGetHeightAllItems:integer;
  procedure FShowDialogCheck(aForm:TForm); overload;
  procedure FReadCheckResult;
  procedure FCalculateFormSize(aForm:TForm);
 public
  constructor Create(MesFormTitle , MesCaption:WideString; blckText: TArrBlockCheck; ImageIndex:Integer; ButCaption: array of WideString); overload;
  destructor  Destroy;overload;
  function    ShowDialog:TDialogCheckResult; overload;
  procedure   addTextbloc(aBlkText:TArrBlockText);
  procedure   addTextblocBeforeControlCheck(aBlkText:TArrBlockText);
end;

TDesignDialogRadio=class(TDesignDialogCheck)
 private
   procedure FClickToRadio(Sender: TObject; currIndex:integer);
   procedure FfindAndShowBlockByKey(aTxtBlock:TArrBlockText; key:Integer);
   function  FfindControlBlockByKey( key:Integer; aForm:TForm):TRichEdit;
   procedure cxCheckListBoxClickToRadio(Sender: TObject;
             AIndex: Integer; APrevState, ANewState: TcxCheckBoxState);
   procedure cxCheckListBoxClick(Sender: TObject);
   function  FFindIndChecked:Integer;
   function  FFindKeyByIndex(aIndex:Integer):Integer;
 public
  constructor Create(MesFormTitle , MesCaption:WideString; blckText: TArrBlockCheck; ImageIndex:Integer; ButCaption: array of WideString); overload;
  function ShowDialog:TDialogRadioResult; overload;

 end;
Procedure SetBlockText(var aTxtBlock: TblockTextA; PrefixText, Text :WideString;Alignment:TAlignMent; PrefixSeek:Integer=0;FontColorPrefix:TColor=clRed;FontColor:TColor=clBlack;FontSize:Integer=8;FontStyle:TFontStyles=[] );
Procedure AddDynamcBlockText(var DynamicBlockText: TArrDynamicBlockText;Key:Integer; PrefixText, Text :WideString;Alignment:TAlignMent; PrefixSeek:Integer=0;FontColorPrefix:TColor=clRed;FontColor:TColor=clBlack;FontSize:Integer=8;FontStyle:TFontStyles=[] );
Procedure AddToBlockText(var aBlock: TArrBlockText;PrefixText, Text :WideString;Alignment:TAlignMent; PrefixSeek:Integer=0;FontColorPrefix:TColor=clRed;FontColor:TColor=clBlack; FontSize:Integer=8;FontStyle:TFontStyles=[];DynBlocArr:TArrDynamicBlockText=nil);
procedure AddToBlockCheck(var aBlock:TArrBlockCheck;key:integer;Text:WideString;State:TcxCheckBoxState=cbsUnchecked;Enabled:Boolean=true;imageIndex:Integer=-1;butImageIndex:Integer=-1);

implementation

uses formDialog, re_bmp;
{ TDisignDialog }

constructor TDesignDialog.Create(MesFormTitle , MesCaption:WideString;  ImageIndex:Integer; ButCaption: array of WideString);
begin

 FWidth:=500;
 FHeight:=-1;
 self.FCaptionFontSize:=8;
 self.FCaptionFontColor:=clBlack;
 self.FCaptionFontStyle:=[FsBold];

 FAlignmentCaption:=self.FReadAlignment(MesCaption);

 FMesFormTitle:=MesFormTitle;
 FMesCaption:=MesCaption;
 FimageList:=nil;
 FImageIndex:=ImageIndex;
 FImageListButton:=nil;
 
 setLength(FButCaption,Length(ButCaption) );
 self.FcopyMasStr( ButCaption , FButCaption);
 self.FCaptionLoyaut:=tlCenter;

end;
//******************************************************************************
destructor TDesignDialog.Destroy;
begin
  inherited;
end;
//******************************************************************************
procedure TDesignDialog.FcopyMasStr(masFrom: array of WideString;var mastTo: array of WideString);
var i:integer;
begin
 for i:=0 to Length(mastTo)-1 do
   mastTo[i]:= masFrom[i];
end;
//******************************************************************************
procedure TDesignDialog.FcopyMasInt(masFrom: array of integer;var mastTo: array of integer);
var i:integer;
begin
 for i:=0 to Length(mastTo)-1 do
   mastTo[i]:= masFrom[i];
end;
//******************************************************************************
function TDesignDialog.FReadAlignment(var aText: WideString): TAlignMent;
begin
 result:=taLeftJustify;

 if COPY(aText,1,2)='l&'then
    begin
     result:=taLeftJustify;
     Delete(aText,1,2);
    end;
 if COPY(aText,1,2)='r&'then
    begin
     result:=taRightJustify;
     Delete(aText,1,2);
    end;
 if COPY(aText,1,2)='c&'then
    begin
     result:=taCenter;
     Delete(aText,1,2);
    end;

end;
//******************************************************************************
procedure TDesignDialog.FCalculateHeightCaption(aForm:TForm);
var AutoHeight:Integer;
begin
  //FSetAutoHeightTextBlock( TfrmDialog(aForm).StaticCaptionText );
  AutoHeight:=FgetHeightTextBlock( TfrmDialog(aForm).StaticCaptionText );

  TfrmDialog(aForm).PanelMain.Height := AutoHeight + BeetwenBlock;
  TfrmDialog(aForm).PanelTopImg.Height := TfrmDialog(aForm).PanelMain.Height;
  TfrmDialog(aForm).panelPrefixText.Top := TfrmDialog(aForm).PanelTopImg.Height;
end;
//******************************************************************************
procedure TDesignDialog.FShowDialog(aForm:TForm);
var currImageList:TImageList;
begin
   aForm.Width:=self.FWidth;
   if (self.FHeight<>-1) then
       aForm.Height:=self.FHeight;

   aForm.Repaint;
   aForm.Refresh;
   aForm.Caption:=self.FMesFormTitle;

   TfrmDialog(aForm).StaticCaptionText.Text:=self.FMesCaption;
   TfrmDialog(aForm).StaticCaptionText.Alignment:=self.FAlignmentCaption;
   //TfrmDialog(aForm).StaticCaptionText.Layout:= self.FCaptionLoyaut;

   TfrmDialog(aForm).StaticCaptionText.Font.Size:= self.FCaptionFontSize;
   TfrmDialog(aForm).StaticCaptionText.Font.Color:=Self.FCaptionFontColor;
   TfrmDialog(aForm).StaticCaptionText.Font.Style:=self.FCaptionFontStyle;

   FCalculateHeightCaption(aForm);
   
   SetBkColor(TfrmDialog(aForm).Image.Picture.Bitmap.Canvas.Handle, ColorToRGB(aForm.Color));
   if self.FimageList=nil then
      currImageList:= TfrmDialog(aForm).ImageList
      else
         currImageList:=self.FimageList;

   currImageList.GetBitmap(self.FImageIndex , TfrmDialog(aForm).Image.Picture.Bitmap);

   TfrmDialog(aForm).Image.Repaint;
   TfrmDialog(aForm).Image.Refresh;

   FshowBottomButton(aForm ,FWidth ,0);
end;
//******************************************************************************
function TDesignDialog.ShowDialog:TDialogTextResult;
var frmDialog: TfrmDialog;
begin
  try
   Application.CreateForm(TfrmDialog, frmDialog);

   self.FShowDialog( frmDialog );
   frmDialog.ShowModal;
   Result.button:=frmDialog.FSelBut;
  finally
   frmDialog.free;
  end;
end;
//******************************************************************************
procedure TDesignDialog.setImageList(imageList: TImageList);
begin
 FimageList:=imageList;
end;
//******************************************************************************
function TDesignDialog.FGetImageGlyphForButt(but:TBitBtn;IndBut:integer):Integer;
var img:TBitmap;
begin
  if (self.FImageListButton<>nil)and(Length(self.FimageIndexButton)>IndBut) then
  begin
    img:=TBitmap.Create;
    self.FImageListButton.GetBitmap( IndBut, img );
    but.Glyph:=img;
  end;
end;
//******************************************************************************
procedure TDesignDialog.setCaptionLayout(CaptionLoyaut: TTextLayout);
begin
 self.FCaptionLoyaut:=CaptionLoyaut;
end;
//******************************************************************************
procedure TDesignDialog.FshowBottomButton(aForm:TForm;Mes_Width,Sel:Integer);
var i:integer;
    Count_But:integer;
    b:TBitBtn;
    Width_but,Heigth_but:integer;
    Top_But,Left_But:integer;
    Mes_Heigth,Step_But:integer;
    SpaceFromRight:integer;
begin

 Count_But:=Length(self.FButCaption);
 Width_but:=75;
 Heigth_but:=25;
 Mes_Heigth:=125;
 Step_But:=3;
 Top_But:=4;
 SpaceFromRight:=12;

 left_but:= Mes_Width - ((Width_but+Step_but)*Count_But)-SpaceFromRight;

 for i:=0 to Count_But-1 do
 begin
   b := TBitBtn.Create(aForm);
   b.Parent:=TfrmDialog(aForm).PanelBottonm;
   b.Top:=Top_But;
   b.left:=Left_But;
   b.Width:=Width_but;
   b.Height:=Heigth_but;
   b.Name:=TfrmDialog(aForm).PanelBottonm.Name+'_But'+IntToStr(i);
   b.Anchors :=[akTop, akRight ];
   b.Caption:=self.FButCaption[i];

   self.FGetImageGlyphForButt( b , i );
   b.NumGlyphs:=1;
   b.Tag:=i+1;

   b.OnClick:=TfrmDialog(aForm).ButtonClick;
   Left_But:=Left_But+Width_but+Step_But;

   if (Sel>=0)and(Sel<Count_but)then
     if (Count_but<>0)then
        b.TabOrder:=(Count_but+i-Sel)mod Count_but;
 end;
end;
//******************************************************************************
procedure TDesignDialog.setCaptionProperty(FontSize: Integer;
  FontColor: TColor; FontStyle: TFontStyles);
begin

 self.FCaptionFontSize:=FontSize;
 self.FCaptionFontColor:=FontColor;
 self.FCaptionFontStyle:=FontStyle;

end;
//******************************************************************************
procedure TDesignDialog.setSizeDialog(Width:Integer; Height: Integer=-1);
begin
 FWidth:=Width;
 FHeight:=Height;
end;
//******************************************************************************
{ TDesignDialogText }
procedure TDesignDialogText.addBlockText(aBlcText:TBlockText);
var Len:Integer;
begin
  Len:= Length(self.FblckText);
  SetLength(self.FblckText , Len+1 );

  self.FblckText[Len]:= aBlcText;
end;
//******************************************************************************
procedure TDesignDialog.setImageListIcon(imageList: TImageList);
begin
 self.FimageListIcon:=imageList;
end;
//******************************************************************************
procedure TDesignDialog.setImageListButton(imageList: TImageList;ImageIndexes:array of integer);
begin
 self.FImageListButton:=imageList;
 SetImageIndexButton(ImageIndexes);
end;
//******************************************************************************
procedure TDesignDialog.SetImageIndexButton(ImageIndexes:array of integer );
begin
  SetLength(FimageIndexButton , Length(ImageIndexes) );
  Self.FcopyMasInt( FimageIndexButton , ImageIndexes);
end;
//******************************************************************************
constructor TDesignDialogText.Create(MesFormTitle, MesCaption: WideString;
            blckText: TArrBlockText; ImageIndex: Integer; ButCaption: array of WideString);
begin
  self.Create(MesFormTitle,MesCaption,ImageIndex,ButCaption);
  FblckText:=blckText;
end;
//******************************************************************************
function TDesignDialog.FgetHeightBlock(aform:TForm; aBlckText: TArrBlockText):Integer;
var i:integer;
begin
 result:=0;

 for i:=0 to TfrmDialog(aForm).panelText.ControlCount-1 do
 begin
  if (TfrmDialog(aForm).panelText.Controls[i] is TRichEdit) then
      result:=result + TRichEdit(TfrmDialog(aForm).panelText.Controls[i]).Height;
 end;

end;
//******************************************************************************
procedure TDesignDialogText.FprepareBlockText(currBlckText: TArrBlockText);
var i:integer;
    currPrefixMessageStr:WideString;
    currMessageStr:WideString;
begin
 for i:=0 to Length(currBlckText)-1 do
 begin

  currPrefixMessageStr:=currBlckText[i].block.PrefixText;
  currBlckText[i].block.PrefixAlignment:= self.FReadAlignment( currPrefixMessageStr );
  currBlckText[i].block.PrefixText:=currPrefixMessageStr;
  //*************
  currMessageStr:= currBlckText[i].block.MessageStr;
  currBlckText[i].block.Alignment := self.FReadAlignment( currMessageStr );
  currBlckText[i].block.MessageStr := currMessageStr;

 end;
end;
//******************************************************************************
procedure TDesignDialogText.FCalculateFormSize(aForm: TForm);
var pm:Integer;
    checkItems:Integer;
    TextBlockHeight:Integer;
    i:Integer;
begin
 pm:= TfrmDialog(aForm).PanelMain.Height;
 TextBlockHeight:=self.FgetHeightBlock(aForm, self.FblckText);

 aForm.Height:= pm  + TextBlockHeight+TfrmDialog(aForm).PanelBottonm.Height+30;
end;
//******************************************************************************
function TDesignDialog.FgetHeightTextBlock(SText: TRichEdit):integer;
var p:TPoint;
begin
 SText.Lines.Add('!');
 SText.Perform(em_posfromchar,Integer(@p),Length(SText.Text));
 result:=p.y+(p.y div SText.Lines.Count)+4;
 SText.Lines.Delete( SText.Lines.Count-1 );
end;
//******************************************************************************
procedure TDesignDialog.FSetAutoHeightTextBlock(SText: TRichEdit);
begin
 SText.Height:=FgetHeightTextBlock(SText);
end;
//******************************************************************************
function FParseElem(aStr:Widestring; StartIndex:Integer; key:WideString):String;
var realPartStr:Widestring;
    i:Integer;
    findEndInd:Integer;
    ind:Integer;
begin
  realPartStr:=Copy( aStr, StartIndex, Length(aStr)-StartIndex+1);
  ind:= AnsiPos(key ,aStr);
  findEndInd:=-1;

  for i:=ind to Length(aStr) do
  if aStr[i]='}' then
     begin
       findEndInd:=i;
       Break;
     end;

  if findEndInd<>-1 then
  begin
    result:=Copy(aStr , ind ,findEndInd - ind+1);
    StartIndex:= findEndInd;
  end
  else result:='';
end;
//******************************************************************************
function ReplaceON( var MainStr: Widestring; SubStrOld, SubStrNew: Widestring):boolean;
var PosSubStrOld: integer;
begin
  result:=false;
  PosSubStrOld:= 1;
  if Ansipos(SubStrOld,SubStrNew)<>0 then exit;     // No cycled

  while PosSubStrOld <> 0 do
  begin
    PosSubStrOld:= AnsiPos(AnsiLowerCase(SubStrOld), AnsiLowerCase(MainStr));
    if PosSubStrOld <> 0 then
       begin
        MainStr:=Copy(MainStr, 1, PosSubStrOld-1)+SubStrNew+
                 Copy(MainStr, PosSubStrOld + Length(SubStrOld), Length(MainStr));
        result:=true;
       end;
  end;
end;
//******************************************************************************
function fillSpace(count:integer):widestring;
var i:Integer;
begin
  Result:='';
  for i:=0 to count-1 do
   Result:=Result+' ';
end;
//******************************************************************************
function Search_And_Replace(RichEdit: TRichEdit;
  SearchText, ReplaceText: WideString): Boolean; 
var 
  startpos, Position, endpos: integer; 
begin 
  startpos := 0; 
  with RichEdit do 
  begin 
    endpos := Length(RichEdit.Text); 
    Lines.BeginUpdate; 
    while FindText(SearchText, startpos, endpos, [stMatchCase])<>-1 do 
    begin
      endpos   := Length(RichEdit.Text) - startpos;
      Position := FindText(SearchText, startpos, endpos, [stMatchCase]);
      Inc(startpos, Length(SearchText));

      SelStart  := Position;
      SelLength := Length(SearchText);
      richedit.clearselection;
      SelText := ReplaceText;
    end;
    Lines.EndUpdate; 
  end; 
end;
//******************************************************************************
function TDesignDialogText.FFindText(SText:TRichEdit; keyElem:Widestring; posStartLine:integer ):Integer;
var j:integer;
begin
 result:=SText.FindText(keyElem, posStartLine, Length(SText.Text) , []);
 if (result<>-1) then
     for j:=result to Length(SText.Text) do
       if SText.Text[j]='{' then
       begin
        result:=j;
        break;
       end;
end;
//******************************************************************************
procedure TDesignDialogText.FShowText(aForm:TForm ;aParent:TWinControl ; SText:TRichEdit );
const keyImg='{img:';
var i:integer;
    j:Integer;
    currElStr:Widestring;
    btm:TBitmap;
    currImageIndex:Integer;

    CountEnter:Integer;
    currTop:Integer;
    currLeft:Integer;
    posStartLine:Integer;
    NewStr:Widestring;
    MarkEle:TStringList;
    lenElem:Integer;
    FindElem:Integer;
begin
 try
  MarkEle:=TStringList.Create;
  CountEnter:=0;
  btm:=TBitmap.Create;
  btm.Transparent:=True;
  
  currTop:= 0;
  currLeft:= SText.left;
  posStartLine:=0;
  
  FindElem :=FFindText(SText,  keyImg,  posStartLine );
  while FindElem<>-1 do
  begin
    if FindElem<>-1 then
       begin
            for j:=FindElem to Length(SText.Text) do

              if  SText.Text[j]='}' then
              begin
               currElStr:=Copy( SText.Text ,FindElem, j-FindElem+1 );
               lenElem:=length(currElStr);
               SText.SelStart := FindElem-1;
               SText.SelLength:= Length(currElStr);
               SText.clearselection;

               ReplaceON(currElStr,'{img:','');
               ReplaceON(currElStr,'}','');

               Self.FimageListIcon.GetBitmap( StrToInt(currElStr), btm);

               btm.Transparent:=True;
               btm.TransparentColor:= clWhite;

               InsertBitmapToRE(SText.Handle, btm.Handle);
               posStartLine:=j-lenElem;
               break;
              end;
       end;
    FindElem :=FFindText(SText,  keyImg,  posStartLine );
  end;

 finally
   btm.free;
   MarkEle.Free;
 end;
end;
//******************************************************************************
procedure TDesignDialogText.FPrepareTextBlock(aForm:TForm ;aParent:TWinControl; SText: TRichEdit; blcText:TblockTextA);
begin
 SText.Font.Color:= blcText.FontColor;
 SText.Font.Size := blcText.FontSize;
 SText.Font.Style:= blcText.FontStyle;
 SText.text:= blcText.MessageStr;
 SText.Alignment :=blcText.Alignment;

 FShowText(aForm ,aParent , SText );
end;
//******************************************************************************
procedure TDesignDialogText.FShowDialogTextCurrBlock(aForm: TForm;var Top_Block:integer;indexBlock,Left_Block,Left_Block_Prefix:Integer;var blcText:TblockText );
var SPrefixText:TStaticText;
    SText: TRichEdit;
    DeltaPanel:Integer;
begin
 DeltaPanel:=0;//TfrmDialog(aForm).panelPrefixText.Top - TfrmDialog(aForm).panelText.Top  ;

 SPrefixText:= TStaticText.Create(aForm);
 SPrefixText.Parent:=TfrmDialog(aForm).panelPrefixText;
 SPrefixText.AutoSize:=false;
 SPrefixText.Font.Style:=[fsBold];
 SPrefixText.Tag :=indexBlock;

 SPrefixText.Top:= Top_Block  - DeltaPanel +  blcText.block.PrefixSeek;
 SPrefixText.Left:= Left_Block_Prefix;

 SPrefixText.Caption:= blcText.block.PrefixText;
 SPrefixText.Font.Color:=blcText.block.FontColorPrefix;

 SPrefixText.Alignment:=blcText.block.PrefixAlignment;
 SPrefixText.width:=TfrmDialog(aForm).panelPrefixText.Width;

 SText:= TRichEdit.Create(aForm);

 SText.BorderStyle:=bsNone;
 SText.Parent:=TfrmDialog(aForm).panelText;
 SText.Enabled   := False;
 SText.Tag       := indexBlock;

 SText.Top:= Top_Block;
 SText.Left:= Left_Block;
 SText.Width:=TfrmDialog(aForm).panelText.Width-5;
 SText.Anchors:=[akTop,akLeft,akRight];

 FPrepareTextBlock(aForm ,TfrmDialog(aForm).panelText , SText, blcText.block);

 SText.ReadOnly:=True;
 blcText.aControl:=SText;

 self.FSetAutoHeightTextBlock(SText);
 SPrefixText.Height := SText.Height;
 Top_Block:=Top_Block+SText.Height;
end;
//******************************************************************************
procedure TDesignDialogText.FShowDialogText(aForm: TForm;var aTop:Integer; currBlckText: TArrBlockText);
var i:integer;
    Left_Block_Prefix:Integer;
    Top_Block:Integer;
    Left_Block:Integer;
    StepBlock:integer;
begin
 self.FprepareBlockText(currBlckText);
 Left_Block_Prefix:=2;

 Left_Block:=2;
 StepBlock:=0;

 for i:=0 to length(currBlckText)-1 do
     FShowDialogTextCurrBlock(TfrmDialog(aForm) , aTop, i , Left_Block, Left_Block_Prefix, currBlckText[i]);
end;
//******************************************************************************
function TDesignDialogText.ShowDialog:TDialogTextResult;
var frmDialog: TfrmDialog;
    TopBlock:Integer;
begin
  try
   Application.CreateForm(TfrmDialog, frmDialog);

   TopBlock:=2;
   self.FShowDialog( frmDialog  );
   self.FShowDialogText(frmDialog , TopBlock ,self.FblckText);
   self.FCalculateFormSize(frmDialog);

   frmDialog.ShowModal;

   result.button:=frmDialog.FSelBut;
  finally
   frmDialog.free;
  end;

end;
//******************************************************************************
{ TDesignDialogSheck }
constructor TDesignDialogCheck.Create(MesFormTitle, MesCaption: WideString;
  blckText: TArrBlockCheck; ImageIndex: Integer;
  ButCaption: array of WideString);
begin

  self.Create(MesFormTitle,MesCaption,ImageIndex,ButCaption);
  FblckTextCheck:=blckText;
  self.FblckText:=nil;
  self.FblckBeforeCaptionControlCheck:=nil;

end;
//******************************************************************************
destructor TDesignDialogCheck.Destroy;
begin

end;
//******************************************************************************
procedure TDesignDialogCheck.FSetAllState(aCheck: Boolean;AcceptIndex:Integer);
var i:Integer;
begin
  for i:=0 to self.FCheckBoxList.Items.Count-1 do
      if (i <> AcceptIndex) then self.FCheckBoxList.Items[i].Checked:= aCheck;
end;
//******************************************************************************
function TDesignDialogCheck.FGetHeightAllItems:integer;
var i:integer;
    R: TRect;
begin
  result:=0;
  for i:=0 to FCheckBoxList.Items.Count-1 do
  begin
    R:=FCheckBoxList.ItemRect(i);
    result:=result + R.Bottom-R.Top;
  end;

  result:=result+5;
end;
//******************************************************************************
procedure TDesignDialogCheck.FShowDialogCheck(aForm: TForm);
var i:integer;
    SPrefixText: TStaticText;
    Top_Block:Integer;
    Left_Block_Prefix:Integer;
    HeightTextBlocl:integer;
    newItem:TcxCheckListBoxItem;
    beforeTextBlock:TblockText;
begin
 Top_Block:=0;

 if self.FblckBeforeCaptionControlCheck<>nil then
    self.FShowDialogText( aForm , Top_Block ,self.FblckBeforeCaptionControlCheck);

 FCheckBoxList.Top:=Top_Block;
 FCheckBoxList.Parent:=TfrmDialog(aForm).panelText;
 
 FCheckBoxList.Width :=TfrmDialog(aForm).Width - TfrmDialog(aForm).PanelLeft.Width-12 ;
 FCheckBoxList.Images:=Self.FimageListIcon;
 FCheckBoxList.ImageLayout:=ilAfterChecks;
 FCheckBoxList.Style.BorderStyle:=cbsFlat;
 FCheckBoxList.Style.Color:=TfrmDialog(aForm).Color;

 for i:=0 to length(self.FblckTextCheck)-1 do
 begin
   with FCheckBoxList.Items.Add do
   begin
     Text := self.FblckTextCheck[i].Text;
     Tag := self.FblckTextCheck[i].key;
     Enabled:=self.FblckTextCheck[i].Enabled;
     State :=self.FblckTextCheck[i].State;
     if self.FblckTextCheck[i].State = cbsChecked then FCheckBoxList.ItemIndex:=i;
     ImageIndex:= self.FblckTextCheck[i].imageIndex;
    end;
 end;

 FCheckBoxList.Height:=self.FGetHeightAllItems;
 Top_Block:= FCheckBoxList.Top + FCheckBoxList.Height + BeetwenBlock;
 self.FShowDialogText( aForm , Top_Block ,self.FblckText );
end;
//******************************************************************************
procedure TDesignDialogCheck.FReadCheckResult;
var i:Integer;
     var masCheck2:array of TCheckResult;
begin
  SetLength( FmasCheckResult , FCheckBoxList.Items.Count );
  for i:=0 to FCheckBoxList.Items.Count-1 do
  begin
   FmasCheckResult[i].key:=FCheckBoxList.Items[i].Tag;
   FmasCheckResult[i].check:= FCheckBoxList.Items[i].Checked;
  end;
end;
//******************************************************************************
function TDesignDialogCheck.ShowDialog:TDialogCheckResult;
var frmDialog: TfrmDialog;
begin
  try
   FCheckBoxList:= TcxCheckListBox.Create(nil);
   
   Application.CreateForm(TfrmDialog, frmDialog);

   self.FShowDialog( frmDialog  );
   self.FShowDialogCheck(frmDialog );

   FCalculateFormSize(frmDialog);

   FCheckBoxList.Style.BorderStyle:=cbsNone;
   frmDialog.ShowModal;
   FReadCheckResult;
   result.button:=frmDialog.FSelBut;
   result.ChBx:=self.FmasCheckResult;

  finally
   FCheckBoxList.Parent:=nil;
   FCheckBoxList.free;

   frmDialog.free;
  end;
end;
//******************************************************************************
procedure TDesignDialogCheck.addTextbloc(aBlkText:TArrBlockText);
begin
  Self.FblckText:= aBlkText;
end;
//******************************************************************************
procedure TDesignDialogCheck.addTextblocBeforeControlCheck( aBlkText: TArrBlockText);
begin
 Self.FblckBeforeCaptionControlCheck:=aBlkText;
end;
//******************************************************************************

{ TDesignDialogRadio }
procedure TDesignDialogRadio.FClickToRadio(Sender: TObject; currIndex:integer);
var a:WideString;
    pCurrBlck:PblockTextA;
    CurrBlck:TblockTextA;
    SText:TRichEdit;
    aForm:TForm;
begin
 if currIndex=-1 then exit;

 if (TcxCheckListBox(Sender).Items[ currIndex ].Enabled ) then
 begin
  self.FSetAllState(false, currIndex);
  self.FCheckBoxList.Items[currIndex].Checked:=True;
 end;

 FfindAndShowBlockByKey( Self.FblckText , self.FCheckBoxList.Items[currIndex].Tag );
 FfindAndShowBlockByKey( Self.FblckBeforeCaptionControlCheck , self.FCheckBoxList.Items[currIndex].Tag );
end;
//******************************************************************************
Procedure TDesignDialogRadio.FfindAndShowBlockByKey(aTxtBlock:TArrBlockText; key:Integer);
var i:integer;
    j:Integer;
    aForm:TForm;
begin
   for i:=0 to Length(aTxtBlock)-1 do
   begin
     if (aTxtBlock[i].DynBlock <> nil) then
     begin
       for j:=0 to Length(aTxtBlock[i].DynBlock)-1 do
       begin
         if (aTxtBlock[i].DynBlock[j].key = key) then
         begin
           if (aTxtBlock[i].aControl<>nil) then
           begin
             aForm:=TForm(aTxtBlock[i].aControl.Parent.Owner);
             FPrepareTextBlock(aForm , TfrmDialog(aForm).panelText , aTxtBlock[i].aControl , aTxtBlock[i].DynBlock[j].txtBlock);
           end;
         end;
       end;
     end;
   end;
end;
//******************************************************************************
function TDesignDialogRadio.FfindControlBlockByKey( key:Integer; aForm:TForm ):TRichEdit;
var i:integer;
begin
 result:=nil;

 for i:=0 to TfrmDialog(aForm).panelText.ControlCount-1 do
 begin
  if (TfrmDialog(aForm).panelText.Controls[i] is TRichEdit) and (TfrmDialog(aForm).panelText.Controls[i].Tag = key) then
   begin
     result:= TRichEdit(TfrmDialog(aForm).panelText.Controls[i]);
     Break;
   end;
 end;
end;
//******************************************************************************
procedure TDesignDialogRadio.cxCheckListBoxClickToRadio(Sender: TObject;
  AIndex: Integer; APrevState, ANewState: TcxCheckBoxState);
begin
   FClickToRadio(Sender, AIndex);
end;
//******************************************************************************
procedure TDesignDialogRadio.cxCheckListBoxClick(Sender: TObject);
var itemIndex:integer;
begin
 FClickToRadio(Sender, TcxCheckListBox(Sender).ItemIndex);
end;
//******************************************************************************
constructor TDesignDialogRadio.Create(MesFormTitle, MesCaption: WideString;
  blckText: TArrBlockCheck; ImageIndex: Integer;
  ButCaption: array of WideString);
begin
 TDesignDialogCheck(self).Create(MesFormTitle,MesCaption,blckText, ImageIndex,ButCaption);

end;
//******************************************************************************
function TDesignDialogRadio.FFindIndChecked:Integer;
var i:Integer;
begin
  for i:=0 to FCheckBoxList.Items.Count-1 do
    if (FCheckBoxList.Items[i].Checked ) then
    begin
      result:=i;
      Break;
    end;
end;
//******************************************************************************
function TDesignDialogRadio.FFindKeyByIndex(aIndex:Integer):Integer;
begin
 result:= self.FblckTextCheck[aIndex].key;
end;
//******************************************************************************
function TDesignDialogRadio.ShowDialog: TDialogRadioResult;
var res:TDialogCheckResult;
var frmDialog: TfrmDialog;
begin
  try
   FCheckBoxList:= TcxCheckListBox.Create(nil);
   self.FCheckBoxList.OnClickCheck:=self.cxCheckListBoxClickToRadio;
   self.FCheckBoxList.OnClick :=cxCheckListBoxClick;
   Application.CreateForm(TfrmDialog, frmDialog);

   self.FShowDialog( frmDialog  );
   self.FShowDialogCheck(frmDialog );

   FClickToRadio(FCheckBoxList ,  FCheckBoxList.ItemIndex );

   self.FCheckBoxList.Glyph:= frmDialog.ImgRadioBut.Picture.Bitmap;
   self.FCheckBoxList.GlyphCount:=2;

   FCalculateFormSize(frmDialog);
   
   FCheckBoxList.Style.BorderStyle:=cbsNone;
   frmDialog.ShowModal;
   FReadCheckResult;
   result.button:=frmDialog.FSelBut;
   result.selectKey:=FFindKeyByIndex( self.FFindIndChecked );

  finally
   FCheckBoxList.Parent:=nil;
   FCheckBoxList.free;
   
   frmDialog.free;
  end;

end;
//******************************************************************************
procedure TDesignDialogCheck.FCalculateFormSize(aForm: TForm);
var pm:Integer;
    checkItems:Integer;
    TextBlockHeight:Integer;
begin
 pm:= TfrmDialog(aForm).PanelMain.Height;
 checkItems:=self.FGetHeightAllItems;
 TextBlockHeight:=self.FgetHeightBlock(aForm , self.FblckText);

 aForm.Height:= pm + checkItems + TextBlockHeight+TfrmDialog(aForm).PanelBottonm.Height+BeetwenBlock+30;
end;
//******************************************************************************
Procedure SetBlockText(var aTxtBlock: TblockTextA; PrefixText, Text :WideString;Alignment:TAlignMent; PrefixSeek:Integer=0;FontColorPrefix:TColor=clRed;FontColor:TColor=clBlack;FontSize:Integer=8;FontStyle:TFontStyles=[] );
begin
   aTxtBlock.PrefixText:= PrefixText;
   aTxtBlock.MessageStr:= Text;
   aTxtBlock.PrefixSeek:= PrefixSeek;
   aTxtBlock.Alignment:=  Alignment;
   aTxtBlock.PrefixAlignment:=  taRightJustify;
   aTxtBlock.FontSize:= FontSize;
   aTxtBlock.FontColor:= FontColor;
   aTxtBlock.FontStyle:= FontStyle;
   aTxtBlock.FontColorPrefix:= FontColorPrefix;
end;
//******************************************************************************
Procedure AddDynamcBlockText(var DynamicBlockText: TArrDynamicBlockText;Key:Integer; PrefixText, Text :WideString;Alignment:TAlignMent; PrefixSeek:Integer=0;FontColorPrefix:TColor=clRed;FontColor:TColor=clBlack;FontSize:Integer=8;FontStyle:TFontStyles=[] );
var len:integer;
begin
 len:=Length(DynamicBlockText);
 SetLength(DynamicBlockText,len+1);

 DynamicBlockText[len].key:=Key;

 SetBlockText( DynamicBlockText[len].txtBlock ,PrefixText, Text , Alignment, PrefixSeek ,FontColorPrefix, FontColor ,FontSize, FontStyle);
end;
//******************************************************************************
Procedure AddToBlockText(var aBlock: TArrBlockText;PrefixText, Text :WideString;Alignment:TAlignMent; PrefixSeek:Integer=0;FontColorPrefix:TColor=clRed;FontColor:TColor=clBlack;FontSize:Integer=8;FontStyle:TFontStyles=[];DynBlocArr:TArrDynamicBlockText=nil );
var len:Integer;
begin
   len:=Length(aBlock);
   SetLength(aBlock,len+1);
   SetBlockText(aBlock[len].block, PrefixText, Text, Alignment, PrefixSeek, FontColorPrefix ,FontColor, FontSize, FontStyle );
   aBlock[len].DynBlock:= DynBlocArr;
end;
//******************************************************************************
procedure AddToBlockCheck(var aBlock:TArrBlockCheck;key:integer;Text:WideString;State:TcxCheckBoxState=cbsUnchecked;Enabled:Boolean=true;imageIndex:Integer=-1;butImageIndex:Integer=-1);
var len:Integer;
begin
   len:=Length(aBlock);
   SetLength(aBlock,len+1);
   aBlock[len].key:=key;
   aBlock[len].Text:=Text;
   aBlock[len].State:=State;
   aBlock[len].Enabled:=Enabled;
   aBlock[len].imageIndex:=imageIndex;
   aBlock[len].butImageIndex:=butImageIndex;
end;
//******************************************************************************

end.
StaticCaptionText
