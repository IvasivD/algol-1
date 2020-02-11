unit StatForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls;

Const hClientWindow: Integer = 467;

type
  TStatusBarForm = class(TForm)
    StatusBar: TStatusBar;
    procedure StatusBarClick(Sender: TObject);
    procedure StatusBarDrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);

  public
    procedure Prepare;
  end;

var
  StatusBarForm: TStatusBarForm;

implementation

{$R *.DFM}

procedure TStatusBarForm.Prepare;
var R: TRect;
begin
  {$WARN UNSAFE_CODE OFF}
  if SystemParametersInfo( SPI_GETWORKAREA, 0, @R, 0 ) then
  {$WARN UNSAFE_CODE ON}
  begin
    Left := 0;
    Top := R.Bottom - Height;
    Width := R.Right;
  end;
 // hClientWindow := hClientWindow - Height;
end;

procedure TStatusBarForm.StatusBarClick(Sender: TObject);
begin
  Application.MainForm.SetFocus;
end;

procedure TStatusBarForm.StatusBarDrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  if Panel.Index = 0 then
  begin
    StatusBar.Canvas.Font.Style := [fsBold];
    StatusBar.Canvas.Font.Color := clNavy;
    StatusBar.Canvas.TextRect(Rect, Rect.Left + 4, Rect.Top, Panel.Text);
  end;
end;

end.
