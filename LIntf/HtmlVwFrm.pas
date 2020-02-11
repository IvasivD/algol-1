unit HtmlVwFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZDlg, OleCtrls, SHDocVw, MSHTML_TLB, StdCtrls, Buttons, ExtCtrls,
  ImgList, ActnList, Menus, ShellAPI, OrderUn;

type
  THtmlViewForm = class(TZDialog)
    WebBrowser: TWebBrowser;
    PrintBtn: TBitBtn;
    ActionList: TActionList;
    PrintAction: TAction;
    SendFaxAction: TAction;
    SendMailAction: TAction;
    SaveAsAction: TAction;
    PopupMenu: TPopupMenu;
    ImageList: TImageList;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    SendFaxBtn: TBitBtn;
    SendMailBtn: TBitBtn;
    SaveAsBtn: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure PrintActionExecute(Sender: TObject);
    procedure SaveAsActionExecute(Sender: TObject);
    procedure SendMailActionExecute(Sender: TObject);
    procedure WebBrowserBeforeNavigate2(Sender: TObject; const pDisp: IDispatch;
      var URL, Flags, TargetFrameName, PostData, Headers: OleVariant; var Cancel: WordBool);
    procedure WebBrowserNavigateComplete2(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FConfirmMessage: String;
    FContactMail: String;
    FContactMailCC: string;
    FHtmlDocStyle: String;
    FHtmlPath: String;
    FHtmlTitle: String;
    FIsSimple: Boolean;
    FMailAttach: TStrings;
    FManagerName: String;
    FModalForm: Boolean;
    FPrinted: Boolean;
    FReferOrderId: Integer;
    FTemplateFile: String;
    FSendResult: Boolean;
    FSend: Boolean;
    FConvertMailToPDF: Boolean;
    FGetPathFile: TGetPathFile;
    FManSignature: string;
    function DoSave: Boolean;
    function GetHtmlContent: String;
    function GetHtmlDocument: IHTMLDocument2;
    function GetReferOrder: Boolean;
    procedure PrintDocument;
    function SaveHtmlContent(const FileName: String): Boolean;
    function SendDocumentByMail(
      const Subject, Recip, RecipCC, Body: String; Attach: TStrings): Boolean;
    procedure SetHtmlContent(const Value: String);
    procedure SetModalForm(const Value: Boolean);
    procedure ToggleActions(En: Boolean);
    procedure ConvertToPDF(const AWnd: HWND; const AOperation, AFileName: String; 
      const AParameters: String = ''; const ADirectory: String = ''; 
      const AShowCmd: Integer = SW_SHOWNORMAL);
  protected
  public
    function ShowDocument(const DocTitle, DocBody: String): Boolean;
    property ConfirmMessage: String read FConfirmMessage write FConfirmMessage;
    property ContactMail: String read FContactMail write FContactMail;
    property ContactMailCC: String read FContactMailCC write FContactMailCC;
    property HtmlContent: String read GetHtmlContent write SetHtmlContent;
    property HtmlDocument: IHTMLDocument2 read GetHtmlDocument;
    property HtmlDocStyle: String read FHtmlDocStyle write FHtmlDocStyle;
    property IsSimple: Boolean read FIsSimple write FIsSimple;
    property ManagerName: String read FManagerName write FManagerName;
    property ModalForm: Boolean read FModalForm write SetModalForm;
    property Printed: Boolean read FPrinted write FPrinted;
    property ReferOrder: Boolean read GetReferOrder;
    property ReferOrderId: Integer read FReferOrderId write FReferOrderId;
  end;

{var
  HtmlViewForm: THtmlViewForm;}

function ExecuteReportViewForm(
  const ATitle, HtmlText, AContact, AContactCC: String;
  Modal: Boolean = False; RefOrder: Integer = 0): Boolean; overload;
function ExecuteReportViewForm(
  const ATitle, HtmlPath, PostData, AStyle, AContact, AContactCC: String;
  Modal: Boolean = False; RefOrder: Integer = 0; Attach: TStrings = nil): Boolean; overload;
function ExecuteReportViewForm(
  const ATitle, HtmlText, HtmlPath, PostData, AStyle, AContact, AContactCC: String;
  Modal: Boolean = False; RefOrder: Integer = 0; Attach: TStrings = nil): Boolean; overload;
function ExecuteReportViewForm(
  const ATitle, HtmlText, HtmlPath, PostData, AStyle, AContact, AContactCC, AConfirm: String;
  Modal: Boolean = False; RefOrder: Integer = 0; Attach: TStrings = nil;
  ConvertMailToPDF: Boolean = False; aGetPathFile: TGetPathFile = nil; 
  aManSignature: string = ''): Boolean; overload;
function ExecuteReportViewFormEx(
  const ATitle, HtmlText, AStyle, AContact, AContactCC: String;
  Modal: Boolean = False; RefOrder: Integer = 0): Boolean; overload;
function ExecuteReportViewFormEx(
  const ATitle, HtmlText, HtmlPath, AStyle, AContact, AContactCC: String;
  Modal: Boolean = False; RefOrder: Integer = 0): Boolean; overload;
function ExecuteReportViewFormEx(
  const ATitle, HtmlText, HtmlPath, AStyle, AContact, AContactCC, AConfirm: String;
  Modal: Boolean = False; RefOrder: Integer = 0;
  ConvertMailToPDF: Boolean = False; Attach: TStrings = nil; 
  aGetPathFile: TGetPathFile = nil): Boolean; overload;


implementation

uses ActiveX, Registry, {DataMod,} OptSet, TourConsts, MailSndFrm, MailUn,
  TourCmnlIf, eso;

{$R *.dfm}

function ExecuteReportViewForm(
  const ATitle, HtmlText, AContact, AContactCC: String;
  Modal: Boolean = False; RefOrder: Integer = 0): Boolean;
begin
  Result := ExecuteReportViewForm(
    ATitle, HtmlText, '', '', '', AContact, AContactCC, Modal, RefOrder);
end;

function ExecuteReportViewFormEx(
  const ATitle, HtmlText, AStyle, AContact, AContactCC: String;
  Modal: Boolean = False; RefOrder: Integer = 0): Boolean;
begin
  Result := ExecuteReportViewForm(
    ATitle, HtmlText, '', '', AStyle, AContact, AContactCC, Modal, RefOrder);
end;

function ExecuteReportViewFormEx(
  const ATitle, HtmlText, HtmlPath, AStyle, AContact, AContactCC: String;
  Modal: Boolean = False; RefOrder: Integer = 0): Boolean; overload;
begin
  Result := ExecuteReportViewForm(
    ATitle, HtmlText, HtmlPath, '', AStyle, AContact, AContactCC, Modal, RefOrder);
end;

function ExecuteReportViewFormEx(
  const ATitle, HtmlText, HtmlPath, AStyle, AContact, AContactCC, AConfirm: String;
  Modal: Boolean = False; RefOrder: Integer = 0;
  ConvertMailToPDF: Boolean = False; Attach: TStrings = nil; 
  aGetPathFile: TGetPathFile = nil): Boolean; overload;
begin
  Result :=
    ExecuteReportViewForm(
      ATitle, HtmlText, HtmlPath, '', AStyle, AContact, AContactCC, AConfirm, Modal,
      RefOrder, Attach{nil}, ConvertMailToPDF, aGetPathFile);
end;

function ExecuteReportViewForm(
  const ATitle, HtmlPath, PostData, AStyle, AContact, AContactCC: String;
  Modal: Boolean = False; RefOrder: Integer = 0; Attach: TStrings = nil): Boolean;
begin
  Result := ExecuteReportViewForm(
    ATitle, '', HtmlPath, PostData, AStyle, AContact, AContactCC, Modal, RefOrder, Attach);
end;

function ExecuteReportViewForm(
  const ATitle, HtmlText, HtmlPath, PostData, AStyle, AContact, AContactCC: String;
  Modal: Boolean = False; RefOrder: Integer = 0; Attach: TStrings = nil): Boolean;
begin
  Result :=
    ExecuteReportViewForm(
      ATitle, HtmlText, HtmlPath, PostData, AStyle, AContact, AContactCC, '', Modal, RefOrder, Attach);
end;

const
  sHtmlMask =
    '<!DOCTYPE HTML><HTML><HEAD><TITLE>%s</TITLE>' +
    '<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">' +
    '</HEAD><BODY bgcolor="#FFFFFF">%s</BODY></HTML>';

{$DEFINE Browse_Presaved_Text}

{$IFDEF Browse_Presaved_Text}
{$WARN UNSAFE_TYPE OFF}
function ExecuteReportViewForm(
  const ATitle, HtmlText, HtmlPath, PostData, AStyle, AContact, AContactCC, AConfirm: String;
  Modal: Boolean = False; RefOrder: Integer = 0; Attach: TStrings = nil;
  ConvertMailToPDF: Boolean = False; aGetPathFile: TGetPathFile = nil; 
  aManSignature: string = ''): Boolean;
var
  Flags, Frame, Post, Head: OleVariant;
  B: array of Byte;
  I: Integer;
  ResPath: String;
  F: TextFile;
  P: PChar;
begin
  with THtmlViewForm.Create(Application) do
    try
      Caption := ATitle;
      ReferOrderId := RefOrder;
      FHtmlTitle := ATitle;
      HtmlDocStyle := AStyle;
      FMailAttach := Attach;
      Flags := navNoHistory;
      Frame := null;
      FConvertMailToPDF := ConvertMailToPDF;
      FGetPathFile := aGetPathFile;
      FManSignature := aManSignature;
      if HtmlPath <> '' then
      begin
        FHtmlPath := HtmlPath;
        SetLength(B, Length(PostData));
        for I := 1 to Length(PostData) do B[Pred(I)] := Ord(PostData[I]);
        Post := B;
        Head := 'Content-Type: application/x-www-form-urlencoded'#10#13;
        ResPath := FHtmlPath;
      end
      else begin
        P := StrAlloc(MAX_PATH + 1);
        try
          if GetTempFileName(PChar(ExtractFilePath(Application.ExeName)), 'tmp', 0, P) <> 0
          then begin
            FHtmlPath := ExpandFileName(P);
            AssignFile(F, FHtmlPath);
            Rewrite(F);
            Writeln(F, Format(sHtmlMask, [ATitle, HtmlText]));
            CloseFile(F);
            ResPath := 'file://' + FHtmlPath;
            //WebBrowser.Navigate('file://' + FHtmlPath);
          end
          else HtmlDocument.body.innerHTML := HtmlText;
        finally
          StrDispose(P);
        end;
        Post := null;
        Head := '';
      end;
      WebBrowser.Navigate({FHtmlPath}ResPath, Flags, Frame, Post, Head);
      Application.ProcessMessages;
      {if HtmlText <> '' then HtmlDocument.body.innerHTML := HtmlText;}
      ContactMail := AContact;
      ContactMailCC := AContactCC;
      ConfirmMessage := AConfirm;
      ModalForm := Modal;
      Result := ShowModal = mrOk;
      if FSend then Result := FSendResult;
      DeleteFile(FHtmlPath);
    finally
      Free;
    end;
end;
{$WARN UNSAFE_TYPE ON}
{$ELSE}
function ExecuteReportViewForm(
  const ATitle, HtmlText, HtmlPath, PostData, AStyle, AContact, AContactCC, AConfirm: String;
  Modal: Boolean = False; RefOrder: Integer = 0): Boolean;
var
  Flags, Frame, Post, Head: OleVariant;
  B: array of Byte;
  I: Integer;
begin
  with THtmlViewForm.Create(Application) do
    try
      Caption := ATitle;
      ReferOrderId := RefOrder;
      FHtmlTitle := ATitle;
      HtmlDocStyle := AStyle;
      Flags := navNoHistory;
      Frame := null;
      if HtmlPath <> '' then
      begin
        FHtmlPath := HtmlPath;
        SetLength(B, Length(PostData));
        for I := 1 to Length(PostData) do B[Pred(I)] := Ord(PostData[I]);
        Post := B;
        Head := 'Content-Type: application/x-www-form-urlencoded'#10#13;
      end
      else begin
        FHtmlPath := ExtractFilePath(Application.ExeName) + 'Pattern.htm';
        Post := null;
        Head := '';
      end;
      WebBrowser.Navigate(FHtmlPath, Flags, Frame, Post, Head);
      Application.ProcessMessages;
      if HtmlText <> '' then HtmlDocument.body.innerHTML := HtmlText;
      ContactMail := AContact;
      ContactMailCC := AContactCC;
      ConfirmMessage := AConfirm;
      ModalForm := Modal;
      Result := ShowModal = mrOk;
      DeleteFile(FHtmlPath);
    finally
      Free;
    end;
end;
{$ENDIF}

const
  fPattern = 'BillPattern.htm';

{ THtmlViewForm }

function THtmlViewForm.DoSave: Boolean;
const sHtmlExt = '.html';
var Fldr, Name: String;
begin
  Fldr := OptionSet.StoreFolder;
  Name := Caption;
  if Assigned(FGetPathFile) then Result := FGetPathFile(Fldr, Name, ReferOrderId, nOrderDocFolder, True)
  else Result := MakeDocStoreFileName(Fldr, Name, ReferOrderId, nOrderDocFolder);
  Name := StringReplace(Name, ExtractFileExt(Name), sHtmlExt, []);
  Result := Result and SaveHtmlContent(Fldr + Name);

(*  Result := MakeDocStoreFileName(Fldr, Name, ReferOrderId)
    and SaveHtmlContent(Fldr + Name + sHtmlExt);
  *)
end;

function THtmlViewForm.GetHtmlContent: String;
begin
  Result := HtmlDocument.body.innerHTML;
end;

function THtmlViewForm.GetHtmlDocument: IHTMLDocument2;
begin
  Result := (WebBrowser.Document as IHTMLDocument2);
end;

function THtmlViewForm.GetReferOrder: Boolean;
begin
  Result := FReferOrderId > 0;
end;

procedure THtmlViewForm.PrintDocument;
const IID_IOleCommandTarget: TGUID = '{B722BCCB-4E68-101B-A2BC-00AA00404770}';
var
  pCmdTarg: IOleCommandTarget;
  Templ, OutPar: OleVariant;
begin
  Templ := ExtractFilePath(Application.ExeName) + 'PrintTemplate.htm';
  OutPar := null;
  HtmlDocument.QueryInterface(IID_IOleCommandTarget, pCmdTarg);
  {$WARN UNSAFE_CODE OFF}
  if pCmdTarg.Exec(@LIBID_MSHTML,
    OLECMDID_PRINT, OLECMDEXECOPT_PROMPTUSER, Templ, OutPar) <> S_OK
  {$WARN UNSAFE_CODE ON}
  then begin
    if DoSave then
      HtmlDocument.execCommand('Print', True, EmptyStr{'SHARP AR-205'});
  end;
end;

function THtmlViewForm.SaveHtmlContent(const FileName: String): Boolean;
var F: TextFile;
    FName, FPath, CurrDir, WorkFile, ConvertFile, TemplNamePdf: string;
begin
  Screen.Cursor := crHourGlass;
  try
    FPath := ExtractFilePath(FileName);
    FName := ExtractFileName(FileName);
    CurrDir := ExtractFilePath(ParamStr(0));
    WorkFile := IncludeTrailingPathDelimiter(CurrDir) + FName;
    AssignFile(F, WorkFile);
    Rewrite(F);
    try
      try
        Writeln(F, Format(sHtmlMask, [FHtmlTitle, GetHtmlContent]));
        Result := True;
      except
        Result := False;
      end;
    finally
      CloseFile(F);
    end;
    Result := Result and FileExists(WorkFile);
//конвертацыя в PDF
    ConvertFile := IncludeTrailingPathDelimiter(CurrDir) + sHtmlToPdf;
    TemplNamePdf := RenameExtToPdf(FileName);

    if not FileExists(ConvertFile)
    then begin 
      ErrorDlg('Відсутній файл конвертації Html в PDF. Зверніться до адміністратора.'#13 +
        ConvertFile);
      Result := False;
    end else begin
      ConvertToPDF(Handle, 'open', ConvertFile, 
        Format('"%s" "%s"', [WorkFile, TemplNamePdf]), EmptyStr, SW_HIDE);
    end;  
    DeleteFile(WorkFile); 
    
  finally
    Screen.Cursor := crDefault;
  end;                         
end;
(*
function THtmlViewForm.SaveHtmlContent(const FileName: String): Boolean;
var F: TextFile;
begin
  Screen.Cursor := crHourGlass;
  try
    AssignFile(F, FileName);
    Rewrite(F);
    try
      try
        Writeln(F, Format(sHtmlMask, [FHtmlTitle, GetHtmlContent]));
        Result := True;
      except
        Result := False;
      end;
    finally
      CloseFile(F);
    end;
    Result := Result and FileExists(FileName);
  finally
    Screen.Cursor := crDefault;
  end;                         
end; *)

function THtmlViewForm.SendDocumentByMail(
  const Subject, Recip, RecipCC, Body: String; Attach: TStrings): Boolean;
begin
  Result := ExecuteMailSendText(Recip, RecipCC, Subject,
    StringReplace(Body, '/images/', sLogoImgDir, [rfReplaceAll, rfIgnoreCase]),
    '', False, HtmlDocStyle, True, ReferOrderId, Attach, FConvertMailToPDF, 
    nOrderDocFolder, FGetPathFile);
end;

procedure THtmlViewForm.SetHtmlContent(const Value: String);
begin
  HtmlDocument.body.innerHTML := Value;
end;

procedure THtmlViewForm.SetModalForm(const Value: Boolean);
const pC: array[Boolean] of String = (SVDlgsMsgDlgClose, SVDlgsMsgDlgCancel);
begin
  FModalForm := Value;
  OkBtn.Visible := Value;
  CancelBtn.Caption := pC[Value];
end;

{$WARN UNSAFE_TYPE OFF}
function GetTempHtmlFileName(var FileName: String): Boolean;
var P: PChar;
begin
  P := StrAlloc(MAX_PATH + 1);
  try
    Result := GetTempFileName(
      PChar(ExtractFilePath(Application.ExeName)), 'tmp', 0, P) <> 0;
    if Result then FileName := ExpandFileName(P);
  finally
    StrDispose(P);
  end;
end;
{$WARN UNSAFE_TYPE ON}

function THtmlViewForm.ShowDocument(const DocTitle, DocBody: String): Boolean;
var
  DocHtml, FName: String;
  F: TextFile;
begin
  FHtmlTitle := DocTitle;
  Application.ProcessMessages;
  DocHtml := Format(sHtmlMask, [DocTitle, DocBody]);
  try
    if GetTempHtmlFileName(FName) then
    begin
      FTemplateFile := FName;
      AssignFile(F, FTemplateFile);
      Rewrite(F);
      Writeln(F, DocHtml);
      CloseFile(F);
      WebBrowser.Navigate('file://' + FTemplateFile);
    end
    else HtmlDocument.body.innerHTML := DocBody;
    Result := ShowModal = mrOk;
  finally
    DeleteFile(FTemplateFile);
  end;
end;

procedure THtmlViewForm.ToggleActions(En: Boolean);
begin
  PrintAction.Enabled := En;
  SendFaxAction.Enabled := En;
  SendMailAction.Enabled := En;// and (ContactMail <> EmptyStr);
  SaveAsAction.Enabled := En;
end;

procedure THtmlViewForm.FormCreate(Sender: TObject);
begin
  inherited;          
  FConfirmMessage := '';
  FReferOrderId := 0;
  FTemplateFile := '';
  FHtmlTitle := '';
  FHtmlPath := 'file://' + ExtractFilePath(Application.ExeName) + fPattern;
  {WebBrowser.Navigate(FHtmlPath);
    'file://' + ExtractFilePath(Application.ExeName) + fPattern);}
  ToggleActions(False);
