unit MngrDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBCtrls, DBTables, UnitADOQuery, UnitIBQuery, UnitProc,
  IBCustomDataSet, ADODB, cxStyles, cxCustomData, cxGraphics, cxFilter,
  cxData, cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
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
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,Core,
  cxDBExtLookupComboBox, cxTL, cxGridBandedTableView, cxGridCardView,variants,
  cxCheckBox;


const
  fId = 'TmUserId';
  //fName = 'TmUserName';
  //fLogin = 'TmLogin';
  fPass = 'TMUSERINFO1';
  nMaxManPass = 3;

type
  TManagerDlg = class(TForm)
    Label1: TLabel;
    PassLabel: TLabel;
    ManagerQry: TQuery;
    ManagerSrc: TDataSource;
    ManagerQryTMUSERID: TIntegerField;
    ManagerQryMANAGER: TStringField;
    ManagerQryTMNAME2: TStringField;
    ManagerQryTMPERMLEVEL: TIntegerField;
    ManagerQryTMUSERINFO1: TStringField;
    NewYearImage: TImage;
    CtrlPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    cxGridViewRepository1: TcxGridViewRepository;
    ViewUserList: TcxGridDBTableView;
    ViewUserListTMUSERID: TcxGridDBColumn;
    ViewUserListMANAGER: TcxGridDBColumn;
    ViewUserListTMNAME2: TcxGridDBColumn;
    ViewUserListTMUSERINFO1: TcxGridDBColumn;
    ViewUserListTMPERMLEVEL: TcxGridDBColumn;
    cxNameDBLookupComboBox: TcxExtLookupComboBox;
    Bevel1: TBevel;
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
    cxStyle214: TcxStyle;
    cxStyle215: TcxStyle;
    cxStyle216: TcxStyle;
    DBCardStyle: TcxGridCardViewStyleSheet;
    DBBandedStyle: TcxGridBandedTableViewStyleSheet;
    DBOtherStyle: TcxGridBandedTableViewStyleSheet;
    DBMonitorStyle: TcxGridBandedTableViewStyleSheet;
    GridTableViewStyle: TcxGridTableViewStyleSheet;
    MyStyle: TcxGridTableViewStyleSheet;
    MyStyleTree: TcxTreeListStyleSheet;
    PassEdit: TcxTextEdit;
    ChAdministration: TcxCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FManPass: Integer;
    //FDB:TDataset;
    FSqlSelManager:String;
    function CheckManagerIsAdmin( aDB:TDataset ):boolean;
    function CheckManager: Boolean; overload;
    function CheckManPass: Boolean; overload;
    function GetManagerId: Integer;

    function CheckManager(aDB:TDataset): Boolean; overload;
    function CheckManPass(aDB:TDataset): Boolean; overload;
    procedure PrepareQry;
    procedure SetManagerId(Value: Integer);
    procedure ToggleImage;
  protected
    property ManagerId: Integer read GetManagerId write SetManagerId;
  end;

var
  ManagerDlg: TManagerDlg;

function ExecuteManagerDlg(const Database, Title: string; var ManId: Integer): Boolean;overload;
function ExecuteManagerDlg( DBParam:TConnectDBParam; Title: string; var ManId: Integer; var AdminControl:Boolean; SqlSqlManager:String='' ): Boolean;overload;
function ExecuteManagerPermDlg( const Database, Title: string; var ManId: Integer; var Perm: Integer ): Boolean;
function ExecuteManagerSignDlg(const Database, Title: string; ManId: Integer): Boolean;

function ListCommonManagerDlg( DBParam:TConnectDBParam; ManId: Integer;  aSqlSelManager:String ): variant;
function ExecuteCommonManagerDlg(const Database, Title: string; Sign: Boolean; var ManId: Integer; var Perm: Integer): Boolean; overload;
function ExecuteCommonManagerDlg( DBParam:TConnectDBParam; Title: string; Sign: Boolean; var ManId: Integer; var AdminControl : Boolean; aSqlSelManager:String ): Boolean;overload;
function GetSqlUSer( DBParam:TConnectDBParam; ProgName:String ):WideString;
function CheckUserSignature( DBParam:TConnectDBParam; ManId: Integer; pass:widestring):boolean;

