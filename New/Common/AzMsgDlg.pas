unit AzMsgDlg;

interface

uses Forms;

{ message dialogs calls }
function AzConfirmDlg(Handle: LongWord; Msg: PChar): Integer;
function AzConfirmDlgYC(Handle: LongWord; Msg: PChar): Boolean;
function AzConfirmDlgYN(Handle: LongWord; Msg: PChar): Boolean;
function AzConfirmFmtDlg(Handle: LongWord; Msg: PChar; const Args: array of const): Integer;
function AzConfirmFmtDlgYC(Handle: LongWord; Msg: PChar; const Args: array of const): Boolean;
function AzConfirmFmtDlgYN(Handle: LongWord; Msg: PChar; const Args: array of const): Boolean;
function AzErrorDlg(Handle: LongWord; Msg: PChar): Boolean;
function AzErrorFmtDlg(Handle: LongWord; Msg: PChar; const Args: array of const): Boolean;
function AzErrorHlpDlg(Handle: LongWord; Msg: PChar; HlpFile: PChar; Ctx: Integer): Boolean;
function AzErrorFmtHlpDlg(Handle: LongWord; Msg: PChar; const Args: array of const; HlpFile: PChar; Ctx: Integer): Boolean;
function AzInformDlg(Handle: LongWord; Msg: PChar): Integer;
function AzInformFmtDlg(Handle: LongWord; Msg: PChar; const Args: array of const): Integer;
function AzWarningDlg(Handle: LongWord; Msg: PChar): Integer;
function AzWarningDlgYC(Handle: LongWord; Msg: PChar): Boolean;
function AzWarningDlgYN(Handle: LongWord; Msg: PChar): Boolean;
function AzWarningFmtDlg(Handle: LongWord; Msg: PChar; const Args: array of const): Integer;
function AzWarningFmtDlgYC(Handle: LongWord; Msg: PChar; const Args: array of const): Boolean;
function AzWarningFmtDlgYN(Handle: LongWord; Msg: PChar; const Args: array of const): Boolean;
function AzInputDlg(Handle: LongWord; ACaption, APrompt, ADefault: PChar): PChar;
function AzInputQuery(Handle: LongWord; ACaption, APrompt: PChar; AValue: PChar): Boolean;
function AzSplashPromptForm(Handle: LongWord; ACaption, APrompt: PChar): TForm;


implementation

uses Windows, Classes, Controls, ExtCtrls, Dialogs, SysUtils, StdCtrls, Math,
  Graphics, LibConsts;

{ message dialogs creating}

function GetAveCharSize(Canvas: TCanvas): TPoint;
var
  I: Integer;
  Buffer: array[0..51] of Char;
begin
  for I := 0 to 25 do Buffer[I] := Chr(I + Ord('A'));
  for I := 0 to 25 do Buffer[I + 26] := Chr(I + Ord('a'));
  GetTextExtentPoint(Canvas.Handle, Buffer, 52, TSize(Result));
  Result.X := Result.X div 52;
end;

function AzStrFmt(Format: PChar; const Args: array of const): PChar;
var Buf: array[0..255] of Char;
begin
  Result := StrFmt(Buf, Format, Args);
end;

type
  TAzMessageForm = class(TForm)
  private
    procedure HelpButtonClick(Sender: TObject);
  public
    constructor CreateNew(AOwner: TComponent); reintroduce;
  end;

constructor TAzMessageForm.CreateNew(AOwner: TComponent);
var
  NonClientMetrics: TNonClientMetrics;
begin
  inherited CreateNew(AOwner);
  NonClientMetrics.cbSize := sizeof(NonClientMetrics);
  if SystemParametersInfo(SPI_GETNONCLIENTMETRICS, 0, @NonClientMetrics, 0) then
    Font.Handle := CreateFontIndirect(NonClientMetrics.lfMessageFont);
end;

procedure TAzMessageForm.HelpButtonClick(Sender: TObject);
begin
  Application.HelpContext(HelpContext);
end;

