unit UnitHTMLEditor;

interface
uses  Windows,ActiveX, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, DB,
      mshtml_TLB,DHTMLEDLib_TLB, ComObj,Contnrs,printers,IniFiles,Registry,ShellAPI,cxDropDownEdit,UnitInsertHyperLink,
      Dialogs,ProperFlash,UnitProc, StdCtrls, ComCtrls,OleCtrls, OleCtnrs, ClipBrd,SetTable,UnitHTMLCodeEditor,UnitSyntaxMemo;
 const
    MSOCMDEXECOPT_PROMPTUSER = OLECMDEXECOPT_PROMPTUSER;
    MSOCMDEXECOPT_DONTPROMPTUSER = OLECMDEXECOPT_DONTPROMPTUSER;
    IID_IDocHostUIHandler: TGUID = '{bd3f23c0-d43e-11cf-893b-00aa00bdce1a}';
    GUID_TriEditCommandGroup: TGUID = '{2582F1C0-084E-11d1-9A0E-006097C9B344}';
    CMDSETID_Forms3: TGUID = '{DE4BA900-59CA-11CF-9592-444553540000}';
    IS_CODECOLOR = 3;
 //***********************************
  Type
    TPreviewBrowser = ( BrPreviewIE,BrPreviewFirefox,BrPreviewOpera,BrPreviewGHrome,BrPreviewDefault);
    TSaveOptBrowser = ( BrSaveOptAll, BrSaveOptContent, BrSaveOptPreview );
    TTypeSaveOrLoad = ( BrOptIsSave, BrOptIsLoad);
    TTypeLoadDocBrowser = ( BrLoadDocNormal, BrLoadDocByParam );

  TObjectProcedure = procedure of object;
  TEventObject = class(TInterfacedObject, IDispatch)
  private
    FOnEvent: TObjectProcedure;
  protected
    function GetTypeInfoCount(out Count: Integer): HResult; stdcall;
    function GetTypeInfo(Index, LocaleID: Integer; out TypeInfo): HResult; stdcall;
    function GetIDsOfNames(const IID: TGUID; Names: Pointer;  NameCount, LocaleID: Integer; DispIDs: Pointer): HResult; stdcall;
    function Invoke(DispID: Integer; const IID: TGUID; LocaleID: Integer; Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer): HResult; stdcall;
  public
    constructor Create(const OnEvent: TObjectProcedure);
    property OnEvent: TObjectProcedure read FOnEvent write FOnEvent;
  end;

  TValueCSS = record
    ParamName : WideString;
    ParamValue: WideString;
  end;
  TValueCSSArr = array of TValueCSS;

  TValueCSSFile = record
    ClassName : WideString;
    Param : TValueCSSArr;
  end;
  TValueCSSFileArr = array of TValueCSSFile;


  TParamCss = record
    Path : string;
    PathPreview : string;
    IconElemTag : string;
    DefIncludeCss : array of string;
    IConCSS : TValueCSSFileArr;
  end;

    TWebHtmlEditor=class
    private
      FHTMLEditSetupIni         :String;
      FHTMLTableResize          :THTMLTableResize;

      FHTMLCodeEditor           :THTMLCodeEditor;
      FColSelected              :boolean;
      FRowSelected              :boolean;
      FOptLoadDoc               :TTypeLoadDocBrowser;

      FDocComplete :boolean;
      FNewDoc      :Boolean;
      FTDElem      :OLEVariant;

      //FIconCssValue : TValueCSSFileArr;
      FParamCSS : TParamCss;

      FPathCss:string;
      FPathImage:String;
      FPathFlashObj:String;
      FPathVideoObj:String;

      FDocChange :Boolean;
      FTitleHTMLEditor:WideString;
      FCurrFileName :Widestring;
      FNilVariant : OleVariant;
      FDHTMLEdit:TDHTMLEdit;
      FCurrCharSet:String;

      FPersonalHTMLEditonDblClick :TNotifyEvent;
      FPersonalHTMLEditonClick :TNotifyEvent;
      FPersonalHTMLEditonKeyUp :TNotifyEvent;
      FPersonalHTMLEditonOnComplete :TNotifyEvent;
      FFunctRefresh:TNotifyEvent;

      function FGetCmdTarget: IOleCommandTarget;
      function FDOMInterface: IHtmlDocument2;
      function FCommandTarget: IOleCommandTarget;
      function FHrExecCommand(ucmdID: cardinal; const pVarIn: OleVariant; var pVarOut: OleVariant; bPromptUser, bTriEditCmdGroup: boolean): HResult;
      function FGetPathFromBrowser(myProgram:String):String;
      function FGetBrowser(aBrowser:TPreviewBrowser):Widestring;
      function FTempPath:Widestring;
      function FQueryStatus(cmdID: OleVariant): OleVariant;

      procedure FSetProperty(const Name: String; Value: OleVariant);
      function  FGetProperty(const Name: String): OLEVariant;

      function  FGetFontName: String;
      procedure FSetFontName(const Value: String);
      procedure FSetFontSize(const Value: Integer);
      function  FGetFontSize: Integer;

      function  FGetBold: Boolean;
      procedure FSetItalic(const Value: Boolean);
      function  FGetCommandStatus(ucmdID: Cardinal; bTriEditCmdGroup: boolean): DWORD;
      procedure FSetTextColor(const Value: TColor);
      function  FGetTextColor: TColor;
      function  FGetUnderline: Boolean;
      procedure FSetUnderline(const Value: Boolean);
      function  FGetItalic: Boolean;
      procedure FSetBold(const Value: Boolean);
      procedure FSetBulletList(const Value: Boolean);
      function  FGetBulletList: Boolean;
      procedure FSetFontStyle(const Value: String);
      function  FGetFontStyle: String;
      procedure FSetTextAlignment(const Value: TAlignment);
      function  FGetTextAlignment: TAlignment;
      procedure FSetNumberedList(const Value: Boolean);
      function  FGetNumberedList: Boolean;
      procedure FGetSpecialCommandState(cmdID: Cardinal;
                bTrieditCommandGroup: boolean; var bEnabled, bChecked: boolean);

      function  FGetSub:Boolean;
      function  FGetSup:Boolean;

      procedure FRepareNewHTML;
      procedure FOnStartDragDOM;
      procedure FOnKeyPressDOM;
      procedure FOnRedystateChangeDOM;
      function  FGetShowDetailTag:Boolean;
      procedure FSetShowDetailTag(Value:Boolean);
      procedure FSetCurrFileName(aFileName:Widestring);

      procedure FHTMLEditondblclick(Sender: TObject);
      procedure FDHTMLDocumentComplete(Sender: TObject);
      procedure FDhtmlOnKeyUp(Sender: TObject);
      procedure FDhtmlOnClick(Sender: TObject);

      function  FPrepareLinkHtml( LinkProperty:THyperLinkProperty ):string;
      procedure FInsertTextLink;
      procedure FInsertControlLink;


      Function FGetSavePathCSS(SaveOpt:TSaveOptBrowser):Widestring;
      Function FGetSavePathImage( SaveOpt:TSaveOptBrowser ):Widestring;
      Function FGetSavePathFlash( SaveOpt:TSaveOptBrowser ):Widestring;
      Function FGetSavePathVideo( SaveOpt:TSaveOptBrowser ):Widestring;


      function  FPrepareSrcElemAndGetNewParamSrc(SrcValue,PathToSave,PathSaveObj:WideString;ShowFullPath:Boolean;CopyToPreview:Boolean=true):String;
      procedure FPrepareElementCollections( Elements:OleVariant; TagName,TagChildEleme,FileAttribute:String;PathTosave,PathSaveObj:WideString;ShowFullPath:Boolean; CopyToPreview:boolean=True );
      Function  FPrepareHTMLDocForPathPreview(aDOOM:IHTMLDocument2;PathToave:String;TypeSave: TTypeSaveOrLoad;
                                              SaveOpt:TSaveOptBrowser = BrSaveOptAll ):String;
      function  FElemHaveChildren(aElem:Olevariant):Boolean;
      function  FSelectedElemHaveChildren:Boolean;
      function  FSelectedElemHaveNextChildElem:Boolean;
      procedure FOnChangeHTMLCodeEditor(Sender: TObject; ChangedItems: TChangedItems);
      procedure FClearAttributeElem(AHTMLElem : OLEVariant);
      Procedure FprepareDelTemplateGarbage;
      procedure FReadCssParam;
      function  FClearTeftFromGarbage(aText:widestring):Widestring;
      function  FGetCSSParambyNameForIndex(Index:Integer;ParamName:String):widestring;
    public
      btnCopy                   :TToolButton;
      btnCut                    :TToolButton;
      btnPaste                  :TToolButton;
      butPasteWithFilter        :TToolButton;
      btnPasteFilter            :TToolButton;
      btnDel                    :TToolButton;
      butUndo                   :TToolButton;
      butRedo                   :TToolButton;

      FFocusControl             :TWincontrol;
      btnBold                   :TToolButton;
      btnItalic                 :TToolButton;
      btnUnderline              :TToolButton;
      btnFont                   :TToolButton;
      btnSub                    :TToolButton;
      btnSup                    :TToolButton;

      btnNumList                :TToolButton;
      btnBullet                 :TToolButton;
      btnColor                  :TToolButton;

      butInsertHR               :TToolButton;
      butHiperLink              :TToolButton;

      butDecreaseIndent         :TToolButton;
      butIncreaseIndent         :TToolButton;

      btnAlignLeft              :TToolButton;
      btnCenter                 :TToolButton;
      btnAlignRight             :TToolButton;
      butPicture                :TToolButton;
      butTable                  :TToolButton;
      butFlash                  :TToolButton;
      butYouTube                :TToolButton;
      butIframe                 :TToolButton;
      butVideo                  :TToolButton;
      butShowDetail             :TToolButton;
      butIconAttach             :TToolButton;

      constructor Create (aDHTMLEdit:TDHTMLEdit;aCodeControl:TWinControl; aHTMLEditSetupIni:String);
      destructor Close;

      procedure  ReadParamFromIni;
      function   DOMInterface: IHtmlDocument2;
      function   SpecialCommand(Cmd: Cardinal; PromptUser : Boolean;
                               editModeOnly, bTriEditCommandGroup: boolean; InputArgs : OleVariant): HRESULT;
      procedure RunCommand(cmdID, cmdExecOpt, pVar: OleVariant);
      procedure SetNumberedList(const Value: Boolean);
      procedure SetBulletList(const Value: Boolean);

      procedure SetProperty(const Name: String; Value: OleVariant);
      procedure InsertTable(ACaption:String;Modify:Boolean=false);
      function  ElemIsIconClass( aElem:Olevariant ):boolean;

      function CanCopy  : Boolean;
      function CanCut   : Boolean;
      function CanPaste : Boolean;
      function CanRedo : Boolean;
      function CanUndo : Boolean;

      procedure FParseStyleIcon( IndexStyle:Integer; aPath:String  );
      procedure FPrepareStyleSheetDOOM;
      //procedure FPrepareStylePath(aPath:String);
      function CanInsertTable: Boolean;
      function CanDeleteCells: Boolean;
      function CanDeleteColumns: Boolean;
      function CanDeleteRows: Boolean;
      function CanInsertCell: Boolean;
      function CanInsertColumn: Boolean;
      function CanInsertRow: Boolean;
      function CanMergeCells: Boolean;
      function CanInsertTextBox: Boolean;
      function CanInsertTextArea: Boolean;
      function CanInsertCheckBox: Boolean;
      function CanInsertRadioButton: Boolean;
      function CanInsertDropDownBox: Boolean;
      function CanInsertListBox: Boolean;
      function CanInsertButton: Boolean;
      function CanSplitCell: Boolean;
      function CanInsertImage:Boolean;
      function CanInsertObject:Boolean;
      function CanAvailebleButtonTable:Boolean;
      function CanUpdateTable:Boolean;
      function CanInsertYoutube:Boolean;
      function CanInsertIFrame:Boolean;
      function CanInsertVideo:Boolean;
      function CanInsertLink:Boolean;

      procedure DeleteCells;
      procedure DeleteColumns;
      procedure DeleteRows;
      procedure InsertCell;
      procedure InsertColumn;
      procedure InsertRow;
      procedure MergeCells;
      procedure SplitCell;
      procedure ClearCell;

      procedure ClearTableRow( AHTMLTR : OLEVariant );
      function  IsSelText: Boolean;

      procedure SetCharset(aCharSet:String);
      procedure NewHTML;
      procedure LoadHTMLURL(FileName:String; OptLoadDoc:TTypeLoadDocBrowser=BrLoadDocNormal );
      function  DocumentHTML:Widestring;
      function  DocumentBodyHTML:Widestring;
      procedure SetBodyColor(ColorHTML:Variant);
      procedure PrintPreview;
      procedure Print;
      procedure SelectAll;
      procedure CutObj;
      procedure PasteObj;
      procedure PasteWithFilter;
      procedure CopyObj;
      procedure Undo;
      procedure Redo;
      procedure ShowFind;
      procedure DecreaseIndent;
      procedure IncreaseIndent;
      procedure InsertHR;
      procedure DeleteObj;
      procedure ObjectUpdate;
      function  ObjectSelected:Boolean;
      
      procedure SaveDocument(SaveOpt:TSaveOptBrowser = BrSaveOptAll);
      procedure SaveAsDocument(SaveOpt:TSaveOptBrowser = BrSaveOptAll);
      procedure SaveDocumentHTMLToFile(FileName:String;SaveOpt:TSaveOptBrowser = BrSaveOptAll);
      procedure PreviewInBrowser(aBrowser:TPreviewBrowser);
      function  PreviewInBrowseIsAvailable(aBrowser:TPreviewBrowser):Boolean;
      procedure FontCmbBoxPrepare(ComboBoxFont:TcxComboBox);
      procedure FontCmbBoxSetDefFont( ComboBoxFont,ComboBoxFontSize:TcxComboBox );
      procedure SelectFont;
      procedure RefreshFontSizeComboBox(ComboBoxFont:TcxComboBox);
      procedure RefreshFontNameComboBox(ComboBoxFont:TcxComboBox);
      function  GetCurrentElem(FindElemTag:String):IHTMLElement;
      function  GetCursorPositionElem:Olevariant;

      procedure InsertSub;
      procedure InsertSup;

      function  FindCurrPositionInHTMLCode:Integer;

      function  IsElem(TagElem:String): Boolean;
      procedure InsertImage(Filename : String='');
      procedure InsertIFrame(Filename : String='');
      procedure InsertYoutube(Filename : String='');
      procedure InsertVideo(Filename : String='');

      procedure InsertFlash;
      procedure InsertLink;
      procedure SetRefreshFunction(FunctReresh:TNotifyevent);
      procedure RefreshButton(Sender:TObject);
      procedure LoadWebPageFromTextHtml(aText:TStrings);
      procedure PreviewCodeHtml;
      procedure PreviewDesignerFromCodeHtml;
      procedure GotoPosBegin( WaitToComplete:Boolean =true );
      procedure InsertClassIconElem( TagName:String;ClassName:String='' );

      procedure SetSCCPath( aPath:String );
      procedure SetImagePath(aPath:String);
      procedure SetFlashObjPath(aPath:String);
      procedure SetVideoObjPath(aPath:String);
      function  SelectColor:TColor;
      procedure SetColor;
      procedure ReadStyleIconToDB( DB:TDataset; FieldBlobName, FieldCommentName, FieldTagName,
                                                CssName,ParamUrl,ParamDescript : String; Clear:boolean=True);
      //********************
      property  CmdTarget       : IOleCommandTarget read FGetCmdTarget;
      property  FileName        : Widestring read FCurrFileName write FSetCurrFileName;
      property  FontName        : String read FGetFontName write FSetFontName;
      property  FontSize        : Integer read FGetFontSize write FSetFontSize;
      property  Bold            : Boolean read FGetBold write FSetBold;
      property  BulletList      : Boolean read FGetBulletList write FSetBulletList;
      property  Italic          : Boolean read FGetItalic write FSetItalic;
      property  FontStyle       : String  read FGetFontStyle write FSetFontStyle;
      property  TextAlignment   : TAlignment read FGetTextAlignment write FSetTextAlignment;
      property  TextColor       : TColor  read FGetTextColor write FSetTextColor;
      property  NumberedList    : Boolean read FGetNumberedList write FSetNumberedList;
      property  Underline       : Boolean read FGetUnderline write FSetUnderline;
      property  Sub             : Boolean read FGetSub;
      property  Sup             : Boolean read FGetSup;
      property  ShowDtailTag    : Boolean read FGetShowDetailTag write FSetShowDetailTag;
      property  HTMLCodeEditor  : THTMLCodeEditor read FHTMLCodeEditor;
      property  DOMIsChanged    : boolean read FDocChange write FDocChange;
      property  IconCssValue    : TValueCSSFileArr read FParamCSS.IConCSS;//FIconCssValue ;
      property  IconCssTagElem  : String  read FParamCSS.IconElemTag;
      //********************
      property  DHTMLEdit       : TDHTMLEdit read FDHTMLEdit;
    end;

    function FindChildElem(ElemParent:OleVariant;TagName:String):OleVariant;

