unit UnitFrameSelPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
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
  cxCurrencyEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox,Core,UnitProc,cxGridDBTableView,
  Buttons;

const
   MessInputValuePrice = '¬каж≥ть значенн€';
   MessInputCurrency = '¬каж≥ть валюту';


type
  TFrameSelPrice = class(TFrame)
    PanelPrice: TPanel;
    CbxCurrency: TcxExtLookupComboBox;
    EditPrice: TcxCurrencyEdit;
    butClearValue: TSpeedButton;
    procedure butClearValueClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    function CheckError(ShowError:Boolean):Boolean;
    function GetDisplayText: String;
    function GetCurrencyId:Variant;
    function GetPriceValue:Variant;
    procedure Prepare( ElemCurrency:TDBShemaView; CurrPrice, CurrId, DefCurrency:Variant; CanUpdate:Boolean;
                       EditStyle: TcxEditStyle=nil );
  end;

implementation

{$R *.dfm}

procedure TFrameSelPrice.Prepare( ElemCurrency:TDBShemaView; CurrPrice, CurrId, DefCurrency:Variant; CanUpdate:Boolean;
                                  EditStyle: TcxEditStyle=nil );
begin
  EditPrice.Properties.DisplayFormat := MaskFormatPrice;
  EditPrice.Properties.ReadOnly:=not CanUpdate;
  SetPropInCxExtLookupComboBox( CbxCurrency, TcxGridDBTableView( ElemCurrency.ViewList) ,'CURRENCYSHORT', ElemCurrency.FieldKod, True, false );
  EditPrice.EditValue := CurrPrice;
  CbxCurrency.EditValue := CurrId;
end;

function TFrameSelPrice.GetDisplayText:String;
begin
  if (EditPrice.EditValue = null) and (CbxCurrency.EditValue = null) then result := ''
  else result := PrepareFormatPrice( EditPrice.EditValue, CbxCurrency.Text );
end;

function TFrameSelPrice.GetPriceValue:Variant;
begin
  result := EditPrice.EditValue;
end;

function TFrameSelPrice.GetCurrencyId:Variant;
begin
  result := CbxCurrency.EditValue;
end;

function TFrameSelPrice.CheckError(ShowError:Boolean):Boolean;
var ErrMes:WideString;
begin
  result := True;
  ErrMes:='';
  if  (EditPrice.EditValue = null)and(CbxCurrency.EditValue = null) then Exit;

  if Trim( EditPrice.Text ) = '' then
    ErrMes := MessInputValuePrice
  else
  if Trim( CbxCurrency.Text ) = '' then
    ErrMes := MessInputCurrency;

  if ErrMes <> '' then
  begin
    result := False;
    if ShowError then MyShowMessageDlg(ErrMes , mtError, but_OK );
  end;
end;

procedure TFrameSelPrice.butClearValueClick(Sender: TObject);
begin
  EditPrice.EditValue := null;
  CbxCurrency.EditValue := null;
end;

end.
