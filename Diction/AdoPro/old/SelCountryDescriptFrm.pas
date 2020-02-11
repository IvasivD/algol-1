unit SelCountryDescriptFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
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
  cxClasses, cxGridLevel, cxGrid, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  IBCustomDataSet, IBQuery, ActnList, core, Grids, SvtDBGrids, DBGrids;

type
  TSelCountryDescriptForm = class(TForm)
    SectionGridLevel1: TcxGridLevel;
    SectionGrid: TcxGrid;
    ItemGridLevel1: TcxGridLevel;
    ItemGrid: TcxGrid;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    ServSelectBtn: TSpeedButton;
    ServUnselectBtn: TSpeedButton;
    GridRepositoryCatDescript: TcxGridViewRepository;
    ViewSection: TcxGridDBTableView;
    ViewItem: TcxGridDBTableView;
    ViewSelectItem: TcxGridDBTableView;
    SectionQry: TIBQuery;
    ItemQry: TIBQuery;
    SectionQryDICTSECTIONID: TIntegerField;
    SectionQrySECTIONNAME: TIBStringField;
    SectionQryCOMMENTS: TMemoField;
    SectionSrc: TDataSource;
    ItemSrc: TDataSource;
    SelectItemSrc: TDataSource;
    ItemQryITEMID: TIntegerField;
    ItemQryITEMNAME: TIBStringField;
    ItemQryCOMMENTS: TMemoField;
    ItemQryDICTSECTIONID: TIntegerField;
    ViewSectionDICTSECTIONID: TcxGridDBColumn;
    ViewSectionSECTIONNAME: TcxGridDBColumn;
    ViewSectionCOMMENTS: TcxGridDBColumn;
    ViewItemITEMID: TcxGridDBColumn;
    ViewItemITEMNAME: TcxGridDBColumn;
    ViewItemCOMMENTS: TcxGridDBColumn;
    ViewItemDICTSECTIONID: TcxGridDBColumn;
    ActionList: TActionList;
    SelAction: TAction;
    UnSelAction: TAction;
    ViewSelectItemDICTSECTIONID: TcxGridDBColumn;
    ViewSelectItemID: TcxGridDBColumn;
    ViewSelectItemDESCRIPT: TcxGridDBColumn;
    ViewSelectItemSECTIONNAME: TcxGridDBColumn;
    ViewSelectItemITEMNAME: TcxGridDBColumn;
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure SelActionExecute(Sender: TObject);
    procedure UnSelActionExecute(Sender: TObject);
    procedure ViewSelectItemDblClick(Sender: TObject);
  private
    Elem_SelectItemQry: TDBShemaView;
    procedure OpenDescriptEditForm;
  protected
    procedure PrepareDialog; 
  end;

function ExecuteCountryDescriptMaster: Boolean;

implementation

uses
  ServModIB, ServMod, DesctiptEditFrm, TourCmnlIf;

{$R *.dfm}

function ExecuteCountryDescriptMaster: Boolean;
var SelCountryDescriptForm: TSelCountryDescriptForm;
begin
  SelCountryDescriptForm := TSelCountryDescriptForm.Create(Application);
  try
    Result := SelCountryDescriptForm.ShowModal = mrOk;
  finally
    SelCountryDescriptForm.Elem_SelectItemQry.Close;
    SelCountryDescriptForm.Free;
  end;
end; 

{ TSelCountryDescriptForm }

procedure TSelCountryDescriptForm.PrepareDialog;
begin
  inherited;
  Elem_SelectItemQry := TDBShemaView.Create( DMServIB.SelectItemQry, ViewSelectItem, 'COUNTRY_SECT_DESCRIPTS', 'ID', 'gen_country_sect_descripts_id' );

  SectionQry.Open;
  ItemQry.Open;
  Elem_SelectItemQry.DBQuerySetParamValue('CountryId',Elem_BrCountryQry.GetValueId);
  Elem_SelectItemQry.DBOpen;
end;

procedure TSelCountryDescriptForm.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  inherited;
  SelAction.Enabled := ItemQry.RecordCount > 0;
  UnSelAction.Enabled := Elem_SelectItemQry.DBRecordCount > 0;
end;

procedure TSelCountryDescriptForm.SelActionExecute(Sender: TObject);
begin
  inherited;   
  if Elem_SelectItemQry.DB.Locate('ITEMID', ItemQryITEMID.Value, []) then 
  begin 
    ErrorFmtDlg('Елемент опису "%s" вже доданий!', [ItemQryITEMNAME.Value]);
    Exit;
  end; 
  Elem_SelectItemQry.DBAddValues(['DICTSECTIONID', 'ITEMID', 'COUNTRYID'], [
    ItemQry.FieldByName('DICTSECTIONID').Value, 
    ItemQry.FieldByName('ITEMID').Value,
    Elem_BrCountryQry.DB.FieldByName('COUNTRYID').Value]);

  OpenDescriptEditForm;
  Elem_SelectItemQry.RequeryCurrentRecord;
end;

procedure TSelCountryDescriptForm.UnSelActionExecute(Sender: TObject);
begin
  Elem_SelectItemQry.DB.Delete;
end;

procedure TSelCountryDescriptForm.OpenDescriptEditForm;
var AskBeforeDel: Boolean;
begin
  TIBQuery(Elem_ItDesriptQry.DB).ParamByName('TableName').Value := Elem_SelectItemQry.TableName;
  TIBQuery(Elem_ItDesriptQry.DB).ParamByName('ItemId').Value := Elem_SelectItemQry.GetValueId;  
  Elem_ItDesriptQry.DBReOpen;  

  //TIBQuery(Elem_ForeignLangQry.DB).ParamByName('ServTable').Value := Elem_ItDesriptQry.TableName;
  //TIBQuery(Elem_ForeignLangQry.DB).ParamByName('ServId').Value := Elem_ItDesriptQry.GetValueId;
  //Elem_ForeignLangQry.DBReOpen;

  AskBeforeDel := Elem_SelectItemQry.AskBeforeDelete;
  Elem_SelectItemQry.AskBeforeDelete := False;

 { if not ExecuteDescriptEditForm(Elem_SelectItemQry, Elem_ItDesriptQry, Elem_SelLanguageQry, Elem_ForeignLangQry)
  then Elem_SelectItemQry.DB.Delete;
  Elem_SelectItemQry.AskBeforeDelete := AskBeforeDel;}
end;

procedure TSelCountryDescriptForm.ViewSelectItemDblClick(Sender: TObject);
begin
  inherited;
  if Elem_SelectItemQry.DBRecordCount > 0 then OpenDescriptEditForm;
end;

end.
