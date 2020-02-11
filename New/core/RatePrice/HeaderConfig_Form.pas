unit HeaderConfig_Form;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, StdCtrls, Buttons,
  ExtCtrls, ActnList, ImgList, CheckTree, ComCtrls, RateTypes;

type
  TForm_HeaderConfig = class(TForm)
    AddBtn: TSpeedButton;
    ChangeBtn: TSpeedButton;
    DellBtn: TSpeedButton;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    ButtonPanel: TPanel;
    ApplyBtn: TBitBtn;
    CheckTreeView_Items: TCheckTreeView;
    ImageList1: TImageList;
    SpeedButton1: TSpeedButton;
    ActionList: TActionList;
    Action_Add: TAction;
    Action_Modify: TAction;
    Action_Remove: TAction;
    Action_CheckAll: TAction;
    Action_Apply: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure Action_CheckAllExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Action_ModifyPeriodExecute(Sender: TObject);
    procedure Action_ModifyAgeExecute(Sender: TObject);
  private
    FIsChanged: boolean;
    procedure PrepareTreeView;
    procedure FillCheckTreeView;
    procedure PreparePeriodForm;
    procedure PrepareAgeForm;
  protected
  end;

function ExecuteHeaderConfigPeriodForm(var aRange: TRateRange): Boolean;
function ExecuteHeaderConfigAgeForm(var aRange: TRateRange): Boolean;
  
  
implementation

uses
  EditSeasonsRange_Form, ActiveX, EditAgeRanges_Form;
  
{$R *.DFM}
var CurRange: TRateRange;
    PeriodForm: Boolean;

const
  AgesStr                = 'Вікові категорії';
  PeriodsStr             = 'Періоди';
    
function GetUni: String;
var id:TGUID;
begin
  if CoCreateGuid(Id) = s_OK then
    result := GUIDToString(Id)
  else result:='';
end;

{ TRateDlg }
function ExecuteHeaderConfigPeriodForm(var aRange: TRateRange): Boolean;
begin
  CurRange := aRange;
  PeriodForm := True;
  with TForm_HeaderConfig.Create(Application) do
  try
    PreparePeriodForm;
    Result := ShowModal = mrOk;
    if Result then aRange := CurRange;
  finally
    Free;
  end; 
end;

function ExecuteHeaderConfigAgeForm(var aRange: TRateRange): Boolean;
begin
  CurRange := aRange;
  PeriodForm := False;
  with TForm_HeaderConfig.Create(Application) do
  try
    PrepareAgeForm;
    Result := ShowModal = mrOk;
    if Result then aRange := CurRange;
  finally
    Free;
  end; 
end;

procedure TForm_HeaderConfig.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TForm_HeaderConfig.FormActivate(Sender: TObject);
begin
  BringToFront;
  if CheckTreeView_Items.Items.Count > 0 then
    CheckTreeView_Items.Selected := CheckTreeView_Items.Items[0];
end;

procedure TForm_HeaderConfig.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
var AEnabled : boolean;
    i : integer;
begin
  if Action = Action_CheckAll then
  begin
    AEnabled := true;
    for i:=0 to CheckTreeView_Items.Items.Count-1 do
      AEnabled := AEnabled and (CheckTreeView_Items.Items[i].StateIndex = 2);
    Action_CheckAll.Enabled := not AEnabled;
    Handled:=true;
  end
  else if Action = Action_Apply then
  begin
    AEnabled := false;
    for i:=0 to CheckTreeView_Items.Items.Count-1 do
      AEnabled := AEnabled or (CheckTreeView_Items.Items[i].StateIndex = 2);
//    Action_Apply.Enabled := AEnabled or not CheckTreeView_Items.CheckBoxesAlowed;
    Handled:=true;
  end
  else if Action = Action_Add then
  begin
    Action_Add.Enabled := true;
    Handled:=true;
  end
  else if Action = Action_Modify then
  begin
    Action_Modify.Enabled:=(CheckTreeView_Items.Items.Count>0) and (CheckTreeView_Items.SelectionCount=1);
    Handled:=true;
  end
  else if Action = Action_Remove then
  begin
    Action_Remove.Enabled:=(CheckTreeView_Items.Items.Count>1) and (CheckTreeView_Items.SelectionCount=1);
    Handled:=true;
  end;
