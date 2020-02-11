unit EditAgeRanges_Form;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, DBCtrls, Buttons, Grids, DBGrids, CommCtrl, Math,
  ActnList, Mask, ImgList, ExtCtrls, Spin;

type
  TAgeRange = record
    From : integer;
    Till : integer;
    TillRestricted : boolean;
    Id : integer;
    Modified : boolean;
    Hole : boolean;
    Marker : string;
    MarkerId : integer;
    MainAge : boolean;
  end;

  TForm_EditAgeRanges = class(TForm)
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    gbDate: TGroupBox;
    sbInvert: TSpeedButton;
    ListBox_Ages: TListBox;
    ActionList1: TActionList;
    aInvert: TAction;
    Label1: TLabel;
    ImageList1: TImageList;
    chTo: TCheckBox;
    Panel1: TPanel;
    StaticText1: TStaticText;
    UpDown_From: TUpDown;
    Edit_From: TEdit;
    Edit_Till: TEdit;
    UpDown_Till: TUpDown;
    Action_Ok: TAction;
    DBLookupComboBox_Name: TDBLookupComboBox;
    Label_MainAge: TLabel;
    ComboBox_MainAge: TComboBox;
    procedure FormActivate(Sender: TObject);
    procedure ListBox_AgesDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure chToClick(Sender: TObject);
    procedure ListBox_AgesClick(Sender: TObject);
    procedure aInvertExecute(Sender: TObject);
    procedure UpDown_FromChangingEx(Sender: TObject;
      var AllowChange: Boolean; NewValue: Smallint;
      Direction: TUpDownDirection);
    procedure UpDown_TillChangingEx(Sender: TObject;
      var AllowChange: Boolean; NewValue: Smallint;
      Direction: TUpDownDirection);
    procedure ActionList1Update(Action: TBasicAction;
      var Handled: Boolean);
    procedure Edit_FromKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_FromExit(Sender: TObject);
    procedure Edit_TillExit(Sender: TObject);
    procedure DBLookupComboBox_NameClick(Sender: TObject);
    procedure ComboBox_MainAgeClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    ChHandling : boolean;
    procedure UpdateVisualAgeRanges;
    function AgeName(ARange : TAgeRange) : string;
    function ChekNotAreHole: Boolean;
  public
    AgeRangesArray : array of TAgeRange;
  end;

implementation

uses {TourMan,} UnitProc, RateTypes;

{$R *.DFM}

procedure TForm_EditAgeRanges.FormActivate(Sender: TObject);
var i : integer;
begin
  UpdateVisualAgeRanges;
  ListBox_Ages.ItemIndex:=0;
  ListBox_AgesClick(ListBox_Ages);
  ChHandling:=true;
  // перевизначення списку
  ComboBox_MainAge.Items.Clear;
  ComboBox_MainAge.ItemIndex:=-1;
  for i:=0 to High(AgeRangesArray) do
    if not AgeRangesArray[i].Hole then
    begin
      ComboBox_MainAge.AddItem(AgeName(AgeRangesArray[i]),Pointer(i));
      if AgeRangesArray[i].MainAge then ComboBox_MainAge.ItemIndex:=ComboBox_MainAge.Items.Count-1;
    end;
  if ComboBox_MainAge.ItemIndex = -1 then // шукаємо категорію, котра містить 25 чи більше років.
    for i:=0 to ComboBox_MainAge.Items.Count-1 do
      if not AgeRangesArray[Integer(ComboBox_MainAge.Items.Objects[i])].Hole and (AgeRangesArray[Integer(ComboBox_MainAge.Items.Objects[i])].From >=25) then
      begin
        AgeRangesArray[Integer(ComboBox_MainAge.Items.Objects[i])].MainAge:=true;
        AgeRangesArray[Integer(ComboBox_MainAge.Items.Objects[i])].Modified:=true;
        ComboBox_MainAge.ItemIndex:=i;
        Break;
      end;
  if ComboBox_MainAge.ItemIndex = -1 then
    for i := High(AgeRangesArray) downto 0 do
      if not AgeRangesArray[i].Hole then
      begin
        AgeRangesArray[Integer(ComboBox_MainAge.Items.Objects[i])].MainAge:=true;
        AgeRangesArray[Integer(ComboBox_MainAge.Items.Objects[i])].Modified:=true;
        ComboBox_MainAge.ItemIndex:=i;
        Break;
      end;
