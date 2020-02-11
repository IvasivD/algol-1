unit UnitAdminRoleForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  cxLookupEdit, cxDBLookupEdit, cxDBExtLookupComboBox, cxMaskEdit,
  cxDropDownEdit, cxImageComboBox, StdCtrls, cxTextEdit, cxGroupBox,
  Buttons, ExtCtrls, Core, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,ServModDic,UnitProc,
  ImgList, cxCheckBox, dxSkinscxPCPainter, cxGridLevel, dxmdaset, Grids,UnitIBQuery,UnitAdoQuery,
  DBGrids, UnitHookControlChangeValue;

Const
    MessSelectUnitProgram = 'Виберіть складову туристичної програми';
type
  TFrmAdminRole = class(TForm)
    CtrlPanel: TPanel;
    cxGroupBox1: TcxGroupBox;
    edElementName: TcxTextEdit;
    Label7: TLabel;
    cmbElementKind: TcxImageComboBox;
    Label1: TLabel;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox3: TcxGroupBox;
    cmbUnitPrograms: TcxExtLookupComboBox;
    Label3: TLabel;
    Permis: TcxGridViewRepository;
    ViewTmUsersPermPr: TcxGridDBTableView;
    ViewTmUsersPermPrID: TcxGridDBColumn;
    ViewTmUsersPermPrAORDER: TcxGridDBColumn;
    ViewTmUsersPermPrNAME: TcxGridDBColumn;
    ViewTmUsersPermPrREALNAME: TcxGridDBColumn;
    ViewTmUsersPermPrShema: TcxGridDBTableView;
    ViewTmUsersPermPrShemaID: TcxGridDBColumn;
    ViewTmUsersPermPrShemaAORDER: TcxGridDBColumn;
    ViewTmUsersPermPrShemaID_PERMIS_TABLE: TcxGridDBColumn;
    ViewTmUsersPermPrShemaID_TMUSERS_PERM_PR: TcxGridDBColumn;
    ViewTmUsersPermPrShemaNAME: TcxGridDBColumn;
    ViewTmUsersPermPrShemaList: TcxGridDBTableView;
    ViewTmUsersPermPrShemaListID: TcxGridDBColumn;
    ViewTmUsersPermPrShemaListID_PERMIS_TABLE: TcxGridDBColumn;
    ViewTmUsersPermPrShemaListID_TMUSERS_PERM_PR: TcxGridDBColumn;
    ViewTmUsersPermPrShemaListAORDER: TcxGridDBColumn;
    ViewTmUsersPermPrShemaListNAME: TcxGridDBColumn;
    ViewTmUsersPermPrList: TcxGridDBTableView;
    ViewTmUsersPermPrListID: TcxGridDBColumn;
    ViewTmUsersPermPrListAORDER: TcxGridDBColumn;
    ViewTmUsersPermPrListNAME: TcxGridDBColumn;
    ViewTmUsersPermPrListREALNAME: TcxGridDBColumn;
    ViewUserCategoryPermis: TcxGridDBTableView;
    ViewUserCategoryPermisNAME: TcxGridDBColumn;
    ImageList: TImageList;
    Panel2: TPanel;
    GridUserCategoryDBTableView1: TcxGridDBTableView;
    GridUserCategoryLevel1: TcxGridLevel;
    GridUserCategory: TcxGrid;
    BtnSaveData: TBitBtn;
    CancelBtn: TBitBtn;
    ViewUserCategoryPermisELEMENT: TcxGridDBColumn;
    ViewUserCategoryPermisCOMENTELEMENT: TcxGridDBColumn;
    ViewUserCategoryPermisLAYOUTNAME: TcxGridDBColumn;
    ViewUserCategoryPermisKINDELEM: TcxGridDBColumn;
    ViewUserCategoryPermisCAN_INSERT: TcxGridDBColumn;
    ViewUserCategoryPermisCAN_UPDATE: TcxGridDBColumn;
    ViewUserCategoryPermisCAN_DELETE: TcxGridDBColumn;
    ViewUserCategoryPermisCAN_HIDE: TcxGridDBColumn;
    Panel3: TPanel;
    butRefresh: TSpeedButton;
    butAddUserCategory: TSpeedButton;
    butEditUserCategory: TSpeedButton;
    butDelUserCategory: TSpeedButton;
    MDUserCategory: TdxMemData;
    MDUserCategorySrc: TDataSource;
    ViewTmUsersPermLayoutList: TcxGridDBTableView;
    ViewTmUsersPermLayoutListID: TcxGridDBColumn;
    ViewTmUsersPermLayoutListNAME: TcxGridDBColumn;
    ViewTmUsersPermLayoutListAORDER: TcxGridDBColumn;
    ViewUserCategoryPermisID_TMUSERS_PERM_LAYOUT: TcxGridDBColumn;
    Label2: TLabel;
    edElementComment: TcxTextEdit;
    ViewUserCategoryPermisID: TcxGridDBColumn;
    procedure FormDestroy(Sender: TObject);
    procedure cmbElementKindPropertiesChange(Sender: TObject);
    procedure butRefreshClick(Sender: TObject);
    procedure butAddUserCategoryClick(Sender: TObject);
    procedure butEditUserCategoryClick(Sender: TObject);
    procedure butDelUserCategoryClick(Sender: TObject);
    procedure ViewUserCategoryPermisDblClick(Sender: TObject);
    procedure ViewUserCategoryPermisFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure BtnSaveDataClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edElementCommentPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FisChange :boolean;// HookControlChangeValue : THookControlChangeValue;
    function  FFindUnitProgramByElement( ElemName:String;ElemType:Integer):Variant;
    procedure FPrepareElements;
    procedure FprepareControls;
    procedure FRefreshChangeControl(Sender:TObject);
    procedure FRefreshControls;
    procedure FRefreshPermisUserCategory( ShowMessError:Boolean=True );
    procedure FRefreshDataPermisUserCategory;
    function  FSaveData:boolean;
    procedure FUpdateCurrDataPermis( ID_TMUSERS_PERM_LAYOUT,ID_TMUSERS_PERM_PR:Integer; ID_PERMIS_TABLE:variant;
                                     ELEMENT,ElementComment:String;KINDELEM,CAN_INSERT,CAN_UPDATE,CAN_DELETE,CAN_HIDE:Integer );
    procedure FDelDataPermis( ID, ID_TMUSERS_PERM_LAYOUT, ID_TMUSERS_PERM_PR, ID_PERMIS_TABLE:Integer;
                              ELEMENT : String; KINDELEM:integer  );
  public
    { Public declarations }
    procedure InitElements;
    procedure CloseElements;
    procedure Prepare( ElemName:String; ElemType:Integer; Comment:String=''  );
  end;

