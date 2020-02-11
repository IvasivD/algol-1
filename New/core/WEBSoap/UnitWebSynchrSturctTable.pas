unit UnitWebSynchrSturctTable;

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
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView, UnitDM_WebSynchrStructTable,
  cxGridTableView, cxGridDBTableView, cxGrid, Buttons, ExtCtrls, ComCtrls, UnitProc,
  StdCtrls, Provider, DBClient, cxPCdxBarPopupMenu, cxPC, cxContainer,core,
  cxTextEdit ;

type
  TFrmWebSynchrSturctTable = class(TForm)
    PanelForm: TPanel;
    PageControl: TcxPageControl;
    TabTables: TcxTabSheet;
    TabFiles: TcxTabSheet;
    Panel3: TPanel;
    butSynchronizeStructAll: TSpeedButton;
    butSynhrSelecteTableStruct: TSpeedButton;
    butSynchronizeDataAll: TSpeedButton;
    butSynhrSelectedTableData: TSpeedButton;
    butSelectAll: TSpeedButton;
    Button1: TButton;
    GridTables: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2Level1: TcxGridLevel;
    Panel2: TPanel;
    butSelectAllPathFiles: TSpeedButton;
    butSynchrinizeFiles: TSpeedButton;
    GridPathFilesDBTableView1: TcxGridDBTableView;
    GridPathFilesLevel1: TcxGridLevel;
    GridPathFiles: TcxGrid;
    Panel4: TPanel;
    butAddTable: TSpeedButton;
    butDelTable: TSpeedButton;
    butResfresTables: TSpeedButton;
    butMoveUpRows: TSpeedButton;
    butMoveDownRows: TSpeedButton;
    Panel5: TPanel;
    butAddPathFiles: TSpeedButton;
    butDelPathTables: TSpeedButton;
    butResfresPathFiles: TSpeedButton;
    butMovePathFilesUpRows: TSpeedButton;
    butMovePathFilesDownRows: TSpeedButton;
    butSynchronizeFromDB: TSpeedButton;
    PanelSearch: TPanel;
    EdSearchTable: TcxTextEdit;
    butClearSearchTable: TSpeedButton;
    Button2: TButton;
    procedure butAddTableClick(Sender: TObject);
    procedure butDelTableClick(Sender: TObject);
    procedure butResfresTablesClick(Sender: TObject);
    procedure butMoveUpRowsClick(Sender: TObject);
    procedure butMoveDownRowsClick(Sender: TObject);
    procedure butSynchronizeStructAllClick(Sender: TObject);
    procedure butSynhrSelecteTableStructClick(Sender: TObject);
    procedure butSynhrSelectedTableDataClick(Sender: TObject);
    procedure butSynchronizeDataAllClick(Sender: TObject);
    procedure butSelectAllClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure butResfresPathFilesClick(Sender: TObject);
    procedure butAddPathFilesClick(Sender: TObject);
    procedure butDelPathTablesClick(Sender: TObject);
    procedure butMovePathFilesUpRowsClick(Sender: TObject);
    procedure butMovePathFilesDownRowsClick(Sender: TObject);
    procedure butSelectAllPathFilesClick(Sender: TObject);
    procedure TabTablesShow(Sender: TObject);
    procedure TabFilesShow(Sender: TObject);
    procedure butSynchrinizeFilesClick(Sender: TObject);
    procedure butSynchronizeFromDBClick(Sender: TObject);
    procedure EdSearchTablePropertiesChange(Sender: TObject);
    procedure butClearSearchTableClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmWebSynchrSturctTable: TFrmWebSynchrSturctTable;

implementation

{$R *.dfm}

procedure TFrmWebSynchrSturctTable.butAddTableClick(Sender: TObject);
begin
  Elem_ShemaWebSynchronize.DB.Insert;
end;

procedure TFrmWebSynchrSturctTable.butDelTableClick(Sender: TObject);
begin
  Elem_ShemaWebSynchronize.DeleteRecordFromView;
end;

procedure TFrmWebSynchrSturctTable.butResfresTablesClick(
  Sender: TObject);
begin
  Elem_ShemaWebSynchronize.Requery;
end;

procedure TFrmWebSynchrSturctTable.butMoveUpRowsClick(Sender: TObject);
begin
  Elem_ShemaWebSynchronize.MoveUpRow;
end;

procedure TFrmWebSynchrSturctTable.butMoveDownRowsClick(Sender: TObject);
begin
  Elem_ShemaWebSynchronize.MoveDownRow;
end;

procedure TFrmWebSynchrSturctTable.butSynchronizeStructAllClick(Sender: TObject);
begin
  DM.SynchronizeElements;
end;

procedure TFrmWebSynchrSturctTable.butSynhrSelecteTableStructClick(
  Sender: TObject);
