unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,UnitMergeDataBank,unitProc, DB, IBCustomDataSet,
  IBQuery, IBDatabase, ComCtrls, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
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
  dxSkinscxPCPainter, cxPCdxBarPopupMenu, cxCustomData, cxStyles, cxTL,
  cxTLdxBarBuiltInMenu, cxInplaceContainer, cxTLData, cxDBTL, cxPC,
  cxMaskEdit, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxContainer, Buttons,
  cxTextEdit,TourMbplIf,OptSet;

//Const ConnectTODB='alfa:D:\Tourmn\nettour\_TOURIB_TEST.GDB';

type
  TFmMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    PageControl: TcxPageControl;
    TabParseText: TcxTabSheet;
    Memo1: TMemo;
    cxTabSheet2: TcxTabSheet;
    ParsePanel: TPanel;
    Button1: TButton;
    ButParseNewDB: TButton;
    IBDatabase: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBQueryBank: TIBQuery;
    IBQueryBankBANKID: TIntegerField;
    IBQueryBankNAME: TIBStringField;
    IBQueryBankADDRESS: TIBStringField;
    IBQueryBankSWIFT: TIBStringField;
    IBQueryBankMFO: TIBStringField;
    IBQueryBankMEMO: TMemoField;
    IBQueryBankCOUNTRYID: TIntegerField;
    IBQueryBankGLMFO: TIBStringField;
    IBQueryBankD_OPEN: TDateTimeField;
    IBQueryBankD_CLOSE: TDateTimeField;
    IBQueryBankPARENTID: TIntegerField;
    IBQueryBankDEPCODE: TIBStringField;
    BankDS: TDataSource;
    DBTreeList: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn4: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn2: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn3: TcxDBTreeListColumn;
    IBQueryBankCalBANK: TStringField;
    cxDBTreeList1cxDBTreeListColumn5: TcxDBTreeListColumn;
    Splitter1: TSplitter;
    DS_MasterBank: TDataSource;
    IBQueryMasterBank: TIBQuery;
    IntegerField1: TIntegerField;
    IBStringField1: TIBStringField;
    IBStringField2: TIBStringField;
    IBStringField3: TIBStringField;
    IBStringField4: TIBStringField;
    MemoField1: TMemoField;
    IntegerField2: TIntegerField;
    IBStringField5: TIBStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    IntegerField3: TIntegerField;
    IBStringField7: TIBStringField;
    StringField1: TStringField;
    cxGridViewRepository1: TcxGridViewRepository;
    ViewDetail: TcxGridDBTableView;
    ViewDetailName: TcxGridDBColumn;
    Panel4: TPanel;
    Panel5: TPanel;
    EdTextLike: TcxTextEdit;
    ButRefresh: TSpeedButton;
    DSParentBank: TDataSource;
    IBQueryParentBank: TIBQuery;
    IntegerField4: TIntegerField;
    IBStringField8: TIBStringField;
    IBStringField9: TIBStringField;
    IBStringField10: TIBStringField;
    IBStringField11: TIBStringField;
    MemoField2: TMemoField;
    IntegerField5: TIntegerField;
    IBStringField12: TIBStringField;
    DateTimeField3: TDateTimeField;
    DateTimeField4: TDateTimeField;
    IntegerField6: TIntegerField;
    IBStringField14: TIBStringField;
    StringField2: TStringField;
    Splitter2: TSplitter;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    ViewParentBanks: TcxGridDBTableView;
    SpeedButton1: TSpeedButton;
    ViewDetailBankID: TcxGridDBColumn;
    IBQueryExec: TIBQuery;
    IntegerField7: TIntegerField;
    IBStringField15: TIBStringField;
    IBStringField16: TIBStringField;
    IBStringField17: TIBStringField;
    IBStringField18: TIBStringField;
    MemoField3: TMemoField;
    IntegerField8: TIntegerField;
    IBStringField19: TIBStringField;
    DateTimeField5: TDateTimeField;
    DateTimeField6: TDateTimeField;
    IntegerField9: TIntegerField;
    IBStringField20: TIBStringField;
    IBStringField21: TIBStringField;
    StringField3: TStringField;
    butSetToBank: TButton;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Button4: TButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Button6: TButton;
    ViewParentBanksID: TcxGridDBColumn;
    Button7: TButton;
    ViewParentBanksNAME: TcxGridDBColumn;
    ViewParentBanksColumn2: TcxGridDBColumn;
    Panel9: TPanel;
    EdCurrName: TcxTextEdit;
    Label3: TLabel;
    Button8: TButton;
    Button3: TButton;
    Button5: TButton;
    Panel3: TPanel;
    ProgressBarParse: TProgressBar;
    ProgressBarUpdate: TProgressBar;
    Panel10: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure ButParseNewDBClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure IBQueryBankCalcFields(DataSet: TDataSet);
    procedure ButRefreshClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure butSetToBankClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure DBTreeListFocusedNodeChanged(Sender: TcxCustomTreeList;
      APrevFocusedNode, AFocusedNode: TcxTreeListNode);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    AfterLOad:Boolean;
    MergeDataBankNBU :TMergeDataBankNBU;
    Procedure UpateNotActiveByView(aView:TcxGridDBTableView);
    Procedure UpateToBankByView(aView:TcxGridDBTableView;IdParentBank:Integer);
    Procedure UpdateNewName(IdBank:Integer;NewName:Widestring);
    procedure RefreshTree;
    { Private declarations }
  public
    AutoParserParam:String;
    { Public declarations }
  end;

