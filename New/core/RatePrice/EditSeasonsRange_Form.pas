unit EditSeasonsRange_Form;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, StdCtrls, DBCtrls, Buttons, Grids, DBGrids, CommCtrl, Math,
  ActnList, Mask, ImgList, ExtCtrls, 
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue;

type
  TPeriodRange = record
    FromDate : TDate;
    TillDate : TDate;
    PeriodFrom: Integer;
    PeriodTill: Integer;
    TillRestricted : boolean;
    Id : integer;
    Modified : boolean;
    Hole : boolean;
    Marker : string;
  end;

  TForm_EditPeriodRanges = class(TForm)
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    sbInvert: TSpeedButton;
    ListBox_Seasons: TListBox;
    ActionList1: TActionList;
    aInvert: TAction;
    Label1: TLabel;
    edName: TEdit;
    ImageList1: TImageList;
    Panel1: TPanel;
    Action_Ok: TAction;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    chPeriodTo: TCheckBox;
    PeriodFrom_Spin: TcxSpinEdit;
    PeriodTill_Spin: TcxSpinEdit;
    procedure FormActivate(Sender: TObject);
    procedure ListBox_SeasonsDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure ListBox_SeasonsClick(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction;
      var Handled: Boolean);
    procedure aInvertExecute(Sender: TObject);
    procedure edNameChange(Sender: TObject);
    procedure chPeriodToClick(Sender: TObject);
    procedure PeriodFrom_SpinChange(Sender: TObject);
    procedure PeriodTill_SpinChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    ChHandling : boolean;
    procedure UpdateVisualSeasonRanges;
    function PeriodName(ARange: TPeriodRange; IsFirst: Boolean): string;
    function ChekNotAreHole: Boolean;
  public
    PeriodRangesArray: array of TPeriodRange;
    MinPeriod: Integer;
  end;

implementation

uses UnitProc, RateTypes;


{$R *.DFM}

procedure TForm_EditPeriodRanges.UpdateVisualSeasonRanges;
var i : integer;
begin
  ListBox_Seasons.Items.Clear;
  for i:= 0 to High(PeriodRangesArray) do
    ListBox_Seasons.Items.Add(PeriodName(PeriodRangesArray[i], I=0));
end;

function TForm_EditPeriodRanges.PeriodName(ARange: TPeriodRange; IsFirst: Boolean) : string;
const DateTimeFormatStr = 'dd.mm.yyyy';
      MorePeriod = '%d %s і >';
      LessPeriod = '> %d %s';
begin
  Result := Format(MorePeriod , [ARange.PeriodFrom, ChangeDayLabel(ARange.PeriodFrom, nDay)]);
  if IsFirst and (ARange.PeriodTill > 0) and (ARange.PeriodFrom = 0) 
  then Result := Format(LessPeriod, [ARange.PeriodTill, ChangeDayLabel(ARange.PeriodTill, nDayLess)]);
  if ARange.Marker <> EmptyStr then Result := ARange.Marker;// + ':' + Result;
end; 

procedure TForm_EditPeriodRanges.FormActivate(Sender: TObject);
begin
  UpdateVisualSeasonRanges;
  ListBox_Seasons.ItemIndex:=0;
  ListBox_SeasonsClick(ListBox_Seasons);
  ChHandling:=true;
end;

procedure TForm_EditPeriodRanges.ListBox_SeasonsDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;  State: TOwnerDrawState);
begin
  if PeriodRangesArray[index].Hole then (Control as TListBox).Canvas.Font.Color:=clRed;
  if (odSelected in State) and (not (Control as TListBox).Focused) then (Control as TListBox).Canvas.Brush.Color:=clGray;
  (Control as TListBox).Canvas.TextRect(Rect,Rect.Left, Rect.Top, PeriodName(PeriodRangesArray[index], index=0));
end;

procedure TForm_EditPeriodRanges.ListBox_SeasonsClick(Sender: TObject);
var Index : integer;
    ButtonBitmap : TBitmap;
