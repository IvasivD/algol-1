unit UnitFrameCityItems;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, UnitFrameSearchCity, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxCustomData, cxStyles, cxTL,
  cxTLdxBarBuiltInMenu, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  cxInplaceContainer, cxTLData, cxDBTL,cxGridDBTableView, Core, DB, Buttons,
  dxSkinscxPCPainter, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGrid, cxContainer, cxTextEdit ;

type
  TParamFrameCityItems = Record
     ElemCounry : TDBShemaView;
     ElemCityAdminUnitItems :TDBShemaView;
  end;

  TFrameCityItems = class(TFrame)
    DBTreeCityItemsSrc: TDataSource;
    Panel3: TPanel;
    butReftershCitiytems: TSpeedButton;
    GridCityAdmUnitDBTableView1: TcxGridDBTableView;
    GridCityAdmUnitLevel1: TcxGridLevel;
    GridCityAdmUnit: TcxGrid;
    EdSearchCountry: TcxTextEdit;
    procedure butReftershCitiytemsClick(Sender: TObject);
    procedure EdSearchCountryPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FParamFrame : TParamFrameCityItems;
    FCanUpdate  : Boolean;
    FCurrManager : Integer;
  public
    { Public declarations }
    procedure IntitCityItemsFrame( ParamFrame:TParamFrameCityItems; CanUpdate:Boolean; CurrManager:Integer );
    procedure DesctroyCityItemsFrame;
  end;

procedure AfterCitySearch( aOwnerSearchFrame:TComponent; id:Variant; idMainParent : TIdMainParent );

implementation

{$R *.dfm}


procedure TFrameCityItems.IntitCityItemsFrame( ParamFrame:TParamFrameCityItems; CanUpdate:Boolean; CurrManager:Integer );
begin
  self.FParamFrame := ParamFrame;
  self.FCurrManager:= CurrManager;
  self.FCanUpdate  := CanUpdate;
  //FrameSearchCityItems.Prepare( ParamFrame.ElemCounry, True, FrameSearchCityItems.Width - FrameSearchCityItems.PanelControl.Width, AfterCitySearch,
  //                              nil, ParamFrame.ElemCounry.View.Styles );

  GridCityAdmUnit.Levels[0].GridView := ParamFrame.ElemCityAdminUnitItems.View;// CloneView( self, false );
  //ParamFrame.ElemCityAdminUnitItems.PreviewVirtualOnTree( DBTreeListCityItems );
  //DBTreeCityItemsSrc.DataSet := ParamFrame.ElemCityAdminUnitItems.DB;
  //ParamFrame.ElemCityAdminUnitItems.SetTree( DBTreeListCityItems );
end;

procedure TFrameCityItems.DesctroyCityItemsFrame;
begin
  //GridCityAdmUnit.Levels[0].GridView.Free;
end;

procedure AfterCitySearch( aOwnerSearchFrame:TComponent; id:Variant; idMainParent : TIdMainParent );
begin
  //if TFrameCityItems(aOwnerSearchFrame.Owner).FParamFrame.ElemCityAdminUnitItems.DBLocate('ID', id, [] ) then
  //  TFrameCityItems(aOwnerSearchFrame.Owner).FParamFrame.ElemCityAdminUnitItems.Tree.SetFocus;

 {if idMainParent.id = null then
  begin
    if TFrameDicCity(aOwnerSearchFrame.Owner).FParamFrame.ElemCityAdminUnitItems.DBLocate('ID', id, [] ) then
      TFrameDicCity(aOwnerSearchFrame.Owner).FParamFrame.ElemCityAdminUnitItems.Tree.SetFocus;
  end
  else
   if idMainParent.aType = 1 then
   begin
     if TFrameDicCity(aOwnerSearchFrame.Owner).FParamFrame.ElemCityAdminUnitItems.DBLocate('ID', id, [] ) then
      TFrameDicCity(aOwnerSearchFrame.Owner).FParamFrame.ElemCityAdminUnitItems.Tree.SetFocus;
   end
   else
   if TFrameDicCity(aOwnerSearchFrame.Owner).FParamFrame.ElemCityAdminUnitItems.DBLocate('ID', idMainParent.id, []) then
     if TFrameDicCity(aOwnerSearchFrame.Owner).FParamFrame.ElemCityAdminUnitItems.DBLocate('ID', id, [] ) then
       TFrameDicCity(aOwnerSearchFrame.Owner).FParamFrame.ElemCityAdminUnitItems.Tree.SetFocus; }
end;

procedure TFrameCityItems.butReftershCitiytemsClick(Sender: TObject);
begin
  FParamFrame.ElemCityAdminUnitItems.Requery;
end;

procedure TFrameCityItems.EdSearchCountryPropertiesChange(Sender: TObject);
begin
  SetFilterOnWievForAllColumns( TcxGridDBTableView( GridCityAdmUnit.Levels[0].GridView ), EdSearchCountry.Text ,['like'], False );
end;

end.
