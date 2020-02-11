unit TripChrtFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZTView, DBCtrls, StdCtrls, ActnList, Menus, Db, DBTables, Buttons,
  ExtCtrls, TeeProcs, TeEngine, Chart, DBChart, Series, jpeg, Grids,
  DBGrids;

type
  TTripChartViewForm = class(TZViewForm)
    Label1: TLabel;
    RouteDBLookupComboBox: TDBLookupComboBox;
    SelRouteQrySrc: TDataSource;
    SelRouteQry: TQuery;
    DBChart: TDBChart;
    TripForwardBtn: TSpeedButton;
    TripBckwardBtn: TSpeedButton;
    SelRouteQryROUTEID: TIntegerField;
    SelRouteQryFROMCITY: TStringField;
    SelRouteQryARRIVECITY: TStringField;
    SelRouteQrySTRANGER: TStringField;
    SelRouteQryDRIVEKIND: TStringField;
    Series2: TBarSeries;
    DetailListQueryROUTEID: TIntegerField;
    DetailListQueryLEAVINGID: TIntegerField;
    DetailListQueryLEAVEDATE: TDateTimeField;
    DetailListQueryDIRECTION: TIntegerField;
    DetailListQueryDRIVEMODEL: TStringField;
    DetailListQueryDCOUNT: TIntegerField;
    DetailListQueryTRANSIT: TStringField;
    DetailListQuerySTRANGER: TStringField;
    DetailListQueryPCOUNT: TIntegerField;
    DetailListQueryCalcPCount: TIntegerField;
    Series1: TLineSeries;
    DBGrid: TDBGrid;
    SpeedButton1: TSpeedButton;
    SelRouteQryCalcRoute: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure SelRouteQryCalcFields(DataSet: TDataSet);
    procedure DetailListQueryCalcFields(DataSet: TDataSet);
    procedure RouteDBLookupComboBoxCloseUp(Sender: TObject);
    procedure TripForwardBtnClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    FCurDirect: Integer;
    FCurRoute: Integer;
    FFromDate: TDateTime;
    procedure UpdateChartQuery;
    procedure UpdateRouteQuery;
  protected
    procedure UpdateDetailListQuery; override;
  end;

{var
  TripChartViewForm: TTripChartViewForm;}

procedure ShowTripChartView(RouteId, Dir: Integer);


implementation

uses DataMod;

{$R *.DFM}

procedure ShowTripChartView(RouteId, Dir: Integer);
begin
  with TTripChartViewForm.Create(Application) do
    try
      FCurDirect := Dir;
      TripForwardBtn.Down := Dir = 0;
      FCurRoute := RouteId;
      DM.UpdateQuery(SelRouteQry);
      RouteDBLookupComboBox.KeyValue := RouteId;
      UpdateChartQuery;
      ShowModal;
    finally
      Free;
    end;
end;

{ TTripChartViewForm }

procedure TTripChartViewForm.UpdateChartQuery;
begin
  Screen.Cursor := crHourGlass;
  with DetailListQuery do
    try
      Close;
      ParamByName('ParDirect').Value := FCurDirect;
      ParamByName('ParFromDate').Value := FFromDate;
      Prepare;
      Open;
    finally
      Screen.Cursor := crDefault;
    end;
  DBChart.RefreshData;
end;

procedure TTripChartViewForm.UpdateRouteQuery;
begin
  FCurRoute := SelRouteQryROUTEID.Value;
  DM.UpdateQuery(SelRouteQry);
  SelRouteQry.Locate('RouteId', FCurRoute, []);
end;

procedure TTripChartViewForm.UpdateDetailListQuery;
begin
  UpdateRouteQuery;
end;

procedure TTripChartViewForm.FormCreate(Sender: TObject);
begin
  inherited;
  FCurDirect := 0;
  FFromDate := StrToDate('01.01.2000');
end;

procedure TTripChartViewForm.SelRouteQryCalcFields(DataSet: TDataSet);
begin
  SelRouteQryCalcRoute.Value := Format('%d. %s - %s, %s', [
    SelRouteQryROUTEID.AsInteger, SelRouteQryFROMCITY.AsString,
    SelRouteQryARRIVECITY.AsString, SelRouteQryDRIVEKIND.AsString]);
end;

procedure TTripChartViewForm.DetailListQueryCalcFields(DataSet: TDataSet);
begin
  inherited;
  DetailListQueryCalcPCount.Value :=
    DetailListQueryDCOUNT.AsInteger - DetailListQueryPCOUNT.AsInteger;
end;

procedure TTripChartViewForm.RouteDBLookupComboBoxCloseUp(Sender: TObject);
begin
  SelRouteQry.Locate('RouteId', RouteDBLookupComboBox.KeyValue, []);
  UpdateChartQuery;
end;

procedure TTripChartViewForm.TripForwardBtnClick(Sender: TObject);
begin
  if TripForwardBtn.Down then FCurDirect := 0 else FCurDirect := 1;
  UpdateChartQuery;
end;

procedure TTripChartViewForm.SpeedButton1Click(Sender: TObject);
begin
  with DBGrid do Visible := not Visible;
end;

end.
