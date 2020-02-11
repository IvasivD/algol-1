unit HtlSelDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, DBCtrls;

type
  THotelChooseDlg = class(TForm)
    SelHotelDBGrid: TDBGrid;
    HotelSelQry: TQuery;
    HotelSelSrc: TDataSource;
    BottomPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    RoomInHotelQry: TQuery;
    RoomInHotelQrySrc: TDataSource;
    RoomsDBGrid: TDBGrid;
    HotelSelQryCITYID: TIntegerField;
    HotelSelQryHOTELID: TIntegerField;
    HotelSelQryRESORTNAME: TStringField;
    HotelSelQryHOTELNAME: TStringField;
    HotelSelQrySTARS: TStringField;
    RoomInHotelQryROOMTYPE: TStringField;
    RoomInHotelQryROOMTYPEID: TIntegerField;
    RoomInHotelQryHOTELROOMID: TIntegerField;
    SelCntryQry: TQuery;
    SelCntrySrc: TDataSource;
    Panel1: TPanel;
    CountryDBLookupComboBox: TDBLookupComboBox;
    SelCntryQryCOUNTRYID: TIntegerField;
    SelCntryQryNAME: TStringField;
    procedure HotelSelQryAfterScroll(DataSet: TDataSet);
    procedure CountryDBLookupComboBoxClick(Sender: TObject);
  private
    FRoomType: Integer;
  end;

{var
  HotelChooseDlg: THotelChooseDlg;}

function ExecuteHotelChooseDlg(
  Cntry: Integer; var Resort, Hotel, Room: Integer): Boolean;


implementation

uses DataMod;

{$R *.DFM}

function ExecuteHotelChooseDlg(
  Cntry: Integer; var Resort, Hotel, Room: Integer): Boolean;
var Cnt: Integer;
begin
  with THotelChooseDlg.Create(Application) do
    try
      DM.UpdateQuery(RoomInHotelQry);
      DM.UpdateQuery(SelCntryQry);
      DM.UpdateQuery(HotelSelQry);
      if Cntry = 0 then Cnt := DM.CountryTableCountryId.Value else Cnt := Cntry;
      SelCntryQry.Locate('CountryId', Cnt, []);
      CountryDBLookupComboBox.KeyValue := SelCntryQryCOUNTRYID.Value;
      HotelSelQry.Locate('HotelId', Hotel, []);
      RoomInHotelQry.Locate('RoomTypeId', Room, []);
      FRoomType := Room;
      Result := ShowModal = mrOk;
      if Result then
      begin
        Hotel := HotelSelQryHOTELID.Value;
        Resort := HotelSelQryCITYID.Value;
        Room := RoomInHotelQryHOTELROOMID.Value;
      end
      else begin
        Hotel := 0;
        Resort := 0;
        Room := 0;
      end;
    finally
      Free;
    end;
end;

{ THotelChooseDlg }

procedure THotelChooseDlg.HotelSelQryAfterScroll(DataSet: TDataSet);
begin
  RoomInHotelQry.Locate('RoomTypeId', FRoomType, []);
end;

procedure THotelChooseDlg.CountryDBLookupComboBoxClick(Sender: TObject);
begin
  SelCntryQry.Locate('CountryId', CountryDBLookupComboBox.KeyValue, []);
end;

end.
