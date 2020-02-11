unit UnitSelectVendor;

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
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, Variants,
  cxContainer, cxGridTableView, cxGridDBTableView, cxGrid, cxTextEdit,
  Core, UnitProc, cxCheckBox, UnitComRequisites,UnitFrameComRequisites,
  UnitFrameSelectVendor;

type
  TFrmSelectVendor = class(TForm)
    Panel2: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    FrameSelectVendor: TFrameSelectVendor;

    procedure OkBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ViewCompanyVendorDblClick(Sender: TObject);
  private
    FCurManager:Integer;
  private

  end;

var FrmSelectVendor: TFrmSelectVendor;

 function SelectVendorClient( Caption:String; FCurManager:Integer; DBParam:TConnectDBParam; FilterFieldParam:String; ViewStyle:TcxCustomStyleSheet; var VendId: variant ): Boolean;
implementation

uses TourConsts, TourCmnlIf, TourStrMag;

{$R *.DFM}

const
  optPartSearch: TLocateOptions = [loCaseInsensitive, loPartialKey];

var
  ClientOrVendor: String;

function SelectVendorClient( Caption:String; FCurManager:Integer; DBParam:TConnectDBParam; FilterFieldParam:String; ViewStyle:TcxCustomStyleSheet; var VendId: variant ): Boolean;
var ClientFrom: TFrmSelectVendor;
begin
  try
    ClientFrom := TFrmSelectVendor.Create(Application);
    ClientFrom.Caption := Caption;
    ClientFrom.FCurManager := FCurManager;
    ClientFrom.FrameSelectVendor.Prepare( DBParam, FilterFieldParam, ViewStyle, VendId );
    ClientFrom.FrameSelectVendor.ElemVendor.View.OnDblClick := ClientFrom.ViewCompanyVendorDblClick;

    if ClientFrom.ShowModal = mrOk then
    begin
      VendId := ClientFrom.FrameSelectVendor.ElemVendor.GetValueId;
      result := True;
    end
    else result := False;
    
  finally
    ClientFrom.FrameSelectVendor.ElemVendor.View.OnDblClick:= nil; 
    ClientFrom.Free;
  end;
end;

procedure TFrmSelectVendor.OkBtnClick(Sender: TObject);
begin
  ModalResult := MrOk;
end;

procedure TFrmSelectVendor.CancelBtnClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmSelectVendor.FormDestroy(Sender: TObject);
begin
  FrameSelectVendor.DestroyFrame;
end;

procedure TFrmSelectVendor.ViewCompanyVendorDblClick(Sender: TObject);
begin
  OkBtn.Click;
end;

end.
