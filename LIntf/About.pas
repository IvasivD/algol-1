unit About;

interface

uses Windows;

procedure ShowAboutDlg;


implementation

uses Forms, SysUtils, StdCtrls, ExtCtrls, Buttons, Types, Graphics,
  Math, TourConsts, Controls;

function CreateLabel(
  AParent: TWinControl; ALeft, ATop: Integer; const ACaption: String): TLabel;
begin
  Result := TLabel.Create(Application);
  with Result do
  begin
    Parent := AParent;
    Left := ALeft;
    Top := ATop;
    Caption := ACaption;
  end;
end;

function CreateTitleLabel(AParent: TWinControl; Foreground: Boolean): TLabel;
begin
  Result := CreateLabel(AParent, 64, 16, Application.Title);
  with Result do
  begin
    Font.Style := [fsBold];
    Font.Size := 16;
    Font.Name := 'Arial';
    if Foreground then Font.Color := clNavy
    else begin
      Font.Color := clYellow;
      Left := Left + 1;
      Top := Top + 1;
    end;
    Transparent := True;
  end;
end;

procedure ShowAboutDlg;
var AboutDlg: TForm;
begin
  AboutDlg := TForm.CreateNew(Application);
  with AboutDlg do
    try
      Caption := SVDlgsAbout;
      Height := 363;
      Width := 445;
      Position := poScreenCenter;
      BorderStyle := bsDialog;
      with TImage.Create(AboutDlg) do
      begin
        Parent := AboutDlg;
        BoundsRect := Bounds(16, 16, 32, 32);
        Picture.Icon.Assign(Application.Icon);
      end;
      CreateTitleLabel(AboutDlg, False);
      with CreateTitleLabel(AboutDlg, True) do
        AboutDlg.ClientWidth := Max(AboutDlg.ClientWidth, Left + Width + 16);
      CreateLabel(AboutDlg, 64,  64, '(c) Copyright Algol ltd.');
      CreateLabel(AboutDlg, 64, 224, Format(SVDlgsVersion, ['1.0.1.1 beta']));
      CreateLabel(AboutDlg, 64, 248, FormatDateTime(SVDlgsVersionUpdate,
        FileDateToDateTime(FileAge(Application.ExeName))));
      with TBitBtn.Create(AboutDlg) do
      begin
        Parent := AboutDlg;
        Kind := bkOK;
        Width := 82;
        Top := AboutDlg.ClientHeight - 40;
        Left := (AboutDlg.ClientWidth - Width) div 2;
      end;
      ShowModal;
    finally
      Free;
    end;
end;

end.
