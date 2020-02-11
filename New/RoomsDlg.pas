unit RoomsDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, ComCtrls, StdCtrls, Spin, Buttons, ExtCtrls;

type
  TRoomsEditDlg = class(TForm)
    CtrlPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    RequestPlaceCountLabel1: TLabel;
    RequestPlaceCountLabel2: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    RequestDayCountLabel: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    ForPayDayCountLabel: TLabel;
    RequestPlaceCountEdit: TSpinEdit;
    RequestFromDatePicker: TDateTimePicker;
    RequestToDatePicker: TDateTimePicker;
    RequestDayCountEdit: TSpinEdit;
    ForPayDayCountEdit: TSpinEdit;
    Label14: TLabel;
    Label15: TLabel;
    RoomDBLookupComboBox: TDBLookupComboBox;
    FeedDBLookupComboBox: TDBLookupComboBox;
    HotelRateGroupBox: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    HotelRateEdit1: TEdit;
    HotelRateEdit2: TEdit;
    HotelRateRadioButton1: TRadioButton;
    HotelRateRadioButton2: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure RequestFromDatePickerChange(Sender: TObject);
    procedure RequestDayCountEditClick(Sender: TObject);
    procedure ForPayDayCountEditChange(Sender: TObject);
    procedure HotelRateEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FRequestDayCountChange: Boolean;
    FRequestActivated: Boolean;
    procedure RoomingConfirmRequest;
    procedure RoomingRecordEdit(AddNew: Boolean);
  end;

var
  RoomsEditDlg: TRoomsEditDlg;

function ExecuteRoomsEditDlg(NewRequest: Boolean): Boolean;


implementation

uses DataMod, VDlgs, TourCmnlIf, TourConsts, OptSet;

{$R *.DFM}

function ExecuteRoomsEditDlg(NewRequest: Boolean): Boolean;
begin
  with TRoomsEditDlg.Create(Application) do
    try
      FRequestActivated := NewRequest;
      Result := ShowModal = mrOk;
      if Result then RoomingConfirmRequest;
    finally
      Free;
    end;
end;

{ TRoomsEditDlg }

procedure TRoomsEditDlg.RoomingConfirmRequest;
var I: Integer;
begin
  Screen.Cursor := crHourGlass;
  with DM, RoomingTable do
    try
      DisableControls;
      if FRequestActivated then
      begin
        for I := 1 to RequestPlaceCountEdit.Value do RoomingRecordEdit(True);
        RequestPlaceCountEdit.Value := 0;
      end
      else RoomingRecordEdit(False);
      UpdateQuery(RoomingQry);
      RoomingQry.Locate('RoomingId', RoomingTableRoomingId.Value, []);
    finally
      EnableControls;
      Screen.Cursor := crDefault;
    end;
end;

procedure TRoomsEditDlg.RoomingRecordEdit(AddNew: Boolean);
var
  S, M: String;
  R1, R2: Extended;
  P: Integer;
begin
  R1 := SafeStrToFloat(HotelRateEdit1.Text, 0);
  R2 := SafeStrToFloat(HotelRateEdit2.Text, 0);
  if HotelRateRadioButton1.Checked then  // one night rate
  begin
    R1 := R1 * ForPayDayCountEdit.Value;
    R2 := R2 * ForPayDayCountEdit.Value;
  end;
  with DM, RoomingTable do
  begin
    if AddNew then Append else Edit;
    if AddNew then
    begin
      RoomingTableORDERID.Value := OrderTableOrderId.Value;
      RoomingTableCURR2ID.Value := OptionSet.DefaultCurrency;
      RoomingTableSTATE.Value := OrderTableState.Value;
    end;
    RoomingTableRoomId.Value := RoomDBLookupComboBox.KeyValue;
    RoomingTableFromDate.Value := Int(RequestFromDatePicker.DateTime);
    RoomingTableToDate.Value := Int(RequestToDatePicker.DateTime);
    RoomingTableDayCount.Value := RequestDayCountEdit.Value;
    RoomingTableDayPaid.Value := ForPayDayCountEdit.Value;
    RoomingTableFeedId.Value := FeedDBLookupComboBox.KeyValue;
    RoomingTableRate.Value := R1;
    RoomingTableRate2.Value := R2;
    Post;
    Refresh;
  end;
  with DM, OrderTable do
    if RoomingTableDayCount.AsInteger > RoomingTableDayPaid.AsInteger then
    begin
      S := OrderTableMemo.AsString;
      M := Format('%d=%d',
        [RoomingTableDayCount.AsInteger, RoomingTableDayPaid.AsInteger]);
      P := Pos(M, S);
      if P = 0 then
      begin        // append Queue Prompt to memo field
        Edit;
        if S <> '' then M := M + ', ';
        OrderTableMemo.AsString := M + S;
        Post;
      end;
    end;
