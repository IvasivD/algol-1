unit UnitPreviewFiles;

interface
uses DB, cxGridDBTableView,Dialogs, cxGridCustomTableView, SHDocVw ,ActiveX ,Forms, cxStyles ,cxGridLevel,Math,
     Classes,SysUtils,Graphics,cxGraphics,ExtCtrls,Windows,Controls,Variants,ShellAPI,MSHTML_TLB ,cxGrid,Messages,  UnitProc,
      cxDBLookupEdit, cxDBExtLookupComboBox,cxGridTableView,DragDrop, DropTarget, DragDropText,Buttons,EAGetMailObjLib_TLB,StrUtils ;
type
  TOptShowFiles = (OptFiles,OptFilesAndDirNoDir,OptFilesAndDir,OptFilesAndDirExploer);

  TMasCxColGrid=Array of TcxGridColumn;
  TEventCopyFile = procedure ( FileName:String) of object;
  TEMail = record
   name:WideString;
   email:String;
  end;

  TAttachmentFiles = record
     HTML:Widestring;
     Files:array of Widestring;
  end;

  TPropMSG = record
    ReportType:Integer;
    From:TEMail;
    EmailTo:Array of TEMail;

    Subject:Widestring;
    TextBody:Widestring;
    HTMLBody:Widestring;

    Attachment:TAttachmentFiles;
  end;

  TViewFilesIE  = class
   private
    FDatasetViewFile:TDataset;
    FViewFiles :TcxGridDBTableView;
    FPreviewWebBrowser :TWebBrowser;
    FPreviewWidth:Integer;
    FPreviewHeight:Integer;
    FDefColorSelection : TColor;
    FDefColorFontSelection: TColor;
    FColorBGBrowser :string;
    FPanelViewPic:TPanel;
    FCurrPathToFile:string;
    FCurrFileMask:array of String;
    FRotateImageDeg:Integer;
    FStyleInactive:TcxStyle; 

    FBrowserCountLoadPage:Integer;
    FTimerActive:TTimer;
    FViewRotatemagePanel:TPanel;
    FPersonalRecordChange: TcxGridFocusedRecordChangedEvent;

    FFolderTmp:string;
    FOptViewFiles:TOptShowFiles;

    FileHtml  :String;

    procedure FClearDataset;
    function  FFindFiles( Path:String;Mask:array of String; OptViewFiles:TOptShowFiles ):TStringList;
    procedure FViewFilesFocusedRecordChanged(
              Sender: TcxCustomGridTableView; APrevFocusedRecord,
              AFocusedRecord: TcxCustomGridRecord;
              ANewItemRecordFocusingChanged: Boolean);
    procedure ViewScanDocNCanFocusRecord(Sender: TcxCustomGridTableView;
              ARecord: TcxCustomGridRecord; var AAllow: Boolean);

    procedure FBeginUpdateViewFiles;
    procedure FEndUpdateViewFiles;

    procedure SetFocusRowView(aView:TcxGridDBTableView);
    Function  FGenHTMLForSelectedFile(TempPath:String):TStringList;
    function  FGetTypeHTMLObj:string;
    function  FWB_GetHTMLCode(WebBrowser: TWebBrowser; ACode: TStrings): Boolean;
    procedure FWB_SetHTMLCode(WebBrowser: TWebBrowser; HTMLCode: string);
    function  FGetWidthHeight(aType:String):String;

    function  FCheckShowByWidthOrHeight(FileName:String):Integer;
    function  FGetImageRect( ACanvas: TcxCanvas; Text:WideString;ImageWidth:Integer; Alignment:TAlignment;var ATextRect: TRect): TRect;
    procedure ViewFileNameCustomDrawCell( Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
              AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);

    procedure ViewFilesCellDblClick(Sender: TcxCustomGridTableView;
              ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
              AShift: TShiftState; var AHandled: Boolean);

    function  FGetSelectionColor(Sender: TcxCustomGridTableView):TcxStyle;
    function  FGetColorFontSelection(Sender: TcxCustomGridTableView):TColor;
    function  FGetColorSelection(Sender: TcxCustomGridTableView):TColor;
    procedure WebBrFileViewDocumentComplete(Sender: TObject;
              const pDisp: IDispatch; var URL: OleVariant);
    procedure WebBrFileViewDownloadComplete(Sender: TObject);
    procedure FTimerTimerActiveControl(Sender: TObject);
    procedure FReadWidthHeightViewPic;
    procedure PanelViewResize(Sender: TObject);
    procedure FSaveCurrPathMask( Path:String; Mask:array of String );
    procedure CopyFile(FileName:String);
    Function  FGetRotateNumber(Angle:Integer):Integer;
    Function  FGetStyleRotate(aType:String):string;
    procedure FButImageRotateClockWiseClick( Sender: TObject );
    procedure FButImageRotateCounterclockwiseClick( Sender: TObject );
    function  FormingStrEmailTo(PropMSG:TPropMSG):Widestring;

    function  FReadPropertyMSG(oMail: TMail):TPropMSG;
    Function  ParseEML(fileName: WideString;TempPath:String):TPropMSG;
    Function  ParseMSG(fileName: WideString;TempPath:String):TPropMSG;
    Function  FGetPrepareHTML( oMail: TMail; TempPath:String ):Widestring;
    Function  FGetAttachmentHTML( oMail: TMail; TempPath:String ):TAttachmentFiles;
    function  GetIconFileName(FileName,TempPath:String):string;
   public

    procedure FBlankBrowser;
    procedure RefreshViewFile;
    procedure ResizePicView(Width,Height:Integer);
    procedure RefreshFilesDB( Path:String; Mask:array of String; OptViewFiles:TOptShowFiles= OptFiles; AutoViewFile:Boolean=true );
    procedure RotateImageHtmlByClockWise;
    procedure RotateImageHtmlByCounterClockWise;
    Function  ParseOutlookFile(fileName: WideString;TempPath:String):TPropMSG;

    function  GetSelectedFilePathRoot:Variant;
    function  GetSelectedFilePathDB  :Variant;
    function  GetSelectedFileNameDB  :Variant;
    procedure ShellExecuteSelectedFile;
    procedure AddFileToCurrPath(FromFileName:WideString;NewNameFileName:WideString='');
    procedure CopyDragDropFile( Adapter:TDataFormatAdapter );
    procedure CopyDragDropFileStream(Adapter:TDataFormatAdapter);
    procedure SetOptionView( ColumSizing:boolean=false;ColumnMove:Boolean=false;ColumnSorting:Boolean=true; HeightRow:Integer=18 );
    procedure SetViewRotatemagePanel(aPanel:TPanel;ButRotateCounterclockwise,ButRotateClockwise:TSpeedButton);

    constructor Create( ViewFiles:TcxGridDBTableView; WebBrowser:TWebBrowser;aPanelView:TPanel; BgHTMLColorWBrowser:String='ffffff'); overload;
    destructor Close;

   published
    property GetSelectedFilePath:String read FCurrPathToFile;
    property View: TcxGridDBTableView read FViewFiles;
  end;
