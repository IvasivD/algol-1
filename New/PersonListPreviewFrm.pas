unit PersonListPreviewFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZDlg, StdCtrls, ExtCtrls, Buttons, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxClasses, cxGridLevel,
  cxGrid, core, OrderUn, cxContainer, cxEdit, cxCheckBox, dxPSGlbl,
  dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers, dxPScxExtEditorProducers, dxSkinsdxBarPainter,
  dxPSCore, dxPScxCommon, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox;

type
  TPersonListPreviewForm = class(TZDialog)
    TopPanel: TPanel;
    SelectRadioGroup: TRadioGroup;
    PersonListGridLevel1: TcxGridLevel;
    PersonListGrid: TcxGrid;
    BitBtn1: TBitBtn;
    ShowAllCheckBox: TcxCheckBox;
    GridFilterCheckBox: TcxCheckBox;
    TouristLatCheckBox: TcxCheckBox;
    PrintDialog: TPrintDialog;
    PersonListPrinter: TdxComponentPrinter;
    PersonListPrinterLink1: TdxGridReportLink;
    ServiceComboBox: TcxExtLookupComboBox;
    ServiceLabel: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure SelectRadioGroupClick(Sender: TObject);
    procedure GridFilterCheckBoxPropertiesEditValueChanged(
      Sender: TObject);
    procedure TouristLatCheckBoxPropertiesChange(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
  private
    FElem_PersonList : TDBShemaView;
    FPersonListPreviewData: TPersonListPreviewData;
    procedure ExportInExel(const DataArr: Variant; const RowCount, ColCount: Integer); 
    procedure PrepareForm;
    procedure UpdatePersonList;
  protected
  end;

procedure ShowPersonListPreviewForm(aPersonListPreviewData: TPersonListPreviewData);

implementation

uses cxGridTableView, cxCustomData, ComObj, cxGridCustomTableView,
  cxGridDBTableView, PrntUn, TourConsts, FrmProgress;


{$R *.dfm}
procedure ShowPersonListPreviewForm(aPersonListPreviewData: TPersonListPreviewData);
begin
  with TPersonListPreviewForm.Create(Application) do
    try         
      FPersonListPreviewData := aPersonListPreviewData;
      FElem_PersonList := aPersonListPreviewData.PersonListElem;
      PrepareForm;
      ShowModal;
    finally
      Free;
    end;
end;


procedure TPersonListPreviewForm.BitBtn1Click(Sender: TObject);
var 
  RowCount, I, J, K, ColVisible: Integer;
  DataArr: Variant;
  aMultiRow: Boolean;
begin
  inherited;
  try
    FElem_PersonList.View.BeginUpdate;
    aMultiRow := FElem_PersonList.View.OptionsSelection.MultiSelect;
    FElem_PersonList.View.OptionsSelection.MultiSelect := True;
    FElem_PersonList.View.Controller.SelectAll;

    ColVisible := FElem_PersonList.View.VisibleColumnCount;
    RowCount := FElem_PersonList.View.Controller.SelectedRecordCount;
    DataArr := VarArrayCreate([1, RowCount + 1, 1, ColVisible], varVariant);
    
    for I := 0 to ColVisible - 1 do
    DataArr[1, I + 1] := FElem_PersonList.View.VisibleColumns[I].Caption;
    
    for I := 0 to RowCount - 1 do
    begin
      K := 1;
      for J := 0 to FElem_PersonList.View.ColumnCount - 1 do
        if FElem_PersonList.View.Columns[J].Visible then
        begin                  
          DataArr[I + 2, K] := FElem_PersonList.View.Controller.SelectedRows[I].Values[J];
          Inc( K );
        end;
    end;
    ExportInExel(DataArr, RowCount, ColVisible);
  finally
    FElem_PersonList.View.OptionsSelection.MultiSelect := aMultiRow;
    FElem_PersonList.View.EndUpdate;
  end;
end;

procedure TPersonListPreviewForm.ExportInExel(const DataArr: Variant;
  const RowCount, ColCount: Integer);
var 
  BeginRow, BeginCol: Variant;
  ExcelApp, Workbook, Range, Cell1, Cell2: Variant;
begin
// Створюємо Excel
  ExcelApp := CreateOleObject('Excel.Application');

// Отключаем реакцию Excel на события, чтобы ускорить вывод информации
  ExcelApp.Application.EnableEvents := false;
                             
//  Створюємо Книгу (Workbook)          
  Workbook := ExcelApp.WorkBooks.Add;//('N:\ТурМенеджер - Документи\Templates\Tours\report.xls');
  BeginRow := 1;
  BeginCol := 1;

// Ліва верхня ячейка області, в яку будемо виводити дані
  Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow, BeginCol];