var
  FrmAdminRole: TFrmAdminRole;
  Elem_TMUSERS_PERM_PR : TDBShemaView;
  Elem_TMUSERS_PERM_PR_SHEMA : TDBShemaView;
  Elem_TMUSERS_PERM_LAYOUTQry : TDBShemaView;
  Elem_GetUserCategoryPermisQry : TDBShemaView;
  Elem_GetUserCategoryPermisMemQry : TDBShemaView;


procedure ShowAdminRole( ElemName:String; ElemType:Integer;Comment:String='' );

implementation

{$R *.dfm}

procedure ShowAdminRole( ElemName:String; ElemType:Integer; Comment:String='' );
begin
  try
    Application.CreateForm(TFrmAdminRole, FrmAdminRole);
    FrmAdminRole.Prepare( ElemName , ElemType, Comment );
    FrmAdminRole.ShowModal;
  finally
    FrmAdminRole.Free;
  end;
end;

procedure TFrmAdminRole.InitElements;
begin
  //Elem_UserCategory := TDBShemaView.Create( DMServDic.UserCategoryQry, ViewUserCategory, 'USER_CATEGORY', 'ID', 'gen_user_category_id', 'AORDER' );
  //Elem_UserCategory.ad

  Elem_TMUSERS_PERM_PR := TDBShemaView.Create( DMServDic.TMUSERS_PERM_PRQry, ViewTmUsersPermPr, 'TMUSERS_PERM_PR', 'ID', 'gen_tmusers_perm_pr_id','AORDER' );

  Elem_TMUSERS_PERM_PR_SHEMA := TDBShemaView.Create( DMServDic.TMUSERS_PERM_PR_SHEMAQry, ViewTmUsersPermPrShema, 'TMUSERS_PERM_PR_SHEMA', 'ID', 'gen_tmusers_perm_pr_shema_id','AORDER');
  Elem_TMUSERS_PERM_PR_SHEMA.AddMainElem( Elem_TMUSERS_PERM_PR , 'ID_TMUSERS_PERM_PR');
  Elem_TMUSERS_PERM_PR_SHEMA.ViewList := ViewTmUsersPermPrShemaList;

  Elem_TMUSERS_PERM_LAYOUTQry := TDBShemaView.Create( DMServDic.TMUSERS_PERM_LAYOUTQry, nil, 'TMUSERS_PERM_LAYOUT', 'ID', 'gen_tmusers_perm_layout_id','AORDER');
  Elem_TMUSERS_PERM_LAYOUTQry.ViewList := ViewTmUsersPermLayoutList;

  Elem_GetUserCategoryPermisQry :=  TDBShemaView.Create( DMServDic.GetGET_SIMPLE_PERMISQry, nil, '', 'ID', '');

  CloneAllFieldsDataset( Elem_GetUserCategoryPermisQry.DB, MDUserCategory, True );
  Elem_GetUserCategoryPermisMemQry :=  TDBShemaView.Create( MDUserCategory, ViewUserCategoryPermis, '', 'ID', '');

