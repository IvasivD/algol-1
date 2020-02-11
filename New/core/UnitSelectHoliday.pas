unit UnitSelectHoliday;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  StdCtrls, cxRadioGroup, UnitFrameMoveToTimeZone, cxTextEdit, Buttons,core,UnitProc,
  ExtCtrls;

type
  TFrmSelectHoliday = class(TForm)
    CtrlPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Label12: TLabel;
    EdOficialName: TcxTextEdit;
    FrameMoveToTimeZone: TFrameMoveToTimeZone;
    RbCheckByReligionDate: TcxRadioButton;
    EdHolidayByReligiCalendar: TcxTextEdit;
    RbHolidayByData: TcxRadioButton;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RbCheckByReligionDateClick(Sender: TObject);
    procedure RbHolidayByDataClick(Sender: TObject);
  private
     FElemHoliday:TDBShemaView;
    { Private declarations }
  public
     procedure PrepareControls( aNew:Boolean );
     procedure RefreshControls;
     procedure SaveData( aNew:Boolean );
    { Public declarations }
  end;

Function ShowSelectHoliday( aNew:Boolean; ElemHoliday:TDBShemaView ):boolean;
var
  FrmSelectHoliday: TFrmSelectHoliday;

implementation

{$R *.dfm}
Function ShowSelectHoliday( aNew:Boolean; ElemHoliday:TDBShemaView ):boolean;
begin
  try
    Application.CreateForm( TFrmSelectHoliday, FrmSelectHoliday );

    FrmSelectHoliday.FElemHoliday :=ElemHoliday;
    FrmSelectHoliday.PrepareControls( aNew );

    if FrmSelectHoliday.ShowModal = mrOk then
    begin
      FrmSelectHoliday.SaveData( aNew );
      result:=True;
    end
    else result:=False;
  finally
    FrmSelectHoliday.Free;
  end;
end;

procedure TFrmSelectHoliday.RefreshControls;
begin
  FrameMoveToTimeZone.SetEnabled(RbHolidayByData.Checked);
end;

procedure TFrmSelectHoliday.PrepareControls( aNew:Boolean );
begin
  if not aNew then
  begin
    EdOficialName.Text :=FElemHoliday.DB.FieldByName('NAME').AsString;

    if FElemHoliday.DB.FieldByName('TYPEDATE').AsInteger = -2 then
    begin
      RbCheckByReligionDate.Checked := true;
      EdHolidayByReligiCalendar.EditValue := self.FElemHoliday.DB.FieldByName('NAMEBYRELIGION').Value ;
      FrameMoveToTimeZone.Prepare(null,-1,null);
    end
    else FrameMoveToTimeZone.Prepare( FElemHoliday.DB.FieldByName('AMONTH').AsInteger,
                                      FElemHoliday.DB.FieldByName('TYPEDATE').AsInteger,
                                      FElemHoliday.DB.FieldByName('AVALUE').AsInteger );


  end
  else
  begin
    RbHolidayByData.Checked:=True;
    FrameMoveToTimeZone.Prepare( null,-1,null);
  end;

  RefreshControls;
end;

procedure TFrmSelectHoliday.SaveData( aNew:Boolean );
var aType:Integer;
    aValue:TTimeZoneMove;
    AddDescript:Variant;
begin
  if RbHolidayByData.Checked then
  begin
    aValue := FrameMoveToTimeZone.GetValue;
    AddDescript:=null;
  end
  else
  begin
    aValue.TypeSelect := -2;
    aValue.Month:= null;
    aValue.Value:= null;
    AddDescript := EdHolidayByReligiCalendar.EditValue;
  end;
  if aNew then self.FElemHoliday.Db.Insert
  else self.FElemHoliday.Db.Edit;

  self.FElemHoliday.DB.FieldByName('NAME').Value:= EdOficialName.EditValue;
  self.FElemHoliday.DB.FieldByName('AMONTH').Value:= aValue.Month;
  self.FElemHoliday.DB.FieldByName('TYPEDATE').Value:= aValue.TypeSelect;
  self.FElemHoliday.DB.FieldByName('AVALUE').Value := aValue.Value;
  if aValue.TypeSelect = -2 then  self.FElemHoliday.DB.FieldByName('NAMEBYRELIGION').Value := EdHolidayByReligiCalendar.EditingValue
  else self.FElemHoliday.DB.FieldByName('NAMEBYRELIGION').Value := null;
  
  self.FElemHoliday.DB.Post;
end;

procedure TFrmSelectHoliday.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if self.ModalResult = mrCancel then
  begin
    CanClose := True;
    Exit;
  end;

  if EdOficialName.EditValue = '' then
  begin
    MyShowMessageDlg('¬каж≥ть назву св€та',mtError,but_OK);
    CanClose:=False;
  end;

  if (RbHolidayByData.Checked) and( not FrameMoveToTimeZone.ValidateValue ) then
  begin
    MyShowMessageDlg('¬каж≥ть корректно дату',mtError,but_OK);
    CanClose:=False;
  end
  else
    if (RbCheckByReligionDate.Checked)and(EdHolidayByReligiCalendar.Text ='') then
    begin
      MyShowMessageDlg('¬каж≥ть значенн€ дл€ визначенн€ за рел≥г≥йним календарем',mtError,but_OK);
      CanClose:=False;
    end;
end;

procedure TFrmSelectHoliday.RbCheckByReligionDateClick(Sender: TObject);
begin
  RefreshControls;
end;

procedure TFrmSelectHoliday.RbHolidayByDataClick(Sender: TObject);
begin
  RefreshControls;
end;

end.
