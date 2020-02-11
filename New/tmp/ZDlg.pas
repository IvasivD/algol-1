unit ZDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  TZDialog = class(TForm)
    CtrlPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  published
    procedure OtherDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  end;

var
  ZDialog: TZDialog;

implementation

{$R *.DFM}

procedure TZDialog.OtherDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var C: TColor;
begin
  if gdSelected in State then
  begin
    if gdFocused in State then C := clHighlight else C := clBtnShadow;
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Color := C;
      FillRect(Rect);
    end;
  end;
  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TZDialog.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not CanClose then ModalResult := mrNone;
end;

end.

