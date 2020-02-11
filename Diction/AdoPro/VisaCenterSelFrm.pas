unit VisaCenterSelFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Buttons, Grids, ActnList,
  StdCtrls, ExtCtrls,IBQuery, IBStoredProc, IBCustomDataSet, cxGraphics,
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
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid;

type
  TVisaCenterSelForm = class(TForm)
    VCSelectBtn: TSpeedButton;
    VCUnSelectBtn: TSpeedButton;
    PartnersQry: TIBQuery;
    PartnersQryNAME: TStringField;
    PartnersQryCOMPANYID: TIntegerField;
    SelVCQry: TIBQuery;
    SelVCSrc: TDataSource;
    EmbassyUpdProc: TIBStoredProc;
    SelVCQryCntrEmbassyId: TIntegerField;
    SelVCQryNAME: TStringField;
    SelVCQryCOMPANYID: TIntegerField;
    SelVCQryITSKONSUL: TStringField;
    SelVCQryCOUNTRYID: TIntegerField;
    SelVCQryFUNDINGSUM: TFloatField;
    SelVCQryFUNDINGVAL: TSmallintField;
    SelVCQryFUNDINGCOUNT: TIntegerField;
    SelVCQryFUNDINGPERIOD: TSmallintField;
    SelVCQryBANKSUM: TFloatField;
    SelVCQryBANKVAL: TSmallintField;
    SelVCQryBANKCOUNT: TIntegerField;
    SelVCQryBANKPERIOD: TSmallintField;
    SelVCQryPERMTRANSFDOC: TSmallintField;
    SelVCQryONTOURSUM: TFloatField;
    SelVCQryPAYBANKSERV: TFloatField;
    SelVCQryCURRSERV: TSmallintField;
    SelVCQryREADYTODAYS: TIntegerField;
    SelVCQryREADYTOTYPE: TIntegerField;
    SelVCQryAUTOFILLING: TStringField;
    SelVCQryUSECODE: TStringField;
    SelVCQryOURFILING: TStringField;
    SelVCQryAPPLTYPEDATE: TIntegerField;
    SelVCQrySERVCOST: TFloatField;
    SelVCQrySERVCOSTVAL: TSmallintField;
    SelVCQryPARENTID: TIntegerField;
    PartnersDBGridDBTableView1: TcxGridDBTableView;
    PartnersDBGridLevel1: TcxGridLevel;
    PartnersDBGrid: TcxGrid;
    ForServDBGridDBTableView1: TcxGridDBTableView;
    ForServDBGridLevel1: TcxGridLevel;
    ForServDBGrid: TcxGrid;
    procedure VCSelectBtnClick(Sender: TObject);
    procedure VCUnSelectBtnClick(Sender: TObject);
  private
    function CenterIsUse: Boolean;
  protected
    procedure PrepareDialog;
    procedure UpdateButtons; 
  end;

function ExecuteVisaCenterSelForm:Boolean;

implementation

uses ServMod,  TourCmnlIf, StrUtils, Math, ServModIB ;

{$R *.dfm}

function ExecuteVisaCenterSelForm:Boolean;
begin
  with TVisaCenterSelForm.Create(Application) do
   try
     Result := ShowModal = mrOk;
   finally
     Free;
   end;
end;

{ TVisaCenterSelForm }

function TVisaCenterSelForm.CenterIsUse: Boolean;
const SelVisaCenterSQL = 'select count(*) as cnt from PersVisas v ' +
  'left join ordercntries o on o.ordercntryid = v.ordercntryid ' +
  'where ((VisaCenterId = %d) or (EmbassyId = %d)) and o.CountryId = %d';
begin
  //with DMServ.WorkIBQry do
  //begin
    //if Transaction.Active then Transaction.Commit;
 { DMServ.WorkIBQry.Close;
  DMServ.WorkIBQry.SQL.Text := Format(SelVisaCenterSQL, [SelVCQry.FieldByName('COMPANYID').asInteger,
    SelVCQry.FieldByName('COMPANYID').asInteger, Elem_CNTREMBASSIES.DB.fieldByName('COUNTRYID').asInteger ]);   // Elem_ItsKonsulQry.DB.FieldByName('COUNTRYID').asInteger
  DMServ.WorkIBQry.Open;
  Result := DMServ.WorkIBQry.Fields[0].AsInteger > 0;
  DMServ.WorkIBQry.Close;
  //end;
  if Result then ErrorFmtDlg('Не можна видалити ВЦ "%s", який вже є прописаний в даних туриста!', [ SelVCQry.FieldByName('NAME').asString ]);}
end;

procedure TVisaCenterSelForm.PrepareDialog;
begin
  inherited;
 // PartnersQry.ParamByName('CountryId').Value :=Elem_CNTREMBASSIES.DB.fieldByName('COUNTRYID').Value;// Elem_ItsKonsulQry.DB.FieldByName('COUNTRYID').asInteger;
 // UpdateQuery(PartnersQry);
 // SelVCQry.ParamByName('CountryId').Value := Elem_CNTREMBASSIES.DB.fieldByName('COUNTRYID').Value;//Elem_ItsKonsulQry.DB.FieldByName('COUNTRYID').asInteger;
 // SelVCQry.ParamByName('ParentId').Value := Elem_CNTREMBASSIES.DB.fieldByName('CntrEmbassyId').Value;//Elem_ItsKonsulQry.DB.FieldByName('CntrEmbassyId').asInteger;
 // UpdateQuery(SelVCQry);
 // UpdateButtons;
end;

procedure TVisaCenterSelForm.UpdateButtons;
begin
  inherited;
  VCSelectBtn.Enabled := PartnersQry.RecordCount > 0;
  VCUnSelectBtn.Enabled := SelVCQry.RecordCount > 0;
end;

procedure TVisaCenterSelForm.VCSelectBtnClick(Sender: TObject);
begin
  inherited;
 { if WarningFmtDlgYN('Додати "%s" до списку візових центрів?', [PartnersQryNAME.Value])
  then with EmbassyUpdProc do begin
    ParamByName('COUNTRYID').Value := Elem_CNTREMBASSIES.DB.fieldByName('COUNTRYID').Value;//Elem_ItsKonsulQry.DB.FieldByName('COUNTRYID').asInteger;
    ParamByName('EMBASSYID').Value := PartnersQryCOMPANYID.Value;
    ParamByName('PARENTID').Value  := Elem_CNTREMBASSIES.DB.fieldByName('CntrEmbassyId').Value;//Elem_ItsKonsulQry.DB.FieldByName('CntrEmbassyId').asInteger;
    ExecProc;
    UpdateQuery(SelVCQry);
    SelVCQry.Locate('COMPANYID', PartnersQryCOMPANYID.Value, []);
    UpdateQueryEx(PartnersQry);
  end;  }
end;

procedure TVisaCenterSelForm.VCUnSelectBtnClick(Sender: TObject);
begin
  inherited;

 { if not CenterIsUse and WarningFmtDlgYN('Видалити "%s" зі списку візових центрів?', [ SelVCQry.FieldByName('NAME').AsString ]) then
  begin

    //DMServ.WorkQueryExecute(Format('Delete From CntrEmbassies where CntrEmbassyId = %d', [ SelVCQry.FieldByName('EmbassyId').asInteger ]), EmptyStr);
    UpdateQuery(PartnersQry);
    PartnersQry.Locate('COMPANYID', SelVCQry.FieldByName('COMPANYID').AsString, []);
    UpdateQueryEx(SelVCQry);
  end;   }
end;

end.
