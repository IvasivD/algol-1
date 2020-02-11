unit ZTRep;

interface      

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Qrctrls, quickrpt, ExtCtrls;

type
  TZReportForm = class(TForm)
    QuickRep: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    TitleBand1: TQRBand;
    SummaryBand1: TQRBand;
    PageFooterBand1: TQRBand;
    DetailBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRLabel6: TQRLabel;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBLeaveDate: TQRDBText;
    QRDBCalcFrom: TQRDBText;
    QRDBCalcArrive: TQRDBText;
    procedure QuickRepPreview(Sender: TObject);
    procedure DetailBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZReportForm: TZReportForm;

implementation

uses DataMod, QRPrevw, qrprntr;

{$R *.DFM}

procedure TZReportForm.QuickRepPreview(Sender: TObject);
begin
  QRDBLeaveDate.DataSet := DM.PlaceByTripQry.DataSource.DataSet;
  QRDBCalcFrom.DataSet := DM.PlaceByTripQry.DataSource.DataSet;
  QRDBCalcArrive.DataSet := DM.PlaceByTripQry.DataSource.DataSet;
  ReportPreviewForm.QRPreview.QRPrinter := TQRPrinter(Sender);
  ReportPreviewForm.Show;
end;

procedure TZReportForm.DetailBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  PrintBand := DM.PlaceListQueryState.AsInteger > 0;
end;

end.