procedure GetColumnsByFieldFromView(aView:TcxGRidDBTableView; masColField:array of String; var AfieldMasFilter:TMasCxColGrid);
Procedure SearchTextByViewByColumns(aView:TcxGridTableView;AColName:TMasCxColGrid; SearchText:Widestring;JustFromBeginStr:Boolean=false);
procedure CopyDropFile( Adapter:TDataFormatAdapter; PathFile:String; EventCopyFile:TEventCopyFile );
procedure CopyDropFileStream(Adapter:TDataFormatAdapter;PathFile:String; EventCopyFile:TEventCopyFile);

implementation

uses Types,DragDropFile, ExtStream, DragDropFormats, cxGridCustomView;

//******************************************************************************
constructor TViewFilesIE.Create( ViewFiles: TcxGridDBTableView; WebBrowser: TWebBrowser;aPanelView:TPanel; BgHTMLColorWBrowser:String='ffffff' );
begin
 self.FViewFiles := ViewFiles;
 self.FPreviewWebBrowser := WebBrowser;
 if self.FPreviewWebBrowser<>nil then self.FPreviewWebBrowser.RegisterAsBrowser:=true;

 if self.FViewFiles <> nil then
 begin
  FDatasetViewFile:= ViewFiles.DataController.DataSource.DataSet;
  FPersonalRecordChange:= self.FViewFiles.OnFocusedRecordChanged;
  self.FViewFiles.OnFocusedRecordChanged := FViewFilesFocusedRecordChanged;

  self.FViewFiles.OnCanFocusRecord := ViewScanDocNCanFocusRecord;
  self.FViewFiles.GetColumnByFieldName('FileName').OnCustomDrawCell := self.ViewFileNameCustomDrawCell;
  self.FViewFiles.OnCellDblClick := ViewFilesCellDblClick;
  FStyleInactive:= self.FViewFiles .Styles.Inactive;

 end;

 if self.FPreviewWebBrowser<>nil then
 begin
  self.FPreviewWebBrowser.OnDocumentComplete := WebBrFileViewDocumentComplete;
  self.FPreviewWebBrowser.OnDownloadComplete := WebBrFileViewDownloadComplete;
  FFolderTmp:= ExtractFilePath(Application.ExeName)+'_HtmlTMP_'+aPanelView.Name+'\';
 end;
 
 self.FPanelViewPic := aPanelView;
 if FPanelViewPic<>nil then
   self.FPanelViewPic.OnResize := self.PanelViewResize;

 FDefColorSelection :=clHighlight;
 FDefColorFontSelection :=clWhite;
 FColorBGBrowser := BgHTMLColorWBrowser;
 FBrowserCountLoadPage:=0;

 FTimerActive := TTimer.Create(nil);
 FTimerActive.Enabled:=false;
 self.FTimerActive.OnTimer :=FTimerTimerActiveControl;
 FRotateImageDeg:=0;
 FViewRotatemagePanel:=nil;

 CrackEaGetMail;
end;
//******************************************************************************
destructor TViewFilesIE.Close;
begin
 if self.FViewFiles<> nil then
   self.FViewFiles.OnFocusedRecordChanged := FPersonalRecordChange;

 FTimerActive.Free;
 if (FFolderTmp<>'')and(DirectoryExists( FFolderTmp )) then
   DelDir( FFolderTmp, '*.*' );
end;
//******************************************************************************
procedure TViewFilesIE.SetOptionView( ColumSizing:boolean=false;ColumnMove:Boolean=false; ColumnSorting:Boolean=true; HeightRow:Integer=18 );
begin
 self.FViewFiles.OptionsCustomize.ColumnMoving := ColumnMove;
 self.FViewFiles.OptionsCustomize.ColumnHorzSizing := ColumSizing;

 self.FViewFiles.OptionsCustomize.ColumnSorting   := ColumnSorting;

 self.FViewFiles.OptionsCustomize.ColumnGrouping  := false;
 self.FViewFiles.OptionsCustomize.ColumnFiltering := false;
 self.FViewFiles.OptionsView.HeaderHeight := HeightRow;
 self.FViewFiles.OptionsView.DataRowHeight:= HeightRow;

end;
//******************************************************************************
function TViewFilesIE.FReadPropertyMSG(oMail: TMail):TPropMSG;
var i, UBound: Integer;
    att: IAttachment;
    addr: IMailAddress;
    addrs, atts: OleVariant;
begin
  // Parse email sender
  Result.From.name:=Trim( oMail.From.Name );
  Result.From.email:= Trim( oMail.From.Address );
  addrs := oMail.ToAddr;
  UBound := VarArrayHighBound( addrs, 1 );

  SetLength( Result.EmailTo , UBound+1 );
  For i := 0 To UBound Do
  Begin
    addr:= IDispatch( VarArrayGet(addrs, i) ) As IMailAddress;
    Result.EmailTo[i].Name := addr.Name;
    Result.EmailTo[i].Email:= addr.Address;
  End;

  Result.Subject := Trim( oMail.Subject );

  Result.TextBody:= oMail.TextBody;
  Result.HtmlBody:= oMail.HtmlBody;
end;
//******************************************************************************
Function TViewFilesIE.ParseMSG(fileName: WideString;TempPath:String):TPropMSG;
var oMail: TMail;
    len:Integer;
begin
 try
    oMail := TMail.Create(Application);
    oMail.LicenseCode := 'TryIt';
    oMail.LoadOMSGFile( fileName );

    Result := FReadPropertyMSG( oMail );
    Result.Attachment := FGetAttachmentHTML( oMail, TempPath );
    Result.HTMLBody :=  FGetPrepareHTML( oMail,TempPath );
 finally
    oMail.Free;
 end;
end;
//******************************************************************************
Function TViewFilesIE.ParseEML(fileName: WideString;TempPath:String):TPropMSG;
var oMail: TMail;
    oTools: TTools;
Begin
 try
    oTools := TTools.Create(Application);
    oMail := TMail.Create(Application);
    oMail.LicenseCode := 'TryIt';
    oMail.LoadFile(fileName, false);
    
    Result:= FReadPropertyMSG(oMail);

    Result.Attachment := FGetAttachmentHTML( oMail, TempPath );
    Result.HTMLBody :=  FGetPrepareHTML( oMail, TempPath );
 finally
    oMail.Free;
 end;
