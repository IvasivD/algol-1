unit MailSndFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZDlg, StdCtrls, Buttons, ExtCtrls, IdBaseComponent, IdComponent, ToolWin,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, IdMessage, ComCtrls,
  OleCtrls, SHDocVw, MSHTML_TLB, ExtActns, StdActns, ActnList, ImgList, Menus,
  AzComboBox, IdEMailAddress, RpDefine, RpBase, RpFiler, {WordXP,} OleServer,
  IdCoderHeader, ShellAPI, OrderUn;

type
  TMailSendForm = class(TZDialog)
    IdSMTP: TIdSMTP;
    IdMessage: TIdMessage;
    ProgressBar: TProgressBar;
    OpenDialog: TOpenDialog;
    HeaderPanel: TPanel;
    AddressToLabel: TLabel;
    AddressCcLabel: TLabel;
    SubjectLabel: TLabel;
    AddressToEdit: TEdit;
    AddressCcEdit: TEdit;
    SubjectEdit: TEdit;
    AttachmentPanel: TPanel;
    Label5: TLabel;
    AttachmentsListBox: TListBox;
    AttachmentAddBtn: TSpeedButton;
    WebBrowser: TWebBrowser;
    EditToolBar: TToolBar;
    ActionList: TActionList;
    ImageList: TImageList;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    DialogFontEditAction: TFontEdit;
    DialogFontColorAction: TColorSelect;
    ToolButton19: TToolButton;
    DialogAddLinkAction: TAction;
    EditCutAction: TAction;
    EditCopyAction: TAction;
    EditPasteAction: TAction;
    EditSelectAllAction: TAction;
    EditDeleteAction: TAction;
    EditUndoAction: TAction;
    FormatBoldAction: TAction;
    FormatItalicAction: TAction;
    FormatUnderlineAction: TAction;
    FormatStrikeOutAction: TAction;
    FormatBulletsAction: TAction;
    FormatAlignLeftAction: TAction;
    FormatAlignCenterAction: TAction;
    FormatAlignRightAction: TAction;
    FormatIncreaseIndentAction: TAction;
    FormatDecreaseIndentAction: TAction;
    FormatNumbersAction: TAction;
    ToolButton24: TToolButton;
    DialogOpenPictureAction: TAction;
    FormatSubscriptAction: TAction;
    FormatSuperscriptAction: TAction;
    ToolButton27: TToolButton;
    InsertHorizLineAction: TAction;
    FormatAlignJustifyAction: TAction;
    FormatToolBar: TToolBar;
    FontSizeComboBox: TAzComboBox;
    FontNameComboBox: TAzComboBox;
    DialogBackgroundColorAction: TColorSelect;
    EditRedoAction: TAction;
    ToolButton30: TToolButton;
    ToolButton31: TToolButton;
    ToolButton32: TToolButton;
    ToolButton37: TToolButton;
    ToolButton38: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton14: TToolButton;
    ToolButton25: TToolButton;
    ToolButton26: TToolButton;
    ToolButton28: TToolButton;
    ToolButton29: TToolButton;
    ToolButton33: TToolButton;
    ToolButton34: TToolButton;
    TemplateComboBox: TAzComboBox;
    ToolButton7: TToolButton;
    AddressBcLabel: TLabel;
    AddressBcEdit: TEdit;
    ToolButton13: TToolButton;
    PriorityLowAction: TAction;
    PrioritySelectBtn: TToolButton;
    PriorityPopupMenu: TPopupMenu;
    PriorityNormalAction: TAction;
    PriorityHighAction: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Label6: TLabel;
    SenderComboBox: TAzComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AddressEditKeyPress(Sender: TObject; var Key: Char);
    procedure AddressEditExit(Sender: TObject);
    procedure AttachmentAddBtnClick(Sender: TObject);
    procedure AttachmentsListBoxDblClick(Sender: TObject);
    procedure AttachmentsListBoxKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure IdSMTPWorkBegin(
      Sender: TObject; AWorkMode: TWorkMode; const AWorkCountMax: Integer);
    procedure IdSMTPWork(
      Sender: TObject; AWorkMode: TWorkMode; const AWorkCount: Integer);
    procedure IdSMTPWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure EditCutActionExecute(Sender: TObject);
    procedure EditPasteActionExecute(Sender: TObject);
    procedure EditCopyActionExecute(Sender: TObject);
    procedure EditSelectAllActionExecute(Sender: TObject);
    procedure EditUndoActionExecute(Sender: TObject);
    procedure EditDeleteActionExecute(Sender: TObject);
    procedure FormatBoldActionExecute(Sender: TObject);
    procedure FormatItalicActionExecute(Sender: TObject);
    procedure FormatUnderlineActionExecute(Sender: TObject);
    procedure FormatStrikeOutActionExecute(Sender: TObject);
    procedure FormatAlignActionExecute(Sender: TObject);
    procedure FormatIncreaseIndentActionExecute(Sender: TObject);
    procedure DialogAddLinkActionExecute(Sender: TObject);
    procedure FormatBulletsActionExecute(Sender: TObject);
    procedure DialogFontColorActionAccept(Sender: TObject);
    procedure DialogFontEditActionAccept(Sender: TObject);
    procedure DialogOpenPictureActionExecute(Sender: TObject);
    procedure FormatSubscriptActionExecute(Sender: TObject);
    procedure InsertHorizLineActionExecute(Sender: TObject);
    procedure PriorityNormalActionExecute(Sender: TObject);
    procedure StyleComboBoxChange(Sender: TObject);
    procedure FontNameComboBoxChange(Sender: TObject);
    procedure FontSizeComboBoxChange(Sender: TObject);
    procedure TemplateComboBoxChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure IdMessageInitializeISO(var VTransferHeader: TTransfer;
      var VHeaderEncoding: Char; var VCharSet: String);
  private
    FHasFirmHeader: Boolean;
    FReferOrderId: Integer;
    FReportFont: String;
    FTempFileName: String;
    FUseFirmTemplate: Boolean;
    FConvertMailToPDF: boolean;
    FTemplName: string;
    FTypeFolder: Integer;
    FGetPathFile: TGetPathFile;
    procedure AddAttachment(const FileName: String);
    procedure AddAttachments(Files: TStrings);
    function CheckAddressTo: Boolean;
    function CheckSender: Boolean;
    function CheckSubject: Boolean;
    procedure DelAttachment;
    function DoCompose: Boolean;
    function DoSave: Boolean;
    function DoSend: Boolean;
    procedure Envelope(const ATo, ACc, ABc, ASubject, AFrom: String);
    function GetAddress(const Index: Integer): String;
    function GetBodyText: String;
    function GetBodyTextOnly: String;
    procedure GetFontNames;
    function GetHtmlDocument: IHTMLDocument2;
    function GetReferOrder: Boolean;
    function GetSender: String;
    function GetSubject: String;
    function ParseFiles(Str: string): TStrings;
    procedure PrepareReport(ApplyReportFont: Boolean);
    procedure SetAddress(const Index: Integer; const Value: String);
    procedure SetBodyText(const Value: String);
    procedure SetSender(const Value: String);
    procedure SetSubject(const Value: String);
    procedure SetUseFirmTemplate(const Value: Boolean);
    function SaveInfMail: string;
    procedure ConvertToPDF(const AWnd: HWND; const AOperation, AFileName: String; 
      const AParameters: String = ''; const ADirectory: String = ''; 
      const AShowCmd: Integer = SW_SHOWNORMAL);