end;

procedure THtmlViewForm.PrintActionExecute(Sender: TObject);
var
  PrintHeader, PrintFooter, PrintLeft, PrintRight, PrintTop, PrintBottom: String;
begin
  with TRegistry.Create do
    try
//      FSendResult := True;
      RootKey := HKEY_CURRENT_USER;
      OpenKey('Software\Microsoft\Internet Explorer\PageSetup', True);
      PrintHeader := ReadString('header');
      PrintFooter := ReadString('footer');
      PrintLeft := ReadString('margin_left');
      PrintRight := ReadString('margin_right');
      PrintTop := ReadString('margin_top');
      PrintBottom := ReadString('margin_bottom');
      try
        WriteString('header', '');
        WriteString('footer', '&bСтoр. &p з &P');
        WriteString('margin_left', '0.59055');
        WriteString('margin_right', '0.39370');
        WriteString('margin_top', '0.19685');
        WriteString('margin_bottom', '0.19685');
        CloseKey;
        Self.PrintDocument;
      finally
{        OpenKey('Software\Microsoft\Internet Explorer\PageSetup', True);
        WriteString('header', PrintHeader);
        WriteString('footer', PrintFooter);
        WriteString('margin_left', PrintLeft);
        WriteString('margin_right', PrintRight);
        WriteString('margin_top', PrintTop);
        WriteString('margin_bottom', PrintBottom);
        CloseKey;  }
      end;
    finally
      Free;
    end;