implementation
uses IeConst,EditPicture,SetFrame;
{ TWebHtmlEditor }

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1
end;
//******************************************************************************
function FindChildElem(ElemParent:OleVariant;TagName:String):OleVariant;
var i:integer;
begin
  result:=null;
  for i:=0 to ElemParent.all.length-1 do
  begin
    if CompareText( ElemParent.all.item(i).tagName, TagName ) = 0 then
    begin
      result:= ElemParent.all.item(i);
      Break;
    end;
  end;
end;
//******************************************************************************
constructor TWebHtmlEditor.Create(aDHTMLEdit: TDHTMLEdit; aCodeControl:TWinControl; aHTMLEditSetupIni:String );
begin
  self.FDHTMLEdit := aDHTMLEdit;
  FFunctRefresh:=nil;

  FHTMLTableResize:=THTMLTableResize.Create(aDHTMLEdit);
  FCurrCharSet:='utf-8';//'windows-1251';

  FHTMLCodeEditor:= THTMLCodeEditor.Create( aCodeControl, TForm(aCodeControl.Owner).Font.Size );
  FHTMLCodeEditor.CodeEditor.OnChange := FOnChangeHTMLCodeEditor;

  self.FTitleHTMLEditor := TForm(aDHTMLEdit.Owner).Caption;
  FPersonalHTMLEditonDblClick := self.FDHTMLEdit.Onondblclick;
  FPersonalHTMLEditonClick := self.FDHTMLEdit.Ononclick;
  FPersonalHTMLEditonKeyUp := self.FDHTMLEdit.Ononkeyup;
  FPersonalHTMLEditonOnComplete := self.FDHTMLEdit.OnDocumentComplete;

  self.FDHTMLEdit.Onondblclick := self.FHTMLEditondblclick;
  self.FDHTMLEdit.Ononclick := self.FDhtmlOnClick;
  self.FDHTMLEdit.Ononkeyup :=self.FDhtmlOnKeyUp;
  self.FDHTMLEdit.OnDocumentComplete :=self.FDHTMLDocumentComplete;

  FFocusControl:=aDHTMLEdit;
  FDocComplete:=False;
  FNewDoc := False;


  FHTMLEditSetupIni := aHTMLEditSetupIni;
  ReadParamFromIni;

end;
//******************************************************************************
destructor TWebHtmlEditor.Close;
begin
  FHTMLCodeEditor.Close;
  FHTMLTableResize.Close;
end;
//******************************************************************************
procedure TWebHtmlEditor.ReadParamFromIni;
begin
  self.SetImagePath( ReadIniFile( self.FHTMLEditSetupIni,'PATHToMedia','images' ) );
  self.SetFlashObjPath( ReadIniFile( self.FHTMLEditSetupIni,'PATHToMedia','flash' ) );
  self.SetVideoObjPath( ReadIniFile( self.FHTMLEditSetupIni,'PATHToMedia','video' ) );
  
  FReadCssParam;
end;
//******************************************************************************
procedure TWebHtmlEditor.FReadCssParam;
var i:Integer;
    ParamDef:string;
    len:Integer;
begin
 FParamCss.Path := ReadIniFile( self.FHTMLEditSetupIni, 'CSS', 'path' );
 FParamCss.PathPreview := ReadIniFile( self.FHTMLEditSetupIni, 'CSS', 'PathPreview' );
 FParamCss.IconElemTag := ReadIniFile( self.FHTMLEditSetupIni, 'CSS', 'IconTag' );
 i:=1;

 while (ParamDef<>'') or (i=1) do
 begin
   ParamDef := ReadIniFile( self.FHTMLEditSetupIni,'CSS', 'def'+IntToStr(i) );
   if ParamDef<>'' then
   begin
     len := Length( FParamCss.DefIncludeCss );
     SetLength( FParamCss.DefIncludeCss, len + 1 );
     FParamCss.DefIncludeCss[len] := ParamDef;
   end;
   Inc(i);
 end;
end;
//******************************************************************************
function TWebHtmlEditor.FGetCmdTarget: IOleCommandTarget;
begin
  if self.FDHTMLEdit.DOM= nil then result := nil
  else
    result := self.FDHTMLEdit.DOM as IOleCommandTarget;
end;
//******************************************************************************
function TWebHtmlEditor.FDOMInterface: IHtmlDocument2;
begin
  Result := FDHTMLEdit.DOM as IHtmlDocument2;
end;
//******************************************************************************
function TWebHtmlEditor.FCommandTarget: IOleCommandTarget;
begin
  Result := FDOMInterface as IOleCommandTarget;
end;
//******************************************************************************
function TWebHtmlEditor.FHrExecCommand(ucmdID: cardinal;
  const pVarIn: OleVariant; var pVarOut: OleVariant; bPromptUser,
  bTriEditCmdGroup: boolean): HResult;
var dwCmdOpt : DWORD;
begin
   result := S_OK;

   if (bPromptUser) then
     dwCmdOpt := MSOCMDEXECOPT_PROMPTUSER
   else
     dwCmdOpt := MSOCMDEXECOPT_DONTPROMPTUSER;

   if (bTriEditCmdGroup) then begin
     result := FCommandTarget.Exec(@GUID_TriEditCommandGroup,
							ucmdID,
							dwCmdOpt,
							pVarIn,
							pVarOut);
   end
   else begin
      result := FCommandTarget.Exec(@CMDSETID_Forms3,
							ucmdID,
							dwCmdOpt,
							pVarIn,
							pVarOut);
   end;

   self.FDocChange:=True;
end;
//******************************************************************************
function TWebHtmlEditor.SpecialCommand(Cmd: Cardinal; PromptUser : Boolean;
                                  editModeOnly, bTriEditCommandGroup: boolean;
                                  InputArgs : OleVariant): HRESULT;
begin
  result := FHrExecCommand(Cmd, FNilVariant, InputArgs, promptUser, bTriEditCommandGroup);
  RefreshButton(self);
end;
//******************************************************************************
procedure TWebHtmlEditor.SetNumberedList(const Value: Boolean);
begin
  FSetNumberedList( Value );
end;
//******************************************************************************
procedure TWebHtmlEditor.SetBulletList(const Value: Boolean);
begin
  FSetBulletList( Value );
end;
//******************************************************************************
procedure TWebHtmlEditor.FInsertTextLink;
var x:OLEVariant;
    CurrTagName:String;
    currElem:OleVariant;
    LinkProperty:THyperLinkProperty;
    isNew:Boolean;
    TextHref:String;
    ToolTip:WideString;
begin
  isNew:=True;
  if self.FDHTMLEdit.DOM.selection.type_<> 'Control' then
  begin
    currElem := self.FDHTMLEdit.DOM.selection.createRange;
    CurrTagName := currElem.parentElement.tagName;
    TextHref := currElem.parentElement.innerText;

    if ( CompareText( CurrTagName , 'a') = 0 ) then
    begin
      LinkProperty.url := currElem.parentElement.getAttribute('href',x);
      LinkProperty.Text := TextHref;
      LinkProperty.ToolTip := currElem.parentElement.getAttribute('title',x);
      LinkProperty.Target  := currElem.parentElement.getAttribute('target',x);
      isNew:=false;
    end
    else LinkProperty.Text := TextHref;

    if ShowInsertHyperLink( LinkProperty ) then
    begin

      if isNew then currElem.pasteHTML ( FPrepareLinkHtml(  LinkProperty ) )
      else currElem.parentElement.outerHTML := FPrepareLinkHtml(  LinkProperty );

      self.FDocChange:=True;
    end;
  end;
end;
//******************************************************************************
function TWebHtmlEditor.FPrepareLinkHtml( LinkProperty:THyperLinkProperty ):string;
var ToolTip:WideString;
    Target:Widestring;
begin
  if LinkProperty.ToolTip <> '' then
    ToolTip:= 'title="' + LinkProperty.ToolTip+'"'
  else ToolTip:='';

  if LinkProperty.Target<>'' then Target := ' target="'+LinkProperty.Target+'"'
  else Target :='';

  result:= '<a href="' + LinkProperty.Url +'" '+ToolTip+Target + '> ' + LinkProperty.Text + '</a>'
end;

procedure TWebHtmlEditor.FInsertControlLink;
var x:OLEVariant;
    CurrTagName:String;
    CurrParentTagName:String;
    currElem:OleVariant;
    LinkProperty:THyperLinkProperty;
    isNew:Boolean;
    TextHref:String;

begin
  isNew:=True;
  if self.FDHTMLEdit.DOM.selection.type_= 'Control' then
  begin
    currElem := self.FDHTMLEdit.DOM.selection.createRange;
    CurrTagName := currElem.commonParentElement.tagName;
    CurrParentTagName := currElem.commonParentElement.parentElement.tagName;
    TextHref := currElem.commonParentElement.outerHTML;
    //*******************************************
    if (CompareText( CurrTagName , 'a') = 0) or (CompareText( CurrParentTagName , 'a') = 0) then
    begin
      LinkProperty.url := currElem.commonParentElement.parentElement.getAttribute('href',x);
      LinkProperty.Text := TextHref;
      LinkProperty.ToolTip := currElem.commonParentElement.parentElement.getAttribute('title',x);
      LinkProperty.Target  := currElem.commonParentElement.parentElement.getAttribute('target',x);
      isNew:=false;
    end
    else
      LinkProperty.Text := TextHref;
    //*******************************************
    if ShowInsertHyperLink( LinkProperty ) then
    begin

      if isNew then
        currElem.commonParentElement.outerHTML:= FPrepareLinkHtml(  LinkProperty )
      else currElem.commonParentElement.parentElement.outerHTML:= FPrepareLinkHtml(  LinkProperty );

      self.FDocChange:=True;      
    end;
    //******************************************* 
  end;