end;

procedure TForm_EditAgeRanges.UpdateVisualAgeRanges;
var i : integer;
begin
  ListBox_Ages.Items.Clear;
  for i:= 0 to High(AgeRangesArray) do
    ListBox_Ages.Items.Add(AgeName(AgeRangesArray[i]));
end;

function TForm_EditAgeRanges.AgeName(ARange : TAgeRange) : string;
begin
  if ARange.TillRestricted then Result := ARange.Marker + '(' + (IntToStr(ARange.From)+' - '+IntToStr(ARange.Till)) + ')'
  else Result := ARange.Marker + (' > '+IntToStr(ARange.From));
end;

procedure TForm_EditAgeRanges.ListBox_AgesDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  if AgeRangesArray[index].Hole then (Control as TListBox).Canvas.Font.Color:=clRed;
  if (odSelected in State) and (not (Control as TListBox).Focused) then (Control as TListBox).Canvas.Brush.Color:=clGray;
  (Control as TListBox).Canvas.TextRect(Rect,Rect.Left, Rect.Top, AgeName(AgeRangesArray[index]));
end;

procedure TForm_EditAgeRanges.chToClick(Sender: TObject);
var
  OldIndex,i : integer;
begin
  if not ChHandling then Exit; //якщо зміна програмна то не реагувати
  ChHandling := false;
  OldIndex:=ListBox_Ages.ItemIndex;
  Edit_Till.Visible:=chTo.Checked;
  UpDown_Till.Visible:= chTo.Checked;
  AgeRangesArray[OldIndex].TillRestricted:=chTo.Checked;
  // відпрацювання видимості редактора та кнопочок
  if AgeRangesArray[OldIndex].TillRestricted then
  begin
   AgeRangesArray[OldIndex].Till := AgeRangesArray[OldIndex].From + 10;
   UpDown_Till.Position:= AgeRangesArray[OldIndex].Till;
  end;
  // додавання/вилучення діри
  if (AgeRangesArray[ListBox_Ages.ItemIndex].TillRestricted) and (OldIndex = High(AgeRangesArray)) then
  begin
    SetLength(AgeRangesArray,Length(AgeRangesArray)+1);
    AgeRangesArray[High(AgeRangesArray)].From:=AgeRangesArray[High(AgeRangesArray)-1].Till+1;
    AgeRangesArray[High(AgeRangesArray)].Till:=200;
    AgeRangesArray[High(AgeRangesArray)].TillRestricted:=false;
    AgeRangesArray[High(AgeRangesArray)].Id:=-1;
    AgeRangesArray[High(AgeRangesArray)].Modified:=false;
    AgeRangesArray[High(AgeRangesArray)].Hole:=true;
    AgeRangesArray[High(AgeRangesArray)].Marker:='';
  end
  else if (OldIndex = High(AgeRangesArray)-1) then SetLength(AgeRangesArray,Length(AgeRangesArray)-1);
  UpdateVisualAgeRanges;
  ListBox_Ages.ItemIndex:=OldIndex;
  ChHandling := true;

  OldIndex := ComboBox_MainAge.ItemIndex;
  for i:=0 to ComboBox_MainAge.Items.Count-1 do
     ComboBox_MainAge.Items[i] := AgeName(AgeRangesArray[Integer(ComboBox_MainAge.Items.Objects[i])]);
  ComboBox_MainAge.Text := AgeName(AgeRangesArray[OldIndex]);
  ComboBox_MainAge.ItemIndex := OldIndex;
end;

procedure TForm_EditAgeRanges.ListBox_AgesClick(Sender: TObject);
var Index :integer;
    ButtonBitmap : TBitmap;
