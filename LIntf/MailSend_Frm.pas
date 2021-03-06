unit MailSend_Frm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, IdBaseComponent, IdComponent, ToolWin,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdSMTP, IdMessage, ComCtrls,
  OleCtrls, SHDocVw, MSHTML_TLB, ExtActns, StdActns, ActnList, ImgList, Menus,
  IdEMailAddress, RpDefine, RpBase, RpFiler, {WordXP,} OleServer,
  IdCoderHeader, ShellAPI, OrderUn, Core, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
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
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxTextEdit,
  UnitFrameDescriptionWebHTML,UnitProc;

type
  TMailSend_Form = class(TForm)
    ActionList: TActionList;
    PriorityLowAction: TAction;
    PriorityNormalAction: TAction;
    PriorityHighAction: TAction;
    DialogFontEditAction: TFontEdit;
    DialogFontColorAction: TColorSelect;
    DialogOpenPictureAction: TAction;
    DialogAddLinkAction: TAction;
    EditCutAction: TAction;
    EditCopyAction: TAction;
    EditPasteAction: TAction;
    EditSelectAllAction: TAction;
    EditUndoAction: TAction;
    EditDeleteAction: TAction;
    FormatBoldAction: TAction;
    FormatItalicAction: TAction;
    FormatUnderlineAction: TAction;
    FormatStrikeOutAction: TAction;
    FormatBulletsAction: TAction;
    FormatNumbersAction: TAction;
    FormatAlignLeftAction: TAction;
    FormatAlignCenterAction: TAction;
    FormatAlignRightAction: TAction;
    FormatAlignJustifyAction: TAction;
    FormatIncreaseIndentAction: TAction;
    FormatDecreaseIndentAction: TAction;
    FormatSubscriptAction: TAction;
    FormatSuperscriptAction: TAction;
    InsertHorizLineAction: TAction;
    DialogBackgroundColorAction: TColorSelect;
    EditRedoAction: TAction;
    IdMessage: TIdMessage;
    IdSMTP: TIdSMTP;
    OpenDialog: TOpenDialog;
    ImageList: TImageList;
    PriorityPopupMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    CtrlPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    ProgressBar: TProgressBar;
    HeaderPanel: TPanel;
    AddressToLabel: TLabel;
    AddressCcLabel: TLabel;
    SubjectLabel: TLabel;
    AddressBcLabel: TLabel;
    Label1: TLabel;
    AttachmentPanel: TPanel;
    Label2: TLabel;
    AttachmentAddBtn: TSpeedButton;
    AttachmentsListBox: TListBox;
    EditToolBar: TToolBar;
    PrioritySelectBtn: TToolButton;
    AddressToEdit: TComboBox;
    AddressCcEdit: TcxTextEdit;
    AddressBcEdit: TcxTextEdit;
    SubjectEdit: TcxTextEdit;
    SenderManager: TcxTextEdit;
    Panel1: TPanel;
    WebBrowser: TWebBrowser;
    FrameDescriptionWebHTMLLeter: TFrameDescriptionWebHTML;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AddressEditKeyPress(Sender: TObject; var Key: Char);
   // procedure AddressEditExit(Sender: TObject);
    procedure AttachmentAddBtnClick(Sender: TObject);
    procedure AttachmentsListBoxDblClick(Sender: TObject);
    procedure AttachmentsListBoxKeyDown(
      Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure IdSMTPWorkBegin(
      Sender: TObject; AWorkMode: TWorkMode; const AWorkCountMax: Integer);
    procedure IdSMTPWork(
      Sender: TObject; AWorkMode: TWorkMode; const AWorkCount: Integer);
    procedure IdSMTPWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure FormatSubscriptActionExecute(Sender: TObject);
    procedure PriorityNormalActionExecute(Sender: TObject);
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

    procedure FPrepareFrame;
    procedure DelAttachment;
    function DoCompose: Boolean;
    function DoSave: Boolean;
    function DoSend: Boolean;
    procedure Envelope(const ATo, ACc, ABc, ASubject, AFrom: String);
    function GetAddress(const Index: Integer): String;
    function GetBodyTextOnly: String;

    function FGetHtmlLeter:widestring;
    function FGetHtmlInnerText:widestring;
    procedure FSetHtmlInnerText( aText:Widestring );
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

    property BodyTextOnly: String read GetBodyTextOnly;
    property ReferOrder: Boolean read GetReferOrder;
    property ReferOrderId: Integer read FReferOrderId write FReferOrderId;
    property Sender: String read GetSender write SetSender;
    property Subject: String read GetSubject write SetSubject;
    property UseFirmTemplate: Boolean read FUseFirmTemplate write SetUseFirmTemplate;
  end;

var
  MailSend_Form: TMailSend_Form;

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
  RegExpr, ActiveX, TourCmnlIf, TourConsts, OptSet, MailUn, TourStrMag;

{$R *.DFM}

function SubjectCharReplace(const Subject: String): String;
begin
  Result := StringReplace(Subject, '�', 'i', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'e', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'o', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'a', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'c', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'x', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'p', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'I', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'E', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'O', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'A', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'K', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'H', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'P', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'C', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'T', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'X', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'B', [rfReplaceAll]);
  Result := StringReplace(Result, '�', 'M', [rfReplaceAll]);
end;

function ExecuteMailSendMail(
  const ATo, ACc, ABc: String; var ASubject: String; const AFrom: String;
  var AText, Attachms: TStrings; IsReport: Boolean = False): Boolean;
begin
  with TMailSend_Form.Create(Application) do
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
  with TMailSend_Form.Create(Application) do
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
  with TMailSend_Form.Create(Application) do
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
        else
        if HasFirmHeader then
        begin
          //TemplateComboBox.ItemIndex := 0;
          //TemplateComboBox.Enabled := False;
        end;
      end
      else FSetHtmlInnerText( AText );  //BodyText := AText;

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
  with TMailSend_Form.Create(Application) do
  try
    //with SenderComboBox do
    //  if AdmAcs then Style := csDropDown else Style := csDropDownList;

    Envelope(
      StringReplace(StringsToDelimited(ATo), ';', '; ', [rfReplaceAll]),
      StringReplace(StringsToDelimited(ACc), ';', '; ', [rfReplaceAll]),
      StringReplace(StringsToDelimited(ABc), ';', '; ', [rfReplaceAll]), ASubject, AFrom);

    if IsReport or HasFirmHeader then
    begin
      if HasFirmHeader then FUseFirmTemplate := False;
      LoadHTMLFromString( WebBrowser, AText, FTempFileName, FUseFirmTemplate, IsReport, UseStyle);

      if IsReport then PrepareReport(False)
      else
      if HasFirmHeader then
      begin
        //TemplateComboBox.ItemIndex := 0;
        //TemplateComboBox.Enabled := False;
      end;
    end
    else FSetHtmlInnerText( AText ); //BodyText := AText;

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

{ TMailSend_Form }

procedure TMailSend_Form.AddAttachment(const FileName: String);
begin
  AttachmentsListBox.Items.Add(FileName);
end;

procedure TMailSend_Form.AddAttachments(Files: TStrings);
var I: Integer;
begin
  with AttachmentsListBox.Items do
    for I := 0 to Files.Count - 1 do Add(Files[I]);
end;

function TMailSend_Form.CheckAddressTo: Boolean;
begin
  Result := Trim(AddressToEdit.Text) <> '';
  if not Result then
  begin
    ActiveControl := AddressToEdit;
    ErrorDlg(SSmtpFrmErrorAddressToIsEmpty);
  end;
end;

function TMailSend_Form.CheckSender: Boolean;
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

procedure TMailSend_Form.FPrepareFrame;
var aMessNotSelectLNGDescript : TPropertyDescriptWeb;
begin
  aMessNotSelectLNGDescript.WebSourcePath := ExtractFilePath(Application.ExeName)+'~temp\';
  aMessNotSelectLNGDescript.PathToImage := ExtractFilePath(Application.ExeName)+'~temp\IMAGES\';
  aMessNotSelectLNGDescript.PathRootToHtml := ExtractFilePath(Application.ExeName)+'~temp\HTML\tmpSendEmail.html';
  aMessNotSelectLNGDescript.ElemFor :=  nil;
  aMessNotSelectLNGDescript.ViewStyle := nil;
  aMessNotSelectLNGDescript.PathToHtmlEditor:= OptionSet.HtmlEditor;//ExtractFilePath(Application.ExeName)+'HTMLEditor.exe';
  FrameDescriptionWebHTMLLeter.Prepare( aMessNotSelectLNGDescript, False );
end;

function TMailSend_Form.CheckSubject: Boolean;
begin
  Result := Trim(SubjectEdit.Text) <> '';
  if not Result then
  begin
    ActiveControl := SubjectEdit;
    ErrorDlg(SSmtpFrmErrorSubjectIsEmpty);
  end;
end;

procedure TMailSend_Form.DelAttachment;
begin
  with AttachmentsListBox do
    if (Items.Count > 0) and (ItemIndex >= 0) then Items.Delete(ItemIndex);
end;

function TMailSend_Form.FGetHtmlLeter:widestring;
begin
  FrameDescriptionWebHTMLLeter.GetHtmlSource;
end;

function TMailSend_Form.FGetHtmlInnerText:widestring;
begin
  FrameDescriptionWebHTMLLeter.GetHtmlInnerText;
end;

procedure TMailSend_Form.FSetHtmlInnerText( aText:Widestring );
begin
  FrameDescriptionWebHTMLLeter.SetHtmlInnerText( aText );
end;

function TMailSend_Form.DoCompose: Boolean;
var
  Imgs: TStrings;
  SHtm: String;
  I: Integer;
begin
  Result := True;
  Imgs := nil;
  try
    SHtm := Self.FGetHtmlInnerText;
    SHtm := StringReplace( SHtm, sLogoImgDir, sContentCId, [rfReplaceAll, rfIgnoreCase] );
    SHtm := StringReplace( SHtm, StringReplace(sLogoImgDir, '\', '/', [rfReplaceAll]), sContentCId, [rfReplaceAll, rfIgnoreCase] );

    SHtm := StringReplace(SHtm, #32 + sContEditable, '', [rfReplaceAll, rfIgnoreCase]);
    SHtm := StringReplace(SHtm, sInnerSite, sOuterSite, [rfReplaceAll, rfIgnoreCase]);
    SHtm := StringReplace(SHtm, sProposeInfo, '', [rfReplaceAll, rfIgnoreCase]);

    Imgs := ParseFiles(SHtm);
    if Assigned(Imgs) then
      for I := 0 to Imgs.Count - 1 do
        SHtm := StringReplace(SHtm, sProtoFile + '/' + StringReplace(ExtractFilePath(Imgs[I]), '\', '/', [rfReplaceAll]), sContentCId, [rfIgnoreCase]);

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
        Body.Text := StringReplace( FGetHtmlInnerText , #13, #32, [rfReplaceAll]);
        ContentType := sContTypePln + '; charset=' + sCharSetWin1251;
      end;

      with TIdText.Create(MessageParts, nil) do
      begin
        if FConvertMailToPDF then SHtm := SaveInfMail;

        Result := SHtm <> EmptyStr;
        self.FSetHtmlInnerText( SHtm );
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

function TMailSend_Form.DoSave: Boolean;
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

function TMailSend_Form.DoSend: Boolean;
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

procedure TMailSend_Form.Envelope(const ATo, ACc, ABc, ASubject, AFrom: String);
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

function TMailSend_Form.GetAddress(const Index: Integer): String;
begin
  case Index of
    0: Result := AddressToEdit.Text;
    1: Result := AddressCcEdit.Text;
    2: Result := AddressBcEdit.Text;
    else Result := '';
  end;
end;

function TMailSend_Form.GetBodyTextOnly: String;
var P: Integer;
begin
  Result :=  Self.FGetHtmlInnerText;//GetBodyText;
  P := Pos( AnsiUpperCase( sHtmlFirmHeader ), AnsiUpperCase(Result) );

  if P > 0 then System.Delete( Result, P, Length(sHtmlFirmHeader) );
end;

function TMailSend_Form.GetReferOrder: Boolean;
begin
  Result := FReferOrderId > 0;
end;

function TMailSend_Form.GetSender: String;
begin
  Result := SenderManager.Text;
end;

function TMailSend_Form.GetSubject: String;
begin
  Result := SubjectEdit.Text;
end;

function TMailSend_Form.ParseFiles(Str: string): TStrings;
begin
  Result := TStringList.Create;
  with TRegExpr.Create do
    try
      ModifierS := False;
      Expression := 'src="file://([a-zA-Z0-9\.\\\-_���߳���������/:\,]+)"';
        //'<tour><id>(.+)</id><name>(.+)</name><file>(.+)</file><url>(.+)</url></tour>';
      if Exec(Str) then
        repeat
          Result.Add(StringReplace(Match[1], '/', '\', [rfReplaceAll]));
        until not ExecNext;
    finally
      Free;
    end;
end;

procedure TMailSend_Form.PrepareReport(ApplyReportFont: Boolean);
begin
  if ApplyReportFont then FReportFont := sReportFont;
 //TemplateComboBox.ItemIndex := 1;
 // TemplateComboBox.Enabled := False;
end;

procedure TMailSend_Form.SetAddress(const Index: Integer; const Value: String);
begin
  case Index of
    0: AddressToEdit.Text := Value;
    1: AddressCcEdit.Text := Value;
    2: AddressBcEdit.Text := Value;
  end;
end;

procedure TMailSend_Form.SetBodyText(const Value: String);
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

procedure TMailSend_Form.SetSender(const Value: String);
begin
  SenderManager.EditValue := Value;
  {with SenderComboBox, Items do
  begin
    if IndexOf(Value) = -1 then Add(Value);
    ItemIndex := IndexOf(Value);
  end; }
end;

procedure TMailSend_Form.SetSubject(const Value: String);
begin
  SubjectEdit.Text := Value;
end;

procedure TMailSend_Form.SetUseFirmTemplate(const Value: Boolean);
begin
  FUseFirmTemplate := Value;
  //self.SetBodyText( BodyText ); //BodyText := BodyText;
end;

procedure TMailSend_Form.FormCreate(Sender: TObject);
begin
  inherited;
  //TemplateComboBox.ItemIndex := 1;

  FReportFont := 'Verdana, ';
  WebBrowser.Navigate('file://' + IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) + 'Pattern.htm');
  
  FTempFileName := '';
  FUseFirmTemplate := True;
  FHasFirmHeader := False;
  FReferOrderId := 0;
end;

procedure TMailSend_Form.FormActivate(Sender: TObject);
begin
  with OpenDialog do
    if sOpenDialogFolder = '' then InitialDir := OptionSet.OutboxFolder
    else InitialDir := sOpenDialogFolder;
end;

procedure TMailSend_Form.AddressEditKeyPress(Sender: TObject; var Key: Char);
var CanTypeAt: boolean;
begin
  CanTypeAt := True;
  case Key of
    '"': if CanTypeAt then Key := '@' else Key := #0;
    ',': Key := '.';
    else Key := EmulateEnglishCharset(Key);
  end;
  if not (Key in EmailLiteral + [#32, ';']) then Key := #0;
end;


procedure TMailSend_Form.AttachmentAddBtnClick(Sender: TObject);
begin
  with OpenDialog do
    if Execute then
    begin
      if ofAllowMultiSelect in Options then AddAttachments(Files)
      else AddAttachment(FileName);
    end;
end;

procedure TMailSend_Form.AttachmentsListBoxDblClick(Sender: TObject);
begin
  with AttachmentsListBox do
    if ItemIndex >= 0 then ShellOpenDocument(Items[ItemIndex]);
end;

procedure TMailSend_Form.AttachmentsListBoxKeyDown(
  Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Shift = []) and (Key = VK_DELETE) then DelAttachment;
end;

procedure TMailSend_Form.IdSMTPWorkBegin(
  Sender: TObject; AWorkMode: TWorkMode; const AWorkCountMax: Integer);
begin
  with ProgressBar do
  begin
    Max := AWorkCountMax;
    Position := Min;
    //Visible := AWorkMode = wmWrite;
  end;
end;

procedure TMailSend_Form.IdSMTPWork(
  Sender: TObject; AWorkMode: TWorkMode; const AWorkCount: Integer);
begin
  if AWorkMode = wmWrite then ProgressBar.Position := AWorkCount;
end;

procedure TMailSend_Form.IdSMTPWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
  ProgressBar.Position := ProgressBar.Min; //Hide;
end;

procedure TMailSend_Form.FormatSubscriptActionExecute(Sender: TObject);
const sCmd: array[Boolean] of String = ('Subscript', 'Superscript');
begin

end;

procedure TMailSend_Form.PriorityNormalActionExecute(Sender: TObject);
const nImg: array[-1..1] of Integer = (28, 27, 29);
begin
  (Sender as TAction).Checked := True;
  PrioritySelectBtn.ImageIndex := nImg[(Sender as TComponent).Tag];
end;

procedure TMailSend_Form.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
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

procedure TMailSend_Form.FormDestroy(Sender: TObject);
begin
  if FTempFileName <> '' then DeleteFile(FTempFileName);
end;

function TMailSend_Form.SaveInfMail: string;
const sFileHtml = '_%s.html';
      sFilePdf = '_%s.Pdf';
      sTimeMrk = 'yyyy-mm-dd hh-nn-ss ';
      
var TemplNameHtml, TemplNamePdf, Fldr, ConvertFile, CurrDir: string;
    fFile: TextFile;
    Files: TStrings;
//    TemplName, NewTemplate,
//    DocType, Vis, FileFormat, NotSave: OleVariant;
    bodyHTML : WideString;
//    HadDocum: _Document;
  function GetBrowserHtml(const webBrowser: TWebBrowser): String;
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
  end;    
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
  Result := Result + '���������� ' + Subject;

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
    ErrorDlg('³������� ���� ����������� Html � PDF. ���������� �� �������������.'#13 +
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

{function TMailSend_Form.WordApplicConnect(TemplName: String): Boolean;
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

{procedure TMailSend_Form.WordRestart(TemplName: string);
begin
  try
    if WordApplic.Documents.Count < 0 then ;
  except
    WordApplic.Disconnect;
    WordApplicConnect(TemplName);
  end;
end;}

procedure TMailSend_Form.IdMessageInitializeISO(
  var VTransferHeader: TTransfer; var VHeaderEncoding: Char;
  var VCharSet: String);
begin
  inherited;
  VCharSet:=IdMessage.CharSet;
end;

procedure TMailSend_Form.ConvertToPDF(const AWnd: HWND; const AOperation, AFileName: String; const AParameters: String = ''; const ADirectory: String = ''; const AShowCmd: Integer = SW_SHOWNORMAL);
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
  end else ShowMessage('������� ������� �������� ����������� � PDF!');
end;

end.