end;

procedure TForm_HeaderConfig.Action_CheckAllExecute(Sender: TObject);
var i: integer;
begin
  for i := 0 to CheckTreeView_Items.Items.Count-1 do
    CheckTreeView_Items.Items[i].StateIndex := 2;
end;

procedure TForm_HeaderConfig.FormCreate(Sender: TObject);
begin
  PrepareTreeView;
end;

procedure TForm_HeaderConfig.PrepareTreeView;
begin
  FillCheckTreeView;
  Action_Add.Visible := False;
  Action_Remove.Visible := False;
end;

procedure TForm_HeaderConfig.Action_ModifyPeriodExecute(Sender: TObject);
var i, insertedIndex, NewItemsCount, l1, LastPeriod: integer;
    NewPeriodsArray : TRateRange;
begin
  with TForm_EditPeriodRanges.Create(Application) do
  try    
    MinPeriod := 0;
    InsertedIndex := 0;
    SetLength(PeriodRangesArray, 0);
    LastPeriod := High(CurRange);
    if CurRange[LastPeriod].From > 0 then
    begin
      SetLength(PeriodRangesArray, Length(PeriodRangesArray) + 1);
      PeriodRangesArray[InsertedIndex].PeriodFrom := 0;
      PeriodRangesArray[InsertedIndex].PeriodTill := CurRange[LastPeriod].From;
      PeriodRangesArray[InsertedIndex].TillRestricted := True;
      PeriodRangesArray[InsertedIndex].Id := -1;
      PeriodRangesArray[InsertedIndex].Modified := False;
      PeriodRangesArray[InsertedIndex].Hole := True;
      PeriodRangesArray[InsertedIndex].Marker := EmptyStr;
      inc(InsertedIndex);
    end;   

    for i := High(CurRange) downto low(CurRange) do
    begin
      SetLength(PeriodRangesArray, Length(PeriodRangesArray) + 1);
      PeriodRangesArray[InsertedIndex].PeriodFrom := CurRange[i].From;
      PeriodRangesArray[InsertedIndex].PeriodTill := CurRange[i].Till;
      if CurRange[i].Till = -1 then
        PeriodRangesArray[InsertedIndex].TillRestricted := False
      else PeriodRangesArray[InsertedIndex].TillRestricted := True;
      PeriodRangesArray[InsertedIndex].Id := i;
      PeriodRangesArray[InsertedIndex].Modified := False;
      PeriodRangesArray[InsertedIndex].Hole := False;
      PeriodRangesArray[InsertedIndex].Marker := CurRange[i].Caption;
      inc(InsertedIndex);
    end;
    // якщо останній діапазон є закритим додати відкриту діру
    if PeriodRangesArray[InsertedIndex-1].TillRestricted then
    begin
      setLength(PeriodRangesArray,length(PeriodRangesArray)+1);
      PeriodRangesArray[InsertedIndex].PeriodFrom := PeriodRangesArray[InsertedIndex-1].PeriodTill;// + 1;
      PeriodRangesArray[InsertedIndex].PeriodTill := MaxInt;      
      PeriodRangesArray[InsertedIndex].TillRestricted := False;
      PeriodRangesArray[InsertedIndex].Id := -1;
      PeriodRangesArray[InsertedIndex].Modified := False;
      PeriodRangesArray[InsertedIndex].Hole := True;
      PeriodRangesArray[InsertedIndex].Marker := EmptyStr;
    end;     

    if ShowModal = mrOk then
    begin
      NewItemsCount := 0;
      for i:=0 to High(PeriodRangesArray) do // визначити нову довжину масиву
        if not PeriodRangesArray[i].Hole then inc(NewItemsCount);
      // переставляємо елементи на їх нові місця
      SetLength(NewPeriodsArray,0);
      SetLength(NewPeriodsArray,NewItemsCount);
      l1 := 0;
      for i:= High(PeriodRangesArray) downto Low(PeriodRangesArray) do 
        if (not PeriodRangesArray[i].Hole) then
        begin
          if PeriodRangesArray[i].Id <> -1 then
          begin
            NewPeriodsArray[l1] := CurRange[PeriodRangesArray[i].Id];
            NewPeriodsArray[l1].Caption := PeriodRangesArray[i].Marker;
            NewPeriodsArray[l1].From := PeriodRangesArray[i].PeriodFrom;
            if PeriodRangesArray[i].TillRestricted 
            then begin 
              NewPeriodsArray[l1].Till := PeriodRangesArray[i].PeriodTill;
            end else 
              NewPeriodsArray[l1].Till := -1;

            if (NewPeriodsArray[l1].Caption <> CurRange[PeriodRangesArray[i].Id].Caption) or
               (NewPeriodsArray[l1].From <> CurRange[PeriodRangesArray[i].Id].From) or 
               (NewPeriodsArray[l1].Till <> CurRange[PeriodRangesArray[i].Id].Till)
            then
              FIsChanged := True;
          end
          else
          begin
            FIsChanged := True;
            NewPeriodsArray[l1].Caption := PeriodRangesArray[i].Marker;
            NewPeriodsArray[l1].Control := nil;
            NewPeriodsArray[l1].From := PeriodRangesArray[i].PeriodFrom;
            if PeriodRangesArray[i].TillRestricted 
            then begin 
              NewPeriodsArray[l1].Till := PeriodRangesArray[i].PeriodTill;
            end else begin 
              NewPeriodsArray[l1].Till := -1;
            end;
          end;
          inc(l1);
        end;
      CurRange := NewPeriodsArray;
      FillCheckTreeView;
    end;
  finally
    Free;
  end;