begin
  if ListBox_Ages.ItemIndex<>-1 then
  begin
    ChHandling:=false; // заборонити опрацювання зміни прапорця
    Index := ListBox_Ages.ItemIndex;
    if AgeRangesArray[ListBox_Ages.ItemIndex].Hole then
    begin // якщо діра - то заборонити редагування і встановити відповідну кнопочку
      Edit_From.Enabled:=false;
      UpDown_From.Enabled:=false;
      chTo.Enabled:=false;
      Edit_Till.Enabled:=false;
      UpDown_Till.Enabled:=false;
      aInvert.Caption:=EnableAgeStr;
      aInvert.ImageIndex:=0;
      ButtonBitmap:=TBitmap.Create;
      ImageList1.GetBitmap(0,ButtonBitmap);
      sbInvert.Glyph.Assign(ButtonBitmap);
      ButtonBitmap.Free;
      DBLookupComboBox_Name.Enabled:=false;
      Label1.Enabled:=false;
      StaticText1.Enabled:=false;
    end
    else
    begin
      Edit_From.Enabled:=true;
      UpDown_From.Enabled:=true;
      chTo.Enabled := (Index = High(AgeRangesArray)) or ((Index = High(AgeRangesArray)-1) and (AgeRangesArray[High(AgeRangesArray)].Hole));
      Edit_Till.Enabled:=true;;
      UpDown_Till.Enabled:=true;
      aInvert.Caption:=DisableAgeStr;
      aInvert.ImageIndex:=1;
      ButtonBitmap:=TBitmap.Create;
      ImageList1.GetBitmap(1,ButtonBitmap);
      sbInvert.Glyph.Assign(ButtonBitmap);
      ButtonBitmap.Free;
      DBLookupComboBox_Name.Enabled:=true;
      Label1.Enabled:=true;
      StaticText1.Enabled:=true;
    end;
    // виставлення обмежень та значень
    UpDown_From.Min:=0;
    UpDown_From.Max:=200;
    UpDown_Till.Min:=1;
    UpDown_Till.Max:=200;

    UpDown_From.Position:=AgeRangesArray[Index].From;
    chTo.Checked:=AgeRangesArray[ListBox_Ages.ItemIndex].TillRestricted;
    if chTo.Checked then UpDown_Till.Position := AgeRangesArray[Index].Till
    else UpDown_Till.Position := 100;
    Edit_Till.Visible:= chTo.Checked;
    UpDown_Till.Visible:= chTo.Checked;

    UpDown_From.Max:=UpDown_Till.Position;
    UpDown_Till.Min:=UpDown_From.Position;
    if Index=High(AgeRangesArray) then UpDown_Till.Max:=200
    else if AgeRangesArray[Index+1].Hole then UpDown_Till.Max:=AgeRangesArray[Index+1].Till
    else UpDown_Till.Max:=AgeRangesArray[Index+1].From-1;
    if Index=0 then UpDown_From.Min:=0
    else if AgeRangesArray[Index-1].Hole then UpDown_From.Min:=AgeRangesArray[Index-1].From
    else UpDown_From.Min:=AgeRangesArray[Index-1].Till+1;
    DBLookupComboBox_Name.KeyValue := AgeRangesArray[Index].MarkerId;
    ChHandling:=true;
  end;
end;

procedure TForm_EditAgeRanges.aInvertExecute(Sender: TObject);
var OldIndex, i, OldRangeRestrict : integer;
    AgeRangeName : string;
begin
  OldIndex:=ListBox_Ages.ItemIndex;
  AgeRangeName:=AgeName(AgeRangesArray[OldIndex]);
  if not AgeRangesArray[OldIndex].Hole
    and (AgeRangesArray[OldIndex].Id <> -1)
