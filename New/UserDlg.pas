unit UserDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls;

type
  TUserAutentifyDlg = class(TForm)
    Label1: TLabel;
    ManagerDBLookupComboBox: TDBLookupComboBox;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    procedure ManagerDBLookupComboBoxClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{var
  UserAutentifyDlg: TUserAutentifyDlg;}

function ExecUserAutentifyDlg(var UserId: Integer): Boolean;


implementation

uses DataMod;

{$R *.DFM}

function ExecUserAutentifyDlg(var UserId: Integer): Boolean;
begin
  with TUserAutentifyDlg.Create(Application) do
    try
      Result := ShowModal = mrOk;
      if Result then UserId := ManagerDBLookupComboBox.KeyValue else UserId := 0;
    finally
      Free;
    end;
end;

{ TUserAutentifyDlg }

procedure TUserAutentifyDlg.ManagerDBLookupComboBoxClick(Sender: TObject);
begin
  OkBtn.Enabled := ManagerDBLookupComboBox.KeyValue <> null;
end;

end.
