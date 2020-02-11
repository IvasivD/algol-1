unit ManEdFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZTDlg, Db, DBTables, StdActns, ActnList, Menus, StdCtrls, Buttons,
  ExtCtrls, Mask, DBCtrls, Spin, AzComboBox;

type
  TManagerEditDlg = class(TZTourDialog)
    UserNameLabel: TLabel;
    UserNameDBEdit: TDBEdit;
    Label2: TLabel;
    UserSurNameDBEdit: TDBEdit;
    FullNameLabel: TLabel;
    FullNameDBEdit: TDBEdit;
    PermLevPanel: TPanel;
    PermLevLabel: TLabel;
    PermLevComboBox: TAzComboBox;
    Label1: TLabel;
    CategComboBox: TAzComboBox;
    PbxAccntEdit: TEdit;
    PbxAccntLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UserSurNameDBEditExit(Sender: TObject);
    procedure FullNameDBEditEnter(Sender: TObject);
    procedure FullNameDBEditExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FOldPbxAccntCode: String;
    procedure ChangePermLevel;
    procedure ChangeUserCateg;
    function CheckPbxAccntCode: Boolean;
    function CheckUniquePass: Boolean;
    function GetPermLevValue: Integer;
    function GetUserCatValue: Integer;
    procedure LoadPbxAccntCode;
    procedure SetPermLevValue(const Value: Integer);
    procedure SetUserCatValue(const Value: Integer);
    procedure StorePbxAccntCode;
  protected
    procedure ApplyForAllRecords; override;
    procedure GotoInputError; override;
    procedure SearchInputError(CheckRate: Boolean = True); override;
    property PermLevValue: Integer read GetPermLevValue write SetPermLevValue;
    property UserCatValue: Integer read GetUserCatValue write SetUserCatValue;
  end;

{var
  ManagerEditDlg: TManagerEditDlg;}

function ExecuteManagerEditDlg(AddNew: Boolean): Boolean;


implementation

uses DataMod, TourCmnlIf, TourConsts, TourStrMag, TourDbUn, KeyQryDlg,
  TourMbplIf, VDlgs;

{$R *.DFM}

function ExecuteManagerEditDlg(AddNew: Boolean): Boolean;
begin
  Result := False;
  with DM.ManagerTable do
  begin
    if not Active then Open;
    if not AddNew and not Locate('TmUserId', DM.ManagerQryTMUSERID.Value, [])
      then Exit;
  end;
  with TManagerEditDlg.Create(Application) do
    try
      ToggleControlReadOnly(UserNameDBEdit, not AddNew);
      ToggleControlReadOnly(UserSurNameDBEdit, not AddNew);
      ToggleControlReadOnly(FullNameDBEdit, not AddNew);
      Result := ShowRecord(AddNew);
      if Result then
        with DM do
        begin
          ChangeCompPerson;
          UpdateManagerQry;
          ManagerQry.Locate('TMUSERID', ManagerTableTMUSERID.Value, []);
        end;
    finally
      Free;
    end;
end;

{ TManagerEditDlg }

procedure TManagerEditDlg.ChangePermLevel;
var
  CurPrm, NewPrm: Integer;
  Res: Boolean;
begin
  CurPrm := DM.ManagerTableTMPERMLEVEL.Value;
  NewPrm := PermLevValue;
  if NewPrm <> CurPrm then
  begin
    Res := False;
    if DM.CurManPerm < 8 then
      ErrorFmtDlg(SDataModErrorFieldAccessDenied, [PermLevLabel.Caption])
    else begin
      Res := CheckUniquePass;
      if not Res then
        ErrorFmtDlg(SDataModErrorUniquePass, [PermLevLabel.Caption, SVDlgsPassword])
      else
        with DM, ManagerTable do
        begin
          if not (State in [dsEdit, dsInsert]) then Edit;
          ManagerTableTMPERMLEVEL.Value := NewPrm;
        end;
    end;
    if not Res then PermLevValue := CurPrm;
  end;
end;

procedure TManagerEditDlg.ChangeUserCateg;
var
  CurCat, NewCat: Integer;
  Res: Boolean;
begin
  CurCat := DM.ManagerTableUSERCATEGORY.Value;
  NewCat := UserCatValue;
  if NewCat <> CurCat then
  begin
    Res := False;
    if DM.CurManPerm < 8 then
      ErrorFmtDlg(SDataModErrorFieldAccessDenied, [PermLevLabel.Caption])
    else
      with DM, ManagerTable do
      begin
        if not (State in [dsEdit, dsInsert]) then Edit;
        ManagerTableUSERCATEGORY.Value := NewCat;
      end;
    if not Res then UserCatValue := CurCat;
  end;
end;

