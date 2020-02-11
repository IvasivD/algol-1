unit RoomEditDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZTDlg, StdActns, ActnList, Menus, Db, StdCtrls, Buttons, ExtCtrls, Mask,
  DBCtrls, Spin, ComCtrls, DBTables;

type
  TRoomingEditDlg = class(TZTourDialog)
    Label1: TLabel;
    TouristDBLookupComboBox: TDBLookupComboBox;
    DBBirthLookup: TDBText;
    Label10: TLabel;
    Label11: TLabel;
    RequestDayCountLabel: TLabel;
    Label13: TLabel;
    Label17: TLabel;
    ForPayDayCountLabel: TLabel;
    FromDatePicker: TDateTimePicker;
    ToDatePicker: TDateTimePicker;
    RequestDayCountEdit: TSpinEdit;
    ForPayDayCountEdit: TSpinEdit;
    Label14: TLabel;
    Label15: TLabel;
    RoomDBLookupComboBox: TDBLookupComboBox;
    FeedDBLookupComboBox: TDBLookupComboBox;
    Label2: TLabel;
    HotelRateEdit1: TEdit;
    HotelRateEdit2: TEdit;
    HotelRateRadioButton1: TRadioButton;
    HotelRateRadioButton2: TRadioButton;
    Curr2DBLookupComboBox: TDBLookupComboBox;
    Label4: TLabel;
    Label12: TLabel;
    RateDBEdit: TDBEdit;
    Rate2DBEdit: TDBEdit;
    Label3: TLabel;
    Bevel1: TBevel;
    SelCurr2Qry: TQuery;
    SelCurr2QryCURRENCYID: TIntegerField;
    SelCurr2QryCURRENCYSHORT: TStringField;
    SelCurr2QrySrc: TDataSource;
    Label5: TLabel;
    HotelNamePanel: TPanel;
    HotelChangeBtn: TSpeedButton;
    DBLookupComboBox1: TDBLookupComboBox;
    HotelSelQry: TQuery;
    HotelSelSrc: TDataSource;
    HotelSelQryCOUNTRYID: TIntegerField;
    HotelSelQryCITYID: TIntegerField;
    HotelSelQryHOTELID: TIntegerField;
    HotelSelQryCOUNTRYNAME: TStringField;
    HotelSelQryRESORTNAME: TStringField;
    HotelSelQryHOTELNAME: TStringField;
    HotelSelQrySTARS: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure HotelChangeBtnClick(Sender: TObject);
    procedure FromDatePickerChange(Sender: TObject);
    procedure RequestDayCountEditChange(Sender: TObject);
    procedure ForPayDayCountEditChange(Sender: TObject);
    procedure HotelRateRadioButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FInActivate: Boolean;
    FHotel: Integer;
    FHotelChanged: Boolean;
    procedure CalcHotelRate;
    procedure ChangeHotelName;
    procedure UpdateOrderedHotels;
  protected
    procedure ApplyForAllRecords; override;
    procedure GotoInputError; override;
    procedure SearchInputError; override;
  end;

{var
  RoomingEditDlg: TRoomingEditDlg;}

function ShowRoomingEditDlg(AddNew: Boolean): Boolean;


implementation

uses DataMod, TourCmnlIf, OptSet, TourConsts, VDlgs, HtlSelDlg, TourDbUn;

{$R *.DFM}

function ShowRoomingEditDlg(AddNew: Boolean): Boolean;
begin
  with DM do
  begin
    UpdateQuery(HotelQry);
    HotelQry.Locate('HotelId', HotelByOrderQryHotelId.Value, []);
    UpdateQuery(LookPersonQry);
    OpenDataSet(CityTable);
    OpenDataSet(RoomingTable);
    RoomingTable.Locate('RoomingId', RoomingQryROOMINGID.Value, []);
  end;
  with TRoomingEditDlg.Create(Application) do
    try
      DM.UpdateQuery(HotelSelQry);
      ChangeHotelName;
      Caption := Format(Caption, [HotelNamePanel.Caption]);
      Result := ShowRecord(AddNew);
      if Result and FHotelChanged then UpdateOrderedHotels;
    finally
      Free;
    end;
  if Result then
    with DM do
    begin
      UpdateQuery(RoomingQry);
      RoomingQry.Locate('RoomingId', RoomingTableROOMINGID.Value, []);
    end;