begin
  //DM.SynchronizeCurrentElement;
end;

procedure TFrmWebSynchrSturctTable.butSynhrSelectedTableDataClick(
  Sender: TObject);
begin
  DM.SynchronizeCurrentElementData;
end;

procedure TFrmWebSynchrSturctTable.butSynchronizeDataAllClick(
  Sender: TObject);
begin
  //DM.SynchronizeAllElementData; // By Row
  DM.SynchronizeAllElementDataByXML; // By Xml File
end;

procedure TFrmWebSynchrSturctTable.butSelectAllClick(Sender: TObject);
begin
  Elem_ShemaWebSynchronize.View.DataController.Controller.SelectAll;
end;

procedure TFrmWebSynchrSturctTable.FormShow(Sender: TObject);
begin
  PageControl.ActivePage := TabTables;
  Elem_ShemaWebSynchronize.View.DataController.Controller.GoToFirst();
end;

procedure DataSetToXML(DataSet  : TDataSet; const FileName:string);
var
 LProvider : TDataSetProvider;
 LClient   : TClientDataSet;
begin
   LProvider:=TDataSetProvider.Create(nil);
   try
     LProvider.DataSet:=DataSet;
     LClient:=TClientDataSet.Create(nil);
     try
       DataSet.DisableControls;
       try
        if not DataSet.Active then
          DataSet.Active:=True;
        LClient.SetProvider(LProvider);
        LClient.Active:=True;
        LClient.SaveToFile(FileName, dfXMLUTF8);
       finally
         DataSet.EnableControls;
       end;
     finally
       LClient.Free;
     end;
   finally
     LProvider.Free;
   end;
end;

procedure TFrmWebSynchrSturctTable.Button1Click(Sender: TObject);
begin
  DM.SynchronizeAllElementDataByXML;
end;

procedure TFrmWebSynchrSturctTable.butResfresPathFilesClick(
  Sender: TObject);
begin
  Elem_ShemaWebSynchronizeFiles.Requery;
end;

procedure TFrmWebSynchrSturctTable.butAddPathFilesClick(Sender: TObject);
begin
  Elem_ShemaWebSynchronizeFiles.DB.Insert;
end;

procedure TFrmWebSynchrSturctTable.butDelPathTablesClick(Sender: TObject);
begin
  Elem_ShemaWebSynchronizeFiles.DB.Delete;
end;

procedure TFrmWebSynchrSturctTable.butMovePathFilesUpRowsClick(
  Sender: TObject);
begin
  Elem_ShemaWebSynchronizeFiles.MoveUpRow;
end;

procedure TFrmWebSynchrSturctTable.butMovePathFilesDownRowsClick(
  Sender: TObject);
begin
  Elem_ShemaWebSynchronizeFiles.MoveDownRow;
end;

procedure TFrmWebSynchrSturctTable.butSelectAllPathFilesClick(
  Sender: TObject);
begin
  Elem_ShemaWebSynchronizeFiles.View.DataController.Controller.SelectAll;
end;

procedure TFrmWebSynchrSturctTable.TabTablesShow(Sender: TObject);
begin
  Elem_ShemaWebSynchronize.SetFocusOnView;
end;

procedure TFrmWebSynchrSturctTable.TabFilesShow(Sender: TObject);
begin
  Elem_ShemaWebSynchronizeFiles.SetFocusOnView;
end;

procedure TFrmWebSynchrSturctTable.butSynchrinizeFilesClick(
  Sender: TObject);
begin
  DM.SynchronizeAllElementPathFiles;
end;

procedure TFrmWebSynchrSturctTable.butSynchronizeFromDBClick(
  Sender: TObject);
begin
  DM.SynchronizeLoadAllTables;
end;

procedure TFrmWebSynchrSturctTable.EdSearchTablePropertiesChange(
  Sender: TObject);
begin
  SearchTextOnViewByAllColumns( TcxgridDBTableView(GridTables.Levels[0].GridView),EdSearchTable.Text );
end;

procedure TFrmWebSynchrSturctTable.butClearSearchTableClick(
  Sender: TObject);
begin
  EdSearchTable.Text:='';
end;

procedure TFrmWebSynchrSturctTable.Button2Click(Sender: TObject);
var lis:TStringList;
begin
   lis:=TStringList.Create;

   Elem_ShemaWebSynchronize.DB.First;
   while not Elem_ShemaWebSynchronize.DB.Eof do
   begin

     lis.Add('DELETE FROM '+Elem_ShemaWebSynchronize.DB.FieldByName('TABLENAME').asString+';' ) ;
     Elem_ShemaWebSynchronize.DB.Next;
   end;

   lis.SaveToFile(ExtractFilePath( Application.ExeName ) + 'DropAllTable.Sql');
   lis.Free;
end;

end.