function TManagerEditDlg.CheckPbxAccntCode: Boolean;
var PbxAccnt, Confrm: String;
begin
  PbxAccnt := PbxAccntEdit.Text;
  Result := (PbxAccnt = FOldPbxAccntCode)
    or (PbxAccnt = '') and WarningDlgYC(SManEdFrmWarningPbxAccntEmpty)
    or (PbxAccnt <> '')
      and ExecutePrivateKeyInputDlg(SVDlgsConfirm, PbxAccntLabel.Caption, Confrm)
      and (Confrm = PbxAccnt);
  if not Result then ActiveControl := PbxAccntEdit;
end;

function TManagerEditDlg.CheckUniquePass: Boolean;
begin
  with DM do Result := CheckPassCount(ManagerTableTMUSERID.Value) < 2;
end;

function TManagerEditDlg.GetPermLevValue: Integer;
begin
  with PermLevComboBox do Result := Integer(Items.Objects[ItemIndex]);
end;

function TManagerEditDlg.GetUserCatValue: Integer;
begin
  with CategComboBox do Result := Integer(Items.Objects[ItemIndex]);
end;

procedure TManagerEditDlg.LoadPbxAccntCode;
begin                                                                    
  FOldPbxAccntCode := GetInfoServStrN(DM.ManagerTableTMUSERINFO2.Value);
  PbxAccntEdit.Text := FOldPbxAccntCode;
end;

procedure TManagerEditDlg.SetPermLevValue(const Value: Integer);
begin
  with PermLevComboBox do ItemIndex := Items.IndexOfObject(Pointer(Value));
end;

procedure TManagerEditDlg.SetUserCatValue(const Value: Integer);
begin
  with CategComboBox do ItemIndex := Items.IndexOfObject(Pointer(Value));
end;

procedure TManagerEditDlg.StorePbxAccntCode;
begin
  DM.ManagerTableTMUSERINFO2.Value := SetInfoServStrN(PbxAccntEdit.Text);
end;

procedure TManagerEditDlg.ApplyForAllRecords;
begin
end;

procedure TManagerEditDlg.GotoInputError;
begin
  case InputErrorCode of
    iecSurNameIsNull: ActiveControl := UserSurNameDBEdit;
    iecNameIsNull: ActiveControl := UserNameDBEdit;
  end;
end;

procedure TManagerEditDlg.SearchInputError(CheckRate: Boolean);
begin
  if Trim(UserNameDBEdit.Text) = '' then InputErrorCode := iecNameIsNull
  else if Trim(UserSurNameDBEdit.Text) = '' then InputErrorCode := iecSurNameIsNull
  else if (Trim(FullNameDBEdit.Text) = '')
    and not ConfirmFmtDlgYN(SZTDlgErrFieldIsNull, [FullNameLabel.Caption])
  then begin
    ActiveControl := FullNameDBEdit;
    InputErrorCode := iecSilentError;
  end
  else if not CheckPbxAccntCode then InputErrorCode := iecSilentError
  else InputErrorCode := iecSuccess;
end;

procedure TManagerEditDlg.FormCreate(Sender: TObject);
begin
  inherited;
  UpdateQuery(DM.PermLevQry);
  DataFieldToStrings(
    DM.PermLevQryPERMNAME, DM.PermLevQryTMPERMLEVEL, PermLevComboBox.Items);
  DataFieldToStrings(
    DM.CategQryCATEGNAME, DM.CategQryCATEGID, CategComboBox.Items);
end;

procedure TManagerEditDlg.FormActivate(Sender: TObject);
begin
  inherited;
  PermLevPanel.Visible := DM.CurManPerm >= 8;
  PermLevValue := DM.ManagerTableTMPERMLEVEL.Value;
  UserCatValue := DM.ManagerTableUSERCATEGORY.Value;
  LoadPbxAccntCode;
end;

procedure TManagerEditDlg.UserSurNameDBEditExit(Sender: TObject);
var N: String;
begin
  DBPersonNameExit(Sender);
  with FullNameDBEdit do
    if Text = '' then
    begin
      if UserNameDBEdit.Text = '' then N := ''
      else N := AnsiUpperCase(Copy(UserNameDBEdit.Text, 1, 1)) + '.';
      Field.Text := UserSurNameDBEdit.Text + #32 + N;
    end;
end;

procedure TManagerEditDlg.FullNameDBEditEnter(Sender: TObject);
begin
  with Sender as TDBEdit do
  begin
    SelStart := Length(Text);
    SelLength := 0;
  end;
end;

procedure TManagerEditDlg.FullNameDBEditExit(Sender: TObject);
begin
  DBPersonNameExit(Sender);
  with FullNameDBEdit do Text := Sentence(Text);
end;

procedure TManagerEditDlg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then
  begin
    ChangePermLevel;
    ChangeUserCateg;
    StorePbxAccntCode;
  end;
  inherited;
end;

end.
