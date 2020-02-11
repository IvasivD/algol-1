unit UnitSelectTradeName;

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
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,OrderUn,UnitTradeNameEditDlg,
  cxTextEdit, IBCustomDataSet, IBQuery, StdCtrls, ExtCtrls, Buttons,TourConsts,UnitProc,Core;

type
  TFrmSelectTradeName = class(TForm)
    CtrlPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    AddBtn: TSpeedButton;
    NewTradeLabel: TLabel;
    TradeLabel: TLabel;
    PartnerLabel: TLabel;
    DelBtn: TSpeedButton;
    EditBtn: TSpeedButton;
    FiltrRadioGroup: TRadioGroup;
    TradeNameEdit: TcxTextEdit;
    GridTradeListDBTableView1: TcxGridDBTableView;
    GridTradeListLevel1: TcxGridLevel;
    GridTradeList: TcxGrid;
    GridPartenerListDBTableView1: TcxGridDBTableView;
    GridPartenerListLevel1: TcxGridLevel;
    GridPartenerList: TcxGrid;
    ButClearSearch: TSpeedButton;
    procedure FiltrRadioGroupClick(Sender: TObject);
    procedure ButClearSearchClick(Sender: TObject);
    procedure TradeNameEditPropertiesChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
    procedure AddBtnClick(Sender: TObject);
    procedure EditBtnClick(Sender: TObject);
    procedure DelBtnClick(Sender: TObject);
  private
    { Private declarations }
    FTradeId:Integer;
    FElem_SelTradeNameQry : TDBShemaView;
    FElem_SelCompanyByTradeNameQry : TDBShemaView;
    FElem_Emails : TDBShemaView;
    FIsNetAgent : Boolean;
    FIsNetHeadOffice : Boolean;

    function  GetFilterOnAgency: Boolean;
    procedure FUpdateSignatures;
    procedure FRefreshFilterViewSelTradeName;
    procedure FPrepare;
    procedure FRefreshControl;
    function  CanEditNetAgency: Boolean;
    
    procedure ViewViewSelTradeNameFocusedRecordChanged(
              Sender: TcxCustomGridTableView; APrevFocusedRecord,
              AFocusedRecord: TcxCustomGridRecord;
              ANewItemRecordFocusingChanged: Boolean);

  published
    property FilterOnAgency: Boolean read GetFilterOnAgency;
  public
    { Public declarations }

  end;

function ShowSelectTradeName( aElem_SelTradeNameQry, aElem_SelCompanyByTradeNameQry, aElem_EmailQry :TDBShemaView;
                              IsNetAgent, IsNetHeadOffice: Boolean;  var TradeId: Integer ):Integer;

var
  FrmSelectTradeName: TFrmSelectTradeName;

implementation

{$R *.dfm}

function ShowSelectTradeName( aElem_SelTradeNameQry, aElem_SelCompanyByTradeNameQry, aElem_EmailQry :TDBShemaView;
                              IsNetAgent, IsNetHeadOffice: Boolean; var TradeId: Integer ):Integer;
begin
  try
    Application.CreateForm( TFrmSelectTradeName, FrmSelectTradeName );
    FrmSelectTradeName.FElem_SelTradeNameQry := aElem_SelTradeNameQry;
    FrmSelectTradeName.FElem_SelCompanyByTradeNameQry := aElem_SelCompanyByTradeNameQry;
    FrmSelectTradeName.FElem_Emails := aElem_EmailQry;

    FrmSelectTradeName.FIsNetAgent := IsNetAgent;
    FrmSelectTradeName.FIsNetHeadOffice := IsNetHeadOffice;
    FrmSelectTradeName.FTradeId := TradeId;

    FrmSelectTradeName.FPrepare;
    FrmSelectTradeName.ShowModal;
  finally
    FrmSelectTradeName.Free;
  end;
end;

procedure TFrmSelectTradeName.FPrepare;
begin
  FElem_SelTradeNameQry.DBOpen;
  FElem_SelCompanyByTradeNameQry.DBOpen;
  //Self.FElem_Emails.DBOpen;

  FElem_SelTradeNameQry.AddFocusedRecordChanged( ViewViewSelTradeNameFocusedRecordChanged );
end;

function TFrmSelectTradeName.GetFilterOnAgency: Boolean;
begin
  with FiltrRadioGroup do Result := ItemIndex = 1;
end;

procedure TFrmSelectTradeName.FRefreshFilterViewSelTradeName;
begin
  if FiltrRadioGroup.ItemIndex = 1 then
   Self.FElem_SelTradeNameQry.SetFilterOnView(['IsNetAgency'],['T'], ['='])
  else
    if FiltrRadioGroup.ItemIndex = 0 then
      Self.FElem_SelTradeNameQry.SetFilterOnView(['IsNetAgency'],['T'], ['<>']);
end;

