unit EditFeed;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZTDlg, Db, DBTables, StdActns, ActnList, Menus, StdCtrls, Buttons,
  ExtCtrls, DBCtrls, Grids, DBGrids, ComCtrls, Spin, Data;

type
  TEditFeedFrm = class(TZTourDialog)
    FeedSelectSrc: TDataSource;
    SelFeedQry: TQuery;
    TouristNameDBText: TDBText;
    SelFeedQryFEEDTYPEID: TIntegerField;
    SelFeedQryFEEDNAME: TStringField;
    SelFeedQryMEMO: TMemoField;
    SelFeedQrySORTORDER: TSmallintField;
    SelFeedQryNAME: TStringField;
    FeedComboBox: TDBLookupComboBox;
    Memo: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    PeriodGroupBox: TGroupBox;
    Label3: TLabel;
    FromDatePicker: TDateTimePicker;
    Label4: TLabel;
    TillDatePicker: TDateTimePicker;
    Label5: TLabel;
    DaysEdit: TSpinEdit;
    ChangePeriodBtn: TSpeedButton;
    SelFeedQryCalcFeedName: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DaysEditChange(Sender: TObject);
    procedure ChangePeriodBtnClick(Sender: TObject);
    procedure SelFeedQryCalcFields(DataSet: TDataSet);
  private
    FActivate: Boolean;
  protected
//    procedure ApplyForAllRecords; override;
    procedure GotoInputError; override;
    procedure SearchInputError; override;
  end;
var
  EditFeedFrm: TEditFeedFrm;

function ShowRoomingEditDlg(Person: TPerson): Boolean;

implementation

uses DataMod, TourDbUn, VDlgs, TourCmnlIf, TourConsts;

{$R *.DFM}

function ShowRoomingEditDlg(Person: TPerson): Boolean;
var
  Mm: string;
  Res, HotelId, RoomingId, OrderId, Days, NDays, I: Integer;
  FeedId: Variant;
  From, NFrom, NTill: TDateTime;
  ChDate: Boolean;
  TmpPers: TPerson;
