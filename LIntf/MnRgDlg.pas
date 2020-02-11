unit MnRgDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZDlg, StdCtrls, Buttons, ExtCtrls, DB, DBCtrls, IBDatabase, IBCustomDataSet,
  IBQuery, gifimage;

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
    IBTransaction: TIBTransaction;
    CristmasImage: TImage;
    GiftImage: TImage;
    SaintNicImage: TImage;
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

function ExecuteManagerDlg(
  Database: TIBDatabase; const Title: string; var ManId: Integer): Boolean;
function ExecuteManagerPermDlg(
  Database: TIBDatabase; const Title: string; var ManId: Integer; var Perm: Integer): Boolean;
function ExecuteManagerSignDlg(
  Database: TIBDatabase; const Title: string; ManId: Integer): Boolean;

implementation

//uses DataMod;

uses TourMbplIf, TourCmnlIf, TourConsts, OptSet, Math;

{$R *.DFM}

function ExecuteCommonManagerDlg(
  Database: TIBDatabase; const Title: string;
  Sign: Boolean; var ManId: Integer; var Perm: Integer): Boolean;
begin
  with TManagerDlg.Create(Application) do
  try
    IBTransaction.DefaultDatabase := Database;
    //ManagerQry.Transaction := Database.DefaultTransaction;
    if isTestDatabaseIB(Database) 
    then PassEdit.Text := STestPass;
    
    ManagerQry.ParamByName('Perm').Value := Perm;
    ManagerId := IfThen(ManId > 0, ManId, OptionSet.LastOpManager);
    NameDBLookupComboBox.Enabled := not Sign;
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

function ExecuteManagerDlg(
  Database: TIBDatabase; const Title: string; var ManId: Integer): Boolean;
var Perm: Integer;
begin
  Perm := 1;
  Result := ExecuteCommonManagerDlg(Database, Title, False, ManId, Perm)
    and (Perm > 0);
end;

function ExecuteManagerPermDlg(
  Database: TIBDatabase; const Title: string; var ManId: Integer; var Perm: Integer): Boolean;
begin
  Perm := 0;
  Result := ExecuteCommonManagerDlg(Database, Title, False, ManId, Perm);
end;

function ExecuteManagerSignDlg(Database: TIBDatabase; const Title: string; ManId: Integer): Boolean;
var Perm: Integer;
begin
  Perm := 0;
  Result := ExecuteCommonManagerDlg(Database, Title, True, ManId, Perm);
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
  GiftImage.Visible :=
    (Month = 3) and (Day in [7..8]);
  NewYearImage.Visible :=
    (Month = 12) and (Day > 26) or (Month = 1) and (Day < 6);
  CristmasImage.Visible :=
    (Month = 12) and (Day in [24..26]) or (Month = 1) and (Day in [6..10, 18..20]);
  SaintNicImage.Visible :=
    (Month = 12) and (Day in [18..19]);
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
