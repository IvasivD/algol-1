unit PartnerForServForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, DB, StdCtrls, Buttons, ExtCtrls, Grids, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  IBCustomDataSet, IBQuery, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  //SvtDBGrids,
  DBTables,ServModIB,Core;

type
  TPartnerForServDlg = class(TForm)
    DocumSelectBtn: TSpeedButton;
    DocumUnSelectBtn: TSpeedButton;
    PartnersQry: TIBQuery;
    PartnersQryNAME: TStringField;
    PartnersQryCOMPANYID: TIntegerField;
    ViewPartnersQry: TcxGridDBTableView;
    PartnersDBGridLevel1: TcxGridLevel;
    PartnersDBGrid: TcxGrid;
    ViewPartnersQryNAME: TcxGridDBColumn;
    ViewPartnersQryCOMPANYID: TcxGridDBColumn;
    ViewSelPartners: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ViewSelPartnersPARTNERID: TcxGridDBColumn;
    ViewSelPartnersCURRID: TcxGridDBColumn;
    ViewSelPartnersPARTNERNAME: TcxGridDBColumn;
    ViewSelPartnersCOMPANYID: TcxGridDBColumn;
    ViewSelPartnersPAYFORSERV: TcxGridDBColumn;
    ViewSelPartnersCURRENCYSHORT: TcxGridDBColumn;
    ViewSelPartnersEMBASSYID: TcxGridDBColumn;
    ViewSelPartnersCalcPayServ: TcxGridDBColumn;
    procedure SelPartnerActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    FCountryId: Integer; 
    FEmbassyId: Integer;
    Elem_PartnersQry : TDBShemaView;
    procedure UpdQuery;

    procedure SetPayServ(var CompanyId: Integer);
  public
    procedure InitElements;
    procedure CloseAllElements;
  protected
    procedure PrepareDialog;
    procedure UpdateButtons;
  end;

{var
  PartnerForServDlg: TPartnerForServDlg;}
function ExecutePartnerForServ(CountryId, EmbassyId: Integer):Boolean;

implementation

uses ServMod, SetPayServForm;
const 
  InsSql = 'Insert Into Partners(CountryId, EmbassyId, CompanyId, PayForServ, CurrId) ' +
    'Values(:CountryId, :EmbassyId, :CompanyId, :PayForServ, :CurrId)';      
  DelSql = 'Delete from Partners where PartnerId = :PartnerId';  

{$R *.dfm}
function ExecutePartnerForServ(CountryId, EmbassyId: Integer):Boolean;
var OnTourSum: Real;
begin
  with TPartnerForServDlg.Create(Application) do
   try
     FCountryId := CountryId;
     FEmbassyId := EmbassyId;
     UpdQuery;
     Result := ShowModal = mrOk;
   finally
     Free;
   end;
end;

{ TPartnerForServDlg }

procedure TPartnerForServDlg.PrepareDialog;
begin
  inherited;
  
end;

procedure TPartnerForServDlg.UpdateButtons;
begin
  inherited;
 // SelPartnerAction.Enabled := Elem_PartnersQry.DBRecordCount > 0;
 // DelPartnerAction.Enabled := Elem_SelPartnersQry.DBRecordCount > 0;
end;

procedure TPartnerForServDlg.SelPartnerActionExecute(Sender: TObject);
var CompanyId: Integer;
begin
  inherited;
  CompanyId := 0;
 { with DMServ.WorkQuery do
  begin
    case (Sender as TAction).Tag of
      0: SetPayServ(CompanyId);
      1:
      begin
        SQL.Text := DelSql;
        CompanyId := Elem_SelPartnersQry.DB.FieldByName('COMPANYID').AsInteger;// Elem_SelPartnersQry.DB.FieldByName('COMPANYID').asInteger;
        Parameters.ParamByName('PartnerId').Value := Elem_SelPartnersQry.DB.FieldByName('PARTNERID').Value; //Elem_SelPartnersQry.DB.FieldByName('PARTNERID').asInteger;
        ExecSQL;
      end;
    end;
  end;

  UpdQuery;

  if CompanyId > 0 then
  case (Sender as TAction).Tag of
    0: Elem_SelPartnersQry.DB.Locate('CompanyId', CompanyId, []);
    1: Elem_PartnersQry.DB.Locate('CompanyId', CompanyId, []);
  end;}
end;

procedure TPartnerForServDlg.UpdQuery;
begin
  //Elem_SelPartnersQry.DBClose;
  //Elem_SelPartnersQry.DBQuerySetParamValue('CountryId', FCountryId);
  //Elem_SelPartnersQry.DBQuerySetParamValue('EmbassyId', FEmbassyId);
  Elem_SelPartnersQry.Requery;
  Elem_PartnersQry.Requery;
//UpdateQuery( DMServ.SelPartnersQry );
end;

procedure TPartnerForServDlg.InitElements;
begin
  Elem_PartnersQry := TDBShemaView.Create( PartnersQry, ViewPartnersQry, 'COMPANIES', 'COMPANYID', '' );
end;

procedure TPartnerForServDlg.CloseAllElements;
begin
 Elem_PartnersQry.Close;
end;

procedure TPartnerForServDlg.SetPayServ(var CompanyId: Integer);
const
   CurrIdArr: array[-1..1] of Integer = (0,75,37);
var Res: Boolean;
    SumPay: Double;
begin
 { with TSetPayServDlg.Create(Application) do
   try
     PartnerLabel.Caption := Elem_PartnersQry.Db.FieldByName('NAME').asString;
     Res := ShowModal = mrOk;
     if Res then
     with DMServ.WorkQuery do
     begin
      SQL.Text := InsSql;
      TryStrToFloat(PayEdit.Text, SumPay);
      CompanyId := Elem_PartnersQry.Db.FieldByName('COMPANYID').AsInteger; //PartnersQryCOMPANYID.Value;
      Parameters.ParamByName('CountryId').Value := FCountryId;
      Parameters.ParamByName('EmbassyId').Value := FEmbassyId;
      Parameters.ParamByName('CompanyId').Value := CompanyId;
      Parameters.ParamByName('PayForServ').Value := SumPay;
      Parameters.ParamByName('CurrId').Value := CurrIdArr[CurrComboBox.ItemIndex];  
      ExecSQL;   
     end;
   finally
     Free;
   end;  }
end;

procedure TPartnerForServDlg.FormCreate(Sender: TObject);
begin
  inherited;
  InitElements;
end;

procedure TPartnerForServDlg.FormDestroy(Sender: TObject);
begin
  inherited;
  CloseAllElements;
end;

procedure TPartnerForServDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  //inherited;

end;

end.
