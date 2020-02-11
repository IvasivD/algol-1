unit SmtpFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ComCtrls, Psock, NMsmtp, ExtCtrls, StdActns, ActnList,
  ImgList, ToolWin, Menus;

type
  TSMTPForm = class(TForm)
    NMSMTP: TNMSMTP;
    OpenDialog: TOpenDialog;
    AccountPanel: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    ConnectBtn: TBitBtn;
    HostNameEdit: TEdit;
    UserIdEdit: TEdit;
    Panel1: TPanel;
    Label2: TLabel;
    Label6: TLabel;
    SubjectEdit: TEdit;
    AddressEdit: TEdit;
    Panel2: TPanel;
    Label3: TLabel;
    MessageLabel: TLabel;
    SendBtn: TBitBtn;
    CancelBtn: TBitBtn;
    AttachmentListBox: TListBox;
    Panel3: TPanel;
    BodyRichEdit: TRichEdit;
    ToolBar1: TToolBar;
    EditCutBtn: TToolButton;
    EditCopyBtn: TToolButton;
    ImageList: TImageList;
    EditPasteBtn: TToolButton;
    EditUndoBtn: TToolButton;
    ToolButton6: TToolButton;
    FontBoldBtn: TToolButton;
    FontItalicBtn: TToolButton;
    FontUnderlineBtn: TToolButton;
    ActionList: TActionList;
    ToolButton8: TToolButton;
    AddAttachmentBtn: TToolButton;
    EditCutAction: TEditCut;
    EditCopyAction: TEditCopy;
    EditPasteAction: TEditPaste;
    EditDeleteAction: TEditDelete;
    FontBoldAction: TAction;
    EditSelectAllAction: TEditSelectAll;
    EditUndoAction: TEditUndo;
    FontItalicAction: TAction;
    FontUnderlineAction: TAction;
    FontSelectAction: TAction;
    FontColorBtn: TToolButton;
    FontColorAction: TAction;
    AddAttachmentAction: TAction;
    MailSendAction: TAction;
    DelAttachmentAction: TAction;
    BodyPopupMenu: TPopupMenu;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    Undo1: TMenuItem;
    SelectAll1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    AttachmentPopupMenu: TPopupMenu;
    N3: TMenuItem;
    DelAttachmentAction1: TMenuItem;
    FontDialog: TFontDialog;
    ColorDialog: TColorDialog;
    N4: TMenuItem;
    ConnectAction: TAction;
    ParagraphBulletsAction: TAction;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ParagraphLeftAction: TAction;
    ParagraphRightAction: TAction;
    ParagraphCenterAction: TAction;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton7: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure NMSMTPAttachmentNotFound(Filename: String);
    procedure NMSMTPInvalidHost(var Handled: Boolean);
    procedure NMSMTPAuthenticationFailed(var Handled: Boolean);
    procedure NMSMTPConnect(Sender: TObject);
    procedure NMSMTPConnectionFailed(Sender: TObject);
    procedure NMSMTPDisconnect(Sender: TObject);
    procedure NMSMTPSendStart(Sender: TObject);
    procedure NMSMTPPacketSent(Sender: TObject);
    procedure NMSMTPSuccess(Sender: TObject);
    procedure NMSMTPFailure(Sender: TObject);
    procedure NMSMTPHeaderIncomplete(var handled: Boolean; hiType: Integer);
    procedure NMSMTPRecipientNotFound(Recipient: String);
    procedure AddAttachmentActionExecute(Sender: TObject);
    procedure DelAttachmentActionExecute(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure MailSendActionExecute(Sender: TObject);
    procedure EditDeleteActionExecute(Sender: TObject);
    procedure FontBoldActionExecute(Sender: TObject);
    procedure FontItalicActionExecute(Sender: TObject);
    procedure FontUnderlineActionExecute(Sender: TObject);
    procedure FontSelectActionExecute(Sender: TObject);
    procedure FontColorActionExecute(Sender: TObject);
    procedure AttachmentListBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AttachmentListBoxDrawItem(Control: TWinControl;
      Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure ConnectActionExecute(Sender: TObject);
    procedure ParagraphAlignmentActionExecute(Sender: TObject);
    procedure ParagraphBulletsActionExecute(Sender: TObject);
  private
    FCanModifyMessage: Boolean;
    FCanChangeSubject: Boolean;
    FCanChangeAddress: Boolean;
    FCanAddAttachment: Boolean;
    FCanDelAttachment: Boolean;
    FIcon: TIcon;
    FBitmap: TBitmap;
    FSendSuccess: Boolean;
    function GetCanAddAttachment: Boolean;
    function GetCanChangeAddress: Boolean;
    function GetCanChangeSubject: Boolean;
    function GetCanDelAttachment: Boolean;
    function GetCanModifyMessage: Boolean;
    procedure SetCanModifyMessage(const Value: Boolean);
    procedure SetCanAddAttachment(const Value: Boolean);
    procedure SetCanChangeAddress(const Value: Boolean);
    procedure SetCanChangeSubject(const Value: Boolean);
    procedure SetCanDelAttachment(const Value: Boolean);
    procedure AddAttachment;
    procedure AssignAttachments(AttList: TStrings);
    procedure DelAttachment;
    procedure DoConnect;
    procedure DoSendMail;
    procedure DoDisconnect;
    procedure UpdateEdiActions;
  protected
    property CanModifyMessage: Boolean read GetCanModifyMessage write SetCanModifyMessage;
    property CanChangeSubject: Boolean read GetCanChangeSubject write SetCanChangeSubject;
    property CanChangeAddress: Boolean read GetCanChangeAddress write SetCanChangeAddress;
    property CanAddAttachment: Boolean read GetCanAddAttachment write SetCanAddAttachment;
    property CanDelAttachment: Boolean read GetCanDelAttachment write SetCanDelAttachment;
  end;

{var
  SMTPForm: TSMTPForm;}

function SendSMTPMail(const Address, Subject: String; Att: TStrings): Boolean;


implementation

uses Registry, ShellAPI, TourCmnlIf, TourConsts;

{$R *.DFM}

function SendSMTPMail(const Address, Subject: String; Att: TStrings): Boolean;
begin
  with TSMTPForm.Create(Application) do
    try
      AddressEdit.Text := Address;
      SubjectEdit.Text := Subject;
      AssignAttachments(Att);
      Result := ShowModal = mrOk;
    finally
      Free;
    end;
end;

function GetDocumentFolderName: String;
const
  sShFld = '\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders';
  sMyDoc = 'Personal';
begin
  Result := 'd:\';
  with TRegistry.Create do
    try
      RootKey := HKEY_CURRENT_USER;
      if OpenKey(sShFld, False) then Result := ReadString(sMyDoc);
    finally
      CloseKey;
      Free;
    end;
end;

{ TSMTPForm }

function TSMTPForm.GetCanAddAttachment: Boolean;
begin
  Result := FCanModifyMessage and FCanAddAttachment;
end;

function TSMTPForm.GetCanChangeAddress: Boolean;
begin
  Result := FCanModifyMessage and FCanChangeAddress;
end;

function TSMTPForm.GetCanChangeSubject: Boolean;
begin
  Result := FCanModifyMessage and FCanChangeSubject;
end;

function TSMTPForm.GetCanDelAttachment: Boolean;
begin
  Result := FCanModifyMessage and FCanDelAttachment;
end;

function TSMTPForm.GetCanModifyMessage: Boolean;
begin
  Result := FCanModifyMessage;
end;

procedure TSMTPForm.SetCanAddAttachment(const Value: Boolean);
begin
  if Value <> FCanAddAttachment then
  begin
    FCanAddAttachment := Value;
  end;
end;

procedure TSMTPForm.SetCanChangeAddress(const Value: Boolean);
begin
  if Value <> FCanChangeAddress then
  begin
    FCanChangeAddress := Value;
  end;
end;

procedure TSMTPForm.SetCanChangeSubject(const Value: Boolean);
begin
  if Value <> FCanChangeSubject then
  begin
    FCanChangeSubject := Value;
  end;
end;

procedure TSMTPForm.SetCanDelAttachment(const Value: Boolean);
begin
  if Value <> FCanDelAttachment then
  begin
    FCanDelAttachment := Value;
  end;
end;

procedure TSMTPForm.SetCanModifyMessage(const Value: Boolean);
begin
  if Value <> FCanModifyMessage then
  begin
    FCanModifyMessage := Value;
    UpdateEdiActions;
  end;
end;

procedure TSMTPForm.AddAttachment;
begin
  if CanAddAttachment and OpenDialog.Execute then
    AttachmentListBox.Items.Add(OpenDialog.FileName);
end;

procedure TSMTPForm.AssignAttachments(AttList: TStrings);
begin
  AttachmentListBox.Items.Assign(AttList);
end;

procedure TSMTPForm.DelAttachment;
begin
  if CanDelAttachment then with AttachmentListBox do Items.Delete(ItemIndex);
end;

procedure TSMTPForm.DoConnect;
begin
  with NMSMTP do
    if not Connected then
      try
        Screen.Cursor := crHourGlass;
        Host := HostNameEdit.Text;
        UserID := UserIdEdit.Text;
        Connect;
      finally
        Screen.Cursor := crDefault;
      end;
end;

procedure TSMTPForm.DoDisconnect;
begin
  with NMSMTP do if not Connected then Connect;
end;

procedure TSMTPForm.DoSendMail;
begin
  MessageLabel.Caption := '';
  DoConnect;
  with NMSMTP do
    if Connected then
      try
        Screen.Cursor := crHourGlass;
        PostMessage.ToAddress.Text := AddressEdit.Text;
        PostMessage.Subject := SubjectEdit.Text;
        PostMessage.Body.Text := BodyRichEdit.Text;
        PostMessage.Attachments.Text := AttachmentListBox.Items.Text;
        SendMail;
      finally
        Screen.Cursor := crDefault;
      end;
end;

procedure TSMTPForm.UpdateEdiActions;
var En: Boolean;
begin
  En := CanModifyMessage;
  EditCutAction.Enabled := En and EditCutAction.Enabled;
  EditPasteAction.Enabled := En and EditPasteAction.Enabled;
  EditDeleteAction.Enabled := En and EditDeleteAction.Enabled;
  EditUndoAction.Enabled := En and EditUndoAction.Enabled;
  FontBoldAction.Enabled := En and FontBoldAction.Enabled;
  FontItalicAction.Enabled := En and FontItalicAction.Enabled;
  FontUnderlineAction.Enabled := En and FontUnderlineAction.Enabled;
  FontSelectAction.Enabled := En and FontSelectAction.Enabled;
  FontColorAction.Enabled := En and FontColorAction.Enabled;
  ParagraphLeftAction.Enabled := En and ParagraphLeftAction.Enabled;
  ParagraphCenterAction.Enabled := En and ParagraphCenterAction.Enabled;
  ParagraphRightAction.Enabled := En and ParagraphRightAction.Enabled;
  ParagraphBulletsAction.Enabled := En and ParagraphBulletsAction.Enabled;
end;

procedure TSMTPForm.FormCreate(Sender: TObject);
begin
  FSendSuccess := False;
  FCanModifyMessage := True;
  FCanChangeSubject := True;
  FCanChangeAddress := True;
  FCanAddAttachment := True;
  FCanDelAttachment := True;
  FIcon := TIcon.Create;
  FBitmap := TBitmap.Create;
end;

procedure TSMTPForm.NMSMTPAttachmentNotFound(Filename: String);
begin
  ErrorFmtDlg(SSmtpFrmErrorAttNotFound, [Filename]);
end;

procedure TSMTPForm.NMSMTPInvalidHost(var Handled: Boolean);
var S: String;
begin
  S := NMSMTP.UserID;
  if InputQuery(SSmtpFrmHostInvalid, SSmtpFrmEnterNewHost, S) then
  begin
    NMSMTP.Host := S;
    HostNameEdit.Text := S;
    Handled := True;
  end;
end;

procedure TSMTPForm.NMSMTPAuthenticationFailed(var Handled: Boolean);
var S: String;
begin
  S := NMSMTP.UserID;
  if InputQuery(SSmtpFrmAutentificationFailed, SSmtpFrmEnterNewUserId, S) then
  begin
    NMSMTP.UserID := S;
    UserIdEdit.Text := S;
    Handled := True;
  end;
end;

procedure TSMTPForm.NMSMTPConnect(Sender: TObject);
begin
  MessageLabel.Caption := SSmtpFrmConnected;
  MessageLabel.Invalidate;
end;

procedure TSMTPForm.NMSMTPConnectionFailed(Sender: TObject);
begin
  ErrorDlg(SSmtpFrmErrorConnectFailed);
end;

procedure TSMTPForm.NMSMTPDisconnect(Sender: TObject);
begin
  MessageLabel.Caption := SSmtpFrmDisonnected;
  MessageLabel.Invalidate;
end;

procedure TSMTPForm.NMSMTPSendStart(Sender: TObject);
begin
  MessageLabel.Caption := SSmtpFrmSending;
end;

procedure TSMTPForm.NMSMTPPacketSent(Sender: TObject);
var Snt, TTl: Integer;
begin
  Snt := NMSMTP.BytesSent;
  Ttl := NMSMTP.BytesTotal;
  MessageLabel.Caption :=
    Format(SSmtpFrmPacketSent, [Snt, Round(Snt / Ttl * 100), Ttl]);
  MessageLabel.Invalidate;
end;

procedure TSMTPForm.NMSMTPSuccess(Sender: TObject);
begin
  MessageLabel.Caption := SSmtpFrmSendSuccessed;
  MessageLabel.Invalidate;
  FSendSuccess := True;
end;

procedure TSMTPForm.NMSMTPFailure(Sender: TObject);
begin
  ErrorDlg(SSmtpFrmErrorSendFailed);
  MessageLabel.Caption := '';
  MessageLabel.Invalidate;
  FSendSuccess := False;
end;

procedure TSMTPForm.NMSMTPHeaderIncomplete(var handled: Boolean; hiType: Integer);
var S: String;
begin
  case hiType of
    hiFromAddress:
      if InputQuery(SSmtpFrmMissingFromAddress, SSmtpFrmEnterFromAddress, S) then
      begin
        NMSMTP.PostMessage.FromAddress := S;
        Handled := TRUE;
      end;
    hiToAddress:
      if InputQuery(SSmtpFrmMissingToAddress, SSmtpFrmEnterToAddress, S) then
      begin
        NMSMTP.PostMessage.ToAddress.Text := S;
        Handled := TRUE;
      end;
  end;
end;

procedure TSMTPForm.NMSMTPRecipientNotFound(Recipient: String);
begin
  ErrorFmtDlg(SSmtpFrmErrorAddressNotFound, [Recipient]);
end;

procedure TSMTPForm.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
begin
  with BodyRichEdit.SelAttributes do
  begin
    FontBoldAction.Checked := fsBold in Style;
    FontItalicAction.Checked := fsItalic in Style;
    FontUnderlineAction.Checked := fsUnderline in Style;
  end;
  with BodyRichEdit.Paragraph do
  begin
    ParagraphLeftAction.Checked := Alignment = taLeftJustify;
    ParagraphCenterAction.Checked := Alignment = taCenter;
    ParagraphRightAction.Checked := Alignment = taRightJustify;
    ParagraphBulletsAction.Checked := Numbering = nsBullet;
  end;
  AddAttachmentAction.Enabled := CanAddAttachment;
  DelAttachmentAction.Enabled :=
    CanDelAttachment and (AttachmentListBox.Items.Count > 0);
end;

procedure TSMTPForm.AddAttachmentActionExecute(Sender: TObject);
begin
  AddAttachment;
end;

procedure TSMTPForm.DelAttachmentActionExecute(Sender: TObject);
begin
  DelAttachment;
end;

procedure TSMTPForm.ConnectActionExecute(Sender: TObject);
begin
  DoConnect;
end;

procedure TSMTPForm.MailSendActionExecute(Sender: TObject);
begin
  DoSendMail;
end;

procedure TSMTPForm.EditDeleteActionExecute(Sender: TObject);
begin
  if ActiveControl is TCustomEdit then
    (ActiveControl as TCustomEdit).ClearSelection;
end;

procedure TSMTPForm.FontBoldActionExecute(Sender: TObject);
begin
  with FontBoldAction do
  begin
    Checked := not Checked;
    with BodyRichEdit.SelAttributes do
      if Checked then Style := Style + [fsBold] else Style := Style - [fsBold];
  end;
end;

procedure TSMTPForm.FontItalicActionExecute(Sender: TObject);
begin
  with FontItalicAction do
  begin
    Checked := not Checked;
    with BodyRichEdit.SelAttributes do
      if Checked then
        Style := Style + [fsItalic] else Style := Style - [fsItalic];
  end;
end;

procedure TSMTPForm.FontUnderlineActionExecute(Sender: TObject);
begin
  with FontUnderlineAction do
  begin
    Checked := not Checked;
    with BodyRichEdit.SelAttributes do
      if Checked then
        Style := Style + [fsUnderline] else Style := Style - [fsUnderline];
  end;
end;

procedure TSMTPForm.FontSelectActionExecute(Sender: TObject);
begin
  FontDialog.Font.Assign(BodyRichEdit.SelAttributes);
  if FontDialog.Execute then
    BodyRichEdit.SelAttributes.Assign(FontDialog.Font);
end;

procedure TSMTPForm.FontColorActionExecute(Sender: TObject);
begin
  ColorDialog.Color := BodyRichEdit.SelAttributes.Color;
  if ColorDialog.Execute then
    BodyRichEdit.SelAttributes.Color := ColorDialog.Color;
end;

procedure TSMTPForm.ParagraphAlignmentActionExecute(Sender: TObject);
begin
  case (Sender as TComponent).Tag of
    0: BodyRichEdit.Paragraph.Alignment := taLeftJustify;
    1: BodyRichEdit.Paragraph.Alignment := taCenter;
    2: BodyRichEdit.Paragraph.Alignment := taRightJustify;
  end;
end;

procedure TSMTPForm.ParagraphBulletsActionExecute(Sender: TObject);
begin
  with ParagraphBulletsAction do
  begin
    Checked := not Checked;
    BodyRichEdit.Paragraph.Numbering := TNumberingStyle(Checked);
  end;
end;

procedure TSMTPForm.AttachmentListBoxKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_INSERT: AddAttachment;
    VK_DELETE: DelAttachment;
  end;
end;

procedure TSMTPForm.AttachmentListBoxDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  OffSet: Integer;
  IconIndex: Word;
  FileName: String;
begin
  OffSet := 20; //40;
  FileName := AttachmentListBox.Items[Index];
  FIcon.Handle :=
    ExtractAssociatedIcon(Application.Handle, PChar(FileName), IconIndex);
  with AttachmentListBox.Canvas do
  begin
    FillRect(Rect);
    if not FIcon.Empty then
    begin
      //Draw(Rect.Left + 2, Rect.Top{ + Rect.Bottom - FIcon.Height) div 2}, FIcon);
      FBitmap.Height := FIcon.Height;
      FBitmap.Width := FIcon.Width;
      FBitmap.Canvas.FillRect(FBitmap.Canvas.ClipRect);
      FBitmap.Canvas.Draw(0, 0, FIcon);
      StretchDraw(Bounds(Rect.Left + 2, Rect.Top + 2, 16, 16), FBitmap);
    end;
    TextOut(Rect.Left + OffSet, Rect.Bottom - TextHeight('Yy') - 2, FileName);
  end;
end;

procedure TSMTPForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then
  begin
    DoSendMail;
    if not FSendSuccess then ModalResult := mrNone;
  end;
  CanClose := ModalResult <> mrNone;
  if CanClose then DoDisconnect;
end;

procedure TSMTPForm.FormDestroy(Sender: TObject);
begin
  FIcon.Free;
  FBitmap.Free;
end;

end.
