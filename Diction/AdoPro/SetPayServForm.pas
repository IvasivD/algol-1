unit SetPayServForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AzComboBox, AzEdit, Buttons, ExtCtrls;

type
  TSetPayServDlg = class(TForm)
    PartnerLabel: TLabel;
    Label2: TLabel;
    PayEdit: TAzEdit;
    CurrComboBox: TAzComboBox;
    procedure PayEditKeyPress(Sender: TObject; var Key: Char);
    procedure PayEditExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  end;

{var
  SetPeyServDlg: TSetPeyServDlg;}

implementation
uses TourCmnlIf;
{$R *.dfm}

procedure TSetPayServDlg.PayEditKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = '.' then Key := ',';
  if not (Key in ['0'..'9',#8,',']) then Key := #0;
end;

procedure TSetPayServDlg.PayEditExit(Sender: TObject);
begin
  inherited;
  with (Sender as TazEdit) do
  if Trim(Text) = '' then Text := '0'
end;


procedure TSetPayServDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var SumPay: Double;
begin
  TryStrToFloat(PayEdit.Text, SumPay);
  if ModalResult = mrOk then
  begin
    if (SumPay > 0) and (CurrComboBox.ItemIndex < 0)
    then begin
      ErrorDlg('Вкажіть валюту.');
      ActiveControl := CurrComboBox;
      CanClose := False;
    end;
    if CanClose and (SumPay = 0) 
    then if WarningDlgYN('Поле сума = 0.'#13'Продовжити?')
    then CurrComboBox.ItemIndex := -1
    else begin 
      CanClose := False;
      ActiveControl := PayEdit;
    end;    
  end;
  inherited;  
end;

end.
