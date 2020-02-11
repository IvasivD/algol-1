unit ManPwFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZDlg, StdCtrls, Buttons, ExtCtrls, Db, DBCtrls;

type
  TManagerPasswDlg = class(TZDialog)
    Label2: TLabel;
    OldTextEdit: TEdit;
    Label3: TLabel;
    NewTextEdit: TEdit;
    Label4: TLabel;
    ConfirmTextEdit: TEdit;
    NameLabel: TLabel;
    Bevel1: TBevel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FManagerId: Integer;
    procedure ChangePassword;
    function CheckChanged: Boolean;
    function CheckOldText: Boolean;
    function CheckNewText: Boolean;
    procedure PrepareDialog;
  end;

{var
  ManagerPasswDlg: TManagerPasswDlg;}

function ExecuteManagerPasswDlg(ManId: Integer): Boolean;


implementation

uses DataMod, TourCmnlIf, TourConsts, TourMbplIf;

{$R *.DFM}

function ExecuteManagerPasswDlg(ManId: Integer): Boolean;
begin
  Result := False;
  with Elem_UsersQry.DB do
  begin
    if not Active then Open;
    if not Locate('Id', ManId, []) then Exit;
  end;
  with TManagerPasswDlg.Create(Application) do
    try
      FManagerId := ManId;
      PrepareDialog;
      Result := ShowModal = mrOk;
      if Result then ChangePassword;
    finally
      Free;
    end;
end;

{ TManagerPasswDlg }

procedure TManagerPasswDlg.ChangePassword;
begin
  with Elem_UsersQry do
  begin
    DBEdit;
    DB.FieldByName('TMUSERINFO1').Value := SetInfoServStr(NewTextEdit.Text);
    DBPost;
  end;
  InformDlg(SVDlgsPassword + SManPwFrmChanged);
end;

function TManagerPasswDlg.CheckChanged: Boolean;
begin
  Result := NewTextEdit.Text <> OldTextEdit.Text;
  if not Result then
  begin
    ErrorFmtDlg(SManPwFrmRepeatError, [AnsiLowerCase(SVDlgsPassword)]);
    ActiveControl := NewTextEdit;
  end;
end;

function TManagerPasswDlg.CheckNewText: Boolean;
begin
  Result := ConfirmTextEdit.Text = NewTextEdit.Text;
  if not Result then ErrorFmtDlg(SManPwFrmChangeError, [AnsiLowerCase(SVDlgsPassword)]);
end;

function TManagerPasswDlg.CheckOldText: Boolean;
begin
  Result := OldTextEdit.Text = GetInfoServStr(Elem_UsersQry.DB.FieldByName('TMUSERINFO1').Value);
  if not Result then ErrorFmtDlg(SManPwFrmChangeError, [AnsiLowerCase(SVDlgsPassword)]);
end;

procedure TManagerPasswDlg.PrepareDialog;
begin
  NameLabel.Caption := Format('%s %s', [
    Elem_UsersQry.DB.FieldByName('NAME').AsString, Elem_UsersQry.DB.FieldByName('SECONDNAME').AsString]);
end;

procedure TManagerPasswDlg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then
    CanClose := CheckOldText and CheckNewText and CheckChanged;
  inherited;
end;

end.