end;
//******************************************************************************
Function TViewFilesIE.FGetPrepareHTML( oMail: TMail; TempPath:String ):Widestring;
var html, attname, tattname: WideString;
    atts: OleVariant;
    i,  UBound: Integer;
    att: IAttachment;
begin
    html := oMail.HtmlBody;
    atts := oMail.Attachments;

    UBound := VarArrayHighBound(atts, 1);
    If(UBound >= 0) Then
    Begin
        // Create a temporal folder to store attachments.
        if TempPath<>'' then
          ExistsDir(TempPath);

        For i:= 0 To UBound Do
        Begin
          att := IDispatch(VarArrayGet(atts, i)) As IAttachment;
          if TempPath<>'' then
          begin
            attname := TempPath + att.Name;
            att.SaveAs(attname, true);
          end;

          // show embedded images
          If att.ContentID <> '' Then
            html := StringReplace(html, 'cid:' + att.ContentID, attname, [rfReplaceAll, rfIgnoreCase]);
         // else
         // If Pos('image/', att.ContentType) = 1 Then
         //   html := html + '<hr><img src="' + attname + '">';
        End;
    End;

    result := html;
end;
//******************************************************************************
function TViewFilesIE.GetIconFileName(FileName,TempPath:String):string;
var bmp:TPicture;
    pic:TImage;
    ico:TICon;
    FileIco:String;
begin
  result:='';
  FileIco:=LeftStr(fileName, length(fileName) - 4)+'_ico.bmp';
  GetFileExtAssociatedIconSaveToFile( FileName,FileIco, true,false, 16, 16 );
  result:=FileIco;
end;
//******************************************************************************
Function TViewFilesIE.FGetAttachmentHTML( oMail: TMail; TempPath:String ):TAttachmentFiles;
var html, hdr: WideString;
    atts, tatts: OleVariant;
    i, x, UBound, XBound: Integer;
    att, tatt: IAttachment;
    len:Integer;
    CurrParsFile:WideString;
//*************************************************
function GetHtmlAttachFile(FileName:String):String;
var FileSizeHtml:String;
    FullFileName:string;

begin
 FullFileName:= TempPath + FileName;
 att.SaveAs(FullFileName, true);

 FileSizeHtml :=  FormatFloat('### ###.##', Ceil( MyGetFileSize( FullFileName ) / 1024 ) )+' КБ';

 result:='<div style="padding-left:2px;" > <img  align="top"  src="'+ GetIconFileName(FullFileName , TempPath)+'"'+'> '+
         '<a href="' +'file:///'+ FullFileName + '" target="_blank" >' + FileName +' ('+Trim(FileSizeHtml)+');  '+ '</a> </div> ';
end;
//*************************************************
begin
    if TempPath = '' then exit;
    
    html := oMail.HtmlBody;
    atts := oMail.Attachments;
    hdr  := '<div style="line-height: 18px;" >'+#13#10;
    // Parse attachment
    atts := oMail.Attachments;
    UBound := VarArrayHighBound(atts, 1);
    If(UBound >= 0) Then
    Begin
      //Create a temporal folder to store attachments.
      ExistsDir(TempPath);

      For i:= 0 To UBound Do
      Begin
        att := IDispatch( VarArrayGet(atts, i) ) As IAttachment;
        CurrParsFile := att.Name;
        ReplaseOn( CurrParsFile ,'?','');
        If LowerCase(CurrParsFile) = 'winmail.dat' Then
        Begin
            // this is outlook rtf (TNEF) attachment, decode it here
            tatts := oMail.ParseTNEF(att.Content, true);
            XBound := VarArrayHighBound(tatts, 1);
            For x:= 0 To XBound Do
            Begin
              tatt := IDispatch(VarArrayGet(tatts,x)) As IAttachment;
              //tattname := TempPath  + tatt.Name;
              //tatt.SaveAs(tattname, true);
              //hdr := hdr + '<a href="' + tattname + '" target="_blank" >' + tatt.Name + '</a> ';
              hdr := hdr +  GetHtmlAttachFile( CurrParsFile )+#13#10;
            End;
        End
      Else
      Begin
        if AnsiPos( CurrParsFile , html) = 0 then
        begin
          len := Length( result.Files );
          SetLength( result.Files , len + 1);
          result.Files[len]:= CurrParsFile;
          hdr := hdr +  GetHtmlAttachFile( CurrParsFile )+#13#10;
        end;
      End;
      End;
    End;
    hdr:=hdr+#13#10+'</div>';
    result.HTML:=hdr;
end;
//******************************************************************************
Function TViewFilesIE.ParseOutlookFile(fileName: WideString;TempPath:String):TPropMSG;
Begin
  if ( CompareText( ExtractFileExt(fileName) , '.msg')=0 ) then
    Result := ParseMSG(fileName,TempPath);
  if ( CompareText( ExtractFileExt(fileName) , '.eml')=0 ) then
    Result := ParseEML( fileName,TempPath );
End;
//******************************************************************************
function TViewFilesIE.FormingStrEmailTo(PropMSG:TPropMSG):Widestring;
var i:Integer;
begin
  Result:='';
  for i:= 0 to Length( PropMSG.EmailTo )-1 do
    Result:= result + PropMSG.EmailTo[i].Name +'&lt;'+ PropMSG.EmailTo[i].Email +'&gt;';
end;
//******************************************************************************
procedure TViewFilesIE.FTimerTimerActiveControl(Sender: TObject);
begin
  if Screen.ActiveControl<>nil then
    Screen.ActiveControl.parent.SetFocus;

  FTimerActive.Enabled:=false;
end;
//******************************************************************************
procedure TViewFilesIE.WebBrFileViewDocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
 inc(FBrowserCountLoadPage);

 if Screen.ActiveControl<>nil then
    Screen.ActiveControl.parent.SetFocus;

 //if (FileExists(URL)) then
 //  MyDeleteFile( URL );
   
 if FBrowserCountLoadPage = 2 then
 begin
   FTimerActive.Interval:=700;
   FTimerActive.Enabled:=true;
 end;
end;
//******************************************************************************
procedure TViewFilesIE.WebBrFileViewDownloadComplete(Sender: TObject);
begin
  if Screen.ActiveControl<>nil then
    Screen.ActiveControl.parent.SetFocus;
end;
//******************************************************************************
function TViewFilesIE.FCheckShowByWidthOrHeight( FileName:String ):Integer;
var pic:Timage;
    attrFile:Integer;
