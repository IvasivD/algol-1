unit UnitExcursionEdit;

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
  cxContainer, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, ExtCtrls, cxTextEdit, Buttons, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,OptSet,
  cxGridDBTableView, cxGrid, StdCtrls,ServModIB,ServMod, UnitProc, UnitEditInfoExcursion,
  UnitFrameDicCity,UnitLngTranslateEdit,UnitLngTranslate, Menus,Core,
  UnitFrameCityItems;

type
  TFormExcursionEdit = class(TForm)
    ModalPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    PanelLeft: TPanel;
    GridBrCountry: TcxGrid;
    GridBrCountryDBTableView1: TcxGridDBTableView;
    GridBrCountryLevel1: TcxGridLevel;
    PanelRight: TPanel;
    Splitter1: TSplitter;
    PanelExcurs: TPanel;
    Panel2: TPanel;
    butEditExcurs: TSpeedButton;
    butDelExcurs: TSpeedButton;
    butAddExcurs: TSpeedButton;
    ButExcursLng: TSpeedButton;
    butRefreshExcurs: TSpeedButton;
    Bevel1: TBevel;
    Bevel2: TBevel;
    GridExcursion: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    PanelTop: TPanel;
    Panel1: TPanel;
    butRefreshCountry: TSpeedButton;
    PMSelectKindTranslateExcursion: TPopupMenu;
    butKndSelectCityTranslateAll: TMenuItem;
    butKndSelectCityTranslateByFilter: TMenuItem;
    EdSearchCountry: TcxTextEdit;
    butClearSearchCountry: TSpeedButton;
    FrameDicCityExcurs: TFrameCityItems;
    procedure butRefreshCountryClick(Sender: TObject);
    procedure butRefreshExcursClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure butAddExcursClick(Sender: TObject);
    procedure butEditExcursClick(Sender: TObject);
    procedure butDelExcursClick(Sender: TObject);
    procedure ButExcursLngClick(Sender: TObject);
    procedure butKndSelectCityTranslateByFilterClick(Sender: TObject);
    procedure butKndSelectCityTranslateAllClick(Sender: TObject);
    procedure EdSearchCountryPropertiesChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FPathToHtml  : string;
    FPathToImage : string;
    procedure FUpdateToolActions( Value:Integer );
    procedure FRefreshControls;
    procedure ViewBrCountryFocusedRecordChanged(
        Sender: TcxCustomGridTableView; APrevFocusedRecord,
        AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);

    procedure ViewBrCityFocusedRecordChanged(
        Sender: TcxCustomGridTableView; APrevFocusedRecord,
        AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);

    procedure ViewBrCityCellDblClick(
        Sender: TcxCustomGridTableView;
        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
        AShift: TShiftState; var AHandled: Boolean);
    { Private declarations }
  public
  published
    property EnabledUpdate:Integer write FUpdateToolActions;
    { Public declarations }
  end;

Procedure ShowEditExcursion;

var
  FormExcursionEdit: TFormExcursionEdit;

implementation
uses UnitEditInfoCountry;
{$R *.dfm}

Procedure ShowEditExcursion;
begin
  if Assigned(FormExcursionEdit) and (FormExcursionEdit.Showing) then
  begin
    FormFocus(FormExcursionEdit.Handle, SW_RESTORE );
    Exit;
  end
  else
  begin
    Application.CreateForm(TFormExcursionEdit, FormExcursionEdit);
    FormExcursionEdit.Show;
  end;
end;

procedure TFormExcursionEdit.butRefreshCountryClick(Sender: TObject);
begin
  Elem_BrCountryQry.Requery;
end;

procedure TFormExcursionEdit.butRefreshExcursClick(Sender: TObject);
begin
  Elem_EXCURSIONQry.Requery;
end;

procedure TFormExcursionEdit.FormCreate(Sender: TObject);
var ParamFrame:TParamFrameCityItems;
begin
  FPathToImage  := OptionSet.WebPathToImage + 'EXCURSION\';
  FPathToHtml   := OptionSet.WebPathToHtml  + 'EXCURSION\';

  //ParamFrame.GoogleTranslate := nil;
  ParamFrame.ElemCounry := Elem_BrCountryQry;
  ParamFrame.ElemCityAdminUnitItems := Elem_ExcursCityQry;

  //ParamFrame.ElemProvince := Elem_ProvinceQry;
  //ParamFrame.ElemTownShips := Elem_TownShipsQry;
  //ParamFrame.ElemCityAdminUnitRegion := Elem_City_Admin_UnitRegionQry;

  FrameDicCityExcurs.IntitCityItemsFrame( ParamFrame, False, DMServ.CurManager );

  TcxGridDBTableView(GridBrCountry.Levels[0].GridView).OnFocusedRecordChanged := ViewBrCountryFocusedRecordChanged;
  TcxGridDBTableView(GridExcursion.Levels[0].GridView).OnFocusedRecordChanged := ViewBrCityFocusedRecordChanged;
  Elem_EXCURSIONQry.AddCellDblClick( ViewBrCityCellDblClick );

  Elem_BrCountryQry.DBOpen;
  Elem_ExcursCityQry.DBOpen;
  Elem_EXCURSIONQry.DBOpen;

  //Elem_ProvinceQry.DBOpen;
  //Elem_TownShipsQry.DBOpen;