end;

{ TRoomingEditDlg }

procedure TRoomingEditDlg.CalcHotelRate;
var R1, R2: Currency;
begin
  R1 := SafeStrToFloat(HotelRateEdit1.Text, 0);
  R2 := SafeStrToFloat(HotelRateEdit2.Text, 0);
  if HotelRateRadioButton1.Checked
  then begin
    RateDBEdit.Field.Value := ForPayDayCountEdit.Value * R1;
    Rate2DBEdit.Field.Value := ForPayDayCountEdit.Value * R2;
  end
  else begin
    RateDBEdit.Field.Value := R1;
    Rate2DBEdit.Field.Value := R2;
  end;
end;

procedure TRoomingEditDlg.ChangeHotelName;
begin
  HotelNamePanel.Caption := DM.HotelQryNAME.Value + DM.HotelQrySTARS.Value;
end;

procedure TRoomingEditDlg.UpdateOrderedHotels;
begin
  with DM do
  begin       // update ordered hotels and select current hotel
    UpdateQuery(HotelByOrderQry);
    HotelByOrderQry.Locate('HotelId', FHotel, []);
  end;
end;

procedure TRoomingEditDlg.ApplyForAllRecords;
const sUpd = 'update HtlRooming set ' +
  'FromDate = ''%s'', DayCount = %d, DayPaid = %d, RoomId = %s, FeedId = %s, ' +
  'Rate = ''%s'', Rate2 = ''%s'', Curr2Id = %s ' +
  'where OrderId = %d and HotelId = %d';
var Cst, Cst2: String;
begin
  Cst := StringReplace(
    RateDBEdit.Text, DecimalSeparator, BDEDecimalSeparator, [rfReplaceAll]);
  Cst2 := StringReplace(
    Rate2DBEdit.Text, DecimalSeparator, BDEDecimalSeparator, [rfReplaceAll]);
  with ApplyAllQry do
  begin
    Close;
    SQL.Text := Format(sUpd, [
      DateToStr(Int(FromDatePicker.Date)),
      RequestDayCountEdit.Value, ForPayDayCountEdit.Value,
      VarToStr(RoomDBLookupComboBox.KeyValue),
      VarToStr(FeedDBLookupComboBox.KeyValue),
      Cst, Cst2, VarToStr(Curr2DBLookupComboBox.KeyValue),
      DM.RoomingTableORDERID.AsInteger, DM.RoomingTableHotelId.AsInteger]);
    SQL.Text := StringReplace(SQL.Text, '''''', 'null', [rfReplaceAll]);
    ExecSQL;
  end;
end;

procedure TRoomingEditDlg.GotoInputError;
begin
  case InputErrorCode of
    iecTouristIsNull: ActiveControl := TouristDBLookupComboBox;
    iecRoomTypeIsNull: ActiveControl := RoomDBLookupComboBox;
    iecFeedTypeIsNull: ActiveControl := FeedDBLookupComboBox;
    iecRateIsNull, iecRateLessZero:
      if SafeStrToFloat(HotelRateEdit1.Text, -1) < 0 then ActiveControl := HotelRateEdit1
      else if SafeStrToFloat(HotelRateEdit2.Text, -1) < 0 then ActiveControl := HotelRateEdit2;
    iecCurrencyIsNull: ActiveControl := Curr2DBLookupComboBox;
  end;
end;

procedure TRoomingEditDlg.SearchInputError;
var
  R1, R2: Extended;
  R1Emp, R2Emp: Boolean;
begin
  R1 := SafeStrToFloat(HotelRateEdit1.Text);
  R2 := SafeStrToFloat(HotelRateEdit2.Text);
  R1Emp := Trim(RateDBEdit.Text) = '';
  R2Emp := Trim(Rate2DBEdit.Text) = '';
  if not R2Emp then
    with Curr2DBLookupComboBox do if Field.IsNull then Field.Value := KeyValue;
  if TouristDBLookupComboBox.KeyValue = null then InputErrorCode := iecTouristIsNull
  else if RoomDBLookupComboBox.KeyValue = null then InputErrorCode := iecRoomTypeIsNull
  else if FeedDBLookupComboBox.KeyValue = null then InputErrorCode := iecFeedTypeIsNull
  else if R1Emp and R2Emp then InputErrorCode := iecRateIsNull
  else if (R1 < 0) or (R2 < 0) then InputErrorCode := iecRateLessZero
  else if (R1 = 0) and (R2 = 0) and not WarningDlgYN(SZTDlgWarningRateZero) then
  begin
    ActiveControl := HotelRateEdit1;
    InputErrorCode := iecSilentError;
  end
  else if not R2Emp and (Curr2DBLookupComboBox.KeyValue = null) then InputErrorCode := iecCurrencyIsNull
  else InputErrorCode := iecSuccess;
