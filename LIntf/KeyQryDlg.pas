unit KeyQryDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZDlg, StdCtrls, Buttons, ExtCtrls;

type
  TPrivateKeyInputDlg = class(TZDialog)
    PromptLabel: TLabel;
    Edit: TEdit;
  end;

var
  PrivateKeyInputDlg: TPrivateKeyInputDlg;

function ExecutePrivateKeyInputDlg(
  const ACaption, APrompt: string; var AValue: string): Boolean;


implementation

{$R *.dfm}

function ExecutePrivateKeyInputDlg(
  const ACaption, APrompt: string; var AValue: string): Boolean;
begin
  with TPrivateKeyInputDlg.Create(Application) do
    try
      Caption := ACaption;
      PromptLabel.Caption := APrompt;
      if PromptLabel.Width > Edit.Width then
        ClientWidth := PromptLabel.Width + 16;
      Result := ShowModal = mrOk;
      if Result then AValue := Edit.Text else AValue := '';
    finally
      Free;
    end;
end;

end.