end;

procedure TFormExcursionEdit.butAddExcursClick(Sender: TObject);
begin
  ShowEditInfoExcursion( True, FPathToHtml , FPathToImage, butEditExcurs.Enabled );
  Elem_EXCURSIONQry.Requery;
  FRefreshControls;
end;

procedure TFormExcursionEdit.butEditExcursClick(Sender: TObject);
begin
  ShowEditInfoExcursion( False, FPathToHtml , FPathToImage, butEditExcurs.Enabled );
  Elem_EXCURSIONQry.Requery;
  FRefreshControls;
end;

procedure TFormExcursionEdit.butDelExcursClick(Sender: TObject);
begin
  Elem_EXCURSIONQry.DB.Delete;
  FRefreshControls;
end;

procedure TFormExcursionEdit.ViewBrCountryFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  FRefreshControls;
end;

procedure TFormExcursionEdit.ViewBrCityFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  FRefreshControls;
end;

procedure TFormExcursionEdit.ButExcursLngClick(Sender: TObject);
var FieldTranslateShema:TFieldTranslateShemaArr;
begin
  AddLngFieldColumnToShema( FieldTranslateShema, Elem_EXCURSIONQry, 'NAME', 'NAME'  );
  ShowLngTranslate( Elem_EXCURSIONQry,nil, FieldTranslateShema,'оригінал', True, 780, DMServ.CurManager  );
end;

procedure TFormExcursionEdit.butKndSelectCityTranslateByFilterClick(
  Sender: TObject);
var FieldTranslateShema:TFieldTranslateShemaArr;
begin
  try
    //Elem_EXCURSIONQry.AddMainElem(  Elem_City_Admin_Unit, 'CITYID' );
    AddLngFieldColumnToShema( FieldTranslateShema, Elem_EXCURSIONQry, 'NAME', 'NAME'  );
    //AddLngFieldColumnToShema( FieldTranslateShema, Elem_City_Admin_Unit, 'NAME', 'NAME', 'ID' );

    ShowLngTranslate( Elem_EXCURSIONQry,nil, FieldTranslateShema,'оригінал', True, 780, DMServ.CurManager  );
  finally

  end;
end;

procedure TFormExcursionEdit.butKndSelectCityTranslateAllClick(
  Sender: TObject);
var FieldTranslateShema:TFieldTranslateShemaArr;  
begin
  try
    //Elem_EXCURSIONQry.AddMainElem(  Elem_BrCountryQry, 'COUNTRYID' );
    //AddLngFieldColumnToShema( FieldTranslateShema, Elem_EXCURSIONQry, 'NAME', 'NAME'  );
    //AddLngFieldColumnToShema( FieldTranslateShema, Elem_City_Admin_Unit, 'NAME', 'NAME', 'ID' );
    ShowLngTranslate( Elem_EXCURSIONQry, nil, FieldTranslateShema,'оригінал', True, 980, DMServ.CurManager  );

  finally
    //Elem_EXCURSIONQry.AddMainElem(  Elem_City_Admin_Unit, 'ID' );
  end;
end;

procedure TFormExcursionEdit.EdSearchCountryPropertiesChange(
  Sender: TObject);
begin
  SetFilterOnWievForManyColumns( TcxgridDBTableView(GridBrCountry.Levels[0].GridView), ['NAME'],[EdSearchCountry.Text],['like'],[fboOr]);
end;

procedure TFormExcursionEdit.ViewBrCityCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  butEditExcurs.Click;
end;

procedure TFormExcursionEdit.FRefreshControls;
begin
  {if FrameDicCityExcurs.GridBrCity.Levels[0].GridView <> nil then
  begin
    butAddExcurs.Enabled  := ( TcxgridDBTableView(FrameDicCityExcurs.GridBrCity.Levels[0].GridView).DataController.RowCount <>0 ) and ( DMServ.CurManager > 0);
    ButExcursLng.Enabled  := ( TcxgridDBTableView(FrameDicCityExcurs.GridBrCity.Levels[0].GridView).DataController.RowCount <>0 ) and ( DMServ.CurManager > 0);
  end;   }
  butAddExcurs.Enabled := ( TcxgridDBTableView(FrameDicCityExcurs.GridCityAdmUnit.Levels[0].GridView).DataController.RowCount <>0 ) and ( DMServ.CurManager > 0);
  butEditExcurs.Enabled :=( Elem_EXCURSIONQry.View.DataController.RowCount <>0 ) and ( DMServ.CurManager > 0 );
  butDelExcurs.Enabled  :=( Elem_EXCURSIONQry.View.DataController.RowCount <>0 ) and ( DMServ.CurManager > 0 );
end;

procedure TFormExcursionEdit.FUpdateToolActions(Value: Integer);
begin
  FRefreshControls;
end;

procedure TFormExcursionEdit.FormDestroy(Sender: TObject);
begin
  FrameDicCityExcurs.DesctroyCityItemsFrame;
end;

end.
