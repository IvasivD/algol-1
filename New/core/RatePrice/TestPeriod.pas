unit TestPeriod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Spin;

type
  TPeriodTestForm = class(TForm)
    PeriodBtn: TBitBtn;
    AgesBtn: TBitBtn;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    procedure PeriodBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PeriodTestForm: TPeriodTestForm;

implementation

uses
  HeaderConfig_Form, RateTypes;

{$R *.dfm}

procedure TPeriodTestForm.PeriodBtnClick(Sender: TObject);
var aRange: TRateRange;
  I, aLen: Integer;  
begin
  aLen := SpinEdit1.Value;
  SetLength(aRange, aLen);
  for I:= 0 to aLen - 1 do begin
//   aRange[I].Caption := Format('Period %d', [I]);
   aRange[I].From := aLen - 1 - I;
   if I = 0 then aRange[I].Till := - 1 else aRange[I].Till := aLen - I;
  end;
  case (Sender as TBitBtn).Tag of
  0: ExecuteHeaderConfigPeriodForm(aRange);
  1: ExecuteHeaderConfigAgeForm(aRange);
  end;
end;

end.
