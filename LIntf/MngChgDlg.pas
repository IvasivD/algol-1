unit MngChgDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZDlg, ExtCtrls, StdCtrls, DBCtrls, DB, DBTables, Buttons;

type
  TManagerChangeDlg = class(TZDialog)
    Manager1Qry: TQuery;
    Manager1QryTMUSERID: TIntegerField;
    Manager1QryMANAGER: TStringField;
    Manager1QryTMUSERINFO1: TStringField;
    Manager1QryTMPERMLEVEL: TIntegerField;
    Manager1Src: TDataSource;
    Manager2Qry: TQuery;
    Manager2Src: TDataSource;
    Name1Label: TLabel;
    Name1DBLookupComboBox: TDBLookupComboBox;
    Ident1Label: TLabel;
    Ident1Edit: TEdit;
    Name2Label: TLabel;
    Name2DBLookupComboBox: TDBLookupComboBox;
    Ident2Label: TLabel;
    Ident2Edit: TEdit;
    Bevel1: TBevel;
    Manager2QryTMUSERID: TIntegerField;
    Manager2QryMANAGER: TStringField;
    Manager2QryTMUSERINFO1: TStringField;
    Manager2QryTMPERMLEVEL: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FManPass: array[0..1] of Integer;
    function CheckManager(const Index: Integer): Boolean;
    function CheckManPass(const Index: Integer): Boolean;
    function GetIdentEdit(Index: Integer): TEdit;
    function GetIdentField(Index: Integer): TStringField;
    function GetIdentLabel(Index: Integer): TLabel;
    function GetManagerCombo(Index: Integer): TDBLookupComboBox;
    function GetManagerId(const Index: Integer): Integer;
    function GetManagerQry(Index: Integer): TQuery;
    procedure PrepareQueries(const DatabaseName: string; Perm1, Perm2: Integer);
    procedure SetManagerId(const Index, Value: Integer);
  protected
    property Manager1: Integer index 0 read GetManagerId write SetManagerId;
    property Manager2: Integer index 1 read GetManagerId write SetManagerId;
    property ManagerQry[Index: Integer]: TQuery read GetManagerQry;
    property ManagerCombo[Index: Integer]: TDBLookupComboBox read GetManagerCombo;
    property IdentEdit[Index: Integer]: TEdit read GetIdentEdit;
    property IdentField[Index: Integer]: TStringField read GetIdentField;
    property IdentLabel[Index: Integer]: TLabel read GetIdentLabel;
  end;

var
  ManagerChangeDlg: TManagerChangeDlg;

function ExecuteManagerChangeDlg(const Database, Title: string;
  Sign: Boolean; var ManId1, ManId2: Integer; var Perm1, Perm2: Integer): Boolean;


implementation

uses TourDbUn, TourMbplIf, TourCmnlIf, TourConsts, VDlgs;

{$R *.dfm}

function ExecuteManagerChangeDlg(const Database, Title: string;
  Sign: Boolean; var ManId1, ManId2: Integer; var Perm1, Perm2: Integer): Boolean;
begin
  with TManagerChangeDlg.Create(Application) do
  try
    PrepareQueries(Database, Perm1, Perm2);
    Manager1 := ManId1;
    Manager2 := ManId2;
    ToggleControlEnabled(Name1DBLookupComboBox, not Sign);
    if Name1DBLookupComboBox.Enabled then ActiveControl := Name1DBLookupComboBox
      else ActiveControl := Ident1Edit;
    Caption := Caption + ':'#32 + Title;
    Result := ShowModal = mrOk;
    if Result then
    begin
      ManId1 := Manager1;
      ManId2 := Manager2;
      Result := (ManId1 > 0) and (ManId2 > 0);
      if Manager1QryTMUSERID.Value = ManId1 then
        Perm1 := Manager1QryTMPERMLEVEL.Value;
      if Manager2QryTMUSERID.Value = ManId2 then
        Perm2 := Manager2QryTMPERMLEVEL.Value;
    end;
  finally
    Free;
  end;
end;

const
  fId = 'TmUserId';
  fName = 'TmUserName';
  fLogin = 'TmLogin';
  nMaxManPass = 3;

{ TManagerChangeDlg }

function TManagerChangeDlg.CheckManager(const Index: Integer): Boolean;
var Id: Integer;
begin
  Id := GetManagerId(Index);
  Result := (Id <> 0) and ManagerQry[Index].Locate(fId, Id, []);
end;

function TManagerChangeDlg.CheckManPass(const Index: Integer): Boolean;
begin
  Inc(FManPass[Index]);
  Result := IdentEdit[Index].Text = GetInfoServStr(IdentField[Index].AsString);
  if not Result then
  begin
    ActiveControl := IdentEdit[Index];
    ErrorFmtDlg(SManPwFrmInputError, [IdentLabel[Index].Caption]);
  end;
end;

function TManagerChangeDlg.GetIdentEdit(Index: Integer): TEdit;
begin
  case Index of
    0: Result := Ident1Edit;
    1: Result := Ident2Edit;
  else Result := nil;
  end;
end;

function TManagerChangeDlg.GetIdentField(Index: Integer): TStringField;
begin
  case Index of
    0: Result := Manager1QryTMUSERINFO1;
    1: Result := Manager2QryTMUSERINFO1;
  else Result := nil;
  end;
end;

function TManagerChangeDlg.GetIdentLabel(Index: Integer): TLabel;
begin
  case Index of
    0: Result := Ident1Label;
    1: Result := Ident2Label;
  else Result := nil;
  end;
end;

function TManagerChangeDlg.GetManagerCombo(Index: Integer): TDBLookupComboBox;
begin
  case Index of
    0: Result := Name1DBLookupComboBox;
    1: Result := Name2DBLookupComboBox;
  else Result := nil;
  end;
end;

function TManagerChangeDlg.GetManagerId(const Index: Integer): Integer;
begin
  try
    case Index of
      0: Result := Name1DBLookupComboBox.KeyValue;
      1: Result := Name2DBLookupComboBox.KeyValue;
    else Result := 0;
    end;
  except
    Result := 0;
  end;
end;

function TManagerChangeDlg.GetManagerQry(Index: Integer): TQuery;
begin
  case Index of
    0: Result := Manager1Qry;
    1: Result := Manager2Qry;
  else Result := nil;
  end;
end;

procedure TManagerChangeDlg.PrepareQueries(
  const DatabaseName: string; Perm1, Perm2: Integer);
begin
  Manager1Qry.DatabaseName := DatabaseName;
  Manager2Qry.DatabaseName := DatabaseName;
  Manager1Qry.ParamByName('Perm').Value := Perm1;
  Manager2Qry.ParamByName('Perm').Value := Perm2;
  UpdateQuery(Manager1Qry);
  UpdateQuery(Manager2Qry);
end;

procedure TManagerChangeDlg.SetManagerId(const Index, Value: Integer);
begin
  if ManagerQry[Index].Locate(fId, Value, []) and (ManagerCombo[Index].KeyValue <> Value)
  then
    ManagerCombo[Index].KeyValue := Value;
end;

procedure TManagerChangeDlg.FormCreate(Sender: TObject);
begin
  inherited;
  FManPass[0] := 0;
  FManPass[1] := 0;
end;

procedure TManagerChangeDlg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then
  begin
    if not CheckManager(0) or not CheckManager(1) then ModalResult := mrCancel
    else if not CheckManPass(0)or not CheckManPass(1) then
    begin
      if (FManPass[0] < nMaxManPass) or (FManPass[1] < nMaxManPass)
      then CanClose := False
      else ModalResult := mrCancel;
    end;
  end;
  inherited;
end;

end.