//    function WordApplicConnect(TemplName: String): Boolean;
//    procedure WordRestart(TemplName: string);
  protected
    property AddressTo: String index 0 read GetAddress write SetAddress;
    property AddressCc: String index 1 read GetAddress write SetAddress;
    property AddressBc: String index 2 read GetAddress write SetAddress;
    property BodyText: String read GetBodyText write SetBodyText;
    property BodyTextOnly: String read GetBodyTextOnly;
    property HtmlDocument: IHTMLDocument2 read GetHtmlDocument;
    property ReferOrder: Boolean read GetReferOrder;
    property ReferOrderId: Integer read FReferOrderId write FReferOrderId;
    property Sender: String read GetSender write SetSender;
    property Subject: String read GetSubject write SetSubject;
    property UseFirmTemplate: Boolean read FUseFirmTemplate write SetUseFirmTemplate;
  end;

var
  MailSendForm: TMailSendForm;

function ExecuteMailSendMail(
  const ATo, ACc, ABc: String; var ASubject: String; const AFrom: String;
  var AText, Attachms: TStrings; IsReport: Boolean = False): Boolean;
function ExecuteMailSendFile(const ATo, ACc, ASubject, AFile, AFrom: String;
  IsReport: Boolean = False): Boolean;
function ExecuteMailSendText(
  const ATo, ACc, ASubject, AText: String; const AFrom: String = '';
  IsReport: Boolean = False; const UseStyle: String = '';
  HasFirmHeader: Boolean = False; RefOrder: Integer = 0;
  Attach: TStrings = nil; ConvertMailToPDF: Boolean = False;
  TypeFolder: Integer = 0; aGetPathFile: TGetPathFile = nil): Boolean;
{function ExecuteMailSendToList(const ASubject, AText, AFile, AFrom: String;
  ATo, ACc, ABc: TStrings; IsReport: Boolean = False): Boolean;}
function ExecuteMailSendToList(const ASubject, AText, AFrom: String;
  ATo, ACc, ABc: TStrings; AdmAcs: Boolean; IsReport: Boolean = False;
  const UseStyle: String = ''; HasFirmHeader: Boolean = False): Boolean;


implementation

uses
  RegExpr, ActiveX, TourCmnlIf, TourConsts, OptSet, MailUn, TourStrMag, 
  VDlgs;

{$R *.DFM}

function SubjectCharReplace(const Subject: String): String;
begin
  Result := StringReplace(Subject, 'і', 'i', [rfReplaceAll]);
  Result := StringReplace(Result, 'е', 'e', [rfReplaceAll]);
  Result := StringReplace(Result, 'о', 'o', [rfReplaceAll]);
  Result := StringReplace(Result, 'а', 'a', [rfReplaceAll]);
  Result := StringReplace(Result, 'с', 'c', [rfReplaceAll]);
  Result := StringReplace(Result, 'х', 'x', [rfReplaceAll]);
  Result := StringReplace(Result, 'р', 'p', [rfReplaceAll]);
  Result := StringReplace(Result, 'І', 'I', [rfReplaceAll]);
  Result := StringReplace(Result, 'Е', 'E', [rfReplaceAll]);
  Result := StringReplace(Result, 'О', 'O', [rfReplaceAll]);
  Result := StringReplace(Result, 'А', 'A', [rfReplaceAll]);
  Result := StringReplace(Result, 'К', 'K', [rfReplaceAll]);
  Result := StringReplace(Result, 'Н', 'H', [rfReplaceAll]);
  Result := StringReplace(Result, 'Р', 'P', [rfReplaceAll]);
  Result := StringReplace(Result, 'С', 'C', [rfReplaceAll]);
  Result := StringReplace(Result, 'Т', 'T', [rfReplaceAll]);
  Result := StringReplace(Result, 'Х', 'X', [rfReplaceAll]);
  Result := StringReplace(Result, 'В', 'B', [rfReplaceAll]);
  Result := StringReplace(Result, 'М', 'M', [rfReplaceAll]);