var
  pCaptions: array[TMsgDlgType] of Pointer = (
    @SAzWarning, @SAzError, @SAzInform, @SAzConfirm, nil);
  IconIDs: array[TMsgDlgType] of PChar = (
    IDI_EXCLAMATION, IDI_HAND, IDI_ASTERISK, IDI_QUESTION, nil);
  ButtonNames: array[TMsgDlgBtn] of String = (
    'Yes', 'No', 'OK', 'Cancel', 'Abort', 'Retry', 'Ignore', 'All', 'NoToAll',
    'YesToAll', 'Help');
  pBtnCaptions: array[TMsgDlgBtn] of Pointer = (
    @SAzMsgDlgYes, @SAzMsgDlgNo, @SAzMsgDlgOK, @SAzMsgDlgCancel, @SAzMsgDlgAbort,
    @SAzMsgDlgRetry, @SAzMsgDlgIgnore, @SAzMsgDlgAll,
    @SAzMsgDlgNoToAll, @SAzMsgDlgYesToAll, @SAzMsgDlgHelp);
  ModalResults: array[TMsgDlgBtn] of Integer = (
    mrYes, mrNo, mrOk, mrCancel, mrAbort, mrRetry, mrIgnore, mrAll, mrNoToAll,
    mrYesToAll, 0);
var
  ButtonWidths : array[TMsgDlgBtn] of integer;  // initialized to zero

function CreateMessageDialog(Handle: LongWord; Msg: PChar; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; DefButton: TMsgDlgBtn): TForm;
const
  mcHorzMargin = 8;
  mcVertMargin = 8;
  mcHorzSpacing = 10;
  mcVertSpacing = 10;
  mcButtonWidth = 64;
  mcButtonHeight = 14;
  mcButtonSpacing = 4;
var
  DialogUnits: TPoint;
  HorzMargin, VertMargin, HorzSpacing, VertSpacing, ButtonWidth,
  ButtonHeight, ButtonSpacing, ButtonCount, ButtonGroupWidth,
  IconTextWidth, IconTextHeight, X, ALeft, I: Integer;
  B, DefaultButton, CancelButton: TMsgDlgBtn;
  IconID: PChar;
  TextRect: TRect;
