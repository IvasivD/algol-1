unit UnitTradeNameEditDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
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
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxGridDBTableView,
  OrderUn, TourConsts,
  cxDBExtLookupComboBox, cxTextEdit, StdCtrls, ExtCtrls, Buttons,UnitProc,Core;

type
  TFrmTradeNameEditDlg = class(TForm)
    CtrlPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    NewTradeLabel: TLabel;
    Agencylogo: TImage;
    SelImageBtn: TSpeedButton;
    EMailLabel: TLabel;
    PeymenRadioGroup: TRadioGroup;
    BillCheckBox: TCheckBox;
    TradeNameEdit: TcxTextEdit;
    EMailComboBox: TcxExtLookupComboBox;
    procedure SelImageBtnClick(Sender: TObject);
  private
    { Private declarations }
    FIsNew:Boolean;
    FFileName:string;
    FElem_SelTradeNameQry : TDBShemaView;
    FElem_EmailQry : TDBShemaView;
    procedure FShowAgencyLogo;
    procedure UpdateSignatures;
    procedure FPrepare( aTradeName: Variant; isNew:Boolean );
    procedure UpdateAgencyField;
    procedure PeymenRadioGroupClick(Sender: TObject);
    function  GetIsNetAgency: Boolean;
  protected
     property IsNetAgency: Boolean read GetIsNetAgency;

  public
    { Public declarations }
  end;
function ExecuteEditTradeName(  aElem_SelTradeNameQry,aElem_EmailQry :TDBShemaView; TradeName: Variant; isNew:Boolean ): Boolean;
var
  FrmTradeNameEditDlg: TFrmTradeNameEditDlg;

implementation

uses DB;

{$R *.dfm}

function ExecuteEditTradeName(  aElem_SelTradeNameQry,aElem_EmailQry :TDBShemaView; TradeName: Variant; isNew:Boolean ): Boolean;
begin
  try
    Application.CreateForm(TFrmTradeNameEditDlg, FrmTradeNameEditDlg);

    FrmTradeNameEditDlg.FIsNew := isNew;
    FrmTradeNameEditDlg.FElem_SelTradeNameQry := aElem_SelTradeNameQry;
    FrmTradeNameEditDlg.FElem_EmailQry := aElem_EmailQry;
    FrmTradeNameEditDlg.FPrepare( TradeName, isNew );
    Result := FrmTradeNameEditDlg.ShowModal = mrOk;

  finally
    FrmTradeNameEditDlg.Free;
  end;
end;

procedure TFrmTradeNameEditDlg.SelImageBtnClick(Sender: TObject);
var FilePic:string;
    NewFile:string;
begin
  FilePic:= OpenGraphicFileName('');
  if FilePic <> '^' then
  begin
    NewFile := IncludeTrailingPathDelimiter(GetNetAgencyLogoFileFolder) + ExtractFileName( FilePic );
    MyCopyFile( FilePic, NewFile );
    if FileExists(NewFile) then FFileName := NewFile;
  end;
  
  FShowAgencyLogo;
end;

procedure TFrmTradeNameEditDlg.FShowAgencyLogo;
begin
  if FFileName <> EmptyStr then 
  with Agencylogo.Picture do
  begin 
    Assign(Nil);
    LoadFromFile(GetNetAgencyFileName(FFileName));
  end;
end;

procedure TFrmTradeNameEditDlg.UpdateAgencyField;
var En: Boolean;
begin
  En := IsNetAgency {and GetUspCanAdmin( aLev )};   //DMServ.CurManagerPerms[uspDictCompany]
  SelImageBtn.Enabled := En;
  with PeymenRadioGroup do
  begin
    Enabled := En;
    //FOldPeymToAgent := FElem_SelTradeNameQry.DB.FieldByName( 'PEYMTOAGENCY').AsBoolean;
    if IsNetAgency then
      if FElem_SelTradeNameQry.DB.FieldByName( 'PEYMTOAGENCY' ).AsBoolean then
        ItemIndex := 1
    else ItemIndex := 0;
  end;
  EMailComboBox.EditValue := FElem_SelTradeNameQry.DB.FieldByName('EMAILID').asInteger;
  BillCheckBox.Checked := FElem_SelTradeNameQry.DB.FieldByName('NOINCLUDEAGENTTOBILL').AsBoolean;
end;

procedure TFrmTradeNameEditDlg.PeymenRadioGroupClick(Sender: TObject);
var En: Boolean;
begin
  with PeymenRadioGroup do begin
    En := Enabled;
    EMailLabel.Enabled := En;
    EMailComboBox.Enabled := En;
    BillCheckBox.Enabled := En and (ItemIndex = 0) ;
  end;
end;

procedure TFrmTradeNameEditDlg.FPrepare( aTradeName: Variant; isNew:Boolean );
begin
 // SetPropInCxExtLookupComboBox( EMailComboBox, TcxGridDBTableView( FElem_EmailQry.ViewList ), 'EMAIL', FElem_EmailQry.FieldKod,True,false );
  if isNew then FFileName := EmptyStr
  else
   FFileName := FElem_SelTradeNameQry.DB.FieldByName('AGENCYLOGO').asString;

  FShowAgencyLogo;

  TradeNameEdit.EditValue := aTradeName;
  UpdateAgencyField;
  PeymenRadioGroupClick(Nil);
  UpdateSignatures;
end;

procedure TFrmTradeNameEditDlg.UpdateSignatures;
const 
  TradeOrNetNameCapArr: array[Boolean] of string = ('Комерційна назва - ', 'Мережева агенція - ');
  pC: array[Boolean] of Pointer = (@SZTDlgCaptionEdit, @SZTDlgCaptionAppend);
begin
  Caption := TradeOrNetNameCapArr[IsNetAgency];

  Caption := Caption + LoadResString( pC[ Self.FIsNew ] );
  if not IsNetAgency then NewTradeLabel.Caption := 'Комерційна назва'
  else NewTradeLabel.Caption := 'Мережа агенцій';
end;

function TFrmTradeNameEditDlg.GetIsNetAgency: Boolean;
begin
  Result := not FIsNew and FElem_SelTradeNameQry.DB.FieldByName('ISNETAGENCY').AsBoolean;
end;

end.