end;

procedure TForm_HeaderConfig.FillCheckTreeView;
var I: Integer;
begin   
  CheckTreeView_Items.Items.Clear;
  CheckTreeView_Items.CheckBoxesAlowed := False;
  for i := Low(CurRange) to High(CurRange) do
    if PeriodForm then
      CheckTreeView_Items.Items.Add(nil, PeriodName(CurRange[i]{, I = High(CurRange)}))
    else
      CheckTreeView_Items.Items.Add(nil, AgeName(CurRange[i]));
  CheckTreeView_Items.ShowRoot := False;
  CheckTreeView_Items.CheckBoxesAlowed := True;
end;

function shlBoolToInteger(aValue: Boolean): Integer;
begin
  Result := Integer(aValue) shl 16;
end;

function GetIdFromOption(aValue: Integer): Integer; 
begin
  Result := aValue and $FFFF;
end;

function GetBoolFromOption(aValue: Integer): Boolean;
begin
  Result := Boolean((aValue shr 16) and $FFFF);
end;

procedure TForm_HeaderConfig.Action_ModifyAgeExecute(Sender: TObject);
var i, j, insertedIndex, NewItemsCount, l1, l2: integer;
    NewAgesArray : TRateRange;
begin
  with TForm_EditAgeRanges.Create(Application) do
  try
    insertedIndex:=0;
    setLength(AgeRangesArray,0);
    if CurRange[High(CurRange)].From > 0 then
    begin
      setLength(AgeRangesArray,length(AgeRangesArray)+1);
      AgeRangesArray[InsertedIndex].From:=0;
      AgeRangesArray[InsertedIndex].Till:=CurRange[High(CurRange)].From;
      AgeRangesArray[InsertedIndex].TillRestricted:=true;
      AgeRangesArray[InsertedIndex].Id:=-1;
      AgeRangesArray[InsertedIndex].Modified:=false;
      AgeRangesArray[InsertedIndex].Hole:=true;
      AgeRangesArray[InsertedIndex].Marker:='';
      AgeRangesArray[InsertedIndex].MarkerId:=0;
      AgeRangesArray[InsertedIndex].MainAge:=false;
      inc(InsertedIndex);
    end;
    for i := High(CurRange) downto low(CurRange) do
    begin
      setLength(AgeRangesArray,Length(AgeRangesArray)+1);
      AgeRangesArray[InsertedIndex].From:=CurRange[i].From;
      if CurRange[i].Till = -1 then
        AgeRangesArray[InsertedIndex].TillRestricted:=false
      else
      begin
        AgeRangesArray[InsertedIndex].TillRestricted:=true;
        AgeRangesArray[InsertedIndex].Till:=CurRange[i].Till;
      end;
      AgeRangesArray[InsertedIndex].Id:=i;
      AgeRangesArray[InsertedIndex].Modified:=false;
      AgeRangesArray[InsertedIndex].Hole:=false;
      AgeRangesArray[InsertedIndex].Marker:=CurRange[i].Caption;
      AgeRangesArray[InsertedIndex].MarkerId:= GetIdFromOption(CurRange[i].Option);
      AgeRangesArray[InsertedIndex].MainAge:= GetBoolFromOption(CurRange[i].Option);
      inc(InsertedIndex);
      // додати проміжок, якщо він є між вік категоріями і дана категорія не є останньою
    end;
    // якщо останній діапазон є закритим додати відкриту діру
    if AgeRangesArray[InsertedIndex-1].TillRestricted then
    begin
      setLength(AgeRangesArray,length(AgeRangesArray)+1);
      AgeRangesArray[InsertedIndex].From:=AgeRangesArray[InsertedIndex-1].Till+1;
      AgeRangesArray[InsertedIndex].Till:=200;
      AgeRangesArray[InsertedIndex].TillRestricted:=false;
      AgeRangesArray[InsertedIndex].Id:=-1;
      AgeRangesArray[InsertedIndex].Modified:=false;
      AgeRangesArray[InsertedIndex].Hole:=true;
      AgeRangesArray[InsertedIndex].Marker:='';
      AgeRangesArray[InsertedIndex].MarkerId:=0;
      AgeRangesArray[InsertedIndex].MainAge:=false;
    end;
    if ShowModal = mrOk then
    begin
      NewItemsCount := 0;
      for i:=0 to High(AgeRangesArray) do // визначити нову довжину масиву
        if not AgeRangesArray[i].Hole then inc(NewItemsCount);
      // переставляємо елементи на їх нові місця
      SetLength(NewAgesArray,NewItemsCount);
      l1 := 0;
