unit DrvLego;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls, Spin, Buttons, ExtCtrls, ComCtrls, DBCtrls, ActnList,
  ImgList, Menus, Core, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxCalendar,
  cxCheckBox, cxImage, cxDBExtLookupComboBox, cxImageComboBox, cxBlobEdit,
  cxDBLookupComboBox, cxButtonEdit, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid;

type
  TCellPlace = record
    CellName : String;
  end;
  TCellPlaceRowArr = array of TCellPlace;
  TBusPlacesArr = array of TCellPlaceRowArr;

  TDriveConstructForm = class(TForm)
    DriveModelPanel: TPanel;
    SettingsPanel: TPanel;
    CtrlPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    ToggleBtn: TSpeedButton;
    ClearBtn: TSpeedButton;
    ClassBtn: TSpeedButton;
    SizeGroupBox: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    HSizeEdit: TSpinEdit;
    VSizeEdit: TSpinEdit;
    ConstructPanel: TPanel;
    ConstructGrid: TStringGrid;
    FloorsPanel: TPanel;
    Label6: TLabel;
    FloorDBLookupComboBox: TDBLookupComboBox;
    HorizontalGroupBox: TGroupBox;
    HCharsetRadioButton1: TRadioButton;
    HCharsetRadioButton2: TRadioButton;
    HCharsetPanel: TPanel;
    HCharsetRadioButton21: TRadioButton;
    HCharsetRadioButton22: TRadioButton;
    VerticalGroupBox: TGroupBox;
    VCharsetRadioButton1: TRadioButton;
    VCharsetRadioButton2: TRadioButton;
    VCharsetPanel: TPanel;
    VCharsetRadioButton21: TRadioButton;
    VCharsetRadioButton22: TRadioButton;
    OrderRadioGroup: TRadioGroup;
    HOrderRadioGroup: TRadioGroup;
    VOrderRadioGroup: TRadioGroup;
    ConstructPopupMenu: TPopupMenu;
    ActionList: TActionList;
    ImageList: TImageList;
    ToggleAction: TAction;
    ClearAction: TAction;
    ClassAction: TAction;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    ModeAction: TAction;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    SelectRowAction: TAction;
    SelectColAction: TAction;
    SelectAllAction: TAction;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    EditAction: TAction;
    N10: TMenuItem;
    N11: TMenuItem;
    HorizontalImage: TImage;
    VerticalImage: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FloorDBLookupComboBoxClick(Sender: TObject);
    procedure SizeEditChange(Sender: TObject);
    procedure OrderRadioGroupClick(Sender: TObject);
    procedure HCharsetRadioButtonClick(Sender: TObject);
    procedure VCharsetRadioButtonClick(Sender: TObject);
    procedure HCharsetRadioButton21Click(Sender: TObject);
    procedure VCharsetRadioButton22Click(Sender: TObject);
    procedure HOrderRadioGroupClick(Sender: TObject);
    procedure ToggleActionExecute(Sender: TObject);
    procedure ClearActionExecute(Sender: TObject);
    procedure SelectAllActionExecute(Sender: TObject);
    procedure SelectColActionExecute(Sender: TObject);
    procedure SelectRowActionExecute(Sender: TObject);
    procedure EditActionExecute(Sender: TObject);
    procedure ModeActionExecute(Sender: TObject);
    procedure ConstructGridMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ConstructGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure ConstructGridDblClick(Sender: TObject);
    procedure ConstructGridContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
  private
    FElemDrive:TDBShema;
    FElemDriveMapTable :TDBShema;
    FPlaceCount: Integer;
    FPlaceMap: String;
    IsNumberOk: Boolean;
    FDriveModel: String;
    HotMouseCol: Longint;
    HotMouseRow: Longint;
    procedure SetDriveModel(AValue: String);
    function GetPlaceMap: String;
    procedure SetPlaceMap(AValue: String);
    procedure DrawOrders;
    procedure GridSelection(ALeft, ATop, ARight, ABottom: Longint);
    procedure Numbering;
    procedure LoadPlaceMap;
    procedure StorePlaceMap;
  public
    property DriveModel: String read FDriveModel write SetDriveModel;
    property PlaceCount: Integer read FPlaceCount write FPlaceCount;
    property PlaceMap: String read GetPlaceMap write SetPlaceMap;
  end;