var
  FmMain: TFmMain;

implementation

uses cxGridDBDataDefinitions;

{$R *.dfm}

procedure TFmMain.Button1Click(Sender: TObject);
var Path:widestring;
    res:TInfoBankArr;
    i,j:integer;
    resAll:TInfoBankAllArr;
begin
  Path:=ExtractFilePath( Application.ExeName )+'Test\';
  resAll:= MergeDataBankNBU.parseLastAll(ProgressBarParse);

  for i:=0 to Length(resAll)-1 do
  begin
   if resAll[i].bank.ISEP<>'' then
   begin
     Memo1.Lines.Add( resAll[i].bank.FULLNAME +'  MFO: '+resAll[i].bank.MFO+' '+resAll[i].bank.ADRESS );
     for j:=0 to Length(resAll[i].Detail)-1 do

       Memo1.Lines.Add('          '+myIfThen(resAll[i].Detail[j].NCKS='','****** ','') + resAll[i].Detail[j].Name+'  MFO: '+resAll[i].Detail[j].MFO);
     Memo1.Lines.Add('-----------------------------------------');
   end;
  end;

end;

procedure TFmMain.ButParseNewDBClick(Sender: TObject);
begin
 MergeDataBankNBU.parseLastAndUpdate( ProgressBarParse , ProgressBarUpdate );
 if CompareText( AutoParserParam , 'new' )=0 then Close;
end;

procedure TFmMain.FormShow(Sender: TObject);
begin
  PageControl.ActivePageIndex:=0;
  if CompareText( AutoParserParam , 'new' )=0 then
  begin
    self.WindowState:=wsNormal;
    ParsePanel.Visible:=false;
    self.Width:=500;
    self.Height:=76;
    Application.ProcessMessages;
    ButParseNewDB.Click;
  end;
end;

Procedure TFmMain.UpateNotActiveByView(aView:TcxGridDBTableView);
var i:integer;
    CurrBankId:String;
    SqlUpdate:String;