end;

procedure TFrmAdminRole.CloseElements;
begin
  //Elem_UserCategory.Close;
  Elem_TMUSERS_PERM_PR.Close;
  Elem_TMUSERS_PERM_PR_SHEMA.Close;
  Elem_TMUSERS_PERM_LAYOUTQry.Close;
  Elem_GetUserCategoryPermisQry.Close;
  Elem_GetUserCategoryPermisMemQry.Close;
end;

procedure TFrmAdminRole.FormDestroy(Sender: TObject);
begin
  CloseElements;
end;

procedure TFrmAdminRole.FprepareControls;
begin
  //SetPropInCxExtLookupComboBox( CmbUserCategory, TcxGridDBTableView( Elem_UserCategory.ViewList ) ,'NAME', Elem_UserCategory.FieldKod, True, False );
  SetPropInCxExtLookupComboBox( CmbUnitPrograms, TcxGridDBTableView( Elem_TMUSERS_PERM_PR_SHEMA.ViewList ) ,'NAME','ID_PERMIS_TABLE' , True, False );  //Elem_TMUSERS_PERM_PR_SHEMA.FieldKod
  FRefreshControls;
end;

function TFrmAdminRole.FFindUnitProgramByElement( ElemName:String;ElemType:Integer):Variant;
var DB:TDataset;
    Sql :String;
    ConDBParam : TConnectDBParam;
begin
  Sql :='select first 1 ID_PERMIS_TABLE from PERMIS_TABLE_DETAIL where Lower(ELEMENT) = Lower( '+#39+ElemName+#39+') and KINDELEM ='+IntToStr(ElemType);
  ConDBParam := Elem_TMUSERS_PERM_PR.DBGetParamConnect;

  if ConDBParam.IBDatabaseConnection<>nil then
    DB := UnitIBQuery.CreateDataSet( ConDBParam.PathDB, ConDBParam.UID, ConDBParam.Password, nil, Sql )
  else
  if ConDBParam.ADOConnection<>nil then
    DB := UnitAdoQuery.CreateDataSet( ConDBParam.ADOConnection, Sql );

  if not DB.IsEmpty then result := DB.FieldByName('ID_PERMIS_TABLE').asInteger
  else result := null;
end;


procedure TFrmAdminRole.FPrepareElements;
begin
  //Elem_UserCategory.DBOpen;
  Elem_TMUSERS_PERM_PR.DBOpen;

  if not Elem_TMUSERS_PERM_PR.DB.Locate( 'REALNAME', Elem_TMUSERS_PERM_PR.GetProgName,[] ) then
  begin
    Elem_TMUSERS_PERM_PR.DBInsert;
    Elem_TMUSERS_PERM_PR.DB.FieldByName('REALNAME').AsString := Elem_TMUSERS_PERM_PR.GetProgName;
    Elem_TMUSERS_PERM_PR.DBPost;
  end;

  Elem_TMUSERS_PERM_PR_SHEMA.DBOpen;
  Elem_TMUSERS_PERM_LAYOUTQry.DBOpen;