begin
  NFrom := 0;
  NTill := 0;
  Result := False;
  with TEditFeedfrm.Create(Application) do
  try
    RoomingId := DM.RoomingQryROOMINGID.Value;
    OrderId := DM.RoomingQryORDERID.Value;
    HotelId := DM.RoomingQryHotelId.Value;
    From := DM.RoomingQryFROMDATE.Value;
    Days := DM.RoomingQryDayCount.Value;
    Res := ShowModal;
    ChDate := (Res <> mrCancel) and ChangePeriodBtn.Down;
    if ChDate then
    begin
      NFrom := Int(FromDatePicker.DateTime);
      NDays := DaysEdit.Value;
      NTill := NFrom + NDays;
    end;
    FeedId := FeedComboBox.KeyValue;
    Mm := Memo.Lines.Text;
  finally
    Free;
  end;
  if (Res = mrOk) or (Res = mrAll) then
    with DM, Work do
    begin
      SQL.Clear;
      SQL.Add('update HtlRooming set ');
      SQL.Add('');
      if Res = mrOk then
      begin
        SQL.Add(' WHERE ROOMINGID=:ROOMINGID ');
        ParamByName('ROOMINGID').AsInteger := RoomingId;
      end
      else begin
        {SQL.Add(RoomingQry.SQL[RoomingQry.SQL.Count - 2]);
        Params.Assign(RoomingQry.Params);}
        SQL.Add('where HotelId = :HotelId and OrderId = :OrderId ' +
          'and FromDate = :FromDate and DayCount = :DayCount');
        ParamByName('HotelId').AsInteger := HotelId;
        ParamByName('OrderId').AsInteger := OrderId;
        ParamByName('FromDate').AsDateTime := From;
        ParamByName('DayCount').AsInteger := Days;
      end;
      SQL[1] := 'FEEDID = :FEEDID, MEMO = :MEMO, ';
      SQL[1] := SQL[1] + 'MODIFYDATE = ''NOW'',  MODIFIED = ''T'' ';
      ParamByName('FEEDID').AsInteger := FeedId;
      ParamByName('MEMO').DataType := ftBlob;
      ParamByName('MEMO').Clear;
      ParamByName('MEMO').AsMemo := mm;
      {if ChDate and Person.Room.CheckPlacement(Person)
      then begin
        SQL[1] := SQL[1] + 'FromDate = :NewFromDate, DayCount = :NewDayCount ';
        ParamByName('NewFromDate').AsDateTime := NFrom;
        ParamByName('NewDayCount').AsInteger := NDays;
      end;}
      ExecSQL;
      Close;
      SQL.Clear;
      SQL.Add('update HtlRooming set ');
      SQL.Add('ORDERPRINT = ''F'', MODIFYDATE=''NOW'' ');
      SQL.Add('where ORDERID = :ORDERID');
      ParamByName('ORDERID').AsInteger := OrderId;
      ExecSQL;
      Close;
      if ChDate then
      begin
        Person.RType := tRTHead;
        Person.ResizeTo(NFrom);
        Person.RType := tRTBottom;
        Person.ResizeTo(NTill);
        if Person.Room.CheckPlacement(Person) then
        begin
          if Res <> mrAll then Person.Room.UpdatePersonToRoom(Person)
          else
            with Person.Room do
              for I := 0 to Persons.Count - 1 do
              begin
                TmpPers := Persons[I] as TPerson;
                with TmpPers do
                begin
                  RType := tRTHead;
                  ResizeTo(NFrom);
                  RType := tRTBottom;
                  ResizeTo(NTill);
                end;
                if CheckPlacement(TmpPers) then UpdatePersonToRoom(TmpPers)
                else TmpPers.EndResize(False);
              end;
          Person.Hotel.Modified := True;
          Person.Hotel.DrawBook;
        end
        else Person.EndResize(False);
      end;
      UpdateQuery(RoomingQry);
      RoomingQry.Locate('RoomingId', RoomingId, []);
    end;
end;

{ TEditFeedfrm }
{
procedure TEditFeedfrm.ApplyForAllRecords;
begin
end;
}
procedure TEditFeedfrm.GotoInputError;
begin
end;

procedure TEditFeedfrm.SearchInputError;
begin
end;

procedure TEditFeedfrm.FormCreate(Sender: TObject);
begin
  inherited;
  FActivate := False;
  UpdateQuery(SelFeedQry);
end;

procedure TEditFeedfrm.FormActivate(Sender: TObject);
begin
//  inherited;
  if not FActivate then
  begin
    FromDatePicker.DateTime := DM.RoomingQryFROMDATE.Value;
    DaysEdit.Value := DM.RoomingQryDayCount.Value;
    DaysEditChange(nil);
    FeedComboBox.KeyValue := DM.RoomingQryFEEDID.AsVariant;
    Memo.Lines.Text := DM.RoomingQryMEMO.AsString;
    FActivate := True;
  end;
end;

procedure TEditFeedFrm.DaysEditChange(Sender: TObject);
begin
  TillDatePicker.DateTime := FromDatePicker.DateTime + DaysEdit.Value;
end;

procedure TEditFeedFrm.ChangePeriodBtnClick(Sender: TObject);
var En: Boolean;
begin
  En := ChangePeriodBtn.Down;
  ToggleControlEnabled(FromDatePicker, En);
  ToggleControlEnabled(DaysEdit, En);
  if not En then
  begin
    FromDatePicker.DateTime := DM.RoomingQryFROMDATE.Value;
    DaysEdit.Value := DM.RoomingQryDayCount.Value;
    DaysEditChange(nil);
  end;
end;

procedure TEditFeedFrm.SelFeedQryCalcFields(DataSet: TDataSet);
begin
  SelFeedQryCalcFeedName.Value := Format('%s (%s)',
    [SelFeedQryFEEDNAME.AsString, SelFeedQryNAME.AsString]);
end;

end.
