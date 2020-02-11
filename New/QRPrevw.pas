unit QRPrevw;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, qrprntr, StdCtrls;

type
  TReportPreviewForm = class(TForm)
    QRPreview: TQRPreview;
    Panel1: TPanel;
    ZoomTo100Btn: TSpeedButton;
    ZoomToScrBtn: TSpeedButton;
    ZoomToFitBtn: TSpeedButton;
    FirstPageBtn: TSpeedButton;
    PrevPageBtn: TSpeedButton;
    NextPageBtn: TSpeedButton;
    LastPageBtn: TSpeedButton;
    PrintBtn: TSpeedButton;
    PrintSetupBtn: TSpeedButton;
    SaveBtn: TSpeedButton;
    LoadBtn: TSpeedButton;
    ZoomInBtn: TSpeedButton;
    ZoomOutBtn: TSpeedButton;
    CloseBtn: TBitBtn;
    procedure FirstPageBtnClick(Sender: TObject);
    procedure PrevPageBtnClick(Sender: TObject);
    procedure NextPageBtnClick(Sender: TObject);
    procedure ZoomInBtnClick(Sender: TObject);
    procedure ZoomOutBtnClick(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure ZoomToFitBtnClick(Sender: TObject);
    procedure ZoomTo100BtnClick(Sender: TObject);
    procedure ZoomToScrBtnClick(Sender: TObject);
    procedure PrintSetupBtnClick(Sender: TObject);
    procedure PrintBtnClick(Sender: TObject);
    procedure LastPageBtnClick(Sender: TObject);
    procedure SaveBtnClick(Sender: TObject);
    procedure LoadBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReportPreviewForm: TReportPreviewForm;

implementation

{$R *.DFM}

procedure TReportPreviewForm.FirstPageBtnClick(Sender: TObject);
begin
  with QRPreview do PageNumber := 1;
end;

procedure TReportPreviewForm.PrevPageBtnClick(Sender: TObject);
begin
  with QRPreview do PageNumber := PageNumber - 1;
end;

procedure TReportPreviewForm.NextPageBtnClick(Sender: TObject);
begin
  with QRPreview do PageNumber := PageNumber + 1;
end;

procedure TReportPreviewForm.ZoomInBtnClick(Sender: TObject);
begin
  with QRPreview do Zoom := Zoom * 2;
end;

procedure TReportPreviewForm.ZoomOutBtnClick(Sender: TObject);
begin
  with QRPreview do Zoom := Zoom div 2;
end;

procedure TReportPreviewForm.CloseBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TReportPreviewForm.ZoomToFitBtnClick(Sender: TObject);
begin
  QRPreview.ZoomToFit;
end;

procedure TReportPreviewForm.ZoomTo100BtnClick(Sender: TObject);
begin
 QRPreview.Zoom := 100;
end;

procedure TReportPreviewForm.ZoomToScrBtnClick(Sender: TObject);
begin
  QRPreview.ZoomToWidth;
end;

procedure TReportPreviewForm.PrintSetupBtnClick(Sender: TObject);
begin
  QRPreview.QRPrinter.PrintSetup;
end;

procedure TReportPreviewForm.PrintBtnClick(Sender: TObject);
begin
  QRPreview.QRPrinter.Print;
end;

procedure TReportPreviewForm.LastPageBtnClick(Sender: TObject);
begin
  with QRPreview do PageNumber := QRPrinter.LastPage;
end;

procedure TReportPreviewForm.SaveBtnClick(Sender: TObject);
begin
  QRPreview.QRPrinter.Save('');
end;

procedure TReportPreviewForm.LoadBtnClick(Sender: TObject);
begin
  QRPreview.QRPrinter.Load('');
end;

end.
