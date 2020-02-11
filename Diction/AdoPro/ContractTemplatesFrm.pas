unit ContractTemplatesFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, StdCtrls, Buttons,
  ExtCtrls,  DBGrids, ComCtrls, ToolWin, Menus, CLIPBrd,
  ActnList, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxClasses, cxGridLevel, cxGrid, cxGridCustomTableView, IBQuery,
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
  dxSkinTheAsphaltWorld, dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, UnitExportWord, WordXP, OleServer;

type
  TContractTemplatesForm = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    BookMarkSelectBtn: TSpeedButton;
    BookMarkUnSelectBtn: TSpeedButton;
    Splitter1: TSplitter;
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    IsEnterprRadioButton: TRadioButton;
    IsBsmanRadioButton: TRadioButton;
    IsPrivateRadioButton: TRadioButton;
    EntrpFileNameLabel: TLabel;
    BsnmFileNameLabel: TLabel;
    IndvdFileNameLabel: TLabel;
    ToolBar1: TToolBar;
    SelectShablonBtn: TBitBtn;
    CheckBookmarkBitBtn: TBitBtn;
    TabSheet3: TTabSheet;
    ErrandLabel: TLabel;
    CliboardPopupMenu: TPopupMenu;
    N1: TMenuItem;
    PopupMenu: TPopupMenu;
    ActionList: TActionList;
    CopyAction: TAction;
    PasteAction: TAction;
    N2: TMenuItem;
    N3: TMenuItem;
    TourVendorTabSheet: TTabSheet;
    TourVendorGridLevel: TcxGridLevel;
    TourVendorGrid: TcxGrid;
    ContractGridLevel1: TcxGridLevel;
    ContractGrid: TcxGrid;
    CntrTemplGridLevel1: TcxGridLevel;
    CntrTemplGrid: TcxGrid;
    SelTemplGridLevel1: TcxGridLevel;
    SelTemplGrid: TcxGrid;
    CtrlPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    WordDocum: TWordDocument;
    WordApplic: TWordApplication;
    procedure BookMarkUnSelectBtnClick(Sender: TObject);
    procedure BookMarkSelectBtnClick(Sender: TObject);
    procedure RadioButtonClick(Sender: TObject);
    procedure PageControlChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControlChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure EntrpFileNameLabelMouseEnter(Sender: TObject);
    procedure IndvdFileNameLabelMouseLeave(Sender: TObject);
    procedure SelectShablonBtnClick(Sender: TObject);
    procedure EntrpFileNameLabelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CheckBookmarkBitBtnClick(Sender: TObject);
