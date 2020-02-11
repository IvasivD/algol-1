unit TmplFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdActns, ActnList, Menus, Db, StdCtrls, Buttons, ExtCtrls, DBCtrls,
  ComCtrls, Spin;

type
  TTouristTemplateForm = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RequiredDBCheckBoxClick(Sender: TObject);
    procedure LastVisitDBCheckBoxClick(Sender: TObject);
    procedure SpouseCheckBoxClick(Sender: TObject);
    procedure PassportExpireCheckEditChange(Sender: TObject);
    procedure DocumentsBtnClick(Sender: TObject);
    procedure DeleteBtnClick(Sender: TObject);
    procedure CleanBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FMayBeDeleted: Boolean;
    FIsClosing: Boolean;
    function AllChecked: Boolean;
    function AllUnChecked: Boolean;
    procedure ClearChecks;
    function IsDefault: Boolean;
    procedure LoadGroupControls(GroupBox: TGroupBox; CheckBox: TCheckBox);
    procedure StoreGroupControls(GroupBox: TGroupBox; CheckBox: TCheckBox);
    procedure ToggleCheckBoxRequired(CheckBox: TDBCheckBox; Required: Boolean);
  protected
    procedure GotoInputError;
    procedure SearchInputError;
  public
    property MayBeDeleted: Boolean read FMayBeDeleted write FMayBeDeleted;
  end;

var
  TouristTemplateForm: TTouristTemplateForm;

implementation

uses ServMod, VDlgs, TourConsts, SelDocDlg, TourCmnlIf{, DocLstDlg};

{$R *.DFM}

{ TTouristTemplateForm }

function TTouristTemplateForm.AllChecked: Boolean;
var I: Integer;
begin
  Result := True;
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TDBCheckBox and not (Components[I] as TDBCheckBox).Checked
    then begin
      Result := False;
      Break;
    end;
end;

function TTouristTemplateForm.AllUnChecked: Boolean;
var I: Integer;
begin
  Result := True;
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TDBCheckBox and (Components[I] as TDBCheckBox).Checked
    then begin
      Result := False;
      Break;
    end;
end;

procedure TTouristTemplateForm.ClearChecks;
var I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TDBCheckBox then
      (Components[I] as TDBCheckBox).Field.AsBoolean := False;
 { ParentCheckBox.Checked := False;
  SpouseCheckBox.Checked := False;
  OccupationCheckBox.Checked := False;
  ChildrenCheckBox.Checked := False;
  ReturnCheckBox.Checked := False;
  TransitCheckBox.Checked := False; }
end;

function TTouristTemplateForm.IsDefault: Boolean;
begin
 // Result := AllChecked and (LastVisitsComboBox.ItemIndex <= 0)
  //  and (LastEmbassyComboBox.ItemIndex <= 0);
end;

procedure TTouristTemplateForm.LoadGroupControls(
  GroupBox: TGroupBox; CheckBox: TCheckBox);
var I: Integer;
begin
  CheckBox.Checked := False;
  ToggleGroupControls(GroupBox, True);
  with GroupBox do
    for I := 0 to ControlCount - 1 do
      if (Controls[I] is TDBCheckBox) then
      begin
        if (Controls[I] as TDBCheckBox).Checked then
        begin
          CheckBox.Checked := True;
          //Break;
        end;
        if Assigned((Controls[I] as TDBCheckBox).OnClick) then
          (Controls[I] as TDBCheckBox).OnClick(Controls[I] as TDBCheckBox);
      end;
  if not CheckBox.Checked then ToggleGroupControls(GroupBox, False);
end;

procedure TTouristTemplateForm.StoreGroupControls(GroupBox: TGroupBox;
  CheckBox: TCheckBox);
var I: Integer;
begin
  if not CheckBox.Checked then
    with GroupBox do
      for I := 0 to ControlCount - 1 do
        if (Controls[I] is TDBCheckBox) then
          (Controls[I] as TDBCheckBox).Field.AsBoolean := False;
