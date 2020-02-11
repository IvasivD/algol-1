unit OptDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, Buttons, Mask, Spin, DBCtrls, Db, DBTables,
  OptSet;

type
  TOptionDlg = class(TForm)
    CtrlPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    PageControl: TPageControl;
    ColorSheet: TTabSheet;
    ColorDialog: TColorDialog;
    PlaceColorGroup: TGroupBox;
    PlaceColorBtn1: TButton;
    PlaceColorBtn3: TButton;
    PlaceColorBtn5: TButton;
    PlaceColorBtn2: TButton;
    PlaceColorBtn11: TButton;
    PlaceColorBtn13: TButton;
    PlaceColorBtn4: TButton;
    PlaceColorBtn10: TButton;
    Shape1: TShape;
    Shape3: TShape;
    Shape5: TShape;
    Shape2: TShape;
    Shape4: TShape;
    Shape11: TShape;
    Shape13: TShape;
    Shape10: TShape;
    ViewBtn: TButton;
    ViewShape: TShape;
    MoneySheet: TTabSheet;
    CurrencyGroupBox: TGroupBox;
    OrderSheet: TTabSheet;
    OrderReservTimeGroupBox: TGroupBox;
    OrderReservTimeMinEdit: TSpinEdit;
    OrderReservTimeMaxEdit: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    OrderTimeBiasPicker: TDateTimePicker;
    PlaceColorBtn7: TButton;
    Shape6: TShape;
    PlaceColorBtn9: TButton;
    Shape9: TShape;
    PlaceColorBtn12: TButton;
    Shape12: TShape;
    PlaceColorBtn15: TButton;
    Shape14: TShape;
    Label4: TLabel;
    ExchDuesEdit: TMaskEdit;
    CommonSheet: TTabSheet;
    Label5: TLabel;
    ViewBtn1: TButton;
    ViewShape1: TShape;
    FilerSheet: TTabSheet;
    FaxExeLabel: TLabel;
    DialerExeLabel: TLabel;
    EmailExeLabel: TLabel;
    FaxExeEdit: TEdit;
    DialerExeEdit: TEdit;
    EmailExeEdit: TEdit;
    FaxExeBtn: TSpeedButton;
    DialerExeBtn: TSpeedButton;
    EmailExeBtn: TSpeedButton;
    OpenDialog: TOpenDialog;
    PictureFolderLabel: TLabel;
    PictureFolderBtn: TSpeedButton;
    PictureFolderEdit: TEdit;
    HotelPictFolderLabel: TLabel;
    HotelPictFolderEdit: TEdit;
    HotelPictFolderBtn: TSpeedButton;
    Label12: TLabel;
    CountryDBLookupComboBox: TDBLookupComboBox;
    Label9: TLabel;
    InboxFolderLabel: TLabel;
    InboxFolderEdit: TEdit;
    InboxFolderBtn: TSpeedButton;
    OutboxFolderBtn: TSpeedButton;
    OutboxFolderEdit: TEdit;
    OutboxFolderLabel: TLabel;
    DictionaryGroupBox: TGroupBox;
    UseCtrlKeyWithAddCheckBox: TCheckBox;
    TabSheet1: TTabSheet;
    PassportGroupBox: TGroupBox;
    Label8: TLabel;
    PassportExpireDurationEdit: TSpinEdit;
    Label10: TLabel;
    PassportExpireCheckEdit: TSpinEdit;
    PassportExpireCheckLabel: TLabel;
    PassportExpireDurationLabel: TLabel;
    SelCurrencyDBLookupComboBox: TDBLookupComboBox;
    PersonPictFolderLabel: TLabel;
    PersonPictFolderEdit: TEdit;
    PersonPictFolderBtn: TSpeedButton;
    Label11: TLabel;
    DatabaseEdit: TEdit;
    SpeedButton1: TSpeedButton;
    LocaleGroupBox: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    LocaleCountryDBLookupComboBox: TDBLookupComboBox;
    LocaleCityDBLookupComboBox: TDBLookupComboBox;
    Label13: TLabel;
    TabSheet2: TTabSheet;
    InsureGroupBox: TGroupBox;
    Label14: TLabel;
    InsureMaxPersonSpinEdit: TSpinEdit;
    Label15: TLabel;
    InsureMaxGroupSpinEdit: TSpinEdit;
    Label16: TLabel;
    Label17: TLabel;
    LocCurrencyDBLookupComboBox: TDBLookupComboBox;
    TemplateFolderBtn: TSpeedButton;
    TemplateFolderLabel: TLabel;
    TemplateFolderEdit: TEdit;
    Label18: TLabel;
    InsureMaxMovePeriodSpinEdit: TSpinEdit;
    InsureMaxMovePeriodLabel: TLabel;
    InsureBreakPayRestEdit: TMaskEdit;
    Label20: TLabel;
    InsureMinBreakPayRestEdit: TMaskEdit;
    Label21: TLabel;
    OrderReservTimeSpinEdit: TSpinEdit;
    Label19: TLabel;
    PostExpireTimeSpinEdit: TSpinEdit;
    Label22: TLabel;
    OrderHotReservTimeSpinEdit: TSpinEdit;
    Label23: TLabel;
    MailAttachFolderEdit: TEdit;
    SpeedButton2: TSpeedButton;
    PlaceColorBtn6: TButton;
    Shape7: TShape;
    PlaceColorBtn14: TButton;
    Shape15: TShape;
    PlaceColorBtn8: TButton;
    Shape8: TShape;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure PlaceColorBtn6Click(Sender: TObject);
    procedure ExchangeEditKeyPress(Sender: TObject; var Key: Char);
    procedure FaxExeBtnClick(Sender: TObject);
    procedure HotelPictFolderBtnClick(Sender: TObject);
    procedure InsureMaxMovePeriodSpinEditClick(Sender: TObject);
    procedure PassportExpireDurationEditChange(Sender: TObject);
    procedure PassportExpireCheckEditChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    ColorShapes: array[0..optColorCount] of TShape;
    function GetColors(Index: Integer): TColor;
    procedure SetColors(Index: Integer; Value: TColor);
  protected
    property Colors[Index: Integer]: TColor read GetColors write SetColors;
  public
    procedure ReadOptions;
    procedure WriteOptions;
  end;

