unit PDFPreviewFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZDlg, OleCtrls, SHDocVw, StdCtrls, Buttons, ExtCtrls, OrderUn;

type
  TPDFPreviewParam = record
    aCaption: string;
    aBody: string;
    aOrderId: Integer;
    aFileName: string;
    aSendMail: Boolean;
    aAddressToEdit: string;
    aAddressCcEdit: string;
    aLogoImgDir: string;
    aStyle: string;
    amyStoreContractProc: TGetPathFile;
  end;
  TPDFPreviewForm = class(TZDialog)
    WebBrowser: TWebBrowser;
    PrintBtn: TBitBtn;
    procedure OkBtnClick(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
  private
    procedure SetParamForm;
    function SendDocumentByMail(
      const Subject, Recip, RecipCC, Body: String; Attach: TStrings): Boolean;
  public
    { Public declarations }
  end;

function ExecutePDFPreviewDlg(PDFPreviewParam: TPDFPreviewParam): Boolean;

implementation

uses
  TourCmnlIf, MailSndFrm;

{$R *.dfm}
var
  FPDFPreviewParam: TPDFPreviewParam;

function ExecutePDFPreviewDlg(PDFPreviewParam: TPDFPreviewParam): Boolean;
begin
  with TPDFPreviewForm.Create(Application) do
    try
      FPDFPreviewParam := PDFPreviewParam;
      SetParamForm;
      Result := ShowModal = mrOk;
    finally
      Free;
    end;
end;

{ TPDFPreviewForm }

procedure TPDFPreviewForm.SetParamForm;
begin
  Caption := FPDFPreviewParam.aCaption;
  OkBtn.Visible := FPDFPreviewParam.aSendMail;
  PrintBtn.Visible := not FPDFPreviewParam.aSendMail;
  WebBrowser.Navigate(FPDFPreviewParam.aFileName);
end;

procedure TPDFPreviewForm.OkBtnClick(Sender: TObject);
var Attach: TStringList;
begin
  inherited;
  if WarningDlgYN('Відправити угоду замовнику на електронну пошту?') then
  try
    Attach := TStringList.Create;
    Attach.Add(FPDFPreviewParam.aFileName);
    SendDocumentByMail(FPDFPreviewParam.aCaption, FPDFPreviewParam.aAddressToEdit, EmptyStr, FPDFPreviewParam.aBody, Attach);
  finally
    Attach.Free;
  end;       
end;

procedure TPDFPreviewForm.PrintBtnClick(Sender: TObject);
var vaIn, vaOut: OleVariant;
begin
  inherited;
  WebBrowser.ControlInterface.ExecWB(OLECMDID_PRINT, OLECMDEXECOPT_PROMPTUSER,
    vaIn, vaOut);
end;

function TPDFPreviewForm.SendDocumentByMail(
  const Subject, Recip, RecipCC, Body: String; Attach: TStrings): Boolean;
begin
  Result := ExecuteMailSendText(Recip, RecipCC, Subject,
    StringReplace(Body, '/images/', FPDFPreviewParam.aLogoImgDir, [rfReplaceAll, rfIgnoreCase]),
    '', False, FPDFPreviewParam.aStyle, True, FPDFPreviewParam.aOrderId, Attach, 
    False, 0, FPDFPreviewParam.amyStoreContractProc);
end;

end.