//    and not ConfirmDlgYN(format(RemoveAgeStr,[AgeRangeName]))
    and not (MyShowMessageDlg(format(RemoveAgeStr,[AgeRangeName]), mtConfirmation, but_YES_NO) = res_YES)
    then Exit;
  AgeRangesArray[OldIndex].Hole := not AgeRangesArray[OldIndex].Hole;
  AgeRangesArray[OldIndex].Id:=-1;
  if AgeRangesArray[OldIndex].Hole then
  begin
    AgeRangesArray[OldIndex].Marker:='';
    AgeRangesArray[OldIndex].MarkerId:=0;
  end
  else
  begin
    AgeRangesArray[OldIndex].MarkerId:=290;
    DBLookupComboBox_Name.KeyValue:=290;
    AgeRangesArray[OldIndex].Marker:=DBLookupComboBox_Name.Text;
  end;
  if (OldIndex>0) and AgeRangesArray[OldIndex].Hole and AgeRangesArray[OldIndex-1].Hole then
  begin // вилучити пустоту перед дірою
    OldRangeRestrict := AgeRangesArray[OldIndex-1].From;
    for i:=OldIndex to High(AgeRangesArray) do
      AgeRangesArray[i-1]:=AgeRangesArray[i];
    SetLength(AgeRangesArray,Length(AgeRangesArray)-1);
    dec(OldIndex);
    AgeRangesArray[OldIndex].From:=OldRangeRestrict;
  end;
  if (OldIndex<High(AgeRangesArray)) and AgeRangesArray[OldIndex].Hole and AgeRangesArray[OldIndex+1].Hole then
  begin // вилучити пустоту після діри
    if AgeRangesArray[OldIndex+1].TillRestricted then OldRangeRestrict := AgeRangesArray[OldIndex+1].Till
      else OldRangeRestrict := -1;
    for i:=OldIndex+2 to High(AgeRangesArray) do
      AgeRangesArray[i-1]:=AgeRangesArray[i];
    SetLength(AgeRangesArray,Length(AgeRangesArray)-1);
    if OldRangeRestrict<>-1 then AgeRangesArray[OldIndex].Till:=OldRangeRestrict
     else AgeRangesArray[OldIndex].TillRestricted:=false;
  end;
  UpdateVisualAgeRanges;
  ListBox_Ages.ItemIndex:=OldIndex;
  ListBox_AgesClick(ListBox_Ages);
  // перевизначення списку
  ComboBox_MainAge.Items.Clear;
  ComboBox_MainAge.ItemIndex:=-1;
  for i:=0 to High(AgeRangesArray) do
    if not AgeRangesArray[i].Hole then
    begin
      ComboBox_MainAge.AddItem(AgeName(AgeRangesArray[i]),Pointer(i));
      if AgeRangesArray[i].MainAge then ComboBox_MainAge.ItemIndex:=ComboBox_MainAge.Items.Count-1;
    end;
  if ComboBox_MainAge.ItemIndex = -1 then // шукаємо категорію, котра містить 25 чи більше років.
    for i:=0 to ComboBox_MainAge.Items.Count-1 do
      if AgeRangesArray[Integer(ComboBox_MainAge.Items.Objects[i])].From >=25 then
      begin
        AgeRangesArray[Integer(ComboBox_MainAge.Items.Objects[i])].MainAge:=true;
        AgeRangesArray[Integer(ComboBox_MainAge.Items.Objects[i])].Modified:=true;
        ComboBox_MainAge.ItemIndex:=i;
        Break;
      end;
  if ComboBox_MainAge.ItemIndex = -1 then
  begin
    AgeRangesArray[Integer(ComboBox_MainAge.Items.Objects[ComboBox_MainAge.Items.Count-1])].MainAge:=true;
    AgeRangesArray[Integer(ComboBox_MainAge.Items.Objects[ComboBox_MainAge.Items.Count-1])].Modified:=true;
    ComboBox_MainAge.ItemIndex:=ComboBox_MainAge.Items.Count-1;
  end;  
end;

procedure TForm_EditAgeRanges.UpDown_FromChangingEx(Sender: TObject; var AllowChange: Boolean; NewValue: Smallint; Direction: TUpDownDirection);
var OldIndex, i : integer;
begin
  if not ChHandling then Exit; //якщо зміна програмна то не реагувати
  if (NewValue>UpDown_From.Max) or (NewValue<UpDown_From.Min) then Exit;
  OldIndex:=ListBox_Ages.ItemIndex;

  AgeRangesArray[OldIndex].From:=NewValue;
  UpDown_Till.Min:=NewValue;
  // додавання пустоти перед діапазоном якщо її немає
  if (OldIndex > 0) and AgeRangesArray[OldIndex-1].Hole then
  begin
    if AgeRangesArray[OldIndex-1].From = AgeRangesArray[OldIndex].From then
    begin
      // вилучити пустоту перед
      for i:=OldIndex to High(AgeRangesArray) do
        AgeRangesArray[i-1]:=AgeRangesArray[i];
      SetLength(AgeRangesArray,Length(AgeRangesArray)-1);
      dec(OldIndex);
    end
    else AgeRangesArray[OldIndex-1].Till:=NewValue-1
  end
  else
  begin // додати пустоту перед
    SetLength(AgeRangesArray,Length(AgeRangesArray)+1);
    for i:=High(AgeRangesArray)-1 downto OldIndex do
     AgeRangesArray[i+1]:=AgeRangesArray[i];
    if OldIndex-1>=0 then AgeRangesArray[OldIndex].From:=AgeRangesArray[OldIndex-1].Till+1
      else AgeRangesArray[OldIndex].From:=0;
    AgeRangesArray[OldIndex].Till:=AgeRangesArray[OldIndex+1].From-1;
    AgeRangesArray[OldIndex].TillRestricted:=true;
    AgeRangesArray[OldIndex].Id:=-1;
    AgeRangesArray[OldIndex].Modified:=false;
    AgeRangesArray[OldIndex].Hole:=true;
    AgeRangesArray[OldIndex].Marker:='';
    inc(OldIndex);
  end;
  UpdateVisualAgeRanges;
  ListBox_Ages.ItemIndex:=OldIndex;

  OldIndex := ComboBox_MainAge.ItemIndex;
  for i:=0 to ComboBox_MainAge.Items.Count-1 do
     ComboBox_MainAge.Items[i] := AgeName(AgeRangesArray[Integer(ComboBox_MainAge.Items.Objects[i])]);
  ComboBox_MainAge.Text := AgeName(AgeRangesArray[OldIndex]);
  ComboBox_MainAge.ItemIndex := OldIndex;