var
  DriveConstructForm: TDriveConstructForm;
  
function ShowDriveConstruct(aElemDrive, aElemDriveMapTable:TDBShema;  APlaceCount: Integer): Boolean;


implementation

uses ServMod,  VDlgs, TourConsts, TourCmnlIf, DBTables;

{$R *.DFM}

function ShowDriveConstruct(aElemDrive, aElemDriveMapTable:TDBShema; APlaceCount: Integer): Boolean;
begin

  aElemDriveMapTable.DBOpen;
  if aElemDriveMapTable.DBRecordCount > 0 then
    aElemDriveMapTable.DB.Edit
  else aElemDriveMapTable.DB.Insert;
  
  if aElemDriveMapTable.DBRecordCount < 2 then
    aElemDriveMapTable.DB.FieldByName('PLACECOUNT').asInteger := APlaceCount;

  try
    Application.CreateForm(TDriveConstructForm, DriveConstructForm);
    DriveConstructForm.FElemDrive := aElemDrive;
    DriveConstructForm.FElemDriveMapTable := aElemDriveMapTable;

    DriveConstructForm.PlaceCount := DriveConstructForm.FElemDriveMapTable.DB.FieldByName('PLACECOUNT').asInteger;
    DriveConstructForm.DriveModel := Format( SDriveDlgDriveModel, [ DriveConstructForm.FElemDrive.DB.FieldByName('LookDriveKind').asString,
                                             DriveConstructForm.FElemDrive.DB.FieldByName('MODEL').asString,
                                             DriveConstructForm.FElemDrive.DB.FieldByName('PLACECOUNT').asInteger] );

    DriveConstructForm.PlaceMap := DriveConstructForm.FElemDriveMapTable.DB.FieldByName('MAP').AsVariant;
    Result := DriveConstructForm.ShowModal = mrOk;
    if Result then
    begin
      DriveConstructForm.FElemDriveMapTable.DB.FieldByName('MAP').AsVariant := DriveConstructForm.PlaceMap;
      DriveConstructForm.FElemDriveMapTable.DBPost;
    end
    else DriveConstructForm.FElemDriveMapTable.DBCancel;

  finally
    DriveConstructForm.Free;
  end;
end;


{ TDriveConstructForm }

procedure TDriveConstructForm.SetDriveModel(AValue: String);
begin
  DriveModelPanel.Caption := AValue;
end;

function TDriveConstructForm.GetPlaceMap: String;
var I, J: Integer;
begin
  with ConstructGrid do
  begin
    FPlaceMap := IntToStr(ColCount) + ',' + IntToStr(RowCount) + ',';
    for J := 0 to RowCount - 1 do
      for I := 0 to ColCount - 1 do
        FPlaceMap := FPlaceMap + Cells[I, J] + ',';
  end;
  Result := FPlaceMap;
end;

procedure TDriveConstructForm.SetPlaceMap(AValue: String);
begin
  if FPlaceMap <> AValue then FPlaceMap := AValue;
  IsNumberOk := ShowPlaceMap(FPlaceMap, ConstructGrid, False);
  if not IsNumberOk then
    with ConstructGrid do RowCount := FPlaceCount div ColCount + 1;
  with ConstructGrid do
  begin
    HSizeEdit.Value := ColCount; //set horizontal grid dimension
    VSizeEdit.Value := RowCount; //set vertical grid dimension
  end;
end;

procedure TDriveConstructForm.DrawOrders;
var Bmp: TBitmap;
begin
  Bmp := TBitmap.Create;
  try
    ImageList.GetBitmap(HOrderRadioGroup.ItemIndex + 3, Bmp);
    HorizontalImage.Picture.Bitmap.Assign(Bmp);
    with Bmp.Canvas do
    begin
      Brush.Color := clBtnFace;
      FillRect(ClipRect);
    end;
    ImageList.GetBitmap(VOrderRadioGroup.ItemIndex + 5, Bmp);
    VerticalImage.Picture.Bitmap.Assign(Bmp);
  finally
    Bmp.Free;
  end;