procedure ShowOptionDlg;


implementation

{$R *.DFM}

uses FileCtrl, TourConsts, VDlgs, {DataMod, }TourCmnlIf, DataMod;

procedure ShowOptionDlg;
begin
  with TOptionDlg.Create(Application) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

{ TOptionDlg }

function TOptionDlg.GetColors(Index: Integer): TColor;
begin
  Result := OptionSet.Colors[Index];
end;

procedure TOptionDlg.SetColors(Index: Integer; Value: TColor);
begin
  with ColorShapes[Index] do
    if Brush.Color <> Value then
    begin
      Brush.Color := Value;
      Invalidate;
      OptionSet.Colors[Index] := Value;
    end;
end;

procedure TOptionDlg.ReadOptions;
var I: Integer;
begin
  OptionSet.ReadOptions;
  for I := 0 to optColorCount do Colors[I] := OptionSet.Colors[I];
  with OptionSet do
  begin
    // currency
    SelCurrencyDBLookupComboBox.KeyValue := CurrencyInter;
    LocCurrencyDBLookupComboBox.KeyValue := LocaleCurrency;
    ExchDuesEdit.Text := FormatCurr('0.00', ExchangeDues) + '%';
    // order
    with OrderReservTimeMinEdit do
      if ReservTimeMin < MinValue then Value := MinValue
      else if ReservTimeMin > MaxValue then Value := MaxValue
      else Value := ReservTimeMin;
    with OrderReservTimeMaxEdit do
      if ReservTimeMax < MinValue then Value := MinValue
      else if ReservTimeMax > MaxValue then Value := MaxValue
      else Value := ReservTimeMax;
    OrderTimeBiasPicker.Time := OrderTimeBias;
    OrderReservTimeSpinEdit.Value := OrderReservTime;
    OrderHotReservTimeSpinEdit.Value := OrderHotReservTime;
    PostExpireTimeSpinEdit.Value := PostExpireTime;
    // folders
    InboxFolderEdit.Text := InboxFolder;
    OutboxFolderEdit.Text := OutboxFolder;
    MailAttachFolderEdit.Text := MailAttachFolder;
    TemplateFolderEdit.Text := TemplateFolder;
    PictureFolderEdit.Text := PictureFolder;
    HotelPictFolderEdit.Text := HotelPictFolder;
    PersonPictFolderEdit.Text := PersonPictFolder;
    {DialerExeEdit.Text := AppNameDialer;
    EmailExeEdit.Text := AppNameEmail;
    FaxExeEdit.Text := AppNameFax;}
    DatabaseEdit.Text := DatabaseFolder;
    // tourist
    PassportExpireDurationEdit.Value := PassportExpireDuration;
    PassportExpireCheckEdit.Value := PassportExpireCheckMonths;
    // common
    CountryDBLookupComboBox.KeyValue := DefaultCountry;
    UseCtrlKeyWithAddCheckBox.Checked := UseCtrlKeyWithAdd;
    LocaleCountryDBLookupComboBox.KeyValue := LocaleCountry;
    LocaleCityDBLookupComboBox.KeyValue := LocaleCity;
    // insure
    InsureMaxPersonSpinEdit.Value := InsureMaxPersonPerPolice;
    InsureMaxGroupSpinEdit.Value := InsureMaxGroupPerPolice;
    InsureMaxMovePeriodSpinEdit.Value := InsureMaxMovePeriod;
    InsureBreakPayRestEdit.Text := FormatCurr('0.00', InsureBreakPayRest) + '%';
    InsureMinBreakPayRestEdit.Text := FormatCurr('0.00', InsureMinBreakPayRest);
  end;
  PassportExpireDurationEditChange(Self);
  PassportExpireCheckEditChange(Self);