begin
  Application.Handle := Handle;
  Result := TAzMessageForm.CreateNew(Application);
  with Result do
  begin
    BiDiMode := Application.BiDiMode;
    BorderStyle := bsDialog;
    Canvas.Font := Font;
    DialogUnits := GetAveCharSize(Canvas);
    HorzMargin := MulDiv(mcHorzMargin, DialogUnits.X, 4);
    VertMargin := MulDiv(mcVertMargin, DialogUnits.Y, 8);
    HorzSpacing := MulDiv(mcHorzSpacing, DialogUnits.X, 4);
    VertSpacing := MulDiv(mcVertSpacing, DialogUnits.Y, 8);
    ButtonWidth := MulDiv(mcButtonWidth, DialogUnits.X, 4);
    for B := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do
    begin
      if B in Buttons then
      begin
        if ButtonWidths[B] = 0 then
        begin
          TextRect := Rect(0,0,0,0);
          Windows.DrawText(Canvas.Handle,
            PChar(LoadResString(pBtnCaptions[B])), -1, TextRect,
            DT_CALCRECT or DT_LEFT or DT_SINGLELINE or
            DrawTextBiDiModeFlagsReadingOnly);
          with TextRect do ButtonWidths[B] := Right - Left + 8;
        end;
        if ButtonWidths[B] > ButtonWidth then ButtonWidth := ButtonWidths[B];
      end;
    end;
    ButtonHeight := MulDiv(mcButtonHeight, DialogUnits.Y, 8);
    ButtonSpacing := MulDiv(mcButtonSpacing, DialogUnits.X, 4);
    SetRect(TextRect, 0, 0, Screen.Width div 2, 0);
    DrawText(Canvas.Handle, PChar(Msg), Length(Msg)+1, TextRect,
      DT_EXPANDTABS or DT_CALCRECT or DT_WORDBREAK or
      DrawTextBiDiModeFlagsReadingOnly);
    IconID := IconIDs[DlgType];
    IconTextWidth := TextRect.Right;
    IconTextHeight := TextRect.Bottom;
    if IconID <> nil then
    begin
      Inc(IconTextWidth, 32 + HorzSpacing);
      if IconTextHeight < 32 then IconTextHeight := 32;
    end;
    ButtonCount := 0;
    for B := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do
      if B in Buttons then Inc(ButtonCount);
    ButtonGroupWidth := 0;
    if ButtonCount <> 0 then
      ButtonGroupWidth := ButtonWidth * ButtonCount +
        ButtonSpacing * (ButtonCount - 1);
    ClientWidth := Max(IconTextWidth, ButtonGroupWidth) + HorzMargin * 2;
    ClientHeight := IconTextHeight + ButtonHeight + VertSpacing +
      VertMargin * 2;
    Left := (Screen.Width div 2) - (Width div 2);
    Top := (Screen.Height div 2) - (Height div 2);
    if DlgType <> mtCustom then
      Caption := LoadResString(pCaptions[DlgType]) else
      Caption := Application.Title;
    if IconID <> nil then
      with TImage.Create(Result) do
      begin
        Name := 'Image';
        Parent := Result;
        Picture.Icon.Handle := LoadIcon(0, IconID);
        SetBounds(HorzMargin, VertMargin, 32, 32);
      end;
    with TLabel.Create(Result) do
    begin
      Name := 'Message';
      Parent := Result;
      WordWrap := True;
      Caption := Msg;
      BoundsRect := TextRect;
      BiDiMode := Result.BiDiMode;
      ALeft := IconTextWidth - TextRect.Right + HorzMargin;
      if UseRightToLeftAlignment then
        ALeft := Result.ClientWidth - ALeft - Width;
      SetBounds(ALeft, VertMargin, TextRect.Right, TextRect.Bottom);
    end;
    if DefButton in Buttons then DefaultButton := DefButton
      else if mbOk in Buttons then DefaultButton := mbOk else
        if mbYes in Buttons then DefaultButton := mbYes else
          DefaultButton := mbRetry;
    if mbCancel in Buttons then CancelButton := mbCancel else
      if mbNo in Buttons then CancelButton := mbNo else
        CancelButton := mbOk;
    X := (ClientWidth - ButtonGroupWidth) div 2;
    for B := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do
      if B in Buttons then
        with TButton.Create(Result) do
        begin
          Name := ButtonNames[B];
          Parent := Result;
          Caption := LoadResString(pBtnCaptions[B]);
          ModalResult := ModalResults[B];
          if B = CancelButton then Cancel := True;
          if B = DefaultButton then Default := True;
          SetBounds(X, IconTextHeight + VertMargin + VertSpacing,
            ButtonWidth, ButtonHeight);
          Inc(X, ButtonWidth + ButtonSpacing);
          if B = mbHelp then OnClick := TAzMessageForm(Result).HelpButtonClick;
        end;
    {X := (ClientWidth - ButtonGroupWidth) div 2;
    for B := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do
      if B in Buttons then
      begin
        ButtonRects[B] := Bounds(X, IconTextHeight + VertMargin + VertSpacing,
          ButtonWidth, ButtonHeight);
        Inc(X, ButtonWidth + ButtonSpacing);
      end;
    for B := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do
      if B = DefaultButton then
        with TButton.Create(Result) do
        begin
          Name := ButtonNames[B];
          Parent := Result;
          Caption := LoadResString(pBtnCaptions[B]);
          ModalResult := ModalResults[B];
          Default := True;
          if B = CancelButton then Cancel := True;
          BoundsRect := ButtonRects[B];
          if B = mbHelp then OnClick := TAzMessageForm(Result).HelpButtonClick;
        end;
    for B := Low(TMsgDlgBtn) to High(TMsgDlgBtn) do
      if (B in Buttons) and (B <> DefaultButton) then
        with TButton.Create(Result) do
        begin
          Name := ButtonNames[B];
          Parent := Result;
          Caption := LoadResString(pBtnCaptions[B]);
          ModalResult := ModalResults[B];
          if B = CancelButton then Cancel := True;
          BoundsRect := ButtonRects[B];
          if B = mbHelp then OnClick := TAzMessageForm(Result).HelpButtonClick;
        end;}
    for I := 0 to ComponentCount - 1 do
      if Components[I] is TButton then
        if (Components[I] as TButton).Default then
          ActiveControl := Components[I] as TWinControl;
  end;
