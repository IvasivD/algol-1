unit MngrIbDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZDlg, StdCtrls, Buttons, ExtCtrls, IBCustomDataSet, IBDatabase, IBQuery, DB,
  DBCtrls, gifimage;

type
  TManagerDlg = class(TZDialog)
    Label1: TLabel;
    PassLabel: TLabel;
    PassEdit: TEdit;
    NameDBLookupComboBox: TDBLookupComboBox;
    ManagerSrc: TDataSource;
    NewYearImage: TImage;
    ManagerQry: TIBQuery;
    ManagerQryTMUSERID: TIntegerField;
    ManagerQryMANAGER: TIBStringField;
    ManagerQryTMNAME2: TIBStringField;
    ManagerQryTMUSERINFO1: TIBStringField;
    ManagerQryTMPERMLEVEL: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FManPass: Integer;
    function CheckManager: Boolean;
    function CheckManPass: Boolean;
    function GetManagerId: Integer;
    procedure PrepareQry;
    procedure SetManagerId(Value: Integer);
    procedure ToggleImage;
  protected
    property ManagerId: Integer read GetManagerId write SetManagerId;
  end;

{var
  ManagerDlg: TManagerDlg;}

function ExecuteManagerDlg(const Title: string; Database: TIBDatabase; var ManId: Integer): Boolean;
function ExecuteManagerPermDlg(
  const Title: string; Database: TIBDatabase; var ManId: Integer; var Perm: Integer): Boolean;
function ExecuteManagerSignDlg(const Title: string; Database: TIBDatabase; ManId: Integer): Boolean;

implementation

uses //DataMod,
  TourMbplIf, TourCmnlIf, TourConsts, OptSet, Math;

{$R *.DFM}

function ExecuteCommonManagerDlg(const Title: string; Database: TIBDatabase;
  Sign: Boolean; var ManId: Integer; var Perm: Integer): Boolean;
begin
  with TManagerDlg.Create(Application) do
  try
    ManagerQry.Database := Database;
    ManagerQry.ParamByName('Perm').Value := Perm;
    ManagerId := IfThen(ManId > 0, ManId, OptionSet.LastOpManager);
    NameDBLookupComboBox.Enabled := not Sign;
    if IsTestDatabaseIB( Database ) then PassEdit.Text := STestPass;

    Caption := Caption + ':'#32 + Title;
    Result := ShowModal = mrOk;
    if Result then
    begin
      ManId := ManagerId;
      Result := ManId > 0;
      if Result and (ManagerQryTMUSERID.Value = ManId) then
        Perm := ManagerQryTMPERMLEVEL.Value;
      OptionSet.LastOpManager := ManId;
    end;
  finally
    Free;
  end;
end;

function ExecuteManagerDlg(const Title: string; Database: TIBDatabase; var ManId: Integer): Boolean;
var Perm: Integer;
begin
  Perm := 1;
  Result := ExecuteCommonManagerDlg(Title, Database, False, ManId, Perm)
    and (Perm > 0);
end;

function ExecuteManagerPermDlg(
  const Title: string; Database: TIBDatabase; var ManId: Integer; var Perm: Integer): Boolean;
begin
  Perm := 0;
  Result := ExecuteCommonManagerDlg(Title, Database, False, ManId, Perm);
end;

function ExecuteManagerSignDlg(const Title: string; Database: TIBDatabase; ManId: Integer): Boolean;
var Perm: Integer;
begin
  Perm := 0;
  Result := ExecuteCommonManagerDlg(Title, Database, True, ManId, Perm);
end;

const
  fId = 'TmUserId';
  fName = 'TmUserName';
  fLogin = 'TmLogin';
  nMaxManPass = 3;

{ TManagerDlg }

function TManagerDlg.CheckManager: Boolean;
var Id: Integer;
begin
  Id := GetManagerId;
  Result := (Id <> 0) and ManagerQry.Locate(fId, GetManagerId, []);
end;

function TManagerDlg.CheckManPass: Boolean;
begin
  Inc(FManPass);
  Result := PassEdit.Text = GetInfoServStr(ManagerQryTMUSERINFO1.Value);
  if not Result then
  begin
    PassEdit.Clear;
    ActiveControl := NameDBLookupComboBox;
    ErrorFmtDlg(SManPwFrmInputError, [PassLabel.Caption]);
  end;
end;

function TManagerDlg.GetManagerId: Integer;
begin
  try
    Result := NameDBLookupComboBox.KeyValue;
  except
    Result := 0;
  end;
end;

procedure TManagerDlg.PrepareQry;
begin
  with ManagerQry do
  begin
    if Active then Close;
    Prepare;
    Open;
  end;
end;

procedure TManagerDlg.SetManagerId(Value: Integer);
begin
  PrepareQry;
  ManagerQry.Locate(fId, Value, []);
  if Value > 0 then begin 
    NameDBLookupComboBox.KeyValue := Value;
    ActiveControl := PassEdit;
  end;
end;

procedure TManagerDlg.ToggleImage;
var Year, Month, Day: Word;
begin
  DecodeDate(Now, Year, Month, Day);
  NewYearImage.Visible :=
    (Month = 12) and (Day > 23) or (Month = 1) and (Day < 10); 
end;

procedure TManagerDlg.FormCreate(Sender: TObject);
begin
  inherited;
  FManPass := 0;
  ToggleImage;
end;

procedure TManagerDlg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then
  begin
    if not CheckManager then ModalResult := mrCancel
    else if not CheckManPass then
    begin
      if FManPass < nMaxManPass then CanClose := False
      else ModalResult := mrCancel;
    end;
  end;
  inherited;
end;

end.