begin
  for i:=0 to aView.DataController.Controller.SelectedRecordCount-1 do
  begin
   CurrBankId:=aView.DataController.Controller.SelectedRecords[i].DisplayTexts[0];
   SqlUpdate:='UPDATE BANKS SET D_CLOSE = ''31.12.2016 00:00:00'' where BANKID='+CurrBankId;
   IBQueryExec.SQL.Text:= SqlUpdate;
   IBQueryExec.ExecSQL;
  end;
  //****************************

  SqlUpdate:='UPDATE BANKS SET D_CLOSE = ''31.12.2016 00:00:00'' where BANKID='+IBQueryBank.FieldByName('BANKID').AsString;
  IBQueryExec.SQL.Text:= SqlUpdate;
  IBQueryExec.ExecSQL;
end;

Procedure TFmMain.UpateToBankByView(aView:TcxGridDBTableView;IdParentBank:Integer);
var i:integer;
    CurrBankId:String;
    SqlUpdate:String;
begin
  for i:=0 to aView.DataController.Controller.SelectedRecordCount-1 do
  begin
   CurrBankId:=aView.DataController.Controller.SelectedRecords[i].DisplayTexts[0];
   SqlUpdate:='UPDATE BANKS SET PARENTID = ' +IntToStr(IdParentBank) +' where BANKID='+CurrBankId;
   IBQueryExec.SQL.Text:= SqlUpdate;
   IBQueryExec.ExecSQL;
  end;
end;

