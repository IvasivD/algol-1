unit ClientDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, DBCtrls, Mask, Grids, DBGrids, cxGraphics,
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
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid,Core, cxContainer, cxTextEdit;

type
  TClientChooseDlg = class(TForm)
    Panel2: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    ClientRadioGroup: TRadioGroup;
    PromptLabel: TLabel;
    IsVendorCheckBox: TCheckBox;
    GridSelVendorDBTableView1: TcxGridDBTableView;
    GridSelVendorLevel1: TcxGridLevel;
    GridSelVendor: TcxGrid;
    SearchEdit: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ClientRadioGroupClick(Sender: TObject);
    procedure SearchEditKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridCellClick(Column: TColumn);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SearchEditExit(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure ViewSelVendorFocusedRecordChanged(
              Sender: TcxCustomGridTableView; APrevFocusedRecord,
              AFocusedRecord: TcxCustomGridRecord;
              ANewItemRecordFocusingChanged: Boolean);
    procedure SearchEditPropertiesChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FElem:TDBShemaView;
    function GetClientFound(Index: Integer): Boolean;
    function GetClientFoundName(Index: Integer): String;
    procedure SearchByText;
  private
    FKeyImage: String;
    procedure AddNewRecord;
    procedure ChangeVendorState;
    property ClientFound: Boolean index 0 read GetClientFound;
    property ClientFoundHide: Boolean index 1 read GetClientFound;
    property ClientFoundName: String index 0 read GetClientFoundName;
    property ClientFoundNameHide: String index 1 read GetClientFoundName;

  end;

var
  ClientChooseDlg: TClientChooseDlg;

function ExecuteChooseClientDlg(aElem:TDBShemaView; At: TPoint; IsClnt: Boolean; var VendId: Integer): Boolean;


implementation

uses TourConsts, VDlgs, TourCmnlIf, TourStrMag, TourDbUn;

{$R *.DFM}

const
  optPartSearch: TLocateOptions = [loCaseInsensitive, loPartialKey];

var
  ClientOrVendor: String;

function ExecuteChooseClientDlg(aElem:TDBShemaView; At: TPoint; IsClnt: Boolean; var VendId: Integer): Boolean;
const
  {$WARN UNSAFE_TYPE OFF}
  {$WARN UNSAFE_CODE OFF}
  sClntOrVend: array[Boolean] of Pointer = (@SClientDlgVendor, @SClientDlgClient);
  sClntOrVnd1: array[Boolean] of Pointer = (@SClientDlgVendor1, @SClientDlgClient1);
  {$WARN UNSAFE_CODE ON}
  {$WARN UNSAFE_TYPE ON}
begin
  ClientOrVendor := LoadResString(sClntOrVend[IsClnt]);
  ClientChooseDlg := TClientChooseDlg.Create(Application);
  ClientChooseDlg.FElem:=aElem;
  ClientChooseDlg.FElem.AddFocusedRecordChanged( ClientChooseDlg.ViewSelVendorFocusedRecordChanged );
  ClientChooseDlg.GridSelVendor.Levels[0].GridView := ClientChooseDlg.FElem.View;
  try
    with ClientChooseDlg do
    begin
      Left := Pred(At.x);
      Top := Pred(At.y);
      Caption := Format(SClientDlgCaption, [ClientOrVendor]);
      with ClientRadioGroup do
      begin
        Caption := LoadResString(sClntOrVnd1[IsClnt]);
        if IsClnt then ItemIndex := 0 else ItemIndex := 1;
      end;
      PromptLabel.Caption := Format(SClientDlgPrompt, [ClientOrVendor]);
      FElem.DBOpen;

      if FElem.DB.Locate('CompanyId', VendId, []) then
        ClientRadioGroup.ItemIndex := Ord( FElem.DB.FieldByName('ISENTERPR').AsBoolean );

      Result := ShowModal = mrOk;
      if Result then VendId := FElem.GetValueId;
    end;
  finally
    ClientChooseDlg.Free;
  end;
end;

procedure TClientChooseDlg.AddNewRecord;
begin
  SearchEditExit(SearchEdit);

  FElem.DBOpen;
  FElem.DB.Append;
  FElem.DB.FieldByName('ISVENDOR').AsBoolean :=True;
  FElem.DB.FieldByName('ISENTERPR').AsBoolean :=ClientRadioGroup.ItemIndex = 1;
  FElem.DB.FieldByName('ISPRIVATE').AsBoolean :=ClientRadioGroup.ItemIndex = 0;
  FElem.DB.FieldByName('NAME').AsString := SearchEdit.Text;
  FElem.DB.Post;
end;

procedure TClientChooseDlg.ChangeVendorState;
begin
  FElem.DBOpen;
  FElem.DB.Edit;
  FElem.DB.FieldByName('ISVENDOR').AsBoolean := True;
  FElem.DB.Post;
end;

function TClientChooseDlg.GetClientFound(Index: Integer): Boolean;
begin
  case Index of
    0,1: result := FElem.DB.Locate('Name', FKeyImage, optPartSearch)
  else Result := False;
  end;
end;

function TClientChooseDlg.GetClientFoundName(Index: Integer): String;
begin
  case Index of
    0,1: Result := FElem.DB.FieldByName('NAME').AsString;
  else Result := '';
  end;
end;

procedure TClientChooseDlg.FormCreate(Sender: TObject);
begin
  FKeyImage := '';
  ClientRadioGroup.ItemIndex := 1;
end;

procedure TClientChooseDlg.FormActivate(Sender: TObject);
begin
  FKeyImage := SearchEdit.Text;
  ClientRadioGroupClick(Self);
  SearchEdit.Clear;
end;

procedure TClientChooseDlg.ClientRadioGroupClick(Sender: TObject);
const boolStr: array[0..1] of String = ('F', 'T');
begin
  if not IsVendorCheckBox.Checked then
    FElem.SetFilterOnView( ['IsEnterpr'], [boolStr[ClientRadioGroup.ItemIndex]], ['='] )
  else
    FElem.SetFilterOnView( ['IsEnterpr','IsVendor'], [ boolStr[ClientRadioGroup.ItemIndex],'T'], ['=','='],fboAnd );

  SearchEdit.Text := '';
  ActiveControl := SearchEdit;
end;

procedure TClientChooseDlg.SearchEditKeyPress(Sender: TObject; var Key: Char);
var S: String;
begin
  if FKeyImage = '' then
  begin
    S := Key;
    S := AnsiUpperCase(S);
    Key := S[1];
  end;
  if Key <> #8 then FKeyImage := FKeyImage + Key;
  if Key = #13 then SearchByText;
end;

procedure TClientChooseDlg.SearchByText;
begin
  FKeyImage := Trim( SearchEdit.Text );
  FElem.SearchTextOnViewByFieldNames( ['NAME'], Trim( SearchEdit.Text ) );
end;

procedure TClientChooseDlg.SearchEditExit(Sender: TObject);
begin
  with SearchEdit do Text := CapitalName(Trim(Text));
end;

procedure TClientChooseDlg.DBGridCellClick(Column: TColumn);
begin
  SearchEdit.Text := ClientFoundName;
end;

procedure TClientChooseDlg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
const
  {$WARN UNSAFE_TYPE OFF}
  {$WARN UNSAFE_CODE OFF}
  pP: array[0..1] of Pointer = (@SClientDlgPrivate, @SClientDlgEnterpr);
  {$WARN UNSAFE_CODE ON}
  {$WARN UNSAFE_TYPE ON}
var S, C: String;
begin
  if ModalResult = mrOk then
  begin
    if (FKeyImage = '') and ErrorFmtDlg(SClientDlgErrorEmptyKey, [ClientOrVendor])
    then ModalResult := mrNone
    else
      if not (ClientFound and ((FKeyImage = ClientFoundName) or ConfirmFmtDlgYN(
        SClientDlgConfirmFound, [ClientOrVendor, ClientFoundName])))
      then begin
        S := LoadResString(pP[ClientRadioGroup.ItemIndex]);
        C := AnsiLowerCase(ClientRadioGroup.Caption);
        if (ClientFoundHide and (ConfirmFmtDlgYN(SClientDlgConfirmFoundHide, [
          S, ClientFoundNameHide, C])))
        then ChangeVendorState
        else
          case ConfirmFmtDlgYN(SClientDlgConfirmOnClose, [
              S, SearchEdit.Text, ClientOrVendor]) of
            True: AddNewRecord;
            False: ModalResult := mrNone;
          end;
      end;
  end;
  ActiveControl := SearchEdit;
  CanClose := ModalResult <> mrNone;
end;

procedure TClientChooseDlg.OkBtnClick(Sender: TObject);
begin
  ModalResult:=MrOk;
end;

procedure TClientChooseDlg.CancelBtnClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TClientChooseDlg.ViewSelVendorFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var lngName:Integer;
begin
  if Sender.Focused then
  begin
    lngName := TcxGridDBTableView( Sender ).GetColumnByFieldName('NAME').Index;
    SearchEdit.EditValue := AFocusedRecord.Values[lngName];
  end;
end;

procedure TClientChooseDlg.SearchEditPropertiesChange(Sender: TObject);
begin
  SearchByText;
end;

procedure TClientChooseDlg.FormDestroy(Sender: TObject);
begin
  Self.FElem.AddFocusedRecordChanged( nil );
end;

end.