end;

procedure THtmlViewForm.SaveAsActionExecute(Sender: TObject);
begin
  DoSave;
//  HtmlDocument.execCommand('SaveAs', True, OptionSet.OutboxFolder);
//  FSendResult := True;
end;

procedure THtmlViewForm.SendMailActionExecute(Sender: TObject);
var sHtmlContent, sManagerName: string; 
begin
  FSend := True;              
  sHtmlContent := HtmlContent;
  ReplaceStrBetween(sHtmlContent, FManSignature, '<SPAN id=Underline>', '</SPAN>') ; 
  ReplaceStrBetween(sHtmlContent, '', '<SPAN id=ClientSign>', '</SPAN>'); 
  ReplaceStrBetween(sHtmlContent, '', '<SPAN id=signmanagerTag>', '</SPAN>'); 
  ReplaceStrBetween(sHtmlContent, '', '<SPAN id=signclientTag>', '</SPAN>'); 
  FSendResult := SendDocumentByMail(FHtmlTitle, ContactMail, ContactMailCC, sHtmlContent, FMailAttach);
end;

procedure THtmlViewForm.WebBrowserBeforeNavigate2(
  Sender: TObject; const pDisp: IDispatch;
  var URL, Flags, TargetFrameName, PostData, Headers: OleVariant;
  var Cancel: WordBool);
