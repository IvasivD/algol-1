unit HtlQryDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DBCtrls, Buttons, ExtCtrls, CheckLst, Spin, ComCtrls, ToolWin,
  ImgList, Db, DBTables;

type
  THotelQueryDlg = class(TForm)
    CtrlPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    WorkPanel: TPanel;
    CountryDBLookupComboBox: TDBLookupComboBox;
    CityDBLookupComboBox: TDBLookupComboBox;
    CountryCheckBox: TCheckBox;
    CityCheckBox: TCheckBox;
    CheckListBox1: TCheckListBox;
    CheckListBox2: TCheckListBox;
    HtlGroupCheckBox: TCheckBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    CheckListBox3: TCheckListBox;
    DateRangePicker1: TDateTimePicker;
    DateRangePicker2: TDateTimePicker;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DayCountEdit: TSpinEdit;
    DayCountLabel: TLabel;
    CostGroupBox: TGroupBox;
    CostMinEdit: TSpinEdit;
    CostMaxEdit: TSpinEdit;
    CostCheckBox: TCheckBox;
    CostMinCheckBox: TCheckBox;
    CostMaxCheckBox: TCheckBox;
    Panel1: TPanel;
    HotelServiceListView: TListView;
    ToolBar1: TToolBar;
    ListViewLargeTbtn: TToolButton;
    ListViewListTbtn: TToolButton;
    ListViewDetailTbtn: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Label8: TLabel;
    HtlGroupDBLookupComboBox: TDBLookupComboBox;
    CheckBox1: TCheckBox;
    HtlGrpTable: TTable;
    HtlGrpTableHotelGroupId: TAutoIncField;
    HtlGrpTableName: TStringField;
    HtlGrpSrc: TDataSource;
    HtlCategTable: TTable;
    HtlCategTableHotelCategId: TAutoIncField;
    HtlCategTableName: TStringField;
    HtlCategSrc: TDataSource;
    procedure FormActivate(Sender: TObject);
    procedure CountryCheckBoxClick(Sender: TObject);
    procedure CountryDBLookupComboBoxClick(Sender: TObject);
    procedure CityCheckBoxClick(Sender: TObject);
    procedure CityDBLookupComboBoxClick(Sender: TObject);
    procedure HtlGroupCheckBoxClick(Sender: TObject);
    procedure CostCheckBoxClick(Sender: TObject);
    procedure CostMinCheckBoxClick(Sender: TObject);
    procedure CostMaxCheckBoxClick(Sender: TObject);
    procedure DayCountEditChange(Sender: TObject);
    procedure DateRangePicker1Change(Sender: TObject);
    procedure DateRangePicker2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HotelQueryDlg: THotelQueryDlg;

implementation

uses DataMod, TourConsts, VDlgs, TourCmnlIf;

{$R *.DFM}

procedure THotelQueryDlg.FormActivate(Sender: TObject);
begin
  DateRangePicker1.Date := Date;
  DateRangePicker1Change(Sender);
  CountryDBLookupComboBox.KeyValue := DM.CountryTableCountryId.Value;
  CountryDBLookupComboBoxClick(Sender);
  CountryCheckBoxClick(Sender);
  CityCheckBoxClick(Sender);
  HtlGroupCheckBoxClick(Sender);
  CostCheckBoxClick(Sender);
  CostMinCheckBoxClick(Sender);
  CostMaxCheckBoxClick(Sender);
end;

procedure THotelQueryDlg.CountryCheckBoxClick(Sender: TObject);
var IsChecked: boolean;
begin
  IsChecked := CountryCheckBox.Checked;
  CountryDBLookupComboBox.Enabled := IsChecked;
  CityCheckBox.Enabled := IsChecked;
  if IsChecked then CityCheckBoxClick(Sender);
end;

procedure THotelQueryDlg.CountryDBLookupComboBoxClick(Sender: TObject);
begin
  with DM do
  begin
    CountryTable.Locate('CountryId', CountryDBLookupComboBox.KeyValue, []);
    CityDBLookupComboBox.KeyValue := CityByCntryTableCityId.Value;
  end;
end;

procedure THotelQueryDlg.CityCheckBoxClick(Sender: TObject);
var IsChecked: boolean;
begin
  IsChecked := CityCheckBox.Checked;
  CityDBLookupComboBox.Enabled := IsChecked;
  HtlGroupCheckBox.Enabled := IsChecked;
  if IsChecked then HtlGroupCheckBoxClick(Sender);
end;

procedure THotelQueryDlg.CityDBLookupComboBoxClick(Sender: TObject);
begin
  DM.CityByCntryTable.Locate('CityId', CityDBLookupComboBox.KeyValue, []);
end;

procedure THotelQueryDlg.HtlGroupCheckBoxClick(Sender: TObject);
begin
  HtlGroupDBLookupComboBox.Enabled := HtlGroupCheckBox.Checked;
end;

procedure THotelQueryDlg.CostCheckBoxClick(Sender: TObject);
var IsChecked: boolean;
begin
  IsChecked := CostCheckBox.Checked;
  CostGroupBox.Enabled := IsChecked;
  CostMinCheckBox.Enabled := IsChecked;
  CostMaxCheckBox.Enabled := IsChecked;
  CostMinCheckBoxClick(Sender);
  CostMaxCheckBoxClick(Sender);
end;

procedure THotelQueryDlg.CostMinCheckBoxClick(Sender: TObject);
begin
  CostMinEdit.Enabled := CostGroupBox.Enabled and CostMinCheckBox.Checked;
end;

procedure THotelQueryDlg.CostMaxCheckBoxClick(Sender: TObject);
begin
  CostMaxEdit.Enabled := CostGroupBox.Enabled and CostMaxCheckBox.Checked;
end;

procedure THotelQueryDlg.DateRangePicker1Change(Sender: TObject);
begin
  if DateRangePicker2.Date - DateRangePicker1.Date <= 1 then
    DateRangePicker2.Date := DateRangePicker1.Date + 30;
  DateRangePicker2.MinDate := DateRangePicker1.Date + 1;
end;

procedure THotelQueryDlg.DateRangePicker2Change(Sender: TObject);
var DayCountDelta: longint;
begin
  DayCountDelta := Trunc(DateRangePicker2.Date - DateRangePicker1.Date);
  with DayCountEdit do
    if Value < DayCountDelta then Value := DayCountDelta;
end;

procedure THotelQueryDlg.DayCountEditChange(Sender: TObject);
begin
  DayCountLabel.Caption := DayCountString(DayCountEdit.Value);
end;

end.
