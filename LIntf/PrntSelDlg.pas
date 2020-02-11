unit PrntSelDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZDlg, StdCtrls, Buttons, ExtCtrls;

type
  TPrinterSelectDlg = class(TZDialog)
    PrinterLabel: TLabel;
    PrinterComboBox: TComboBox;
  private
    procedure PreparePrinterList;
    procedure SetPrinterName(const Value: String);
    function GetPrinterName: String;
    function GetPrinterIndex: Integer;
    procedure SetPrinterIndex(const Value: Integer);
  protected
    procedure PrepareDialog; override;
    property PrinterIndex: Integer read GetPrinterIndex write SetPrinterIndex;
    property PrinterName: String read GetPrinterName write SetPrinterName;
  end;

{var
  PrinterSelectDlg: TPrinterSelectDlg;}

function ExecutePrinterSelectDlg(const ATitle: String; var APrinterIndex: Integer): Boolean;


implementation

uses OptSet, InsPrntUn;

{$R *.dfm}

function ExecutePrinterSelectDlg(const ATitle: String; var APrinterIndex: Integer): Boolean;
begin
  with TPrinterSelectDlg.Create(Application) do
    try
      if ATitle <> '' then Caption := ATitle;
      if APrinterIndex >= 0 then PrinterIndex := APrinterIndex;
      Result := ShowModal = mrOk;
      if Result then APrinterIndex := PrinterIndex;
    finally
      Free;
    end;
end;

{ TPrinterSelectDlg }

function TPrinterSelectDlg.GetPrinterIndex: Integer;
begin
  Result := PrinterComboBox.ItemIndex;
end;

function TPrinterSelectDlg.GetPrinterName: String;
begin
  with PrinterComboBox do
    if ItemIndex < 0 then Result := '' else Result := Items[ItemIndex];
end;

procedure TPrinterSelectDlg.PreparePrinterList;
begin
  AssignPrinterComboBox(PrinterComboBox, OptionSet.PolicePrinterName, True);
end;

procedure TPrinterSelectDlg.SetPrinterIndex(const Value: Integer);
begin
  PrinterComboBox.ItemIndex := Value;
end;

procedure TPrinterSelectDlg.SetPrinterName(const Value: String);
begin
  with PrinterComboBox do ItemIndex := Items.IndexOf(Value);
end;

procedure TPrinterSelectDlg.PrepareDialog;
begin
  inherited;
  PreparePrinterList;
end;

end.
