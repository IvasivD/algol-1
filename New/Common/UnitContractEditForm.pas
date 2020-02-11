unit UnitContractEditForm;

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
  cxTextEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBExtLookupComboBox, StdCtrls, cxRadioGroup, cxMaskEdit, cxCalendar,
  Grids, ComCtrls, Buttons, ExtCtrls,Core, cxStyles,
  //SvtDBGrids,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView,UnitProc, OrderUn,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,Clipbrd,
  cxMemo, cxImageComboBox, UnitHookControlChangeValue,OptSet,TourCmnlIf,TourConsts,UnitExportWord,
  cxCheckBox, cxDBEdit, WordXP, OleServer , UnitFrameComRequisites,UnitProjectProc;


const
  nContractKindNone = -1;
  nContractKindAgent = 0;
  nContractKindDrive = 1;
  nContractKindDriveGet = 2;
  nContractKindDriveGetM = 3;
  nContractKindVendorOut = 4;
  nContractKindHotel = 5;
  nReceivedCopy = 0;
  nReceivedOriginal = 1;

 
  function PathIsDirectoryEmpty(pszPath: PChar): Boolean; stdcall;
  external 'shlwapi.dll' name 'PathIsDirectoryEmptyA';

type
  TParamContract = record
    ElemCompany  : TDBShemaView;
    ElemContract : TDBShemaView;
    ElemLog : TDBShemaView;
    ElemCompHeadPropQry:TDBShema;

    ElemCompContractKind:TDBShemaView;
    ElemSelOurPersonQry:TDBShemaView;
    ElemSeFromPartnerPersonQry:TDBShemaView;
    ElemCompContractNumsQry:TDBShema;
    ElemSelCntrTemplQry:TDBShema;
    ElemEmailQry : TDBShemaView;
    MarkDifStyle:TcxStyle;
  end;

  TFrmContractEdit = class(TForm)
    CtrlPanel: TPanel;
    CancelBtn: TBitBtn;
    OkBtn: TBitBtn;
    ReviewCntrBtn: TButton;
    WorkPanel: TPanel;
    MemoLabel: TLabel;
    ContractTypeLabel: TLabel;
    SignDateLabel: TLabel;
    AttachFileBtn: TSpeedButton;
    ActionLabel: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    SignGroupBox: TGroupBox;
    OurPersonLabel: TLabel;
    ItsPersonLabel: TLabel;
    SignDateEdit: TcxDateEdit;
    FromDateEdit: TcxDateEdit;
    TillDateEdit: TcxDateEdit;
    EditRadioButton: TcxRadioButton;
    SaveRadioButton: TcxRadioButton;
    ContractTypeComboBox: TcxExtLookupComboBox;
    NumContractEdit: TcxTextEdit;
    OurPersonComboBox: TcxExtLookupComboBox;
    ItsPersonComboBox: TcxExtLookupComboBox;
    GridLogContractDBTableView1: TcxGridDBTableView;
    GridLogContractLevel1: TcxGridLevel;
    GridLogContract: TcxGrid;
    Memo: TcxMemo;
    ActionComboBox: TcxImageComboBox;
    TillDateCheckBox: TcxCheckBox;
    WordApplic: TWordApplication;
    WordDocum: TWordDocument;
    GridViewRepository: TcxGridViewRepository;
    ViewContractLog: TcxGridDBTableView;
    ViewContractLogCONTRACTLOGID: TcxGridDBColumn;
    ViewContractLogLOGDATETIME: TcxGridDBColumn;
    ViewContractLogMANAGER: TcxGridDBColumn;
    ViewContractLogSUBCATEGORY: TcxGridDBColumn;
    ViewContractLogSUBCATEGNAME: TcxGridDBColumn;
    ViewContractLogLOGPROMPT: TcxGridDBColumn;
    ViewContractLogCalcLog: TcxGridDBColumn;
    ViewContractLogLOGCATEGORY: TcxGridDBColumn;
    ViewContractLogFILENAME: TcxGridDBColumn;
    procedure FormDestroy(Sender: TObject);
    procedure AttachFileBtnClick(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure EditRadioButtonClick(Sender: TObject);
    procedure ReviewCntrBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
     FIsNew : Boolean;
     FUpdate:Boolean;
     FReReestr :Boolean;
     FCurrManager  : Integer;
     FActionTag: Integer;

     FCurrManagerName :string;
     FElemCompany  : TDBShemaView;
     FElemContract : TDBShemaView;
     FElemEmailQry : TDBShemaView;
     FMarkDifStyle : TcxStyle;

     FElemLog : TDBShemaView;
     FElemCompHeadPropQry : TDBShema;
     FElemCompContractKind: TDBShemaView;
     FElemSelOurPersonQry : TDBShemaView;
     FElemSeFromPartnerPersonQry:TDBShemaView;
     FElemCompContractNumsQry:TDBShema;
     FElemSelCntrTemplQry:TDBShema;


     FHookControlChangeValue : THookControlChangeValue;
     FOldTillDateEdit: TDateTime;

     function  FGetContractCode: String;
     function  FGetContractKind: Integer;
     function  FCreateDocument(const DocName: String): Boolean;
     procedure FStoreDocument(const DocName: String);
     procedure FPrepareDataControls( isNew,Update:Boolean );
     procedure FPrepareActionComboBox( isNew:Boolean );
     procedure FPrepare;

     procedure FToggleContractState;
     procedure FRefreshControls;
     function  FCreateNumContract( ForDate:TDateTime ): Variant;
     procedure FRefreshChangeControl(Sender: TObject);
     procedure FShowData;
     procedure FSaveData( ActionTag:Integer );
     procedure FSaveCompanyData( ActionTag:Integer );
     function  FFillDocumentNew(TypeTempl: Integer): Boolean;
     function  FGetItsCompanyType: Integer;
     //function  FGetItsActualAddress: string;
     //function  FGetItsPostAddress: string;
     function  FReReestrContract: Boolean;
     function  FCheckDataError( ElemCompany :TDBShemaView ):Boolean;
  public
    { Public declarations }
     function newCreateContract(OnlyView: Boolean = False): Boolean;

  end;

  procedure UpdateCompanyProperties( aElemCompHeadPropQry:TDBShema; CompanyId, OurPersonId,ItsPersonId,varNumContract:Variant; varWriteDate:String );
  function ExecuteContractEditForm( ParamContract:TParamContract; aCurrManager:Integer; aCurrManagerName:string; ActionTag: Integer;ReReestr, Update:Boolean  ):boolean;
  function GetPatchPartnersDoc( ElemCompany :TDBShemaView; InTmp: Boolean = False): string;
  function CheckRcvDoc( ElemCompany :TDBShemaView ): Boolean;
  function MoveRcvCopy( ElemCompany :TDBShemaView ): Boolean;
var
  FrmContractEdit: TFrmContractEdit;

implementation

{$R *.dfm}
function ExecuteContractEditForm( ParamContract:TParamContract; aCurrManager:Integer; aCurrManagerName:string;  ActionTag: Integer; ReReestr, Update:Boolean ):boolean;
begin
  try
    Application.CreateForm(TFrmContractEdit, FrmContractEdit);
    FrmContractEdit.FElemCompany := ParamContract.ElemCompany;
    FrmContractEdit.FElemContract:= ParamContract.ElemContract;
    FrmContractEdit.FElemLog := ParamContract.ElemLog;
    FrmContractEdit.FElemCompHeadPropQry := ParamContract.ElemCompHeadPropQry;
    FrmContractEdit.FElemCompContractKind := ParamContract.ElemCompContractKind;
    FrmContractEdit.FElemSelOurPersonQry := ParamContract.ElemSelOurPersonQry;
    FrmContractEdit.FElemSeFromPartnerPersonQry := ParamContract.ElemSeFromPartnerPersonQry;
    FrmContractEdit.FElemCompContractNumsQry := ParamContract.ElemCompContractNumsQry;
    FrmContractEdit.FElemSelCntrTemplQry := ParamContract.ElemSelCntrTemplQry;
    FrmContractEdit.FElemEmailQry := ParamContract.ElemEmailQry;
    FrmContractEdit.FMarkDifStyle := ParamContract.MarkDifStyle;

    FrmContractEdit.FCurrManager := aCurrManager;
    FrmContractEdit.FCurrManagerName := aCurrManagerName;

    FrmContractEdit.FActionTag := ActionTag;
    FrmContractEdit.FIsNew := ActionTag = remStateAppend;
    FrmContractEdit.FUpdate := Update;

    FrmContractEdit.FPrepare;
    if FrmContractEdit.ShowModal = mrOk then
      result := True
    else result := False;

  finally
    FrmContractEdit.Free;
  end;
end;

procedure TFrmContractEdit.FRefreshControls;
begin
  ContractTypeComboBox.Enabled := FIsNew;
  OurPersonComboBox.Enabled := FIsNew;
  ItsPersonComboBox.Enabled := FIsNew;
  SignDateEdit.Enabled := FIsNew;
  FromDateEdit.Enabled := FIsNew;
  OurPersonComboBox.Enabled := FIsNew;
  ItsPersonComboBox.Enabled := FIsNew;
  TillDateCheckBox.Enabled  := ( ActionComboBox.EditingValue = nContractCreate );
  if ( ActionComboBox.EditingValue = nContractFinish ) then TillDateCheckBox.Checked := True;

  TillDateEdit.Enabled := (TillDateCheckBox.Checked) and (( ActionComboBox.EditingValue = nContractCreate ) or ( ActionComboBox.EditingValue = nContractFinish ));
  AttachFileBtn.Enabled := EditRadioButton.Enabled;
  NumContractEdit.enabled:=false;
  if ActionComboBox.EditingValue = nContractFinish then TillDateEdit.Date := Date;
end;

function TFrmContractEdit.FCreateNumContract( ForDate:TDateTime ): Variant;
var ContractNum: Integer;
begin
  result := null;
  FElemCompContractNumsQry.DBQuerySetParamValue( 'ContractDate',ForDate );
  FElemCompContractNumsQry.DBOpen;
  if FElemCompContractNumsQry.DB.IsEmpty then
  begin
    ContractNum := 0;
    FElemCompContractNumsQry.DB.Insert;
    FElemCompContractNumsQry.DB.FieldByName('ContractDate').AsDateTime := ForDate ;
  end
  else
  begin
    ContractNum := FElemCompContractNumsQry.DB.FieldByName('ContractNum').AsInteger ;
    FElemCompContractNumsQry.DB.Edit;
  end;

  FElemCompContractNumsQry.DB.FieldByName('ContractNum').AsInteger := ContractNum+1 ;
  FElemCompContractNumsQry.DB.Post;

  result := FormatDateTime('yyyyymmdd-', ForDate) + FormatFloat('00', ContractNum );
end;

procedure TFrmContractEdit.FToggleContractState;
//var
//  En, Entrpr, ViewOnly: Boolean;
begin

 { En := EditRadioButton.Checked or SaveRadioButton.Checked;
  Entrpr :=  Elem_COMPANYQRY.DB.FieldByName('ISENTERPR').AsBoolean;
  ViewOnly := not FIsNew and (  FElemContract.DB.FieldByName('INVALID').AsBoolean or (not FElemContract.DB.FieldByName('TILLDATE').IsNull and (FElemContract.DB.FieldByName('TILLDATE').Value < Now)));

  ToggleControlEnabled(ContractTypeComboBox, En and FIsNew);
  En := En and (ContractTypeComboBox.EditValue <> null);
  
  //ToggleControlEnabled(ActionComboBox, En and not ViewOnly);
  //En := En and (ActionComboBox.ItemIndex >= 0);

  //ToggleControlEnabled(SignDateEdit, En and FIsNew);
  //ToggleControlEnabled(FromDateEdit, En and FIsNew);
  //ToggleControlEnabled(TillDateCheckBox, En and FIsNew);
  //****************************************************
  //ToggleControlEnabled(NumContractEdit, En and FAddNew);

  //ToggleControlEnabled(NumContractEdit, En and not FAddNew);
  //NumContractEdit.enabled:=false;
  //ToggleControlEnabled(TillDateEdit, TillDateCheckBox.Checked and En and FIsNew);
  //****************************************************
 { En := En and (SignDateEdit.EditValue > 0) and (FromDateEdit.EditValue > 0);
  ToggleControlEnabled(OurPersonComboBox, En and FIsNew);
  ToggleControlEnabled(ItsPersonComboBox, En and FIsNew and Entrpr);
  ToggleControlEnabled(Memo, En and FIsNew);
  ToggleControlEnabled(OkBtn, En and not ViewOnly);
  //*************************************** }
end;

{procedure  TFrmContractEdit.LoadPersonList(
begin
FElemSelOurPersonQry
end; }

procedure TFrmContractEdit.FShowData;
begin
  //  UpdateCompanyProperties;
  EditRadioButton.Checked := True;
  //FToggleContractState;
  FromDateEdit.Date := FElemContract.DB.FieldByName('FROMDATE').AsDateTime;
  TillDateEdit.Date := FElemContract.DB.FieldByName('TILLDATE').AsDateTime;
  SignDateEdit.Date := FElemContract.DB.FieldByName('SIGNDATE').AsDateTime;

  FOldTillDateEdit := TillDateEdit.Date;
  TillDateCheckBox.Checked := TillDateEdit.Date > 0;
  TillDateCheckBox.Enabled := TillDateEdit.Date = 0;

  NumContractEdit.Text := FElemContract.DB.FieldByName('NUMCONTRACT').asString; //DMServ.ContractTableNUMCONTRACT.Value;

  if FElemContract.DB.FieldByName('CONTRACTTYPE').IsNull //DMServ.ContractTableCONTRACTTYPE.IsNull
  then ContractTypeComboBox.Text := FElemContract.DB.FieldByName('ONLYREGNAME').asString //DMServ.ContractTableONLYREGNAME.Value
  else ContractTypeComboBox.EditValue:=  FElemContract.DB.FieldByName('CONTRACTTYPE').Value;

  {SignDateCheckBox.Checked := SignDate > 0;
  SignDateCheckBox.Enabled := SignDate = 0;
  SignDateCheckBoxClick(Self);}
  {LoadPersonList(
    SelOurPersonQryCalcFullName, SelOurPersonQryPERSONID, FElemContract.DB.FieldByName('OURPERSONID'), OurPersonComboBox);

  LoadPersonList(
    SelItsPersonQryCalcFullName, SelItsPersonQryPERSONID, FElemContract.DB.FieldByName('ITSPERSONID'), ItsPersonComboBox, Elem_COMPANYQRY.DB.FieldByName(Elem_COMPANYQRY.FieldKod));}

  AttachFileBtn.Visible := SaveRadioButton.Checked and ( FElemContract.DB.FieldByName('FILENAME').IsNull or (self.FCurrManager = FElemContract.DB.FieldByName('ADDMANID').asInteger ) );
end;

function TFrmContractEdit.FGetContractCode: String;
var Id: Integer;
begin
  Result := '';
  Id := ContractTypeComboBox.EditValue;
  
  if Id > 0 then
  begin
    FElemCompContractKind.DB.Open;
    if (FElemCompContractKind.DB.FieldByName( 'ID' ).asInteger = Id ) or
       (FElemCompContractKind.DB.Locate( 'ID', Id, []) ) then
      Result := FElemCompContractKind.DB.FieldByName( 'SHORTNAME' ).Value;
  end;
end;


function TFrmContractEdit.FGetContractKind: Integer;
var Code: String;
begin
  Code := FGetContractCode;
  if Code = 'agent' then Result := nContractKindAgent
  else if Code = 'drive' then Result := nContractKindDrive
  else if Code = 'driveget' then Result := nContractKindDriveGet
  else if Code = 'drivegetm' then Result := nContractKindDriveGetM
  else if Code = 'vendout' then Result := nContractKindVendorOut
  else if Code = 'hotel' then Result := nContractKindHotel
  else Result := nContractKindNone;
end;

procedure UpdateCompanyProperties( aElemCompHeadPropQry:TDBShema; CompanyId, OurPersonId,ItsPersonId,varNumContract:Variant; varWriteDate:String );
begin
  aElemCompHeadPropQry.DBQuerySetParamValue('CompanyId', CompanyId );
  aElemCompHeadPropQry.DBQuerySetParamValue('OurPersonId', OurPersonId );
  aElemCompHeadPropQry.DBQuerySetParamValue('ItsPersonId', ItsPersonId );
  aElemCompHeadPropQry.DBQuerySetParamValue('varNumContract', varNumContract );
  aElemCompHeadPropQry.DBQuerySetParamValue('varWriteDate', varWriteDate );
  aElemCompHeadPropQry.DBOpen;
end;

{procedure TContractEditForm.UpdateCompanyProperties;
begin
  with Elem_CompHeadPropQry do
  begin
    if Active then Close;
    ParamByName('CompanyId').Value := Elem_COMPANYQRY.GetValueId;
    ParamByName('OurPersonId').Value := OurPersonComboBox.ItemId;
    ParamByName('ItsPersonId').Value := ItsPersonComboBox.ItemId;
    ParamByName('varNumContract').Value := NumContractEdit.Text;
    ParamByName('varWriteDate').Value := FormatDateTime('dd.mm.yyyy', SignDate);
    Prepare;
    Open;
  end;
end;     }

function TFrmContractEdit.FGetItsCompanyType: Integer;
begin
  with FElemCompHeadPropQry.DB do
  if FieldByName('ISENTERPR').AsBoolean then Result := 0
  else if FieldByName('ISBSMAN').AsBoolean then Result := 1
  else Result := 2;
end;

{function TFrmContractEdit.FGetItsActualAddress: string;
begin
  with FElemCompHeadPropQry.DB do
  Result := GetOldAddressString(FieldByName('ACTUALSTRKIND'), FieldByName('ACTUALADDRESS'),
    FieldByName('ACTUALHOUSE'), FieldByName('ACTUALTENEMENT'),
    FieldByName('ACTUALCITYKIND'), FieldByName('ACTUALCITY'),
    FieldByName('ACTUALTOWNSHIP'), FieldByName('ACTUALPROVINCE'),
    FieldByName('ACTUALZIPCODE'), nil);
end;

function TFrmContractEdit.FGetItsPostAddress: string;
begin
  with FElemCompHeadPropQry.DB do
  Result := GetOldAddressString(FieldByName('POSTSTRKIND'), FieldByName('POSTADDRESS'),
    FieldByName('POSTHOUSE'), FieldByName('POSTTENEMENT'),
    FieldByName('POSTCITYKIND'), FieldByName('POSTCITY'),
    FieldByName('POSTTOWNSHIP'), FieldByName('POSTPROVINCE'),
    FieldByName('POSTZIPCODE'), nil);
end;}

function TFrmContractEdit.FFillDocumentNew(TypeTempl: Integer): Boolean;
var
  curBookmarkWork, curBookmark, currField, SQLText: string; 
  BookmarkNotFound: string; 
  I, UseCount: Integer;
  ParamContractId:variant;
  ParamContractType:variant;

begin
  UpdateCompanyProperties( self.FElemCompHeadPropQry, Self.FElemCompany.GetValueId,OurPersonComboBox.EditValue,
                           ItsPersonComboBox.EditValue,NumContractEdit.Text, FormatDateTime('dd.mm.yyyy', SignDateEdit.Date) );
  BookmarkNotFound := EmptyStr;
  if TypeTempl = 0 then begin ParamContractId := ContractTypeComboBox.EditValue; ParamContractType:=-1; end;
  if TypeTempl = 1 then begin ParamContractId := -1;ParamContractType := FGetItsCompanyType; end;
  if TypeTempl = 3 then begin ParamContractId := -1;ParamContractType := TypeTempl ; end;

  self.FElemSelCntrTemplQry.DBQuerySetParamValue('ContractId', ParamContractId);
  self.FElemSelCntrTemplQry.DBQuerySetParamValue('ContractType', ParamContractType);
  self.FElemSelCntrTemplQry.DBOpen;

  //*****************************
  while not self.FElemSelCntrTemplQry.DB.eof do
  begin
    curBookmark := self.FElemSelCntrTemplQry.DB.FieldByName('BOOKMARK').asString;
    currField := self.FElemSelCntrTemplQry.DB.FieldByName('REQUIREDFIELD').asString;
    if currField = 'CONTRACTFROM' then currField := FormatDateTime('dd.mm.yyyy', FromDateEdit.Date )
    else if currField = 'CONTRACTTILL' then currField := FormatDateTime('dd.mm.yyyy', TillDateEdit.Date )
    else if currField = 'HEADADDRESS' then currField := FElemCompHeadPropQry.DB.fieldByName('HEADADDRES').AsString //GetItsHeadAddress( FElemCompHeadPropQry )
    else if currField = 'ACTUALADDRESS' then currField := FElemCompHeadPropQry.DB.fieldByName('ACTUALADDRESS').AsString //FGetItsActualAddress
    else if currField = 'POSTADDRESS' then currField := FElemCompHeadPropQry.DB.fieldByName('POSTADDRESS').AsString //FGetItsPostAddress
    else if currField = 'PHONENO' then currField := FElemCompHeadPropQry.DB.fieldByName('OFFICEPHONE').AsString//GetItsHeadPhone( FElemCompHeadPropQry )
    else if currField = 'FAXNO' then currField := FElemCompHeadPropQry.DB.fieldByName('OFFICEFAX').AsString//GetItsHeadFax( FElemCompHeadPropQry )
    else if currField = 'TAXPAYCODE' then currField := GetItsCompanyTaxPayData( FElemCompHeadPropQry )
    else currField := FElemCompHeadPropQry.DB.FieldByName(currField).AsString;

    UseCount := MyIfThen( self.FElemSelCntrTemplQry.DB.FieldByName('USECOUNT').asInteger = 0, 1, self.FElemSelCntrTemplQry.DB.FieldByName('USECOUNT').asInteger);
    for I := 1 to UseCount do begin
      curBookmarkWork := curBookmark + MyIfThen(I > 1, IntToStr(I), EmptyStr);
      if not SetWordBookmark( WordDocum,WordApplic, curBookmarkWork, currField, False)
      then BookmarkNotFound := BookmarkNotFound + curBookmarkWork + #13;
    end;
    self.FElemSelCntrTemplQry.DB.Next;
  end;

  Result := BookmarkNotFound = EmptyStr;
  if not Result then ErrorFmtDlg(SDataModErrorWordBookmarksNotFound, [BookmarkNotFound]);

end;

function TFrmContractEdit.FReReestrContract: Boolean;
begin
  Result := ActionComboBox.EditValue = nContractReReestr;
end;

function TFrmContractEdit.newCreateContract(OnlyView: Boolean = False): Boolean;
const sExt = '.doc';
var
  DocId: Integer;
  FName: String;
  FillProc: TFillWordDocProcNew;
  Protect, IsBoss: Boolean;
  NewNumContract:WideString;
  FDocName : String;
begin
  NewNumContract := FCreateNumContract( SignDateEdit.Date );

  if not OnlyView and (NewNumContract='') then Exit;
  NumContractEdit.EditValue  := NewNumContract;

  begin    
    DocId := ContractTypeComboBox.EditValue;

    if OnlyView then FDocName := Text + '_View' + sExt
    else FDocName := Text + NumContractEdit.Text + sExt;
  end;

  FName := GetPathContractFile(FDocName ,Self.FElemCompany );
  if FileExists(FName) then
  begin
    SetFileAttrib(FName, False, False);
    DeleteFile(FName);
  end;

  if FGetContractKind = nContractKindAgent
  then FillProc := FFillDocumentNew else FillProc := nil;

  FElemSelOurPersonQry.DB.Locate('PERSONID', OurPersonComboBox.EditValue, []);
  IsBoss := FElemSelOurPersonQry.DB.FieldByName('SIGNRIGHT').asString = 'A';

  Result := Assigned(FillProc) and
            ( NewPrintWordDocument(WordDocum,WordApplic, self.FElemCompany,self.FElemCompContractKind, DocId, FillProc, 
                                   FName, IsBoss, OnlyView) );

  if Result and not OnlyView then
  begin
    if not FReReestrContract then self.FElemContract.DB.FieldByName('FILENAME').AsString :=  FDocName;
    SetFileAttrib(FName, True, True);
  end
  else
   if not Assigned(FillProc) then
     MyShowMessageDlg(SCntrctFrmErrorNotWork , mtError, but_OK );
end;

procedure TFrmContractEdit.FSaveData( ActionTag:Integer );
begin
   if self.FIsNew then FElemContract.DB.Insert
   else FElemContract.DB.Edit;

   if EditRadioButton.Checked then FElemContract.DB.FieldByName('CONTRACTTYPE').value := ContractTypeComboBox.EditValue;

    with FElemContract.DB.FieldByName('SIGNDATE') do
      if SignDateEdit.Date = 0 then Clear else Value := SignDateEdit.Date;

    with FElemContract.DB.FieldByName('FROMDATE') do
      if FromDateEdit.Date = 0 then Clear else Value := FromDateEdit.Date;

    if TillDateCheckBox.Enabled then
      with FElemContract.DB.FieldByName('TILLDATE') do
        if not TillDateCheckBox.Checked or (TillDateEdit.Date = 0) then Clear
        else Value := TillDateEdit.Date;

    FElemContract.DB.FieldByName('OURPERSONID').Value := OurPersonComboBox.EditValue;
    FElemContract.DB.FieldByName('ITSPERSONID').Value := ItsPersonComboBox.EditValue;

    with FElemContract.DB.FieldByName('ONLYREG') do
     if IsNull then AsBoolean := SaveRadioButton.Checked;

    with FElemContract.DB.FieldByName('WRITEDATE') do
     if IsNull then Value := Now;

    with ActionComboBox do
    case EditValue of
      nContractCreate: FElemContract.DB.FieldByName('NUMCONTRACT').Value := NumContractEdit.EditValue;
      nContractSendMail : FElemContract.DB.FieldByName('ISSEND').asBoolean := True;
      nContractPrint : FElemContract.DB.FieldByName('ISPRINTED').asBoolean := True;
      nContractSign : FElemContract.DB.FieldByName('ISSIGN').asBoolean := True;
      nContractRcvCopy:
      begin
        FElemContract.DB.FieldByName('ISRCVCOPY').asBoolean := True;
        FElemContract.DB.FieldByName('RCVCOPYMANID').asInteger := FCurrManager;
        FElemContract.DB.FieldByName('RCVCOPYDATE').AsDateTime := Now;
      end;
      nContractSentOrig: FElemContract.DB.FieldByName('ISSENDORIG').asBoolean:=True;

      nContractRcvOrig: begin
        FElemContract.DB.FieldByName('ISRCVORIG').asBoolean := True;
        FElemContract.DB.FieldByName('RCVORIGMANID').asInteger := FCurrManager;
        FElemContract.DB.FieldByName('RCVORIGDATE').AsDateTime := Now;
      end;
      nContractExtend: begin
        FElemContract.DB.FieldByName('RCVCOPYDATE').AsDateTime := Now;
        FElemContract.DB.FieldByName('IsExtend').asBoolean := True;
      end;
      nContractReReestr:
      begin
        FElemContract.DB.FieldByName('TILLDATE').AsDateTime := SignDateEdit.Date;
        NumContractEdit.EditValue := FCreateNumContract( SignDateEdit.Date );
      end;
      nContractFinish : FElemContract.DB.FieldByName('TILLDATE').AsDateTime := TillDateEdit.Date;
      nContractPermReReestr : FElemContract.DB.FieldByName('PERMREREESTR').asBoolean:= True;
    end;

   FSaveCompanyData( ActionTag );
end;

procedure TFrmContractEdit.FSaveCompanyData( ActionTag:Integer );
begin
  FElemCompany.DB.Edit;
  FElemCompany.DB.FieldByName('ISAGENT').AsBoolean:= True;
  FElemCompany.DB.FieldByName('ARENEWCONTRACT').AsBoolean:= True;

  if ActionTag = remStateAppend then
  begin
    FElemCompany.DB.FieldByName('DOCTODATE').Clear;
    FElemCompany.DB.FieldByName('STANDOC').Clear;
  end;
  FElemCompany.DB.Post;
end;

procedure TFrmContractEdit.FRefreshChangeControl(Sender: TObject);
begin
  FRefreshControls;
end;

procedure TFrmContractEdit.FPrepare;
begin

  self.FElemContract.DBOpen;
  self.FElemLog.DBOpen;
  self.FElemCompContractKind.DBOpen;
  ViewContractLog.Styles := FElemLog.View.Styles;
  ViewContractLog.DataController.DataSource := FElemLog.DS;

  FElemSelOurPersonQry.DBQuerySetParamValue( 'COMPANYID', OptionSet.LocaleCompany );
  if FIsNew then FElemSelOurPersonQry.DBQuerySetParamValue('PersonId',0)
  else FElemSelOurPersonQry.DBQuerySetParamValue( 'PersonId' , self.FElemContract.DB.FieldByName('OURPERSONID').Value );

  if FIsNew then FElemSeFromPartnerPersonQry.DBQuerySetParamValue('PersonId',0)
  else FElemSeFromPartnerPersonQry.DBQuerySetParamValue( 'PersonId' , self.FElemContract.DB.FieldByName('ITSPERSONID').Value );

  FElemSelOurPersonQry.DBOpen;
  FElemSeFromPartnerPersonQry.DBOpen;

  FPrepareDataControls( FisNew,FUpdate );

  FHookControlChangeValue := THookControlChangeValue.Create(self, FRefreshChangeControl );
  FRefreshControls;
  FShowData;
end;

procedure TFrmContractEdit.FPrepareActionComboBox(isNew:Boolean );
begin

  if isNew then
    if EditRadioButton.Checked then
      AdValueToCombox( ActionComboBox.Properties.Items, nContractCreate,'Створити угоду' )
    else AdValueToCombox( ActionComboBox.Properties.Items, nContractReestr,'Зареєструвати існуючу угоду' )
  else
    if not FElemContract.DB.FieldByName('ISSENDORIG').IsNull then
      AdValueToCombox( ActionComboBox.Properties.Items, nContractRcvOrig,'Отримати угоду, підписану партнером' )
    else
    if not FElemContract.DB.FieldByName('ISSIGN').IsNull then
      AdValueToCombox( ActionComboBox.Properties.Items, nContractSentOrig,'Надіслати угоду партнеру' )
    else
    if not FElemContract.DB.FieldByName('ISPRINTED').IsNull then
      AdValueToCombox( ActionComboBox.Properties.Items, nContractSign,'Підписати та пропечатати угоду' );

  if not isNew then
  begin
    AdValueToCombox( ActionComboBox.Properties.Items, nContractSendMail,'Відправити угоду по e-mail' );
    if not FElemContract.DB.FieldByName('ISSEND').IsNull then
      if FElemContract.DB.FieldByName('ISRCVCOPY').IsNull then
        AdValueToCombox( ActionComboBox.Properties.Items, nContractRcvCopy,'Приєднати файл копії угоди, підписаної партнером' )
      else
      if ((Date - FElemContract.DB.FieldByName('RCVCOPYDATE').asDateTime ) > nMaxPermDay) and
         ( FElemContract.DB.FieldByName('IsExtend').IsNull ) then
      AdValueToCombox( ActionComboBox.Properties.Items, nContractExtend,'Дозволити співпрацю по копії угоди' );
      AdValueToCombox( ActionComboBox.Properties.Items, nContractPrint,'Друкувати угоду' );

      //Lev := CurManagerPerms[uspDictCompany];
      if (FElemContract.DB.FieldByName('ISRCVORIG').IsNull){ or ( GetUspCanAdmin( LevMngPermis ) )} then
        if FElemContract.DB.FieldByName('PERMREREESTR').AsBoolean then
          AdValueToCombox( ActionComboBox.Properties.Items, nContractReReestr,'Перереєструвати угоду' )
        else
          AdValueToCombox( ActionComboBox.Properties.Items, nContractPermReReestr,'Дозволити перереєструвати угоду' );
        AdValueToCombox( ActionComboBox.Properties.Items, nContractFinish,'Припинити дію угоди' );
        if ( not FElemContract.DB.FieldByName('IsExtend').IsNull ) and
           ( FElemContract.DB.FieldByName('ISRCVORIG').IsNull ) then
         AdValueToCombox( ActionComboBox.Properties.Items, nContractExtend,'Дозволити співпрацю по копії угоди' );
  end;

end;

procedure TFrmContractEdit.FPrepareDataControls( isNew,Update:Boolean );
begin
  FPrepareActionComboBox( isNew );
  SetPropInCxExtLookupComboBox( ContractTypeComboBox, TcxGridDBTableView( FElemCompContractKind.ViewList ),'NAME', FElemCompContractKind.FieldKod, Update, false );
  SetPropInCxExtLookupComboBox( OurPersonComboBox, TcxGridDBTableView( FElemSelOurPersonQry.ViewList ),'CalcFullName', FElemSelOurPersonQry.FieldKod, Update, false );
  SetPropInCxExtLookupComboBox( ItsPersonComboBox, TcxGridDBTableView( FElemSeFromPartnerPersonQry.ViewList ),'CalcFullName', FElemSeFromPartnerPersonQry.FieldKod, Update, false );
end;

procedure TFrmContractEdit.FormDestroy(Sender: TObject);
begin
  FHookControlChangeValue.Close;
end;

function TFrmContractEdit.FCreateDocument(const DocName: String): Boolean;
var FN: String;
begin
  FN := GetDocumentFullName(self.FElemCompany, DocName );
  {$WARN UNSAFE_TYPE OFF}
  Result := CopyFile(PChar( GetLocalFileName( DocName ) ), PChar(FN), False);
  {$WARN UNSAFE_TYPE ON}
  if Result then SetFileAttrib(FN, True, True)
  else ErrorFmtDlg( SVDlgsFileCopyIntoFatal, [DocName, GetDocumentFolder(self.FElemCompany) ]);
end;

procedure TFrmContractEdit.FStoreDocument(const DocName: String);
begin
  if FCreateDocument(DocName) then
    FElemContract.DB.FieldByName('FILENAME').AsString := ExtractFileName( DocName );
end;

procedure TFrmContractEdit.AttachFileBtnClick(Sender: TObject);
var InitDir:string;
    CurrFile:string;
begin
  InitDir := OptionSet.InboxFolder;
  CurrFile := MySelectFile( InitDir, 'Документ (*.doc;*.rtf*.pdf;*.wri;*.mcw;*.wks)|*.doc;*.rtf;*.pdf;*.wri;*.mcw;*.wks|Cканована копія (*.jpg;*.jpeg;*.tif;*.tiff;*.bmp;*.gif)|*.jpg;*.jpeg;*.tif;*.tiff;*.bmp;*.gif|Факс-копія (*.fxd;*.fxr;*.fxs)|*.fxd;*.fxr;*.fxs|Всі файли (*.*)|*.*');
  if CurrFile <> '^' then
    FStoreDocument( CurrFile );
end;

procedure TFrmContractEdit.OkBtnClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmContractEdit.CancelBtnClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmContractEdit.EditRadioButtonClick(Sender: TObject);
var En: Boolean;
begin
{  if Assigned(Sender) then
  begin
    if self.FIsNew then
    begin
      SignDateEdit.Date := Date;
      FromDateEdit.Date := Date;
    end;

    with Sender as TcxRadioButton do En := Tag = 1;
    self.FPrepareActionComboBox( Self.FIsNew, Self.FLevMngPermis );

    if FReReestr then ActionComboBox.ItemId := nContractReReestr
    else ActionComboBox.ItemIndex := -1;
    if self.FIsNew then PrepareContractTypeComboBox;

    OnlyRegister := SaveRadioButton.Checked;
  end
  else En := False;

  AttachFileBtn.Visible := En;
  ToggleControlEnabled(NumContractEdit, En);
  ToggleContractState;}
end;

procedure TFrmContractEdit.ReviewCntrBtnClick(Sender: TObject);
begin
  newCreateContract(True);
end;

function MoveRcvCopy( ElemCompany :TDBShemaView ): Boolean;
var
  SR: TSearchRec;
  I: Integer;
  SourceDir, TargetDir: string;
begin
  Result := False;
  SourceDir := GetPatchPartnersDoc( ElemCompany, True);
  TargetDir := GetPatchPartnersDoc( ElemCompany );
  if not DirectoryExists(SourceDir) then
    Exit;
  if not ForceDirectories(TargetDir) then
    Exit;

  I := FindFirst(SourceDir + '*', faAnyFile, SR);
  try
    while I = 0 do
    begin
      if (SR.Name <> '') and (SR.Name <> '.') and (SR.Name <> '..') then
      begin
        Result := MoveFile(Pchar(SourceDir + SR.Name), 
              Pchar(TargetDir + SR.Name));
        if not Result then exit;
      end;
      I := FindNext(SR);
    end;
  finally
    SysUtils.FindClose(SR);
    RemoveDirectory(PChar(SourceDir));
  end;
end;

function GetPatchPartnersDoc( ElemCompany :TDBShemaView; InTmp: Boolean = False): string;
var Fldr: String;
    Temp: Integer;
begin
  Temp := GetKeyboardLayout(GetWindowThreadProcessId(GetForegroundWindow, nil));
//  ShowMessage(IntToStr(Temp));
  if Temp = 67699721 then ActivateKeyboardLayout(69338146, 0); //('Ukrainian') 
  Fldr := IncludeTrailingPathDelimiter( GetPartners_DocsStoreFolder( ElemCompany.GetValueIdStr ));
  if InTmp then Fldr := Fldr + 'Temp';    
  if not DirectoryExists(Fldr)
  then ForceDirectories(Fldr);
  Result := IncludeTrailingPathDelimiter(Fldr);
  Clipboard.AsText := Result;
  ActivateKeyboardLayout(Temp, 0);
end;

function CheckRcvDoc( ElemCompany :TDBShemaView ): Boolean;
var TmpPatch: string;
begin
  TmpPatch := GetPatchPartnersDoc( ElemCompany, True );
  Result := ConfirmDlgYC('Скопіюйте отриману угоду в папку. Шлях до неї записано в буфер обміну')
    and not PathIsDirectoryEmpty(PChar(TmpPatch));
  if Result then MoveRcvCopy( ElemCompany )
  else ErrorDlg('Копія угоди не збережена. Повторіть спробу.')
end;

function TFrmContractEdit.FCheckDataError( ElemCompany :TDBShemaView ):Boolean;
var Act:Boolean;
begin
  result := True;
  if ActionComboBox.EditValue =  null then exit;
  
  if self.FIsNew then
  begin
    result := newCreateContract;
  end;

  case ActionComboBox.EditValue of
   nContractSendMail: Act:= WarningDlgYN(sDictContractSendMail) and ( ContractSendMail(WordDocum,WordApplic, self.FElemCompany,Self.FElemContract, self.FElemEmailQry, self.FCurrManagerName ) );
   nContractPrint:  Act:= WarningDlgYN(sDictContractWarnPrint) and DoPrintContract( WordDocum, WordApplic,self.FElemCompany , self.FElemContract );
   nContractRcvCopy:  Act:= CheckRcvDoc( ElemCompany );
   nContractExtend:  Act:= WarningDlgYN(sDictContractContractExtend);
   nContractReReestr: Act:= FReReestr or
    ( WarningDlgYN(sDictContractContractReReestr) and WarningDlgYN(sDictContractContractReReestr2) );
   nContractFinish:  Act:= WarningDlgYN(sDictContractContractFinish);
   nContractPermReReestr:  Act:= WarningDlgYN(sDictContractContractPermReReestr);
  end;

end;

procedure TFrmContractEdit.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if self.ModalResult <> mrOK then Exit;
  CanClose := FCheckDataError( self.FElemCompany );

  if CanClose then
  begin
    self.FSaveData( FActionTag );
    CheckForMargeContract( ActionComboBox.EditValue, self.FElemCompany.GetValueId, self.FElemContract.GetValueId,self.FElemCompany, self.FMarkDifStyle );
  end;

end;

end.
