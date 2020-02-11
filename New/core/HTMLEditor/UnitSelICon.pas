unit UnitSelICon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Buttons, ExtCtrls,UnitProc;

type
  TFrmSelICon = class(TForm)
    Panel1: TPanel;
    SbtOK: TSpeedButton;
    SbtClose: TSpeedButton;
    GridSelICon: TcxGrid;
    GridSelIConDBTableView1: TcxGridDBTableView;
    GridSelIConLevel1: TcxGridLevel;
    procedure SbtOKClick(Sender: TObject);
    procedure SbtCloseClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FView:TcxGridDBTableView;
    procedure FViewListDblClick(Sender: TObject);
    procedure FPrepare;
  public
    { Public declarations }
  end;

function ShowSelectIcon(ButControl:TObject; View:TcxGridDBTableView; aWidth,aHeight:Integer ):boolean;

var
  FrmSelICon: TFrmSelICon;

implementation

{$R *.dfm}

function ShowSelectIcon( ButControl:TObject; View:TcxGridDBTableView; aWidth,aHeight:Integer ):boolean;
begin
  try
    Application.CreateForm(TFrmSelICon, FrmSelICon);
    FrmSelICon.Width :=aWidth;
    FrmSelICon.Height :=aHeight;
    FrmSelICon.FView := View;
    FrmSelICon.FPrepare;
    ShowFormInPositionButton( FrmSelICon, TWinControl(ButControl), taLeftJustify );

    if FrmSelICon.ShowModal=mrOk then
      result := true
    else result := false;
    
  finally
    FrmSelICon.Free;
  end;
end;
{ TFrmSelICon }

procedure TFrmSelICon.FPrepare;
begin
  FrmSelICon.GridSelICon.Levels[0].GridView := FView;
  FView.OnDblClick := FViewListDblClick;
end;

procedure TFrmSelICon.FViewListDblClick(Sender: TObject);
begin
  SbtOK.Click;
end;

procedure TFrmSelICon.SbtOKClick(Sender: TObject);
begin
  self.ModalResult := mrOk;
end;

procedure TFrmSelICon.SbtCloseClick(Sender: TObject);
begin
  self.ModalResult := mrCancel;
end;

procedure TFrmSelICon.FormDestroy(Sender: TObject);
begin
  FView.OnDblClick := nil;
end;

procedure TFrmSelICon.FormKeyPress(Sender: TObject; var Key: Char);
begin
 if key = #27 then Close;
end;

end.