end;

function ExecuteMailSendMail(
  const ATo, ACc, ABc: String; var ASubject: String; const AFrom: String;
  var AText, Attachms: TStrings; IsReport: Boolean = False): Boolean;
begin
  with TMailSendForm.Create(Application) do
    try
      Envelope(ATo, ACc, ABc, ASubject, AFrom);
      LoadHTMLFromStrings(
        WebBrowser, AText, FTempFileName, FUseFirmTemplate, IsReport);
      if Assigned(Attachms) then AttachmentsListBox.Items.Assign(Attachms);
      if IsReport then PrepareReport(True);
      Result := ShowModal = mrOk;
      ASubject := Subject;
      if Assigned(AText) then AText.Text := BodyTextOnly;
      if Assigned(Attachms) then Attachms.Assign(AttachmentsListBox.Items);
    finally
      Free;
    end;
end;

function ExecuteMailSendFile(const ATo, ACc, ASubject, AFile, AFrom: String;
  IsReport: Boolean = False): Boolean;
begin
  with TMailSendForm.Create(Application) do
    try
      Envelope(ATo, ACc, '', ASubject, AFrom);
      LoadHTMLFromFile(
        WebBrowser, AFile, FTempFileName, FUseFirmTemplate, IsReport);
      if IsReport then PrepareReport(True);
      Result := ShowModal = mrOk;
    finally
      Free;
    end;
end;

function ExecuteMailSendText(
  const ATo, ACc, ASubject, AText: String; const AFrom: String = '';
  IsReport: Boolean = False; const UseStyle: String = '';
  HasFirmHeader: Boolean = False; RefOrder: Integer = 0;
  Attach: TStrings = nil; ConvertMailToPDF: Boolean = False;
  TypeFolder: Integer = 0; aGetPathFile: TGetPathFile = nil): Boolean;
begin
  with TMailSendForm.Create(Application) do
    try
      ReferOrderId := RefOrder;
      Envelope(ATo, ACc, '', ASubject, AFrom);
      FConvertMailToPDF := ConvertMailToPDF;
      FTypeFolder := TypeFolder;
      FGetPathFile := aGetPathFile;
      if IsReport or HasFirmHeader then
      begin
        if HasFirmHeader then FUseFirmTemplate := False;
        LoadHTMLFromString(
          WebBrowser, AText, FTempFileName, FUseFirmTemplate, IsReport, UseStyle);
        if IsReport then PrepareReport(False)
        else if HasFirmHeader then
        begin
          TemplateComboBox.ItemIndex := 0;
          TemplateComboBox.Enabled := False;
        end;
      end
      else BodyText := AText;
      if Assigned(Attach) then AddAttachments(Attach);
      FHasFirmHeader := HasFirmHeader;
      Result := ShowModal = mrOk;
    finally
      Free;
    end;
end;

function ExecuteMailSendToList(const ASubject, AText, AFrom: String;
  ATo, ACc, ABc: TStrings; AdmAcs: Boolean; IsReport: Boolean = False;
  const UseStyle: String = ''; HasFirmHeader: Boolean = False): Boolean;
begin
  with TMailSendForm.Create(Application) do
    try
      with SenderComboBox do
        if AdmAcs then Style := csDropDown else Style := csDropDownList;
      Envelope(
        StringReplace(StringsToDelimited(ATo), ';', '; ', [rfReplaceAll]),
        StringReplace(StringsToDelimited(ACc), ';', '; ', [rfReplaceAll]),
        StringReplace(StringsToDelimited(ABc), ';', '; ', [rfReplaceAll]),
        ASubject, AFrom);
      if IsReport or HasFirmHeader then
      begin
        if HasFirmHeader then FUseFirmTemplate := False;
        LoadHTMLFromString(
          WebBrowser, AText, FTempFileName, FUseFirmTemplate, IsReport, UseStyle);
        if IsReport then PrepareReport(False)
        else if HasFirmHeader then
        begin
          TemplateComboBox.ItemIndex := 0;
          TemplateComboBox.Enabled := False;
        end;
      end
      else BodyText := AText;
      FHasFirmHeader := HasFirmHeader;
      Result := ShowModal = mrOk;
    finally
      Free;
    end;
end;

const
  nValidDomainCount = 3;
  sValidDomains: array[0..nValidDomainCount - 1] of String = (
    'algol.com.ua', 'turyzm.info', 'abv.bg');
  sExtraDispNotify = 'Disposition-Notification-To: "%s" <%s>';

function CheckValidDomain(const Address: String): Boolean;
var
  Dom: String;
  P, I: Integer;
