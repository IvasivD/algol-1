unit SelDestDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZDlg, StdCtrls, ExtCtrls, Buttons;

type
  TReportDestination = (
    rdReportDestNone, rdReportDestPreview, rdReportDestPrint,
    rdReportDestFax, rdReportDestMail, rdReportDestFile);

type
  TReportDestinationSelectDlg = class(TZDialog)
    DestinationRadioGroup: TRadioGroup;
    ShowMemoCheckBox: TCheckBox;
    procedure FormCreate(Sender: TObject);
  private
    function GetDestination: TReportDestination;
    procedure SetDestination(const Value: TReportDestination);
  public
    property ReportDestination: TReportDestination read GetDestination write SetDestination;
  end;

{var
  ReportDestinationSelectDlg: TReportDestinationSelectDlg;}

function ExecuteReportDestinationSelectDlg(const Title: String;
  var Destination: TReportDestination; var ShowMemo: Boolean): Boolean;


implementation

{$R *.dfm}

function ExecuteReportDestinationSelectDlg(const Title: String;
  var Destination: TReportDestination; var ShowMemo: Boolean): Boolean;
begin
  with TReportDestinationSelectDlg.Create(Application) do
    try
      Caption := Title;
      ReportDestination := Destination;
      with ShowMemoCheckBox do
      begin
        Checked := ShowMemo;
        if Checked then Enabled := False;
      end;
      Result := ShowModal = mrOk;
      if Result then
      begin
        Destination := ReportDestination;
        ShowMemo := ShowMemoCheckBox.Checked;
        Result := Result and (Destination <> rdReportDestNone);
      end;
    finally
      Free;
    end;
end;

{ TReportDestinationSelectDlg }

function TReportDestinationSelectDlg.GetDestination: TReportDestination;
begin
  Result := TReportDestination(DestinationRadioGroup.ItemIndex + 1);
end;

procedure TReportDestinationSelectDlg.SetDestination(const Value: TReportDestination);
begin
  DestinationRadioGroup.ItemIndex := Pred(Integer(Value));
end;

procedure TReportDestinationSelectDlg.FormCreate(Sender: TObject);
begin
  inherited;
  ReportDestination := rdReportDestPrint;
end;

end.
