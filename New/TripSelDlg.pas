unit TripSelDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Grids, DBGrids, Db, DBTables;

type
  TTripChooseDlg = class(TForm)
    SelTripDBGrid: TDBGrid;
    BottomPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    TripSelQry: TQuery;
    TripSelQryLEAVINGID: TIntegerField;
    TripSelQryLEAVEDATE: TDateTimeField;
    TripSelQryVACANTCOUNT: TIntegerField;
    TripSelQrySHEDULENAME: TStringField;
    TripSelSrc: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{var
  TripChooseDlg: TTripChooseDlg;}

function ExecuteTripChooseDlg(Rout, Dir: Integer; From: TDateTime;
  var Trip, VCount: Integer; var SelDate: TDateTime): Boolean;


implementation

uses DataMod;

{$R *.DFM}

function ExecuteTripChooseDlg(Rout, Dir: Integer; From: TDateTime;
  var Trip, VCount: Integer; var SelDate: TDateTime): Boolean;
begin
  with TTripChooseDlg.Create(Application) do
    try
      with TripSelQry do
      begin
        Prepare;
        ParamByName('ParRouteId').Value := Rout;
        ParamByName('ParFromDate').Value := From;
        ParamByName('ParDirection').Value := Dir;
        Open;
        Locate('LeavingId', Trip, []);
      end;
      Result := ShowModal = mrOk;
      if Result then Trip := TripSelQryLEAVINGID.Value else Trip := 0;
      SelDate := TripSelQryLEAVEDATE.Value;
      VCount := TripSelQryVACANTCOUNT.Value;
    finally
      Free;
    end;
end;

end.