end;

procedure TTouristTemplateForm.ToggleCheckBoxRequired(CheckBox: TDBCheckBox;
  Required: Boolean);
begin
  with CheckBox do
  begin
    if Required then
    begin
      if Assigned(Field) then Field.AsBoolean := True; // else Checked := True;
      if Assigned(OnClick) then OnClick(CheckBox);
    end;
    Enabled := not Required;
  end;
end;

procedure TTouristTemplateForm.GotoInputError;
begin
  //case InputErrorCode of
 //   iecAllUnChecked: ActiveControl := BirthDateDBCheckBox;
 // end;
end;

procedure TTouristTemplateForm.SearchInputError;
begin
 { if AllUnChecked then InputErrorCode := iecAllUnChecked
  else if IsDefault and not ConfirmDlgYC(STmplFrmConfirmAllChecked)
    then InputErrorCode := iecSilentError
  else InputErrorCode := iecSuccess;  }
end;

procedure TTouristTemplateForm.FormCreate(Sender: TObject);
begin
 { inherited;
  DictionPart := nDictPartCity;
  FMayBeDeleted := False;
  FIsClosing := False;}
end;

procedure TTouristTemplateForm.FormActivate(Sender: TObject);
begin
  {inherited;
  with LastEmbassyComboBox do
    try
      ItemIndex := Elem_AnketTempTable.DB.FieldByName('LASTEMBASSYFILTER').asInteger;
    except
      ItemIndex := -1;
    end;
  with LastVisitsComboBox do
    try
      ItemIndex := Elem_AnketTempTable.DB.FieldByName('LASTVISITFILTER').asInteger;
    except
      ItemIndex := -1;
    end;
  LoadGroupControls(ParentGroupBox, ParentCheckBox);
  LoadGroupControls(SpouseGroupBox, SpouseCheckBox);
  LoadGroupControls(ChildrenGroupBox, ChildrenCheckBox);
  LoadGroupControls(OccupationGroupBox, OccupationCheckBox);
  with PassportExpireCheckEdit do
  begin
    Value := Elem_AnketTempTable.DB.FieldByName('PASSPORTEXPIREMONTHS').asInteger;
    PassportExpireCheckBox.Checked := Value > 0;
  end;
  PassportExpireCheckEditChange(nil);
  LoadGroupControls(ReturnGroupBox, ReturnCheckBox);
  LoadGroupControls(TransitGroupBox, TransitCheckBox);
  LastVisitDBCheckBoxClick(LastEmbassyDBCheckBox);
  LastVisitDBCheckBoxClick(LastVisitDBCheckBox);
  ToggleControlReadOnly(DBDocuments, True);
  CleanBtn.Enabled := CanBeEdited;
  DeleteBtn.Enabled := CanBeEdited; }
end;

procedure TTouristTemplateForm.RequiredDBCheckBoxClick(Sender: TObject);
var
  Required: TDBCheckBox;
  RequireFlag: Boolean;
  SenderTag: Integer;
begin
 { if FIsClosing then Exit;
  SenderTag := (Sender as TComponent).Tag;
  case SenderTag of
    1: Required := OldSurNameDBCheckBox;
    2: Required := SpouseSurNameDBCheckBox;
    3: Required := SpouseNameDBCheckBox;
    4: Required := SpouseOldSurNameDBCheckBox;
    5: Required := FatherCyrDBCheckBox;
    6: Required := MotherCyrDBCheckBox;
    7: Required := MotherOldCyrDBCheckBox;
    8: Required := ChildSurNameDBCheckBox;
    9: Required := ChildNameDBCheckBox;
    10: Required := GarantDBCheckBox;
    11: Required := AddrToNameDBCheckBox;
  else Required := nil;
  end;
  if Assigned(Required) then
  begin
    case SenderTag of
      10: RequireFlag := GarantAddressDBCheckBox.Checked
        or GarantNationalityDBCheckBox.Checked or GarantPhoneDBCheckBox.Checked;
      11: RequireFlag :=
        AddressToDBCheckBox.Checked or AddrToPhoneDBCheckBox.Checked;
    else RequireFlag := (Sender as TDBCheckBox).Checked;
    end;
    ToggleCheckBoxRequired(Required, RequireFlag);
  end;}
