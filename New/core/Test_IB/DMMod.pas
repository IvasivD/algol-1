unit DMMod;

interface

uses
  SysUtils, Classes, DB, IBCustomDataSet, IBQuery, IBDatabase, core;

type
  TDM = class(TDataModule)
    IBDatabase: TIBDatabase;
    IBTransaction1: TIBTransaction;
    IBQuery1: TIBQuery;
    DataSource1: TDataSource;
    IBQuery1ID: TIntegerField;
    IBQuery1NAME: TIBStringField;
    IBQuery1ID2: TIntegerField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure IBQuery1PostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    procedure InitElements;
  public
    { Public declarations }
  end;

var
  DM: TDM;
  Elem_Test: TDBShemaView;
  
implementation

  

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  IBDatabase.LoginPrompt := False;
  IBDatabase.Connected := True;
  IBTransaction1.StartTransaction;
  IBQuery1.Open;
  InitElements;
end;

procedure TDM.InitElements;
begin
  Elem_Test := TDBShemaView.Create( IBQuery1, nil, 'TEST_TRANSACT', 'ID', 'gen_test_transact_id' );

end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  IBDatabase.Connected := False;
  FreeAllElements; 
end;

procedure TDM.IBQuery1PostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
 if ansiPos('lock conflict', E.Message )<>0 then  Action:= daRetry;
end;

end.