end;

procedure TForm_EditAgeRanges.UpDown_TillChangingEx(Sender: TObject; var AllowChange: Boolean; NewValue: Smallint; Direction: TUpDownDirection);
var OldIndex, i  : integer;
begin
  if not ChHandling then Exit; //якщо зміна програмна то не реагувати
  if (NewValue>UpDown_Till.Max) or (NewValue<UpDown_Till.Min) then Exit;
  OldIndex:=ListBox_Ages.ItemIndex;
  AgeRangesArray[OldIndex].Till:=NewValue;
  UpDown_From.Max:=NewValue;
  // опрацювання пустоти після діапазону
  if (OldIndex < High(AgeRangesArray)) and AgeRangesArray[OldIndex+1].Hole then
  begin
    if AgeRangesArray[OldIndex+1].Till = AgeRangesArray[OldIndex].Till then
    begin
      // вилучити пустоту після
      for i:=OldIndex+2 to High(AgeRangesArray) do
        AgeRangesArray[i-1]:=AgeRangesArray[i];
      SetLength(AgeRangesArray,Length(AgeRangesArray)-1);
    end
    else AgeRangesArray[OldIndex+1].From:=NewValue+1 // скоректувати межі пустоти
  end
  else
  begin // додати пустоту після
    SetLength(AgeRangesArray,Length(AgeRangesArray)+1);
    for i:=High(AgeRangesArray)-1 downto OldIndex+1 do
     AgeRangesArray[i+1]:=AgeRangesArray[i];
    if OldIndex+2<=High(AgeRangesArray) then
    begin
      AgeRangesArray[OldIndex+1].Till:=AgeRangesArray[OldIndex+2].From-1;
      AgeRangesArray[OldIndex+1].TillRestricted:=true;
    end
    else
    begin
      AgeRangesArray[OldIndex+1].Till:=200;
      AgeRangesArray[OldIndex+1].TillRestricted:=false;
    end;
    AgeRangesArray[OldIndex+1].From:=AgeRangesArray[OldIndex].Till+1;
    AgeRangesArray[OldIndex+1].Id:=-1;
    AgeRangesArray[OldIndex+1].Modified:=false;
    AgeRangesArray[OldIndex+1].Hole:=true;
    AgeRangesArray[OldIndex+1].Marker:='';
  end;
  UpdateVisualAgeRanges;
  ListBox_Ages.ItemIndex:=OldIndex;

  OldIndex := ComboBox_MainAge.ItemIndex;
  for i:=0 to ComboBox_MainAge.Items.Count-1 do
     ComboBox_MainAge.Items[i] := AgeName(AgeRangesArray[Integer(ComboBox_MainAge.Items.Objects[i])]);
  ComboBox_MainAge.Text := AgeName(AgeRangesArray[OldIndex]);
  ComboBox_MainAge.ItemIndex := OldIndex;
end;

procedure TForm_EditAgeRanges.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
var i : integer;
    NonHoleFinded : boolean;
