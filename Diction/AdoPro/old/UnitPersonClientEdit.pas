unit UnitPersonClientEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ServMod, DB, StdCtrls, Buttons, ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxTextEdit, cxMemo,
  ComCtrls, DBCtrls, Mask, Core,TourConsts, cxMaskEdit, cxDropDownEdit, TourDbUn,
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox,UnitProc,cxGridDBTableView,
  cxDBEdit,ServModIB;

type
  TFrmPersonClientEdit = class(TForm)
    CtrlPanel: TPanel;
    CancelBtn: TBitBtn;
    OkBtn: TBitBtn;
    SurNameLabel: TLabel;
    NameLabel: TLabel;
    OccupationLabel: TLabel;
    Phone1Label: TLabel;
    FaxLabel: TLabel;
    MobilPhone1Label: TLabel;
    HomePhoneLabel: TLabel;
    EmailLabel: TLabel;
    Phone2Label: TLabel;
    WorkSkypeLabel: TLabel;
    MemoLabel: TLabel;
    MobilPhone2Label: TLabel;
    WorkIcqLabel: TLabel;
    HomeIcqLabel: TLabel;
    WorkEmailLabel: TLabel;
    HomeSkypeLabel: TLabel;
    Label1: TLabel;
    SurNameDBEdit: TDBEdit;
    NameDBEdit: TDBEdit;
    WorkSkypeDBEdit: TDBEdit;
    MobilPhone2DBEdit: TDBEdit;
    HomePhoneDBEdit: TDBEdit;
    Phone1DBLookupListBox: TDBLookupListBox;
    FaxDBLookupListBox: TDBLookupListBox;
    Phone2DBLookupListBox: TDBLookupListBox;
    MobilPhone1DBEdit: TDBEdit;
    DismissedDBCheckBox: TDBCheckBox;
    WorkIcqDBEdit: TDBEdit;
    HomeIcqDBEdit: TDBEdit;
    HomeSkypeDBEdit: TDBEdit;
    ForContractCheckBox: TCheckBox;
    ForContractDBEdit1: TDBEdit;
    LastNameDBEdit: TDBEdit;
    Memo: TcxMemo;
    OccupationDBComboBox: TcxDBExtLookupComboBox;
    ForContractDBEdit: TcxDBMemo;
    WorkEmailDBComboBox: TDBComboBox;
    EmailDBComboBox: TDBComboBox;
    WorkEmailDBComboBox_: TcxDBExtLookupComboBox;
    EmailDBComboBox_: TcxDBExtLookupComboBox;
    PersonSrc: TDataSource;
  private
    FElemPerson : TDBShemaView;
    FElemEmails : TDBShemaView;
    FElemOccupations :TDBShemaView;
    procedure FPrepare(LocalCompanyId:Integer; IsNew,Update:Boolean);
    procedure FSaveData(aNew:Boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

function ExecutePersonClientEditForm( aElemPerson, aElemEmails, aElemOccupations :TDBShemaView; LocalCompanyId:Integer; IsNew, Update:Boolean ): Boolean;

var
  FrmPersonClientEdit: TFrmPersonClientEdit;

implementation

{$R *.dfm}


function ExecutePersonClientEditForm( aElemPerson, aElemEmails, aElemOccupations :TDBShemaView; LocalCompanyId:Integer; IsNew, Update:Boolean ): Boolean;
begin
  try
    Application.CreateForm( TFrmPersonClientEdit, FrmPersonClientEdit );

    FrmPersonClientEdit.FElemPerson := aElemPerson;
    FrmPersonClientEdit.FElemEmails := aElemEmails;
    FrmPersonClientEdit.FElemOccupations := aElemOccupations;

    FrmPersonClientEdit.Caption := SPrsnFrmCaptionOfficer;
    FrmPersonClientEdit.FPrepare( LocalCompanyId, IsNew, Update );
    if FrmPersonClientEdit.ShowModal = mrOk then
      FrmPersonClientEdit.FSaveData( IsNew );
      
  finally
    FrmPersonClientEdit.Free;
  end;
end;

procedure TFrmPersonClientEdit.FPrepare(LocalCompanyId:Integer; IsNew,Update:Boolean);
var OurPerson:Boolean;
begin

  OurPerson := FElemPerson.DB.FieldByName('COMPANYID').asInteger = LocalCompanyId;
  PersonSrc.DataSet := FElemPerson.DB;
  FElemPerson.DBOpen;
  FElemEmails.DBOpen;
  FElemOccupations.DBOpen;

  SetPropInDBCxExtLookupComboBox( OccupationDBComboBox, FElemPerson.DS, 'OCCUPATION',
                                  TcxGridDBTableView( FElemOccupations.ViewList ), 'NAME', 'NAME', Update,false );

 {SetPropInDBCxExtLookupComboBox( WorkEmailDBComboBox, FElemPerson.DS, 'WORKEMAIL',
                                  TcxGridDBTableView( FElemEmails.ViewList ), 'EMAIL','EMAIL',Update, false );

  SetPropInDBCxExtLookupComboBox( EmailDBComboBox, FElemPerson.DS, 'E_MAIL',
                                  TcxGridDBTableView( FElemEmails.ViewList ), 'EMAIL','EMAIL',Update, false ); }

  NameDBEdit.Enabled := Update;
  LastNameDBEdit.Enabled := Update;
  SurNameDBEdit.Enabled :=  Update;
  ForContractDBEdit.Enabled := Update;
  Phone1DBLookupListBox.Enabled := Update;
  Phone2DBLookupListBox.Enabled := Update;
  FaxDBLookupListBox.Enabled := Update;

  MobilPhone1DBEdit.Enabled := Update;
  MobilPhone2DBEdit.Enabled := Update;
  HomePhoneDBEdit.Enabled := Update;
  WorkSkypeDBEdit.Enabled := Update;
  HomeSkypeDBEdit.Enabled := Update;
  WorkIcqDBEdit.Enabled := Update;
  HomeIcqDBEdit.Enabled := Update;
  Memo.Enabled := Update;

  if DismissedDBCheckBox.Field.IsNull then DismissedDBCheckBox.Checked := False;
  DismissedDBCheckBox.Enabled := ( Update ) and ( not OurPerson ) and ( GetUspCanAdmin(DMServ.CurManagerPerms[uspDictCompany]) );

  if Update then
  begin
    if IsNew then FElemPerson.Db.Insert
    else FElemPerson.Db.Edit;
  end;
end;

procedure TFrmPersonClientEdit.FSaveData(aNew:Boolean);
begin
  if FElemPerson.Db.state in [dsInsert,dsEdit] then
    FElemPerson.Db.Post;
end;

end.