begin
  if ListBox_Seasons.ItemIndex<>-1 then
  begin
    ChHandling := False; // заборонити опрацювання зміни прапорця
    Index := ListBox_Seasons.ItemIndex;
    if PeriodRangesArray[ListBox_Seasons.ItemIndex].Hole then
    begin // якщо діра - то заборонити редагування і встановити відповідну кнопочку
      Label2.Enabled := False;
      chPeriodTo.Enabled := False;
      PeriodFrom_Spin.Enabled := False;
      PeriodTill_Spin.Enabled := False;
      edName.Enabled := False;
      Label1.Enabled := False;
      aInvert.Caption:=EnableSeasonStr;
      aInvert.ImageIndex:=0;
      ButtonBitmap:=TBitmap.Create;
      ImageList1.GetBitmap(0,ButtonBitmap);
      sbInvert.Glyph.Assign(ButtonBitmap);
      ButtonBitmap.Free;
    end
    else
    begin
      Label2.Enabled := True;
      chPeriodTo.Enabled := (Index = High(PeriodRangesArray)) or ((Index = High(PeriodRangesArray)-1) and (PeriodRangesArray[High(PeriodRangesArray)].Hole));
      PeriodFrom_Spin.Enabled := True;
      PeriodTill_Spin.Enabled := True;
      aInvert.Caption:=DisableSeasonStr;
      aInvert.ImageIndex:=1;
      ButtonBitmap:=TBitmap.Create;
      ImageList1.GetBitmap(1,ButtonBitmap);
      sbInvert.Glyph.Assign(ButtonBitmap);
      ButtonBitmap.Free;
      edName.Enabled := True;
      Label1.Enabled := True;
    end;
    // виставлення обмежень та значень
      PeriodFrom_Spin.Properties.MinValue := MinPeriod;
      PeriodFrom_Spin.Properties.MaxValue := MaxInt;
      PeriodTill_Spin.Properties.MinValue := MinPeriod;
      PeriodTill_Spin.Properties.MaxValue := MaxInt;
      PeriodFrom_Spin.Value := PeriodRangesArray[Index].PeriodFrom;
      chPeriodTo.Checked := PeriodRangesArray[ListBox_Seasons.ItemIndex].TillRestricted;
      if chPeriodTo.Checked then PeriodTill_Spin.Value := PeriodRangesArray[Index].PeriodTill
      else PeriodTill_Spin.Value := MaxInt;
      PeriodTill_Spin.Visible := chPeriodTo.Checked;
      PeriodFrom_Spin.Properties.MaxValue := PeriodTill_Spin.Value;
      PeriodTill_Spin.Properties.MinValue := PeriodFrom_Spin.Value;
      if Index = High(PeriodRangesArray) then PeriodTill_Spin.Properties.MaxValue := MaxInt
      else if PeriodRangesArray[Index+1].Hole then PeriodTill_Spin.Properties.MaxValue := PeriodRangesArray[Index+1].PeriodTill
      else PeriodTill_Spin.Properties.MaxValue := PeriodRangesArray[Index+1].PeriodFrom;// - 1;
      if Index = 0 then PeriodFrom_Spin.Properties.MinValue := MinPeriod
      else if PeriodRangesArray[Index-1].Hole then PeriodFrom_Spin.Properties.MinValue := PeriodRangesArray[Index-1].PeriodFrom
      else PeriodFrom_Spin.Properties.MinValue := PeriodRangesArray[Index-1].PeriodTill;// + 1;
                                
    edName.Text := PeriodRangesArray[Index].Marker;
    ChHandling := True;
  end;
end;

procedure TForm_EditPeriodRanges.ActionList1Update(Action: TBasicAction; var Handled: Boolean);
var i : integer;
    NonHoleFinded : boolean;
begin
  NonHoleFinded:=false;
  if Action = Action_Ok then
  begin
    for i:=0 to High(PeriodRangesArray) do
      NonHoleFinded := NonHoleFinded or not PeriodRangesArray[i].Hole;
    Action_Ok.Enabled:=NonHoleFinded;
    Handled:=true;
  end;
end;

procedure TForm_EditPeriodRanges.aInvertExecute(Sender: TObject);
var OldIndex, i, OldRangePeriodRestrict: integer;
    SeasonRangeName: string;
    OldRangeRestrict: TDate;
