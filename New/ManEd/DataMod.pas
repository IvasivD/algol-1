unit DataMod;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, IBCustomDataSet, IBQuery, IBDatabase, core, cxTL,
  cxGridTableView, cxGridBandedTableView, cxStyles, cxGridCardView,
  cxClasses;

type
  TDM = class(TDataModule)                  
    Database: TDatabase;
    FontDialog: TFontDialog;
    UsersSrc: TDataSource;
    IBDatabase: TIBDatabase;
    IBTransact: TIBTransaction;
    UsersQry: TIBQuery;
    LSheet: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    cxStyle69: TcxStyle;
    cxStyle70: TcxStyle;
    cxStyle71: TcxStyle;
    cxStyle72: TcxStyle;
    cxStyle73: TcxStyle;
    cxStyle74: TcxStyle;
    cxStyle75: TcxStyle;
    cxStyle76: TcxStyle;
    cxStyle77: TcxStyle;
    cxStyle78: TcxStyle;
    cxStyle79: TcxStyle;
    cxStyle80: TcxStyle;
    cxStyle81: TcxStyle;
    cxStyle82: TcxStyle;
    cxStyle83: TcxStyle;
    cxStyle84: TcxStyle;
    cxStyle85: TcxStyle;
    cxStyle86: TcxStyle;
    cxStyle87: TcxStyle;
    cxStyle88: TcxStyle;
    cxStyle89: TcxStyle;
    cxStyle90: TcxStyle;
    cxStyle91: TcxStyle;
    cxStyle92: TcxStyle;
    cxStyle93: TcxStyle;
    cxStyle94: TcxStyle;
    cxStyle95: TcxStyle;
    cxStyle96: TcxStyle;
    cxStyle97: TcxStyle;
    cxStyle98: TcxStyle;
    cxStyle99: TcxStyle;
    cxStyle100: TcxStyle;
    cxStyle101: TcxStyle;
    cxStyle102: TcxStyle;
    cxStyle103: TcxStyle;
    cxStyle104: TcxStyle;
    cxStyle105: TcxStyle;
    cxStyle106: TcxStyle;
    cxStyle107: TcxStyle;
    cxStyle108: TcxStyle;
    cxStyle109: TcxStyle;
    cxStyle110: TcxStyle;
    cxStyle111: TcxStyle;
    cxStyle112: TcxStyle;
    cxStyle113: TcxStyle;
    cxStyle114: TcxStyle;
    cxStyle115: TcxStyle;
    cxStyle116: TcxStyle;
    cxStyle117: TcxStyle;
    cxStyle118: TcxStyle;
    cxStyle119: TcxStyle;
    cxStyle120: TcxStyle;
    cxStyle121: TcxStyle;
    cxStyle122: TcxStyle;
    cxStyle123: TcxStyle;
    cxStyle124: TcxStyle;
    cxStyle125: TcxStyle;
    cxStyle126: TcxStyle;
    cxStyle127: TcxStyle;
    cxStyle128: TcxStyle;
    cxStyle129: TcxStyle;
    cxStyle130: TcxStyle;
    cxStyle131: TcxStyle;
    cxStyle132: TcxStyle;
    cxStyle133: TcxStyle;
    cxStyle134: TcxStyle;
    cxStyle135: TcxStyle;
    cxStyle136: TcxStyle;
    cxStyle137: TcxStyle;
    cxStyle138: TcxStyle;
    cxStyle139: TcxStyle;
    cxStyle140: TcxStyle;
    cxStyle141: TcxStyle;
    cxStyle142: TcxStyle;
    cxStyle143: TcxStyle;
    cxStyle144: TcxStyle;
    cxStyle145: TcxStyle;
    cxStyle146: TcxStyle;
    cxStyle147: TcxStyle;
    cxStyle148: TcxStyle;
    cxStyle149: TcxStyle;
    cxStyle150: TcxStyle;
    cxStyle151: TcxStyle;
    cxStyle152: TcxStyle;
    cxStyle153: TcxStyle;
    cxStyle154: TcxStyle;
    cxStyle155: TcxStyle;
    cxStyle156: TcxStyle;
    cxStyle157: TcxStyle;
    cxStyle158: TcxStyle;
    cxStyle159: TcxStyle;
    cxStyle160: TcxStyle;
    cxStyle161: TcxStyle;
    cxStyle162: TcxStyle;
    cxStyle163: TcxStyle;
    cxStyle164: TcxStyle;
    cxStyle165: TcxStyle;
    cxStyle166: TcxStyle;
    cxStyle167: TcxStyle;
    cxStyle168: TcxStyle;
    cxStyle169: TcxStyle;
    cxStyle170: TcxStyle;
    cxStyle171: TcxStyle;
    cxStyle172: TcxStyle;
    cxStyle173: TcxStyle;
    cxStyle174: TcxStyle;
    cxStyle175: TcxStyle;
    cxStyle176: TcxStyle;
    cxStyle177: TcxStyle;
    cxStyle178: TcxStyle;
    cxStyle179: TcxStyle;
    cxStyle180: TcxStyle;
    cxStyle181: TcxStyle;
    cxStyle182: TcxStyle;
    cxStyle183: TcxStyle;
    cxStyle184: TcxStyle;
    cxStyle185: TcxStyle;
    cxStyle186: TcxStyle;
    cxStyle187: TcxStyle;
    cxStyle188: TcxStyle;
    cxStyle189: TcxStyle;
    cxStyle190: TcxStyle;
    cxStyle191: TcxStyle;
    cxStyle192: TcxStyle;
    cxStyle193: TcxStyle;
    cxStyle194: TcxStyle;
    cxStyle195: TcxStyle;
    cxStyle196: TcxStyle;
    cxStyle197: TcxStyle;
    cxStyle198: TcxStyle;
    cxStyle199: TcxStyle;
    cxStyle200: TcxStyle;
    cxStyle201: TcxStyle;
    cxStyle202: TcxStyle;
    cxStyle203: TcxStyle;
    cxStyle204: TcxStyle;
    cxStyle205: TcxStyle;
    cxStyle206: TcxStyle;
    cxStyle207: TcxStyle;
    cxStyle208: TcxStyle;
    cxStyle209: TcxStyle;
    cxStyle210: TcxStyle;
    cxStyle211: TcxStyle;
    cxStyle212: TcxStyle;
    cxStyle213: TcxStyle;
    DBCardStyle: TcxGridCardViewStyleSheet;
    DBBandedStyle: TcxGridBandedTableViewStyleSheet;
    DBOtherStyle: TcxGridBandedTableViewStyleSheet;
    DBMonitorStyle: TcxGridBandedTableViewStyleSheet;
    GridTableViewStyle: TcxGridTableViewStyleSheet;
    MyStyle: TcxGridTableViewStyleSheet;
    MyStyleTree: TcxTreeListStyleSheet;
    UsersQryID: TIntegerField;
    UsersQryNAME: TIBStringField;
    UsersQrySECONDNAME: TIBStringField;
    UsersQryTMUSERINFO1: TIBStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FCurManager: Integer;
    FCurManPerm: Integer;
    FCurManagerName: String;
    procedure InitElements;
    procedure CloseAllElements;
  public
    function CheckCanWork(ManId: Integer): Boolean;
    procedure UpdateManagerQry;
    property CurManager: Integer read FCurManager write FCurManager;
    property CurManPerm: Integer read FCurManPerm write FCurManPerm;
    property CurManagerName: String read FCurManagerName;
  end;