procedure TFrmSelectTradeName.FUpdateSignatures;
begin
  Caption := TradeOrNetNameArr[ FIsNetAgent or FIsNetHeadOffice or FilterOnAgency ];
  case FiltrRadioGroup.ItemIndex of
  0:begin
      NewTradeLabel.Caption := 'Пошук комерційної назви';
      TradeLabel.Caption := 'Список існуючих комерційних назв';
      PartnerLabel.Caption := 'Список партнерів';
      Self.FElem_SelTradeNameQry.View.GetColumnByFieldName('TRADENAME').Caption :='Комерційна назва';
      Self.FElem_SelCompanyByTradeNameQry.View.GetColumnByFieldName('COMPANYNAME').Caption := 'Партнер';
    end;
  1:begin
      NewTradeLabel.Caption := 'Пошук мережі агенцій';
      TradeLabel.Caption := 'Список мереж агенцій';
      PartnerLabel.Caption := 'Список агенцій';
      Self.FElem_SelTradeNameQry.View.GetColumnByFieldName('TRADENAME').Caption :='Назва мережі агенцій';
      Self.FElem_SelCompanyByTradeNameQry.View.GetColumnByFieldName('COMPANYNAME').Caption := 'Агенція';
    end;
  end;
  FRefreshFilterViewSelTradeName;
end;

procedure TFrmSelectTradeName.FiltrRadioGroupClick(Sender: TObject);
begin
  FUpdateSignatures;
end;

procedure TFrmSelectTradeName.TradeNameEditPropertiesChange(
  Sender: TObject);
begin
  if TradeNameEdit.Text<>'' then
    FElem_SelTradeNameQry.SetFilterOnView( ['TRADENAME'], [TradeNameEdit.Text], ['like'] )
  else FElem_SelTradeNameQry.ClearFilterOnView;
end;

procedure TFrmSelectTradeName.ButClearSearchClick(Sender: TObject);
begin
  TradeNameEdit.EditValue := ''; 
end;

function TFrmSelectTradeName.CanEditNetAgency: Boolean;
begin
  CanEditNetAgency := (not self.FElem_SelTradeNameQry.DB.FieldByName('ISNETAGENCY').AsBoolean);
end;

procedure TFrmSelectTradeName.FRefreshControl;
var En: Boolean;
begin
  En := self.FElem_SelTradeNameQry.DBRecordCount > 0;
  OkBtn.Visible := En and not FIsNetHeadOffice;
  DelBtn.Visible := En and not FIsNetAgent and not FIsNetHeadOffice and not FilterOnAgency;
  EditBtn.Visible := En and CanEditNetAgency and
  (not FilterOnAgency or (FIsNetHeadOffice and (FTradeId = self.FElem_SelTradeNameQry.DB.FieldByName('TRADENAMEID').asInteger)) );
  AddBtn.Visible := not FIsNetAgent and not FIsNetHeadOffice and not FilterOnAgency;
  AddBtn.Enabled := Trim(TradeNameEdit.Text) <> EmptyStr;
  ButClearSearch.Enabled := Trim(TradeNameEdit.Text) <> EmptyStr;
end;

procedure TFrmSelectTradeName.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
 if ModalResult = mrOk then
  begin
    if FTradeId = 0 then CanClose := MyShowMessageDlg( SZTDlgCaptionAppend + #32 + TradeOrNetNameArr3[FilterOnAgency], mtConfirmation, but_YES_NO ) = Res_YES //WarningDlgYN(SZTDlgCaptionAppend + #32 + TradeOrNetNameArr3[FilterOnAgency])
    else
    if FTradeId <> self.FElem_SelTradeNameQry.DB.FieldByName('TRADENAMEID').asInteger then
      CanClose := MyShowMessageDlg(SZTDlgCaptionChange + #32 + TradeOrNetNameArr3[FilterOnAgency], mtConfirmation, but_YES_NO ) = Res_YES;
  end;
end;

procedure TFrmSelectTradeName.ViewViewSelTradeNameFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  FRefreshControl;
end;

procedure TFrmSelectTradeName.FormDestroy(Sender: TObject);
begin
  self.FElem_SelTradeNameQry.AddFocusedRecordChanged( nil );
end;

procedure TFrmSelectTradeName.AddBtnClick(Sender: TObject);
begin
  ExecuteEditTradeName(  FElem_SelTradeNameQry, FElem_Emails, TradeNameEdit.EditingValue, True );
end;

procedure TFrmSelectTradeName.EditBtnClick(Sender: TObject);
begin
  ExecuteEditTradeName( FElem_SelTradeNameQry, FElem_Emails, self.FElem_SelTradeNameQry.DB.FieldByName('TRADENAME').asString, False );
end;

procedure TFrmSelectTradeName.DelBtnClick(Sender: TObject);
begin
  FElem_SelTradeNameQry.DBDelete( True );
end;

end.