end;

{ common messaging dialog boxes }

function AzCommonMessageDlgPosHelp(Handle: LongWord; Msg: PChar;
  DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; DefButton: TMsgDlgBtn;
  HelpCtx: Longint; X, Y: Integer; HelpFileName: PChar): Integer;
begin
  with CreateMessageDialog(Handle, Msg, DlgType, Buttons, DefButton) do
    try
      HelpContext := HelpCtx;
      HelpFile := HelpFileName;
      if X >= 0 then Left := X;
      if Y >= 0 then Top := Y;
      if (Y < 0) and (X < 0) then Position := poScreenCenter;
      Result := ShowModal;
    finally
      Free;
    end;
end;

function AzCommonMessageDlg(Handle: LongWord; Msg: PChar; DlgType: TMsgDlgType;
  Buttons: TMsgDlgButtons; DefButton: TMsgDlgBtn; HelpCtx: Longint): Integer;
begin
  Result := AzCommonMessageDlgPosHelp(
    Handle, Msg, DlgType, Buttons, DefButton, HelpCtx, -1, -1, nil);
end;

function AzCommonMessageDlgHelp(Handle: LongWord; Msg: PChar;
  DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; DefButton: TMsgDlgBtn;
  HelpCtx: Longint; HelpFileName: PChar): Integer;
begin
  Result := AzCommonMessageDlgPosHelp(
    Handle, Msg, DlgType, Buttons, DefButton, HelpCtx, -1, -1, HelpFileName);
end;

function AzCommonMessageDlgPos(Handle: LongWord; Msg: PChar;
  DlgType: TMsgDlgType; Buttons: TMsgDlgButtons; DefButton: TMsgDlgBtn;
  HelpCtx: Longint; X, Y: Integer): Integer;
begin
  Result := AzCommonMessageDlgPosHelp(
    Handle, Msg, DlgType, Buttons, DefButton, HelpCtx, X, Y, nil);
end;

{ confirmation dialog boxes }

function AzCommonConfirmDlg(Handle: LongWord; Msg: PChar;
  Buttons: TMsgDlgButtons; DefButton: TMsgDlgBtn; HelpCtx: Longint): Integer;
begin
  Result := AzCommonMessageDlg(Handle, Msg, mtConfirmation, Buttons, DefButton, HelpCtx);
end;

function AzConfirmDlg(Handle: LongWord; Msg: PChar): Integer;
begin
  Result := AzCommonConfirmDlg(Handle, Msg, mbYesNoCancel, mbYes, 0);
end;

function AzConfirmDlgYC(Handle: LongWord; Msg: PChar): Boolean;
begin
  Result := AzCommonConfirmDlg(Handle, Msg, [mbYes, mbCancel], mbCancel, 0) = idYes;
end;

function AzConfirmDlgYN(Handle: LongWord; Msg: PChar): Boolean;
begin
  Result := AzCommonConfirmDlg(Handle, Msg, [mbYes, mbNo], mbYes, 0) = idYes;
end;

function AzConfirmFmtDlg(Handle: LongWord; Msg: PChar; const Args: array of const): Integer;
begin
  Result := AzConfirmDlg(Handle, PChar(Format(Msg, Args)));
end;

function AzConfirmFmtDlgYC(Handle: LongWord; Msg: PChar; const Args: array of const): Boolean;
begin
  Result := AzConfirmDlgYC(Handle, PChar(Format(Msg, Args)));
end;

function AzConfirmFmtDlgYN(Handle: LongWord; Msg: PChar; const Args: array of const): Boolean;
begin
  Result := AzConfirmDlgYN(Handle, PChar(Format(Msg, Args)));
end;

{ error notification dialog boxes }

function AzErrorDlg(Handle: LongWord; Msg: PChar): Boolean;
begin
  Result := AzErrorHlpDlg(Handle, Msg, nil, 0);
end;

function AzErrorHlpDlg(Handle: LongWord; Msg: PChar; HlpFile: PChar; Ctx: Integer): Boolean;
begin
  Result := AzCommonMessageDlgHelp(
    Handle, Msg, mtError, [mbOk], mbOK, Ctx, HlpFile) = idOk;