end;
//******************************************************************************
procedure TWebHtmlEditor.InsertLink;
begin
  if self.FDHTMLEdit.DOM.selection.type_<> 'Control' then
    FInsertTextLink
  else
    FInsertControlLink;
end;
//******************************************************************************
function TWebHtmlEditor.DOMInterface: IHtmlDocument2;
begin
  if Assigned(self.FDHTMLEdit.DOM) then
    Result := self.FDHTMLEdit.DOM as IHtmlDocument2
  else Result:=nil;
end;
//******************************************************************************
procedure TWebHtmlEditor.SetProperty(const Name: String; Value: OleVariant);
var V: OleVariant;
    S: OleVariant;
begin
  if not self.FDocComplete then Exit;

  V := self.DOMInterface.selection.createRange;
  S := Value;
  V.execCommand(Name , False, S);

  self.FDocChange:=True;
  RefreshButton(self);
end;
//******************************************************************************
procedure TWebHtmlEditor.FSetTextAlignment(const Value: TAlignment);
begin
  case Value of
    taLeftJustify : SetProperty('JustifyLeft', True);
    taCenter : SetProperty('JustifyCenter', True);
    taRightJustify : SetProperty('JustifyRight', True);
  end;
end;
//******************************************************************************
function TWebHtmlEditor.FGetTextAlignment: TAlignment;
var SelElem:Olevariant;
    AttAlign:String;
begin
  SelElem := GetCursorPositionElem;
  if SelElem.TagName = 'TABLE' then AttAlign:=SelElem.getAttribute('align')
  else
    AttAlign:='';

  if AttAlign = '' then
  begin
    if FGetProperty('JustifyRight') then
      Result := taRightJustify
    else
    if FGetProperty('JustifyCenter') then
      Result := taCenter
    else
      Result := taLeftJustify;
  end
  else
  begin
    if AttAlign = 'left' then  Result := taLeftJustify;
    if AttAlign = 'right' then  Result := taRightJustify;
    if AttAlign = 'center' then  Result := taCenter;
  end;
end;
//******************************************************************************
procedure TWebHtmlEditor.FSetCurrFileName(aFileName:Widestring);
begin
  FCurrFileName := aFileName;
  TForm(self.FDHTMLEdit.Owner).Caption := FTitleHTMLEditor+' ( '+ ExtractFileName(aFileName)+' )';
end;
//******************************************************************************
procedure TWebHtmlEditor.LoadHTMLURL( FileName:String; OptLoadDoc:TTypeLoadDocBrowser=BrLoadDocNormal );       
var HtmlStr:TStringList;
    FileNameOle:Olevariant;
begin
  self.FDocComplete := false;

  try
    HtmlStr:=TStringList.Create;
    HtmlStr.LoadFromFile( FileName );
    FileNameOle := FileName;
    if AnsiPos( '<HTML>', HtmlStr.Text ) <> 0 then
      self.FDHTMLEdit.LoadDocument( FileNameOle )
    else
    begin
      self.FDHTMLEdit.DocumentHTML := HtmlStr.Text;
    end;

    if OptLoadDoc = BrLoadDocNormal then
      FSetCurrFileName(FileName);
      
    FOptLoadDoc  := OptLoadDoc;
  finally
   HtmlStr.Free;
  end;

  self.RefreshButton(self);
  GotoPosBegin(false);
end;
//******************************************************************************
procedure TWebHtmlEditor.SetCharset( aCharSet:String );
begin
  if not FDocComplete then Exit;

  FCurrCharSet := aCharSet;
  self.FDHTMLEdit.DOM.defaultCharset := FCurrCharSet;
end;
//******************************************************************************
procedure TWebHtmlEditor.FRepareNewHTML;
var i:Integer;
    ElementBody:OleVariant;
    ElemsDiv:OleVariant;
    CurrElem:OleVariant;
begin
  while FDHTMLEdit.DOM.readyState <> 'complete' do Application.ProcessMessages;
  ElementBody := self.FDHTMLEdit.DOM.body;
  ElemsDiv := ElementBody.All;

  while ElemsDiv.length <> 0 do
  begin
    CurrElem := ElemsDiv.item(0);
    CurrElem := CurrElem.parentNode.removeChild(CurrElem);
  end;
  
  SetCharset(FCurrCharSet);
  FPrepareStyleSheetDOOM;
  FprepareDelTemplateGarbage;
end;
//******************************************************************************
procedure TWebHtmlEditor.NewHTML;
begin
  self.FDocComplete:=false;
  self.FDocChange:=false;
  self.FNewDoc := True;
  self.FDHTMLEdit.NewDocument;
end;
//******************************************************************************
function TWebHtmlEditor.DocumentHTML:Widestring;
var ElemAll:OleVariant;
begin
  ElemAll := self.FDHTMLEdit.DOM;
  ElemAll := ElemAll.documentElement;
  result  := ElemAll.outerHTML;