end;

procedure TRoomingEditDlg.FormCreate(Sender: TObject);
begin
  inherited;
  FInActivate := True;
  FHotelChanged := False;
  DM.UpdateQuery(SelCurr2Qry);
  SelCurr2Qry.Locate('CURRENCYID', OptionSet.DefaultCurrency, []);
  FHotel := DM.HotelQryHOTELID.Value;
end;

procedure TRoomingEditDlg.FormActivate(Sender: TObject);
begin
  inherited;
  with Curr2DBLookupComboBox do
    if KeyValue = null then KeyValue := OptionSet.DefaultCurrency;
  with DM.RoomingTableFROMDATE do
    if IsNull then
      FromDatePicker.Date := Int(Now) + 1 else FromDatePicker.Date := Value;
  RequestDayCountEdit.Value := DM.RoomingTableDayCount.Value;
  ForPayDayCountEdit.Value := DM.RoomingTableDayPaid.Value;
  FInActivate := True;
  HotelRateEdit1.Text := DM.RoomingTableRate.DisplayText;
  HotelRateEdit2.Text := DM.RoomingTableRate2.DisplayText;
  FInActivate := False;
  if not DM.RoomingTableRate.IsNull or not DM.RoomingTableRate2.IsNull then
    HotelRateRadioButton2.Checked := True;
  with TouristDBLookupComboBox do
  begin
    Enabled := (DataSource.DataSet.State = dsInsert) or (KeyValue = null);
    Color := clEditControlColors[Enabled];
  end;
end;

procedure TRoomingEditDlg.HotelChangeBtnClick(Sender: TObject);
var Resort, Hotel, Room: Integer;
begin
  Resort := DM.HotelQryCITYID.Value;
  Hotel := DM.RoomingTableHOTELID.Value;
  Room := DM.RoomingTableROOMID.Value;
  if ExecuteHotelChooseDlg(0, Resort, Hotel, Room)
    and DM.HotelQry.Locate('HotelId', Hotel, [])
  then begin
    FHotel := Hotel;
    ChangeHotelName;
    RoomDBLookupComboBox.KeyValue := Room;
    FHotelChanged := True;
  end;
end;

procedure TRoomingEditDlg.FromDatePickerChange(Sender: TObject);
begin
  RequestDayCountEditChange(nil);
end;

procedure TRoomingEditDlg.RequestDayCountEditChange(Sender: TObject);
begin
  with RequestDayCountEdit do
  begin
    ToDatePicker.Date := Int(FromDatePicker.Date) + Value; // + 1;
    if ForPayDayCountEdit.Value > Value then ForPayDayCountEdit.Value := Value;
    ForPayDayCountEdit.MaxValue := Value;
    RequestDayCountLabel.Caption := NightCountString(Value);
  end;
end;

procedure TRoomingEditDlg.ForPayDayCountEditChange(Sender: TObject);
begin
  ForPayDayCountLabel.Caption := NightCountString(ForPayDayCountEdit.Value);
end;

procedure TRoomingEditDlg.HotelRateRadioButtonClick(Sender: TObject);
begin
  if not FInActivate then CalcHotelRate;
end;

procedure TRoomingEditDlg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then
  begin
    DM.RoomingTableHOTELID.Value := FHotel;
    DM.RoomingTableFROMDATE.Value := Int(FromDatePicker.Date);
    //DM.RoomingTableTODATE.Value := Int(ToDatePicker.DateTime);
    DM.RoomingTableDayCount.Value := RequestDayCountEdit.Value;
    DM.RoomingTableDayPaid.Value := ForPayDayCountEdit.Value;
    if Rate2DBEdit.Text = '' then Curr2DBLookupComboBox.KeyValue := null;
  end;
  inherited;
end;

end.
