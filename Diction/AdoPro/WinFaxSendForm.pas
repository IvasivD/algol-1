unit WinFaxSendForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UnitSendFrm, UnitSendFrmAdd, contnrs;

type
  TWinFaxSendFormResult = (wfrNoSend, wfrOk, wfrSvrBusy, wfrSvrErr);
  TResolution = (rsStandard, rsFine, rsDefault);
  TPriority = (prLow, prNormal, prHigh, prDefault);
  TSchedule = (schNow, schHold, schOffPeek, schDateTime);
  TFaxStatus = (fsWaitEntryId, fsSending, fsFailed, fsComplete);

  TWinFaxSendForm = class(TComponent)
  private
    fSendFrm: TFormSendMain;
    fSendFormAdd: TFormAdd;
    fRecepientName, fRecepientNumber, fText, fSubject: string;
    fOwner: TComponent;
    fOnPrint: TOnPrint;
    FDialPrefix: String;
    fRecepientId: array of Integer;
    fRecepientCount: Integer;
    fTitle: string;
    fAttachmentDir: string;
    fHelpContext: THelpContext;
    fRecepientCompany: string;
    fRecepientAreaCode: string;
    fRecepientCountryCode: string;
    fRecepientExtension: string;
    fResolution: TResolution;
    fPriority: TPriority;
    fAttachments: TStrings;
    fSchedule: TSchedule;
    fShowSendScreen: Boolean;
    fShowPreview: Boolean;
    fDateTime: TDateTime;
    fUsePrintFromApp: Boolean;
    fCoverPage: string;
    fDefaultCoverPage: Boolean;
    fRecs: TObjectList;
    fRetriesCount: Integer;
    fNeedSubject: Boolean;
    fAllowEditRec: TAllowEditRec;
    function GetRecepientId(Index: Integer): Integer;
    procedure SetAttachments(const Value: TStrings);
    procedure SetCoverPage(Value: string);
    procedure SetDefaultCoverPage(Value: Boolean);
    procedure SetRetries(Value: Integer);
  protected
    procedure SelectCoverPage;
  public
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
    function Send: TWinFaxSendFormResult;
    property RecepientCount: Integer read fRecepientCount;
    property RecepientId[Index: Integer]: Integer read GetRecepientId;
    property DateTime: TDateTime read fDateTime write fDateTime;
    function GetDBPath: string;
    function GetDBUsername: string;
    function GetDBPassword: string;
    function AddRecepient: Boolean;
    procedure ClearRecepients;

    procedure PreviewFax(id: Integer);
    function DeleteFax(id: Integer): Boolean;
    function GetFaxStatus(id: Integer): TFaxStatus;

  published
    property AllowEditRec: TAllowEditRec read fAllowEditRec write fAllowEditRec;
    property DialPrefix: String read FDialPrefix write FDialPrefix;
    property NeedSubject: Boolean read fNeedSubject write fNeedSubject;
    property RecepientName: string read fRecepientName write fRecepientName;
    property RecepientCompany: string read fRecepientCompany write fRecepientCompany;
    property RecepientNumber: string read fRecepientNumber write fRecepientNumber;
    property Subject: string read fSubject write fSubject;
    property Text: string read fText write fText;
    property OnPrint: TOnPrint read fOnPrint write fOnPrint;
    property Title: string read fTitle write fTitle;
    property AttachmentDir: string read fAttachmentDir write fAttachmentDir;
    property HelpContext: THelpContext read fHelpContext write fHelpContext;
    property RecepientAreaCode: string read fRecepientAreaCode write fRecepientAreaCode;
    property RecepientCountryCode: string read fRecepientCountryCode write fRecepientCountryCode;
    property RecepientExtension: string read fRecepientExtension write fRecepientExtension;
    property Resolution: TResolution read fResolution write fResolution;
    property Priority: TPriority read fPriority write fPriority;
    property Attachments: TStrings read fAttachments write SetAttachments;
    property Schedule: TSchedule read fSchedule write fSchedule;
    property ShowSendScreen: Boolean read fShowSendScreen write fShowSendScreen;
    property ShowPreview: Boolean read fShowPreview write fShowPreview;
    property UsePrintFromApp: Boolean read fUsePrintFromApp write fUsePrintFromApp;
    property CoverPage: string read fCoverPage write SetCoverPage;
    property DefaultCoverPage: Boolean read fDefaultCoverPage write SetDefaultCoverPage;
    property RetriesCount: Integer read fRetriesCount write SetRetries;
  end;

procedure Register;

implementation

uses
  Variants, UnitFXAux, UnitParam, ComObj;

{$R *.DCR}