begin
  Result := False;
  P := Pos('@', Address);
  if P > 0 then Dom := Copy(Address, Succ(P), Length(Address) - P)
  else Dom := '';
  if Dom <> '' then
    for I := 0 to nValidDomainCount - 1 do
      if Dom = sValidDomains[I] then
      begin
        Result := True;
        Break;
      end;
end;

var
  sOpenDialogFolder: String = '';

{$WARN UNSAFE_TYPE OFF}
function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric;
  FontType: Integer; Data: Pointer): Integer; stdcall;
begin
  {$WARN UNSAFE_CAST OFF}
  TStrings(Data).Add(LogFont.lfFaceName);
  {$WARN UNSAFE_CAST ON}
  Result := 1;
end;
{$WARN UNSAFE_TYPE ON}

{ TMailSendForm }

procedure TMailSendForm.AddAttachment(const FileName: String);
begin
  AttachmentsListBox.Items.Add(FileName);
end;

procedure TMailSendForm.AddAttachments(Files: TStrings);
var I: Integer;
begin
  with AttachmentsListBox.Items do
    for I := 0 to Files.Count - 1 do Add(Files[I]);
end;

function TMailSendForm.CheckAddressTo: Boolean;
begin
  Result := Trim(AddressToEdit.Text) <> '';
  if not Result then
  begin
    ActiveControl := AddressToEdit;
    ErrorDlg(SSmtpFrmErrorAddressToIsEmpty);
  end;
end;

function TMailSendForm.CheckSender: Boolean;
var S: String;
begin
  S := Sender;
  Result := Trim(S) <> '';
  if not Result then ErrorDlg(SSmtpFrmErrorSenderIsEmpty)
  else begin
    Result := CheckValidDomain(S);
    if not Result then ErrorDlg(SSmtpFrmErrorSenderNotValid);
  end;
  if not Result then ActiveControl := SubjectEdit;
end;

function TMailSendForm.CheckSubject: Boolean;
begin
  Result := Trim(SubjectEdit.Text) <> '';
  if not Result then
  begin
    ActiveControl := SubjectEdit;
    ErrorDlg(SSmtpFrmErrorSubjectIsEmpty);
  end;
end;

procedure TMailSendForm.DelAttachment;
begin
  with AttachmentsListBox do
    if (Items.Count > 0) and (ItemIndex >= 0) then Items.Delete(ItemIndex);
end;

function TMailSendForm.DoCompose: Boolean;
var
  Imgs: TStrings;
  SHtm: String;
  I: Integer;