begin
  OldIndex := ListBox_Seasons.ItemIndex;
  SeasonRangeName := PeriodName(PeriodRangesArray[OldIndex], OldIndex=0);
  if not PeriodRangesArray[OldIndex].Hole
    and (PeriodRangesArray[OldIndex].Id <> -1)
//    and not ConfirmDlgYN(format(RemoveSeasonStr,[SeasonRangeName]))
    and not (MyShowMessageDlg(format(RemoveSeasonStr,[SeasonRangeName]), mtConfirmation, but_YES_NO) = res_YES)
    then Exit;
  PeriodRangesArray[OldIndex].Hole := not PeriodRangesArray[OldIndex].Hole;
  if PeriodRangesArray[OldIndex].Hole then
  begin
    PeriodRangesArray[OldIndex].Id := -1;
    PeriodRangesArray[OldIndex].Marker := EmptyStr;
  end;
  if (OldIndex > 0) and PeriodRangesArray[OldIndex].Hole and PeriodRangesArray[OldIndex-1].Hole then
  begin // вилучити пустоту перед дірою
    OldRangePeriodRestrict := PeriodRangesArray[OldIndex-1].PeriodFrom;
    OldRangeRestrict := PeriodRangesArray[OldIndex-1].FromDate;
    for i:=OldIndex to High(PeriodRangesArray) do
      PeriodRangesArray[i-1]:=PeriodRangesArray[i];
    SetLength(PeriodRangesArray,Length(PeriodRangesArray)-1);
    dec(OldIndex);
    PeriodRangesArray[OldIndex].PeriodFrom := OldRangePeriodRestrict;
    PeriodRangesArray[OldIndex].FromDate := OldRangeRestrict;
  end;
  if (OldIndex<High(PeriodRangesArray)) and PeriodRangesArray[OldIndex].Hole and PeriodRangesArray[OldIndex+1].Hole then
  begin // вилучити пустоту після діри
    if PeriodRangesArray[OldIndex+1].TillRestricted then 
    begin
      OldRangeRestrict := PeriodRangesArray[OldIndex+1].TillDate;
      OldRangePeriodRestrict := PeriodRangesArray[OldIndex+1].PeriodTill;
    end else begin 
      OldRangeRestrict := -1;
      OldRangePeriodRestrict := -1;
    end;

    for i := OldIndex + 2 to High(PeriodRangesArray) do
      PeriodRangesArray[i-1] := PeriodRangesArray[i];
    SetLength(PeriodRangesArray,Length(PeriodRangesArray)-1);
    
    PeriodRangesArray[OldIndex].PeriodTill := -1;
    PeriodRangesArray[OldIndex].TillDate := -1;

    if OldRangePeriodRestrict <> -1 then PeriodRangesArray[OldIndex].PeriodTill := OldRangePeriodRestrict
    else PeriodRangesArray[OldIndex].TillRestricted := False
  end;
  UpdateVisualSeasonRanges;
  ListBox_Seasons.ItemIndex:=OldIndex;
  ListBox_SeasonsClick(ListBox_Seasons);
end;


procedure TForm_EditPeriodRanges.edNameChange(Sender: TObject);
var OldIndex : integer;
begin
  OldIndex:=ListBox_Seasons.ItemIndex;
  PeriodRangesArray[OldIndex].Marker := edName.Text;
  UpdateVisualSeasonRanges;
  ListBox_Seasons.ItemIndex:=OldIndex;
end;

