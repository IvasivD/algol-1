unit ZDlg;

{$DEFINE UseStdGrid}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, AzDBAddress, DBCtrls, 
  AzComboBox, AzMaskEdit, SvtDBGrids, Spin, AzEdit, ComCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TZDialog = class(TForm)
    CtrlPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FLeftPos: Integer;
    FTopPos: Integer;
  protected
    procedure PrepareDialog; virtual;
    procedure SetWindowPosition(aLeftPos, aTopPos: Integer); virtual;
    procedure HighlightAzEdit(Ctrl: TAzEdit; En: Boolean);
    procedure HighlightDBGrid(Ctrl: TSvtDBGrid; En: Boolean);
    procedure HighlightAzComboBox(Ctrl: TAzComboBox; En: Boolean);
    procedure HighlightDateEdit(Ctrl: TcxDateEdit; En: Boolean);
    procedure HighlightEditAsDefault;
    procedure HighlightSpinEdit(Ctrl: TSpinEdit; En: Boolean);
    procedure HighlightDateTimePicker(Ctrl: TDateTimePicker; En: Boolean);
    property LeftPos: Integer read FLeftPos write FLeftPos;
    property TopPos: Integer read FTopPos write FTopPos;
  published
    procedure OtherDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  end;

var
  ZDialog: TZDialog;

implementation

{$IFDEF UseStdGrid}
uses VDlgs;
{$ENDIF}

{$R *.DFM}

procedure TZDialog.PrepareDialog;
begin
  SetWindowPosition(FLeftPos, FTopPos);
end;

procedure TZDialog.FormCreate(Sender: TObject);
begin
  FLeftPos := 0;
  FTopPos := 0;
  PrepareDialog;
end;

procedure TZDialog.OtherDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
{$IFDEF UseStdGrid}
  DBGridDrawNotActive(
    Sender as TDBGrid, ActiveControl = Sender, Rect, DataCol, Column, State);
{$ENDIF}
  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TZDialog.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if not CanClose then ModalResult := mrNone;
end;

procedure TZDialog.HighlightAzComboBox(Ctrl: TAzComboBox; En: Boolean);
begin
  with Ctrl do
  begin
    if not Enabled then //Color := clBtnFace
    else Color := GetControlHighlightColor(Tag < 0, En);
    TabStop := En;
  end;
end;

procedure TZDialog.HighlightAzEdit(Ctrl: TAzEdit; En: Boolean);
begin
  with Ctrl do
  begin
    if not Enabled then Color := clBtnFace
    else Color := GetControlHighlightColor(Tag < 0, En);
    TabStop := En;
  end;
end;

procedure TZDialog.HighlightDBGrid(Ctrl: TSvtDBGrid; En: Boolean);
begin
  with Ctrl do
  begin
    if not Enabled then Color := clBtnFace
    else Color := GetControlHighlightColor(Tag < 0, En);
    TabStop := En;
  end;
end;

procedure TZDialog.HighlightEditAsDefault;
var I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TAzComboBox then
      HighlightAzComboBox(Components[I] as TAzComboBox, True)
    else if Components[I] is TAzEdit then
      HighlightAzEdit(Components[I] as TAzEdit, True)
    else if Components[I] is TSvtDBGrid then
      HighlightDBGrid(Components[I] as TSvtDBGrid, True)
    else if Components[I] is TcxDateEdit then 
      HighlightDateEdit(Components[I] as TcxDateEdit, True)
    else if Components[I] is TSpinEdit then 
      HighlightSpinEdit(Components[I] as TSpinEdit, True)
    else if Components[I] is TDateTimePicker then 
      HighlightDateTimePicker(Components[I] as TDateTimePicker, True)
end;

procedure TZDialog.HighlightDateEdit(Ctrl: TcxDateEdit;
  En: Boolean);
begin
  with Ctrl do
  begin
    if not Enabled then Color := clBtnFace
    else Color := GetControlHighlightColor(Tag < 0, En);
    TabStop := En;
  end;
end;

procedure TZDialog.HighlightSpinEdit(Ctrl: TSpinEdit; En: Boolean);
begin
  with Ctrl do
  begin
    if not Enabled then Color := clBtnFace
    else Color := GetControlHighlightColor(Tag < 0, En);
    TabStop := En;
  end;
end;

procedure TZDialog.HighlightDateTimePicker(Ctrl: TDateTimePicker;
  En: Boolean);
begin
  with Ctrl do
  begin
    if not Enabled then Color := clBtnFace
    else Color := GetControlHighlightColor(Tag < 0, En);
    TabStop := En;
  end;
end;

procedure TZDialog.SetWindowPosition(aLeftPos, aTopPos: Integer);
begin
  if (aLeftPos = 0) and (aTopPos = 0) then //Position := poMainFormCenter
  else begin
    Position := poDesigned;
    Left := aLeftPos + 10;
    Top := aTopPos + 5;
  end;
end;

end.

