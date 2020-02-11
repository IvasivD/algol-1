unit UnitInputPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, UnitFrameSelPrice, StdCtrls,cxEdit, Core,UnitProc;

type
  TFrmInputPrice = class(TForm)
    FrameSelPrice: TFrameSelPrice;
    Panel1: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
Function ShowInputPrice( Acontrol:TControl; ElemCurrency:TDBShemaView; var CurrPrice, CurrId:Variant; var DisplayValue:string ; DefCurrency:Variant; CanUpdate:Boolean; EditStyle: TcxEditStyle=nil ):boolean;
var
  FrmInputPrice: TFrmInputPrice;

implementation

{$R *.dfm}

Function ShowInputPrice( Acontrol:TControl; ElemCurrency:TDBShemaView; var CurrPrice, CurrId:Variant; var DisplayValue:string ; DefCurrency:Variant; CanUpdate:Boolean; EditStyle: TcxEditStyle=nil ):boolean;
var MousePoint:Tpoint;
begin
  try
    Application.CreateForm(TFrmInputPrice, FrmInputPrice);

    if Acontrol<>nil then
      ShowFormInPositionButton(FrmInputPrice,TWinControl(Acontrol),taLeftJustify)
      else
       begin
         GetCursorPos(MousePoint);
         MousePoint.Y:=MousePoint.Y+10;
         ShowControlInPositionPoint( FrmInputPrice, MousePoint,taLeftJustify);
       end;

    FrmInputPrice.FrameSelPrice.Prepare( ElemCurrency, CurrPrice, CurrId, DefCurrency, CanUpdate, EditStyle );
    if FrmInputPrice.ShowModal = mrOk then
    begin
      Result := True;
      CurrPrice := FrmInputPrice.FrameSelPrice.GetPriceValue;
      CurrId := FrmInputPrice.FrameSelPrice.GetCurrencyId;
      DisplayValue := FrmInputPrice.FrameSelPrice.GetDisplayText;
    end
    else
      Result := False;
  finally
    FrmInputPrice.free;
  end;
end;

procedure TFrmInputPrice.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if self.ModalResult = mrOk then
    CanClose := FrameSelPrice.CheckError( True );
end;

procedure TFrmInputPrice.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Ord(Key) = Vk_Return then OkBtn.Click;
end;

end.
