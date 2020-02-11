unit TmplFrmNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdActns, ActnList, Menus, DB, StdCtrls, Buttons,
  ComCtrls, ExtCtrls, DBCtrls, Mask, Spin, AzEdit;

type
  TTouristTemplateNewForm = class(TForm)
    procedure CheckBoxClick(Sender: TObject);
    procedure CyrLabelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DeleteBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure CleanBtnClick(Sender: TObject);
    procedure InsaidPassCheckBoxClick(Sender: TObject);
    procedure PassportCheckBoxClick(Sender: TObject);
    procedure DBCheckBoxClick(Sender: TObject);
    procedure RequiredDBCheckBoxClick(Sender: TObject);
    procedure UnRequiredDBCheckBoxClick(Sender: TObject);
    procedure PassportExpireCheckEditChange(Sender: TObject);
    procedure TourCheckBoxClick(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure HasMoneyCheckBoxClick(Sender: TObject);
    procedure PersContactCheckBoxClick(Sender: TObject);
    procedure OldVisaLastYearDBCheckBoxClick(Sender: TObject);
    procedure PassportExpireCheckBoxClick(Sender: TObject);
    procedure OldVisaForYearDBEditChange(Sender: TObject);
  private
    FMayBeDeleted: Boolean;
    FAllow: Boolean;
    procedure LoadGroupControls(GroupBox: TGroupBox; CheckBox: TCheckBox;
      ToDBEdit: TDBEdit);
    procedure ClearChecks(aChecked: Boolean);
    procedure LoadPassportCheckBox;
    procedure LoadInsaidPassCheckBox;
    procedure LoadHasMoneyCheckBox;
    procedure LoadPersContactCheckBox;
    procedure SetInsaidPassCheckBox;
    procedure SetPassportCheckBox;
    procedure SetHasMoneyCheckBox;
    procedure SetPersContactCheckBox;
    procedure StoreGroupControls(GroupBox: TGroupBox; CheckBox: TCheckBox);
    function AllChecked: Boolean;
    function AllUnChecked: Boolean;
    function IsDefault: Boolean;
    function ToEditIsEmpty: Boolean;
    procedure ToggleCheckBoxReadOnly(Control: TComponent; ROnly: Boolean);
    procedure ToggleCheckBoxRequired(aTag: Integer; aChecked: Boolean);
    procedure ToggleCheckBoxUnRequired(aTag: Integer; aChecked: Boolean);
    function GetPassChecked: Boolean;
    function GetFatherChecked: Boolean;
    function GetMotherChecked: Boolean;
    function GetChildChecked: Boolean;
    function GetGuardianChecked: Boolean;
    function GetSpouseChecked: Boolean;
  protected
    property PassChecked: Boolean read GetPassChecked;
    property FatherChecked: Boolean read GetFatherChecked;
    property MotherChecked: Boolean read GetMotherChecked;
    property SpouseChecked: Boolean read GetSpouseChecked;
    property ChildChecked: Boolean read GetChildChecked;
    property GuardianChecked: Boolean read GetGuardianChecked;
    procedure SearchInputError;
    procedure GotoInputError;
    procedure StoreDataFields;
  public
    property MayBeDeleted: Boolean read FMayBeDeleted write FMayBeDeleted;
  end;
                 
var
  TouristTemplateNewForm: TTouristTemplateNewForm;

implementation

uses
  ServMod,  TourCmnlIf, TourConsts;

{$R *.dfm}

procedure TTouristTemplateNewForm.CheckBoxClick(Sender: TObject);
var GroupBox: TGroupBox;
    ToDbEdit: TDBEdit;
begin
 { ToDbEdit := nil;
  with Sender as TCheckBox do
  begin
    case Tag of
      1: begin
           GroupBox := FatherGroupBox;
           ToDbEdit := FatherToDBEdit;
         end;
      2:  begin
           GroupBox := MotherGroupBox;
           ToDbEdit := MotherToDBEdit;
         end;
      3:  begin
           GroupBox := SpouseGroupBox;
           ToDbEdit := SpouseWithDBEdit;
         end;
      4:  begin
           GroupBox := ChildGroupBox;
           ToDbEdit := ChildWithDBEdit;
         end;
      5:  begin
           GroupBox := GuardianGroupBox;
           ToDbEdit := GuardianToDBEdit;
         end;
      6: GroupBox := OccupationGroupBox;
    else GroupBox := nil;
    end;
    if GroupBox <> nil then ToggleGroupControls(GroupBox, Checked and CanBeEdited);
    if ToDbEdit <> nil then ToggleControlEnabled(ToDbEdit, Checked and CanBeEdited);
  end;
  DBCheckBoxClick(Sender);  }
end;

procedure TTouristTemplateNewForm.CyrLabelClick(
  Sender: TObject);
var ChkBox: TDBCheckBox;  
begin
  {with Sender as TLabel do
  case Tag of
    1: ChkBox := FatherOldCyrDBCheckBox;
    2: ChkBox := MotherOldCyrDBCheckBox;
    3: ChkBox := SpouseOldSurNameDBCheckBox;
    4: ChkBox := ChildOldCyrDBCheckBox;
    5: ChkBox := GuardianOldCyrDBCheckBox;
    201: ChkBox := ShengenDBCheckBox;
  else ChkBox := nil;
  end;
  with ChkBox do if Enabled and not ReadOnly then Field.AsBoolean := not Checked;}
end;

procedure TTouristTemplateNewForm.FormCreate(Sender: TObject);
begin
 { FAllow := False;
  inherited;
  DictionPart := nDictPartCity;
  FMayBeDeleted := False;}
end;

procedure TTouristTemplateNewForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  {if (ModalResult = mrOk) and (DataSrc.State in [dsInsert, dsEdit]) then
  begin
    StoreGroupControls(FatherGroupBox, FatherCheckBox);
    StoreGroupControls(MotherGroupBox, MotherCheckBox);
    StoreGroupControls(SpouseGroupBox, SpouseCheckBox);
    StoreGroupControls(ChildGroupBox, ChildCheckBox);
    StoreGroupControls(GuardianGroupBox, GuardianCheckBox);
    StoreGroupControls(OccupationGroupBox, OccupationCheckBox);
    
    SetPassportCheckBox;
    SetInsaidPassCheckBox;    

    StoreGroupControls(OldVisaGroupBox, OldVisaCheckBox);
    StoreGroupControls(TransitGroupBox, TransitCheckBox);
    StoreGroupControls(PermToStayGroupBox, PermToStayCheckBox);
    StoreGroupControls(BioGroupBox, BioCheckBox);
    StoreGroupControls(TravelGroupBox, TravelCheckBox);
    StoreGroupControls(LocalityGroupBox, LocalityCheckBox);
    StoreGroupControls(PersonGarantGroupBox, PersonGarantCheckBox);
    StoreGroupControls(GarantGroupBox, GarantCheckBox);
    StoreGroupControls(ApplFormGroupBox, ApplFormCheckBox);

    SetHasMoneyCheckBox;
    SetPersContactCheckBox
  end;
  inherited;
  FAllow := False; }
end;

procedure TTouristTemplateNewForm.DeleteBtnClick(Sender: TObject);
begin
 { inherited;
  if WarningDlgYC(STmplFrmWarningDelete) then
  begin
    FMayBeDeleted := DataSrc.State = dsEdit;
    ModalResult := mrCancel;
  end;}
end;

procedure TTouristTemplateNewForm.FormActivate(Sender: TObject);
begin
  {inherited;
  PageControl.ActivePageIndex := 0;
  FAllow := True;

  LoadGroupControls(TouristGroupBox, nil, nil);
  LoadGroupControls(FatherGroupBox, FatherCheckBox, FatherToDBEdit);
  LoadGroupControls(MotherGroupBox, MotherCheckBox, MotherToDBEdit);
  LoadGroupControls(ChildGroupBox, ChildCheckBox, ChildWithDBEdit);
  LoadGroupControls(SpouseGroupBox, SpouseCheckBox, SpouseWithDBEdit);
  LoadGroupControls(GuardianGroupBox, GuardianCheckBox, GuardianToDBEdit);
  LoadGroupControls(OccupationGroupBox, OccupationCheckBox, nil);

  LoadInsaidPassCheckBox;
  LoadPassportCheckBox;

  LoadGroupControls(OldVisaGroupBox, OldVisaCheckBox, nil);
  LoadGroupControls(TransitGroupBox, TransitCheckBox, nil);
  LoadGroupControls(PermToStayGroupBox, PermToStayCheckBox, nil);
  LoadGroupControls(BioGroupBox, BioCheckBox, nil);
  LoadGroupControls(TravelGroupBox, TravelCheckBox, nil);
  LoadGroupControls(LocalityGroupBox, LocalityCheckBox, nil);
  LoadGroupControls(PersonGarantGroupBox, PersonGarantCheckBox, nil);
  LoadGroupControls(GarantGroupBox, GarantCheckBox, nil);
  LoadGroupControls(ApplFormGroupBox, ApplFormCheckBox, nil);

  loadHasMoneyCheckBox;
  LoadPersContactCheckBox;
  ToggleGroupControls(PassportExpireGroupBox, CanBeEdited);
  with PassportExpireCheckEdit do    
  begin
    Text := Elem_AnketTempTable.DB.FieldByName('PASSPORTEXPIREMONTHS').asString;
    PassportExpireCheckBox.Checked := SafeStrToInt(Text) > 0;
  end;
  PassportExpireCheckEditChange(nil);
  CleanBtn.Enabled := CanBeEdited;
  DeleteBtn.Enabled := CanBeEdited;}
end;

procedure TTouristTemplateNewForm.LoadGroupControls(GroupBox: TGroupBox;
  CheckBox: TCheckBox; ToDBEdit: TDBEdit);
var I: Integer;
  CheckBoxAssign: Boolean;
begin
  {CheckBoxAssign := Assigned(CheckBox);
  if CheckBoxAssign then CheckBox.Checked := False;

  ToggleGroupControls(GroupBox, CanBeEdited);

  with GroupBox do
    for I := 0 to ControlCount - 1 do
      if (Controls[I] is TDBCheckBox) then
      begin
        if CheckBoxAssign and (Controls[I] as TDBCheckBox).Checked then CheckBox.Checked := True;
        if Assigned((Controls[I] as TDBCheckBox).Field) and (Controls[I] as TDBCheckBox).Field.IsNull 
        then (Controls[I] as TDBCheckBox).Checked := False;
        if Assigned((Controls[I] as TDBCheckBox).OnClick) then (Controls[I] as TDBCheckBox).OnClick(Controls[I] as TDBCheckBox);
      end;
  if CheckBoxAssign and not CheckBox.Checked then ToggleGroupControls(GroupBox, False);
  if Assigned(ToDBEdit) then ToggleControlEnabled(ToDBEdit, CheckBox.Checked and CanBeEdited); }
end;

procedure TTouristTemplateNewForm.CleanBtnClick(Sender: TObject);
begin
  inherited;
  ClearChecks((Sender as TSpeedButton).Tag = 1);
end;

procedure TTouristTemplateNewForm.ClearChecks(aChecked: Boolean);
var GroupTabSeet: TTabSheet;
  procedure ClearProc(aControl: TControl);
  var I: Integer;  
  begin
    if (aControl is TCheckBox) and (aControl as TCheckBox).Enabled then
      (aControl as TCheckBox).Checked := aChecked
    else if aControl is TDBEdit and not aChecked then
      (aControl as TDBEdit).Field.Clear
    else if aControl is TSpinEdit and not aChecked then
      (aControl as TSpinEdit).Clear
    else if (aControl is TDBCheckBox) and not (aControl as TDBCheckBox).ReadOnly then
      (aControl as TDBCheckBox).Field.AsBoolean := aChecked
    else if aControl is TTabSheet
    then for I := 0 to TTabSheet(aControl).ControlCount - 1 do
      ClearProc(TTabSheet(aControl).Controls[I])
    else if aControl is TGroupBox
    then for I := 0 to TGroupBox(aControl).ControlCount - 1 do
      ClearProc(TGroupBox(aControl).Controls[I])
  end;
begin
  {case PageControl.ActivePageIndex of
    0: GroupTabSeet := PassDataTabSheet;
    1: GroupTabSeet := TourDataTabSheet;
  else GroupTabSeet := nil;
  end;
  if Assigned(GroupTabSeet) then ClearProc(GroupTabSeet); }
end;

procedure TTouristTemplateNewForm.InsaidPassCheckBoxClick(Sender: TObject);
var chk: Boolean;
begin
 { inherited;
  chk := PassNoInsideDBCheckBox.Checked and CanBeEdited;
  PassInsideIsseedDBCheckBox.Enabled := chk;
  PassInsideDateDBCheckBox.Enabled := chk;
  ToggleControlEnabled(PassInsideWithDBEdit, chk);
//  IdentCodeDBCheckBox.Enabled := chk;
  DBCheckBoxClick(Sender);}
end;

procedure TTouristTemplateNewForm.PassportCheckBoxClick(Sender: TObject);
var chk: Boolean;
begin
  inherited;
  {chk := PassportCheckBox.Checked and CanBeEdited;
  PASSPORTNODBCheckBox.Enabled := chk;
  PASSPORTDATEDBCheckBox.Enabled := chk;
  PASSPORTEXPIREDBCheckBox.Enabled := chk;
  PassportIssueDBCheckBox.Enabled := chk;
  PassportIssueAddrDBCheckBox.Enabled := chk;
  DBCheckBoxClick(Sender); }
end;

procedure TTouristTemplateNewForm.LoadInsaidPassCheckBox;
begin
  InsaidPassCheckBoxClick(nil);
end;

procedure TTouristTemplateNewForm.LoadPassportCheckBox;
begin
 { PassportCheckBox.Checked := PASSPORTNODBCheckBox.Checked
    or PASSPORTDATEDBCheckBox.Checked
    or PASSPORTEXPIREDBCheckBox.Checked
    or PassportIssueDBCheckBox.Checked
    or PassportIssueAddrDBCheckBox.Checked;
  PassportCheckBoxClick(nil); }
end;

procedure TTouristTemplateNewForm.StoreGroupControls(GroupBox: TGroupBox;
  CheckBox: TCheckBox);
var I: Integer;
begin
  if not CheckBox.Checked then
    with GroupBox do
      for I := 0 to ControlCount - 1 do
        if (Controls[I] is TDBCheckBox) then
          (Controls[I] as TDBCheckBox).Field.AsBoolean := False;
end;

procedure TTouristTemplateNewForm.SetInsaidPassCheckBox;
begin
 { if not PassNoInsideDBCheckBox.Checked then begin
    PassInsideIsseedDBCheckBox.Field.AsBoolean := False;
    PassInsideDateDBCheckBox.Field.AsBoolean := False;
  end; }
end;

procedure TTouristTemplateNewForm.SetPassportCheckBox;
begin
  {if not PassportCheckBox.Checked then begin
    PASSPORTNODBCheckBox.Field.AsBoolean := False;
    PASSPORTDATEDBCheckBox.Field.AsBoolean := False;
    PASSPORTEXPIREDBCheckBox.Field.AsBoolean := False;
    PassportIssueDBCheckBox.Field.AsBoolean := False;
    PassportIssueAddrDBCheckBox.Field.AsBoolean := False;
  end;}
end;

//clBtnShadow
procedure TTouristTemplateNewForm.SearchInputError;
begin
  {inherited;
  if AllUnChecked then InputErrorCode := iecAllUnChecked
  else if IsDefault and not ConfirmDlgYC(STmplFrmConfirmAllChecked)
    then InputErrorCode := iecSilentError
  else if ToEditIsEmpty then InputErrorCode := iecSilentError
  else InputErrorCode := iecSuccess;}
end;

function TTouristTemplateNewForm.AllChecked: Boolean;
var I: Integer;
begin
  {Result := True;
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TDBCheckBox and not (Components[I] as TDBCheckBox).Checked
    then begin
      Result := False;
      Break;
    end; }
end;

function TTouristTemplateNewForm.AllUnChecked: Boolean;
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

function TTouristTemplateNewForm.IsDefault: Boolean;
begin
  Result := AllChecked;
end;

procedure TTouristTemplateNewForm.GotoInputError;
begin
  {inherited;
  case InputErrorCode of
    iecAllUnChecked: begin 
      PageControl.ActivePageIndex := 0;
      ActiveControl := SecondNameDBCheckBox;
    end;
  end; }
end;

function TTouristTemplateNewForm.ToEditIsEmpty: Boolean;
begin
  {with PassInsideWithDBEdit do Result := Enabled and (Trim(Text) = EmptyStr);
  if Result then begin
    ErrorDlg('Поле "Внутрішній паспорт з" має бути заповнене.');
    PageControl.ActivePageIndex := 0;
    ActiveControl := PassInsideWithDBEdit;
    Exit;
  end;
  with FatherToDBEdit do Result := Enabled and (Trim(Text) = EmptyStr);
  if Result then begin
    ErrorDlg('Поле "Батько до" має бути заповнене.');
    PageControl.ActivePageIndex := 0;
    ActiveControl := FatherToDBEdit;
    Exit;
  end;
  with MotherToDBEdit do Result := Enabled and (Trim(Text) = EmptyStr);
  if Result then begin
    ErrorDlg('Поле "Мати до" має бути заповнене.');
    PageControl.ActivePageIndex := 0;
    ActiveControl := MotherToDBEdit;
    Exit;
  end;
  with SpouseWithDBEdit do Result := Enabled and (Trim(Text) = EmptyStr);
  if Result then begin
    ErrorDlg('Поле "Подружжя з" має бути заповнене.');
    PageControl.ActivePageIndex := 0;
    ActiveControl := SpouseWithDBEdit;
    Exit;
  end;
  with ChildWithDBEdit do Result := Enabled and (Trim(Text) = EmptyStr);
  if Result then begin
    ErrorDlg('Поле "Діти з" має бути заповнене.');
    PageControl.ActivePageIndex := 0;
    ActiveControl := ChildWithDBEdit;
    Exit;
  end;
  with GuardianToDBEdit do Result := Enabled and (Trim(Text) = EmptyStr);
  if Result then begin
    ErrorDlg('Поле "Опікун для дітей до " має бути заповнене.');
    PageControl.ActivePageIndex := 0;
    ActiveControl := GuardianToDBEdit;
    Exit;
  end;
  with PassportExpireCheckEdit do Result := Enabled and (Trim(Text) = EmptyStr);
  if Result then begin
    ErrorDlg('Поле "Мінімальний термін до закінчення дії паспорта / дозволу на проживання в Україні" має бути заповнене.');
    PageControl.ActivePageIndex := 1;
    ActiveControl := PassportExpireCheckEdit;
    Exit;
  end;
  with OldVisaForYearDBEdit do Result := Enabled and (Trim(Text) = EmptyStr);
  if Result then begin
    ErrorDlg('Поле "Попередні візи за останні роки" має бути заповнене.');
    PageControl.ActivePageIndex := 1;
    ActiveControl := OldVisaForYearDBEdit;
    Exit;
  end; }
end;

procedure TTouristTemplateNewForm.StoreDataFields;
begin
  {with PassInsideWithDBEdit do if not Enabled or not PassChecked then Field.Clear;
  with FatherToDBEdit do if not Enabled or not FatherChecked then Field.Clear;
  with MotherToDBEdit do if not Enabled or not MotherChecked then Field.Clear;
  with SpouseWithDBEdit do if not Enabled or not SpouseChecked then Field.Clear;
  with ChildWithDBEdit do if not Enabled or not ChildChecked then Field.Clear;
  with GuardianToDBEdit do if not Enabled or not GuardianChecked then Field.Clear;
  
  with DMServ.AnketTempTablePASSPORTEXPIREMONTHS do
  if not PassportExpireCheckBox.Checked then Clear
  else AsString := PassportExpireCheckEdit.Text;
  with OldVisaForYearDBEdit do if not Enabled then Field.Clear; }
end;

procedure TTouristTemplateNewForm.DBCheckBoxClick(Sender: TObject);
var FindComp: TComponent;
begin
  inherited;
  if not FAllow then Exit;
  if Sender is TDBCheckBox then 
    with Sender as TDBCheckBox do begin 
//      if Checked then DMServ.AnketTempTable.FieldByName('ANKET' + DataField).AsBoolean := True;
//      FindComp := Self.FindComponent('Anket' + Name);
//      if FindComp <> nil then begin 
//        ToggleCheckBoxReadOnly(FindComp, Checked); 
        case Tag of 
          1..5: ToggleCheckBoxUnRequired(Tag, Checked);
          6..23: ToggleCheckBoxRequired(Tag, Checked);
          24..36: ToggleCheckBoxUnRequired(Tag, Checked);
        end;          
//      end;      
    end
{  else if Sender is TCheckBox then
    with Sender as TCheckBox do begin 
      FindComp := Self.FindComponent('Anket' + Name);
      if FindComp <> nil then ToggleCheckBoxReadOnly(FindComp, Checked);        
    end; }
end;

procedure TTouristTemplateNewForm.ToggleCheckBoxReadOnly(Control: TComponent;
  ROnly: Boolean);
const
  // colors
  clEditChBColors: array[Boolean] of TColor = (clWindowText, clBtnShadow);
begin
  if Control is TDBCheckBox then
  with TDBCheckBox(Control) do begin 
    ReadOnly := ROnly;
    Font.Color := clEditChBColors[ROnly];
  end else if Control is TCheckBox then
  with TCheckBox(Control) do begin 
    Checked := True;
    Enabled := not ROnly;
//    Font.Color := clEditChBColors[ROnly];
  end;  
end;

procedure TTouristTemplateNewForm.ToggleCheckBoxRequired(aTag: Integer;
  aChecked: Boolean);
var
  Required{, LabelComp}: TComponent;
  {RequireFlag, ItsAnketPage, LabelChecked: Boolean;}
//  SenderTag: Integer;
begin
 { if not FAllow then Exit;
  //  ItsAnketPage := aTag > 100;
  //  if ItsAnketPage then SenderTag := aTag - 100 else SenderTag := aTag;
  case aTag of
    6: Required := MiddleNameDBCheckBox;
    7: Required := BIRTHSURNAMEDBCheckBox;
    8: Required := OldSurNameDBCheckBox;
    9: Required := FATHERCYRDBCheckBox;
    10: Required := FATHERSECONDCYRDBCheckBox;
    11: Required := FatherOldCyrDBCheckBox;
    12: Required := MotherCyrDBCheckBox;
    13: Required := MOTHERSECONDCYRDBCheckBox;
    14: Required := MotherOldCyrDBCheckBox;
    15: Required := SpouseNameDBCheckBox;
    16: Required := SpouseSurNameDBCheckBox;
    17: Required := SpouseOldSurNameDBCheckBox;
    18: Required := ChildNameDBCheckBox;
    19: Required := CHILDSURNAMEDBCheckBox;
    20: Required := ChildOldCyrDBCheckBox;
    21: Required := GUARDIANCYRDBCheckBox;
    22: Required := GUARDIANSECONDCYRDBCheckBox;
    23: Required := GuardianOldCyrDBCheckBox;
  else Required := nil;
  end;
//  if ItsAnketPage and Assigned(Required) then Required := Self.FindComponent('Anket' + Required.Name);

  if Assigned(Required) then begin
//    RequireFlag := aChecked;
    with TDBCheckBox(Required) do
    begin
      if aChecked then
      begin
        if Assigned(Field) then Field.AsBoolean := True;
        if Assigned(OnClick) then OnClick(TDBCheckBox(Required));
      end;
//      Enabled := not RequireFlag;
    end;
  end;  }
end;

procedure TTouristTemplateNewForm.RequiredDBCheckBoxClick(
  Sender: TObject);
begin
  inherited;
  with Sender as TDBCheckBox do ToggleCheckBoxRequired(Tag, Checked);
end;

procedure TTouristTemplateNewForm.ToggleCheckBoxUnRequired(aTag: Integer;
  aChecked: Boolean);
var
  Required: TComponent;
begin
  {if not FAllow then Exit;
  case aTag of
    1: Required := FATHEROLDLATDBCheckBox;
    2: Required := MotherOldLatDBCheckBox;
    3: Required := SpouseOldSecondNameDBCheckBox;
    4: Required := CHILDOLDLATDBCheckBox;
    5: Required := GUARDIANOLDLATDBCheckBox;
    24: Required := MeddleLatNameDBCheckBox;
    25: Required := BIRTHSURNAMELATDBCheckBox;
    26: Required := OldSecondNameDBCheckBox;
    27: Required := FATHERLATDBCheckBox;
    28: Required := FATHERSECONDLATDBCheckBox;
    29: Required := MotherLatDBCheckBox;
    30: Required := MOTHERSECONDLATDBCheckBox;
    31: Required := SpouseFirstNameDBCheckBox;
    32: Required := SpouseSecondNameDBCheckBox;
    33: Required := ChildFirstNameDBCheckBox;
    34: Required := ChildSecondNameDBCheckBox;
    35: Required := GUARDIANLATDBCheckBox;
    36: Required := GUARDIANSECONDLATDBCheckBox;
  else Required := nil;
  end;

  if Assigned(Required) then begin
    with TDBCheckBox(Required) do
    begin
      if not aChecked then
      begin
        if Assigned(Field) then Field.AsBoolean := False;
        if Assigned(OnClick) then OnClick(TDBCheckBox(Required));
      end;
    end;
  end;}
end;

procedure TTouristTemplateNewForm.UnRequiredDBCheckBoxClick(
  Sender: TObject);
begin
  inherited;
  with Sender as TDBCheckBox do ToggleCheckBoxUnRequired(Tag, Checked);          
end;

procedure TTouristTemplateNewForm.PassportExpireCheckEditChange(
  Sender: TObject);
begin
 { inherited;
  PassportExpireCheckLabel.Caption :=
    MonthCountString(SafeStrToInt(PassportExpireCheckEdit.Text));  }
end;

procedure TTouristTemplateNewForm.TourCheckBoxClick(Sender: TObject);
var GroupBox: TGroupBox;
    ToDbEdit: TDBEdit;
begin
  {ToDbEdit := nil;
  with Sender as TCheckBox do
  begin
    case Tag of
      201: GroupBox := OldVisaGroupBox;
      202: GroupBox := TransitGroupBox;
      203: GroupBox := PermToStayGroupBox;
      204: GroupBox := BioGroupBox;
      205: GroupBox := TravelGroupBox;
      206: GroupBox := LocalityGroupBox;
      207: GroupBox := PersonGarantGroupBox;
      208: GroupBox := GarantGroupBox;
      209: GroupBox := ApplFormGroupBox;
    else GroupBox := nil;
    end;
    if GroupBox <> nil then ToggleGroupControls(GroupBox, Checked and CanBeEdited);
    if Tag = 201 then OldVisaLastYearDBCheckBoxClick(nil);
  end; }
end;

procedure TTouristTemplateNewForm.Label5Click(Sender: TObject);
begin
  //inherited;
  //with HasMoneyCheckBox do if Enabled then Checked := not Checked;
end;

procedure TTouristTemplateNewForm.HasMoneyCheckBoxClick(Sender: TObject);
var chk: Boolean;
begin
  //inherited;
  //chk := HasMoneyCheckBox.Checked and CanBeEdited;
  //CustDBCheckBox.Enabled := chk;
  //SponsorDBCheckBox.Enabled := chk;
end;

procedure TTouristTemplateNewForm.LoadHasMoneyCheckBox;
begin
  //HasMoneyCheckBox.Checked := CustDBCheckBox.Checked
  //  or SponsorDBCheckBox.Checked;
  //HasMoneyCheckBoxClick(nil);
end;

procedure TTouristTemplateNewForm.SetHasMoneyCheckBox;
begin
  {if not HasMoneyCheckBox.Checked then begin
    CustDBCheckBox.Field.AsBoolean := False;
    SponsorDBCheckBox.Field.AsBoolean := False;
  end; }
end;

procedure TTouristTemplateNewForm.PersContactCheckBoxClick(
  Sender: TObject);
var chk: Boolean;
begin
  {inherited;
  chk := PersContactCheckBox.Checked and CanBeEdited;
  PersContNameDBCheckBox.Enabled := chk; 
  PersContAddressDBCheckBox.Enabled := chk;
  PersContPhoneDBCheckBox.Enabled := chk; 
  PersContFaxDBCheckBox.Enabled := chk;
  PersContEmailDBCheckBox.Enabled := chk; }
end;

procedure TTouristTemplateNewForm.LoadPersContactCheckBox;
begin
  {PersContactCheckBox.Checked := PersContNameDBCheckBox.Checked
    or PersContAddressDBCheckBox.Checked
    or PersContPhoneDBCheckBox.Checked
    or PersContFaxDBCheckBox.Checked
    or PersContEmailDBCheckBox.Checked;
  PersContactCheckBoxClick(nil); }
end;

procedure TTouristTemplateNewForm.SetPersContactCheckBox;
begin
 { if not HasMoneyCheckBox.Checked then begin
    PersContNameDBCheckBox.Field.AsBoolean := False;
    PersContAddressDBCheckBox.Field.AsBoolean := False;
    PersContPhoneDBCheckBox.Field.AsBoolean := False;
    PersContFaxDBCheckBox.Field.AsBoolean := False;
    PersContEmailDBCheckBox.Field.AsBoolean := False;
  end; }
end;

procedure TTouristTemplateNewForm.OldVisaLastYearDBCheckBoxClick(
  Sender: TObject);
begin
 { inherited;
  with OldVisaLastYearDBCheckBox do
  ToggleControlEnabled(OldVisaForYearDBEdit, Enabled and Checked); }
end;

procedure TTouristTemplateNewForm.PassportExpireCheckBoxClick(
  Sender: TObject);
begin
 { inherited;
  with PassportExpireCheckBox do 
  ToggleControlEnabled(PassportExpireCheckEdit, Checked and Enabled); }
end;

function TTouristTemplateNewForm.GetPassChecked: Boolean;
begin
 { Result := PassNoInsideDBCheckBox.Checked or
    PassInsideIsseedDBCheckBox.Checked or
    PassInsideDateDBCheckBox.Checked; }
end;

function TTouristTemplateNewForm.GetFatherChecked: Boolean;
begin
 { Result := FATHERCYRDBCheckBox.Checked or
    FATHERSECONDCYRDBCheckBox.Checked or
    FatherOldCyrDBCheckBox.Checked or
    FATHERNATIONALITYDBCheckBox.Checked or
    FATHERBIRTHDATEDBCheckBox.Checked or
    FATHERBIRTHCOUNTRYDBCheckBox.Checked or
    FATHERBIRTHLOCALITYDBCheckBox.Checked;
  FatherCheckBox.Checked := Result; }
end;

function TTouristTemplateNewForm.GetMotherChecked: Boolean;
begin
 { Result := MoTHERCYRDBCheckBox.Checked or
    MoTHERSECONDCYRDBCheckBox.Checked or
    MOtherOldCyrDBCheckBox.Checked or
    MOTHERNATIONALITYDBCheckBox.Checked or
    MOTHERBIRTHDATEDBCheckBox.Checked or
    MOTHERBIRTHCOUNTRYDBCheckBox.Checked or
    MOTHERBIRTHLOCALITYDBCheckBox.Checked;
  MotherCheckBox.Checked := Result; }
end;

function TTouristTemplateNewForm.GetChildChecked: Boolean;
begin
  {Result := ChildNameDBCheckBox.Checked or
    CHILDSURNAMEDBCheckBox.Checked or
    ChildOldCyrDBCheckBox.Checked or
    ChildNationalityDBCheckBox.Checked or
    ChildBirthDateDBCheckBox.Checked or
    ChildBirthCountryDBCheckBox.Checked or
    ChildBirthLocalityDBCheckBox.Checked;
  ChildCheckBox.Checked := Result; }
end;

function TTouristTemplateNewForm.GetGuardianChecked: Boolean;
begin
  {Result := GUARDIANCYRDBCheckBox.Checked or
    GUARDIANSECONDCYRDBCheckBox.Checked or
    GuardianOldCyrDBCheckBox.Checked or
    GUARDIANNATIONALITYDBCheckBox.Checked or
    GuardianBirthDateDBCheckBox.Checked or
    GuardianBirthCountryDBCheckBox.Checked or
    GuardianBirthLocalityDBCheckBox.Checked;
  GuardianCheckBox.Checked := Result; }
end;

function TTouristTemplateNewForm.GetSpouseChecked: Boolean;
begin
  {Result := SpouseNameDBCheckBox.Checked or
    SpouseSurNameDBCheckBox.Checked or
    SpouseOldSurNameDBCheckBox.Checked or
    SpouseNationalityDBCheckBox.Checked or
    SpouseBirthDateDBCheckBox.Checked or
    SpouseBirthCountryDBCheckBox.Checked or
    SpouseBirthLocalityDBCheckBox.Checked;
  SpouseCheckBox.Checked := Result; }
end;

procedure TTouristTemplateNewForm.OldVisaForYearDBEditChange(
  Sender: TObject);
const OldVisaCaption = 'За         останні %s';  
begin
  {inherited;
  OldVisaLastYearDBCheckBox.Caption := Format(OldVisaCaption, [ 
    YearCountString(SafeStrToInt(OldVisaForYearDBEdit.Text))]);}
end;

end.