end;

procedure TFrmAdminRole.Prepare( ElemName:String; ElemType:Integer;  Comment:String='' );
begin
  InitElements;
  FPrepareElements;

  edElementName.Text := ElemName;
  cmbElementKind.EditValue:=ElemType;
  edElementComment.Text := Comment;


  cmbUnitPrograms.EditValue := FFindUnitProgramByElement( ElemName, ElemType );
  if (cmbUnitPrograms.EditValue = null )and(Elem_TMUSERS_PERM_PR_SHEMA.DBRecordCount = 1) then
    cmbUnitPrograms.EditValue :=Elem_TMUSERS_PERM_PR_SHEMA.DB.fieldByName('ID_PERMIS_TABLE').AsVariant;

  FRefreshPermisUserCategory( False );
  FisChange := False;
  FprepareControls;
  //FHookControlChangeValue := THookControlChangeValue.Create(self, FRefreshChangeControl );

end;

procedure TFrmAdminRole.FRefreshControls;
begin
  cmbUnitPrograms.Enabled := not Elem_TMUSERS_PERM_PR_SHEMA.DB.isEmpty;

  butAddUserCategory.Enabled := Elem_GetUserCategoryPermisQry.DB.Active;
  butEditUserCategory.Enabled := not Elem_GetUserCategoryPermisMemQry.DB.IsEmpty;
  butDelUserCategory.Enabled := not Elem_GetUserCategoryPermisMemQry.DB.IsEmpty;

  BtnSaveData.Enabled := FisChange;
end;

procedure TFrmAdminRole.FRefreshChangeControl(Sender:TObject);
begin
  FRefreshControls;
end;

procedure TFrmAdminRole.FRefreshPermisUserCategory( ShowMessError:Boolean=True );
begin
  if edElementName.Text ='' then exit;
  if cmbElementKind.EditValue =  null then exit;
  if (cmbUnitPrograms.EditValue = null)or( cmbUnitPrograms.EditValue = 0 ) then
  begin
    if ShowMessError then MyShowMessageDlg( MessSelectUnitProgram, mtInformation, but_OK );
    exit;
  end;

  //Elem_GetUserCategoryPermisQry.DBQuerySetParamValue('ID_User_Category', CmbUserCategory.EditValue );
  Elem_GetUserCategoryPermisQry.DBQuerySetParamValue('PROG_NAME', Elem_GetUserCategoryPermisQry.GetProgName );
  Elem_GetUserCategoryPermisQry.DBQuerySetParamValue('ID_PERMIS_TABLE', cmbUnitPrograms.EditValue );
  Elem_GetUserCategoryPermisQry.DBQuerySetParamValue('ELEMENT_NAME', edElementName.Text );
  Elem_GetUserCategoryPermisQry.DBQuerySetParamValue('ELEMENT_KIND', cmbElementKind.EditValue );
  Elem_GetUserCategoryPermisQry.DBOpen;
  if not Elem_GetUserCategoryPermisQry.DB.IsEmpty then FisChange := True;
  
  FRefreshDataPermisUserCategory;
  FRefreshControls;
end;


procedure TFrmAdminRole.FRefreshDataPermisUserCategory;
begin
  if not Elem_GetUserCategoryPermisQry.DB.Active then exit;
  if not Elem_GetUserCategoryPermisMemQry.DB.Active then Elem_GetUserCategoryPermisMemQry.DBOpen;

  try
    Elem_GetUserCategoryPermisMemQry.SaveMarkID;
    While not Elem_GetUserCategoryPermisMemQry.DB.Eof do Elem_GetUserCategoryPermisMemQry.DBDelete(False);
    CopyDB( Elem_GetUserCategoryPermisQry.DB, Elem_GetUserCategoryPermisMemQry.DB,[] );
  finally
    Elem_GetUserCategoryPermisMemQry.GotoMarkID;
  end;
end;

procedure TFrmAdminRole.FUpdateCurrDataPermis( ID_TMUSERS_PERM_LAYOUT,ID_TMUSERS_PERM_PR:Integer; ID_PERMIS_TABLE:variant;
                                               ELEMENT, ElementComment : String; KINDELEM,CAN_INSERT,CAN_UPDATE,CAN_DELETE,CAN_HIDE:Integer );