end;

procedure TTouristTemplateForm.LastVisitDBCheckBoxClick(Sender: TObject);
var Combo: TComboBox;
begin
 { case (Sender as TComponent).Tag of
    6: Combo := LastEmbassyComboBox;
    7: Combo := LastVisitsComboBox;
  else Combo := nil;
  end;
  if Combo <> nil then
    ToggleControlEnabled(Combo, (Sender as TDBCheckBox).Field.AsBoolean); }
end;

procedure TTouristTemplateForm.SpouseCheckBoxClick(Sender: TObject);
var GroupBox: TGroupBox;
begin
 { with Sender as TCheckBox do
  begin
    case Tag of
      1: GroupBox := SpouseGroupBox;
      2: GroupBox := OccupationGroupBox;
      3: GroupBox := ChildrenGroupBox;
      4: GroupBox := ReturnGroupBox;
      5: GroupBox := TransitGroupBox;
      6: GroupBox := ParentGroupBox;
    else GroupBox := nil;
    end;
    if GroupBox <> nil then ToggleGroupControls(GroupBox, Checked);
  end;}
end;

procedure TTouristTemplateForm.PassportExpireCheckEditChange(Sender: TObject);
begin
 { PassportExpireCheckLabel.Caption :=
    MonthCountString(PassportExpireCheckEdit.Value); }
end;

procedure TTouristTemplateForm.DocumentsBtnClick(Sender: TObject);
var Docs: TStrings;
begin
 { Docs := TStringList.Create;
  try
      if ExecuteVisaDocumentListDlg(Elem_AnketTempTable.DB.FieldByName('COUNTRYID').asInteger, Docs) then
      DBDocuments.Text := StringsToDelimited(Docs);
  finally
    Docs.Free;
  end;  }
end;

procedure TTouristTemplateForm.DeleteBtnClick(Sender: TObject);
begin
 { if WarningDlgYC(STmplFrmWarningDelete) then
  begin
    FMayBeDeleted := DataSrc.State = dsEdit;
    ModalResult := mrCancel;
  end; }
end;

procedure TTouristTemplateForm.CleanBtnClick(Sender: TObject);
begin
  ClearChecks;
end;

procedure TTouristTemplateForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 { if (ModalResult = mrOk) and (DataSrc.State in [dsInsert, dsEdit]) then
  begin
    with DMServ.AnketTempTablePASSPORTEXPIREMONTHS do
      if PassportExpireCheckBox.Checked then
        Value := PassportExpireCheckEdit.Value
      else Clear;
    with DMServ.AnketTempTableLASTVISITFILTER do
      if LastVisitsComboBox.ItemIndex < 0 then
        Clear else Value := LastVisitsComboBox.ItemIndex;
    with DMServ.AnketTempTableLASTEMBASSYFILTER do
      if LastEmbassyComboBox.ItemIndex < 0 then
        Clear else Value := LastEmbassyComboBox.ItemIndex;
    StoreGroupControls(ParentGroupBox, ParentCheckBox);
    StoreGroupControls(SpouseGroupBox, SpouseCheckBox);
    StoreGroupControls(ChildrenGroupBox, ChildrenCheckBox);
    StoreGroupControls(OccupationGroupBox, OccupationCheckBox);
    StoreGroupControls(ReturnGroupBox, ReturnCheckBox);
    StoreGroupControls(TransitGroupBox, TransitCheckBox);
  end;
  inherited;
  FIsClosing := ModalResult <> mrNone;  }
end;

end.