procedure TForm_EditPeriodRanges.chPeriodToClick(Sender: TObject);
var OldIndex : integer;
begin
  if not ChHandling then Exit; //якщо зміна програмна то не реагувати
  ChHandling := false;
  OldIndex := ListBox_Seasons.ItemIndex;
  PeriodTill_Spin.Visible := chPeriodTo.Checked;
  PeriodRangesArray[OldIndex].TillRestricted := chPeriodTo.Checked;
  // відпрацювання видимості редактора та кнопочок
  if PeriodRangesArray[OldIndex].TillRestricted then
  begin
      PeriodRangesArray[OldIndex].PeriodTill := PeriodRangesArray[OldIndex].PeriodFrom + 1;
      PeriodTill_Spin.Value := PeriodRangesArray[OldIndex].PeriodTill;
  end;
  // додавання/вилучення діри
  if (PeriodRangesArray[ListBox_Seasons.ItemIndex].TillRestricted) and (OldIndex = High(PeriodRangesArray)) then
  begin
    SetLength(PeriodRangesArray,Length(PeriodRangesArray)+1);
    PeriodRangesArray[High(PeriodRangesArray)].PeriodFrom := PeriodRangesArray[High(PeriodRangesArray)-1].PeriodTill;// + 1;
    PeriodRangesArray[High(PeriodRangesArray)].PeriodTill := MaxInt;
    PeriodRangesArray[High(PeriodRangesArray)].FromDate := -1;
    PeriodRangesArray[High(PeriodRangesArray)].TillDate := -1;
    PeriodRangesArray[High(PeriodRangesArray)].TillRestricted := False;
    PeriodRangesArray[High(PeriodRangesArray)].Id := -1;
    PeriodRangesArray[High(PeriodRangesArray)].Modified := False;
    PeriodRangesArray[High(PeriodRangesArray)].Hole := True;
    PeriodRangesArray[High(PeriodRangesArray)].Marker := EmptyStr;
  end
  else if (OldIndex = High(PeriodRangesArray)-1) then SetLength(PeriodRangesArray,Length(PeriodRangesArray)-1);
  UpdateVisualSeasonRanges;
  ListBox_Seasons.ItemIndex:=OldIndex;
  ChHandling := true;                                                                   
end;

procedure TForm_EditPeriodRanges.PeriodFrom_SpinChange(Sender: TObject);
var OldIndex, i : integer;
begin
  if not ChHandling then Exit; //якщо зміна програмна то не реагувати
  if PeriodFrom_Spin.Value = PeriodTill_Spin.Value then
  begin
    PeriodFrom_Spin.Value := PeriodFrom_Spin.Value - 1;
    Exit;
  end;
  OldIndex := ListBox_Seasons.ItemIndex;

  PeriodRangesArray[OldIndex].PeriodFrom := Trunc(PeriodFrom_Spin.Value);
  PeriodTill_Spin.Properties.MinValue := PeriodFrom_Spin.Value;
  // додавання пустоти перед діапазоном якщо її немає
  if (OldIndex > 0) and PeriodRangesArray[OldIndex-1].Hole then
  begin
    if PeriodRangesArray[OldIndex-1].PeriodFrom = PeriodRangesArray[OldIndex].PeriodFrom then
    begin
      // вилучити пустоту перед
      for i := OldIndex to High(PeriodRangesArray) do
        PeriodRangesArray[i-1]:=PeriodRangesArray[i];
      SetLength(PeriodRangesArray,Length(PeriodRangesArray)-1);
      dec(OldIndex);
    end
    else PeriodRangesArray[OldIndex-1].PeriodTill := Trunc(PeriodFrom_Spin.Value)// - 1
  end
  else if not ((OldIndex > 0) and (PeriodRangesArray[OldIndex].PeriodFrom - PeriodRangesArray[OldIndex-1].PeriodTill = 0{1}) 
    or (PeriodRangesArray[OldIndex].PeriodFrom = MinPeriod)) 
  then begin // додати пустоту перед
    SetLength(PeriodRangesArray,Length(PeriodRangesArray) + 1);
    for i := High(PeriodRangesArray)-1 downto OldIndex do
     PeriodRangesArray[i+1] := PeriodRangesArray[i];
    if OldIndex-1>=0 then PeriodRangesArray[OldIndex].PeriodFrom := PeriodRangesArray[OldIndex-1].PeriodTill// + 1
      else PeriodRangesArray[OldIndex].PeriodFrom := MinPeriod;
    PeriodRangesArray[OldIndex].PeriodTill := PeriodRangesArray[OldIndex+1].PeriodFrom;// - 1;
    PeriodRangesArray[OldIndex].FromDate := -1;
    PeriodRangesArray[OldIndex].TillDate := -1;
    PeriodRangesArray[OldIndex].TillRestricted := True;
    PeriodRangesArray[OldIndex].Id := -1;
    PeriodRangesArray[OldIndex].Modified := False;
    PeriodRangesArray[OldIndex].Hole := True;
    PeriodRangesArray[OldIndex].Marker := EmptyStr;
    inc(OldIndex);
  end;
  UpdateVisualSeasonRanges;
  ListBox_Seasons.ItemIndex:=OldIndex;