(*)    procedure SelTemplDBGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TSvtColumn;
      State: TGridDrawState);*)
    procedure N1Click(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure PasteActionExecute(Sender: TObject);
    procedure CopyActionExecute(Sender: TObject);
    procedure TourVendorTabSheetShow(Sender: TObject);
    procedure ViewSelContractQryDblClick(Sender: TObject);
    procedure ViewFocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    FActContractId: Integer;
    FCopyContractId: Integer;
    function GetBookMark_Name: string;
    function GetSelContractTemplSql: string;
    function GetContractTemplSql: string;
    function GetContractType: Integer;
    function GetShablonName(const Index: Integer): string;
    function GetCapShablon: string;
    function GetAdentKind: Integer;
    procedure UpdateTemplQry;
    procedure DelTemplRow;
    procedure InsertTemplRow;
    procedure UpdateBtn;
    procedure UpdateSelCntrTemplQry;
    procedure UpdateCntrTemplQry;
    procedure SetContractType(const Value: Integer);
    procedure SetShablonName(const Index: Integer; const Value: string);
    procedure LoadCapShablons;
    function GetActivePage: Integer;
    procedure SetActivePage(const Value: Integer);
    procedure OpenContractDataForm;
    procedure GetVendorContractTemplate;
    procedure UpdateCntrTemplateQueries;
    function CheckPermSelectBookmark: Boolean;
    procedure SetParamContract(aQuery: TIBQuery);
  protected
    property ContractType: Integer read GetContractType write SetContractType;
    property EntrpShablonName: string index 0 read GetShablonName write SetShablonName;
    property BsnmShablonName: string index 1 read GetShablonName write SetShablonName;
    property IndividShablonName: string index 2 read GetShablonName write SetShablonName;    
    property ActivePage: Integer read GetActivePage write SetActivePage;
    { Public declarations }
  end;

{var
  ContractTemplatesForm: TContractTemplatesForm;}
function ExecuteContractTemplates: Boolean;

implementation

uses
  ServMod,  BookmarkFrm, ContractDataFrm, ServModIB,
  UnitProc, UnitIBQuery, core, UnitFrameComRequisites;
const
//  sWhere: array[Boolean] of string = ('is null and ContractId = :Id', '= %d');
  nPageTypeContract = 0;
  nPageKindContract = 1;
  nPageErrand = 2;
  nPageVendor = 3;

  nTypeBookmarkEnterprise = 0;
  nTypeBookmarkBiznesmen = 1;
  nTypeBookmarkPrivate = 2;
  nTypeBookmarkErrand = 3;
  nTypeBookmarkVendor = 4;
  nTypeBookmarkContract = 5;

{$R *.dfm}
function ExecuteContractTemplates: Boolean;
begin
  with TContractTemplatesForm.Create(Application) do
  try
    LoadCapShablons;
    UpdateTemplQry;    
    UpdateBtn;
    FActContractId := 0;
    Result := ShowModal = mrOk;
  finally
    Free;
  end;
end;

procedure TContractTemplatesForm.UpdateTemplQry;
begin
  Elem_SelContractQry.DBReOpen;
  Elem_CntrTemplQry.DBReOpen;
  Elem_SelCntrTemplQry.DBReOpen;
  UpdateBtn;
end;

function TContractTemplatesForm.GetBookMark_Name: string;
begin
  Result := Elem_CntrTemplQry.GetValueByFieldName('FIELD_NAME');
end;

procedure TContractTemplatesForm.DelTemplRow;
begin
 // if {DMServ.CurManagerAdminPerms[nDictPartCommon] and}
 //   WarningFmtDlgYN('Видалити поле "%s"', [SafeVarToStr( Elem_SelCntrTemplQry.GetValueByFieldName('DESCRIPT') )] )

  if MyShowMessageDlg( Format( 'Видалити поле "%s"',[ Elem_SelCntrTemplQry.GetValueByFieldNameStr('DESCRIPT')  ]) , mtConfirmation, but_YES_NO ) = Res_YES then
  try
    Elem_SelCntrTemplQry.DBDelete(False);
  finally
    Elem_CntrTemplQry.Requery;
    UpdateBtn;
  end;
end;

procedure TContractTemplatesForm.BookMarkUnSelectBtnClick(Sender: TObject);
begin
  inherited;
  DelTemplRow;
end;

procedure TContractTemplatesForm.InsertTemplRow;
{const
  sInsertTemplates = 'Insert Into ContractTemplates(ContractId, RequiredField, ' +
    'BookMark, SourceTable, ContractType) ' +
    'Values (:ContractId, ''%s'', ''%s'', ''%s'', :ContractType)';}
var Bookmark_Name: string;  
    aContractId, aContractType: Variant;    
begin
  //if WarningFmtDlgYN('Додати поле "%s"', [Elem_CntrTemplQry.GetValueByFieldName('DESCRIPT')])
  if MyShowMessageDlg( Format( 'Додати поле "%s"',[ Elem_CntrTemplQry.GetValueByFieldNameStr('DESCRIPT')  ]) , mtConfirmation, but_YES_NO ) = Res_YES then
  try
    aContractId := null;
    case ActivePage of
     nPageTypeContract: aContractId := Elem_SelContractQry.GetValueId;
     nPageVendor: aContractId := Elem_VendorTourQry.GetValueId;
    end;
    aContractType := ContractType;
    Bookmark_Name := GetBookMark_Name;
               
    Elem_SelCntrTemplQry.DBAddValues(['ContractId', 'RequiredField', 'BookMark', 'SourceTable', 'ContractType'],
      [aContractId, Elem_CntrTemplQry.GetValueByFieldName('Field_Name'), Bookmark_Name, 
       Elem_CntrTemplQry.GetValueByFieldName('TABLE_NAME'), aContractType]);
    Elem_SelCntrTemplQry.RequeryCurrentRecord;
  finally
    Elem_CntrTemplQry.SaveBookmark;
    Elem_CntrTemplQry.Requery;
    Elem_CntrTemplQry.GotoBookmark;
    UpdateBtn;
  end;


{  with DMServ.WorkQuery do
  begin
    Bookmark_Name := GetBookMark_Name;
    SQL.Text := Format(sInsertTemplates, [Elem_CntrTemplQry.GetValueByFieldName('Field_Name'), 
      Bookmark_Name, Elem_CntrTemplQry.GetValueByFieldName('TABLE_NAME')]);
    with ParamByName('ContractType') do
    if ActivePage = nPageTypeContract then DataType := ftInteger
    else Value := ContractType;
    with ParamByName('ContractId') do
    if ActivePage <> nPageTypeContract then DataType := ftInteger
    else Value := Elem_SelContractQry.GetValueId;
    ExecSQL;
    UpdateTemplQry;
  end;      }
end;

procedure TContractTemplatesForm.BookMarkSelectBtnClick(Sender: TObject);
begin
  inherited;
  if CheckPermSelectBookmark then InsertTemplRow;
end;

procedure TContractTemplatesForm.UpdateBtn;
//var
  //CanAdmin: Boolean;
begin
  //CanAdmin := DMServ.CurManagerAdminPerms[nDictPartCommon];
  BookMarkSelectBtn.Enabled :={ CanAdmin and }Elem_CntrTemplQry.CheckRoleAny and (Elem_CntrTemplQry.DBRecordCount > 0);
  BookMarkUnSelectBtn.Enabled := {CanAdmin and }Elem_CntrTemplQry.CheckRoleAny and (Elem_SelCntrTemplQry.DBRecordCount > 0);

  SelectShablonBtn.Enabled := Elem_CntrTemplQry.CheckRoleAny ;// CanAdmin;
  CheckBookmarkBitBtn.Enabled := Elem_CntrTemplQry.CheckRoleAny;//CanAdmin;
end;

procedure TContractTemplatesForm.UpdateSelCntrTemplQry;
begin
  with Elem_SelCntrTemplQry do
  begin
    DBClose;
    TIBQuery(DB).SQL.Text := GetSelContractTemplSql;
    SetParamContract(TIBQuery(DB));
    DBOpen;
  end;
end;

function TContractTemplatesForm.GetSelContractTemplSql: string;
const 
  sContractTemplSQL = 'select Pp.RDB$DESCRIPTION DESCRIPT, T.* ' +
  'from ContractTemplates T ' +
  'LEFT OUTER JOIN RDB$PROCEDURE_PARAMETERS Pp ON Pp.RDB$PROCEDURE_NAME = T.sourcetable ' +
  'and Pp.RDB$PARAMETER_NAME = T.requiredfield and Pp.rdb$PROCEDURE_NAME = T.SourceTable ' +
  'where Pp.RDB$PARAMETER_TYPE = 1 and Pp.RDB$DESCRIPTION is not null ' +
  'and ContractType = %d and ( (coalesce(:ID, 0) = 0 and ContractId is null) or (ContractId = :id) ) ' ;
//  + 'Order by BOOKMARK';
{var
  sW: string;}
begin
//  sW := sWhere[ActivePage <> nPageTypeContract];
//  if sW <> EmptyStr then sW := Format(sW, [ContractType]);
  Result := Format(sContractTemplSQL, [ContractType]);
end;

procedure TContractTemplatesForm.UpdateCntrTemplQry;
begin
  with Elem_CntrTemplQry do
  begin
    DBClose;
    TIBQuery(DB).SQL.Text := GetContractTemplSql;
    SetParamContract(TIBQuery(DB));
    DBOpen;
  end;
end;

function TContractTemplatesForm.GetContractTemplSql: string;
const 
  sContractTemplSQL = 'SELECT Pr.RDB$PROCEDURE_NAME Table_Name, Pp.RDB$PARAMETER_NAME field_name, ' +
  'Pp.RDB$PARAMETER_NUMBER ANUMBER, Pp.RDB$DESCRIPTION DESCRIPT ' +
  'FROM RDB$PROCEDURES Pr ' +
  'LEFT OUTER JOIN RDB$PROCEDURE_PARAMETERS Pp ON ' +
  '(Pr.RDB$PROCEDURE_NAME = Pp.RDB$PROCEDURE_NAME) ' +
  'WHERE Pr.RDB$PROCEDURE_NAME = ''COMPANY_HEADPROPERTIES_SEL_PROC'' and ' +
  'Pp.RDB$PARAMETER_TYPE = 1 and ((Pr.RDB$SYSTEM_FLAG = 0) ' +
  'or (Pr.RDB$SYSTEM_FLAG IS NULL)) and Pp.RDB$DESCRIPTION is not null ' +
  'and Pp.RDB$PARAMETER_NAME not in (Select RequiredField From ContractTemplates ' +
  'where ContractType = %d and ( (coalesce(:ID, 0) = 0 and ContractId is null) or (ContractId = :id) ) ) ';
//   + 'Order by 4';
{var
  sW: string;}
begin
  Result := Format(sContractTemplSQL, [ContractType]);
end;

procedure TContractTemplatesForm.RadioButtonClick(Sender: TObject);
begin
  inherited;
  UpdateCntrTemplateQueries;
end;

procedure TContractTemplatesForm.PageControlChange(Sender: TObject);
begin
  inherited;
  if ActivePage = nPageTypeContract then Elem_SelContractQry.DBlocate('ID', FActContractId, []);
  UpdateCntrTemplateQueries;
end;

function TContractTemplatesForm.GetContractType: Integer;
begin
  if ActivePage = nPageTypeContract then Result := nTypeBookmarkContract
  else if ActivePage = nPageErrand then Result := nTypeBookmarkErrand
  else if ActivePage = nPageVendor then Result := nTypeBookmarkVendor
  else if IsEnterprRadioButton.Checked then Result := nTypeBookmarkEnterprise
  else if IsBsmanRadioButton.Checked then Result := nTypeBookmarkBiznesmen
  else if IsPrivateRadioButton.Checked then Result := nTypeBookmarkPrivate;  
end;

procedure TContractTemplatesForm.FormCreate(Sender: TObject);
begin
  inherited;
  ActivePage := nPageTypeContract;
  FCopyContractId := 0;
  Elem_SelContractQry.View.OnFocusedRecordChanged := ViewFocusedRecordChanged;
  Elem_VendorTourQry.View.OnFocusedRecordChanged := ViewFocusedRecordChanged;
  UpdateCntrTemplateQueries
end;

procedure TContractTemplatesForm.PageControlChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  if ActivePage = nPageTypeContract then FActContractId := Elem_SelContractQry.GetValueId;
end;

procedure TContractTemplatesForm.SetContractType(const Value: Integer);
begin
  case Value of
   0: IsEnterprRadioButton.Checked := True;
   1: IsBsmanRadioButton.Checked := True;
   2: IsPrivateRadioButton.Checked := True;
  end;
end;

procedure TContractTemplatesForm.EntrpFileNameLabelMouseEnter(Sender: TObject);
begin
  inherited;
  DMServ.DrawContractLabel(Sender as TLabel, True);
end;

procedure TContractTemplatesForm.IndvdFileNameLabelMouseLeave(Sender: TObject);
begin
  inherited;
  DMServ.DrawContractLabel(Sender as TLabel, False);
end;

procedure TContractTemplatesForm.SelectShablonBtnClick(Sender: TObject);
var
  FN: String;
begin
  inherited;
  if ActivePage = nPageTypeContract then OpenContractDataForm  
  else
  if ActivePage = nPageVendor then GetVendorContractTemplate
  else
  FN := MySelectFileDialog(DMServ.GetContractDir, '*.dot|*.dot');
  if FN <> '^' then
  begin 
    FN := ExpandUNCFileName(FN);
    SetShablonName(ContractType, ExtractFileName(FN))
  end;  

(*  with DMServ.OpenDialog_dot do
  begin
    Files.Clear;
    InitialDir := DMServ.GetContractDir;
    if Execute then begin 
      FN := ExpandUNCFileName(FileName);
      SetShablonName(ContractType, ExtractFileName(FN))
    end;
  end;       *)
end;

function TContractTemplatesForm.GetShablonName(
  const Index: Integer): string;
begin
  case Index of
   0: Result := EntrpFileNameLabel.Caption;
   1: Result := BsnmFileNameLabel.Caption;
   2: Result := IndvdFileNameLabel.Caption;
   3: Result := ErrandLabel.Caption;
  end;
end;

procedure TContractTemplatesForm.SetShablonName(const Index: Integer;
  const Value: string);
begin
  case Index of
   0: EntrpFileNameLabel.Caption := Value;
   1: BsnmFileNameLabel.Caption := Value;
   2: IndvdFileNameLabel.Caption := Value;
   3: ErrandLabel.Caption := Value;
  end;
end;

procedure TContractTemplatesForm.EntrpFileNameLabelClick(Sender: TObject);
begin
  inherited;
  OpenShablonDoc( WordDocum,WordApplic, DMServ.GetContractDir, GetShablonName((Sender as TLabel).Tag) );
  //DMServ.OpenShablonDoc(GetShablonName((Sender as TLabel).Tag));
end;

procedure TContractTemplatesForm.LoadCapShablons;
var aDSet: TDataSet;
    aMemoField: TField;
begin  
  try
    aDSet := CreateDataSet(Elem_CntrTemplQry.DBGetParamConnect.PathDB, Elem_CntrTemplQry.DBGetParamConnect.UID, Elem_CntrTemplQry.DBGetParamConnect.Password, nil, 
      'Select Memo From NameLists where Category = 24 and OrderInCategory = 9');
    aMemoField := aDSet.FieldByName('MEMO');
    EntrpFileNameLabel.Caption := DMServ.GetFileNameWithMemo(aMemoField, 1);
    BsnmFileNameLabel.Caption := DMServ.GetFileNameWithMemo(aMemoField, 2);
    IndvdFileNameLabel.Caption := DMServ.GetFileNameWithMemo(aMemoField, 3);
    ErrandLabel.Caption := DMServ.GetFileNameWithMemo(aMemoField, 4);  
  finally
    DestroyDB( aDSet );  
  end;  

end;

procedure TContractTemplatesForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if ModalResult = mrOk then
  UpdateSql(Elem_CntrTemplQry.DBGetParamConnect.PathDB, Elem_CntrTemplQry.DBGetParamConnect.UID, Elem_CntrTemplQry.DBGetParamConnect.Password, 
    Format('Update NameLists Set Memo = ''%s'' where Category = 24 and OrderInCategory = 9', [GetCapShablon]))
end;

function TContractTemplatesForm.GetCapShablon: string;
var
  I: Integer;
begin
  Result := EmptyStr;
  for I := 0 to 3 do
  if GetShablonName(I) <> EmptyStr then Result := Result + arrNamePar[I + 1] + '=' + GetShablonName(I) + #13;
end;

procedure TContractTemplatesForm.CheckBookmarkBitBtnClick(Sender: TObject);
var
  FileName, ListUseBookmarkId, ListNotUseBookmarkId: string;
  Id: Integer;
  FSave: OleVariant;
begin
  inherited;
  ListNotUseBookmarkId := EmptyStr;
  ListUseBookmarkId := EmptyStr;
  if ActivePage = nPageTypeContract then FileName := Elem_SelContractQry.GetValueByFieldName('CalcShablon')
  else FileName := GetShablonName(GetAdentKind);

  OpenShablonDoc( WordDocum, WordApplic, DMServ.GetContractDir, FileName, False );
  Id := Elem_SelCntrTemplQry.DB.FieldByName('CONTRACTTEMPLATEID').Value;
  Elem_SelCntrTemplQry.DB.DisableControls;
  Elem_SelCntrTemplQry.DB.First;

  while not Elem_SelCntrTemplQry.DB.Eof do
  begin
  
    if not WordDocum.Bookmarks.Exists( Elem_SelCntrTemplQry.DB.FieldByName('BOOKMARK').AsString ) then
      ListNotUseBookmarkId := ListNotUseBookmarkId + Elem_SelCntrTemplQry.DB.FieldByName('CONTRACTTEMPLATEID').AsString + ','
    else ListUseBookmarkId := ListUseBookmarkId + Elem_SelCntrTemplQry.DB.FieldByName('CONTRACTTEMPLATEID').AsString + ',';

    Elem_SelCntrTemplQry.DB.Next;
  end;

  WordClose( WordApplic );
  ListNotUseBookmarkId := Copy(ListNotUseBookmarkId, 0, Length(ListNotUseBookmarkId) - 1);
  ListUseBookmarkId := Copy(ListUseBookmarkId, 0, Length(ListUseBookmarkId) - 1);

  if ListUseBookmarkId <> EmptyStr then
    UpdateSql(Elem_CntrTemplQry.DBGetParamConnect.PathDB, Elem_CntrTemplQry.DBGetParamConnect.UID, Elem_CntrTemplQry.DBGetParamConnect.Password,
      Format('Update CONTRACTTEMPLATES Set NotUse = null where CONTRACTTEMPLATEID in (%s)', [ListUseBookmarkId]) );
  if ListNotUseBookmarkId <> EmptyStr then
    UpdateSql(Elem_CntrTemplQry.DBGetParamConnect.PathDB, Elem_CntrTemplQry.DBGetParamConnect.UID, Elem_CntrTemplQry.DBGetParamConnect.Password,
      Format('Update CONTRACTTEMPLATES Set NotUse = ''T'' where CONTRACTTEMPLATEID in (%s)', [ListNotUseBookmarkId]) );

  UpdateTemplQry;
  Elem_SelCntrTemplQry.DB.Locate('CONTRACTTEMPLATEID', Id, []);
  Elem_SelCntrTemplQry.DB.EnableControls;

end;

function TContractTemplatesForm.GetActivePage: Integer;
begin
  Result := PageControl.ActivePageIndex;
end;

procedure TContractTemplatesForm.SetActivePage(const Value: Integer);
begin
  PageControl.ActivePageIndex := Value;
end;

function TContractTemplatesForm.GetAdentKind: Integer;
begin
  if ActivePage = nPageErrand then Result := 3
  else begin 
    with IsEnterprRadioButton do if Checked then Result := nTypeBookmarkEnterprise;
    with IsBsmanRadioButton do if Checked then Result := nTypeBookmarkBiznesmen;
    with IsPrivateRadioButton do if Checked then Result := nTypeBookmarkPrivate;
  end;
end;
(*)
procedure TContractTemplatesForm.SelTemplDBGridDrawColumnCell(
  Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TSvtColumn;
  State: TGridDrawState);
var ColName: String;
begin
  inherited;
{  ColName := UpperCase(Column.FieldName);
  with Sender as TSvtDBGrid do
  begin
    if SelCntrTemplQryNotUse.AsBoolean then Canvas.Font.Color := clRed;
    DefaultDrawColumnCell(Rect, DataCol, Column, State);
    if (ColName = 'USECOUNT') and SelCntrTemplQryUSECOUNT.IsNull then Canvas.FillRect(Rect);
  end;}
end;    *)