constructor TWinFaxSendForm.Create(Owner: TComponent);
begin
  inherited Create(Owner);
  fAllowEditRec := aerFull;
  fOwner := Owner;
  FDialPrefix := '';
  fRecepientName := '';
  fRecepientCompany := '';
  fRecepientNumber := '';
  fText := '';
  fSubject := '';
  fOnPrint := nil;
  fRecepientCount := 0;
  fTitle := 'Відправити факс';
  fAttachmentDir := '';
  fHelpContext := 0;
  fRecepientAreaCode := '';
  fRecepientCountryCode := '';
  fRecepientExtension := '';
  try
    fResolution := TResolution(StrToInt(GetDefaultResolution));
  except
    fResolution := rsDefault;
  end;
  try
    fPriority := TPriority(StrToInt(GetDefaultPriority));
  except
    fPriority := prDefault;
  end;
  fAttachments := TStringList.Create;
  fSchedule := schNow;
  fShowSendScreen := True;
  fShowPreview := True;
  fDefaultCoverPage := True;
  fCoverPage := '';
  fDateTime := Now;
  fRetriesCount := 1;
  fUsePrintFromApp := True;
  fRecs := TObjectList.Create(True);
  fNeedSubject := True;
end;

destructor TWinFaxSendForm.Destroy;
begin
  fRecs.Free;
  fAttachments.Free;
  inherited Destroy;
end;

function TWinFaxSendForm.GetRecepientId(Index: Integer): Integer;
begin
  if (Index >= 0) and (Index < fRecepientCount) then
  begin
    Result := fRecepientId[Index];
  end
  else
  begin
    Result := -1;
  end
end;

procedure TWinFaxSendForm.SetAttachments(const Value: TStrings);
begin
  if Assigned(Value) then
  begin
    fAttachments.Clear;
    fAttachments.AddStrings(Value);
  end
end;

function TWinFaxSendForm.Send: TWinFaxSendFormResult;
var
  i: Integer;
  Rcp: TRcp;
begin
  fSendFrm := TFormSendMain.Create(fOwner);
  fSendFormAdd := TFormAdd.Create(fOwner);
  try
    fSendFrm.SetSendFormAdd(fSendFormAdd);

    fSendFrm.fAllowEditRec := fAllowEditRec;
    fSendFrm.NeedSubject := fNeedSubject;
    fSendFrm.DialPrefixEdit.Text := FDialPrefix;
    fSendFrm.edRecepientTelephon.Text := fRecepientNumber;
    fSendFrm.edRecepientName.Text := fRecepientName;
    fSendFrm.edSubject.Text := fSubject;
    fSendFrm.mmText.Lines.Text := fText;
    fSendFrm.OnPrint := fOnPrint;
    fSendFrm.Caption := fTitle;
    fSendFrm.OpenDialogAtt.InitialDir := fAttachmentDir;
    fSendFrm.HelpContext := fHelpContext;
    fSendFrm.edRecepientCompany.Text := fRecepientCompany;
    fSendFrm.edRecepientCountry.Text := fRecepientCountryCode;
    fSendFrm.edRecepientAreaCode.Text := fRecepientAreaCode;
    //fSendFrm.edRecepientExtension.Text:=fRecepientExtension
    if fResolution = rsDefault then
      fSendFrm.cbResolution.ItemIndex := StrToInt(GetDefaultResolution)
    else
      fSendFrm.cbResolution.ItemIndex := Ord(fResolution);

    if fPriority = prDefault then
      fSendFrm.cbPriority.ItemIndex := StrToInt(GetDefaultPriority)
    else
      fSendFrm.cbPriority.ItemIndex := Ord(fPriority);

    fSendFrm.lbAtt.Items.AddStrings(fAttachments);
    fSendFrm.AddShowReviewFax := fShowPreview;
    fSendFrm.AddPrintOnWinFax := fUsePrintFromApp;
    fSendFrm.AddHold := False;
    fSendFrm.AddOffPeek := False;
    fSendFrm.AddOnDateTime := False;
    fSendFrm.udRetries.Position := fRetriesCount;
    case fSchedule of
      schNow:
        begin
        end;
      schHold:
        begin
          fSendFrm.AddHold := True;
        end;
      schOffPeek:
        begin
          fSendFrm.AddOffPeek := True;
        end;
      schDateTime:
        begin
          fSendFrm.AddOnDateTime := True;
        end;
    end;
    fSendFrm.AddDateTime := fDateTime;
    SelectCoverPage;

    for i := 0 to fRecs.Count - 1 do
    begin
      Rcp := TRcp.Create;
      Rcp.Assign(fRecs[i] as Trcp);
      fSendFrm.Recs.Add(Rcp);
      fSendFrm.lbRecep.Items.Add(Rcp.Name);
    end;
    if fSendFrm.lbRecep.Items.Count > 0 then
    begin
      if (not NeedSubject) or (Length(Trim(fSendFrm.edSubject.Text)) > 0) then
        fSendFrm.BitBtnSend.Enabled := True;
    end;

    if (fRecepientNumber <> '') and (fRecepientName <> '') then
      fSendFrm.sbRecAddClick(nil);

    if fShowSendScreen then
      fSendFrm.ShowModal
    else
      fSendFrm.SendWithoutShowForm;

    Result := TWinFaxSendFormResult(fSendFrm.GetResult + 1);

    if Result = wfrOk then
    begin
      fRecepientCount := fSendFrm.sendObj.GetRecepientCount;
      SetLength(fRecepientId, fRecepientCount);
      for i := 0 to fRecepientCount - 1 do
      begin
        fRecepientId[i] := fSendFrm.sendObj.GetRecepientId(i);
      end
    end
    else
    begin
      fRecepientCount := 0;
    end;
  finally
    fSendFrm.Free;
    fSendFormAdd.Free;
  end;