begin
 try
  pic:=TImage.Create(nil);
  attrFile := GetFileAttributes(PChar( FileName ));
  if FileExists(FileName)and(attrFile <> -1 ) then
  begin
    pic.Picture.LoadFromFile(FileName );
    if pic.Picture.Width > pic.Picture.Height then result:=0
    else result:=1;
  end else result:=-1;
 finally
  pic.Free;
 end;
end;
//******************************************************************************
procedure TViewFilesIE.FClearDataset;
begin
  try
   FDatasetViewFile.DisableControls;
   FDatasetViewFile.First;
   While not FDatasetViewFile.Eof do FDatasetViewFile.Delete;
  finally
   FDatasetViewFile.EnableControls;  
  end;
end;
//******************************************************************************
function TViewFilesIE.FFindFiles( Path:String;Mask:array of String; OptViewFiles:TOptShowFiles ):TStringList;
var i:Integer;
    ShowFolder:Boolean;
begin
  ShowFolder:=OptViewFiles <> OptFilesAndDirNoDir;

  result:=TStringList.Create;
  if ExtractFileName(Path) <> '' then
    result.Add( ExtractFileName( Path) )
  else
  begin

    for i:=0 to Length(Mask)-1 do
    begin
      if OptViewFiles = OptFiles then
        FindFile( Path, result, Mask[i], 1 );

      if OptViewFiles in [OptFilesAndDirNoDir, OptFilesAndDir,OptFilesAndDirExploer] then
        FindSubDirFiles( Path ,Mask[i],result,ShowFolder );
    end;

    if OptViewFiles in [OptFilesAndDirNoDir , OptFilesAndDir,OptFilesAndDirExploer] then result.Delete(0);
   end;
end;
//******************************************************************************
function TViewFilesIE.GetSelectedFilePathRoot:Variant;
begin
 result := FCurrPathToFile;
end;
//******************************************************************************
function TViewFilesIE.GetSelectedFilePathDB:Variant;
begin
  if FViewFiles.DataController.RecordCount = 0 then result:= null
  else
   result := CheckLastSleshOnPath( FDatasetViewFile.FieldByName('FilePath').AsString , true );
end;
//******************************************************************************
function TViewFilesIE.GetSelectedFileNameDB:Variant;
begin
  if FViewFiles.DataController.RecordCount = 0 then result:= null
  else
    result:= CheckLastSleshOnPath( FDatasetViewFile.FieldByName('FilePath').AsString, true) +
      FDatasetViewFile.FieldByName('FileName').AsString;

  if (result<>null) and (not FileExists( result )) then result:= null;
end;
//******************************************************************************
procedure TViewFilesIE.FBeginUpdateViewFiles;
begin
 self.FViewFiles.OnFocusedRecordChanged:=nil;
end;
//******************************************************************************
procedure TViewFilesIE.FEndUpdateViewFiles;
begin
 self.FViewFiles.OnFocusedRecordChanged := FViewFilesFocusedRecordChanged;
end;
//******************************************************************************
procedure TViewFilesIE.SetFocusRowView(aView:TcxGridDBTableView);
var IndFocusRow:Integer;
    i:integer;
begin
  IndFocusRow := aView.DataController.FocusedRecordIndex;
  if aView.ViewData.RecordCount <>0 then
     begin
       aView.ViewData.Rows[IndFocusRow].Focused:=true;
       aView.ViewData.Records[IndFocusRow].Selected:=true;
     end;
end;
//******************************************************************************
procedure TViewFilesIE.FSaveCurrPathMask( Path:String; Mask:array of String );
var i:integer;
begin
  FCurrPathToFile := CheckLastSleshOnPath( Path , True );
  SetLength(FCurrFileMask , Length(Mask) );
  for i:=0 to Length(Mask)-1 do FCurrFileMask[i]:= Mask[i];
end;
//******************************************************************************
procedure TViewFilesIE.FBlankBrowser;
begin
  if FPreviewWebBrowser = nil then Exit;
  
  FPreviewWebBrowser.Navigate('about:blank');
  while FPreviewWebBrowser.ReadyState < READYSTATE_INTERACTIVE do Application.ProcessMessages;
end;
//******************************************************************************
procedure TViewFilesIE.RefreshFilesDB( Path:String; Mask:array of String ; OptViewFiles:TOptShowFiles = OptFiles ; AutoViewFile:Boolean=true );
var i:Integer;
    List:TStringList;
    currParsePath:widestring;
    CurrFileName:String;
    bmp:TPicture;
    Stream : TMemoryStream;
    StreamBitm:TMemoryStream;
