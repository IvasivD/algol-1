unit ListSelectForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxClasses,
  cxGridLevel, cxGrid, StdCtrls, Buttons, ExtCtrls, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, DB, cxDBData, cxDBExtLookupComboBox,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  Menus, cxButtons, cxContainer, cxTextEdit, ComCtrls, dxSkinsCore,
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
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter;

type
  {TNavListButton=record
     MoveUp  :Boolean;
     MoveDown:Boolean;
     New:Boolean;
     Del:Boolean;
  end; }
  TOptUpdate=(opUpNone,opUpYes,opUpYesWithEditForm);

  TFrListSelect = class(TForm)
    Panel2: TPanel;
    ApplyBtn: TBitBtn;
    CancelBtn: TBitBtn;
    OpenDialog: TOpenDialog;
    PaneMain: TPanel;
    GridSelect: TcxGrid;
    GridSelectLevel1: TcxGridLevel;
    PanelSearch: TPanel;
    EdSquareCountry: TcxTextEdit;
    butSerach: TSpeedButton;

    procedure ApplyBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure butSerachClick(Sender: TObject);
    procedure EdSquareCountryKeyPress(Sender: TObject; var Key: Char);
  private
    FExtIniKey:String;
    FUpdate:TOptUpdate;
    FView:TcxGridDBTableView;
    procedure ViewDblClick(Sender: TObject);
    { Private declarations }
  public
    { Public declarations }
  end;

 function ShowSelect(aCaption:WideString;View:TcxGridDBTableView; ButtOkCaption:String='Select';ButtCancellCaption:String='Cancel';aWidthForm:Integer=-1;Search:Boolean=True):variant;

var
  FrListSelect: TFrListSelect;

implementation

uses UnitProc,Core;

{$R *.dfm}
//******************************************************************************
function ShowSelect(aCaption:WideString;View:TcxGridDBTableView; ButtOkCaption:String='Select';ButtCancellCaption:String='Cancel';aWidthForm:Integer=-1;Search:Boolean=True):variant;
var AlevelGrid:TcxGridLevel;
    AviewDblClickEvent:TNotifyEvent;
    //SaveGridElem:TcxGrid;
    isOk:Boolean;
    i:integer;
begin
 try
  result:=null;
  Application.CreateForm(TFrListSelect, FrListSelect);
  FrListSelect.Caption  :=aCaption;
  FrListSelect.FView := View;
  FrListSelect.PanelSearch.Visible := Search;
  FrListSelect.GridSelect.Levels[0].GridView:=View;
  FrListSelect.ApplyBtn.Caption:=ButtOkCaption;
  FrListSelect.CancelBtn.Caption:=ButtCancellCaption;

  FrListSelect.ApplyBtn.Visible:= ButtOkCaption<>'';
  FrListSelect.CancelBtn.Visible:=ButtCancellCaption<>'';
  if aWidthForm<>-1 then FrListSelect.Width := aWidthForm;
  //***********************************************
  if View.ViewData.RecordCount<>0 then View.Focused:=true;

  View.OnDblClick:=FrListSelect.ViewDblClick;
  View.DataController.Groups.FullCollapse;

  if FrListSelect.ShowModal=mrOK then
    result:=View.DataController.DataSource.DataSet.FieldByName(View.DataController.KeyFieldNames).Value
  else
     result:=null;
  //***********************************************
 finally
  View.OnDblClick:= AviewDblClickEvent;
  FrListSelect.GridSelect.Levels[0].GridView:=nil;
  //SaveGridElem.Levels[0].GridView:=View;
  View.Focused:=true;
  FreeAndNIl(FrListSelect);
 end;
end;
//******************************************************************************
procedure TFrListSelect.ApplyBtnClick(Sender: TObject);
begin
 ModalResult:=mrOK;
end;
//******************************************************************************
Procedure ParseState(aStrState:widestring;Var State:widestring;Var ShortState:widestring);
var begD:integer;
    endd:integer;
begin
 begD:= ansiPos('(',aStrState);
 if begD<>0 then ShortState:=Copy(aStrState,begD+1,2)
    else ShortState:=Copy(aStrState,1,2);

 if begD=0 then begD:=Length(aStrState)+1;
 State:=Trim(copy(aStrState,1,begD-1));
end;
//******************************************************************************

procedure TFrListSelect.CancelBtnClick(Sender: TObject);
begin
 ModalResult:=mrCancel;
end;
//******************************************************************************
procedure TFrListSelect.FormShow(Sender: TObject);
begin
 if PanelSearch.Visible then EdSquareCountry.SetFocus;
end;
//******************************************************************************
procedure TFrListSelect.ViewDblClick(Sender: TObject);
begin

end;

procedure TFrListSelect.butSerachClick(Sender: TObject);
begin
  SearchTextOnViewByAllColumns( Self.FView, EdSquareCountry.Text );
end;

procedure TFrListSelect.EdSquareCountryKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then butSerach.Click;
end;

end.