procedure TContractTemplatesForm.OpenContractDataForm;
begin
  if {DMServ.CurManagerAdminPerms[nDictPartCommon]}(Elem_SelContractQry.CheckRoleAny) and ExecuteContractData(Elem_SelContractQry.GetValueId)
  then UpdateTemplQry;
end;

procedure TContractTemplatesForm.N1Click(Sender: TObject);
begin
  inherited;
  Clipboard.AsText := Elem_SelCntrTemplQry.GetValueByFieldName('BOOKMARK');
end;

procedure TContractTemplatesForm.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  inherited;
  PasteAction.Enabled := FCopyContractId > 0;
end;

procedure TContractTemplatesForm.PasteActionExecute(Sender: TObject);
const InsertContrFieldSQL = 
    'Insert Into CONTRACTTEMPLATES(ContractId, REQUIREDFIELD, BOOKMARK, ' +
    'SOURCETABLE, CONTRACTTYPE, USECOUNT) ' +
    'Select %d, REQUIREDFIELD, BOOKMARK, ' +
    'SOURCETABLE, CONTRACTTYPE, USECOUNT ' +
    'from CONTRACTTEMPLATES ' +
    'where ContractId = %d and (NotUse is null or (NotUse = ''F''))';
begin
  inherited;
  //if WarningFmtDlgYN('Додати скопійовані поля до угоди "%s"', [Elem_SelContractQry.GetValueByFieldName('NAME')])
  if MyShowMessageDlg( Format( 'Додати скопійовані поля до угоди "%s"',[ Elem_SelContractQry.GetValueByFieldName('NAME')  ]) , mtConfirmation, but_YES_NO ) = Res_YES then

  begin
    UpdateSql( Elem_CntrTemplQry.DBGetParamConnect.PathDB, Elem_CntrTemplQry.DBGetParamConnect.UID, Elem_CntrTemplQry.DBGetParamConnect.Password, 
      Format(InsertContrFieldSQL, [Elem_SelContractQry.GetValueIdStr, FCopyContractId] ) );