end;

procedure TWinFaxSendForm.SelectCoverPage;
var
  sl: TStringList;
  i: Integer;
  def: string;
begin
  fSendFrm.cbCoverPage.Items.Clear;
  fSendFrm.cbCoverPage.Items.Add('(none)');
  fSendFrm.cbCoverPage.Items.Add('(Quick Cover Page)');
  sl := TStringList.Create;
  try
    sl.Text := GetAvailableCovePage;
    fSendFrm.cbCoverPage.Items.AddStrings(sl);
  finally
    sl.Free;
  end;

  if fDefaultCoverPage then
    def := GetDefaultCoverPage
  else
    def := fCoverPage;
  for i := 0 to fSendFrm.cbCoverPage.Items.Count - 1 do
  begin
    if def = fSendFrm.cbCoverPage.Items[i] then
    begin
      fSendFrm.cbCoverPage.ItemIndex := i;
      Break;
    end;
  end;
  if fSendFrm.cbCoverPage.ItemIndex = -1 then
  begin
    fSendFrm.cbCoverPage.ItemIndex := 0;
  end
end;

procedure TWinFaxSendForm.SetCoverPage(Value: string);
begin
  fCoverPage := Value;
  fDefaultCoverPage := False;
end;

procedure TWinFaxSendForm.SetDefaultCoverPage(Value: Boolean);
begin
  if Value then
    fCoverPage := '';
  fDefaultCoverPage := Value;
end;

procedure TWinFaxSendForm.PreviewFax(id: Integer);
var
  obj: OleVariant;
begin
  obj := CreateOleObject('FAXSERVER.FAXUTIL');
  try
    obj.ViewFax(id);
  finally
    obj := Unassigned;
  end;
end;

function TWinFaxSendForm.DeleteFax(id: Integer): Boolean;
var
  obj: OleVariant;
begin
  obj := CreateOleObject('FAXSERVER.FAXUTIL');
  try
    Result := obj.DeleteFax(id);
  finally
    obj := Unassigned;
  end;
end;

function TWinFaxSendForm.GetFaxStatus(id: Integer): TFaxStatus;
var
  obj: OleVariant;
begin
  obj := CreateOleObject('FAXSERVER.FAXUTIL');
  try
    Result := TFaxStatus(obj.GetFaxStatus(id));
  finally
    obj := Unassigned;
  end;
end;

procedure Register;
begin
  RegisterComponents('Others', [TWinFaxSendForm]);
end;

function TWinFaxSendForm.GetDBPassword: string;
begin
  Result := GetPasswrd;
end;

function TWinFaxSendForm.GetDBPath: string;
begin
  Result := GetDatabase;
end;

function TWinFaxSendForm.GetDBUsername: string;
begin
  Result := GetUsername;
end;

function TWinFaxSendForm.AddRecepient: Boolean;
var
  Rec: TRcp;
begin
  if (fRecepientName = '') or (fRecepientNumber = '') then
  begin
    Result := False;
    Exit;
  end;
  Rec := TRcp.Create;
  Rec.Name := fRecepientName;
  Rec.Company := fRecepientCompany;
  Rec.AreaCode := fRecepientAreaCode;
  Rec.Number := fRecepientNumber;
  Rec.Country := fRecepientCountryCode;
  fRecs.Add(Rec);
  fRecepientName := '';
  fRecepientAreaCode := '';
  fRecepientNumber := '';
  fRecepientCountryCode := '';
  fRecepientCompany := '';

  Result := True;
end;

procedure TWinFaxSendForm.ClearRecepients;
begin
  fRecs.Clear;
end;

procedure TWinFaxSendForm.SetRetries(Value: Integer);
begin
  if (Value >= 1) and (Value <= 50) then
    fRetriesCount := Value;
end;

end.