begin
  ToggleActions(False);
end;

procedure THtmlViewForm.WebBrowserNavigateComplete2(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  ToggleActions(True);
end;

procedure THtmlViewForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if (ModalResult = mrOk) and (FConfirmMessage <> '')
    and ConfirmDlgYN(FConfirmMessage)
  then ModalResult := mrCancel;
end;

procedure THtmlViewForm.ConvertToPDF(const AWnd: HWND; const AOperation,
  AFileName, AParameters, ADirectory: String; const AShowCmd: Integer);
var
  SEInfo: TShellExecuteInfo;
  ExitCode: DWORD;
  StartInString: string;  
begin
  FillChar(SEInfo, SizeOf(SEInfo), 0);
  SEInfo.cbSize := SizeOf(TShellExecuteInfo);
  with SEInfo do begin  
    fMask := SEE_MASK_NOCLOSEPROCESS;
    Wnd := Application.Handle;
    lpFile := PChar(AFileName);
    lpParameters := PChar(AParameters);
    // lpDirectory := PChar(StartInString);
    nShow := AShowCmd;
  end;

  if ShellExecuteEx(@SEInfo) then
  begin
    repeat 
      Application.ProcessMessages;
      GetExitCodeProcess(SEInfo.hProcess, ExitCode);
    until (ExitCode <> STILL_ACTIVE) or
    Application.Terminated;
  end else ShowMessage('Помилка запуску програми конвертації в PDF!');
end;

end.
