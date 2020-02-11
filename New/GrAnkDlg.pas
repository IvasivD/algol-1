unit GrAnkDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZTDlg, StdCtrls, DBCtrls, StdActns, ActnList, Menus, Db, Buttons,
  ExtCtrls, ComCtrls, Mask, DBTables;

type
  TGroupAnketDlg = class(TZTourDialog)
    PageControl: TPageControl;
    TravelTabSheet: TTabSheet;
    VisaTabSheet: TTabSheet;
    VisaGroupBox: TGroupBox;
    VisaDBCheckBox1: TDBCheckBox;
    VisaDBCheckBox3: TDBCheckBox;
    VisaDBCheckBox4: TDBCheckBox;
    VisaDBCheckBox2: TDBCheckBox;
    VisaDBCheckBox5: TDBCheckBox;
    VisaDBCheckBox6: TDBCheckBox;
    Label39: TLabel;
    Label41: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    TravelObjectDBComboBox: TDBComboBox;
    GarantDBComboBox: TDBComboBox;
    ReferenceDBComboBox: TDBComboBox;
    DestCountryDBLookupComboBox: TDBLookupComboBox;
    ShengenEntryDBLookupComboBox: TDBLookupComboBox;
    DriveKindDBLookupComboBox: TDBLookupComboBox;
    GarantAddressDBComboBox: TDBComboBox;
    Label42: TLabel;
    Label43: TLabel;
    ArriveCustomDBComboBox: TDBComboBox;
    DepartCustomDBComboBox: TDBComboBox;
    Label23: TLabel;
    DestinationDBComboBox: TDBComboBox;
    Label40: TLabel;
    Label1: TLabel;
    GarantPhoneDBComboBox: TDBComboBox;
    Label2: TLabel;
    AddressToDBComboBox: TDBComboBox;
    Label20: TLabel;
    Label21: TLabel;
    DBVisaFrom: TDBEdit;
    DBVisaTo: TDBEdit;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    DBNationalVisaFrom: TDBEdit;
    DBNationalVisaTo: TDBEdit;
    NationalVisaDBCheckBox: TDBCheckBox;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    DBWriteDate: TDBEdit;
    EndDestCountryDBComboBox: TDBComboBox;
    DrvKindQry: TQuery;
    DrvKindQrySrc: TDataSource;
    DrvKindQryDRIVEKIND: TIntegerField;
    DrvKindQryKIND: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure ArriveCustomDBComboBoxExit(Sender: TObject);
  private
    procedure ChangeTouristTemplate;
    procedure HighlightEditByTemplate;
  public
    { Public declarations }
  end;

var
  GroupAnketDlg: TGroupAnketDlg;

implementation

uses DataMod, VDlgs;

{$R *.DFM}

procedure TGroupAnketDlg.ChangeTouristTemplate;
begin
  if False //DM.AnketTempTable.Locate('TOURISTTEMPLATEID', ExtractTouristTemplateId, [])
    then HighlightEditByTemplate else HighlightEditAsDefault;
end;

procedure TGroupAnketDlg.HighlightEditByTemplate;
begin
  HighlightDBLookupComboBox(DestCountryDBLookupComboBox, DM.AnketTmpTableDESTCOUNTRY.AsBoolean);
  HighlightDBLookupComboBox(ShengenEntryDBLookupComboBox, DM.AnketTmpTableSHENGENENTRY.AsBoolean);
  HighlightDBLookupComboBox(DriveKindDBLookupComboBox, DM.AnketTmpTableDRIVEKIND.AsBoolean);
  HighlightDBComboBox(ArriveCustomDBComboBox, DM.AnketTmpTableARRIVECUSTOM.AsBoolean);
  HighlightDBComboBox(DepartCustomDBComboBox, DM.AnketTmpTableDEPARTCUSTOM.AsBoolean);
  HighlightDBComboBox(DestinationDBComboBox, DM.AnketTmpTableDESTINATION.AsBoolean);
  HighlightDBComboBox(TravelObjectDBComboBox, DM.AnketTmpTableTRAVELOBJECT.AsBoolean);
  HighlightDBComboBox(GarantDBComboBox, DM.AnketTmpTableGARANT.AsBoolean);
  HighlightDBComboBox(GarantAddressDBComboBox, DM.AnketTmpTableGARANTADDRESS.AsBoolean);
  HighlightDBComboBox(GarantPhoneDBComboBox, DM.AnketTmpTableGARANTADDRESS.AsBoolean);
  HighlightDBComboBox(GarantPhoneDBComboBox, DM.AnketTmpTableGARANTNATIONALITY.AsBoolean);
  //HighlightDBComboBox(GarantNationalityDBComboBox, DM.AnketTmpTableGARANTNATIONALITY.AsBoolean);
  HighlightDBComboBox(AddressToDBComboBox, DM.AnketTmpTableADDRESSTO.AsBoolean);
  HighlightDBComboBox(ReferenceDBComboBox, DM.AnketTmpTableREFERENCE.AsBoolean);
  HighlightDBCheckBox(VisaDBCheckBox1, DM.AnketTmpTableVISAKIND.AsBoolean);
  HighlightDBCheckBox(VisaDBCheckBox2, DM.AnketTmpTableVISAKIND.AsBoolean);
  HighlightDBCheckBox(VisaDBCheckBox3, DM.AnketTmpTableVISAKIND.AsBoolean);
  HighlightDBCheckBox(VisaDBCheckBox4, DM.AnketTmpTableVISAKIND.AsBoolean);
  HighlightDBCheckBox(VisaDBCheckBox5, DM.AnketTmpTableVISAKIND.AsBoolean);
  HighlightDBCheckBox(VisaDBCheckBox6, DM.AnketTmpTableVISAKIND.AsBoolean);
  HighlightDBEdit(DBVisaFrom, DM.AnketTmpTableVISAPERIOD.AsBoolean);
  HighlightDBEdit(DBVisaTo, DM.AnketTmpTableVISAPERIOD.AsBoolean);
  HighlightDBCheckBox(NationalVisaDBCheckBox, DM.AnketTmpTableNATIONALVISA.AsBoolean);
  HighlightDBEdit(DBNationalVisaFrom, DM.AnketTmpTableVISAPERIOD.AsBoolean);
  HighlightDBEdit(DBNationalVisaTo, DM.AnketTmpTableVISAPERIOD.AsBoolean);
  HighlightDBComboBox(EndDestCountryDBComboBox, DM.AnketTmpTableENDDESTINATION.AsBoolean);
end;

procedure TGroupAnketDlg.FormActivate(Sender: TObject);
begin
  inherited;
  ChangeTouristTemplate;
  with TravelObjectDBComboBox do if Text = '' then ItemIndex := 0;
  with ReferenceDBComboBox do if Text = '' then ItemIndex := 0;
  PageControl.ActivePage := TravelTabSheet;
end;

procedure TGroupAnketDlg.ArriveCustomDBComboBoxExit(Sender: TObject);
begin
  with DepartCustomDBComboBox.Field do
    if IsNull then Text := ArriveCustomDBComboBox.Text;
  AddComboBoxHistory(DepartCustomDBComboBox, ArriveCustomDBComboBox.Text);
end;

end.