//    DMServ.WorkQueryExecute(Format(InsertContrFieldSQL, [Elem_SelContractQry.GetValueIdStr,
//      FCopyContractId]), EmptyStr);
    FCopyContractId := 0;
    Elem_SelContractQry.Requery;
  end;
end;

procedure TContractTemplatesForm.CopyActionExecute(Sender: TObject);
begin
  inherited;
  FCopyContractId := Elem_SelContractQry.GetValueId;
end;

procedure TContractTemplatesForm.TourVendorTabSheetShow(Sender: TObject);
begin
  inherited;
  Elem_VendorTourQry.DBReOpen;
end;

procedure TContractTemplatesForm.GetVendorContractTemplate;
var
  ShablonFileName, NewFilePath, aFileName: string;
begin
  ShablonFileName := MySelectFileDialog(DMServ.GetContractDir, '*.dot|*.dot');
  if ShablonFileName <> '^' then
  begin 
    aFileName := ExtractFileName(ShablonFileName);
    NewFilePath := IncludeTrailingBackslash(
      IncludeTrailingBackslash(DMServ.GetContractDir + 'Vendors') + Elem_VendorTourQry.GetValueIdStr);
    if ForceDirectories(NewFilePath) then
    begin
      CopyFile( PAnsiChar(ShablonFileName), PAnsiChar(NewFilePath + aFileName), False);

      Elem_VendorTourContractQry.DBReOpen;
      if Elem_VendorTourContractQry.DBLocate('VENDORID', Elem_VendorTourQry.GetValueId, []) then
        Elem_VendorTourContractQry.DB.Edit
      else 
        Elem_VendorTourContractQry.DB.Append;
      Elem_VendorTourContractQry.DB.FieldByName('CONTRACTPATH').Value := aFileName;  
      Elem_VendorTourContractQry.DBPost;
      Elem_VendorTourQry.RequeryCurrentRecord;
    end;
  end;