begin
 try
  self.FViewFiles.BeginUpdate;
  FBeginUpdateViewFiles;

  if not FDatasetViewFile.Active
    then FDatasetViewFile.Open;

  FSaveCurrPathMask( Path , Mask) ;
  FClearDataset;
  FBlankBrowser;
  FOptViewFiles:=OptViewFiles;
  if Path = '' then exit;
  //***********************************
  List := FFindFiles( Path , Mask , OptViewFiles);
  //***********************************
  Path:=ExtractFilePath(Path);
  for i:=0 to  List.Count-1 do
  begin
    if CompareText(List.Strings[i],'Thumbs.db')<>0 then
    begin
      FDatasetViewFile.Insert;
      CurrFileName:=ExtractFileName( List.Strings[i] );
      if OptViewFiles = OptFiles then
      begin
        FDatasetViewFile.FieldByName('FileName').AsString  := CurrFileName ;
        FDatasetViewFile.FieldByName('FilePath').AsString  := ExtractFilePath( Path );
        FDatasetViewFile.FieldByName('FileOpt').AsInteger  := 0; 
      end;

      if OptViewFiles in [OptFilesAndDirNoDir, OptFilesAndDir, OptFilesAndDirExploer] then
      begin

        if ExtractFileName(  List.Strings[i] ) <> '' then
        begin
          FDatasetViewFile.FieldByName('FileName').AsString  := CurrFileName;
          FDatasetViewFile.FieldByName('FileOpt').AsInteger  := 0;
        end
        else
        begin
         currParsePath:= ParsePath( List.Strings[i] , 2 , true );

         ReplaseON(currParsePath , '\','');
         FDatasetViewFile.FieldByName('FileOpt').AsInteger  := 1;
         FDatasetViewFile.FieldByName('FileName').AsString  :=  currParsePath;
        end;

        FDatasetViewFile.FieldByName('FilePath').AsString  := ExtractFilePath( List.Strings[i] );
      end;

      FDatasetViewFile.FieldByName('FileDate').AsDateTime:= GetFileDateTime( FDatasetViewFile.FieldByName('FilePath').AsString + CurrFileName ) ;
      FDatasetViewFile.FieldByName('FileType').AsString  := GetFileTypeStr(FDatasetViewFile.FieldByName('FilePath').AsString + CurrFileName );

      try
        StreamBitm:=GetFileExtAssociatedIconSaveToStrem( FDatasetViewFile.FieldByName('FilePath').AsString + CurrFileName , true,false,16,16 );
        StreamBitm.position:=0;
        FDatasetViewFile.FieldByName('ICON').asString:= BinaryStreamToString(StreamBitm);
      finally
       StreamBitm.Free;
      end;

      if FDatasetViewFile.FieldByName('FileOpt').AsInteger = 0 then
        FDatasetViewFile.FieldByName('FileSize').AsInteger := MyGetFileSize( FDatasetViewFile.FieldByName('FilePath').AsString + CurrFileName );

      if FDatasetViewFile.FieldByName('FileOpt').AsInteger = 1 then
       FDatasetViewFile.FieldByName('FileSize').AsInteger := MyGetFolderSize( FDatasetViewFile.FieldByName('FilePath').AsString );

      FDatasetViewFile.Post;
    end;
  end;
  if self.FViewFiles.DataController.RecordCount<>0 then
    self.FViewFiles.DataController.GotoFirst;
  //***********************************
 finally
  List.free;
  self.FViewFiles.EndUpdate;
  FEndUpdateViewFiles;

  if AutoViewFile then
   RefreshViewFile;

 end;
 FRotateImageDeg:=0;

end;
//******************************************************************************
function TViewFilesIE.FGetTypeHTMLObj:string;
var currTypeFile:string;
begin
 currTypeFile := LowerCase( ExtractFileExt( FDatasetViewFile.FieldByName('FileName').AsString ) );
 result:='EMBED';
 if currTypeFile = '.jpeg'then result:='IMG';
 if currTypeFile = '.jpg' then result:='IMG';
 if currTypeFile = '.bmp' then result:='IMG';
 if currTypeFile = '.pcx' then result:='IMG';
 if currTypeFile = '.gif' then result:='IMG';
 if currTypeFile = '.png' then result:='IMG';
 if currTypeFile = '.msg' then result:='MSG';
 if currTypeFile = '.eml' then result:='MSG';
end;
//******************************************************************************
function TViewFilesIE.FGetWidthHeight(aType:String):String;
var currFileName:String;
    RotateCompare:Integer;
begin
 if aType = 'IMG' then
 begin
   RotateCompare:=0;
   currFileName := GetSelectedFileNameDB;

   if FGetRotateNumber(FRotateImageDeg) in [0,2] then
   begin
     //if FCheckShowByWidthOrHeight( GetSelectedFileNameDB ) = 0 then
     result :='width="'+IntToStr(FPreviewWidth - 21)+'px" ';
     //else result :='height="'+IntToStr(FPreviewHeight - 10)+'px" ';
   end;

   if FGetRotateNumber(FRotateImageDeg) in [1,3] then
     result :='height="'+IntToStr(FPreviewWidth - 21)+'px" '
     //result :='width="'+IntToStr(FPreviewWidth - 20)+'px" '
 end
  else
   result:= 'width="'+IntToStr(FPreviewWidth -5)+'px"  height="'+IntToStr(FPreviewHeight-5)+'px"';
end;
//******************************************************************************
procedure TViewFilesIE.ResizePicView(Width,Height:Integer);
var ElemViewPic: IHTMLElement;
begin
  if FPreviewWebBrowser.Document= nil then exit;
  if GetSelectedFileNameDB = null then exit;
  ElemViewPic := (FPreviewWebBrowser.Document as IHTMLDocument3).getElementById('idPicPreviev');

  if ElemViewPic = nil then exit;

  if AnsiUpperCase(ElemViewPic.tagName) = 'IMG' then
  begin
    if FGetRotateNumber(FRotateImageDeg) in [0,2] then
     begin
       ElemViewPic.setAttribute('Width', Width - 21 , 0);
       ElemViewPic.removeAttribute('Height', 0);
      {if FCheckShowByWidthOrHeight( GetSelectedFileNameDB ) = 0 then
      begin
        ElemViewPic.setAttribute('Width', Width - 10 , 0);
        ElemViewPic.removeAttribute('Height', 0);
      end
       else
       begin
         ElemViewPic.setAttribute('Height',Height , 0 );
         ElemViewPic.removeAttribute('Width', 0);
       end;}
    end;

    if FGetRotateNumber(FRotateImageDeg) in [1,3] then
    begin
      //ElemViewPic.setAttribute('Width',Height-10 , 0 );
      //ElemViewPic.removeAttribute('Height', 0);
      ElemViewPic.setAttribute('Height', Width - 21 , 0);
      ElemViewPic.removeAttribute('Width', 0);
    end;

  end
  else
   begin
     ElemViewPic.setAttribute('Width', Width - 5, 0);
     ElemViewPic.setAttribute('Height',Height - 5, 0);
   end;
end;
//******************************************************************************
procedure TViewFilesIE.RotateImageHtmlByClockWise;
var ElemViewPic:IHTMLElement;
    currDeg:Variant;
    ElImg:IHTMLImgElement;
    img : IHTMLImgElement ;
    rnd : IHTMLElementRender ;
    pic : TImage;
    doc:HTMLDocument;
    css:IHTMLStyleSheet;
begin
  FRotateImageDeg:=FRotateImageDeg+90;
  if FRotateImageDeg >=360 then FRotateImageDeg :=0;
  if FRotateImageDeg <=-360 then FRotateImageDeg :=0;

  RefreshViewFile;
end;
//******************************************************************************
procedure TViewFilesIE.RotateImageHtmlByCounterClockWise;
begin
  FRotateImageDeg:=FRotateImageDeg-90;
  if FRotateImageDeg >=360 then FRotateImageDeg :=0;
  if FRotateImageDeg <=-360 then FRotateImageDeg :=0;

  RefreshViewFile;
end;
//******************************************************************************
Function TViewFilesIE.FGetRotateNumber(Angle:Integer):Integer;
begin
  result:=0;
  if (Angle = 0 ) or (Angle = 360) then result:=0;
  if (Angle = 90 ) then result := 1;
  if (Angle = -180 ) or (Angle = 180 ) then result := 2;
  if (Angle = -90 )  or (Angle = 270 ) then result := 3;
  if (Angle = -270 ) then result := 1;
  if (Angle = -360 ) then result := 0;
end;
//******************************************************************************
Function TViewFilesIE.FGetStyleRotate(aType:String):string;
begin
 result:='';
 if aType = 'IMG' then
   result:='filter:progid:DXImageTransform.Microsoft.BasicImage(Rotation='+IntToStr(FGetRotateNumber(FRotateImageDeg))+');'
end;
//******************************************************************************
Function TViewFilesIE.FGenHTMLForSelectedFile(TempPath:String):TStringList;
var i:Integer;
    cType:string;
    PropMSG:TPropMSG;
    TextBody:TStringList;
    //FolderTmp:string;
begin
 cType :=FGetTypeHTMLObj;
 result:=TStringLIst.Create;
 
 result.Add('<HTML>');
 result.Add('<head>');
 result.Add('<meta http-equiv="Content-Type" content="text/html;charset=windows-1251">');
 result.Add('</head>');

 result.Add('<body style=" overflow:hidden; margin:0; padding:0; background-color:'+FColorBGBrowser+'" >');
 if ( cType <> '' ) and ( GetSelectedFileNameDB<>null ) then
 begin

   if cType<>'MSG' then
   begin
     if cType = 'IMG' then result.Add('<div style="overflow-y: scroll; Height:100%"> ');
     result.Add('   <'+cType+' id="idPicPreviev" '+' src="' + GetSelectedFileNameDB + '" '+FGetWidthHeight( cType )+' style="margin:0; padding:0;'+FGetStyleRotate( cType )+'" /> ');
     if cType = 'IMG' then result.Add('</div>');
   end
    else
    begin
      TextBody:=TStringList.Create;
      try

        PropMSG := Self.ParseOutlookFile( GetSelectedFileNameDB , TempPath );
        TextBody.Text :=PropMSG.TextBody;
        ReplaseOn(PropMSG.HTMLBody,'<html><body>','');
        ReplaseOn(PropMSG.HTMLBody,'</body></html>','');

        result.Add('<div style="font-family:MS Sans Serif,Arial; color:black; font-size:12; overflow-y:scroll;height:100% ">');
        result.Add('<div><b>Від:</b> ' + PropMSG.From.name + ' &lt;' +PropMSG.From.email + '&gt; ' + '</div> ');
        result.Add('<div><b>Кому:</b> '+ FormingStrEmailTo( PropMSG ) + '</div>');
        result.Add('<div><b>Тема:</b> '+ PropMSG.Subject + '</div> ');
        result.Add('<div><b>Вкладення:</b> '+ PropMSG.Attachment.HTML +'<hr>' + '</div>');


        //result.Add('<div> ');
        result.Add('<div  >' + PropMSG.HTMLBody + '</div> ');
        result.Add('</div>');
      finally
        TextBody.Free;
      end;

    end;

 end;
 result.Add('</body>');
 result.Add('</HTML>');
end;
//******************************************************************************
function TViewFilesIE.FWB_GetHTMLCode(WebBrowser: TWebBrowser; ACode: TStrings): Boolean;
var
  ps: IPersistStreamInit;
  ss: TStringStream;
  sa: IStream;
begin
  ps := FPreviewWebBrowser.Document as IPersistStreamInit;
  ss := TStringStream.Create('');
  try
    sa := TStreamAdapter.Create( ss, soReference ) as IStream;
    Result := Succeeded(ps.Save( sa, True ));
    if Result then ACode.Text := ss.DataString;
  finally
    ss.Free;
  end;
end;
//******************************************************************************
procedure TViewFilesIE.FWB_SetHTMLCode(WebBrowser: TWebBrowser; HTMLCode: string);
var
  sl: TStringList;
  ms: TMemoryStream;
begin
  if WebBrowser = nil then Exit;
  FBlankBrowser;
  //***********************************
  if Assigned(WebBrowser.Document) then
  begin
    sl := TStringList.Create;
    try
      ms := TMemoryStream.Create;
      try
        sl.Text := HTMLCode;
        sl.SaveToStream(ms);
        ms.Seek( 0, 0 );
        (WebBrowser.Document as IPersistStreamInit).Load(TStreamAdapter.Create(ms));
      finally
        ms.Free;
      end;
    finally
      sl.Free;
    end;
  end;
end;
//******************************************************************************
procedure TViewFilesIE.FReadWidthHeightViewPic;
begin
 if FPanelViewPic <> nil then
   begin
     FPanelViewPic.Realign; 
     self.FPreviewWidth :=  FPanelViewPic.Width ;
     self.FPreviewHeight := FPanelViewPic.Height ;
   end;
end;
//******************************************************************************
procedure TViewFilesIE.RefreshViewFile;
var HtmlList:TStringList;
    cType:String;
    //FileHtml:String;
    Uid: TGuid;
begin
  if self.FPreviewWebBrowser = nil then exit;

  try
   FBrowserCountLoadPage:=0;
   //*******************
   if self.FViewRotatemagePanel<>nil then
   begin
     cType :=FGetTypeHTMLObj;
     self.FViewRotatemagePanel.Visible:= (cType = 'IMG');
   end;
   //*******************
   FReadWidthHeightViewPic;

   if FileExists( FileHtml ) then MyDeleteFile( FileHtml );
   
   CreateGuid(Uid);
   FileHtml := FFolderTmp+GuidToString(Uid)+'.html';
   try

    DelAllFilesFromDir( FFolderTmp, '*.*');
    ExistsDir( FFolderTmp );

    HtmlList := FGenHTMLForSelectedFile( FFolderTmp );

    HtmlList.SaveToFile( FileHtml );
    while FPreviewWebBrowser.ReadyState < READYSTATE_INTERACTIVE do Application.ProcessMessages;
    self.FPreviewWebBrowser.Navigate( FileHtml );
    while FPreviewWebBrowser.ReadyState < READYSTATE_INTERACTIVE do Application.ProcessMessages;
    //FWB_SetHTMLCode(self.FPreviewWebBrowser, HtmlList.Text);

   except
   end;

  finally
   HtmlList.free;
  end;
end;
//******************************************************************************
procedure TViewFilesIE.FViewFilesFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
 if @FPersonalRecordChange<> nil then
   FPersonalRecordChange(Sender,APrevFocusedRecord,AFocusedRecord,ANewItemRecordFocusingChanged);

 FRotateImageDeg:=0;

 if self.FPreviewWebBrowser <> nil then
   RefreshViewFile;
end;
//******************************************************************************
procedure TViewFilesIE.ViewScanDocNCanFocusRecord(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; var AAllow: Boolean);
begin
 //FViewFilesFocusedRecordChanged( Sender, ARecord, ARecord, true);
end;
//******************************************************************************
function TViewFilesIE.FGetImageRect( ACanvas: TcxCanvas;Text:WideString;ImageWidth:Integer; Alignment:TAlignment;var ATextRect: TRect): TRect;
const ImageTextOffset = 2;
var ATextWidth: Integer;
begin
  Result := ATextRect;
  ATextWidth := ACanvas.TextWidth( Text );
  case Alignment of
    taLeftJustify:
      ATextRect.Left := Result.Left + ImageWidth + ImageTextOffset;
    taRightJustify:
    begin
      Result.Left := ATextRect.Right - ATextWidth - ImageWidth - ImageTextOffset;
      if Result.Left < ATextRect.Left then
      begin
        Result.Left := ATextRect.Left;
        Inc(ATextRect.Left, ImageWidth + ImageTextOffset);
      end;
    end;
    taCenter:
    begin
      Result.Left := ATextRect.Left + ((ATextRect.Right - ATextRect.Left) - ImageWidth - ImageTextOffset - ATextWidth) div 2;
      if Result.Left < ATextRect.Left then
      begin
        Result.Left := ATextRect.Left;
      end;
      Inc(ATextRect.Left, ImageWidth + ImageTextOffset);
    end;
  end;
  ATextRect.Right:= ATextRect.Right + ( result.Right - result.Left);
end;
//******************************************************************************
function TViewFilesIE.FGetSelectionColor(Sender: TcxCustomGridTableView):TcxStyle;
begin
 if  TcxGrid( TcxGridLevel(TcxGridDBTableView(Sender).Level).Control).IsFocused then
 begin
   if TcxGridDBTableView(Sender).Styles.Selection<>nil then
     result:=TcxGridDBTableView(Sender).Styles.Selection
   else
     result:=nil;
 end
 else
    if TcxGridDBTableView(Sender).Styles.Inactive<>nil then
     result:=TcxGridDBTableView(Sender).Styles.Inactive
   else
     result:=nil;
end;
//******************************************************************************
function TViewFilesIE.FGetColorSelection(Sender: TcxCustomGridTableView):TColor;
var Style:TcxStyle;
begin
 Style:=FGetSelectionColor(Sender);
 if Style<> nil then
   result := Style.Color
    else result := FDefColorSelection;
end;
//******************************************************************************
function TViewFilesIE.FGetColorFontSelection(Sender: TcxCustomGridTableView):TColor;
var Style:TcxStyle;
begin
 Style:=FGetSelectionColor(Sender);
 if Style<> nil then
   result:=Style.TextColor
    else result := FDefColorFontSelection;
end;
//******************************************************************************
procedure TViewFilesIE.ViewFileNameCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
const WidthPic = 16;
      HeightPic = 16;
var ATextRect: TRect;
    ImageRect: TRect;
    CurrFileName:string;
    CurrFilePath:string;

    CurrOptFile:Integer;
    Bmp: TPicture;
    CurrValuePic:String;
    Stream : TMemoryStream;
    p:pointer;

    BitMap : Graphics.TBitMap;
begin
  ATextRect:= AViewInfo.TextAreaBounds;
  ImageRect:= FGetImageRect( ACanvas,AViewInfo.Text, WidthPic , taLeftJustify , ATextRect );
  ATextRect.Left:= ATextRect.Left + 1;
  
  if ( AViewInfo.GridRecord.Focused )and( AViewInfo.GridRecord.Selected ) then
  begin
   if (FStyleInactive<>nil)and(FStyleInactive = Sender.Styles.Inactive) then
   begin
     ACanvas.Font.Color := self.FDefColorFontSelection;
   end;
   ACanvas.FillRect(AViewInfo.Bounds , self.FGetColorSelection(sender) );
  end
  else
    ACanvas.FillRect( AViewInfo.Bounds , ACanvas.Brush.Color );

 CurrFilePath := AViewInfo.GridRecord.Values[ self.FViewFiles.GetColumnByFieldName('FilePath').Index ];
 CurrFileName := AViewInfo.GridRecord.Values[ self.FViewFiles.GetColumnByFieldName('FilePath').Index ] + AViewInfo.Value;
 CurrOptFile  := AViewInfo.GridRecord.Values[ self.FViewFiles.GetColumnByFieldName('FileOpt').Index  ];

 CurrValuePic := AViewInfo.GridRecord.Values[ self.FViewFiles.GetColumnByFieldName('ICON').Index  ];
 try
   Stream := TMemoryStream.Create;
   Stream.Position := 0;
   StringToBinaryStream( CurrValuePic, Stream );

   BitMap := Graphics.TBitMap.Create;
   BitMap.LoadFromStream( Stream );
   BitMap.Transparent:=true;

   ACanvas.Draw( ImageRect.Left, ImageRect.Top + (ImageRect.Bottom - ImageRect.Top - HeightPic) div 2 , BitMap );
   ACanvas.DrawTexT( AViewInfo.DisplayValue , ATextRect ,0, True);

 finally
   BitMap.free;
   Stream.Free;
 end;
 ADone:=True;
end;
//******************************************************************************
procedure TViewFilesIE.ShellExecuteSelectedFile;
begin
  if self.GetSelectedFileNameDB <> null then
    ShellExecuteA( TForm(self.FViewFiles.Site.GridView.Owner).Handle, 'open', PAnsiChar(string(self.GetSelectedFileNameDB)), nil, nil, SW_SHOWNORMAL ) ;
end;
//******************************************************************************
procedure TViewFilesIE.ViewFilesCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var FileOpt:variant;
    CurrFilePath:String;
begin
  FileOpt:= ACellViewInfo.GridRecord.Values[ self.FViewFiles.GetColumnByFieldName('FileOpt').Index ];
  if FileOpt = 0 then
    ShellExecuteSelectedFile
  else
  if FileOpt = 1 then
  begin
    if FOptViewFiles = OptFilesAndDirExploer then
    begin
      CurrFilePath := ACellViewInfo.GridRecord.Values[ self.FViewFiles.GetColumnByFieldName('FilePath').Index ];
      self.RefreshFilesDB( CurrFilePath , ['*.*'], FOptViewFiles  );
    end;  
  end;
end;
//******************************************************************************
procedure TViewFilesIE.PanelViewResize(Sender: TObject);
begin
 if FPanelViewPic<>nil then
   ResizePicView( self.FPanelViewPic.Width , self.FPanelViewPic.Height );
end;
//******************************************************************************
procedure TViewFilesIE.AddFileToCurrPath(FromFileName:WideString;NewNameFileName:WideString='');
var AColName:TMasCxColGrid;
    FileCopyTo:string;
begin
  if FCurrPathToFile<>'' then
  begin
    if NewNameFileName ='' then
      NewNameFileName := ExtractFileName(FromFileName);

    FileCopyTo:= FCurrPathToFile + NewNameFileName;
    FileCopyTo := GetNewIndexFileName( FileCopyTo );

    if MyCopyFile( FromFileName , FileCopyTo ) then
    begin
      self.RefreshFilesDB( FCurrPathToFile , FCurrFileMask );
      GetColumnsByFieldFromView(self.FViewFiles ,['FileName'], AColName);
      NewNameFileName:=ExtractFileName(FileCopyTo);
      SearchTextByViewByColumns( self.FViewFiles, AColName , NewNameFileName, true);
    end;
  end;
end;
//******************************************************************************
procedure TViewFilesIE.CopyFile(FileName:String);
var TempDir:string;
begin
  TempDir := ExtractFilePath(Application.ExeName)+'_TempCopyFile\';
  try
    ExistsDir( TempDir );

    MyCopyAndUnBlockFile( FileName , TempDir );
    self.AddFileToCurrPath( TempDir + ExtractFileName( FileName) );
  finally
    DelDir( TempDir , '*.*' );
  end;
end;
//******************************************************************************
procedure TViewFilesIE.CopyDragDropFileStream(Adapter:TDataFormatAdapter);
begin
  CopyDropFileStream( Adapter , self.GetSelectedFilePath , self.CopyFile  );
end;
//******************************************************************************
procedure TViewFilesIE.CopyDragDropFile( Adapter:TDataFormatAdapter );
begin
  CopyDropFile( Adapter , self.GetSelectedFilePath , self.CopyFile );
end;
//******************************************************************************
procedure GetColumnsByFieldFromView(aView:TcxGRidDBTableView; masColField:array of String; var AfieldMasFilter:TMasCxColGrid);
var i:integer;
    CurrIndcol:integer;
begin
 for i:=0 to length(masColField)-1 do
     begin
      CurrIndcol:= aView.GetColumnByFieldName(masColField[i]).Index;
      if CurrIndcol<>-1 then
         begin
           Setlength(AfieldMasFilter,Length(AfieldMasFilter)+1);
           AfieldMasFilter[Length(AfieldMasFilter)-1]:=aView.Columns[CurrIndcol];
         end;
     end;
end;
//******************************************************************************
Procedure SearchTextByViewByColumns(aView:TcxGridTableView;AColName:TMasCxColGrid; SearchText:Widestring;JustFromBeginStr:Boolean=false);
var FocusedRowIndex:Integer;
//*******************************************************
Function SearchTextByFocus(CurrFocusRow:Integer):boolean;
var i,j:integer;
    CurrValue:variant;
    CurrValueStr:widestring;
begin
  SearchText:=AnsiLowerCase(SearchText);
  result:=false;
  for i:=CurrFocusRow to aView.ViewData.RecordCount-1 do
  begin
    for j:=0 to Length(AColName)-1 do
    begin
     CurrValue:=Aview.ViewData.Records[i].DisplayTexts[AColName[j].Index];
     if CurrValue=null then CurrValueStr:=''
        else CurrValueStr:=CurrValue;

     CurrValueStr:=AnsiLowerCase(CurrValueStr);
     if (((not JustFromBeginStr)and(AnsiPos(SearchText,CurrValueStr)<>0))or
        ((JustFromBeginStr)and( CompareText(Copy(CurrValueStr,1,Length(SearchText)),SearchText)=0) ))  and(FocusedRowIndex<>i) then
     begin
       aView.DataController.FocusedRowIndex:=i;
       result:=true;
       break;
     end;
    end;
    if result then break;
  end;
end;
//*******************************************************
begin
  FocusedRowIndex:=aView.DataController.FocusedRowIndex;
  if FocusedRowIndex<0 then FocusedRowIndex:=0;

  if not SearchTextByFocus(FocusedRowIndex) then    // cycle
     SearchTextByFocus(0);
end;
//******************************************************************************
procedure CopyDropFileStream(Adapter:TDataFormatAdapter;PathFile:String; EventCopyFile:TEventCopyFile);
var FileName: string;
  i: integer;
  Stream: iStream;
  StatStg: TStatStg;
  BufferSize: longInt;
  fs: tfilestream;
  aOut : TExternStream;
  TempDir:String;
begin
  if not (Adapter.DataFormat is  TVirtualFileStreamDataFormat) then exit;

  for i :=0 to TVirtualFileStreamDataFormat(Adapter.DataFormat).FileNames.Count-1 do
  begin
    FileName := TVirtualFileStreamDataFormat(Adapter.DataFormat).FileNames[i];
    Stream := TVirtualFileStreamDataFormat(Adapter.DataFormat).FileContentsClipboardFormat.GetStream(i);

    if (Stream <> nil) then
    begin
      Stream.Stat(StatStg, STATFLAG_NONAME);
      BufferSize := StatStg.cbSize;
      aOut := TExternStream.Create(Stream);
      TempDir := ExtractFilePath(Application.ExeName)+'_TempStream\';
      FileName:= ExtractFileName( FileName );
      try
        ExistsDir( TempDir );
        //****************************
        fs := TFilestream.create( TempDir + FileName, fmCreate);
        try
          fs.copyfrom( aOut, BufferSize );
        finally
          fs.free;
          aOut.Free;
        end;
        //****************************
        EventCopyFile( TempDir + FileName );
      finally
       DelDir( TempDir , '*.*' );
      end;
    end;
  end;  
end;
//******************************************************************************
procedure CopyDropFile( Adapter:TDataFormatAdapter; PathFile:String; EventCopyFile:TEventCopyFile );
var i:Integer;
begin
 if not (Adapter.DataFormat is  TFileDataFormat) then exit;

 for i := 0 to TFileDataFormat(Adapter.DataFormat).Files.Count-1 do
   EventCopyFile( TFileDataFormat(Adapter.DataFormat).Files[i] );
end;
//******************************************************************************
procedure TViewFilesIE.FButImageRotateCounterclockwiseClick(
  Sender: TObject);
begin
 self.RotateImageHtmlByCounterClockWise;
end;
//******************************************************************************
procedure TViewFilesIE.FButImageRotateClockWiseClick(Sender: TObject);
begin
 self.RotateImageHtmlByClockWise;
end;
//******************************************************************************
procedure TViewFilesIE.SetViewRotatemagePanel(aPanel: TPanel;ButRotateCounterclockwise,ButRotateClockwise:TSpeedButton);
begin
 Self.FViewRotatemagePanel:=aPanel;
 ButRotateCounterclockwise.OnClick := FButImageRotateCounterclockwiseClick;
 ButRotateClockwise.OnClick :=  FButImageRotateClockWiseClick;
end;
//******************************************************************************
end.

//Rotate Image
//http://samples.msdn.microsoft.com/workshop/samples/author/filter/BasicImage.htm


// ActiveX MSG Outlook
// https://www.emailarchitect.net/eagetmail/ex/d/17.aspx#delphi-parse-outlook-msg-file-msg-example




