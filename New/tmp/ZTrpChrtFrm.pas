unit ZTrpChrtFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZTView, Grids, DBGrids, TeeProcs, TeEngine, Chart, DBChart, DBCtrls, Db,
  ComCtrls, Buttons, StdCtrls, ImgList, ActnList, Menus, DBTables, ExtCtrls,
  Series;

type
  TZTripViewChartForm = class(TZViewForm)
    Label1: TLabel;
    ShowGridBtn: TSpeedButton;
    PrintChartBtn: TSpeedButton;
    Label3: TLabel;
    FromDatePicker: TDateTimePicker;
    Label2: TLabel;
    TillDatePicker: TDateTimePicker;
    SelRouteQrySrc: TDataSource;
    SelRoomingQry: TQuery;
    CitiesDBLookupComboBox: TDBLookupComboBox;
    DBChart: TDBChart;
    DBGrid: TDBGrid;
    ChartPrintAction: TAction;
    CitiesQry: TQuery;
    CitiesSrc: TDataSource;
    Series1: TPieSeries;
    Series2: TBarSeries;
    procedure FormCreate(Sender: TObject);
    procedure CitiesDBLookupComboBoxCloseUp(Sender: TObject);
    procedure ShowGridBtnClick(Sender: TObject);
    procedure ChartPrintActionExecute(Sender: TObject);
    procedure FromDatePickerChange(Sender: TObject);
    procedure TillDatePickerChange(Sender: TObject);
  private
    FCurDirect: Integer;
    FCurRoute: Integer;
    FFromDate: TDateTime;
    FTillDate: TDateTime;
    procedure PrintChart;
    procedure SetMinTillDate;
  protected
    procedure UpdateChartQuery; virtual;
    procedure UpdateRouteQuery; virtual;
    procedure SetDateFilter; virtual;
    procedure UpdateDetailListQuery; override;
    property CurDirect: Integer read FCurDirect write FCurDirect;
    property CurRoute: Integer read FCurRoute write FCurRoute;
    property FromDate: TDateTime read FFromDate write FFromDate;
    property TillDate: TDateTime read FTillDate write FTillDate;
  end;

var
  ZTripViewChartForm: TZTripViewChartForm;

implementation

uses Printers, TourDbUn, VDlgs;

{$R *.DFM}

{ TZTripViewChartForm }

procedure TZTripViewChartForm.PrintChart;
var BckImg: TPicture;
begin
  BckImg := TPicture.Create;
  with DBChart do
    try
      BckImg.Assign(BackImage);
      BackImage := nil;
      PrintProportional := False;
      if Width > Height then PrintMargins := Rect(3, 4, 3, 4)
      else PrintMargins := Rect(4, 3, 4, 3);
      PrintResolution := -5;
      PrintProportional := True;
      Print;
      BackImage.Assign(BckImg);
    finally
      BckImg.Free;
    end;
end;

procedure TZTripViewChartForm.SetDateFilter;
begin
  {DetailListQuery.Filter := Format('LEAVEDATE <= ''%s''', [DateToStr(FTillDate)]);
  DBChart.RefreshData;}
end;

procedure TZTripViewChartForm.SetMinTillDate;
begin
  with TillDatePicker do
  begin
    MinDate := FFromDate;
    if DateTime < MinDate then
    begin
      DateTime := MinDate;
      FTillDate := DateTime;
    end;
  end;
end;

procedure TZTripViewChartForm.UpdateChartQuery;
begin
  Screen.Cursor := crHourGlass;
  DBChart.Title.Text.Text := Caption+' ('+CitiesDBLookupComboBox.Text+')';
  with SelRoomingQry do
  begin
    AfterScroll := nil;
    try
      Close;
      ParamByName('CityId').Value := CitiesDBLookupComboBox.KeyValue;
      Params[1].DataType := ftDateTime;
      Params[2].DataType := ftDateTime;
      ParamByName('DPar').Value := Int(FFromDate);
      ParamByName('DPar1').Value := Int(FTillDate);
      Prepare;
      Open;
    finally
      AfterScroll := DetailListQueryAfterScroll;
      Screen.Cursor := crDefault;
    end;
  end;
  SetDateFilter;
end;

procedure TZTripViewChartForm.UpdateRouteQuery;
begin
  UpdateQuery(SelRoomingQry);
end;

procedure TZTripViewChartForm.UpdateDetailListQuery;
begin
  UpdateRouteQuery;
end;

procedure TZTripViewChartForm.FormCreate(Sender: TObject);
var Year, Month, Day: Word;
begin
  inherited;
  UpdateQuery(CitiesQry);
  DecodeDate(Date, Year, Month, Day);
  FFromDate := EncodeDate(Year, 1, 1);
  FTillDate := EncodeDate(Year, 12, 31);
  FromDatePicker.DateTime := FFromDate;
  TillDatePicker.DateTime := FTillDate;
  SetMinTillDate;
  DBChart.Title.Text.Text := Caption;
end;

procedure TZTripViewChartForm.CitiesDBLookupComboBoxCloseUp(Sender: TObject);
begin
//  SelRouteQry.Locate('CityId', CitiesDBLookupComboBox.KeyValue, []);
  UpdateChartQuery;
end;

procedure TZTripViewChartForm.ShowGridBtnClick(Sender: TObject);
begin
  with ShowGridBtn do DBGrid.Visible := Down;
end;

procedure TZTripViewChartForm.ChartPrintActionExecute(Sender: TObject);
begin
  Printer.PrinterIndex := -1;
  Printer.PrinterIndex := Printer.PrinterIndex;
  if Width > Height then SetPrinterOptions(2) else SetPrinterOptions(1);
  if PrintDialog.Execute then PrintChart;
end;

procedure TZTripViewChartForm.FromDatePickerChange(Sender: TObject);
begin
  FFromDate := FromDatePicker.DateTime;
  SetMinTillDate;
  UpdateChartQuery;
end;

procedure TZTripViewChartForm.TillDatePickerChange(Sender: TObject);
begin
  FTillDate := TillDatePicker.DateTime;
  UpdateChartQuery;
end;

end.