end;

procedure TDriveConstructForm.GridSelection(ALeft, ATop, ARight, ABottom: Longint);
var Sel: TGridRect;
begin
  with ConstructGrid, Sel do
  begin
    TopLeft.X := ALeft;
    TopLeft.Y := ATop;
    BottomRight.X := ARight;
    BottomRight.Y := ABottom;
    Selection := Sel;
  end;
end;

procedure TDriveConstructForm.Numbering;
var
  I, J, N, NumbOrd, Numb: Integer;
  Ch: String;
  C: Char;

  procedure InitCharset;
  begin
    if VCharsetRadioButton21.Checked then
      C := Pred('À'){cyr} else C := Pred('A'){lat};
    Ch := C;
  end;

  function GenNumber(NextIter: Boolean): String;
  begin
    if HCharsetRadioButton2.Checked or VCharsetRadioButton2.Checked
    then begin
      case NextIter of
        False: if HCharsetRadioButton2.Checked then C := Succ(C) else Inc(Numb);
        True: if HCharsetRadioButton2.Checked then InitCharset else Numb := 0;
      end;
      case NextIter of
        True: if HCharsetRadioButton2.Checked then Inc(Numb) else C := Succ(C);
      end;
      if Numb = 0 then Inc(Numb);
      if C in [Pred('A'), Pred('À')] then C := Succ(C);
      Ch := C;
      Result := IntToStr(Numb);
      case OrderRadioGroup.ItemIndex of
        0: Result := Ch + Result;
        1: Result := Result + Ch;
      end;
    end
    else begin
      Inc(Numb);
      Result := IntToStr(Numb);
    end;
  end;

  procedure NumberProc(C, R: Integer; NextIter: Boolean);
  begin
    //if ConstructGrid.Cells[C, R] = '*' then ShowMessage(IntToStr(C)+'  '+IntToStr(R));
    if ConstructGrid.Cells[C, R] <> '*' then
    begin
      ConstructGrid.Cells[C, R] := GenNumber(NextIter);
      Inc(N);
    end;
  end;

begin
  N := 1;
  Numb := 0;
  InitCharset;
  NumbOrd := VOrderRadioGroup.ItemIndex shl 1 + HOrderRadioGroup.ItemIndex;
  with ConstructGrid do
    case OrderRadioGroup.ItemIndex of
      0: // horizontal then vertical
        case NumbOrd of
          0: for J := 0 to RowCount - 1 do
               for I := 0 to ColCount - 1 do NumberProc(I, J, I = 0);

          1: for J := 0 to RowCount - 1 do
               for I := ColCount - 1 downto 0 do
                 NumberProc(I, J, I = ColCount - 1);

          2: for J := RowCount - 1 downto 0 do
               for I := 0 to ColCount - 1 do NumberProc(I, J, I = 0);

          3: for J := RowCount - 1 downto 0 do
               for I := ColCount - 1 downto 0 do
                 NumberProc(I, J, I = ColCount - 1);
        end;
      1: // vertical then horizontal
        case NumbOrd of
          0: for I := 0 to ColCount - 1 do
               for J := 0 to RowCount - 1 do NumberProc(I, J, J = 0);
          1: for I := ColCount - 1 downto 0 do
               for J := 0 to RowCount - 1 do NumberProc(I, J, J = 0);
          2: for I := 0 to ColCount - 1 do
               for J := RowCount - 1 downto 0 do
                 NumberProc(I, J, J = RowCount - 1);
          3: for I := ColCount - 1 downto 0 do
               for J := RowCount - 1 downto 0 do
                 NumberProc(I, J, J = RowCount - 1);
        end;
    end;
  IsNumberOk := N = FPlaceCount + 1;
end;

procedure TDriveConstructForm.LoadPlaceMap;
var NumbOrd: Word;
begin
  PlaceMap := FElemDriveMapTable.DB.FieldByName('MAP').AsVariant;
  NumbOrd := FElemDriveMapTable.DB.FieldByName('NUMBERORDER').asInteger;
  OrderRadioGroup.ItemIndex := NumbOrd and 4 shr 2;
  VOrderRadioGroup.ItemIndex := NumbOrd and 2 shr 1;
  HOrderRadioGroup.ItemIndex := NumbOrd and 1;
  DrawOrders;