end;
//******************************************************************************
function TWebHtmlEditor.FClearTeftFromGarbage(aText:widestring):Widestring;
begin
  ReplaseOn(aText,#$D#$A,'');
  ReplaseOn(aText,#13#10,'');
  ReplaseOn(aText,#13,'');
  result := aText;
end;
//******************************************************************************
function TWebHtmlEditor.DocumentBodyHTML:Widestring;
begin
  result := self.FDHTMLEdit.DOM.body.innerHTML;
end;
//******************************************************************************
procedure TWebHtmlEditor.SetBodyColor(ColorHTML:Variant);
begin
  self.FDHTMLEdit.OLEOBJECT.DOM.body.bgcolor := ColorHTML;
end;
//******************************************************************************
procedure TWebHtmlEditor.PrintPreview;
const CGID_MSHTML: TGUID = '{DE4BA900-59CA-11CF-9592-444553540000}';
var p,pInVar, pOutVar:OleVariant;
begin
  CmdTarget.Exec( @CGID_MSHTML, IDM_PRINTPREVIEW, OLECMDEXECOPT_DONTPROMPTUSER, pInVar, pOutVar );
end;
//******************************************************************************
procedure TWebHtmlEditor.Print;
const CGID_MSHTML: TGUID = '{DE4BA900-59CA-11CF-9592-444553540000}';
var p,pInVar, pOutVar:OleVariant;
begin
  CmdTarget.Exec(@CGID_MSHTML, IDM_PRINT, OLECMDEXECOPT_DONTPROMPTUSER, pInVar, pOutVar);
end;
//******************************************************************************
procedure TWebHtmlEditor.SelectAll;
begin
  self.FFocusControl.SetFocus;
  PostKeyEx32(Ord('A'), [ssctrl], False);
  //SpecialCommand(IDM_SELECTALL, False, True, False, FNilVariant);
end;
//******************************************************************************
procedure TWebHtmlEditor.CutObj;
begin
  self.FFocusControl.SetFocus;
  PostKeyEx32(Ord('X'), [ssctrl], False);
  
  self.FDocChange := True;
  //RunCommand(DECMD_CUT, OLECMDEXECOPT_DODEFAULT, Null);
end;
//******************************************************************************
procedure TWebHtmlEditor.PasteObj;
begin
  self.FFocusControl.SetFocus;
  PostKeyEx32(Ord('V'), [ssctrl], False);

  self.FDocChange := True;
  //RunCommand(DECMD_PASTE, OLECMDEXECOPT_DODEFAULT, Null);
end;
//******************************************************************************
procedure TWebHtmlEditor.PasteWithFilter;
var MemoEdit:TMemo;
    ReplaseText:Widestring;
begin
  MemoEdit:=TMemo.Create(self.FDHTMLEdit.Owner);
  try
    MemoEdit.Text :='';
    MemoEdit.Parent := self.FDHTMLEdit.Parent;
    MemoEdit.PasteFromClipboard;
    ClipBoard.Clear;
    MemoEdit.Text := FClearTeftFromGarbage( MemoEdit.Text );

    MemoEdit.SelectAll;
    MemoEdit.CopyToClipboard;

    MemoEdit.Clear;
    PostKeyEx32( Ord('V'), [ssctrl], False );

    self.FDocChange := True;
  finally
    MemoEdit.Free;
  end;
  FDocChange:=True;
  self.RefreshButton(self);
end;
//******************************************************************************
procedure TWebHtmlEditor.CopyObj;
begin
  self.FFocusControl.SetFocus;
  PostKeyEx32(Ord('C'), [ssctrl], False);
  //RunCommand(DECMD_COPY, OLECMDEXECOPT_DODEFAULT, Null);
end;
//******************************************************************************
function TWebHtmlEditor.FQueryStatus(cmdID: OleVariant): OleVariant;
begin
  try
    Result := self.FDHTMLEdit.QueryStatus(cmdID);
  except
    result:=False;
  end;
end;
//******************************************************************************
procedure TWebHtmlEditor.RunCommand(cmdID, cmdExecOpt, pVar: OleVariant);
begin
  self.FDHTMLEdit.ExecCommand(cmdID, cmdExecOpt, pVar);
end;
//******************************************************************************
procedure TWebHtmlEditor.Undo;
begin
  if self.FFocusControl= nil then exit;
  self.FFocusControl.SetFocus;

  PostKeyEx32( Ord('Z'), [ssctrl], False );
  self.FDocChange := True;
  //SpecialCommand( IDM_Undo, false, true, false, FNilVariant);
end;
//******************************************************************************
procedure TWebHtmlEditor.Redo;
begin
  SpecialCommand( IDM_ReDo, false, true, false, FNilVariant);
end;
//******************************************************************************
procedure TWebHtmlEditor.ShowFind;
begin
  self.FFocusControl.SetFocus;
  PostKeyEx32(Ord('F'), [ssctrl], False);
end;
//******************************************************************************
procedure TWebHtmlEditor.DecreaseIndent;
begin
  SpecialCommand(IDM_OUTDENT, false, true, false, FNilVariant);
end;
//******************************************************************************
procedure TWebHtmlEditor.IncreaseIndent;
begin
  SpecialCommand( IDM_INDENT, false, true, false, FNilVariant );
end;
//******************************************************************************
procedure TWebHtmlEditor.DeleteObj;
begin
  RunCommand( DECMD_DELETE, OLECMDEXECOPT_DODEFAULT, Null );
end;
//******************************************************************************
function TWebHtmlEditor.FGetProperty(const Name: String): OLEVariant;
var
  V: OleVariant;
begin
  if not FDocComplete then exit;

  if DOMInterface<>nil then
  begin
    V := DOMInterface.selection.createRange;
    if not VarIsEmpty( V ) then
      Result := V.queryCommandValue(Name);
  end;
end;
//******************************************************************************
procedure TWebHtmlEditor.FSetProperty(const Name: String; Value: OleVariant);
var V: OleVariant;
    S: OleVariant;
begin
  if not FDocComplete then exit;

  V := DOMInterface.selection.createRange;
  S := Value;
  V.execCommand(Name , False, S);

  self.FDocChange := True;
  RefreshButton(self);
end;
//******************************************************************************
function TWebHtmlEditor.FGetFontName: String;
var aName:Variant;
begin
  aName:=FGetProperty('FontName');
  if aName<>null then Result := FGetProperty('FontName');
end;
//******************************************************************************
procedure TWebHtmlEditor.FSetFontName(const Value: String);
begin
  SetProperty('FontName', Value);
end;
//******************************************************************************
function TWebHtmlEditor.FGetFontSize: Integer;
var aSize:Variant;
begin
  aSize:=FGetProperty('FontSize');
  if asize<>null then Result :=aSize
   else result:=0;
end;
//******************************************************************************
procedure TWebHtmlEditor.FSetFontSize(const Value: Integer);
begin
  SetProperty('FontSize', Value);
end;
//******************************************************************************
function TWebHtmlEditor.FGetBold: Boolean;
begin
  Result := FGetProperty('Bold');
end;
//******************************************************************************
procedure TWebHtmlEditor.FSetBold(const Value: Boolean);
begin
  FSetProperty('Bold',Value);
end;
//******************************************************************************
function TWebHtmlEditor.FGetItalic: Boolean;
begin
  Result := FGetProperty('Italic');
end;
//******************************************************************************
procedure TWebHtmlEditor.FSetItalic(const Value: Boolean);
begin
  FSetProperty('Italic', Value);
end;
//******************************************************************************
function TWebHtmlEditor.FGetUnderline: Boolean;
begin
  Result := FGetProperty('Underline');
end;
//******************************************************************************
procedure TWebHtmlEditor.FSetUnderline(const Value: Boolean);
begin
  FSetProperty('Underline', Value);
end;
//******************************************************************************
procedure TWebHtmlEditor.FSetTextColor(const Value: TColor);
begin
  FSetProperty('ForeColor', Value);
end;
//******************************************************************************
function TWebHtmlEditor.FGetTextColor: TColor;
begin
  Result := FGetProperty('ForeColor');
end;
//******************************************************************************
function TWebHtmlEditor.FGetSub:Boolean;
var bEnabled,
    bChecked : Boolean;
begin
  FGetSpecialCommandState(IDM_SUBSCRIPT , false, bEnabled, bChecked);
  Result := bEnabled and bChecked;
end;
//******************************************************************************
function TWebHtmlEditor.FGetSup:Boolean;
var bEnabled, bChecked : Boolean;
begin
  FGetSpecialCommandState(IDM_SUPERSCRIPT , false, bEnabled, bChecked);
  Result := bEnabled and bChecked;
end;
//******************************************************************************
function TWebHtmlEditor.FGetCommandStatus(ucmdID: Cardinal; bTriEditCmdGroup: boolean): DWORD;
var FMsoCmd : TOleCmd;
begin
  result := 0;
  if FCommandTarget = nil then Exit;

  FMsoCmd.CmdID := ucmdID;
  FMsoCmd.cmdf := 0;

  if (bTriEditCmdGroup) then
    FCommandTarget.QueryStatus(@GUID_TriEditCommandGroup, 1, @FMsoCmd, nil)
  else
    FCommandTarget.QueryStatus(@CMDSETID_Forms3, 1, @FMsoCmd, nil);

  result := FMsoCmd.cmdf;
end;
//******************************************************************************
function TWebHtmlEditor.FGetFontStyle: String;
var StyleNameStatus : DWord;
    vo              : OleVariant;
begin

  Result := '';
  StyleNameStatus := FGetCommandStatus( IDM_BLOCKFMT, False );
  if ((StyleNameStatus and OleCmdf_Enabled) <> 0) then
  begin
    TVariantArg(vo).vt := vt_bstr;
    TVariantArg(vo).bStrVal := nil;
    FHrExecCommand(IDM_BLOCKFMT, FNilVariant, vo, false, false);

    if (VarType(vo) = VarOleStr) then Result := vo;
  end;

end;
//******************************************************************************
procedure TWebHtmlEditor.FSetFontStyle(const Value: String);
var vi, vo : OleVariant;
begin
  vi := Value;
  FHrExecCommand(IDM_BLOCKFMT, vi, vo, false, false);
  RefreshButton(self);
end;
//******************************************************************************
procedure TWebHtmlEditor.FGetSpecialCommandState(cmdID: Cardinal;
  bTrieditCommandGroup: boolean; var bEnabled, bChecked: boolean);
var dwStatus : DWORD;
begin
  dwStatus := FGetCommandStatus(cmdID, bTriEditCommandGroup);
  bEnabled := ((dwStatus and OLECMDF_ENABLED) <> 0);
  bChecked := ((dwStatus and OLECMDF_LATCHED) <> 0);
end;
//******************************************************************************
function TWebHtmlEditor.FGetBulletList: Boolean;
var bEnabled,
    bChecked : Boolean;
begin
  FGetSpecialCommandState(IDM_UNORDERLIST, false, bEnabled, bChecked);
  Result := bEnabled and bChecked;
end;
//******************************************************************************
procedure TWebHtmlEditor.FSetBulletList(const Value: Boolean);
begin
  SpecialCommand(IDM_UNORDERLIST, false, true, false, FNilVariant);
  RefreshButton(self);
end;
//******************************************************************************
function TWebHtmlEditor.FGetNumberedList: Boolean;
var bEnabled, bChecked : Boolean;
begin
  FGetSpecialCommandState( IDM_ORDERLIST, false, bEnabled, bChecked );
  Result := bEnabled and bChecked;
end;
//******************************************************************************
procedure TWebHtmlEditor.FSetNumberedList(const Value: Boolean);
begin
  SpecialCommand(IDM_ORDERLIST, false, true, false, FNilVariant);
  RefreshButton(self);
end;
//******************************************************************************
procedure TWebHtmlEditor.InsertHR;
begin
  SpecialCommand(IDM_HORIZONTALLINE, True, True, False, FNilVariant);
end;
//******************************************************************************
function TWebHtmlEditor.FPrepareSrcElemAndGetNewParamSrc(SrcValue,PathToSave,PathSaveObj:WideString;ShowFullPath:Boolean;CopyToPreview:Boolean=true):String;
var value:Variant;
    CurrJustFileName:Widestring;
    OriginalSrcValue:Widestring;
begin
  if SrcValue = '' then exit;

  OriginalSrcValue:= SrcValue;

  ReplaseOn(SrcValue,'about:','');
  ReplaseOn(SrcValue,'%20',' ');
  ReplaseOn(SrcValue,'file:///','');
  ReplaseOn(SrcValue,'file://','');
  ReplaseOn(SrcValue,'/','\');
  
  if (Char(SrcValue[1]) in['\','/'] ) then Delete(SrcValue,1,1);
  CurrJustFileName:= ExtractFileName(SrcValue);

  if ( FileExists(SrcValue) and ( not ShowFullPath) ) then
  begin
    if (CompareText(SrcValue,PathToSave + CurrJustFileName)<>0)and(CopyToPreview) then
      MyCopyFile( SrcValue , PathToSave + CurrJustFileName );

    result := PathSaveObj + CurrJustFileName;
  end
  else
     result:= OriginalSrcValue;

  if ShowFullPath then
  begin
    if FileExists( (PathToSave) + ExtractFileName(SrcValue) ) then
      result := (PathToSave) + ExtractFileName(SrcValue)
    else  result:= OriginalSrcValue;
  end;
end;
//******************************************************************************
procedure TWebHtmlEditor.FPrepareElementCollections( Elements:OleVariant; TagName, TagChildEleme, FileAttribute:String; PathTosave, PathSaveObj:WideString; ShowFullPath:Boolean; CopyToPreview:boolean=True );
var i,j:integer;
    CurrJustFileName:WideString;
    ElementsChild:OleVariant;
    Str:WideString;
    NewParamSrc:String;
    NewOutherHTML: WideString;
    CommonPartPaths :WideString;
//******************************************************************************
procedure PrepareCurrElement(aElement:OleVariant;SetNewAttrib:Boolean=true);
var value:Variant;
    NewParamSrc:Olevariant;
begin
  value:= aElement.getAttribute(FileAttribute);
  if (value = null)or(value = '') then exit;

  NewParamSrc := FPrepareSrcElemAndGetNewParamSrc( value, PathTosave, PathSaveObj, ShowFullPath, CopyToPreview );
  if SetNewAttrib then aElement.setAttribute( FileAttribute, NewParamSrc  );
end;
//******************************************************************************
begin
  CommonPartPaths := GetCommonPartFromPaths( PathTosave, PathSaveObj );
  Elements := Elements.getElementsByTagName( TagName );
  if CommonPartPaths = '' then
  begin
    PathToSave := CheckLastSleshOnPath(PathTosave,true) + PathSaveObj;

  end
  else
  begin
    PathToSave := PathSaveObj;
    
    if not ShowFullPath then
      ReplaseOn( PathSaveObj, CommonPartPaths,'');
  end;
  //*******************************************
  for i:=0 to Elements.length-1 do
  begin
    ElementsChild:=Elements.item(i);
    PrepareCurrElement(ElementsChild);

    if TagChildEleme <> '' then
    begin
      if ElementsChild.all.length <> 0 then
      begin
        for j:=0 to ElementsChild.all.length-1 do
          if CompareText( ElementsChild.all.item(j).tagName , TagChildEleme ) = 0 then
            PrepareCurrElement( ElementsChild.all.item(j) );
      end
       else
       begin
         NewOutherHTML:= ElementsChild.outerHTML;
         Str := UnitProc.ReadParam( NewOutherHTML, 'src' );
         NewParamSrc:= FPrepareSrcElemAndGetNewParamSrc( Str, PathTosave, PathSaveObj, ShowFullPath );
         ReplaseON(NewOutherHTML,Str,NewParamSrc);

         ElementsChild.outerHTML:= NewOutherHTML;
       end;
    end;
  end;
end;
//******************************************************************************
Function TWebHtmlEditor.FGetSavePathCSS(SaveOpt:TSaveOptBrowser):Widestring;
begin
  if SaveOpt = BrSaveOptPreview then result :=self.FParamCSS.PathPreview
  else result := self.FParamCSS.Path;
end;
//******************************************************************************
Function TWebHtmlEditor.FGetSavePathImage(SaveOpt:TSaveOptBrowser):Widestring;
begin
  if SaveOpt = BrSaveOptPreview then result :='IMAGES\'
  else result := self.FPathImage;
end;
//******************************************************************************
Function TWebHtmlEditor.FGetSavePathFlash(SaveOpt:TSaveOptBrowser):Widestring;
begin
  if SaveOpt = BrSaveOptPreview then result :='IMAGES\'
  else result := self.FPathFlashObj;
end;
//******************************************************************************
Function TWebHtmlEditor.FGetSavePathVideo(SaveOpt:TSaveOptBrowser):Widestring;
begin
  if SaveOpt = BrSaveOptPreview then result :='VIDEOS\'
  else result := self.FPathVideoObj;
end;
//******************************************************************************
Function TWebHtmlEditor.FPrepareHTMLDocForPathPreview(aDOOM:IHTMLDocument2;PathToave:String; TypeSave: TTypeSaveOrLoad;
                                                      SaveOpt:TSaveOptBrowser = BrSaveOptAll ):String;
var ShowFullPath:Boolean;
begin

  if TypeSave = BrOptIsSave then ShowFullPath:=false;
  if TypeSave = BrOptIsLoad then ShowFullPath:=true;

  if TypeSave = BrOptIsSave then
    FPrepareElementCollections( aDOOM, 'LINK','','href', PathToave, FGetSavePathCSS(SaveOpt), ShowFullPath, false );

  FPrepareElementCollections( aDOOM, 'IMG','','src', PathToave, FGetSavePathImage(SaveOpt), ShowFullPath );
  FPrepareElementCollections( aDOOM, 'TABLE','TD','background', PathToave, FGetSavePathImage(SaveOpt), ShowFullPath );
  FPrepareElementCollections( aDOOM, 'OBJECT','','data', PathToave, FGetSavePathFlash(SaveOpt), ShowFullPath );
  FPrepareElementCollections( aDOOM, 'OBJECT','VIDEO','src', PathToave, FGetSavePathVideo(SaveOpt), ShowFullPath );

end;
//******************************************************************************
procedure TWebHtmlEditor.SaveDocumentHTMLToFile( FileName:String; SaveOpt:TSaveOptBrowser = BrSaveOptAll );
var PathFile:string;
    ExtFile:string;
    AtmpBrowseHTML:TStringList;
    SaveHtml:TStringList;
begin

  PathFile := ExtractFilePath(FileName);
  ExtFile  := ExtractFileExt( FileName );
  if ExtFile='' then FileName:=FileName + '.html'
  else ChangeFileExt( FileName, '.html');
  //************************************
  try
    AtmpBrowseHTML := TStringList.Create;
    SaveHtml := TStringList.Create;
    SaveHtml.Text := self.DocumentHTML;
    FPrepareHTMLDocForPathPreview( self.FDOMInterface, PathFile , BrOptIsSave, SaveOpt  );

    if SaveOpt in [BrSaveOptAll,BrSaveOptPreview] then AtmpBrowseHTML.Text := self.DocumentHTML;
    if SaveOpt = BrSaveOptContent then AtmpBrowseHTML.Text := self.DocumentBodyHTML;

    AtmpBrowseHTML.SaveToFile( FileName );
    self.LoadWebPageFromTextHtml( SaveHtml );

    if SaveOpt <> BrSaveOptPreview then
    begin
      if self.FOptLoadDoc <> BrLoadDocByParam then FSetCurrFileName(FileName);
      self.FDocChange := false;
    end;

  finally
    SaveHtml.Free;
    AtmpBrowseHTML.Free;
  end;
  //************************************
end;
//******************************************************************************
function TWebHtmlEditor.FGetCSSParambyNameForIndex(Index:Integer;ParamName:String):widestring;
var i:integer;
begin
  for i:=0 to Length( self.IconCssValue[Index].Param )-1 do
    if CompareText( self.IconCssValue[Index].Param[i].ParamName, ParamName )=0 then
    begin
      result := self.IconCssValue[Index].Param[i].ParamValue;
      break;
    end;
end;
//******************************************************************************
procedure TWebHtmlEditor.ReadStyleIconToDB( DB:TDataset; FieldBlobName,
                                            FieldCommentName, FieldTagName, CssName, ParamUrl, ParamDescript : String; Clear:boolean=True );
var i : integer;
begin
  if not DB.active then DB.open;
  if Clear then while not DB.eof do DB.Delete;

  for i:=0 to Length( self.IconCssValue )-1 do
  begin
    DB.Append;
    DBAddBlobFileData( DB, FieldBlobName, ExtractFilePath(Application.ExeName) +
                       CheckLastSleshOnPath( FParamCss.Path,true)+ FGetCSSParambyNameForIndex( i,ParamUrl ) );
    DB.FieldByName(FieldCommentName).AsString := FGetCSSParambyNameForIndex( i,ParamDescript );
    DB.FieldByName(FieldTagName).AsString := self.IconCssValue[i].ClassName;

    DB.Post;
  end;

end;
//******************************************************************************
procedure TWebHtmlEditor.FParseStyleIcon( IndexStyle:Integer; aPath:String );
var i:integer;
    aListCss:TStringList;
    PosPoint:Integer;
    PosStartD:integer;
    PosDualPoint:integer;
    LenStrLine:Integer;
    CurrClassName:WideString;
    CurrParamName:WideString;
    CurrParamValue:WideString;
//***********************************************
procedure AddStyle( aCurrClassName, aCurrParamName, aCurrParamValue:WideString );
var i:integer;
    CurrParamIndex:Integer;
    len:integer;
    lenParam:Integer;
begin
  CurrParamIndex := -1;
  aCurrClassName := Trim(aCurrClassName);
  aCurrParamName := Trim( aCurrParamName );
  aCurrParamValue:= Trim( aCurrParamValue );
  if CompareText( Copy( aCurrParamValue , 1, 3 ),'url' )=0 then
    Delete( aCurrParamValue,1,3);
  //********************************
  ReplaseOn( aCurrParamValue,';','' );
  ReplaseON( aCurrParamValue,'(','' );
  ReplaseON( aCurrParamValue,')','' );
  ReplaseON( aCurrParamValue,#39,'' );
  ReplaseON( aCurrParamValue,'"','' );
  ReplaseON( aCurrParamValue,'no-repeat','' );
  ReplaseON( aCurrParamValue,'repeat','' );
  aCurrParamValue:=Trim(aCurrParamValue);
  //********************************
  for i:=0 to Length( self.FParamCSS.IConCSS )-1 do
  if self.FParamCSS.IConCSS[i].ClassName = aCurrClassName then
  begin
    CurrParamIndex := i;
    break;
  end;
  //********************
  len := Length( self.FParamCSS.IConCSS );
  if CurrParamIndex = -1 then
  begin
    SetLength( self.FParamCSS.IConCSS ,len+1 );
    CurrParamIndex := len;
  end;
  //********************
  lenParam := Length ( self.FParamCSS.IConCSS[CurrParamIndex].Param );
  SetLength(self.FParamCSS.IConCSS[CurrParamIndex].Param,lenParam+1);

  self.FParamCSS.IConCSS[CurrParamIndex].ClassName := aCurrClassName;
  self.FParamCSS.IConCSS[CurrParamIndex].Param[lenParam].ParamName :=  aCurrParamName;
  self.FParamCSS.IConCSS[CurrParamIndex].Param[lenParam].ParamValue := Utf8Decode(aCurrParamValue);
end;
//***********************************************
begin
  aListCss := TStringList.Create;
  aListCss.LoadFromFile( aPath );

  for i:=0 to aListCss.Count-1 do
  begin
    PosPoint :=AnsiPos('.', aListCss.Strings[i] );
    PosStartD := AnsiPos('{', aListCss.Strings[i] );
    PosDualPoint := AnsiPos(':', aListCss.Strings[i] );
    LenStrLine := Length( aListCss.Strings[i] );

    if ( PosPoint <>0 ) and ( PosStartD <>0 ) then
      CurrClassName := Copy( aListCss.Strings[i],PosPoint+1, PosStartD-1-PosPoint)
    else
    if PosDualPoint<>0 then
    begin
      CurrParamName := Copy( aListCss.Strings[i], 1, PosDualPoint-1);
      CurrParamValue:= Copy( aListCss.Strings[i], PosDualPoint + 1, LenStrLine - PosDualPoint );

      AddStyle( CurrClassName, CurrParamName, CurrParamValue );
    end;

  end;
end;
//******************************************************************************
procedure TWebHtmlEditor.InsertClassIconElem( TagName:String;ClassName:String='' );
var ClassStr:String;
    txtrange : ihtmlTxtrange;
begin
  if TRim(ClassName)<>'' then ClassStr := '  class=' + ClassName
  else ClassStr :='';
  if TagName='' then TagName:='INPUT';

  txtrange := self.FDHTMLEdit.DOM.selection.createRange as ihtmlTxtrange;
  txtrange.pasteHTML('<'+TagName+ClassStr+ '>');
  self.FDHTMLEdit.Refresh;
end;
//******************************************************************************
procedure TWebHtmlEditor.FPrepareStyleSheetDOOM;
var i : integer;
    CurrPath : Widestring;
    Elem:IHTMLStyleSheet;
    link:OleVariant;
    head:OleVariant;
    CurFilePath:Widestring;
begin

  for i:=0 to Length( FParamCSS.DefIncludeCss )-1 do
  begin
    CurrPath := FParamCSS.DefIncludeCss[i];
    CurFilePath := ExtractFilePath(Application.ExeName) + CheckLastSleshOnPath( CheckLastSleshOnPath(FParamCSS.Path,false) , true, '\' ) + CurrPath;

    head := ( self.FDHTMLEdit.DOM.all.tags( 'head' ) as IHTMLElementCollection ).item( 0 , 0 );
    link := self.FDHTMLEdit.DOM.createElement( 'link' );
    link.href := CurFilePath ;
    link.rel := 'stylesheet';
    link.type:= 'text/css';

    head.appendChild(link);
    FParseStyleIcon( i, CurFilePath );
  end;
end;
//******************************************************************************
procedure TWebHtmlEditor.SaveDocument(SaveOpt:TSaveOptBrowser = BrSaveOptAll);
begin
  if FCurrFileName<>'' then
    SaveDocumentHTMLToFile( FCurrFileName, SaveOpt )
  else
    self.SaveAsDocument(SaveOpt);
end;
//******************************************************************************
procedure TWebHtmlEditor.SaveAsDocument(SaveOpt:TSaveOptBrowser = BrSaveOptAll);
var SaveDialog:TSaveDialog;
begin
  SaveDialog:=TSaveDialog.Create(nil);
  try
    SaveDialog.filter:='*.html|*.html';

    if self.FileName<>'' then
      SaveDialog.InitialDir := ExtractFilePath( self.FileName );

    if SaveDialog.Execute then
      self.SaveDocumentHTMLToFile( SaveDialog.FileName , SaveOpt );

  finally
   SaveDialog.Free;
  end;
end;
//******************************************************************************
function TWebHtmlEditor.FGetPathFromBrowser(myProgram:String):String;
var a: TRegistry;
    MyPath:String;
    begInd:Integer;
begin
 try
   begInd:=0;
   a := TRegistry.Create;
   a.RootKey := HKEY_CLASSES_ROOT;

   if a.OpenKeyReadOnly( myProgram+'\shell\open\command\' ) then
   begin
     MyPath:=a.ReadString('');
     MyPath :=ParseTextBetweenMarks(MyPath,begInd,'"');
   end;

   result:=MyPath;
 finally
   a.CloseKey;
   FreeAndnil(a);
 end;
end;
//******************************************************************************
function TWebHtmlEditor.FGetBrowser(aBrowser:TPreviewBrowser):Widestring;
begin
  if aBrowser = BrPreviewIE      then result:= FGetPathFromBrowser('\Applications\iexplore.exe');
  if aBrowser = BrPreviewFirefox then result:= FGetPathFromBrowser('\FirefoxHTML');   //firefox.exe
  if aBrowser = BrPreviewOpera   then result:= FGetPathFromBrowser('\Applications\Opera.exe');
  if aBrowser = BrPreviewGHrome  then result:= FGetPathFromBrowser('\ChromeHTML'); // 'chrome.exe'
end;
//******************************************************************************
function TWebHtmlEditor.FTempPath:Widestring;
begin
  result:=ExtractFilePath(Application.ExeName)+'~Preview_tmp\';
  ExistsDir( result );
end;
//******************************************************************************
procedure TWebHtmlEditor.PreviewInBrowser(aBrowser:TPreviewBrowser);
var BrProgram:String;
    PreviewTempFile:String;
begin
  DelDir( FTempPath, '*.*' );
  
  PreviewTempFile:= CheckLastSleshOnPath( FTempPath , True) + 'Preview_tmp.html';
  self.SaveDocumentHTMLToFile( PreviewTempFile, BrSaveOptPreview );

  if aBrowser <> BrPreviewDefault  then
    begin
      BrProgram:=FGetBrowser(aBrowser);
      shellexecute( TForm(self.FDHTMLEdit.Owner).Handle, nil, PAnsiChar(BrProgram), PAnsiChar(PreviewTempFile), nil, SW_SHOWNORMAL);
    end
     else
       shellexecute(TForm(self.FDHTMLEdit.Owner).Handle, 'open', PAnsiChar(PreviewTempFile),nil,nil,SW_SHOWNORMAL);
end;
//******************************************************************************
function TWebHtmlEditor.PreviewInBrowseIsAvailable(aBrowser:TPreviewBrowser):Boolean;
begin
  result:= FGetBrowser( aBrowser )<>'';
end;
//******************************************************************************
procedure TWebHtmlEditor.FontCmbBoxSetDefFont( ComboBoxFont,ComboBoxFontSize:TcxComboBox );
var aFont : TFont;
begin
  try
    aFont := GetSystemFont;
    ComboBoxFont.EditValue := FGetFontName;
    ComboBoxFontSize.ItemIndex := FGetFontSize;
  finally
    aFont.Free;
  end;
end;
//******************************************************************************
procedure TWebHtmlEditor.FontCmbBoxPrepare(ComboBoxFont:TcxComboBox);
var  DC:HDC;
     EventChange:TNotifyEvent;
begin
  EventChange:=ComboBoxFont.Properties.OnEditValueChanged;
  ComboBoxFont.Properties.OnEditValueChanged:=nil;
  try
    DC := GetDC(0);
    EnumFonts(DC, nil, @EnumFontsProc, Pointer(ComboBoxFont.Properties.Items));
    ReleaseDC(0, DC);
    ComboBoxFont.Properties.Sorted:= True;
  finally
    ComboBoxFont.Properties.OnEditValueChanged:=EventChange;
  end;
end;
//******************************************************************************
procedure TWebHtmlEditor.SelectFont;
begin
  SpecialCommand(IDM_FONT,True,True,False,FNilVariant);
end;
//******************************************************************************
procedure TWebHtmlEditor.RefreshFontNameComboBox(ComboBoxFont:TcxComboBox);
var aEvent:TNotiFyEvent;
    currFontName:Widestring;
begin
  currFontName:= self.FontName;
  if currFontName = '' then exit;

  aEvent:=ComboBoxFont.Properties.OnEditValueChanged;
  ComboBoxFont.Properties.OnEditValueChanged:=nil;
  ComboBoxFont.Text:=currFontName;
  ComboBoxFont.Properties.OnEditValueChanged:=aEvent;
end;
//******************************************************************************
procedure TWebHtmlEditor.RefreshFontSizeComboBox(ComboBoxFont:TcxComboBox);
var aEvent:TNotiFyEvent;
    currFontSize:Integer;
begin
  currFontSize:=self.FontSize;
  if currFontSize = 0 then exit;
  
  aEvent:=ComboBoxFont.Properties.OnEditValueChanged;
  ComboBoxFont.Properties.OnEditValueChanged:=nil;
  ComboBoxFont.ItemIndex := currFontSize;
  ComboBoxFont.Properties.OnEditValueChanged:=aEvent;
end;
//******************************************************************************
function TWebHtmlEditor.GetCursorPositionElem:Olevariant;
var selectionObj: IHTMLSelectionObject;
    selectionRange: IHtmlTxtRange;
begin
   if self.FDHTMLEdit.DOM.selection.type_='Control' then
   begin //1
     Result :=self.FDHTMLEdit.DOM.selection.createRange;
     result:=Result.commonParentElement;
   end //1
   else
     begin //2
       Result := self.FDHTMLEdit.DOM.selection.createRange;
       result:=Result.ParentElement;
     end; //2
end;
//******************************************************************************
function TWebHtmlEditor.GetCurrentElem(FindElemTag:String):IHTMLElement;
var selectionObj: IHTMLSelectionObject;
    selectionRange: IHtmlTxtRange;
    bodyElement: IHtmlElement;
    HTMLEl : IHTMLElement;
begin
  selectionObj   := self.FDHTMLEdit.DOM.selection;
  selectionRange := IHtmlTxtRange(selectionObj.CreateRange);
  bodyElement    := self.FDHTMLEdit.DOM.body;
  result := nil;

  if UpperCase(selectionObj.type_) = UpperCase('control') then  Exit;
  HTMLEl := selectionRange.parentElement;

  while HTMLEl.parentElement <> nil do
  begin
    if UpperCase(HTMLEl.tagName)=UpperCase(FindElemTag) then
    begin
      result:=HTMLEl;
      Exit;
    end;

    HTMLEl := HTMLEl.parentElement;
  end;
end;
//******************************************************************************
procedure TWebHtmlEditor.InsertImage(Filename : String='');
var vo: OleVariant;
    Anew:boolean;
    ctrlrange: ihtmlcontrolrange;
    txtrange : ihtmlTxtrange;
begin
  if FDHTMLEdit.DOM.selection.type_='Control' then
  begin
    ctrlrange := DOMInterface.Selection.CreateRange as ihtmlcontrolrange;
    if CompareText(ctrlrange.commonParentElement.tagName , 'IMG')=0 then Anew:=false
    else exit;
  end
  else  Anew:=true;

  if ShowEditPic(self.FDHTMLEdit, Anew, Filename, self.FPathImage ) then
    self.FDocChange:=True;
end;
//******************************************************************************
procedure TWebHtmlEditor.InsertYoutube(Filename : String='');
var vo: OleVariant;
    Anew:boolean;
    ctrlrange: ihtmlcontrolrange;
    txtrange : ihtmlTxtrange;
begin
  if FDHTMLEdit.DOM.selection.type_ = 'Control' then
  begin
    ctrlrange := DOMInterface.Selection.CreateRange as ihtmlcontrolrange;
    if CompareText(ctrlrange.commonParentElement.tagName , 'iframe') = 0 then Anew:=false
    else exit;
  end
  else Anew:=true;

  if InsertIframeYouTube( self.FDHTMLEdit, Anew, Filename ) then
    self.FDocChange:=True;

  FDHTMLEdit.Repaint;
  FDHTMLEdit.Refresh;
end;
//******************************************************************************
procedure TWebHtmlEditor.InsertIFrame(Filename : String='');
var vo: OleVariant;
    Anew:boolean;
    ctrlrange: ihtmlcontrolrange;
    txtrange : ihtmlTxtrange;
begin
  if FDHTMLEdit.DOM.selection.type_ = 'Control' then
  begin
    ctrlrange := DOMInterface.Selection.CreateRange as ihtmlcontrolrange;
    if CompareText(ctrlrange.commonParentElement.tagName , 'iframe' )=0 then Anew:=false
    else exit;
  end
  else  Anew:=true;

  if InsertIframeObject( self.FDHTMLEdit, Anew, Filename) then
    self.FDocChange:=True;
    
  FDHTMLEdit.Repaint;
  FDHTMLEdit.Refresh;
end;
//******************************************************************************
procedure TWebHtmlEditor.InsertVideo(Filename : String='');
var vo: OleVariant;
    Anew:boolean;
    ctrlrange: ihtmlcontrolrange;
    txtrange : ihtmlTxtrange;
begin
  if FDHTMLEdit.DOM.selection.type_='Control' then
     begin
       if ElemIsObjectAndVideo(FDHTMLEdit) then Anew:=false else
       Anew:=true;
     end
      else  Anew:=true;

  if InsertVideoObject( self.FDHTMLEdit, Anew, Filename) then
    self.FDocChange:=True;

  FDHTMLEdit.Repaint;
  FDHTMLEdit.Refresh;
end;
//******************************************************************************
procedure TWebHtmlEditor.InsertSub;
var txtrange: ihtmlTxtrange;
    HtmlText:String;
    CurrTagElem:String;
    aCurrElem:IHtmlElement;
    NewHtmlStr:String;
begin
  if self.FDHTMLEdit.DOM.selection.type_<>'Control' then
  begin
    txtrange:=self.FDHTMLEdit.DOM.selection.createRange as ihtmlTxtrange;
    HtmlText:=Trim(txtrange.htmlText);

    if AnsiPos('<sub>',LOwerCase(HtmlText))<>0 then CurrTagElem:='sub';
    if AnsiPos('<sup>',LOwerCase(HtmlText))<>0 then CurrTagElem:='sup';
    aCurrElem:=GetCurrentElem( CurrTagElem );
    //***********************************************
    if CurrTagElem<>'sub' then NewHtmlStr:='<sub>'+txtrange.text + '</sub>'
      else NewHtmlStr:=txtrange.text;
    try
     if aCurrElem<>nil then
        aCurrElem.outerHTML:=NewHtmlStr
         else txtrange.pasteHTML(NewHtmlStr);

     self.FDocChange:=True;    
    except
    end;
  end;
end;
//******************************************************************************
function TWebHtmlEditor.FElemHaveChildren(aElem:Olevariant):Boolean;
var Len,i:Integer;
begin
  //Len:=aElem.parentElement.getElementsByTagName('*').length;
  //ShowMessage( IntToStr(Len)+' '+ );
  //ShowMessage( aElem.parentElement.innerHTML );
  //for i:=0 to aElem.parentElement.childNodes.length-1 do
  // ShowMessage( aElem.parentElement.childNodes.item(i).innerHTML );

  if not VarIsError(aElem.parentElement) then
    result := aElem.parentElement.children.length <>0
  else
    result:=false;
end;
//******************************************************************************
function TWebHtmlEditor.FSelectedElemHaveChildren:Boolean;
begin
  result := FElemHaveChildren(self.FDHTMLEdit.DOM.selection.createRange);
end;
//******************************************************************************
function TWebHtmlEditor.FSelectedElemHaveNextChildElem:Boolean;
var aElem:Olevariant;
begin
  aElem := self.FDHTMLEdit.DOM.selection.createRange;
  result:=not VarIsClear( aElem.parentElement.nextSibling );
end;
//******************************************************************************
procedure TWebHtmlEditor.InsertSup;
var txtrange: ihtmlTxtrange;
    HtmlText:String;
    CurrTagElem:String;
    aCurrElem:IHtmlElement;
    NewHtmlStr:String;
    attr:Variant;
    i:integer;
begin
  if self.FDHTMLEdit.DOM.selection.type_<>'Control' then
    begin
     //if FElemHaveChildren( self.FDHTMLEdit.DOM.selection.createRange ) then exit;
     txtrange:=self.FDHTMLEdit.DOM.selection.createRange as ihtmlTxtrange;

     HtmlText:=Trim(txtrange.htmlText);
     
     if AnsiPos('<sub>',LOwerCase(HtmlText))<>0 then CurrTagElem:='sub';
     if AnsiPos('<sup>',LOwerCase(HtmlText))<>0 then CurrTagElem:='sup';
     aCurrElem:=GetCurrentElem( CurrTagElem );
     //**********************************************
     if CurrTagElem <> 'sup' then NewHtmlStr:='<sup>' + txtrange.text + '</sup>'
        else NewHtmlStr:=txtrange.text;
     //**********************************************
     try
       if aCurrElem<>nil then
       aCurrElem.outerHTML:=NewHtmlStr
       else txtrange.pasteHTML(NewHtmlStr);

       self.FDocChange := True;
     except
     end;
     //**********************************************
    end;
end;
//******************************************************************************
function TWebHtmlEditor.CanCopy : Boolean;
begin
  Result := (FQueryStatus(DECMD_COPY) and DECMDF_ENABLED) = DECMDF_ENABLED;
end;
//******************************************************************************
function TWebHtmlEditor.CanCut : Boolean;
begin
  if not self.FHTMLCodeEditor.CodeEditor.Focused then
    Result := (FQueryStatus(DECMD_CUT) and DECMDF_ENABLED) = DECMDF_ENABLED
  else Result:=self.FHTMLCodeEditor.CodeEditor.Range.SelLength<>0
end;
//******************************************************************************
function TWebHtmlEditor.CanPaste : Boolean;
begin
  Result := (FQueryStatus(DECMD_PASTE) and DECMDF_ENABLED) = DECMDF_ENABLED;
end;
//******************************************************************************
function TWebHtmlEditor.CanRedo : Boolean;
begin
  if not self.FHTMLCodeEditor.CodeEditor.Focused then
    Result := (FQueryStatus(DECMD_REDO) and DECMDF_ENABLED) = DECMDF_ENABLED
  else
    result:=false;
end;
//******************************************************************************
function TWebHtmlEditor.CanUndo : Boolean;
begin
  if not self.FHTMLCodeEditor.CodeEditor.Focused then
    Result := (FQueryStatus(DECMD_UNDO) and DECMDF_ENABLED) = DECMDF_ENABLED
  else
    result := self.FHTMLCodeEditor.CodeEditor.Range.CanUndo;
end;
//******************************************************************************
function TWebHtmlEditor.CanInsertTable: Boolean;
var bEnabled,
    bChecked : Boolean;
begin
  FGetSpecialCommandState(IDM_TRIED_INSERTTABLE, True, bEnabled, bChecked);
  Result := bEnabled or bChecked;
end;
//******************************************************************************
function TWebHtmlEditor.CanDeleteCells: Boolean;
var bEnabled,
    bChecked : Boolean;
begin
  FGetSpecialCommandState(IDM_TRIED_DELETECELLS, True, bEnabled, bChecked);
  Result := bEnabled or bChecked;
end;
//******************************************************************************
function TWebHtmlEditor.CanDeleteColumns: Boolean;
var bEnabled,
    bChecked : Boolean;
begin
  FGetSpecialCommandState(IDM_TRIED_DELETECOLS, True, bEnabled, bChecked);
  Result := bEnabled or bChecked;
end;
//******************************************************************************
function TWebHtmlEditor.CanDeleteRows: Boolean;
var bEnabled,
    bChecked : Boolean;
begin
  FGetSpecialCommandState(IDM_TRIED_DELETEROWS, True, bEnabled, bChecked);
  Result := bEnabled or bChecked;
end;
//******************************************************************************
function TWebHtmlEditor.CanInsertCell: Boolean;
var bEnabled,
    bChecked : Boolean;
begin
  FGetSpecialCommandState(IDM_TRIED_INSERTCELL, True, bEnabled, bChecked);
  Result := bEnabled or bChecked;
end;
//******************************************************************************
function TWebHtmlEditor.CanInsertColumn: Boolean;
var bEnabled,
    bChecked : Boolean;
begin
  FGetSpecialCommandState(IDM_TRIED_INSERTCOL, True, bEnabled, bChecked);
  Result := bEnabled or bChecked;
end;
//******************************************************************************
function TWebHtmlEditor.CanInsertRow: Boolean;
var bEnabled,
    bChecked : Boolean;
begin
  FGetSpecialCommandState(IDM_TRIED_INSERTROW, True, bEnabled, bChecked);
  Result := bEnabled or bChecked;
end;
//******************************************************************************
function TWebHtmlEditor.CanMergeCells: Boolean;
var bEnabled,
    bChecked : Boolean;
begin
  FGetSpecialCommandState(IDM_TRIED_MERGECELLS, True, bEnabled, bChecked);
  Result := bEnabled or bChecked;
end;
//******************************************************************************
function TWebHtmlEditor.CanInsertTextBox: Boolean;
var bEnabled,
    bChecked : Boolean;
begin
  FGetSpecialCommandState(IDM_TEXTBOX, True, bEnabled, bChecked);
  Result := bEnabled or bChecked;
end;
//******************************************************************************
function TWebHtmlEditor.CanInsertTextArea: Boolean;
var bEnabled,
    bChecked : Boolean;
begin
  FGetSpecialCommandState(IDM_TEXTAREA, True, bEnabled, bChecked);
  Result := bEnabled or bChecked;
end;
//******************************************************************************
function TWebHtmlEditor.CanInsertCheckBox: Boolean;
var bEnabled,
    bChecked : Boolean;
begin
  FGetSpecialCommandState(IDM_CHECKBOX, True, bEnabled, bChecked);
  Result := bEnabled or bChecked;
end;
//******************************************************************************
function TWebHtmlEditor.CanInsertRadioButton: Boolean;
var bEnabled,
    bChecked : Boolean;
begin
  FGetSpecialCommandState(IDM_RADIOBUTTON, True, bEnabled, bChecked);
  Result := bEnabled or bChecked;
end;
//******************************************************************************
function TWebHtmlEditor.CanInsertDropDownBox: Boolean;
var bEnabled,
    bChecked : Boolean;
begin
  FGetSpecialCommandState(IDM_DROPDOWNBOX, True, bEnabled, bChecked);
  Result := bEnabled or bChecked;
end;
//******************************************************************************
function TWebHtmlEditor.CanInsertListBox: Boolean;
var bEnabled,
    bChecked : Boolean;
begin
  FGetSpecialCommandState(IDM_LISTBOX, True, bEnabled, bChecked);
  Result := bEnabled or bChecked;
end;
//******************************************************************************
function TWebHtmlEditor.CanInsertButton: Boolean;
var bEnabled,
    bChecked : Boolean;
begin
  FGetSpecialCommandState(IDM_BUTTON, True, bEnabled, bChecked);
  Result := bEnabled or bChecked;
end;
//******************************************************************************
function TWebHtmlEditor.CanSplitCell: Boolean;
var bEnabled,
    bChecked : Boolean;
begin
  FGetSpecialCommandState(IDM_TRIED_SPLITCELL, True, bEnabled, bChecked);
  Result := bEnabled or bChecked;
end;
//******************************************************************************
function TWebHtmlEditor.CanInsertImage:Boolean;
var ctrlrange: ihtmlcontrolrange;
begin
  if FDHTMLEdit.DOM.selection.type_ = 'Control' then
    begin
     ctrlrange := DOMInterface.Selection.CreateRange as ihtmlcontrolrange;
     result := CompareText( ctrlrange.commonParentElement.tagName , 'IMG' ) = 0;
    end
    else  result:= ( not IsSelText );
end;
//******************************************************************************
function TWebHtmlEditor.CanInsertObject:Boolean;
var ctrlrange: ihtmlcontrolrange;
begin
  if FDHTMLEdit.DOM.selection.type_='Control' then
    result:= ElemIsObjectAndFlash(FDHTMLEdit)
  else  result:= ( not IsSelText );
end;
//******************************************************************************
function TWebHtmlEditor.CanInsertYoutube:Boolean;
var ctrlrange: ihtmlcontrolrange;
begin
  if FDHTMLEdit.DOM.selection.type_='Control' then
    result:= ElemIsIFrameAndYoutube( self.FDHTMLEdit)
  else  result:= ( not IsSelText );
end;
//******************************************************************************
function TWebHtmlEditor.CanInsertIFrame:Boolean;
var ctrlrange: ihtmlcontrolrange;
begin
  if FDHTMLEdit.DOM.selection.type_='Control' then
     begin
       ctrlrange := DOMInterface.Selection.CreateRange as ihtmlcontrolrange;
       if ( CompareText(ctrlrange.commonParentElement.tagName , 'IFRAME')=0 ) and
       ( not ElemIsIFrameAndYoutube( self.FDHTMLEdit) ) then result:=true
       else
         result:=False;
     end
      else
        result := ( not IsSelText );
end;
//******************************************************************************
function TWebHtmlEditor.CanInsertVideo:Boolean;
var ctrlrange: ihtmlcontrolrange;
begin
  if FDHTMLEdit.DOM.selection.type_='Control' then
    result := ElemIsObjectAndVideo( FDHTMLEdit )
  else
    result:= ( not IsSelText );
end;
//******************************************************************************
function TWebHtmlEditor.CanInsertLink:Boolean;
var ctrlrange: ihtmlcontrolrange;
begin
 if self.FDHTMLEdit.DOM.selection.type_<> 'Control' then
    result:=IsSelText
 else
 begin
   ctrlrange := DOMInterface.Selection.CreateRange as ihtmlcontrolrange;
   result:= ctrlrange.commonParentElement.tagName <> 'HR' ;
 end;
end;
//******************************************************************************
function TWebHtmlEditor.CanAvailebleButtonTable:Boolean;
var ctrlrange: ihtmlcontrolrange;
begin
  if FDHTMLEdit.DOM.selection.type_ = 'Control' then
  begin
    ctrlrange := DOMInterface.Selection.CreateRange as ihtmlcontrolrange;
    result:= CompareText( ctrlrange.commonParentElement.tagName , 'TABLE' )=0;
  end
  else
    result:=true;
end;
//******************************************************************************
function TWebHtmlEditor.CanUpdateTable:Boolean;
var ctrlrange: ihtmlcontrolrange;
begin
  if FDHTMLEdit.DOM.selection.type_='Control' then
  begin
    ctrlrange := DOMInterface.Selection.CreateRange as ihtmlcontrolrange;
    result := CompareText(ctrlrange.commonParentElement.tagName , 'TABLE')=0;
  end
  else
    result := false;
end;
//******************************************************************************
procedure TWebHtmlEditor.DeleteCells;
begin
  SpecialCommand(IDM_TRIED_DELETECELLS, False, True, True, FNilVariant);
end;
//******************************************************************************
procedure TWebHtmlEditor.DeleteColumns;
begin
  SpecialCommand(IDM_TRIED_DELETECOLS, False, True, True, FNilVariant);
end;
//******************************************************************************
procedure TWebHtmlEditor.DeleteRows;
begin
  SpecialCommand(IDM_TRIED_DELETEROWS, False, True, True, FNilVariant);
end;
//******************************************************************************
procedure TWebHtmlEditor.InsertCell;
begin
  SpecialCommand(IDM_TRIED_INSERTCELL, False, True, True, FNilVariant);
  FprepareDelTemplateGarbage;
end;
//******************************************************************************
procedure TWebHtmlEditor.InsertColumn;
begin
  SpecialCommand(IDM_TRIED_INSERTCOL, False, True, True, FNilVariant);
  FprepareDelTemplateGarbage;
end;
//******************************************************************************
Procedure TWebHtmlEditor.FprepareDelTemplateGarbage;
var aHtmlCode:WideString;
    aListStr:TStringList;
begin
  try
    aListStr := TStringList.Create;
    aHtmlCode := self.DocumentHTML;
    ReplaseON( aHtmlCode,'style="COLOR: " bgColor= borderColorLight= borderColor= borderColorDark=','');
    ReplaseON( aHtmlCode,'style="COLOR: "','');
    aListStr.Text := aHtmlCode;
    LoadWebPageFromTextHtml( aListStr );
  finally
    aListStr.Free;
  end;
end;
//******************************************************************************
procedure TWebHtmlEditor.InsertRow;
begin
  SpecialCommand( IDM_TRIED_INSERTROW, True, True, True, FNilVariant);
  FprepareDelTemplateGarbage;
end;
//******************************************************************************
procedure TWebHtmlEditor.MergeCells;
begin
  SpecialCommand( IDM_TRIED_MERGECELLS, False, True, True, FNilVariant);
end;
//******************************************************************************
procedure TWebHtmlEditor.SplitCell;
begin
  SpecialCommand(IDM_TRIED_SPLITCELL, False, True, True, FNilVariant);
end;
//******************************************************************************
procedure TWebHtmlEditor.FClearAttributeElem(AHTMLElem : OLEVariant);
var x:OLEVariant;
    Str:string;
begin
  if not VarIsNull( AHTMLElem ) then
  begin
    //Str := AHTMLElem.GetAttribute('bgColor',x);
    AHTMLElem.removeAttribute('borderColor',x);
    AHTMLElem.removeAttribute('background',x);
    AHTMLElem.removeAttribute('bgColor',x);
    AHTMLElem.removeAttribute('Color',x);
    AHTMLElem.removeAttribute('width',x);
    AHTMLElem.removeAttribute('height',x);
    AHTMLElem.removeAttribute('style',x);
    AHTMLElem.removeAttribute('borderColorLight',x);
    AHTMLElem.removeAttribute('borderColor',x);
    AHTMLElem.removeAttribute('borderColorDark',x);

  end;
end;
//******************************************************************************
procedure TWebHtmlEditor.ClearCell;
var x:OLEVariant;
    AHTMLTAble : IHTMLElement;
    AHTMLTD : OLEVariant;
begin
  AHTMLTAble := self.GetCurrentElem( 'TABLE' );
  if AHTMLTAble <> nil then
  begin
   AHTMLTD := self.GetCurrentElem('TD');
   FClearAttributeElem(AHTMLTD);
   {AHTMLTD.removeAttribute('bgColor',x);
   AHTMLTD.removeAttribute('Color',x);
   AHTMLTD.removeAttribute('width',x);
   AHTMLTD.removeAttribute('height',x);
   AHTMLTD.removeAttribute('style',x);
   AHTMLTD.removeAttribute('background',x);
   AHTMLTD.removeAttribute('borderColor',x);
   AHTMLTD.removeAttribute('borderColorLight',x);}
  end;
end;
//******************************************************************************
procedure TWebHtmlEditor.ClearTableRow( AHTMLTR : OLEVariant );
var j:Integer;
    x:OLEVariant;
    AHTMLTAble : IHTMLElement;

    AHTMLTD : OLEVariant;
begin
   if not VarIsNull( AHTMLTR ) then
   begin
      FClearAttributeElem( AHTMLTR );

      for j:=0 to AHTMLTR.cells.length-1 do
      begin
         AHTMLTD:=AHTMLTR.cells.item(j, 0);
         FClearAttributeElem( AHTMLTD );
      end;
    end;
end;
//******************************************************************************
function TWebHtmlEditor.IsSelText: Boolean;
var txtrange : ihtmlTxtrange;
begin
 result:=false;
 if self.FDHTMLEdit.DOM.selection.type_<>'Control' then
 begin 
   txtrange:=self.FDHTMLEdit.DOM.selection.createRange as ihtmlTxtrange;
   if txtrange.text<>'' then result:=true;
 end;
end;
//******************************************************************************
procedure TWebHtmlEditor.SetRefreshFunction(FunctReresh:TNotifyevent);
begin
  FFunctRefresh:=FunctReresh;
end;
//******************************************************************************
procedure TWebHtmlEditor.RefreshButton(Sender:TObject);
var ctrlrange: ihtmlcontrolrange;
    txtrange : ihtmlTxtrange;                     
    TxtAlign : TAlignment;
begin
 if not FDocComplete then exit;

 try
  if btnCut=nil then Exit;

  btnCut.Enabled   := CanCut;
  btnCopy.Enabled  := btnCut.Enabled;
  btnDel.Enabled   := btnCut.Enabled;
  btnPaste.Enabled := CanPaste;
  butPasteWithFilter.Enabled := btnPaste.Enabled;// and self.FDHTMLEdit.Focused;

  butUndo.Enabled := CanUndo;
  butRedo.Enabled := CanRedo;

  btnBold.Down      := Bold;
  btnItalic.Down    := Italic;
  btnUnderline.Down := Underline;

  btnFont.Enabled   := IsSelText;
  btnSub.Enabled    := IsSelText;// and (not FSelectedElemHaveChildren);
  btnSup.Enabled    := IsSelText;// and (not FSelectedElemHaveChildren);

  btnSub.Down       := Sub;
  btnSup.Down       := Sup;

  butPicture.Enabled := CanInsertImage;
  butTable.Enabled   := CanAvailebleButtonTable;
  butFlash.Enabled   := CanInsertObject;
  butYouTube.Enabled := CanInsertYoutube;
  butIframe.Enabled  := CanInsertIFrame;
  butVideo.Enabled   := CanInsertVideo;

  btnNumList.Enabled := btnBold.Enabled;
  btnBullet.Enabled  := btnBold.Enabled;

  btnAlignLeft.Enabled  :=true;
  btnCenter.Enabled     :=true;
  btnAlignRight.Enabled :=true;

  TxtAlign := TextAlignment;
  btnAlignLeft.Down :=(txtAlign = taLeftJustify);
  btnCenter.Down := (txtAlign = taCenter);
  btnAlignRight.Down :=(txtAlign = taRightJustify);
  butHiperLink.Enabled      :=CanInsertLink;
  //**********************************************************
  if self.FDHTMLEdit.DOM.selection.type_ <> 'Control' then
  begin //1
    btnBold.Enabled           :=true;
    btnItalic.Enabled         :=true;
    btnUnderline.Enabled      :=true;
    btnNumList.Enabled        :=true;
    btnBullet.Enabled         :=true;
    butDecreaseIndent.Enabled :=true;
    butIncreaseIndent.Enabled :=true;
    butInsertHR.Enabled       :=not IsSelText;
    butIconAttach.Enabled     :=not IsSelText;
    //***********************************
    txtrange:=self.FDHTMLEdit.DOM.selection.createRange as ihtmlTxtrange;
    if (txtrange.text<>'')or(self.IsElem('TD')) then
        self.btnColor.Enabled:=true
       else
         self.btnColor.Enabled:=false;
  end //1
  else
  begin //4
    //***********************************
    btnBold.Enabled      :=false;
    btnItalic.Enabled    :=false;
    btnUnderline.Enabled :=false;
    btnNumList.Enabled      :=false;
    btnBullet.Enabled       :=false;
    butDecreaseIndent.Enabled :=false;
    butIncreaseIndent.Enabled :=false;
    butInsertHR.Enabled       :=false;
    butIconAttach.Enabled     :=false; 
    //***********************************
    if self.IsElem('HR') then
      self.btnColor.Enabled:=true
       else
        self.btnColor.Enabled:=false;
  end;  //4

  if @FFunctRefresh<>nil then FFunctRefresh(Sender);

 except
 end;
end;
//******************************************************************************
function TWebHtmlEditor.IsElem(TagElem:String): Boolean;
var ctrlrange: ihtmlcontrolrange;
    txtrange: ihtmlTxtrange;

function FindElemTxt(El: ihtmlElement):Boolean;
begin
   result:=false;
   if El=nil then exit;
   if El.parentElement=nil then exit;
   if CompareText(El.tagName ,TagElem)=0 then begin result:=true;exit;end;
   if CompareText(El.parentElement.TagName ,TagElem)=0 then begin result:=true; exit; end;

   while (El.parentElement<>nil)and(CompareText(El.parentElement.tagName ,TagElem)<>0) do
     begin
      if CompareText(El.parentElement.tagName ,TagElem)=0 then begin result:=true;break;end;
      El := El.parentElement;
      if El=nil then break;
     end;
   if (El<>nil)and(El.parentElement<>nil)and( CompareText(El.parentElement.tagName ,TagElem)=0 ) then result:=true;
end;
//******************************************************************************
begin
  if self.FDHTMLEdit.DOM.selection.type_='Control' then
  begin //1
    ctrlrange :=self.FDHTMLEdit.DOM.selection.createRange as ihtmlcontrolrange;
    if CompareText(ctrlrange.commonParentElement.tagName, TagElem)=0 then result:=true
    else
      result:=false;
  end //1
  else
   begin //2
     txtrange:=self.FDHTMLEdit.DOM.selection.createRange as ihtmlTxtrange;
     if FindElemTxt(txtrange.parentElement)then result:=true
     else
       result:=false;
   end; //2
end;
//******************************************************************************
procedure TWebHtmlEditor.InsertFlash;
var vo              :OleVariant;
    HtmlText        :String;
    Modify: Boolean;
begin
 try
  Application.CreateForm(TFrm_ProperFlash, Frm_ProperFlash);
  Frm_ProperFlash.HTMLEditSetupIni := FHTMLEditSetupIni;
  vo := DOMInterface.Selection.CreateRange;
  if self.IsElem('object')then Modify:=true else Modify:=false;

  if ( self.FDHTMLEdit.DOM.selection.type_ = 'Control')and( not Modify ) then Exit;
  with Frm_ProperFlash do
  begin //1
    if Modify then GetPropFlash( self.FDHTMLEdit )
    else
      SetDefaultPropFlash;

    if Frm_ProperFlash.ShowModal <> mrOk then Exit;

    HtmlText := FormingHtmlFlash;
    if not Modify then  vo.pasteHTML(HtmlText)
    else vo.commonParentElement.outerHTML:=HtmlText;

    self.FDocChange:=True;
  end;   //1

 finally
   FreeAndNil(Frm_ProperFlash);
 end;
end;
//******************************************************************************
procedure TWebHtmlEditor.InsertTable( ACaption:String; Modify:Boolean=false );
begin
  if FHTMLTableResize.InsertTable( ACaption, Modify ) then
    self.FDocChange := True;
end;
//******************************************************************************
function TWebHtmlEditor.ElemIsIconClass( aElem:Olevariant ):boolean;
var i:integer;
    CurrClassName:String;
begin
  CurrClassName := aElem.className;
  result := False;
  
  for i:=0 to Length( self.FParamCSS.IConCSS )-1 do
  begin
    if CompareText( self.FParamCSS.IConCSS[i].ClassName, CurrClassName )=0 then
    begin
      result := True;
      break;
    end;
  end;
end;
//******************************************************************************
procedure TWebHtmlEditor.ObjectUpdate;
var ctrlrange: ihtmlcontrolrange;
begin
 if self.FDHTMLEdit.DOM.selection.type_ = 'Control' then
 begin
   ctrlrange:=self.FDHTMLEdit.DOM.selection.createRange as ihtmlcontrolrange;
   if ctrlrange.commonParentElement.tagName='IMG' then
     self.InsertImage
   else
   if ctrlrange.commonParentElement.tagName='TABLE' then
      Self.InsertTable('«м≥нити', true)
   else
   if ctrlrange.commonParentElement.tagName='OBJECT' then
     self.InsertFlash

   else
   if (ctrlrange.commonParentElement.tagName='IFRAME') then
   begin
     if ( ElemIsIFrameAndYoutube(self.FDHTMLEdit) ) then self.InsertYoutube
     else
       self.InsertIFrame;
   end
   else
     if ElemIsIconClass( ctrlrange.commonParentElement ) then self.InsertLink;
   //   ctrlrange.commonParentElement.tagName='INPUT' then self.InsertLink;
 end;
end;
//******************************************************************************
function TWebHtmlEditor.ObjectSelected:Boolean;
begin
  result:=false;
  if not Self.FDocComplete then exit;

  result:= self.FDHTMLEdit.DOM.selection.type_ = 'Control';
end;
//******************************************************************************
procedure TWebHtmlEditor.FHTMLEditondblclick(Sender: TObject);
begin
  ObjectUpdate;
  if @FPersonalHTMLEditonDblClick<>nil then FPersonalHTMLEditonDblClick(Sender);
end;
//******************************************************************************
procedure TWebHtmlEditor.GotoPosBegin( WaitToComplete:Boolean );
begin
  if WaitToComplete then
  begin
    if not self.FDocComplete then exit;
    while FDHTMLEdit.DOM.readyState <> 'complete' do Application.ProcessMessages;
  end;

  self.FDHTMLEdit.SetFocus;
  PostKeyEx32( 33 , [], False);  // Page Up
end;
//******************************************************************************
procedure TWebHtmlEditor.LoadWebPageFromTextHtml(aText:TStrings);
var M :TMemoryStream;
begin
  if not Self.FDocComplete then exit;

  try
    HTMLCodeEditor.CodeEditor.OnChange := nil;
    FDocComplete:=false;
   
    M := TMemoryStream.Create;
    aText.SaveToStream(M);
    M.Seek(0,0);

    (self.FDHTMLEdit.DOM as ipersiststreaminit).load(tstreamadapter.create(M) );
    while FDHTMLEdit.DOM.readyState <> 'complete' do Application.ProcessMessages;

    self.FDHTMLEdit.Refresh;
    Self.RefreshButton(self);
    GotoPosBegin;
  finally
    HTMLCodeEditor.CodeEditor.OnChange := FOnChangeHTMLCodeEditor;
  end;
end;
//******************************************************************************
procedure TWebHtmlEditor.FDHTMLDocumentComplete(Sender: TObject);
var htmlDoc:IHTMLDocument2;
begin
  if Assigned( self.FDHTMLEdit.DOM ) then
   begin
     htmlDoc := self.FDHTMLEdit.DOM as IHTMLDocument2;

     htmlDoc.onmousemove:= (TEventObject.Create(FHTMLTableResize.TableMouseMove ) as IDispatch) ;
     htmlDoc.onmouseup  := (TEventObject.Create(FHTMLTableResize.TableMouseUp) as IDispatch)   ;
     htmlDoc.onmousedown:= (TEventObject.Create(FHTMLTableResize.TableMouseDown) as IDispatch) ;

     htmlDoc.ondragstart:= (TEventObject.Create(FOnStartDragDOM) as IDispatch);
     htmlDoc.onkeypress := (TEventObject.Create(FOnKeyPressDOM) as IDispatch);

     htmlDoc.onafterupdate := (TEventObject.Create(FOnRedystateChangeDOM) as IDispatch);
     if htmlDoc.url <> 'about:blank' then self.FDocChange := false;

     FDocComplete := True ;

     FPrepareHTMLDocForPathPreview( self.FDOMInterface, ExtractFilePath(FileName) , BrOptIsLoad );

     if self.FNewDoc then
     begin
       self.FNewDoc := False;
       FRepareNewHTML;

     end;
   end;

   if @FPersonalHTMLEditonOnComplete<>nil then FPersonalHTMLEditonOnComplete(Sender);
   RefreshButton(self);
end;                  
//******************************************************************************
procedure TWebHtmlEditor.FDhtmlOnClick(Sender: TObject);
begin
  self.RefreshButton(self);
  if @FPersonalHTMLEditonClick <> nil then FPersonalHTMLEditonClick(Sender);
end;
//******************************************************************************
procedure TWebHtmlEditor.FDhtmlOnKeyUp(Sender: TObject);
begin
  self.RefreshButton(self);
  if @FPersonalHTMLEditonKeyUp <> nil then FPersonalHTMLEditonKeyUp(Sender);

  self.FDocChange:=True; 
end;
//******************************************************************************
function TWebHtmlEditor.FindCurrPositionInHTMLCode:Integer;
var CursorElem:Olevariant;
    SearchCode:Widestring;
    x:OLEVariant;
    CodeList:TStringList;
begin
  CodeList:=TStringList.Create;
  try
   CursorElem:=self.GetCursorPositionElem;
   CursorElem.setAttribute('MARK_FIND_POSITION','mark', x);

   CodeList.Text :=self.DocumentHTML;
   result := AnsiPos( LowerCase('MARK_FIND_POSITION="mark"') , LowerCase( CodeList.Text ) );

   CursorElem.removeAttribute('MARK_FIND_POSITION', x);
 finally
   CodeList.Free; 
 end;
end;
//******************************************************************************
procedure TWebHtmlEditor.FSetShowDetailTag(Value:Boolean);
begin
  self.FDHTMLEdit.ShowDetails := Value;
  RefreshButton(self);
end;
//******************************************************************************
function TWebHtmlEditor.FGetShowDetailTag:Boolean;
begin
  if self = nil then exit;
  result := self.FDHTMLEdit.ShowDetails;
end;
//******************************************************************************
procedure TWebHtmlEditor.PreviewCodeHtml;
begin
  try
    HTMLCodeEditor.CodeEditor.OnChange := nil;

    self.HTMLCodeEditor.CodeEditor.Lines.Text := self.DocumentHTML + #13#10+#13#10;
    self.HTMLCodeEditor.CodeEditor.Range.Position := self.FindCurrPositionInHTMLCode;
    self.HTMLCodeEditor.CodeEditor.SetFocus;
    self.RefreshButton(self);

    FFocusControl:=self.HTMLCodeEditor.CodeEditor;
  finally
   HTMLCodeEditor.CodeEditor.OnChange := FOnChangeHTMLCodeEditor;
  end;
end;
//******************************************************************************
procedure TWebHtmlEditor.PreviewDesignerFromCodeHtml;
begin
  if self = nil then exit;
  if self.HTMLCodeEditor.CodeEditor.Lines.Text <>'' then
  begin
   self.LoadWebPageFromTextHtml(self.HTMLCodeEditor.CodeEditor.Lines);
   FFocusControl:=self.FDHTMLEdit;
  end;
end;
//******************************************************************************
procedure TWebHtmlEditor.FOnChangeHTMLCodeEditor(Sender: TObject; ChangedItems: TChangedItems);
begin
 self.FDocChange := true;
 self.RefreshButton(self);
end;
//******************************************************************************
procedure TWebHtmlEditor.FOnStartDragDOM;
begin
  FDocChange:=True;
end;
//******************************************************************************
procedure TWebHtmlEditor.FOnKeyPressDOM;
begin
  FDocChange:=True;
end;
//******************************************************************************
procedure TWebHtmlEditor.FOnRedystateChangeDOM;
begin
 // your code 
end;
//******************************************************************************
procedure TWebHtmlEditor.SetSCCPath( aPath:String );
begin
  self.FPathCss := aPath;
end;
//******************************************************************************
procedure TWebHtmlEditor.SetImagePath(aPath:String);
begin
  self.FPathImage := aPath;
end;
//******************************************************************************
procedure TWebHtmlEditor.SetFlashObjPath(aPath:String);
begin
  self.FPathFlashObj := aPath;
end;
//******************************************************************************
procedure TWebHtmlEditor.SetVideoObjPath(aPath:String);
begin
  self.FPathVideoObj := aPath;
end;
//******************************************************************************
function TWebHtmlEditor.SelectColor:TColor;
var cdColor:TColorDialog;
begin
  try
   cdColor:= TColorDialog.Create(nil);

   if cdColor.Execute then result:= cdColor.Color
   else result:=-1;

  finally
   cdColor.Free;
  end;
end;
//******************************************************************************
procedure TWebHtmlEditor.SetColor;
var HTMLEl: IHTMLElement;
    HTMLSelectionEl: IHTMLElement;
    ACurrColor:TColor;
    AHTMLTAble:IHTMLElement;
    AHTMLTD : IHTMLElement;
    AHTMLTR : IHTMLElement;
//************************************************************
Procedure SetColorSelected;
var currColor:TColor;
begin
  currColor := self.SelectColor;
  if currColor<>-1 then self.TextColor := currColor;
end;
//************************************************************
begin
  if LowerCase(self.DHTMLEdit.DOM.selection.type_) = 'text' then SetColorSelected
  else
  begin
    AHTMLTAble := self.GetCurrentElem( 'TABLE' );
    if AHTMLTAble<>nil then
    begin
      AHTMLTD := self.GetCurrentElem('TD');
      AHTMLTR := self.GetCurrentElem('TR');
      ACurrColor :=ShowDialogColor(  clWhite );
      if ACurrColor = -1 then exit;

      HTMLSelectionEl  := HTMLEl;
      ChangeColorToCell( AHTMLTAble as DispHTMLTable, GetCurRow(AHTMLTR), GetCurCol(AHTMLTD), ColorToHtml(ACurrColor) );

    end
    else SetColorSelected;
  end;

  self.FDocChange := True;
end;
{ TEventObject }

constructor TEventObject.Create(const OnEvent: TObjectProcedure);
begin
  inherited Create;
  FOnEvent := OnEvent;
end;
//******************************************************************************
function TEventObject.GetIDsOfNames(const IID: TGUID; Names: Pointer;
  NameCount, LocaleID: Integer; DispIDs: Pointer): HResult;
begin
  Result := E_NOTIMPL;
end;
//******************************************************************************
function TEventObject.GetTypeInfo(Index, LocaleID: Integer;
  out TypeInfo): HResult;
begin
  Result := E_NOTIMPL;
end;
//******************************************************************************
function TEventObject.GetTypeInfoCount(out Count: Integer): HResult;
begin
  Result := E_NOTIMPL;
end;
//******************************************************************************
function TEventObject.Invoke(DispID: Integer; const IID: TGUID;
  LocaleID: Integer; Flags: Word; var Params; VarResult, ExcepInfo,
  ArgErr: Pointer): HResult;
begin
  if (DispID = DISPID_VALUE) then
  begin
    if Assigned(FOnEvent) then FOnEvent;
    Result := S_OK;
  end
  else Result := E_NOTIMPL;
end;
//******************************************************************************
end.


initialization
  OleInitialize(nil);
finalization
  OleUninitialize;