var StoredProc:TDataset;
begin

  try
    StoredProc:= DBCreateStoredProcDataSet( Elem_GetUserCategoryPermisQry.DBGetParamConnect, 'UPDATE_SIMPLE_PERMIS' ,
                                          ['ID_TMUSERS_PERM_LAYOUT',
                                          'ID_TMUSERS_PERM_PR',  'ID_PERMIS_TABLE', 'ELEMENT', 'ELEMENT_COMMENT',
                                          'KINDELEM',
                                          'CAN_INSERT',
                                          'CAN_UPDATE','CAN_DELETE','CAN_HIDE' ],
                                          [ftInteger, ftInteger, ftInteger, ftString,ftString, ftInteger, ftInteger, ftInteger, ftInteger, ftInteger ] );


    DBSetParamValue( StoredProc, 'ID_TMUSERS_PERM_LAYOUT', ID_TMUSERS_PERM_LAYOUT );
    DBSetParamValue( StoredProc, 'ID_TMUSERS_PERM_PR', ID_TMUSERS_PERM_PR );
    DBSetParamValue( StoredProc, 'ID_PERMIS_TABLE', ID_PERMIS_TABLE );
    DBSetParamValue( StoredProc, 'ELEMENT', ELEMENT );
    DBSetParamValue( StoredProc, 'ELEMENT_COMMENT', ElementComment );
    DBSetParamValue( StoredProc, 'KINDELEM', KINDELEM );
    DBSetParamValue( StoredProc, 'CAN_INSERT', CAN_INSERT );
    DBSetParamValue( StoredProc, 'CAN_UPDATE', CAN_UPDATE );
    DBSetParamValue( StoredProc, 'CAN_DELETE', CAN_DELETE );
    DBSetParamValue( StoredProc, 'CAN_HIDE', CAN_HIDE );
    DBStoredProcExec( StoredProc );

  finally
    DBDestroyStorProc( StoredProc );
  end;
end;

function TFrmAdminRole.FSaveData:boolean;
procedure UpdateProcCurr;
begin
 FUpdateCurrDataPermis( Elem_GetUserCategoryPermisMemQry.DB.FieldByName('ID_TMUSERS_PERM_LAYOUT').AsInteger,
                       Elem_TMUSERS_PERM_PR.GetValueId,
                       cmbUnitPrograms.EditValue,
                       edElementName.text,
                       edElementComment.Text,
                       cmbElementKind.EditValue,
                       Elem_GetUserCategoryPermisMemQry.DB.FieldByName('CAN_INSERT').AsInteger,
                       Elem_GetUserCategoryPermisMemQry.DB.FieldByName('CAN_UPDATE').AsInteger,
                       Elem_GetUserCategoryPermisMemQry.DB.FieldByName('CAN_DELETE').AsInteger,
                       Elem_GetUserCategoryPermisMemQry.DB.FieldByName('CAN_HIDE').AsInteger );
end;


begin
  result := False;
  Elem_GetUserCategoryPermisMemQry.DB.DisableControls;

  try
    Elem_GetUserCategoryPermisMemQry.SaveBookmark;

    Elem_GetUserCategoryPermisQry.DB.First;
    //************************************************
    while not Elem_GetUserCategoryPermisQry.DB.Eof do
    begin
      if Elem_GetUserCategoryPermisMemQry.DB.Locate( Elem_GetUserCategoryPermisMemQry.FieldKod,Elem_GetUserCategoryPermisQry.GetValueId,[] ) then
         UpdateProcCurr
      else
       FDelDataPermis( Elem_GetUserCategoryPermisQry.GetValueId,
                       Elem_GetUserCategoryPermisMemQry.DB.FieldByName('ID_TMUSERS_PERM_LAYOUT').AsInteger,
                       Elem_TMUSERS_PERM_PR.GetValueId,
                       cmbUnitPrograms.EditValue,
                       edElementName.text, cmbElementKind.EditValue );

      Elem_GetUserCategoryPermisQry.DB.Next;
    end;

    // Update Just Inserted to mem *******************
    Elem_GetUserCategoryPermisMemQry.DB.First;
    while not Elem_GetUserCategoryPermisMemQry.DB.Eof do
    begin
      if Elem_GetUserCategoryPermisMemQry.GetValueId = null then
        UpdateProcCurr;

      Elem_GetUserCategoryPermisMemQry.DB.Next;
    end;
    //************************************************
    result :=True;
  finally
    Elem_GetUserCategoryPermisMemQry.GotoBookmark;
    Elem_GetUserCategoryPermisMemQry.DB.EnableControls;
  end;

  FRefreshPermisUserCategory;   // Refresh Data
  FisChange := False;
  FRefreshControls;
