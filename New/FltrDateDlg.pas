unit FltrDateDlg;

interface

uses
  ZDlg, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, AzDBAddress, DBCtrls, 
  AzComboBox, AzMaskEdit, SvtDBGrids, Spin, AzEdit, ComCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
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
  TDateFltrDlg = class(TZDialog)
    WithOutRadioButton: TRadioButton;
    FilterRadioButton: TRadioButton;
    FromDateLabel: TLabel;
    TillDateLabel: TLabel;
    FromDatePicker: TcxDateEdit;
    TillDatePicker: TcxDateEdit;
    procedure FromDatePickerChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RadioButtonClick(Sender: TObject);
  private
    procedure ToogleDateEdit;
  public
    { Public declarations }
  end;

var
  DateFltrDlg: TDateFltrDlg;

function ExuceteDateFltrDlg(var WithOutFilter: Boolean;
      var FromDate, TillDate: TDateTime): Boolean;

implementation

uses
  TourCmnlIf, TourConsts, VDlgs, Variants;

{$R *.dfm}
function ExuceteDateFltrDlg(var WithOutFilter: Boolean;
      var FromDate, TillDate: TDateTime): Boolean;
begin
  with TDateFltrDlg.Create(Application) do
  try
    if FromDate = 0 then FromDatePicker.Clear
    else FromDatePicker.Date := FromDate;
    if (TillDate = 0) or (TillDate = MaxDateTime) then TillDatePicker.Clear
    else TillDatePicker.Date := TillDate;
    FilterRadioButton.Checked := not WithOutFilter;
    WithOutRadioButton.Checked := not FilterRadioButton.Checked;
    ToogleDateEdit;
    Result := ShowModal = mrOk;
    if Result then
    begin
      WithOutFilter := WithOutRadioButton.Checked;
      if WithOutFilter then begin
        FromDate := 0;
        TillDate := 0;
      end else begin
        FromDate := FromDatePicker.Date;
        if TillDatePicker.EditValue = null then TillDate := MaxDateTime
        else TillDate := TillDatePicker.Date;
      end;
    end;
  finally
    Free;
  end;
end;

procedure TDateFltrDlg.FromDatePickerChange(Sender: TObject);
begin
  inherited;
  WithOutRadioButton.Checked := (TillDatePicker.Text = EmptyStr) and (FromDatePicker.Text = EmptyStr);
  FilterRadioButton.Checked := not WithOutRadioButton.Checked;
end;

procedure TDateFltrDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var d: Extended;
begin
  inherited;
  if ModalResult = mrOk then 
   if (TillDatePicker.Date > 0) and (FromDatePicker.Date > TillDatePicker.Date) then
   begin
     ErrorDlg(SFltrDateDlgErrorDate);
     CanClose := False
   end;
end;

procedure TDateFltrDlg.RadioButtonClick(Sender: TObject);
begin
  inherited;
  ToogleDateEdit;
end;

procedure TDateFltrDlg.ToogleDateEdit;
begin
  ToggleControlEnabled(FromDatePicker, FilterRadioButton.Checked);
  ToggleControlEnabled(TillDatePicker, FilterRadioButton.Checked); 
end;

end.