end;

procedure TForm_EditPeriodRanges.PeriodTill_SpinChange(Sender: TObject);
var OldIndex, i  : integer;
begin
  if not ChHandling then Exit; //якщо зміна програмна то не реагувати
  if PeriodFrom_Spin.Value = PeriodTill_Spin.Value then
  begin
    PeriodTill_Spin.Value := PeriodTill_Spin.Value + 1;
    Exit;
  end;
  OldIndex := ListBox_Seasons.ItemIndex;
  PeriodRangesArray[OldIndex].PeriodTill := Trunc(PeriodTill_Spin.Value);
  PeriodFrom_Spin.Properties.MaxValue := PeriodTill_Spin.Value;
  // опрацювання пустоти після діапазону
  if (OldIndex < High(PeriodRangesArray)) and PeriodRangesArray[OldIndex+1].Hole then
  begin
    if PeriodRangesArray[OldIndex+1].PeriodTill = PeriodRangesArray[OldIndex].PeriodTill then
    begin
      // вилучити пустоту після
      for i := OldIndex + 2 to High(PeriodRangesArray) do
        PeriodRangesArray[i-1]:=PeriodRangesArray[i];
      SetLength(PeriodRangesArray,Length(PeriodRangesArray)-1);
    end
    else PeriodRangesArray[OldIndex+1].PeriodFrom := Trunc(PeriodTill_Spin.Value)// + 1 // скоректувати межі пустоти
  end
  else if not ((OldIndex < High(PeriodRangesArray)) 
    and (PeriodRangesArray[OldIndex+1].PeriodFrom - PeriodRangesArray[OldIndex].PeriodTill = 0 {1})) 
  then // додати пустоту після
  begin
    SetLength(PeriodRangesArray,Length(PeriodRangesArray)+1);
    for i := High(PeriodRangesArray)-1 downto OldIndex+1 do
     PeriodRangesArray[i+1] := PeriodRangesArray[i];
    if OldIndex+2 <= High(PeriodRangesArray) then
    begin
      PeriodRangesArray[OldIndex+1].PeriodTill := PeriodRangesArray[OldIndex+2].PeriodFrom;//-1;
      PeriodRangesArray[OldIndex+1].TillRestricted := True;
    end
    else
    begin
      PeriodRangesArray[OldIndex+1].PeriodTill := 200;
      PeriodRangesArray[OldIndex+1].TillRestricted := False;
    end;
    PeriodRangesArray[OldIndex+1].PeriodFrom := PeriodRangesArray[OldIndex].PeriodTill; //+ 1;
    PeriodRangesArray[OldIndex+1].FromDate := -1;
    PeriodRangesArray[OldIndex+1].TillDate := -1;
    PeriodRangesArray[OldIndex+1].Id := -1;
    PeriodRangesArray[OldIndex+1].Modified := False;
    PeriodRangesArray[OldIndex+1].Hole := True;
    PeriodRangesArray[OldIndex+1].Marker := EmptyStr;
  end;
  UpdateVisualSeasonRanges;
  ListBox_Seasons.ItemIndex := OldIndex;     
end;

procedure TForm_EditPeriodRanges.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult = mrOk then CanClose := ChekNotAreHole;
end;

function TForm_EditPeriodRanges.ChekNotAreHole: Boolean;
var I: Integer;
begin
  Result := True;
  for I := Low(PeriodRangesArray) + 1 to High(PeriodRangesArray) - 1 do
    if PeriodRangesArray[i].Hole then Result := False;
//  if not Result then ErrorDlg('Не можна залишати "діри" між періодами.');
  if not Result then MyShowMessageDlg('Не можна залишати "діри" між віковими періодами.',
    mtError, but_OK);
end;

end.

