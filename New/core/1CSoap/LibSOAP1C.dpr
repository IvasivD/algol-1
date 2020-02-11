library LibSOAP1C;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  dxCore,
  Windows,
  SysUtils,
  Dialogs,
  Classes,
  SOAPHTTPClient,
  forms,
  iniFiles,
  IBQuery,
  IBDatabase,
  Math,
  DB,
  XSBuiltIns,
  SOAPHTTPTrans,
  DateUtils,
  Variants,
  IBUpdateSQL,
  Controls,
  cxStyles,
  IdHTTP,
  cxGridDBTableView,
  cxGridTableView,
  Buttons,
  Graphics,
  ceflib,
  UnitFunctSoapDll,
  UnitTourSoup in 'UnitTourSoup.pas',
  UnitProc in '..\UnitProc.pas',
  TourCmnlIf in '..\..\..\LIntf\TourCmnlIf.pas',
  frmCompareDataGrid in '..\frmCompareDataGrid.pas' {FrmCompareData},
  frmMergeLogSoap in '..\frmMergeLogSoap.pas' {frmMergeSoap},
  OptSet in '..\..\OptSet.pas',
  FrmProgress in '..\FrmProgress.pas' {FormProgres},
  UnitIBQuery in '..\UnitIBQuery.pas',
  UnitCompareDataGrid in '..\UnitCompareDataGrid.pas',
  UnitSoap1C in 'UnitSoap1C.pas',
  InptHistDlg in '..\..\..\LIntf\InptHistDlg.pas' {InputHistoryDlg},
  TourFiles in '..\..\..\LIntf\TourFiles.pas',
  ExtStream in '..\ExtStream.pas',
  TourConsts in '..\..\..\LIntf\TourConsts.pas',
  core in '..\core.pas',
  UnitEditText in '..\UnitEditText.pas' {FrmEditText},
  UnitWebSoap in '..\WEBSoap\UnitWebSoap.pas',
  UnitFunctWebSoap in '..\WEBSoap\UnitFunctWebSoap.pas',
  UnitStructrureWebSoap in '..\WEBSoap\UnitStructrureWebSoap.pas',
  UnitInputData in '..\UnitInputData.pas' {FrmInputData},
  UnitFunctLog in '..\LOG\UnitFunctLog.pas',
  MySimpleShareMem in '..\MySimpleShareMem.pas';

{$R *.res}
//******************************************************************************
function MergeClientTo1CByClientId( ParamSynchr : PParamSynchr; ClientId:Integer ):Integer;stdcall;
var CallSoap1C:TFunctCallSoap1C;
begin
  try
   CallSoap1C := TFunctCallSoap1C.Create(  ParamSynchr^.DBParam.PathDB , ParamSynchr^.DBParam.UID , ParamSynchr^.DBParam.Password , ParamSynchr^.StyleMarked, ParamSynchr^.ShowLoadCursor );

   result:=CallSoap1C.SynhronizationCompanyDBAnd1C( ParamSynchr^.MenId , ClientId, ParamSynchr^.ShowWhenDiferent , ParamSynchr^.SearchInDelete ,
                                                    ParamSynchr^.WriteLog , ParamSynchr^.ShowMessageError , ParamSynchr^.AutoMerge );
  finally
   CallSoap1C.Free;
  end;
end;
//******************************************************************************
function MergeClientAccountsTo1CByClientId( ParamSynchr : PParamSynchr; ClientId:Integer ): Integer;stdcall;
 var CallSoap1C:TFunctCallSoap1C;
begin
  try
   CallSoap1C := TFunctCallSoap1C.Create( ParamSynchr^.DBParam.PathDB , ParamSynchr^.DBParam.UID , ParamSynchr^.DBParam.Password , ParamSynchr^.StyleMarked, ParamSynchr^.ShowLoadCursor );

   result:=CallSoap1C.SynhronizationClientAndBankAccountsDBAnd1C( ParamSynchr^.MenId , ClientId, ParamSynchr^.ShowWhenDiferent , ParamSynchr^.SearchInDelete ,
                                                                  ParamSynchr^.WriteLog , ParamSynchr^.ShowMessageError , ParamSynchr^.AutoMerge );
  finally
   CallSoap1C.Free;
  end;
end;
//******************************************************************************
function MergeClientContractById( ParamSynchr : PParamSynchr; IdClient,IdContract:Integer ) : Integer;stdcall;
var CallSoap1C:TFunctCallSoap1C;
begin
  try
   CallSoap1C := TFunctCallSoap1C.Create(  ParamSynchr^.DBParam.PathDB , ParamSynchr^.DBParam.UID , ParamSynchr^.DBParam.Password , ParamSynchr^.StyleMarked, ParamSynchr^.ShowLoadCursor );
   result := CallSoap1C.SynhronizationClientAndContractDBAnd1CByContractId(  ParamSynchr^.MenId , IdClient, IdContract,  ParamSynchr^.WriteLog , ParamSynchr^.ShowMessageError , ParamSynchr^.AutoMerge );
  finally
   CallSoap1C.Free;
  end;
end;
//******************************************************************************
function MergeAllContractsForIdClient( ParamSynchr : PParamSynchr; IdClient:Integer ):integer;stdcall;
var CallSoap1C:TFunctCallSoap1C;
    DsContracts:TIBQuery;
    CountOk:Integer;
    Res:Integer;
begin
 try
   Result:=0;
   CallSoap1C := TFunctCallSoap1C.Create(  ParamSynchr^.DBParam.PathDB , ParamSynchr^.DBParam.UID , ParamSynchr^.DBParam.Password , ParamSynchr^.StyleMarked, ParamSynchr^.ShowLoadCursor );
   DsContracts:=CallSoap1C.GetAllContractsForClientId( IdClient );

   begin
     CountOk:=0;
     While not DsContracts.Eof do
     begin
       Res:= MergeClientContractById(ParamSynchr, IdClient , DsContracts.FieldByName('COMPCONTRACTID').AsInteger );
       if Res = 0 then Inc(CountOk);
       DsContracts.Next;
     end;
     if DsContracts.RecordCount = CountOk then Result:=0
     else Result:=-1;
   end;
 finally
   DsContracts.Close;
   CallSoap1C.DestroyDSQuery( DsContracts );
   CallSoap1C.Free;
 end;
end;
//******************************************************************************
procedure ShowMergeLog1C( ParamSynchr : PParamSynchr; IsAdmin:Boolean );stdcall;
var CallSoap1C:TFunctCallSoap1C;
begin
  try
    CallSoap1C := TFunctCallSoap1C.Create( ParamSynchr^.DBParam.PathDB , ParamSynchr^.DBParam.UID , ParamSynchr^.DBParam.Password , ParamSynchr^.StyleMarked, ParamSynchr^.ShowLoadCursor );
    CallSoap1C.ShowFindMergeSoap1CLog( ParamSynchr^.MenId, IsAdmin, ParamSynchr^.ShowWhenDiferent, ParamSynchr^.SearchInDelete, ParamSynchr^.WriteLog, ParamSynchr^.ShowMessageError, ParamSynchr^.AutoMerge );
  finally
    CallSoap1C.Free;
  end;
end;
//******************************************************************************
exports MergeClientTo1CByClientId,
        MergeClientAccountsTo1CByClientId,
        MergeClientContractById,
        MergeAllContractsForIdClient,
        ShowMergeLog1C;

begin
  dxInitialize;
end.