end;

procedure TOptionDlg.WriteOptions;
var S: String;
begin
  with OptionSet do
  begin
    CurrencyInter := SelCurrencyDBLookupComboBox.KeyValue;
    LocaleCurrency := LocCurrencyDBLookupComboBox.KeyValue;
    S := ExchDuesEdit.Text + '%';
    S := Trim(Copy(S, 1, Pos('%', S) - 1));
    ExchangeDues := SafeStrToFloat(S);
    ReservTimeMin := OrderReservTimeMinEdit.Value;
    ReservTimeMax := OrderReservTimeMaxEdit.Value;
    OrderTimeBias := OrderTimeBiasPicker.Time;
    OrderReservTime := OrderReservTimeSpinEdit.Value;
    OrderHotReservTime := OrderHotReservTimeSpinEdit.Value;
    PostExpireTime := PostExpireTimeSpinEdit.Value;
    DefaultCountry := CountryDBLookupComboBox.KeyValue;
    LocaleCountry := LocaleCountryDBLookupComboBox.KeyValue;
    LocaleCity := LocaleCityDBLookupComboBox.KeyValue;
    //AppNameDialer := DialerExeEdit.Text;
    //AppNameEmail := EmailExeEdit.Text;
    //AppNameFax := FaxExeEdit.Text;
    DatabaseFolder := DatabaseEdit.Text;
    InboxFolder := InboxFolderEdit.Text;
    OutboxFolder := OutboxFolderEdit.Text;
    MailAttachFolder := MailAttachFolderEdit.Text;
    TemplateFolder := TemplateFolderEdit.Text;
    PictureFolder := PictureFolderEdit.Text;
    HotelPictFolder := HotelPictFolderEdit.Text;
    PersonPictFolder := PersonPictFolderEdit.Text;
    PassportExpireDuration := PassportExpireDurationEdit.Value;
    PassportExpireCheckMonths := PassportExpireCheckEdit.Value;
    UseCtrlKeyWithAdd := UseCtrlKeyWithAddCheckBox.Checked;
    InsureMaxPersonPerPolice := InsureMaxPersonSpinEdit.Value;
    InsureMaxGroupPerPolice := InsureMaxGroupSpinEdit.Value;
    InsureMaxMovePeriod := InsureMaxMovePeriodSpinEdit.Value;
    S := InsureBreakPayRestEdit.Text + '%';
    S := Trim(Copy(S, 1, Pos('%', S) - 1));
    InsureBreakPayRest := SafeStrToFloat(S, 15);
    InsureMinBreakPayRest := SafeStrToFloat(InsureMinBreakPayRestEdit.Text, 1);
  end;
  OptionSet.WriteOptions;