begin
  NonHoleFinded:=false;
  if Action = Action_Ok then
  begin
    for i:=0 to High(AgeRangesArray) do
      NonHoleFinded := NonHoleFinded or not AgeRangesArray[i].Hole;
    Action_Ok.Enabled:=NonHoleFinded;
    Handled:=true;
  end
  else if Action = aInvert then
  begin
    aInvert.Enabled:= not
      ((ListBox_Ages.Items.Count = 1) or
      ((ListBox_Ages.Items.Count = 2) and((AgeRangesArray[0].Hole) or (AgeRangesArray[1].Hole))) or
      ((ListBox_Ages.Items.Count = 3) and (AgeRangesArray[0].Hole) and (AgeRangesArray[2].Hole))) or
      (aInvert.Caption=EnableAgeStr);
    Handled := true;
  end;
end;

procedure TForm_EditAgeRanges.Edit_FromKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['0'..'9',#13,#8]) then Key:=#0;
end;

procedure TForm_EditAgeRanges.Edit_FromExit(Sender: TObject);
var NewValue : integer;
begin
  try
    NewValue := StrToInt(Edit_From.Text);
  except
    NewValue := UpDown_From.Position;
    Edit_From.Text:=IntToStr(NewValue);
  end;
  if NewValue > UpDown_From.Max then NewValue := UpDown_From.Max
  else if NewValue < UpDown_From.Min then NewValue := UpDown_From.Min;
  Edit_From.Text:=IntToStr(NewValue);
  UpDown_From.Position:=NewValue;
end;

procedure TForm_EditAgeRanges.Edit_TillExit(Sender: TObject);
var NewValue : integer;
begin
  try
    NewValue := StrToInt(Edit_Till.Text);
  except
    NewValue := UpDown_Till.Position;
    Edit_Till.Text:=IntToStr(NewValue);
  end;
  if NewValue > UpDown_Till.Max then NewValue := UpDown_Till.Max
  else if NewValue < UpDown_Till.Min then NewValue := UpDown_Till.Min;
  Edit_Till.Text:=IntToStr(NewValue);
  UpDown_Till.Position:=NewValue;
end;

procedure TForm_EditAgeRanges.DBLookupComboBox_NameClick(Sender: TObject);
var
  OldIndex, i : integer;
begin
  OldIndex:=ListBox_Ages.ItemIndex;
  AgeRangesArray[OldIndex].Marker:=DBLookupComboBox_Name.Text;
  AgeRangesArray[OldIndex].MarkerId:=DBLookupComboBox_Name.KeyValue;
  UpdateVisualAgeRanges;
  ListBox_Ages.ItemIndex:=OldIndex;
  OldIndex := ComboBox_MainAge.ItemIndex;
  for i:=0 to ComboBox_MainAge.Items.Count-1 do
     ComboBox_MainAge.Items[i] := AgeName(AgeRangesArray[Integer(ComboBox_MainAge.Items.Objects[i])]);
  ComboBox_MainAge.Text := AgeName(AgeRangesArray[OldIndex]);
  ComboBox_MainAge.ItemIndex := OldIndex;
end;

procedure TForm_EditAgeRanges.ComboBox_MainAgeClick(Sender: TObject);
var i : integer;
begin
  if ComboBox_MainAge.ItemIndex=-1 then exit;
  // пройтися по масиву і зняти признак головної категорії
  for i:= 0 to High(AgeRangesArray) do
    if AgeRangesArray[i].MainAge then
    begin
      AgeRangesArray[i].MainAge:=false;
      AgeRangesArray[i].Modified:=true;
    end;
  //встановити признак основної категорії
  AgeRangesArray[Integer(ComboBox_MainAge.Items.Objects[ComboBox_MainAge.ItemIndex])].MainAge:=true;
  AgeRangesArray[Integer(ComboBox_MainAge.Items.Objects[ComboBox_MainAge.ItemIndex])].Modified:=true;
end;

procedure TForm_EditAgeRanges.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult = mrOk then CanClose := ChekNotAreHole;
end;

function TForm_EditAgeRanges.ChekNotAreHole: Boolean;
var I: Integer;
begin
  Result := True;
  for I := Low(AgeRangesArray) + 1 to High(AgeRangesArray) - 1 do
  if AgeRangesArray[i].Hole then Result := False;
//  if not Result then ErrorDlg('Не можна залишати "діри" між віковими періодами.');
  if not Result then MyShowMessageDlg('Не можна залишати "діри" між віковими періодами.',
    mtError, but_OK);
end;

end.

