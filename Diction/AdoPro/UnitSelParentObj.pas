unit UnitSelParentObj;

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
  StdCtrls, cxRadioGroup, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  Buttons, ExtCtrls, cxContainer, UnitFrameSearchCity, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, core,
  cxDBExtLookupComboBox, dxmdaset,UnitProc,
  cxPCdxBarPopupMenu, cxPC, UnitFrameSelParentObj;

type

 { TOpEn = ( optCity, optResort, optNaturObj, optInfra );
  ToOpEnArr = set of TOpEn;
  TFilterObj = procedure ( aView: TcxGridDBTableView ); }

  {TParamSelParentObj =  record
      ElemObjLinkCountry : TDBShemaView;
      ElemObjLinks : TDBShemaView;
      ObjLinksMainTypeObj:Integer;
      ObjLinksMainObjId:Variant;

      ElemCountry : TDBShemaView;
      ElemNaturObjects:TDBShemaView;
      ElemInfra:TDBShemaView;

      ArrEn : ToOpEnArr ;
  end;

  TParamObj = record
    ObjId:Variant;
    TypeObj:Integer;
  end; }

  TFrmSelParentObj = class(TForm)
    FrameSelParentObjSelect: TFrameSelParentObj;
  private
    { Private declarations }
    FElemCountry :TDBShemaView;
    FElemObjLinkCountry :TDBShemaView;
    FElemObjLinks :TDBShemaView;

    FElemNaturObjects:TDBShemaView;
    FElemInfra:TDBShemaView;
    FObjLinksMainTypeObj :Integer;
    FObjLinksMainObjId :Variant;
    FDefCountryId : Variant;
    FFilterSelObj : TFilterObj;
    FMainObjId, FMainTypeObj :Variant;
    FArrEn : ToOpEnArr;

    Procedure FPrepare;

  public
    { Public declarations }
   // procedure RefreshControls;

   // Procedure InitElements;
   // Procedure CloseElements;
  end;
 function ShowParentObjEditDlg( ParamSelParentObj : TParamSelParentObj;MainObjId, MainTypeObj, DefCountryId:Variant; aManagerId:Integer; FilterSelObj:TFilterObj = nil ): Boolean;

var
  FrmSelParentObj: TFrmSelParentObj;

implementation

{$R *.dfm}

function ShowParentObjEditDlg( ParamSelParentObj : TParamSelParentObj; MainObjId, MainTypeObj, DefCountryId:Variant; aManagerId:Integer; FilterSelObj:TFilterObj = nil ): Boolean;
begin
  try
    Application.CreateForm( TFrmSelParentObj, FrmSelParentObj);
    FrmSelParentObj.FrameSelParentObjSelect.InitFrame( ParamSelParentObj, MainObjId, MainTypeObj, DefCountryId, FilterSelObj );
    FrmSelParentObj.FrameSelParentObjSelect.SetManagerId( aManagerId );
    if FrmSelParentObj.ShowModal = mrOk then
      result := True
    else  result := False;
    
  finally
    FrmSelParentObj.Free;
  end;
end;

Procedure TFrmSelParentObj.FPrepare;
begin
 //***********
end;



end.