end;

function AzErrorFmtDlg(Handle: LongWord; Msg: PChar; const Args: array of const): Boolean;
begin
  Result := AzErrorDlg(Handle, PChar(Format(Msg, Args)));
end;

function AzErrorFmtHlpDlg(Handle: LongWord; Msg: PChar; const Args: array of const; HlpFile: PChar; Ctx: Integer): Boolean;
begin
  Result := AzErrorHlpDlg(Handle, PChar(Format(Msg, Args)), HlpFile, Ctx);
end;

{ information dialog boxes }

function AzInformDlg(Handle: LongWord; Msg: PChar): Integer;
begin
  Result := AzCommonMessageDlg(Handle, Msg, mtInformation, [mbOk], mbOK, 0);
end;

function AzInformFmtDlg(Handle: LongWord; Msg: PChar; const Args: array of const): Integer;
begin
  Result := AzInformDlg(Handle, PChar(Format(Msg, Args)));
end;

{ warning messaging dialog boxes }

function AzCommonWarningDlg(Handle: LongWord; Msg: PChar;
  Buttons: TMsgDlgButtons; DefButton: TMsgDlgBtn; HelpCtx: Longint): Integer;
begin
  MessageBeep(0);
  Result := AzCommonMessageDlg(Handle, Msg, mtWarning, Buttons, DefButton, HelpCtx);
end;

function AzWarningDlg(Handle: LongWord; Msg: PChar): Integer;
begin
  Result := AzCommonWarningDlg(Handle, Msg, mbYesNoCancel, mbNo, 0);
end;

function AzWarningDlgYC(Handle: LongWord; Msg: PChar): Boolean;
begin
  Result := AzCommonWarningDlg(Handle, Msg, [mbYes, mbCancel], mbCancel, 0) = idYes;
end;

function AzWarningDlgYN(Handle: LongWord; Msg: PChar): Boolean;
begin
  Result := AzCommonWarningDlg(Handle, Msg, [mbYes, mbNo], mbNo, 0) = idYes;
end;

function AzWarningFmtDlg(Handle: LongWord; Msg: PChar; const Args: array of const): Integer;
begin
  Result := AzWarningDlg(Handle, PChar(Format(Msg, Args)));
end;

function AzWarningFmtDlgYC(Handle: LongWord; Msg: PChar; const Args: array of const): Boolean;
begin
  Result := AzWarningDlgYC(Handle, PChar(Format(Msg, Args)));
end;

function AzWarningFmtDlgYN(Handle: LongWord; Msg: PChar; const Args: array of const): Boolean;
begin
  Result := AzWarningDlgYN(Handle, PChar(Format(Msg, Args)));
end;

{ input dialog boxes }

function AzInputDlg(Handle: LongWord; ACaption, APrompt, ADefault: PChar): PChar;
begin
  Result := ADefault;
  AzInputQuery(Handle, ACaption, APrompt, Result);
end;

function AzInputQuery(Handle: LongWord; ACaption, APrompt: PChar; AValue: PChar): Boolean;
const
  mcHorzMargin = 8;
  mcVertMargin = 8;
  mcVertSpacing = 10;
  mcButtonWidth = 50;
  mcButtonHeight = 14;
  mcButtonSpacing = 4;
var
  Form: TForm;
  Prompt: TLabel;
  Edit: TEdit;
  DialogUnits: TPoint;
  HorzMargin, VertMargin, VertSpacing, PromptWidth, PromptHeight,
  ButtonTop, ButtonWidth, ButtonHeight, ButtonSpacing, X: Integer;
  TextRect: TRect;