var
  DM: TDM;
  Elem_UsersQry :TDBShemaView;

implementation

uses OptSet, TourMbplIf, TourDbUn, FrmProgress, UnitUserPermission;

{$R *.DFM}

{ DM }
function TDM.CheckCanWork(ManId: Integer): Boolean;
begin
  Result := True;
  FCurManagerName :=
    Elem_UsersQry.DB.FieldByName('NAME').AsString + #32 + Elem_UsersQry.DB.FieldByName('secondname').AsString;

{  with ManagerTable do
  begin
    if not Active then Open;
    Result := Locate('TMUSERID', ManId, []);
    if Result then
      CurManPerm := ManagerTableTMPERMLEVEL.Value else CurManPerm := 0;
    FCurManagerName :=
      ManagerTableTMUSERNAME.Value + #32 + ManagerTableTMUSERSURNAME.Value;
  end;   }
end;

procedure TDM.UpdateManagerQry;
var Id: Integer;
begin
  Elem_UsersQry.DBQuerySetParamValue('USERID', CurManager);
  Elem_UsersQry.DBReOpen;
{  with ManagerQry do
  begin
    if Active then Id := ManagerQryTMUSERID.Value else Id := 0;
    Filter := Format('TMUSERID = %d', [CurManager]);
  end;
  UpdateQuery(ManagerQry);
  if Id <> 0 then ManagerQry.Locate('TMUSERID', Id, []);  }
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
  OptionSet := TOptionSet.Create;
  Database.Connected := False;
  Database.LoginPrompt := False;
  FCurManager := 0;
  FCurManPerm := 0;
  FCurManagerName := '';
  Database.Params.Values['SERVER NAME'] := OptionSet.DatabaseFolder;
  ChangeLogStrings(Database.Params);
  PrepareConnectDatabeseTourManTest( IBDatabase,True );
//  PrepareConnectDatabeseTourManWork( IBDatabase,True );
  InitElements;
end;

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  if Assigned(OptionSet) then OptionSet.Free;
  CloseAllElements;
end;

procedure TDM.InitElements;
var Progres : TProgressFormProp;
    LogFieldNames : TLogFields;
begin
  try
    Progres := ShowProgress( WaitFormCaption );

    LogFieldNames := GetStructRecLogFiles;
    Elem_UsersQry := TDBShemaView.Create( UsersQry, nil, 'TMUSERS_INFO', 'ID', 'gen_tmusers_info_id' );

    ElemUserRole := TRoleShema.Create( ExtractFileName(Application.ExeName), Elem_UsersQry.DBGetParamConnect, True);
    SetLogForAllElements( Elem_UsersQry, 'MANAGER', 'LOG', 'LOG_ADD', LogFieldNames, cxStyle213 );

  finally
    ClosedProgress( Progres.FormProgres );
  end;
end;

procedure TDM.CloseAllElements;
begin
  FreeAllElements;
end;

end.