end;

procedure TContractTemplatesForm.UpdateCntrTemplateQueries;
begin
  UpdateCntrTemplQry;
  UpdateSelCntrTemplQry;
  UpdateBtn;
end;

procedure TContractTemplatesForm.ViewSelContractQryDblClick(
  Sender: TObject);
begin       
{  Col := ContractDBGrid.MouseColumn;
  if (Col >= 0) and (ContractDBGrid.Columns[Col].FieldName = 'CalcShablon')
    and (ContractDBGrid.Columns[Col].Field.Value <> EmptyStr)
  then DMServ.OpenShablonDoc(ContractDBGrid.Columns[Col].Field.Value)
  else OpenContractDataForm;}
end;

procedure TContractTemplatesForm.ViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  UpdateCntrTemplateQueries;
end;

procedure TContractTemplatesForm.FormDestroy(Sender: TObject);
begin
  inherited;
  Elem_SelContractQry.View.OnFocusedRecordChanged := nil;
  Elem_VendorTourQry.View.OnFocusedRecordChanged  := nil;
end;

function TContractTemplatesForm.CheckPermSelectBookmark: Boolean;
begin
  Result := (ActivePage <> nPageVendor) or (Elem_VendorTourQry.GetValueByFieldName('CONTRACTPATH') <> null);
  if not Result then MyShowMessageDlg('Для даного постачальника не вибрано шаблон угоди!' , mtError, but_OK );
end;

procedure TContractTemplatesForm.SetParamContract(aQuery: TIBQuery);
begin
  case ActivePage of
  nPageTypeContract: aQuery.ParamByName('ID').Value := Elem_SelContractQry.GetValueId;
  nPageVendor: aQuery.ParamByName('ID').Value := Elem_VendorTourQry.GetValueByFieldName('COMPANYID');
  else aQuery.ParamByName('ID').Value := null;
  end;
end;

end.