end;

procedure TRoomsEditDlg.FormCreate(Sender: TObject);
begin
  FRequestDayCountChange := True;
  FRequestActivated := False;
end;

procedure TRoomsEditDlg.FormActivate(Sender: TObject);
begin
  with DM do
  begin
    OpenDataSet(RoomingTable);
    RoomingTable.Locate('RoomingId', RoomingQryROOMINGID.Value, []);
    RoomDBLookupComboBox.KeyValue := RoomingTableRoomId.Value;
    FeedDBLookupComboBox.KeyValue := RoomingTableFeedId.Value;
  end;
  if FRequestActivated then  // request new rooming
  begin
    RequestFromDatePicker.MinDate := Int(Date) + 1;
    RequestFromDatePicker.Date := Int(Date) + StrToTime('14:00:00') + 2;
  end
  else if DM.RoomingTableToDate.IsNull then
    begin
      RequestFromDatePicker.MinDate := 0;
      RequestFromDatePicker.Date := DM.RoomingTableFromDate.AsDateTime;
      with DM do if not RoomingTableDayCount.IsNull then
        RequestDayCountEdit.Value := RoomingTableDayCount.AsInteger;
    end
  else
    with DM do
    begin
      RequestFromDatePicker.DateTime := RoomingTableFromDate.AsDateTime;
      RequestToDatePicker.DateTime := RoomingTableToDate.AsDateTime;
      RequestDayCountEdit.Value := RoomingTableDayCount.AsInteger;
      with RoomingTableDayPaid do
        if IsNull then ForPayDayCountEdit.Value := RequestDayCountEdit.Value
        else ForPayDayCountEdit.Value := AsInteger;
      HotelRateRadioButton2.Checked := True; // summary rate
      HotelRateEdit1.Text := FormatCurrency(RoomingTableRate.AsCurrency);
      HotelRateEdit2.Text := FormatCurrency(RoomingTableRate2.AsCurrency);
    end;
  RequestFromDatePickerChange(nil);
  RequestPlaceCountEdit.Visible := FRequestActivated;
  RequestPlaceCountLabel1.Visible := FRequestActivated;
  RequestPlaceCountLabel2.Visible := FRequestActivated;
end;

procedure TRoomsEditDlg.RequestFromDatePickerChange(Sender: TObject);
begin
  RequestDayCountEditClick(nil);
end;

procedure TRoomsEditDlg.RequestDayCountEditClick(Sender: TObject);
begin
  if FRequestDayCountChange then
    RequestToDatePicker.Date := Int(RequestFromDatePicker.Date) +
      RequestDayCountEdit.Value + StrToTime('13:59:59') + 1;
  with RequestDayCountEdit do
  begin
    if {DM.RoomingTableDayPaid.IsNull or }(ForPayDayCountEdit.Value > Value) then
      ForPayDayCountEdit.Value := Value;
    ForPayDayCountEdit.MaxValue := Value;
  end;
  RequestDayCountLabel.Caption := NightCountString(RequestDayCountEdit.Value);
end;

procedure TRoomsEditDlg.ForPayDayCountEditChange(Sender: TObject);
begin
  ForPayDayCountLabel.Caption := NightCountString(ForPayDayCountEdit.Value);
end;

procedure TRoomsEditDlg.HotelRateEditKeyPress(Sender: TObject; var Key: Char);
begin
  Key := NumberKeyPressCheck((Sender as TEdit).Text, Key);
end;

procedure TRoomsEditDlg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var R1, R2: Extended;
begin
  if CanClose and (ModalResult = mrOk) then
  begin
    R1 := SafeStrToFloat(HotelRateEdit1.Text, 0);
    R2 := SafeStrToFloat(HotelRateEdit2.Text, 0);
    CanClose := (RequestPlaceCountEdit.Value > 0)  // count of persons
      and (RoomDBLookupComboBox.KeyValue <> null)  // room selected
      and (RoomDBLookupComboBox.KeyValue <> 0)
      and (FeedDBLookupComboBox.KeyValue <> null)  // feed selected
      and (FeedDBLookupComboBox.KeyValue <> 0)
      and (                                        // rates > 0
      (R1 <> 0) and (R2 <> 0)
        or ((R1 = 0) or (R2 = 0)) and WarningDlgYC(SZTDlgWarningRateZero));
    if not CanClose then ModalResult := mrNone;
  end;
end;

end.
