unit UnitFrameMoveToTimeZone;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs,UnitProc, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox, StdCtrls,
  cxRadioGroup, ExtCtrls,UnitTimeLiner;

type
  TTimeZoneMove=record
     Month:Variant;
     TypeSelect:Variant;
     Value:Variant;
  end;
  
  TFrameMoveToTimeZone = class(TFrame)
    PanelMain: TPanel;
    Label7: TLabel;
    RbCheckByWeekMonth: TcxRadioButton;
    CmDayForMonth: TcxImageComboBox;
    LbDayTimeZoneMove: TLabel;
    RbCheckByDay: TcxRadioButton;
    Label9: TLabel;
    CmbMoveTimeZoneMonth: TcxImageComboBox;
    CmWeekForMonth: TcxImageComboBox;
    EdDayTimeZoneMove: TcxImageComboBox;
    procedure RbCheckByWeekMonthClick(Sender: TObject);
  private

    { Private declarations }
  public
     function  ValidateValue:Boolean;
     procedure Prepare(Month,aType,aValue:Variant);
     procedure RefreshControls;
     function GetValue:TTimeZoneMove;
     procedure SetEnabled(aEn:Boolean);
    { Public declarations }
  end;

implementation

{$R *.dfm}

function TFrameMoveToTimeZone.GetValue: TTimeZoneMove;
begin
  if (CmbMoveTimeZoneMonth.EditValue <> null)and(CmbMoveTimeZoneMonth.EditValue<>33) then
    Result.Month := CmbMoveTimeZoneMonth.EditValue+1
  else Result.Month := null;

  if RbCheckByWeekMonth.Checked then
  begin
    Result.TypeSelect:=CmWeekForMonth.EditValue;
    if CmDayForMonth.EditValue<>555 then Result.Value := CmDayForMonth.EditValue+1
    else Result.Value := null;

  end
  else
  begin
    Result.TypeSelect:=-1;
    if CmDayForMonth.EditValue<>555 then Result.Value := EdDayTimeZoneMove.EditValue+1
    else Result.Value := null;
  end;

end;

function TFrameMoveToTimeZone.ValidateValue:Boolean;
var aValue:TTimeZoneMove;
begin
  aValue := GetValue;
  if (aValue.Month =  0) or (aValue.TypeSelect = null) or (aValue.Value = null) or (aValue.Value = 0) then
  result :=False
  else result := True;
end;

procedure TFrameMoveToTimeZone.Prepare( Month, aType, aValue:Variant );
var i:Integer;
    aListMonth:TStringList;
    aListDay:TStringList;
    aListNumberOfDays:TStringList;
begin
  try
    aListNumberOfDays:=TStringList.create;
    aListMonth := MakeStringListForArray( MasMonthUkr );
    FormingImageComboBox( CmbMoveTimeZoneMonth,aListMonth);

    aListDay := MakeStringListForArray( DayNamesUkr );
    FormingImageComboBox( CmDayForMonth,aListDay);

    for i:=1 to 31 do aListNumberOfDays.Add( IntToStr(i) );
    FormingImageComboBox( EdDayTimeZoneMove,aListNumberOfDays);

    RbCheckByWeekMonth.Checked := True;

    if Month <> null then
      CmbMoveTimeZoneMonth.EditValue := Month - 1
    else CmbMoveTimeZoneMonth.EditValue:=null;

    EdDayTimeZoneMove.EditValue := null;

    if aType <> null then
    begin
      if aType = -1 then
      begin
        RbCheckByDay.Checked := True;
        EdDayTimeZoneMove.EditValue := aValue - 1;
      end
      else
      begin
        RbCheckByWeekMonth.Checked := true;
        CmDayForMonth.EditValue := aValue - 1;
        EdDayTimeZoneMove.EditValue := null;
        CmWeekForMonth.EditValue := aType;
      end;
    end;

  finally
    aListNumberOfDays.Free;
    aListDay.Free;
    aListMonth.free;
  end;

  RefreshControls;

end;

procedure TFrameMoveToTimeZone.RefreshControls;
begin
  CmDayForMonth.Enabled :=  RbCheckByWeekMonth.Checked;
  CmWeekForMonth.Enabled := RbCheckByWeekMonth.Checked;

  EdDayTimeZoneMove.Enabled := RbCheckByDay.Checked;
  LbDayTimeZoneMove.Enabled := RbCheckByDay.Checked;
end;

procedure TFrameMoveToTimeZone.RbCheckByWeekMonthClick(Sender: TObject);
begin
  RefreshControls;
end;

procedure TFrameMoveToTimeZone.SetEnabled(aEn: Boolean);
begin
  SetEnabledChildControls( PanelMain, aEn, [], []);
  if aEn then RefreshControls;
end;

end.