// Права нижня ячейка області, в яку будемо виводити дані
  Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow  + RowCount, BeginCol + ColCount - 1];

// Область, в яку будемо виводити дані
  Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
// Вивід даних
  Range.Value := DataArr;
  Range.EntireColumn.AutoFit;

  Cell1 := WorkBook.WorkSheets[1].Cells[BeginRow, BeginCol];
  Cell2 := WorkBook.WorkSheets[1].Cells[BeginRow, BeginCol + ColCount - 1];
  Range := WorkBook.WorkSheets[1].Range[Cell1, Cell2];
  Range.HorizontalAlignment := $FFFFEFF4;
  Range.Interior.Color := clSkyBlue;
//Закріплення області
  WorkBook.WorkSheets[1].Activate;
  WorkBook.WorkSheets[1].Range['A2:A2'].Select;
  ExcelApp.ActiveWindow.FreezePanes:= True;
  
  ExcelApp.Visible := true;
end;

procedure TPersonListPreviewForm.PrepareForm;
begin
  Caption := FPersonListPreviewData.aReportName;
  PersonListGrid.Levels[0].GridView := FElem_PersonList.View;
  if FPersonListPreviewData.ServiceListElem <> nil then
  begin                                                              
    ServiceComboBox.Properties.View := FPersonListPreviewData.ServiceListElem.View;
    ServiceComboBox.Properties.KeyFieldNames := FPersonListPreviewData.ServiceListElem.FieldKod;
    ServiceComboBox.Properties.ListFieldItem := FPersonListPreviewData.ServiceListElem.View.GetColumnByFieldName('SERVNAME');
    FPersonListPreviewData.ServiceListElem.DBOpen;
    ServiceComboBox.EditValue := FPersonListPreviewData.aTypeServiceId;
  end
  else
  begin
    ServiceComboBox.Visible := False;
    ServiceLabel.Visible := False;
    UpdatePersonList;
  end;  
end;

procedure TPersonListPreviewForm.SelectRadioGroupClick(Sender: TObject);
var Progres : TProgressFormProp;
begin
  try
    Progres := ShowProgress( WaitFormCaption );
    UpdatePersonList;
  finally
    ClosedProgress( Progres.FormProgres );
  end;
end;

procedure TPersonListPreviewForm.UpdatePersonList;
var aGetTouristListData: TGetTouristListData;
begin
  aGetTouristListData.SelectType := SelectRadioGroup.ItemIndex;
  aGetTouristListData.AllTourist := ShowAllCheckBox.EditValue;
  aGetTouristListData.TouristLat := TouristLatCheckBox.EditValue;
  aGetTouristListData.TouristRefused := GridFilterCheckBox.EditValue;
  aGetTouristListData.aTypeServiceId := ServiceComboBox.EditValue;
  FPersonListPreviewData.aGetTouristListProc(aGetTouristListData);
end;

procedure TPersonListPreviewForm.GridFilterCheckBoxPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if GridFilterCheckBox.Checked then 
    FElem_PersonList.SetFilterOnView(['REFUSED'], ['T'], ['<>'])
  else
    FElem_PersonList.ClearFilterOnView;
end;

procedure TPersonListPreviewForm.TouristLatCheckBoxPropertiesChange(
  Sender: TObject);
begin
  inherited;
  FElem_PersonList.View.GetColumnByFieldName(FPersonListPreviewData.aTouristField).Visible := not TouristLatCheckBox.Checked;
  FElem_PersonList.View.GetColumnByFieldName(FPersonListPreviewData.aTouristLatField).Visible := TouristLatCheckBox.Checked;
end;

procedure TPersonListPreviewForm.OkBtnClick(Sender: TObject);
begin
  inherited;
  PersonListPrinterLink1.PrinterPage.PageHeader.CenterTitle.Text := FPersonListPreviewData.aReportName;
  PersonListPrinterLink1.PrinterPage.PageFooter.RightTitle.Text := FPersonListPreviewData.aReportSignature + FormatDateTime(' dd.mm.yyyy HH:mm', Now);
  PersonListPrinterLink1.ReportTitle.Text := FPersonListPreviewData.aReportHeader; 
  PersonListPrinterLink1.ReportFootnotes.Text := FPersonListPreviewData.aReportFooter;
//  PersonListPrinter.Preview;
  PersonListPrinter.Print(True, nil);
end;

end.