begin
  Result := False;
  Application.Handle := Handle;
  Form := TForm.Create(Application);
  with Form do
    try
      BiDiMode := Application.BiDiMode;
      Canvas.Font := Font;
      DialogUnits := GetAveCharSize(Canvas);
      BorderStyle := bsDialog;
      Caption := ACaption;
      Position := poScreenCenter;
      HorzMargin := MulDiv(mcHorzMargin, DialogUnits.X, 4);
      VertMargin := MulDiv(mcVertMargin, DialogUnits.Y, 8);
      VertSpacing := MulDiv(mcVertSpacing, DialogUnits.Y, 8);
      ButtonWidth := MulDiv(mcButtonWidth, DialogUnits.X, 4);
      ButtonHeight := MulDiv(mcButtonHeight, DialogUnits.Y, 8);
      ButtonSpacing := MulDiv(mcButtonSpacing, DialogUnits.X, 4);
      SetRect(TextRect, 0, 0, Screen.Width div 2, 0);
      DrawText(Canvas.Handle, APrompt, strlen(APrompt), TextRect,
        DT_EXPANDTABS or DT_CALCRECT or DT_WORDBREAK or
        DrawTextBiDiModeFlagsReadingOnly);
      PromptWidth := TextRect.Right;
      PromptHeight := TextRect.Bottom;
      Prompt := TLabel.Create(Form);
      with Prompt do
      begin
        Parent := Form;
        WordWrap := True;
        Caption := APrompt;
        BoundsRect := TextRect;
        BiDiMode := Application.BiDiMode;
        SetBounds(HorzMargin, VertMargin, PromptWidth, PromptHeight);
      end;
      Edit := TEdit.Create(Form);
      with Edit do
      begin
        Parent := Form;
        Color := clInfoBk;
        Left := Prompt.Left;
        Top := VertMargin + PromptHeight;
        Width := Max(MulDiv(164, DialogUnits.X, 4), PromptWidth);
        MaxLength := 255;
        Text := AValue;
        SelectAll;
      end;
      ButtonTop := Edit.Top + Edit.Height + VertSpacing;
      ClientWidth := Max(PromptWidth, Edit.Width) + HorzMargin * 2;
      ClientHeight := ButtonTop + ButtonHeight + VertMargin * 2;
      X := ClientWidth - (ButtonWidth + ButtonSpacing) * 2 - HorzMargin;
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := SAzMsgDlgOk;
        ModalResult := mrOk;
        Default := True;
        SetBounds(X, ButtonTop, ButtonWidth, ButtonHeight);
      end;
      Inc(X, ButtonWidth + ButtonSpacing);
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := SAzMsgDlgCancel;
        ModalResult := mrCancel;
        Cancel := True;
        SetBounds(X, ButtonTop, ButtonWidth, ButtonHeight);
      end;
    finally
    end;
end;

function AzSplashPromptForm(Handle: LongWord; ACaption, APrompt: PChar): TForm;
const
  mcHorzMargin = 8;
  mcVertMargin = 8;
  mcVertSpacing = 10;
  mcButtonWidth = 50;
  mcButtonHeight = 14;
  mcButtonSpacing = 4;
var
  DialogUnits: TPoint;
  HorzMargin, VertMargin, PromptWidth: Integer;
  TextRect: TRect;
begin
  Application.Handle := Handle;
  Result := TForm.Create(Application);
  with Result do
  begin
    BiDiMode := Application.BiDiMode;
    Canvas.Font := Font;
    DialogUnits := GetAveCharSize(Canvas);
    BorderStyle := bsDialog;
    BorderIcons := [];
    FormStyle := fsStayOnTop;
    Caption := ACaption;
    Position := poScreenCenter;
    HorzMargin := MulDiv(mcHorzMargin, DialogUnits.X, 4);
    VertMargin := MulDiv(mcVertMargin, DialogUnits.Y, 8);
    SetRect(TextRect, 0, 0, Screen.Width div 2, 0);
    DrawText(Canvas.Handle, APrompt, StrLen(APrompt), TextRect,
      DT_EXPANDTABS or DT_CALCRECT or DT_WORDBREAK or
      DrawTextBiDiModeFlagsReadingOnly);
    PromptWidth := TextRect.Right;
    with TLabel.Create(Result) do
    begin
      Parent := Result;
      WordWrap := True;
      Caption := APrompt;
      BoundsRect := TextRect;
      Left := HorzMargin;
      Top := (VertMargin - Height) div 2;
      BiDiMode := Application.BiDiMode;
    end;
    ClientWidth := PromptWidth + HorzMargin * 2;
    ClientHeight := VertMargin * 2;
  end;
end;

end.
