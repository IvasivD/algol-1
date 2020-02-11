unit TimeSelDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, Buttons, ExtCtrls;

type
  TTimeSelectDlg = class(TForm)
    Panel1: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    DateTimePicker: TDateTimePicker;
    PromptLabel: TLabel;
    procedure FormActivate(Sender: TObject);
  end;

{var
  TimeSelectDlg: TTimeSelectDlg;}

function SelectDateFromPicker(ADate: TDateTime): TDateTime;
function SelectTimeFromPicker(ATime: TDateTime): TDateTime;


implementation

uses LibConsts;

{$R *.DFM}

function SelectDateFromPicker(ADate: TDateTime): TDateTime;
begin
  Result := ADate;
  with TTimeSelectDlg.Create(Application) do
    try
      Caption := STimeSelDlgDateCaption;
      PromptLabel.Caption := STimeSelDlgDatePrompt;
      DateTimePicker.Kind := dtkDate;
      DateTimePicker.Date := ADate;
      if ShowModal = mrOk then Result := DateTimePicker.Date;
    finally
      Free;
    end;
end;

function SelectTimeFromPicker(ATime: TDateTime): TDateTime;
begin
  Result := ATime;
  with TTimeSelectDlg.Create(Application) do
    try
      Caption := STimeSelDlgTimeCaption;
      PromptLabel.Caption := STimeSelDlgTimePrompt;
      DateTimePicker.Kind := dtkTime;
      DateTimePicker.Time := ATime;
      if ShowModal = mrOk then Result := DateTimePicker.Time;
    finally
      Free;
    end;
end;

{ TTimeSelectDlg }

procedure TTimeSelectDlg.FormActivate(Sender: TObject);
begin
  ActiveControl := DateTimePicker;
end;

end.