end;

procedure TDriveConstructForm.StorePlaceMap;
var StayInEditMode: Boolean;
begin
  StayInEditMode := FElemDriveMapTable.DB.State in dsEditModes;
  FElemDriveMapTable.DB.Edit;
  FElemDriveMapTable.DB.FieldByName('MAP').AsVariant := PlaceMap;
  FElemDriveMapTable.DB.FieldByName('NUMBERORDER').asInteger := OrderRadioGroup.ItemIndex shl 2 +
    VOrderRadioGroup.ItemIndex shl 1 + HOrderRadioGroup.ItemIndex;
  FElemDriveMapTable.DB.FieldByName('NUMBERCHARSET').asInteger := 0;
  if not StayInEditMode then FElemDriveMapTable.DB.Post;
end;

procedure TDriveConstructForm.FormCreate(Sender: TObject);
begin
  FPlaceMap := '';
  IsNumberOk := False;
end;

procedure TDriveConstructForm.FormActivate(Sender: TObject);
begin
  FloorsPanel.Visible := FElemDrive.DB.FieldByName('FLOORS').asInteger > 0;
  LoadPlaceMap;
  HCharsetRadioButtonClick(Sender);
  VCharsetRadioButtonClick(Sender);
  ActiveControl := HSizeEdit;
end;

procedure TDriveConstructForm.FloorDBLookupComboBoxClick(Sender: TObject);
begin
  StorePlaceMap;
  FElemDriveMapTable.DB.Locate('PLACEMAPID', FloorDBLookupComboBox.KeyValue, []);
  LoadPlaceMap;
end;

procedure TDriveConstructForm.SizeEditChange(Sender: TObject);
begin
  with ConstructGrid do
    case (Sender as TComponent).Tag of
      1: ColCount := HSizeEdit.Value;
      2: RowCount := VSizeEdit.Value;
    end;
  Numbering;
end;

procedure TDriveConstructForm.OrderRadioGroupClick(Sender: TObject);
begin
  Numbering;
end;

procedure TDriveConstructForm.HCharsetRadioButtonClick(Sender: TObject);
begin
  HCharsetRadioButton21.Enabled := HCharsetRadioButton2.Checked;
  HCharsetRadioButton22.Enabled := HCharsetRadioButton2.Checked;
  VCharsetRadioButton2.Enabled := not HCharsetRadioButton2.Checked;
  Numbering;
end;

procedure TDriveConstructForm.VCharsetRadioButtonClick(Sender: TObject);
begin
  VCharsetRadioButton21.Enabled := VCharsetRadioButton2.Checked;
  VCharsetRadioButton22.Enabled := VCharsetRadioButton2.Checked;
  HCharsetRadioButton2.Enabled := not VCharsetRadioButton2.Checked;
  Numbering;
end;

procedure TDriveConstructForm.HCharsetRadioButton21Click(Sender: TObject);
begin
  VCharsetRadioButton21.Checked := HCharsetRadioButton21.Checked;
  VCharsetRadioButton22.Checked := HCharsetRadioButton22.Checked;
  Numbering;
end;

procedure TDriveConstructForm.VCharsetRadioButton22Click(Sender: TObject);
begin
  HCharsetRadioButton21.Checked := VCharsetRadioButton21.Checked;
  HCharsetRadioButton22.Checked := VCharsetRadioButton22.Checked;
  Numbering;
end;

procedure TDriveConstructForm.HOrderRadioGroupClick(Sender: TObject);
begin
  Numbering;
  DrawOrders;
end;

procedure TDriveConstructForm.ToggleActionExecute(Sender: TObject);
var I, J: Integer;
begin
  with ConstructGrid do
    for J := Selection.Top to Selection.Bottom do
      for I := Selection.Left to Selection.Right do
        if Cells[I, J] = '*' then Cells[I, J] := '' else Cells[I, J] := '*';
  Numbering;
end;