begin
  Result := True;
  Imgs := nil;
  try
    SHtm := GetBodyText;
    SHtm := StringReplace(SHtm, sLogoImgDir, sContentCId, [rfReplaceAll, rfIgnoreCase]);
    SHtm := StringReplace(SHtm, StringReplace(sLogoImgDir, '\', '/', [rfReplaceAll]),
      sContentCId, [rfReplaceAll, rfIgnoreCase]);
    SHtm := StringReplace(SHtm, #32 + sContEditable, '', [rfReplaceAll, rfIgnoreCase]);
    SHtm := StringReplace(SHtm, sInnerSite, sOuterSite, [rfReplaceAll, rfIgnoreCase]);
    SHtm := StringReplace(SHtm, sProposeInfo, '', [rfReplaceAll, rfIgnoreCase]);
    Imgs := ParseFiles(SHtm);
    if Assigned(Imgs) then
      for I := 0 to Imgs.Count - 1 do
        SHtm := StringReplace(SHtm,
          sProtoFile + '/' +
            StringReplace(ExtractFilePath(Imgs[I]), '\', '/', [rfReplaceAll]),
          sContentCId, [rfIgnoreCase]);
    SHtm := StringReplace(SHtm, #13#10, #32, [rfReplaceAll]);
    with IdMessage do
    begin
      Clear;                  
      ContentType := sContTypeMix;    
      CharSet := sCharSetWin1251;
      Sender.Address := Self.Sender;
      if AnsiPos('algol', Sender.Address) = 0 then
        Sender.Name := Sender.Address
      else Sender.Name := OptionSet.LocaleCompanySign;
      From.Address := Sender.Address;
      From.Name := Sender.Name;
      ReplyTo.EMailAddresses := Sender.Address;
      Subject := EncodeSubj(Self.Subject);//UkraineToEnglish(Self.Subject);
      MessageParts.Clear;
      with TIdText.Create(MessageParts, nil) do
      begin
        Body.Text :=
          StringReplace(HtmlDocument.body.innerText, #13, #32, [rfReplaceAll]);
        ContentType := sContTypePln + '; charset=' + sCharSetWin1251;
      end;   
      with TIdText.Create(MessageParts, nil) do
      begin
        if FConvertMailToPDF //<> EmptyStr
        then SHtm{Body.Text} := SaveInfMail;
        Result := SHtm <> EmptyStr;
        Body.Text := SHtm;
        ContentType := sContTypeHtm + '; charset=' + sCharSetWin1251;
      end;  
      if UseFirmTemplate or FHasFirmHeader then
        for I := 0 to nLogoImgCnt - 1 do
          if Pos(sContentCId + sLogoImgs[I], SHtm{Body.Text}) > 0 then
            with TIdAttachment.Create(MessageParts, sLogoImgDir + sLogoImgs[I]) do
            begin
              if (Pos('.jpg', sLogoImgs[I]) <> 0) then ContentType := sContTypeJpg;
              if (Pos('.gif', sLogoImgs[I]) <> 0) then ContentType := sContTypeGif;
              ExtraHeaders.Add(sContentId + '<' + sLogoImgs[I] + '>');
              ContentDisposition := 'inline';              
            end;
      if Assigned(Imgs) then
        for I := 0 to Imgs.Count - 1 do
          with TIdAttachment.Create(MessageParts, Imgs[I]) do
          begin
            if (Pos('.jpg', Imgs[I]) <> 0) then ContentType := sContTypeJpg;
            if (Pos('.gif', Imgs[I]) <> 0) then ContentType := sContTypeGif;
            ExtraHeaders.Add(sContentId + ExtractFileName(Imgs[I]));
            ContentDisposition := 'inline';
          end;
      for I := 0 to AttachmentsListBox.Items.Count - 1 do
        TIdAttachment.Create(MessageParts, AttachmentsListBox.Items[I]);
      Recipients.Clear;
      CCList.Clear;
      BccList.Clear;
      Recipients.EMailAddresses := Self.AddressTo;
      if Trim(Self.AddressCc) <> '' then
        CCList.EMailAddresses := Self.AddressCc;
      if Trim(Self.AddressBc) <> '' then
        BccList.EMailAddresses := Self.AddressBc;
      if PriorityLowAction.Checked then Priority := mpLow
      else if PriorityHighAction.Checked then Priority := mpHigh
      else Priority := mpNormal;
    end;
  finally
    if Assigned(Imgs) then Imgs.Free;
  end;
end;

function TMailSendForm.DoSave: Boolean;
var Fldr, Subj: String;
begin
  Fldr := OptionSet.StoreFolder;
  Subj := StringReplace(Self.Subject{IdMessage.Subject}, ':', ' ', [rfReplaceAll]);
  if Assigned(FGetPathFile) then Result := FGetPathFile(Fldr, Subj, ReferOrderId, FTypeFolder)
  else Result := MakeDocStoreFileName(Fldr, Subj, ReferOrderId, FTypeFolder);
  if Result then
  begin
    IdMessage.SaveToFile(Fldr + Subj);
    if FileExists(FTemplName) then DeleteFile(FTemplName);
  end;
end;

function TMailSendForm.DoSend: Boolean;
begin
  Result := False;
  Screen.Cursor := crHourGlass;
  try
    try
      if DoCompose then
        with IdSMTP do
        begin
          if not Connected then Connect;
          Send(IdMessage);
          DoSave;
          Disconnect;
          Result := True;
        end;
    except
      on E: Exception do
        ErrorFmtDlg(STripAnlzFrmErrorSendMail, [E.Message]);
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TMailSendForm.Envelope(const ATo, ACc, ABc, ASubject, AFrom: String);
begin
  AddressTo := ATo;
  if FReferOrderId = 0 then // send a copy backward if the source don't store  
  begin
    if ACc = EmptyStr then AddressCc := SVDlgsEmailSale
    else AddressCc := ACc + '; ' + SVDlgsEmailSale;
  end else if ACc <> EmptyStr then AddressCc := ACc;
  AddressBc := ABc;
//  Subject := SubjectCharReplace(ASubject);
  Subject := ASubject;
  if AFrom = '' then Sender := SVDlgsEmail else Sender := AFrom;
end;

function TMailSendForm.GetAddress(const Index: Integer): String;
begin
  case Index of
    0: Result := AddressToEdit.Text;
    1: Result := AddressCcEdit.Text;
    2: Result := AddressBcEdit.Text;
    else Result := '';
  end;
end;

function TMailSendForm.GetBodyText: String;
begin
  Result := HtmlDocument.body.innerHTML;
end;

function TMailSendForm.GetBodyTextOnly: String;
var P: Integer;
begin
  Result := GetBodyText;
  P := Pos(AnsiUpperCase(sHtmlFirmHeader), AnsiUpperCase(Result));
  if P > 0 then System.Delete(Result, P, Length(sHtmlFirmHeader));
end;

procedure TMailSendForm.GetFontNames;
var DC: HDC;
begin
  DC := GetDC(0);
  {$WARN UNSAFE_CODE OFF}
  {$WARN UNSAFE_CAST OFF}
  {$WARN UNSAFE_TYPE OFF}
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontNameComboBox.Items));
  {$WARN UNSAFE_TYPE ON}
  {$WARN UNSAFE_CAST ON}
  {$WARN UNSAFE_CODE ON}
  ReleaseDC(0, DC);
  FontNameComboBox.Sorted := True;
end;

function TMailSendForm.GetHtmlDocument: IHTMLDocument2;
begin
  Result := (WebBrowser.Document as IHTMLDocument2);
end;

function TMailSendForm.GetReferOrder: Boolean;
begin
  Result := FReferOrderId > 0;
end;

function TMailSendForm.GetSender: String;
begin
  Result := SenderComboBox.Text;
end;

function TMailSendForm.GetSubject: String;
begin
  Result := SubjectEdit.Text;
end;

function TMailSendForm.ParseFiles(Str: string): TStrings;
begin
  Result := TStringList.Create;
  with TRegExpr.Create do
    try
      ModifierS := False;
      Expression := 'src="file://([a-zA-Z0-9\.\\\-_аяАЯіІїЇєЄёЁыЫ/:\,]+)"';
        //'<tour><id>(.+)</id><name>(.+)</name><file>(.+)</file><url>(.+)</url></tour>';
      if Exec(Str) then
        repeat
          Result.Add(StringReplace(Match[1], '/', '\', [rfReplaceAll]));
        until not ExecNext;
    finally
      Free;
    end;
end;

procedure TMailSendForm.PrepareReport(ApplyReportFont: Boolean);
begin
  if ApplyReportFont then FReportFont := sReportFont;
  TemplateComboBox.ItemIndex := 1;
  TemplateComboBox.Enabled := False;
end;

procedure TMailSendForm.SetAddress(const Index: Integer; const Value: String);
begin
  case Index of
    0: AddressToEdit.Text := Value;
    1: AddressCcEdit.Text := Value;
    2: AddressBcEdit.Text := Value;
  end;
end;

procedure TMailSendForm.SetBodyText(const Value: String);
var
  P, B, E: Integer;
  V: String;
begin
  V := Value;
  P := Pos(AnsiUpperCase(sTagDivBeg), AnsiUpperCase(V));
  if P > 0 then
  begin
    B := P + Length(sTagDivBeg);
    E := Pos(AnsiUpperCase(sTagDivEnd), AnsiUpperCase(V)) - P - Length(sTagDivBeg);
    V := Copy(V, B, E);
  end;
  P := Pos(AnsiUpperCase(sProposeInfo), AnsiUpperCase(V));
  if P > 0 then System.Delete(V, P, Length(sProposeInfo));
  LoadHTMLFromString(WebBrowser, V, FTempFileName, FUseFirmTemplate, False);
end;

procedure TMailSendForm.SetSender(const Value: String);
begin
  with SenderComboBox, Items do
  begin
    if IndexOf(Value) = -1 then Add(Value);
    ItemIndex := IndexOf(Value);
  end;
end;

procedure TMailSendForm.SetSubject(const Value: String);
begin
  SubjectEdit.Text := Value;
end;

procedure TMailSendForm.SetUseFirmTemplate(const Value: Boolean);
begin
  FUseFirmTemplate := Value;
  BodyText := BodyText;
end;

procedure TMailSendForm.FormCreate(Sender: TObject);
begin
  inherited;
  TemplateComboBox.ItemIndex := 1;
  GetFontNames;
  FReportFont := 'Verdana, ';
  WebBrowser.Navigate('file://' +
    IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) +
    'Pattern.htm');
  FTempFileName := '';
  FUseFirmTemplate := True;
  FHasFirmHeader := False;
  FReferOrderId := 0;
end;

procedure TMailSendForm.FormActivate(Sender: TObject);
begin
  with OpenDialog do
    if sOpenDialogFolder = '' then InitialDir := OptionSet.OutboxFolder
    else InitialDir := sOpenDialogFolder;
end;

procedure TMailSendForm.AddressEditKeyPress(Sender: TObject; var Key: Char);
var CanTypeAt: boolean;
begin
  {if Sender is TCustomEdit then
    CanTypeAt := Pos('@', (Sender as TCustomEdit).Text) = 0
  else if Sender is TAzComboBox then
    CanTypeAt := Pos('@', (Sender as TAzComboBox).Text) = 0
  else }CanTypeAt := True;
  case Key of
    '"': if CanTypeAt then Key := '@' else Key := #0;
    ',': Key := '.';
    else Key := EmulateEnglishCharset(Key);
  end;
  if not (Key in EmailLiteral + [#32, ';']) then Key := #0;
end;

procedure TMailSendForm.AddressEditExit(Sender: TObject);
  function ExtractEmail(const EmailStr: String): String;
  begin
    Result := StringReplace(StringReplace(StringReplace(
      Trim(EmailStr), '<', '', [rfReplaceAll]), '>', '', [rfReplaceAll]),
        'mailto:', '', [rfReplaceAll, rfIgnoreCase]);
  end;
begin
  if Sender is TEdit then
    with Sender as TEdit do Text := ExtractEmail(Text)
  else if Sender is TAzComboBox then
    with Sender as TAzComboBox do Text := ExtractEmail(Text);
end;

procedure TMailSendForm.AttachmentAddBtnClick(Sender: TObject);
begin
  with OpenDialog do
    if Execute then
    begin
      if ofAllowMultiSelect in Options then AddAttachments(Files)
      else AddAttachment(FileName);
    end;
end;

procedure TMailSendForm.AttachmentsListBoxDblClick(Sender: TObject);
begin
  with AttachmentsListBox do
    if ItemIndex >= 0 then ShellOpenDocument(Items[ItemIndex]);
end;

procedure TMailSendForm.AttachmentsListBoxKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = []) and (Key = VK_DELETE) then DelAttachment;
end;

procedure TMailSendForm.IdSMTPWorkBegin(
  Sender: TObject; AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
  with ProgressBar do
  begin
    Max := AWorkCountMax;
    Position := Min;
    //Visible := AWorkMode = wmWrite;
  end;
end;

procedure TMailSendForm.IdSMTPWork(
  Sender: TObject; AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
  if AWorkMode = wmWrite then ProgressBar.Position := AWorkCount;
end;

procedure TMailSendForm.IdSMTPWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
  ProgressBar.Position := ProgressBar.Min; //Hide;
end;

procedure TMailSendForm.EditCutActionExecute(Sender: TObject);
begin
  HtmlDocument.execCommand('Cut', False, varNull);
end;

procedure TMailSendForm.EditPasteActionExecute(Sender: TObject);
begin
  HtmlDocument.execCommand('Paste', False, varNull);
end;

procedure TMailSendForm.EditCopyActionExecute(Sender: TObject);
begin
  HtmlDocument.execCommand('Copy', False, varNull);
end;

procedure TMailSendForm.EditSelectAllActionExecute(Sender: TObject);
begin
  HtmlDocument.execCommand('SelectAll', False, varNull);
end;

procedure TMailSendForm.EditUndoActionExecute(Sender: TObject);
const sCmd: array[Boolean] of String = ('Undo', 'Redo');
begin
  HtmlDocument.execCommand(sCmd[(Sender as TComponent).Tag <> 0], False, varNull);
end;

procedure TMailSendForm.EditDeleteActionExecute(Sender: TObject);
begin
  HtmlDocument.execCommand('Delete', False, varNull);
end;

procedure TMailSendForm.FormatBoldActionExecute(Sender: TObject);
begin
  HtmlDocument.execCommand('Bold', False, varNull);
end;

procedure TMailSendForm.FormatItalicActionExecute(Sender: TObject);
begin
  HtmlDocument.execCommand('Italic', False, varNull);
end;

procedure TMailSendForm.FormatUnderlineActionExecute(Sender: TObject);
begin
  HtmlDocument.execCommand('Underline', False, varNull);
end;

procedure TMailSendForm.FormatStrikeOutActionExecute(Sender: TObject);
begin
  HtmlDocument.execCommand('StrikeThrough', False, varNull);
end;

procedure TMailSendForm.FormatAlignActionExecute(Sender: TObject);
const sCmd: array[0..4] of String = (
  'JustifyNone', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyFull');
var T: Integer;
begin
  T := (Sender as TComponent).Tag;
  if T in [0..4] then HtmlDocument.execCommand(sCmd[T], False, varNull);
end;

procedure TMailSendForm.FormatIncreaseIndentActionExecute(Sender: TObject);
const sCmd: array[Boolean] of String = ('Outdent', 'Indent');
begin
  HtmlDocument.execCommand(sCmd[(Sender as TComponent).Tag <> 0], False, varNull);
end;

procedure TMailSendForm.DialogAddLinkActionExecute(Sender: TObject);
var UI: OleVariant;
begin
  UI := varNull;
  HtmlDocument.execCommand('CreateLink', UI, varNull);
end;

procedure TMailSendForm.FormatBulletsActionExecute(Sender: TObject);
const
  sCmd: array[Boolean] of String = ('InsertUnorderedList', 'InsertOrderedList');
begin
  HtmlDocument.execCommand(sCmd[(Sender as TComponent).Tag <> 0], False, varNull);
end;

procedure TMailSendForm.DialogFontColorActionAccept(Sender: TObject);
const sCmd: array[Boolean] of String = ('BackColor', 'ForeColor');
begin
  HtmlDocument.execCommand(sCmd[(Sender as TComponent).Tag <> 0], False,
    (Sender as TColorSelect).Dialog.Color and $00FFFFFF);
  ActiveControl := WebBrowser;
end;

procedure TMailSendForm.DialogFontEditActionAccept(Sender: TObject);
begin
  HtmlDocument.execCommand('FontName', False,
    DialogFontEditAction.Dialog.Font.Name);
  HtmlDocument.execCommand('FontSize', False,
    (DialogFontEditAction.Dialog.Font.Size - 7) div 3 + 1);
  ActiveControl := WebBrowser;
end;

procedure TMailSendForm.DialogOpenPictureActionExecute(Sender: TObject);
begin
  HtmlDocument.execCommand('InsertImage', True, varNull);
end;

procedure TMailSendForm.FormatSubscriptActionExecute(Sender: TObject);
const sCmd: array[Boolean] of String = ('Subscript', 'Superscript');
begin
  HtmlDocument.execCommand(sCmd[(Sender as TComponent).Tag <> 0], False, varNull);
end;

procedure TMailSendForm.InsertHorizLineActionExecute(Sender: TObject);
begin
  HtmlDocument.execCommand('InsertHorizontalRule', False, varNull);
end;

procedure TMailSendForm.PriorityNormalActionExecute(Sender: TObject);
const nImg: array[-1..1] of Integer = (28, 27, 29);
begin
  (Sender as TAction).Checked := True;
  PrioritySelectBtn.ImageIndex := nImg[(Sender as TComponent).Tag];
end;

procedure TMailSendForm.StyleComboBoxChange(Sender: TObject);
const
  sFormats: array[0..15] of String = (
    'Normal', 'Formatted', 'Address', 'Heading 1', 'Heading 2', 'Heading 3',
    'Heading 4', 'Heading 5', 'Heading 6', 'Numbered List', 'Bulleted List',
    'Directory List', 'Menu List', 'Definition Term', 'Definition', 'Paragraph');
var T: Integer;
begin
  T := (Sender as TCustomComboBox).ItemIndex;
  if T in [0..15] then
    HtmlDocument.execCommand('FormatBlock', False, sFormats[T]);
end;

procedure TMailSendForm.FontNameComboBoxChange(Sender: TObject);
begin
  with FontNameComboBox do
    HtmlDocument.execCommand('FontName', False, Items[ItemIndex]);
end;

procedure TMailSendForm.FontSizeComboBoxChange(Sender: TObject);
begin
  with FontSizeComboBox do
    if ItemIndex >= 0 then
      HtmlDocument.execCommand('FontSize', False, Succ(ItemIndex));
end;

procedure TMailSendForm.TemplateComboBoxChange(Sender: TObject);
var UseTempl: Boolean;
begin
  UseTempl := TemplateComboBox.ItemIndex > 0;
  if UseTempl <> FUseFirmTemplate then UseFirmTemplate := UseTempl;
end;

procedure TMailSendForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  with OpenDialog do
    if FileName = '' then sOpenDialogFolder := InitialDir
    else sOpenDialogFolder := ExtractFileDir(FileName);
  if ModalResult = mrOk then
  begin
    CanClose := CheckSender and CheckAddressTo and CheckSubject;
  end;
  inherited;
  if ModalResult = mrOk then CanClose := DoSend;
//    if not DoSend then ModalResult := mrCancel;
end;

procedure TMailSendForm.FormDestroy(Sender: TObject);
begin
  if FTempFileName <> '' then DeleteFile(FTempFileName);
end;

function TMailSendForm.SaveInfMail: string;
const sFileHtml = '_%s.html';
      sFilePdf = '_%s.Pdf';
      sTimeMrk = 'yyyy-mm-dd hh-nn-ss ';
      
var TemplNameHtml, TemplNamePdf, Fldr, ConvertFile, CurrDir: string;
    fFile: TextFile;
    Files: TStrings;
    bodyHTML : WideString;
//    TemplName, NewTemplate,
//    DocType, Vis, FileFormat, NotSave: OleVariant;
//    HadDocum: _Document;
{  function GetBrowserHtml(const webBrowser: TWebBrowser): String;
  var
    strStream: TStringStream;
    adapter: IStream;
    browserStream: IPersistStreamInit;
  begin
    strStream := TStringStream.Create('');
    try
      browserStream := webBrowser.Document as IPersistStreamInit;
      adapter := TStreamAdapter.Create(strStream,soReference);
      browserStream.Save(adapter,true);
      result := strStream.DataString;
    finally
    end;
    strStream.Free();
  end;  }  
begin
  Result := EmptyStr;
  Result := StringReplace(sHtmlFirmTempl,
        sReplaceMaskImg, sLogoImgDir, [rfReplaceAll]);
  Result := StringReplace(Result, sLogoImgDir, sContentCId, [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, StringReplace(sLogoImgDir, '\', '/', [rfReplaceAll]),
    sContentCId, [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, #32 + sContEditable, '', [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, sInnerSite, sOuterSite, [rfReplaceAll, rfIgnoreCase]);
  Result := StringReplace(Result, sProposeInfo, '', [rfReplaceAll, rfIgnoreCase]);
  Result := Result + 'Прикріплено ' + Subject;

//  Fldr := IncludeTrailingBackslash(GetCurrentDir);
  Fldr := IncludeTrailingBackslash(ExtractFilePath(ParamStr(0)));

  TemplNameHtml := Fldr + FormatDateTime(sTimeMrk, Now)
    + Format(sFileHtml, [IntToStr(ReferOrderId)]);
  TemplNamePdf := Fldr + FormatDateTime(sTimeMrk, Now)
    + Format(sFilePdf, [IntToStr(ReferOrderId)]);
  bodyHTML := WebBrowser.OleObject.Document.documentElement.innerHTML;
  AssignFile(fFile, TemplNameHtml);
  Rewrite(fFile);
  Writeln(fFile, bodyHTML);
  CloseFile(fFile);

  CurrDir := ExtractFilePath(ParamStr(0));
  ConvertFile := IncludeTrailingPathDelimiter(CurrDir) + sHtmlToPdf;
  if not FileExists(ConvertFile)
  then begin 
    ErrorDlg('Відсутній файл конвертації Html в PDF. Зверніться до адміністратора.'#13 +
      ConvertFile);
    Result := EmptyStr;
  end else begin
    ConvertToPDF(Handle, 'open', ConvertFile, 
      Format('"%s" "%s"', [TemplNameHtml, TemplNamePdf]), EmptyStr, SW_HIDE);
    
    Files := TStringList.Create;
    Files.Add(TemplNamePdf);
    AddAttachments(Files);
    Files.Free;
    FTemplName := TemplNamePdf;
  end;  
  DeleteFile(TemplNameHtml); 
end;

{function TMailSendForm.WordApplicConnect(TemplName: String): Boolean;
begin
  Result := True;
  try
    WordApplic.Connect;
  except              
    Result := False;
  end;
  if not Result then
    try
      ShellOutward(TemplName, '', '', '', SW_SHOWMINIMIZED);
      WordApplic.Connect;
      Result := True;
    except
      ErrorDlg(SDataModErrorWordNotInstall);
      Result := False;
      Abort;
    end;
end;   }

{procedure TMailSendForm.WordRestart(TemplName: string);
begin
  try
    if WordApplic.Documents.Count < 0 then ;
  except
    WordApplic.Disconnect;
    WordApplicConnect(TemplName);
  end;
end;}

procedure TMailSendForm.IdMessageInitializeISO(
  var VTransferHeader: TTransfer; var VHeaderEncoding: Char;
  var VCharSet: String);
begin
  inherited;
  VCharSet:=IdMessage.CharSet;
end;

procedure TMailSendForm.ConvertToPDF(const AWnd: HWND; const AOperation, AFileName: String; const AParameters: String = ''; const ADirectory: String = ''; const AShowCmd: Integer = SW_SHOWNORMAL);
var
  SEInfo: TShellExecuteInfo;
  ExitCode: DWORD;
//  StartInString: string;  
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