end;

procedure TFrmAdminRole.FDelDataPermis( ID, ID_TMUSERS_PERM_LAYOUT, ID_TMUSERS_PERM_PR, ID_PERMIS_TABLE:Integer;
                                        ELEMENT : String; KINDELEM:integer );
var StoredProc:TDataset;
begin

  try
    StoredProc:= DBCreateStoredProcDataSet( Elem_GetUserCategoryPermisQry.DBGetParamConnect, 'DEL_SIMPLE_PERMIS' ,
                                          ['ID_TMUSERS_PERM_LAY_SHEM', 'ID_TMUSERS_PERM_LAYOUT',
                                          'ID_TMUSERS_PERM_PR',  'ID_PERMIS_TABLE', 'ELEMENT',
                                          'KINDELEM' ],
                                          [ftInteger,ftInteger, ftInteger, ftInteger, ftString, ftInteger ] );
    DBSetParamValue( StoredProc, 'ID_TMUSERS_PERM_LAY_SHEM', ID );
    DBSetParamValue( StoredProc, 'ID_TMUSERS_PERM_LAYOUT', ID_TMUSERS_PERM_LAYOUT );
    DBSetParamValue( StoredProc, 'ID_TMUSERS_PERM_PR', ID_TMUSERS_PERM_PR );
    DBSetParamValue( StoredProc, 'ID_PERMIS_TABLE', ID_PERMIS_TABLE );
    DBSetParamValue( StoredProc, 'ELEMENT', ELEMENT );
    DBSetParamValue( StoredProc, 'KINDELEM', KINDELEM );

    DBStoredProcExec( StoredProc );

  finally
    DBDestroyStorProc( StoredProc );
  end;

end;


procedure TFrmAdminRole.cmbElementKindPropertiesChange(Sender: TObject);
begin
  FRefreshControls;
end;

procedure TFrmAdminRole.butRefreshClick(Sender: TObject);
begin
  FRefreshPermisUserCategory;
end;

procedure TFrmAdminRole.butAddUserCategoryClick(Sender: TObject);
begin
  if Elem_GetUserCategoryPermisMemQry.DBInsert( True ) then
    FisChange := True;

  self.FRefreshControls;  
end;

procedure TFrmAdminRole.butEditUserCategoryClick(Sender: TObject);
begin
  if Elem_GetUserCategoryPermisMemQry.DBEdit( True ) then
    FisChange := True;

  self.FRefreshControls;
end;

procedure TFrmAdminRole.butDelUserCategoryClick(Sender: TObject);
begin
  Elem_GetUserCategoryPermisMemQry.DBDelete;

  if Elem_GetUserCategoryPermisMemQry.DBRecordCount<>Elem_GetUserCategoryPermisQry.DBRecordCount then
    FisChange := True;

  self.FRefreshControls;
end;

procedure TFrmAdminRole.ViewUserCategoryPermisDblClick(Sender: TObject);
begin
  butEditUserCategory.Click;
end;

procedure TFrmAdminRole.ViewUserCategoryPermisFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  //if Sender.IsControlFocused then
  FRefreshControls;
end;

procedure TFrmAdminRole.BtnSaveDataClick(Sender: TObject);
begin
  FSaveData;
end;

procedure TFrmAdminRole.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if BtnSaveData.Enabled then
    if MyShowMessageDlg( AskChangeDataSave, mtConfirmation, but_YES_NO ) = Res_YES then
       CanClose := self.FSaveData;
end;

procedure TFrmAdminRole.edElementCommentPropertiesChange(Sender: TObject);
begin
  FisChange := True;
end;

end.
