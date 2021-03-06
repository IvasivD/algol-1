unit AddrDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, AzCustomAddress, AzIBAddress, ExtCtrls,
  Buttons, UnitFrameAddress,UnitProc,cxEdit,cxGridTableView,Core,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxCheckBox,DB,
  cxTextEdit;

type
  TParamCompAddres = record
    ParamAddres : TParamAddres;

    FieldNameOfficeName:string;
    FieldNameIsDef:string;
    FieldNameHeadOffice:string;
    FieldNameMailOffice:string;
    FieldNameSaleOffice:string;
  end;


  TAddressDlg = class(TForm)
    CtrlPanel: TPanel;
    CancelBtn: TBitBtn;
    OkBtn: TBitBtn;
    WorkPanel: TPanel;
    Bevel1: TBevel;
    OfficeNameLabel: TLabel;
    FrAddress: TFrAddress;
    OfficeNameDBEdit: TcxTextEdit;
    IsDefaultDBCheckBox: TcxCheckBox;
    HeadOfficeDBCheckBox: TcxCheckBox;
    MailOfficeDBCheckBox: TcxCheckBox;
    SalePoint: TcxCheckBox;
    procedure OkBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    FParamCompAddres:TParamCompAddres;
    procedure FPrepareDataControls( isNew:Boolean );

  public
    { Public declarations }
    function CheckError( ShowErrorMes:Boolean ):Boolean;
    procedure SaveDataControls( isNew:Boolean );
  end;
  Function ShowUpdateAddres( ParamCompAddres:TParamCompAddres; isNew, CanUpdate: Boolean;
                             ParamApartment : TParamApartment;
                             EditStyle: TcxEditStyle=nil;
                             ViewStyle: TcxGridTableViewStyleSheet=nil ):Boolean;

var
  AddressDlg: TAddressDlg;

implementation

{$R *.dfm}

Function ShowUpdateAddres( ParamCompAddres:TParamCompAddres; isNew, CanUpdate: Boolean;
                            ParamApartment : TParamApartment;
                            EditStyle: TcxEditStyle=nil;
                            ViewStyle: TcxGridTableViewStyleSheet=nil ):Boolean;
begin
  try
    Application.CreateForm(TAddressDlg, AddressDlg);
    {DMServ.AddAddresToHistory(Dataset:TDataset; FieldIdName, FieldKindStreet, FieldCityID, FieldProvinceId,
                                     FieldStreetName,FieldBuilding,FieldTenement:Widestring );}

    AddressDlg.FrAddress.Prepare( ParamCompAddres.ParamAddres.ElemAddres.DBGetParamConnect, CanUpdate, ParamApartment, EditStyle, ViewStyle );
    AddressDlg.FParamCompAddres := ParamCompAddres;
    AddressDlg.FPrepareDataControls( isNew );
    if AddressDlg.ShowModal = mrOk then
    begin
      AddressDlg.SaveDataControls( isNew );
      result := True;
    end else result := False;

  finally
    AddressDlg.free;
  end;
end;

procedure TAddressDlg.FPrepareDataControls( isNew:Boolean );
var aElem:TDBShema;
begin
  aElem :=FParamCompAddres.ParamAddres.ElemAddres;
  if not isNew then
  begin
    FrAddress.PrepareDataControls( isNew, FParamCompAddres.ParamAddres );
    OfficeNameDBEdit.Text := aElem.DB.FieldByName( FParamCompAddres.FieldNameOfficeName ).AsString;
    IsDefaultDBCheckBox.Checked  := aElem.DB.FieldByName(FParamCompAddres.FieldNameIsDef).AsBoolean;
    HeadOfficeDBCheckBox.Checked := aElem.DB.FieldByName(FParamCompAddres.FieldNameHeadOffice).AsBoolean;
    MailOfficeDBCheckBox.Checked := aElem.DB.FieldByName(FParamCompAddres.FieldNameMailOffice).AsBoolean;
    SalePoint.Checked := aElem.DBBooleanValue[ FParamCompAddres.FieldNameSaleOffice];
  end
  else
  begin
    FrAddress.PrepareDataControls( isNew, FParamCompAddres.ParamAddres );
    OfficeNameDBEdit.Text :='';
    IsDefaultDBCheckBox.Checked  := false;
    HeadOfficeDBCheckBox.Checked := false;
    MailOfficeDBCheckBox.Checked := false;
  end;
end;

procedure TAddressDlg.SaveDataControls( isNew:Boolean );
var aElem:TDBShema;
begin
  aElem := FParamCompAddres.ParamAddres.ElemAddres;
  FrAddress.SaveDataControls( isNew, FParamCompAddres.ParamAddres );
  if aElem.DB.State in [ dsInsert, dsEdit ] then
  begin
    aElem.DB.FieldByName( FParamCompAddres.FieldNameOfficeName ).AsString := OfficeNameDBEdit.Text;
    aElem.DB.FieldByName( FParamCompAddres.FieldNameIsDef ).AsBoolean := IsDefaultDBCheckBox.Checked;
    aElem.DB.FieldByName( FParamCompAddres.FieldNameHeadOffice ).AsBoolean := HeadOfficeDBCheckBox.Checked;
    aElem.DB.FieldByName( FParamCompAddres.FieldNameMailOffice ).AsBoolean := MailOfficeDBCheckBox.Checked;
    aElem.DBBooleanValue[ FParamCompAddres.FieldNameSaleOffice] := SalePoint.Checked;
    
    aElem.DB.Post;
  end;
end;

procedure TAddressDlg.OkBtnClick(Sender: TObject);
begin
  ModalResult :=mrOk;
end;

procedure TAddressDlg.CancelBtnClick(Sender: TObject);
begin
  ModalResult :=mrCancel;
end;

procedure TAddressDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult =mrOk then
    CanClose:= CheckError( true )
  else CanClose := True;
end;

function TAddressDlg.CheckError( ShowErrorMes:Boolean ):Boolean;
var MessEr:WideString;
begin
  MessEr :='';
  result := FrAddress.CheckError( true );
  if result then
  begin
    if OfficeNameDBEdit.Text = '' then MessEr := '������ ����� �����';

    Result :=  MessEr = '';
    if ( MessEr <> '' ) and ( ShowErrorMes )  then
      MyShowMessageDlg( MessEr, mtError, but_OK );
  end;
end;

end.