implementation

//uses DataMod;

uses TourMbplIf,  TourConsts, OptSet, Math;

{$R *.DFM}
function GetSQLUserIB( ProgName:String ):Widestring;
begin
  Result := ' select TM.id TmUserId, TM.tmuserinfo1, get_Manager(TM.id) as Manager, CHECK_ADMIN_USER(TM.id) IsAdmin from tmusers_info TM '+
   'left join COMPPERSONS on TM.comppersonid = COMPPERSONS.personid '+
   'where (( COMPPERSONS.dismissed is null) or (COMPPERSONS.dismissed = ''F'')) '+
   'and  ( exists (select first 1 *  from GET_USER_PERMISSIONS( TM.id,'''+ProgName+''' ) )  )';

   //'exists (select ID_TMUSER_INFO from GET_USER_PERMISSIONS( tmusers_info.comppersonid ,'''+ProgName+''' ) ) and '+
end;

function GetSQLUserADO( ProgName:String ):Widestring;
begin
  Result := ' select TM.id TmUserId, TM.tmuserinfo1, Concat( COMPPERSONS.secondname,'' '',COMPPERSONS.name) as Manager from tmusers_info TM '+
   'left join COMPPERSONS on TM.comppersonid = COMPPERSONS.personid '+
   'where (( COMPPERSONS.dismissed is null) or (COMPPERSONS.dismissed = ''F'')) '+
   'and  ( exists (select first 1 *  from GET_USER_PERMISSIONS( TM.id,'''+ProgName+''' ) )  )';
end;

function GetSqlUserInfo(ID_UserInfo:Integer):widestring;
begin
  result := 'select TM.* from tmusers_info TM where TM.id='+intToStr(ID_UserInfo);
end;

function GetSqlUSer( DBParam:TConnectDBParam; ProgName:String ):WideString;
begin
  if DBParam.IBDatabaseConnection<>nil then
    result := GetSQLUserIB( ProgName )
  else
  if DBParam.ADOConnection<>nil then
    result := GetSQLUserADO( ProgName );
end;

function GetSqlUSerDB( DBParam:TConnectDBParam; ProgName:String; aSqlSelManager:String='' ):TDataset;
var aSql:String;
begin
  result := nil;
  if DBParam.TypeConnect = optTypeConIB then
  begin
    if aSqlSelManager = '' then aSql :=GetSQLUser(DBParam, ExtractFileName( Application.ExeName))
    else aSql := aSqlSelManager;
    result := UnitIBQuery.CreateDataSet( DBParam.PathDB, DBParam.UID, DBParam.Password, nil, aSql );
  end
  else
  if DBParam.TypeConnect = optTypeConAdo then
  begin
    if aSqlSelManager = '' then aSql := GetSQLUser(DBParam, ExtractFileName( Application.ExeName) )
    else aSql := aSqlSelManager;

    result := UnitAdoQuery.CreateDataSet( DBParam.ADOConnection, aSql );
  end;
end;

function ExecuteCommonManagerDlg(const Database, Title: string;
  Sign: Boolean; var ManId: Integer; var Perm: Integer): Boolean;
begin
  with TManagerDlg.Create(Application) do
  try
    ManagerQry.DatabaseName := Database;
    ManagerQry.ParamByName('Perm').Value := Perm;
    ManagerId := IfThen(ManId > 0, ManId, OptionSet.LastOpManager);
    if UpperCase(OptionSet.DatabaseFolder) = SPathTestBase then
      PassEdit.Text := STestPass;

    cxNameDBLookupComboBox.Enabled := not Sign;
    Caption := Caption + ':'#32 + Title;
    Result := ShowModal = mrOk;
    if Result then
    begin
      ManId := ManagerId;
      Result := ManId > 0;
      if Result and (ManagerQry.FieldByName('TMUSERID').Value = ManId) then
        Perm := ManagerQry.FieldByName('TMPERMLEVEL').Value;
      OptionSet.LastOpManager := ManId;
    end;
  finally
    Free;
  end;
end;

function ListCommonManagerDlg( DBParam:TConnectDBParam; ManId: Integer;  aSqlSelManager:String ): variant;
var aMngId:Integer;
    aDB:TDataset;
    aSql:String;
begin
  try
    Application.CreateForm(TManagerDlg, ManagerDlg);

    ManagerDlg.PassLabel.Visible:=False;
    ManagerDlg.PassEdit.Visible:=False;

    aDB:= GetSqlUSerDB( DBParam, ExtractFileName( Application.ExeName), aSqlSelManager );
    if aDB = nil then exit;

    aMngId := IfThen(ManId > 0, ManId, OptionSet.LastOpManager);
    ManagerDlg.ManagerSrc.DataSet := aDB;
    ManagerDlg.cxNameDBLookupComboBox.EditValue := aMngId;

    Result := ManagerDlg.ShowModal = mrOk;
    if Result then
      result := ManagerDlg.ManagerId
    else result := null;

  finally
    DestroyDB( aDB );
    ManagerDlg.free;
  end;
end;

function ExecuteCommonManagerDlg( DBParam:TConnectDBParam; Title: string;
  Sign: Boolean; var ManId: Integer; var AdminControl: Boolean; aSqlSelManager:String ): Boolean;
var aMngId:Integer;
    aDB:TDataset;
    aSql:String;
begin
  try
    Result := false;
    Application.CreateForm(TManagerDlg, ManagerDlg);
    //ManagerDlg.cxNameDBLookupComboBox.Properties.KeyFieldNames :='ID';
    if UpperCase(OptionSet.DatabaseFolder) = SPathTestBase then
      ManagerDlg.PassEdit.Text := STestPass;
    aDB:= GetSqlUSerDB( DBParam, ExtractFileName( Application.ExeName), aSqlSelManager );
    if aDB = nil then exit;

    aMngId := IfThen(ManId > 0, ManId, OptionSet.LastOpManager);
    ManagerDlg.ManagerSrc.DataSet := aDB;
    ManagerDlg.cxNameDBLookupComboBox.EditValue := aMngId;

    Result := ManagerDlg.ShowModal = mrOk;
    if Result then
    begin
      ManId := ManagerDlg.ManagerId;
      AdminControl  := ManagerDlg.ChAdministration.Checked;
      Result := ManId > 0;
      //if Result and ( aDB.FieldByName('TmUserId').Value = ManId) then
      //  Perm :=  aDB.FieldByName('TMPERMLEVEL').Value;
      OptionSet.LastOpManager := ManId;
    end;

  finally
    DestroyDB( aDB );
    ManagerDlg.free;
  end;

end;

function ExecuteManagerDlg(const Database, Title: string; var ManId: Integer): Boolean;
var Perm: Integer;
begin
  Perm := 1;
  Result := ExecuteCommonManagerDlg(Database, Title, False, ManId, Perm)
    and (Perm > 0);
end;

function ExecuteManagerDlg( DBParam:TConnectDBParam; Title: string; var ManId: Integer;var AdminControl:Boolean; SqlSqlManager:String=''  ): Boolean;
begin

  AdminControl := False;
  Result := ExecuteCommonManagerDlg(DBParam, Title, False, ManId, AdminControl, SqlSqlManager);
end;

function ExecuteManagerPermDlg(
  const Database, Title: string; var ManId: Integer; var Perm: Integer): Boolean;
begin
  Perm := 0;
  Result := ExecuteCommonManagerDlg(Database, Title, False, ManId, Perm);
end;

function ExecuteManagerSignDlg(const Database, Title: string; ManId: Integer): Boolean;
var Perm: Integer;
begin
  Perm := 0;
  Result := ExecuteCommonManagerDlg(Database, Title, True, ManId, Perm);
end;

{ TManagerDlg }

function TManagerDlg.CheckManager: Boolean;
var Id: Integer;
begin
  Id := GetManagerId;
  Result := (Id <> 0) and ManagerQry.Locate(fId, GetManagerId, []);
end;

function TManagerDlg.CheckManager(aDB:TDataset): Boolean;
var Id: Integer;
begin
  Id := GetManagerId;
  Result := (Id <> 0) and aDB.Locate(fId, GetManagerId, []);
end;

function TManagerDlg.CheckManagerIsAdmin( aDB:TDataset ):boolean;
begin
  result := aDB.FieldByName('ISADMIN').asInteger = 1;
end;

function TManagerDlg.CheckManPass: Boolean;
begin
  Inc(FManPass);
  Result := PassEdit.Text = GetInfoServStr(ManagerQry.FieldByName('TMUSERINFO1').Value);
  if not Result then
  begin
    PassEdit.Clear;
    ActiveControl := cxNameDBLookupComboBox;
    MyShowMessageDlg( Format( SManPwFrmInputError, [PassLabel.Caption] ), mtError, but_OK );
    //ErrorFmtDlg(SManPwFrmInputError, [PassLabel.Caption]);
  end;
end;

function CheckUserPass( aDB:TDataset;Pass:widestring;ShowMessError:Boolean= true ): Boolean;
begin
  Result := Pass = GetInfoServStr( aDB.fieldByName(fPass).asString );
  if not Result then
  begin
    if ShowMessError then
      MyShowMessageDlg(Format(SManPwFrmInputError, [ 'Пароль' ]), mtError, but_OK );
  end;
end;


function TManagerDlg.CheckManPass( aDB:TDataset ): Boolean;
begin
  Inc(FManPass);
  result := False;
  if PassEdit.Visible and not CheckUserPass( aDB, PassEdit.Text ) then
  begin
    PassEdit.Clear;
    PassEdit.SetFocus;
  end
  else result := True;

  {Result := PassEdit.Text = GetInfoServStr( aDB.fieldByName(fPass).asString );
  if not Result then
  begin
    PassEdit.Clear;
    MyShowMessageDlg(Format(SManPwFrmInputError, [PassLabel.Caption ]), mtError, but_OK );
    PassEdit.SetFocus;
  end;}
end;

function TManagerDlg.GetManagerId: Integer;
begin
  try
    Result := cxNameDBLookupComboBox.EditValue;
  except
    Result := 0;
  end;
end;

procedure TManagerDlg.PrepareQry;
begin
  with ManagerQry do
  begin
    if Active then Close;
    Prepare;
    Open;
  end;
end;            

procedure TManagerDlg.SetManagerId(Value: Integer);
begin
  PrepareQry;        
  ManagerQry.Locate(fId, Value, []);
  cxNameDBLookupComboBox.EditValue := Value;
  if Value > 0 then ActiveControl := PassEdit;
end;

procedure TManagerDlg.ToggleImage;
var Year, Month, Day: Word;
begin
  DecodeDate(Now, Year, Month, Day);
  NewYearImage.Visible :=
    (Month = 12) and (Day > 23) or (Month = 1) and (Day < 10);
end;

procedure TManagerDlg.FormCreate(Sender: TObject);
begin
  inherited;
  FManPass := 0;
  ToggleImage;
end;

procedure TManagerDlg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOk then
  begin

    if not CheckManager( ManagerSrc.DataSet ) then ModalResult := mrCancel
    else if not CheckManPass( ManagerSrc.DataSet ) then
    begin
      if FManPass < nMaxManPass then CanClose := False
      else ModalResult := mrCancel;
    end;

  end;
end;

function CheckUserSignature( DBParam:TConnectDBParam; ManId: Integer; pass:widestring):boolean;
var aDB:TDataset;
    Sql:Widestring;
begin
  Sql := GetSqlUserInfo(ManId);
  try
    aDB := DBCreate( Sql, nil, DBParam );
    result := CheckUserPass( aDB, Pass, false );
  finally
    DestroyDB( aDB );
  end;
end;

procedure TManagerDlg.FormShow(Sender: TObject);
begin
  if PassEdit.Visible then PassEdit.SetFocus;
end;

procedure TManagerDlg.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ( Key = VK_F5 ) and (ssCtrl in Shift  )and ( ssShift in Shift ) and
     ( PassEdit.Visible ) and
     ( CheckManPass( ManagerSrc.DataSet ) ) and ( CheckManagerIsAdmin(ManagerSrc.DataSet) ) then
    ChAdministration.Visible:= not ChAdministration.Visible;
end;

end.