procedure TDriveConstructForm.ClearActionExecute(Sender: TObject);
var I, J: Integer;
begin
  if ConfirmDlgYN(SDrvLegoConfirmClear) then
  begin
    with ConstructGrid do
      for J := 0 to RowCount - 1 do
        for I := 0 to ColCount - 1 do
          Cells[I, J] := '';
    Numbering;
  end;
end;

procedure TDriveConstructForm.SelectAllActionExecute(Sender: TObject);
begin
  with ConstructGrid do GridSelection(0, 0, ColCount - 1, RowCount - 1);
end;

procedure TDriveConstructForm.SelectColActionExecute(Sender: TObject);
begin
  GridSelection(HotMouseCol, 0, HotMouseCol, ConstructGrid.RowCount - 1);
end;

procedure TDriveConstructForm.SelectRowActionExecute(Sender: TObject);
begin
  GridSelection(0, HotMouseRow, ConstructGrid.ColCount - 1, HotMouseRow);
end;

procedure TDriveConstructForm.EditActionExecute(Sender: TObject);
begin
  with EditAction do Checked := not Checked;
  with ConstructGrid do
    if EditAction.Checked then
      Options := Options + [goEditing] else Options := Options - [goEditing];
end;

procedure TDriveConstructForm.ModeActionExecute(Sender: TObject);
begin
  with ModeAction do
  begin
    Checked := not Checked;
    SettingsPanel.Visible := not Checked;
  end;
end;

procedure TDriveConstructForm.ConstructGridDblClick(Sender: TObject);
var
  C: TGridCoord;
  P: TPoint;
begin
  with ConstructGrid do
  begin
    P := ScreenToClient(Mouse.CursorPos);
    C := MouseCoord(P.X, P.Y);
    if (C.X >= 0) and (C.Y >= 0) then
    begin
      if Cells[C.X, C.Y] = '*' then
        Cells[C.X, C.Y] := '' else Cells[C.X, C.Y] := '*';
      Numbering;
    end;
  end;
end;

procedure TDriveConstructForm.ConstructGridMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  ConstructGrid.MouseToCell(X, Y, HotMouseCol, HotMouseRow);
end;

procedure TDriveConstructForm.ConstructGridContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var C: TGridCoord;
begin
  with ConstructGrid do
    if (Selection.Top = Selection.Bottom) and (Selection.Left = Selection.Right)
    then begin
      C := MouseCoord(MousePos.X, MousePos.Y);
      if (C.X >= 0) and (C.Y >= 0) then
      begin
        Col := C.X;
        Row := C.Y;
      end;
    end;
end;

procedure TDriveConstructForm.ConstructGridDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
const
  cBr0: array[Boolean] of TColor = (clBtnFace, clHighlight);
  cBr1: array[Boolean] of TColor = (clInfoBk, clHighlight);
  cTxt: array[Boolean] of TColor = (clWindowText, clHighlightText);
var Txt: String;
begin
  Txt := ConstructGrid.Cells[ACol, ARow];
  with ConstructGrid.Canvas do
  begin
    Brush.Style := bsSolid;
    Brush.Color := cBr0[gdSelected in State];
    FillRect(Rect);
    if (Length(Txt) > 0) and (Txt <> '*') then
    begin
      Brush.Color := cBr1[gdSelected in State];
      FillRect(Rect);
      Font.Color := cTxt[gdSelected in State];
      with Font do
        if gdFocused in State then Style := Style + [fsBold]
        else Style := Style - [fsBold];
      SetTextAlign(Handle, TA_RIGHT);
      TextOut(Rect.Right - 2, Rect.Top + 3, Txt);
    end;
  end;
end;

procedure TDriveConstructForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var I, J: Integer;
begin
  if ModalResult = mrCancel then Exit;
  with ConstructGrid do
    for J := 0 to RowCount - 1 do
    begin
      for I := 0 to ColCount - 1 do
        if Cells[I, J] = '' then
        begin
          ErrorDlg(SDrvLegoErrCommon);
          ModalResult := mrNone;
          Break;
        end;
      if ModalResult = mrNone then Break;
    end;
  if not IsNumberOk then
  begin
    ErrorFmtDlg(SDrvLegoErrCount, [FPlaceCount]);
    ModalResult := mrNone;
  end;
  if ModalResult = mrOk then StorePlaceMap;
end;

end.