//      for i:=0 to High(AgeRangesArray) do //
      for i:= High(AgeRangesArray) downto Low(AgeRangesArray) do 
        if (not AgeRangesArray[i].Hole) then
        begin
          if AgeRangesArray[i].Id <> -1 then
          begin
            NewAgesArray[l1] := CurRange[AgeRangesArray[i].Id];
            NewAgesArray[l1].Caption := AgeRangesArray[i].Marker;
            NewAgesArray[l1].Option := AgeRangesArray[i].MarkerId + shlBoolToInteger(AgeRangesArray[i].MainAge);
            NewAgesArray[l1].From := AgeRangesArray[i].From;
            if AgeRangesArray[i].TillRestricted then NewAgesArray[l1].Till:=AgeRangesArray[i].Till else NewAgesArray[l1].Till:=-1;
            if (NewAgesArray[l1].Caption <> CurRange[AgeRangesArray[i].Id].Caption) or
              (NewAgesArray[l1].From <> CurRange[AgeRangesArray[i].Id].From) or
              (GetBoolFromOption(NewAgesArray[l1].Option) <> GetBoolFromOption(CurRange[AgeRangesArray[i].Id].Option)) or
              (NewAgesArray[l1].Till <> CurRange[AgeRangesArray[i].Id].Till) 
            then
              FIsChanged:=true;
          end
          else
          begin
            FIsChanged := true;
            NewAgesArray[l1].Caption := AgeRangesArray[i].Marker;
            NewAgesArray[l1].Option := AgeRangesArray[i].MarkerId + shlBoolToInteger(AgeRangesArray[i].MainAge);
            NewAgesArray[l1].Control := nil;
            NewAgesArray[l1].From := AgeRangesArray[i].From;
            if AgeRangesArray[i].TillRestricted then NewAgesArray[l1].Till := AgeRangesArray[i].Till else NewAgesArray[l1].Till:=-1;
          end;
          inc(l1);
        end;
      CurRange := NewAgesArray;
      FillCheckTreeView;
    end;
  finally
    Free;
  end;
end;

procedure TForm_HeaderConfig.PreparePeriodForm;
begin
  Caption := PeriodsStr;
  Action_Modify.OnExecute := Action_ModifyPeriodExecute;
end;

procedure TForm_HeaderConfig.PrepareAgeForm;
begin
  Caption := AgesStr;
  Action_Modify.OnExecute := Action_ModifyAgeExecute;
end;

end.