end;

procedure TOptionDlg.FormCreate(Sender: TObject);
begin
  ColorShapes[0] := Shape1;
  ColorShapes[1] := Shape2;
  ColorShapes[2] := Shape3;
  ColorShapes[3] := Shape4;
  ColorShapes[4] := Shape5;
  ColorShapes[5] := Shape6;
  ColorShapes[6] := Shape7;
  ColorShapes[7] := Shape8;
  ColorShapes[8] := Shape9;
  ColorShapes[9] := Shape10;
  ColorShapes[10] := Shape11;
  ColorShapes[11] := Shape12;
  ColorShapes[12] := Shape13;
  ColorShapes[13] := Shape14;
  ColorShapes[14] := Shape15;
  ColorShapes[optViewGrids] := ViewShape;
  ColorShapes[optViewGrids + 1] := ViewShape1;
  with DM do
  begin
    OpenDataSet(SelCurrencyQry);
    OpenDataSet(LocCurrencyQry);
    OpenDataSet(SelCountryQry);
    OpenDataSet(AddrCountryQry);
    OpenDataSet(AddrCityQry);
  end;
  ReadOptions;
end;

procedure TOptionDlg.FormActivate(Sender: TObject);
begin
  PageControl.ActivePage := OrderSheet;
  ActiveControl := OrderReservTimeMinEdit;
  ReadOptions;
end;

procedure TOptionDlg.PlaceColorBtn6Click(Sender: TObject);
var C: Longint;
begin
  C := (Sender as TComponent).Tag;
  if ColorDialog.Execute then Colors[C] := ColorDialog.Color;
end;

procedure TOptionDlg.ExchangeEditKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['.', ',', '-', '0'..'9', #8]) then Key := #0;
  if Key in ['.', ','] then Key := DecimalSeparator;
end;

procedure TOptionDlg.FaxExeBtnClick(Sender: TObject);
var
  Ctrl: TEdit;
  Labl: TLabel;
begin
  with OpenDialog do
  begin
    case (Sender as TComponent).Tag of
      2: Labl := DialerExeLabel;
      3: Labl := EmailExeLabel;
      else Labl := FaxExeLabel;
    end;
    Ctrl := Labl.FocusControl as TEdit;
    Title := Format(SOptDlgSelectPrompt, [Labl.Caption]);
    InitialDir := ExtractFileDir(GetUNCFileName(Ctrl.Text));
    FileName := Ctrl.Text;
    if Execute then Ctrl.Text := FileName;
  end;
end;

procedure TOptionDlg.HotelPictFolderBtnClick(Sender: TObject);
var
  RootDir, SelDir: String;
  Ctrl: TEdit;
  Labl: TLabel;
begin
  case (Sender as TComponent).Tag of
    1: Labl := InboxFolderLabel;
    2: Labl := OutboxFolderLabel;
    3: Labl := TemplateFolderLabel;
    5: Labl := HotelPictFolderLabel;
    6: Labl := PersonPictFolderLabel;
    else Labl := PictureFolderLabel;
  end;
  Ctrl := Labl.FocusControl as TEdit;
  RootDir := 'Desktop';
  if SelectDirectory(
    Format(SOptDlgFolderPrompt, [Labl.Caption]), RootDir, SelDir)
  then Ctrl.Text := GetUNCFileName(SelDir);
end;

procedure TOptionDlg.InsureMaxMovePeriodSpinEditClick(Sender: TObject);
begin
  InsureMaxMovePeriodLabel.Caption :=
    DayCountString(InsureMaxMovePeriodSpinEdit.Value);
end;

procedure TOptionDlg.PassportExpireDurationEditChange(Sender: TObject);
begin
  PassportExpireDurationLabel.Caption :=
    YearCountString(PassportExpireDurationEdit.Value);
end;

procedure TOptionDlg.PassportExpireCheckEditChange(Sender: TObject);
begin
  PassportExpireCheckLabel.Caption :=
    MonthCountString(PassportExpireCheckEdit.Value);
end;

procedure TOptionDlg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then WriteOptions;
end;

end.