Procedure TFmMain.UpdateNewName(IdBank:Integer;NewName:Widestring);
var SqlUpdate:String;
begin
 ReplaseON(NewName,#39,'@#@#@');
 ReplaseON(NewName,'@#@#@',#39#39);

 SqlUpdate:='UPDATE BANKS SET NAME = ''' +NewName +''' where BANKID='+IntToStr( IdBank );
 IBQueryExec.SQL.Text:= SqlUpdate;
 IBQueryExec.ExecSQL;
end;

procedure TFmMain.IBQueryBankCalcFields(DataSet: TDataSet);
var StartIndex:Integer;
    aText:Widestring;
begin
 if DataSet.FieldByName('PARENTID').AsString<>'' then
 begin
  try
   if DataSet.FieldByName('NAME').AsString<>'' then
     aText:= ParseTextInQuotes(DataSet.FieldByName('NAME').AsString , StartIndex,'"','"')
   else aText:='';

   if aText<>'' then
    DataSet.FieldByName('CalBANK').AsString := trim(aText)
   else
     DataSet.FieldByName('CalBANK').AsString := DataSet.FieldByName('NAME').AsString;
  except
   ShowMessage(DataSet.FieldByName('NAME').AsString );
  end;
 end;
end;

procedure TFmMain.ButRefreshClick(Sender: TObject);
var aText:Widestring;
begin
 IBQueryMasterBank.Close;
 IBQueryParentBank.Close;
 if EdTextLike.Text<>'' then
 BEGIN
   aText:=IBQueryBank.FieldByName('CalBANK').AsString;

   ReplaseON(aText,#39,'@#@#@');
   ReplaseON(aText,'@#@#@',#39#39);

   IBQueryParentBank.SQL.Text := 'select * from BANKS where UPCASE(NAME) LIKE ''%'+AnsiUpperCase(aText)+'%''';
   IBQueryParentBank.Open;

   IBQueryMasterBank.SQL.Text:='select * from BANKS where PARENTID = 99999 and UPCASE(NAME) LIKE ''%'+AnsiUpperCase(EdTextLike.Text)+'%''';
   IBQueryMasterBank.Open;
 end;
end;

procedure TFmMain.SpeedButton1Click(Sender: TObject);
begin
   IBQueryParentBank.Open;
   IBQueryParentBank.SQL.Text := 'select * from BANKS where UPCASE( NAME ) LIKE ''%'+AnsiUpperCase(EdTextLike.Text)+'%''';
   IBQueryParentBank.Open;
end;

procedure TFmMain.RefreshTree;
var SaveID:Integer;
begin
 try
  IBQueryBank.Prior;
  SaveID := IBQueryBank.FieldByName('BANKID').AsInteger;
  DBTreeList.BeginUpdate;
  IBQueryBank.DisableControls;
  IBQueryBank.Close;
  IBQueryBank.Open;
  
 finally
  IBQueryBank.Locate('BANKID', SaveID,[]);
  IBQueryBank.EnableControls;
  DBTreeList.EndUpdate;
 end;
end;

procedure TFmMain.Button4Click(Sender: TObject);
begin
 UpateNotActiveByView( ViewDetail );
 RefreshTree;
end;

procedure TFmMain.Button6Click(Sender: TObject);
begin
 ViewDetail.DataController.Controller.SelectAll;
 UpateNotActiveByView( ViewDetail );
 RefreshTree;
end;

procedure TFmMain.Button7Click(Sender: TObject);
begin
 ViewDetail.DataController.Controller.SelectAll;
 butSetToBank.Click;
end;

procedure TFmMain.butSetToBankClick(Sender: TObject);
var IdParentPank:Integer;
begin
 ViewParentBanks.DataController.SelectRows(ViewParentBanks.DataController.Controller.FocusedRecordIndex,ViewParentBanks.DataController.Controller.FocusedRecordIndex);
 if ViewParentBanks.DataController.Controller.SelectedRecordCount<>0 then
 begin
  IdParentPank:=ViewParentBanks.DataController.Controller.SelectedRecords[0].Values[0];
  UpateToBankByView(ViewDetail ,IdParentPank );
  RefreshTree;
 end; 
end;

procedure TFmMain.DBTreeListFocusedNodeChanged(Sender: TcxCustomTreeList;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
var aText:Widestring;
begin
 if not Self.Showing then exit;

 aText:= IBQueryBank.FieldByName('CalBANK').AsString;
 ReplaseON(aText,#39,'@#@#@');
 ReplaseON(aText,'@#@#@',#39#39);
 EdTextLike.Text := aText;

 //aText:= IBQueryBank.FieldByName('NAME').AsString;
 EdCurrName.Text:= IBQueryBank.FieldByName('NAME').AsString;;
 ButRefresh.Click;
end;

procedure TFmMain.Button3Click(Sender: TObject);
begin
 IBQueryBank.Close;
 IBQueryBank.SQL.Text := 'select * from BANKS where D_CLOSE is NULL ';
 IBQueryBank.Open;
end;

procedure TFmMain.Button5Click(Sender: TObject);
begin
 IBQueryBank.Close;
 IBQueryBank.SQL.Text := 'select * from BANKS where D_CLOSE is NULL and ( BANKID =99999 or PARENTID = 99999) ';
 IBQueryBank.Open;
end;

procedure TFmMain.Button8Click(Sender: TObject);
begin
 UpdateNewName( IBQueryBank.FieldByName('BANKID').AsInteger , EdCurrName.text );
 RefreshTree;
 IBQueryBank.Next;
end;

procedure TFmMain.FormCreate(Sender: TObject);
begin
 AutoParserParam:='';
 try
   OptionSet := TOptionSet.Create;

   IBDatabase.Connected := False;
   IBDatabase.LoginPrompt := False;
   IBDatabase.Params.Values['password']:=' ';
   ChangeLogStrings(IBDatabase.Params);
   IBDatabase.Params.Values['password']:=Trim( IBDatabase.Params.Values['password'] );

   IBDatabase.DatabaseName := OptionSet.DatabaseFolder;
   IBDatabase.Params.Values['user_name']:='SYSDBA';

   MergeDataBankNBU:=TMergeDataBankNBU.Create( IBDatabase.DatabaseName , IBDatabase.Params.Values['user_name'] , IBDatabase.Params.Values['password'] );
   IBDatabase.Connected:=true;
   
 finally
  OptionSet.Destroy;
 end;
end;

procedure TFmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 MergeDataBankNBU.Close;
end;

end.

//select * from BANKS where UPCASE( NAME2 ) LIKE UPCASE('%Укргазбанк%')
