unit ContractDataFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls, AzOpenDialog,
  DB, DBTables, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, WordXP, OleServer,UnitExportWord;

type
  TContractDataForm = class(TForm)
    ContractDataQry: TQuery;
    ContractDataQryCONTRACTID: TIntegerField;
    ContractDataQryCONTRACTNAME: TStringField;
    ContractDataQrySHORTNAME: TStringField;
    ContractDataQryTEMPLATS: TMemoField;
    ContractDataQryDAYCOUNT: TIntegerField;
    Panel1: TPanel;
    Label1: TLabel;
    SelectShablonBtn: TBitBtn;
    FileNameLabel: TLabel;
    ActualDateEdit: TcxDateEdit;
    CtrlPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    WordDocum: TWordDocument;
    WordApplic: TWordApplication;
    procedure SelectShablonBtnClick(Sender: TObject);
    procedure FileNameLabelClick(Sender: TObject);
    procedure FileNameLabelMouseEnter(Sender: TObject);
    procedure FileNameLabelMouseLeave(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FContractId: Integer;
    function GetShablonName: string;
    function GetTemplats: string;
    function GetActualDate: Integer;
    procedure SetShablonName(const Value: string);
    procedure UpdateContractQry;
    procedure PrepareData;
    procedure SetActualDate(const Value: Integer);
  protected
    property ShablonName: string read GetShablonName write SetShablonName;
    property Templats: string read GetTemplats;
    property ActualDate: Integer read GetActualDate write SetActualDate;
  end;

{var
  ContractDataForm: TContractDataForm;}
function ExecuteContractData(const ContractId: Integer): Boolean;

implementation

uses ServMod, UnitProc;
{$R *.dfm}
function ExecuteContractData(const ContractId: Integer): Boolean;
begin
  with TContractDataForm.Create(Application) do
  try
    FContractId := ContractId;
    UpdateContractQry;
    PrepareData;
    Result := ShowModal = mrOk;
  finally
    Free;
  end;
end;

procedure TContractDataForm.SelectShablonBtnClick(Sender: TObject);
var
  FN: String;
begin
  inherited;
  FN := MySelectFileDialog(DMServ.GetContractDir, '*.dot|*.dot');
  if FN <> '^' then
  begin 
    FN := ExpandUNCFileName(FN);
    ShablonName := ExtractFileName(FN);
  end;  
(*  with DMServ.OpenDialog_dot do
  begin
    Files.Clear;
    InitialDir := DMServ.GetContractDir;
    if Execute then begin 
      FN := ExpandUNCFileName(FileName);
      ShablonName := ExtractFileName(FN);
    end;
  end;   *)
end;

function TContractDataForm.GetShablonName: string;
begin
  Result := FileNameLabel.Caption;
end;

procedure TContractDataForm.SetShablonName(const Value: string);
begin
  FileNameLabel.Caption := Value;
end;

procedure TContractDataForm.UpdateContractQry;
begin
  with ContractDataQry do
  begin
    ParamByName('ContractId').Value := FContractId;
    Open;
  end;
end;

procedure TContractDataForm.PrepareData;
begin
  Caption := ContractDataQryCONTRACTNAME.Value;
  ShablonName := Templats;
  ActualDate := ContractDataQryDAYCOUNT.Value;
end;

function TContractDataForm.GetTemplats: string;
begin              
  Result := DMServ.GetFileNameWithMemo(ContractDataQryTEMPLATS);
end;

function TContractDataForm.GetActualDate: Integer;
begin
  Result := Trunc(ActualDateEdit.Date - StrToDate(BeginDate));
end;

procedure TContractDataForm.SetActualDate(const Value: Integer);
begin
  with ActualDateEdit do
  if Value = 0 then Text := EmptyStr
  else Date := StrToDate(BeginDate) + Value;
end;

procedure TContractDataForm.FileNameLabelClick(Sender: TObject);
begin
  OpenShablonDoc( WordDocum, WordApplic, DMServ.GetContractDir, ShablonName );
  //DMServ.OpenShablonDoc(ShablonName);
end;

procedure TContractDataForm.FileNameLabelMouseEnter(Sender: TObject);
begin
  DMServ.DrawContractLabel(FileNameLabel, True);
end;

procedure TContractDataForm.FileNameLabelMouseLeave(Sender: TObject);
begin
  DMServ.DrawContractLabel(FileNameLabel, False);
end;

procedure TContractDataForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
const 
  sShablonCntrctUpd = 'Update Namelists Set IntValue = %s, Memo = %s where NameId = %d';
  sContractUpd = 'Update CompContracts Set TillDate = :TillDate ' +
    'Where ContractType = 180 and TillDate is null and WriteDate < :WriteDate';
var
  aPar, aActualDate: string;  
  aQuery: TDataset;  
begin
  inherited;
(*  if ModalResult = mrOk then
  try
    CreateDataSet
  finally
  
  end;
  with DMServ.WorkQuery do
  begin
    if ShablonName = EmptyStr then aPar := 'Null'
    else aPar := Format('''%s=%s''', [sNamePar, ShablonName]);
    if ActualDateEdit.Text = EmptyStr then aActualDate := 'Null'
    else aActualDate := IntToStr(ActualDate);
    SQL.Text := Format(sShablonCntrctUpd, [aActualDate, aPar, FContractId]);
    ExecSQL;
    //проставлення дати закінчення по всіх договорах 
    if ActualDateEdit.Text <> EmptyStr then
    begin
      SQL.Text := sContractUpd;
      ParamByName('TillDate').AsDateTime := ActualDateEdit.Date - 1;
      ParamByName('WriteDate').AsDateTime := Now;
      ExecSQL;
    end;
  end;     *)
end;

end.
