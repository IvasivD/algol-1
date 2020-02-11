unit ZTView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBTables, StdCtrls, Buttons, ExtCtrls, ActnList, ImgList;

type
  TZViewForm = class(TForm)
    TopPanel: TPanel;
    BottomPanel: TPanel;
    CloseBtn: TBitBtn;
    DetailListQuerySrc: TDataSource;
    DetailListQuery: TQuery;
    PopupMenu: TPopupMenu;
    CloseItem: TMenuItem;
    ActionList: TActionList;
    CloseAction: TAction;
    PrintDialog: TPrintDialog;
    PrintAction: TAction;
    PrintItem: TMenuItem;
    N2: TMenuItem;
    ImageList: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DetailListQueryAfterScroll(DataSet: TDataSet);
    procedure CloseActionExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FGridUniqueColumn: TField;
    FGridUniqueFirst: Integer;
    FUpdateQueryOnActivation: Boolean;
    procedure DoViewMemo(Pos: TPoint; Field: TField);
  protected
    procedure DoViewHint(const HintMsg: string);
    procedure SetDetailListQueryParams; virtual;
    procedure UpdateDetailListQuery; virtual;
    procedure ViewHint; virtual;
    procedure ViewMemo(Field: TField); virtual;
    property UpdateQueryOnActivation: Boolean read FUpdateQueryOnActivation write FUpdateQueryOnActivation;
    property GridUniqueColumn: TField read FGridUniqueColumn write FGridUniqueColumn;
    property GridUniqueFirst: Integer read FGridUniqueFirst write FGridUniqueFirst;
  end;

var
  ZViewForm: TZViewForm;

implementation

uses VDlgs;

{$R *.DFM}

procedure TZViewForm.DoViewHint(const HintMsg: string);
begin
  SendMyStatusMsg(HintMsg);
end;

procedure TZViewForm.DoViewMemo(Pos: TPoint; Field: TField);
var
  VwFrm: TForm;
  XSize, YSize: Integer;
begin
  if ((Field.DataType = ftMemo) or (Field.DataType = ftFmtMemo)) then
  begin
    XSize := Screen.Width div 5;
    YSize := Screen.Height div 5;
    VwFrm := TForm.Create(Application);
    with VwFrm do
    try
      if Pos.X + xSize <= Screen.Width then
        Left := Pos.X + 1 else Left := Pos.X - xSize - 1;
      if Pos.Y + ySize <= Screen.Height then
        Top := Pos.Y + 1 else Top := Pos.Y - ySize - 1;
      Width := xSize;
      Height := ySize;
      BorderIcons := [biSystemMenu];
      BorderStyle := bsSizeToolWin;
      with TMemo.Create(VwFrm) do
      begin
        Parent := VwFrm;
        Align := alClient;
        ScrollBars := ssVertical;
        WordWrap := True;
        Color := clInfoBk;
        Text := Field.AsString;
        ReadOnly := True;
      end;
      KeyPreview := True;
      Caption := Field.DisplayName;
      OnKeyPress := FormKeyPress;
      ShowModal;
    finally
      Free;
    end;
  end;
end;

procedure TZViewForm.SetDetailListQueryParams;
begin
end;

procedure TZViewForm.UpdateDetailListQuery;
var Id: Integer;
begin
  with DetailListQuery do
  begin
    if not Assigned(FGridUniqueColumn) then Id := 0
    else if FGridUniqueFirst <> 0 then
    begin
      Id := FGridUniqueFirst;
      FGridUniqueFirst := 0;
    end
    else if Active then Id := FGridUniqueColumn.AsInteger else Id := 0;
    Close;
    SetDetailListQueryParams;
    Prepare;
    Open;
    if Id <> 0 then DetailListQuery.Locate(FGridUniqueColumn.FieldName, Id, []);
  end;
end;

procedure TZViewForm.ViewHint;
begin
  DoViewHint('');
end;

procedure TZViewForm.ViewMemo(Field: TField);
begin
  try
    DoViewMemo(Mouse.CursorPos, Field);
  except
  end;
end;

procedure TZViewForm.FormCreate(Sender: TObject);
begin
  FGridUniqueColumn := nil;
  FGridUniqueFirst := 0;
  Top := yClientWindow;
  Left := (wClientWindow - xClientWindow - Width) div 2;
  FUpdateQueryOnActivation := True;
end;

procedure TZViewForm.FormActivate(Sender: TObject);
begin
  if UpdateQueryOnActivation then UpdateDetailListQuery;
end;

procedure TZViewForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    Key := #0;
    Close;
  end;
end;

procedure TZViewForm.DetailListQueryAfterScroll(DataSet: TDataSet);
begin
  ViewHint;
end;

procedure TZViewForm.CloseActionExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TZViewForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if CanClose then ClearMyStatusMsg;
end;

end.
