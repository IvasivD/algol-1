unit ServModIB;

interface

uses
  SysUtils, Classes, IBDatabase, DB, IBCustomDataSet, IBQuery, cxTL,
  cxGridTableView, cxGridBandedTableView, cxStyles, cxGridCardView,
  cxClasses, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxCalendar, cxTextEdit, cxGridCustomTableView,
  cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, dxmdaset, ComCtrls,Forms,
  UnitPreviewFiles, Controls ,TourCmnlIf, UnitFunctSoapDll , 
  IBTable, cxImageComboBox, IBUpdateSQL, cxDBExtLookupComboBox, cxBlobEdit,Graphics,
  cxMemo, cxCheckBox, cxTimeEdit, cxButtonEdit,Core, cxImage, UnitFunctLog, ServModDic,
  ADODB, DocFileUn, cxDBTL, UnitFrameDic, Menus, ImgList, UnitVehiclePlace,UnitProjectProc,UnitProc;


type
  TStoreTaxSystemDataProc = procedure of object;

  TDMServIB = class(TDataModule)
    CITY_ADM_UNIT_ImgQry: TADOQuery;
    CITY_ADM_UNIT_ImgQryID: TIntegerField;
    CITY_ADM_UNIT_ImgQryID_CITY_ADM_UNIT: TIntegerField;
    CITY_ADM_UNIT_ImgQryFILENAME: TStringField;
    CITY_ADM_UNIT_ImgQryAORDER: TIntegerField;
    CITY_ADM_UNIT_ImgQryDESCRIPT: TMemoField;
    CITY_ADM_UNIT_ImgQrySHOWWEB: TIntegerField;
    CITY_ADM_UNIT_ImgSrc: TDataSource;
    CITY_ADM_UNIT_SUB_RELQry: TADOQuery;
    CITY_ADM_UNIT_SUB_RELQryID: TIntegerField;
    CITY_ADM_UNIT_SUB_RELQryID_CITY_ADM_UNIT: TIntegerField;
    CITY_ADM_UNIT_SUB_RELQryID_ADM_UNIT_SUB: TIntegerField;
    CITY_AMIN_UNIT_SUB_RELSrc: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
    procedure ItsKonsulQryCalcFields(DataSet: TDataSet);
    procedure SelVisaCentersQryCalcFields(DataSet: TDataSet);

    procedure CompanyDocsQry_CalcFields(DataSet: TDataSet);
    procedure ViewServiceTypeICONPropertiesCustomClick(Sender: TObject);
    procedure CompTaxSystemLogQryCalcFields(DataSet: TDataSet);

    procedure ViewTmUsersPermLayShemID_TMUSERS_PERM_PR_SHEMAPropertiesInitPopup(
      Sender: TObject);
    procedure PermRuleCopyClick(Sender: TObject);
    procedure PermRulePasteClick(Sender: TObject);
    procedure ViewTmUsersPermLayShemCustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);

  private

    FDraggedFile: Boolean;
    //function GetPathToDoc: string;
    function FGetParamSynchr( ShowWhenDiferent, AutoMerge:Boolean ):PParamSynchr;
  public
    //ViewFlesDocs: TViewFilesIE;
    ViewFlesDocItemRow: TcxCustomGridRecord;



    procedure ShowLngForCoutry( ElemCountry:TDBShemaView );
    procedure UpdateEmbassyQry;
    function  PrepareVehicleShema( Elem:TDBShema; View:TcxGridBandedTableView ):TVehiclePlaceView;

    property DraggedFile: Boolean read FDraggedFile write FDraggedFile;
  end;


  procedure ShowDicInternacionalOrg(Caption:widestring);
  procedure ShowDicLanguages( Caption :widestring );
  procedure ShowDicReligions( Caption :widestring );
  procedure ShowDicMeasur(Caption :widestring);
  procedure ShowDicTimeZone( Caption :widestring );
  procedure ShowDicCountriesTypeInfo( Caption :widestring );
  procedure ShowDicCarTypeInfo( Caption :widestring );
  procedure ShowDicPowerVolt( Caption :widestring );
  procedure ShowDicFregType( Caption :widestring );
  procedure ShowDicLngTrasnlTeplate( Caption :widestring );
  procedure ShowDicSchedItemToursWebTemplate( Caption :widestring );
  procedure ShowDicSchedItemToursWebTimeTemplate( Caption :widestring );
  procedure ShowDicDictSectItem( Caption :widestring );

  procedure ShowDicDictExcursion( Caption :widestring );
  procedure ShowDicExcursionByContent( Caption :widestring );
  procedure ShowDicExcursionByTypeTrip( Caption :widestring );
  procedure ShowDicExcursionPlace( Caption :widestring );

  procedure ShowDicServiceKind( Caption :widestring );
  procedure ShowDicServiceType( Caption :widestring );
  procedure ShowDicFormGovernment( Caption :widestring );
  procedure ShowDicServiceTypeConditions( Caption :widestring );
  procedure ShowDicFormOrg( Caption :widestring );
  procedure ShowDicActionComp( Caption :widestring );
  procedure ShowDicOccupations( Caption :widestring );
  procedure ShowCompDocType( Caption :widestring );
  procedure ShowCurrencyType( Caption :widestring );
  procedure ShowFeedType( Caption :widestring );
  procedure ShowOtherServices( Caption :widestring );
  procedure ShowSystemTaxBrowse(Caption:widestring);
  procedure ShowHotelCLASS ( Caption:WideString );
  procedure ShowBuilds ( Caption:WideString );
  procedure ShowDocVisa ( Caption:WideString );
  procedure ShowPasportKinds ( Caption:WideString );
  procedure ShowDicState ( Caption:WideString );
  procedure ShowDicReposKind( Caption:WideString );
  procedure ShowDicSponsor( Caption:WideString );
  procedure ShowDicPaymentBySponsor( Caption:WideString );
  procedure ShowKindStreet ( Caption:WideString );
  procedure ShowKindContract ( Caption:WideString );
  procedure ShowDicMismatchDoc( Caption:WideString );
  procedure ShowDicVisaDocType( Caption:WideString );
  procedure ShowDicDocFor( Caption:WideString );
  procedure ShowDicCreditCard( Caption:WideString );
  procedure ShowBank ( Caption:WideString );
  procedure ShowServicesBrowse(Caption:widestring);
  procedure ShowHtlGroup(Caption:widestring);
  procedure ShowHtlKind(Caption:widestring);
  procedure ShowRoomType(Caption:widestring);
  procedure ShowRoomExpandName(Caption:widestring);
  procedure ShowBedType(Caption:widestring);
  procedure ShowFeedTypes(Caption:widestring);
  procedure ShowComunicationTypes(Caption:widestring);
  //procedure ShowAdmin_unit ( Caption:WideString );
  procedure ShowAdmin_unitAndSub ( Caption:WideString );
  Procedure ShowCountryTemlAdminUnit( Caption:widestring );
  procedure ShowDicResort(Caption:widestring);
  procedure ShowDicNaturObj(Caption:widestring);
  procedure ShowDicInfraObj(Caption:widestring);
  procedure ShowDicCompParamName( Caption :widestring );
  procedure ShowDicCompParamKind( Caption :widestring );
  procedure ShowTourObjects( Caption:WideString );

var
  DMServIB: TDMServIB;

implementation

uses
  OptSet, TourMbplIf, OrderUn, StrUtils, Variants, Math,
  Dialogs, TourFiles , UnitProgresStop ,frmMergeResults,
  UnitDictionGrid, UnitLngTranslateEdit,UnitLngTranslate, 
  UnitIBQuery, TourConsts, ServMod,
  UnitFrameComRequisites, UnitEditInfoExcursion, CityNewForm;

{$R *.dfm}

procedure TDMServIB.DataModuleCreate(Sender: TObject);
begin

  //IBDatabase.LoginPrompt := False;
  //IBDatabase.DatabaseName := OptionSet.DatabaseFolder;
  //ChangeLogStrings(IBDatabase.Params);

  ViewFlesDocItemRow := nil;
  DraggedFile := False;

end;

{function TDMServIB.GetPathToDoc: string;
var Value: Variant;
begin
  Result := '';

  if Elem_CompanyDocsQry <> nil then
    if Elem_CompanyDocsQry.DB.FieldByName('DOCID').asInteger > 0 then
      Result := GetPartners_DocsStoreFolder( Elem_COMPANYQRY.GetValueIdStr ) + PathDelim + Elem_CompanyDocsQry.DB.FieldByName('DOCID').asString + PathDelim;
end; }

procedure TDMServIB.ItsKonsulQryCalcFields(DataSet: TDataSet);
const sSum = '%s %s за %d %s';
      sOnTour = '%s %s';
begin
(*  inherited;
  if {not ItsKonsulQryFUNDINGSUM.IsNull and} (Elem_ItsKonsulQry.DB.FieldByName('FUNDINGSUM').AsVariant > 0)
  then Elem_ItsKonsulQry.DB.FieldByName('CalcFundingSum').asString := Format(sSum, [Elem_ItsKonsulQry.DB.FieldByName('FUNDINGSUM').AsVariant,
    Val[Elem_ItsKonsulQry.DB.FieldByName('FUNDINGVAL').asInteger], Elem_ItsKonsulQry.DB.FieldByName('FUNDINGCOUNT').asInteger,
    Expire[Elem_ItsKonsulQry.DB.FieldByName('FUNDINGPERIOD').asInteger]]);

  with ItsKonsulQryBankSUM do  
  if (Value > 0) //and (Elem_ItsKonsulQry.DB.FieldByName('FUNDINGSUM').AsVariant > 0)
  then Elem_ItsKonsulQry.DB.FieldByName('CalcBankSum').asString := Format(sSum, [AsString,
    Val[Elem_ItsKonsulQry.DB.FieldByName('BANKVAL').asInteger], Elem_ItsKonsulQry.DB.FieldByName('BANKCOUNT').asInteger,
    Expire[Elem_ItsKonsulQry.DB.FieldByName('BANKPERIOD').asInteger]]);

  with ItsKonsulQryONTOURSUM do if Value > 0
  then Elem_ItsKonsulQry.DB.FieldByName('CalcOnTourSum').asString := Format(sOnTour, [AsString, 
    Val[Elem_ItsKonsulQry.DB.FieldByName('BANKVAL').asInteger]]);
    
  with ItsKonsulQryCITYNAME do  
  Elem_ItsKonsulQry.DB.FieldByName('CalcEmbassyName').asString := IfThen(Value <> EmptyStr, Value + ', ', EmptyStr) + 
    Elem_ItsKonsulQry.DB.FieldByName('EMBASSYNAME').asString;   *)
end;

procedure TDMServIB.SelVisaCentersQryCalcFields(DataSet: TDataSet);
const sOnTour = '%s %s';
      ReadyToDayArr: array[0..1] of string = ('кал.', 'роб.');
begin
 { with SelVisaCentersQryCITYNAME do
  Elem_SelVisaCentersQry.DB.FieldByName('CalcEmbassyName').asString := IfThen(Value <> EmptyStr, Value + ', ', EmptyStr) +
    Elem_SelVisaCentersQry.DB.FieldByName('EMBASSYNAME').asString;  

  with SelVisaCentersQrySERVCOST do if Value > 0 
  then Elem_SelVisaCentersQry.DB.FieldByName('CalcServCost').asString := Format(sOnTour, [AsString, 
    Val[Elem_SelVisaCentersQry.DB.FieldByName('SERVCOSTVAL').asInteger]]);

  with SelVisaCentersQryPAYBANKSERV do
  if not IsNull then Elem_SelVisaCentersQry.DB.FieldByName('CalcPayBank').asString :=
    FloatToStr(AsCurrency) + ' ' + Val[Elem_SelVisaCentersQry.DB.FieldByName('CURRSERV').asInteger];
  with SelVisaCentersQryREADYTODAYS do
  if not IsNull then Elem_SelVisaCentersQry.DB.FieldByName('CalcReadyToDay').asString := 
    Format('%d %s %s', [Value, ReadyToDayArr[Elem_SelVisaCentersQry.DB.FieldByName('READYTOTYPE').asInteger],
    ChangeDayLabel(Value) ]); }
end;

procedure TDMServIB.UpdateEmbassyQry;
begin
  Elem_ItsKonsulQry.DBQuerySetParamValue('CountryId',Elem_BrCountryQry.DB.FieldByName('COUNTRYID').asInteger );
  Elem_ItsKonsulQry.DBOpen(True);
end;

{procedure TDMServIB.ViewFilesFileSizeGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
begin
 if AText <> '' then
   AText :=  FormatFloat('### ###.##', Ceil(StrToFloat( AText) / 1024 ) )+' КБ';
end;  }

procedure TDMServIB.CompanyDocsQry_CalcFields(DataSet: TDataSet);
begin

end;

{procedure TDMServIB.ViewCompanyDocsMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var HitTest: TcxCustomGridHitTest;
begin
  HitTest := ViewCompanyDocs.ViewInfo.GetHitTest(X, Y);
  if ( HitTest<>nil )and( HitTest is TcxGridRecordCellHitTest ) and DraggedFile then begin
    ViewFlesDocItemRow := TcxGridRecordCellHitTest(HitTest).GridRecord;
    ViewFlesDocItemRow.Selected := True;
    ViewFlesDocItemRow.Focused := True;
    DraggedFile := False;
  end;
end; }
//******************************************************************************

function TDMServIB.FGetParamSynchr( ShowWhenDiferent, AutoMerge:Boolean ):PParamSynchr;
begin
   new(result);
   result.DBParam:= Elem_COMPANYQRY.DBGetParamConnect;
   result.MenId := DMServ.CurManager;
   result.ShowLoadCursor := True;
   result.ShowWhenDiferent := ShowWhenDiferent;
   Result.AutoMerge := AutoMerge;
   result.StyleMarked := DMServDic.cxStyle216;
   result.SearchInDelete := True;
   result.WriteLog  := True;
   result.ShowMessageError := True;
end;
//******************************************************************************
procedure ShowDicInternacionalOrg( Caption :widestring );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic(ParamDicForm);
  ParamDicForm.Func.LogProc := ShowLog;
  ParamDicForm.Description.ImageWebPath := OptionSet.WebPathToImage+'INTERNACIONALORG\';
  ParamDicForm.Description.DescriptionWebPath :=  OptionSet.WebPathToHtml + 'INTERNACIONALORG\';
  ParamDicForm.Description.DescriptionHeight := 150;

  ShowEditDict(Caption , [Elem_InternacionalOrg], [alClient], 900, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowDicLanguages( Caption :widestring );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic(ParamDicForm);
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict( Caption, [Elem_Language], [alClient], 600, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowDicReligions( Caption :widestring );
var aView:TcxGRidDBTableView;
    ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic(ParamDicForm);
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict( Caption , [Elem_Religion],[alClient], 400, 650, DMServ.CurManager, [ParamDicForm]  );
end;

procedure ShowDicMeasur(Caption :widestring);
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic(ParamDicForm);
  ParamDicForm.Func.LogProc := ShowLog;
  ParamDicForm.lng.WidthLngForm:=980;
  ShowEditDict( Caption, [Elem_UNIT_MEASUR],[alClient], 780, 650,DMServ.CurManager,  [ParamDicForm] );
end;

procedure ShowDicCarTypeInfo( Caption :widestring );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic(ParamDicForm);
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict( Caption, [Elem_CAR_TYPE_INFO],[alClient], 780, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowDicCompParamName( Caption :widestring );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic(ParamDicForm);
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict( Caption, [Elem_COMPANIES_PARAM_NAME],[alClient], 780, 650, DMServ.CurManager, [ParamDicForm] );
  {PrepareDefaultParamDic(ParamDicFormMain);
  PrepareDefaultParamDic(ParamDicFormDetail);

  ShowEditDictDetail( Caption, Elem_COMPANIES_PARAM_KIND,Elem_COMPANIES_PARAM_NAME, nil,
                      800, 650,DMServ.CurManager, ParamDicFormMain, ParamDicFormDetail ); }
end;

procedure ShowDicCompParamKind( Caption :widestring );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic(ParamDicForm);
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict( Caption, [Elem_COMPANIES_PARAM_KIND],[alClient], 600, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowDicPowerVolt( Caption :widestring );
var ParamDicForm: TParamFormDict;
begin
  try
    Elem_Power_Volt_Freq.SetFilterOnView( ['ATYPE'],['0'],['='] );
    Elem_Power_Volt_Freq.SetDefaultValue( ['ATYPE','ID_UNIT_MEASUR'], [0,4] );

    PrepareDefaultParamDic(ParamDicForm);
    ParamDicForm.Func.LogProc := ShowLog;
    ShowEditDictModal( Caption, [Elem_Power_Volt_Freq],[alClient], 400, 500,DMServ.CurManager, [ParamDicForm] );
  finally
    Elem_Power_Volt_Freq.ClearFilterOnView;
  end;
end;

procedure ShowDicFregType( Caption :widestring );
var ParamDicForm: TParamFormDict;
begin
  try
    Elem_Power_Volt_Freq.SetFilterOnView( ['ATYPE'],['1'],['='] );
    Elem_Power_Volt_Freq.SetDefaultValue( ['ATYPE','ID_UNIT_MEASUR'], [1,5] );

    PrepareDefaultParamDic(ParamDicForm);
    ParamDicForm.Func.LogProc := ShowLog;
    ShowEditDictModal( Caption, [Elem_Power_Volt_Freq],[alClient],  400, 500,DMServ.CurManager,[ParamDicForm] );
  finally
    Elem_Power_Volt_Freq.ClearFilterOnView;
  end;
end;

procedure ShowDicLngTrasnlTeplate( Caption :widestring );
var ParamDicFormMain: TParamFormDict;
    ParamDicFormDetail: TParamFormDict;
begin
  //try
  //  Elem_Language.SetFilterOnViewList( ['ACTIVE_TRANSLATE'], [1], ['='], cxFilter.fboOr );

  PrepareDefaultParamDic( ParamDicFormMain );
  PrepareDefaultParamDic( ParamDicFormDetail );

  //ShowEditDictDetail( Caption, Elem_LNG_TRANSLATE_TEMPLATE,Elem_LNG_TRANSL_TEMP_DETAIL,nil, 800, 650,DMServ.CurManager,
  //                    ParamDicFormMain, ParamDicFormDetail );
  ParamDicFormMain.PanelGridHeight := 350;
  ParamDicFormMain.Func.LogProc := ShowLog;
  ParamDicFormDetail.Func.LogProc := ShowLog;

  ShowEditDict( Caption, [Elem_LNG_TRANSLATE_TEMPLATE,Elem_LNG_TRANSL_TEMP_DETAIL],[alTop,alClient], 800, 650,DMServ.CurManager,
               [ParamDicFormMain, ParamDicFormDetail] );

  //finally
  //  Elem_Language.ClearFilterOnViewList;
  //end;
end;

procedure ShowDicCountriesTypeInfo( Caption :widestring );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic(ParamDicForm);
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict( Caption, [Elem_COUNTRIES_TYPE_INFO],[alClient],600, 650, DMServ.CurManager, ParamDicForm );
end;

procedure ShowDicTimeZone( Caption :widestring );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic(ParamDicForm);
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict( Caption , [Elem_TIME_ZONE],[alClient], 400, 650,DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowDicSchedItemToursWebTemplate( Caption :widestring );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic(ParamDicForm);
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict( Caption, [Elem_SCHEDITEM_TOURS_WEB_TEMPLATE], [alClient], 800, 650,DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowDicSchedItemToursWebTimeTemplate( Caption :widestring );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic(ParamDicForm);
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict( Caption, [Elem_SCHEDITEM_TOURS_WEB_TIME],[alClient], 900, 650,DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowDicDictSectItem( Caption :widestring );
var ParamDicFormMain: TParamFormDict;
    ParamDicFormDetail: TParamFormDict;
begin
  PrepareDefaultParamDic(ParamDicFormMain);
  PrepareDefaultParamDic(ParamDicFormDetail);
  ParamDicFormMain.PanelGridHeight := 350;
  ParamDicFormMain.Func.LogProc := ShowLog;
  ParamDicFormMain.Description.DescriptionStafField := 'COMMENTS';
  ParamDicFormMain.Description.DescriptionHeight := 50;

  ParamDicFormDetail.Func.LogProc := ShowLog;
  ParamDicFormDetail.Description.DescriptionStafField := 'COMMENTS';
  ParamDicFormDetail.Description.DescriptionHeight := 50;
  //ShowEditDictDetail( Caption, [Elem_DictSectQry,Elem_DictSect_ItemQry], [alTop,alClient], 800, 650,DMServ.CurManager, [ParamDicFormMain, ParamDicFormDetail] );

  ShowEditDict( Caption, [Elem_DictSectQry,Elem_DictSect_ItemQry], [alTop,alClient], 600, 650, DMServ.CurManager, [ParamDicFormMain, ParamDicFormDetail] );
end;

procedure UpdateExcursionFormGridView (isNew : boolean; CurManager:Integer );
begin
  ShowEditInfoExcursion( isNew, OptionSet.WebPathToHtml  + 'EXCURSION\' , OptionSet.WebPathToImage + 'EXCURSION\',CurManager <> 0 );
  // Elem_EXCURSIONQry.Requery;
end;

procedure ShowDicDictExcursion( Caption :widestring );
var ParamDicFormCountry: TParamFormDict;
    ParamDicFormCity: TParamFormDict;
    ParamDicFormExcurs: TParamFormDict;
begin
  PrepareDefaultParamDic(ParamDicFormCountry);
  PrepareDefaultParamDic(ParamDicFormCity);
  PrepareDefaultParamDic(ParamDicFormExcurs);

  ParamDicFormCountry.PanelGridWidth := 250;
  ParamDicFormCountry.Update.VisibleUpdate := False;
  ParamDicFormCountry.paramAlignPanel.IndexPanel := 0;
  ParamDicFormCountry.paramAlignPanel.Align := alLeft;
  ParamDicFormCountry.paramAlignPanel.Splitter := True;
  ParamDicFormCountry.paramAlignPanel.SplitterAlign := alLeft;

  ParamDicFormCity.Update.VisibleUpdate := False;
  ParamDicFormCity.PanelGridHeight := 300;
  ParamDicFormCity.paramAlignPanel.IndexPanel := 1;
  ParamDicFormCity.paramAlignPanel.Align := alClient;
  ParamDicFormCity.paramAlignPanel.SplitterAlign := alTop;
  ParamDicFormCity.paramAlignPanel.Splitter := True;
  ParamDicFormCity.paramAlignPanel.SpliterOnPanel := True;

  ParamDicFormExcurs.Func.LogProc := ShowLog;
  ParamDicFormExcurs.paramAlignPanel.IndexPanel := 1;
  ParamDicFormExcurs.Func.AddProcGridView := UpdateExcursionFormGridView;

  ShowEditDict( Caption, [Elem_BrCountryQry, Elem_ExcursCityQry, Elem_EXCURSIONQry], [alClient,alTop,alClient], 1000, 650, DMServ.CurManager, [ParamDicFormCountry, ParamDicFormCity, ParamDicFormExcurs] );
end;

procedure ShowDicExcursionPlace( Caption :widestring );
var ParamDicForm: TParamFormDict;
    aFrmEditDict:TFrmEditDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict( Caption, [Elem_EXCURSION_PLACEQry],[alClient], 600, 450,DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowDicExcursionByContent( Caption :widestring );
var ParamDicForm: TParamFormDict;
    aFrmEditDict:TFrmEditDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict( Caption, [Elem_EXCURS_TYPE_CONTENTQry],[alClient], 600, 450,DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowDicExcursionByTypeTrip( Caption :widestring );
var ParamDicForm: TParamFormDict;
    aFrmEditDict:TFrmEditDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict( Caption, [Elem_EXCURS_TYPE_TRIPQry],[alClient], 600, 450,DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowDicServiceKind( Caption :widestring );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict( Caption, [Elem_SERVICESKINDQry], [alClient], 900, 650,DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowDicServiceType( Caption :widestring );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict( Caption, [Elem_SERVICE_TYPEQry], [alClient], 900, 650,DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowDicFormGovernment( Caption :widestring );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ParamDicForm.Description.DescriptionWebPath :=  OptionSet.WebPathToHtml + 'FORMGOVERNMENT\';
  ParamDicForm.Description.DescriptionHeight := 150;
  ParamDicForm.Description.ImageWebPath := OptionSet.WebPathToImage+'FORMGOVERNMENT\';
  ShowEditDict( Caption , [Elem_Form_Government], [alClient], 900, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowDicFormOrg( Caption :widestring );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ParamDicForm.lng.WidthLngForm := 1200;
  ShowEditDict(Caption ,[ Elem_CompOrgFrmQry ], [alClient], 900, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowDicActionComp( Caption :widestring );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ParamDicForm.lng.WidthLngForm := 1200;
  ShowEditDict(Caption , [Elem_COMPACTIONS], [alClient], 600, 650, DMServ.CurManager, [ParamDicForm] );
end;

{procedure ShowDicUserCategory( Caption :widestring );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ParamDicForm.lng.WidthLngForm := 1200;
  ShowEditDict(Caption , [Elem_UserCategory], [alClient], 600, 650, DMServ.CurManager, [ParamDicForm] );
end; }

{procedure ShowDicPermTable( Caption :WideString );
var ParamDicForm: TParamFormDict;
    ParamDicFormDetail : TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ParamDicForm.paramAlignPanel.Splitter := True;
  ParamDicForm.paramAlignPanel.SplitterAlign := alTop;
  ParamDicForm.PanelGridHeight := 350;

  PrepareDefaultParamDic(ParamDicFormDetail);
  ParamDicFormDetail.Func.LogProc := ShowLog;

  ShowEditDict(Caption , [Elem_PERMIS_TABLEQry, Elem_PERMIS_TABLE_DETAIL], [alTop,alClient], 600, 850, DMServ.CurManager, [ ParamDicForm, ParamDicFormDetail ] );
end;

procedure ShowDicPrShemaPerm( Caption :WideString );
var ParamDicForm: TParamFormDict;
    ParamDicFormDetail : TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ParamDicForm.paramAlignPanel.Splitter := True;
  ParamDicForm.paramAlignPanel.SplitterAlign := alTop;
  ParamDicForm.PanelGridHeight := 350;

  PrepareDefaultParamDic(ParamDicFormDetail);
  ParamDicFormDetail.Func.LogProc := ShowLog;
  Elem_PERMIS_TABLEQry.DBOpen;

  ShowEditDict(Caption , [Elem_TMUSERS_PERM_PR, Elem_TMUSERS_PERM_PR_SHEMA], [alTop,alClient], 600, 850, DMServ.CurManager, [ ParamDicForm, ParamDicFormDetail ] );
end;

procedure ShowDicPrShemaPermLayout( Caption :WideString );          // шаблони правил
var ParamDicForm: TParamFormDict;
    ParamDicFormDetail : TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ParamDicForm.paramAlignPanel.Splitter := True;
  ParamDicForm.paramAlignPanel.SplitterAlign := alTop;
  ParamDicForm.PanelGridHeight := 350;

  PrepareDefaultParamDic(ParamDicFormDetail);
  ParamDicFormDetail.Func.LogProc := ShowLog;
  Elem_TMUSERS_PERM_PR.DBOpen;
  Elem_TMUSERS_PERM_PR_SHEMA.DBOpen;

  ShowEditDict(Caption , [Elem_TMUSERS_PERM_LAYOUTQry, Elem_TMUSERS_PERM_LAY_SHEMQry], [alTop,alClient], 600, 850, DMServ.CurManager, [ ParamDicForm, ParamDicFormDetail ] );
end;

procedure ShowDicPrShemaPermUserCat( Caption :WideString );     // групові права доступу
var ParamDicForm: TParamFormDict;
    ParamDicFormDetail : TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ParamDicForm.paramAlignPanel.Splitter := True;
  ParamDicForm.paramAlignPanel.SplitterAlign := alTop;
  ParamDicForm.PanelGridHeight := 350;

  PrepareDefaultParamDic(ParamDicFormDetail);
  ParamDicFormDetail.Func.LogProc := ShowLog;
  Elem_TMUSERS_PERM_LAYOUTQry.DBOpen;

  ShowEditDict(Caption , [Elem_UserCategory, Elem_TMUSERS_PERM_USER_CATQry], [alTop,alClient], 600, 600, DMServ.CurManager, [ ParamDicForm, ParamDicFormDetail ] );
end; }


procedure ShowDicOccupations( Caption :widestring );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ParamDicForm.lng.WidthLngForm := 1200;
  ShowEditDict(Caption , [Elem_OCCUPATIONS], [alClient], 600, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowCompDocType( Caption :widestring );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ParamDicForm.lng.WidthLngForm := 1200;
  ShowEditDict(Caption , [Elem_COMP_TYPEDOCUM], [alClient], 900, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowCurrencyType( Caption :widestring );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ParamDicForm.lng.WidthLngForm := 1200;
  ShowEditDict(Caption , [Elem_CurrencyQry], [alClient], 900, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowFeedType( Caption :widestring );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict(Caption , [Elem_FEEDTYPES], [alClient], 900, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowOtherServices( Caption :widestring );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict(Caption , [Elem_OTHERSERVICE], [alClient], 900, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowInfra( Caption :widestring );
var ParamDicForm: TParamFormDict;
begin
  //PrepareDefaultParamDic( ParamDicForm );
  //ShowEditDict(Caption , Elem_InfraQry, nil, 900, 650, DMServ.CurManager, ParamDicForm );
end;

procedure ShowBuilds ( Caption:WideString );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ParamDicForm.Description.DescriptionHeight := 50;
  ParamDicForm.Description.DescriptionStafField := 'COMMENTS';
  ShowEditDict(Caption ,[ Elem_BuildsQry], [alClient], 600, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowHotelCLASS ( Caption:WideString );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict(Caption , [Elem_HotelCLASSQry], [alClient], 900, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowDocVisa ( Caption:WideString );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ParamDicForm.Description.DescriptionHeight := 50;
  ParamDicForm.Description.DescriptionStafField := 'MEMO';
  ShowEditDict(Caption ,[ Elem_DocumVisaQry ], [alClient], 600, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowPasportKinds ( Caption:WideString );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict(Caption ,[ Elem_PASSPORTKINDS ], [alClient], 600, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowDicState ( Caption:WideString );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict(Caption ,[ Elem_STATUSDOC ], [alClient], 400, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowDicReposKind( Caption:WideString );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict(Caption ,[ Elem_REPOSKIND ], [alClient], 600, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowDicSponsor( Caption:WideString );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict( Caption ,[ Elem_SPONSOR ], [alClient], 400, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowDicPaymentBySponsor( Caption:WideString );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict( Caption ,[ Elem_PAYMENT_BYSPONSOR ], [alClient], 400, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowKindStreet ( Caption:WideString );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict(Caption , [Elem_KindStreetQry], [alClient], 400, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowKindContract ( Caption:WideString );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict(Caption , [Elem_COMP_CONTRACTS_KINDQry], [alClient], 900, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowDicMismatchDoc( Caption:WideString );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict( Caption ,[ Elem_MISMATCHQry ], [alClient], 400, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowDicVisaDocType( Caption:WideString );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict( Caption ,[ Elem_VISADOCTYPEQry ], [alClient], 600, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowDicDocFor( Caption:WideString );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict( Caption ,[ Elem_DocForQry ], [alClient], 400, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowDicCreditCard( Caption:WideString );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict( Caption ,[ Elem_CREDITCARDSQry ], [alClient], 600, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowBank ( Caption:WideString );
var ParamDicForm: TParamFormDict;
begin
  Elem_BrCountryQry.DBOpen;

  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ParamDicForm.Description.DescriptionHeight := 50;
  ParamDicForm.Description.DescriptionStafField :='MEMO';
  ShowEditDict(Caption , [Elem_BankQry], [alClient], 1400, 850, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowTourObjects( Caption:WideString );
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  Elem_CITY_ADM_UNT_ITEMS_TYPEQry.View.GetColumnByFieldName(Elem_CITY_ADM_UNT_ITEMS_TYPEQry.FieldNumber).Visible := True;
  Elem_CITY_ADM_UNT_ITEMS_TYPEQry.View.GetColumnByFieldName('ID_PARENT_FORTREE').Visible := True;
  ShowEditDict(Caption , [Elem_CITY_ADM_UNT_ITEMS_TYPEQry], [alClient], 600, 450, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowAdmin_unitAndSub ( Caption:WideString );
var ParamDicFormMain: TParamFormDict;
    ParamDicFormDetail: TParamFormDict;
    ParamDicFormSubDetail: TParamFormDict;
begin
  PrepareDefaultParamDic(ParamDicFormMain);
  PrepareDefaultParamDic(ParamDicFormDetail);
  PrepareDefaultParamDic(ParamDicFormSubDetail);

  ParamDicFormMain.Func.LogProc := ShowLog;
  ParamDicFormMain.PanelGridWidth := 200;
  ParamDicFormMain.Update.VisibleUpdate := False;
  ParamDicFormMain.paramAlignPanel.IndexPanel := 0;
  ParamDicFormMain.paramAlignPanel.Align := alLeft;
  ParamDicFormMain.paramAlignPanel.Splitter := True;
  ParamDicFormMain.paramAlignPanel.SplitterAlign := alLeft;

  ParamDicFormDetail.Func.LogProc := ShowLog;
  ParamDicFormDetail.paramAlignPanel.IndexPanel := 1;
  ParamDicFormDetail.paramAlignPanel.Align := alClient;
  //ParamDicFormDetail.paramAlignPanel.Splitter := True;

  ParamDicFormSubDetail.Func.LogProc :=ShowLog;
  ParamDicFormSubDetail.PanelGridHeight := 250;
  ParamDicFormSubDetail.paramAlignPanel.IndexPanel := 1;
  ParamDicFormSubDetail.paramAlignPanel.SplitterAlign := alBottom;
  ParamDicFormSubDetail.paramAlignPanel.Splitter := True;
  ParamDicFormSubDetail.paramAlignPanel.SpliterOnPanel := True;

  try
    Elem_CITY_ADM_UNT_ITEMS_TYPEQry.View.GetColumnByFieldName(Elem_CITY_ADM_UNT_ITEMS_TYPEQry.FieldNumber).Visible := False;
    Elem_CITY_ADM_UNT_ITEMS_TYPEQry.View.GetColumnByFieldName('ID_PARENT_FORTREE').Visible := False;

    ShowEditDict( Caption, [ Elem_CITY_ADM_UNT_ITEMS_TYPEQry, Elem_Admin_unitQry,Elem_Admin_unit_SubQry   ], [alClient,alClient,alBottom],    // Elem_Admin_unit_SubQry
                  800, 650, DMServ.CurManager, [ParamDicFormMain, ParamDicFormDetail,ParamDicFormSubDetail] );
  finally
    Elem_CITY_ADM_UNT_ITEMS_TYPEQry.View.GetColumnByFieldName(Elem_CITY_ADM_UNT_ITEMS_TYPEQry.FieldNumber).Visible := True;
    Elem_CITY_ADM_UNT_ITEMS_TYPEQry.View.GetColumnByFieldName('ID_PARENT_FORTREE').Visible := True;
  end;
end;

procedure ShowDicServiceTypeConditions( Caption :widestring );
var ParamDicFormMain: TParamFormDict;
    ParamDicFormDetail: TParamFormDict;
begin
  PrepareDefaultParamDic(ParamDicFormMain);
  PrepareDefaultParamDic(ParamDicFormDetail);
  ParamDicFormMain.Func.LogProc := ShowLog;
  ParamDicFormDetail.Func.LogProc := ShowLog;

  ParamDicFormMain.PanelGridHeight := 350;
  ShowEditDict( Caption, [Elem_SERVICESKINDQry,Elem_SERVICE_TYPE_CONDITIONQry],[alTop,alClient],
                800, 650,DMServ.CurManager, [ParamDicFormMain, ParamDicFormDetail] );
end;

procedure ShowSystemTaxBrowse(Caption:widestring);
var ParamDicFormMain: TParamFormDict;
    ParamDicFormDetail: TParamFormDict;
begin
  PrepareDefaultParamDic(ParamDicFormMain);
  PrepareDefaultParamDic(ParamDicFormDetail);
  ParamDicFormMain.Func.LogProc := ShowLog;
  ParamDicFormMain.Description.DescriptionStafField :='COMMENTS';
  ParamDicFormMain.Description.DescriptionHeight := 50;

  ParamDicFormDetail.Func.LogProc := ShowLog;

  ParamDicFormMain.PanelGridHeight := 350;
  ShowEditDict( Caption, [Elem_TAXSYSTEMQry, Elem_TAXSYSTEMDetailQry], [alTop,alClient],
                800, 650,DMServ.CurManager, [ParamDicFormMain, ParamDicFormDetail] );
end;

procedure ShowServicesBrowse(Caption:widestring);
var ParamDicFormMain: TParamFormDict;
    ParamDicFormDetail: TParamFormDict;
begin
  PrepareDefaultParamDic(ParamDicFormMain);
  PrepareDefaultParamDic(ParamDicFormDetail);

  ParamDicFormMain.Func.LogProc := ShowLog;
  ParamDicFormMain.Description.DescriptionStafField:= 'COMMENTS';
  ParamDicFormMain.Description.DescriptionHeight := 50;

  ParamDicFormDetail.Func.LogProc := ShowLog;
  ParamDicFormDetail.Description.DescriptionStafField:= 'MEMO';
  ParamDicFormDetail.Description.DescriptionHeight := 50;
  
  ParamDicFormMain.PanelGridHeight := 350;
  ShowEditDict( Caption, [Elem_SERVGROUPQry, Elem_SERVICEQry], [alTop,alClient],
                800, 650,DMServ.CurManager, [ParamDicFormMain, ParamDicFormDetail] );
end;

procedure ShowHtlGroup(Caption:widestring);
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ParamDicForm.Img.FieldImageShow := 'LogoImage';
  ParamDicForm.Img.PathFieldImageShow := CheckLastSleshOnPath(  GetGroupLogoFileFolder, True );
  ParamDicForm.Description.DescriptionStafField := 'MEMO';
  ParamDicForm.Description.DescriptionHeight := 50;
  ShowEditDict(Caption , [Elem_HTLGRPQry], [alClient], 800, 600, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowHtlKind(Caption:widestring);
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ShowEditDict(Caption , [Elem_HotelKindQry], [alClient], 600, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowRoomType(Caption:widestring);
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ParamDicForm.Description.DescriptionHeight := 50;
  ParamDicForm.Description.DescriptionStafField :='MEMO';
  ShowEditDict(Caption , [Elem_RoomTypeQry], [alClient], 600, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowRoomExpandName(Caption:widestring);
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ParamDicForm.Description.DescriptionHeight := 50;
  ParamDicForm.Description.DescriptionStafField :='COMMENTS';

  ShowEditDict(Caption , [Elem_ExpandNameQry], [alClient], 600, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowBedType(Caption:widestring);
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ParamDicForm.Description.DescriptionHeight := 50;
  ParamDicForm.Description.DescriptionStafField := 'MEMO';

  ShowEditDict( Caption , [Elem_BedTypeQry], [alClient], 600, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowFeedTypes(Caption:widestring);
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;
  ParamDicForm.Description.DescriptionHeight := 50;
  ParamDicForm.Description.DescriptionStafField := 'MEMO';

  ShowEditDict( Caption , [Elem_FEEDTYPES], [alClient], 400, 650, DMServ.CurManager, [ParamDicForm] );
end;

procedure ShowComunicationTypes(Caption:widestring);
var ParamDicForm: TParamFormDict;
begin
  PrepareDefaultParamDic( ParamDicForm );
  ParamDicForm.Func.LogProc := ShowLog;

  ShowEditDict( Caption , [Elem_Comunication_TypeQry], [alClient], 1200, 650, DMServ.CurManager, [ParamDicForm] );
end;

Procedure ShowCountryTemlAdminUnit( Caption:widestring );
var ParamDicFormMain: TParamFormDict;
    ParamDicFormDetail: TParamFormDict;
begin
  PrepareDefaultParamDic(ParamDicFormMain);
  PrepareDefaultParamDic(ParamDicFormDetail);
  ParamDicFormMain.Func.LogProc := ShowLog;
  ParamDicFormDetail.Func.LogProc := ShowLog;

  ParamDicFormMain.PanelGridHeight := 400;
  ShowEditDict( Caption,[ Elem_BrCountryQry, Elem_COUNTRY_TEMPL_ADM_UNITQry], [ alTop,alClient ],
                800, 650,DMServ.CurManager, [ParamDicFormMain, ParamDicFormDetail] );
end;

procedure InitElemCityAdmObjImg( MainElem:TDBShemaView;var ElemCityAdmObjSUBRel: TDBShema; var ElemCityAdmObjImg:TDBShemaView );
begin
  DMServIB.CITY_ADM_UNIT_SUB_RELQry.DataSource := MainElem.DS;
  ElemCityAdmObjSUBRel :=  TDBShema.Create( DMServIB.CITY_ADM_UNIT_SUB_RELQry,  'CITY_ADM_UNIT_SUB_REL', 'ID', 'gen_city_adm_unit_sub_rel_id' );
  ElemCityAdmObjSUBRel.AddMainElem( MainElem, 'ID_CITY_ADM_UNIT' );
  ElemCityAdmObjSUBRel.AskBeforeDelete := False;

  DMServIB.CITY_ADM_UNIT_ImgQry.DataSource := MainElem.DS;
  ElemCityAdmObjImg := TDBShemaView.Create( DMServIB.CITY_ADM_UNIT_ImgQry, nil, 'CITY_ADM_UNIT_IMG', 'ID', 'gen_city_adm_unit_img_id','AORDER' );
  ElemCityAdmObjImg.AddMainElem( MainElem, 'ID_CITY_ADM_UNIT' );
  ElemCityAdmObjImg.SetDefaultValue( ['SHOWWEB'], [1] );
end;

procedure UpdateResortFormGridView ( isNew : boolean; CurManager:Integer );
var ParamEdiInfoCity : TParamEdiInfoCity;
    AddParam:TOptAddTreeNode;
    aElem_CityAdmObj_SUB_RELQry:TDBShema;
    aElemCityAdmObjImg:TDBShemaView;
begin
  try
    InitElemCityAdmObjImg( Elem_ResortQry, aElem_CityAdmObj_SUB_RELQry, aElemCityAdmObjImg );

    ParamEdiInfoCity.ElemCityAdmUntItemsType := Elem_CITY_ADM_UNT_ITEMS_TYPEQry;
    ParamEdiInfoCity.ElemCITYADMUNITINFOQry := Elem_CITY_ADM_UNIT_INFOQry;
    ParamEdiInfoCity.ElemAdminUnitQry := Elem_Admin_unitQry;

    ParamEdiInfoCity.ElemAdminUnitSubQry := Elem_Admin_Unit_SubQry;
    ParamEdiInfoCity.ElemAdminUnitSubRelQry := aElem_CityAdmObj_SUB_RELQry;

    ParamEdiInfoCity.ElemCountry := Elem_BrCountryQry;
    ParamEdiInfoCity.ElemCity := Elem_ResortQry;

    ParamEdiInfoCity.ElemCityIMG  := aElemCityAdmObjImg;

    ParamEdiInfoCity.PathToImageCity := OptionSet.WebPathToImage + 'CITY_AMD_UNIT\RESORT\';
    ParamEdiInfoCity.PathToHtmlCity  := OptionSet.WebPathToHtml + 'CITY_AMD_UNIT\RESORT\';

    ParamEdiInfoCity.TypeAdminUnit := 2;

    if isNew then AddParam := OptTreeNodeAddInsert
    else AddParam := OptTreeNodeAddNone;

    ShowEditCity( ParamEdiInfoCity, AddParam, ( -1 * ParamEdiInfoCity.TypeAdminUnit ), True, CurManager );
  finally
    ParamEdiInfoCity.ElemCity.RequeryCurrentRecord;
    aElem_CityAdmObj_SUB_RELQry.Close;
    aElemCityAdmObjImg.Close;
  end;
end;

procedure ShowDicResort(Caption:widestring);
var ParamCountyAdminUnit : TParamCountyAdminUnit;
    ParamDicFormCountry: TParamFormDict;
    ParamDicFormResort : TParamFormDict;
begin
 { ParamCountyAdminUnit.ElemCountry := Elem_BrCountryQry;
  ParamCountyAdminUnit.ElemCityAdmUnit := Elem_ResortQry;
  ParamCountyAdminUnit.TypeObj := 2;
  ParamCountyAdminUnit.FolderName := 'RESORT';
  ShowEditCountryAdminUnit( Caption, ParamCountyAdminUnit, DMServ.CurManager );}

  PrepareDefaultParamDic(ParamDicFormCountry);
  PrepareDefaultParamDic(ParamDicFormResort);

  ParamDicFormCountry.PanelGridWidth := 250;
  ParamDicFormCountry.Update.VisibleUpdate := False;
  ParamDicFormCountry.paramAlignPanel.IndexPanel := 0;
  ParamDicFormCountry.paramAlignPanel.Align := alLeft;
  ParamDicFormCountry.paramAlignPanel.Splitter := True;
  ParamDicFormCountry.paramAlignPanel.SplitterAlign := alLeft;

  ParamDicFormResort.Update.VisibleUpdate := True;
  ParamDicFormResort.Func.LogProc := ShowLog;
  ParamDicFormResort.paramAlignPanel.IndexPanel := 1;
  ParamDicFormResort.paramAlignPanel.Align := alClient;
  ParamDicFormResort.lng.LngAddSql := ' ( ADMIN_UNIT.ID_CITY_ADM_UNT_ITEMS_TYPE  = 2 ) ';
  ParamDicFormResort.lng.LngJoinSql := ' left join ADMIN_UNIT on ADMIN_UNIT.id = CITY_ADM_UNIT.id_admin_unit ';
  ParamDicFormResort.Func.AddProcGridView := UpdateResortFormGridView;

  ShowEditDict( Caption, [Elem_BrCountryQry, Elem_ResortQry], [alClient,alClient], 800, 650, DMServ.CurManager, [ParamDicFormCountry, ParamDicFormResort ] );
end;

procedure UpdateNaturObjFormGridView ( isNew : boolean; CurManager:Integer );
var ParamEdiInfoCity : TParamEdiInfoCity;
    AddParam:TOptAddTreeNode;
    aElem_CityAdmObj_SUB_RELQry:TDBShema;
    aElemCityAdmObjImg:TDBShemaView;
begin
  try
    InitElemCityAdmObjImg( Elem_NaturObjQry, aElem_CityAdmObj_SUB_RELQry, aElemCityAdmObjImg );

    ParamEdiInfoCity.ElemCityAdmUntItemsType := Elem_CITY_ADM_UNT_ITEMS_TYPEQry;
    ParamEdiInfoCity.ElemCITYADMUNITINFOQry := Elem_CITY_ADM_UNIT_INFOQry;
    ParamEdiInfoCity.ElemAdminUnitQry := Elem_Admin_unitQry;

    ParamEdiInfoCity.ElemAdminUnitSubQry := Elem_Admin_Unit_SubQry;
    ParamEdiInfoCity.ElemAdminUnitSubRelQry := aElem_CityAdmObj_SUB_RELQry;

    ParamEdiInfoCity.ElemCountry := Elem_BrCountryQry;
    ParamEdiInfoCity.ElemCity := Elem_NaturObjQry;

    ParamEdiInfoCity.ElemCityIMG  := aElemCityAdmObjImg;

    ParamEdiInfoCity.PathToImageCity := OptionSet.WebPathToImage + 'CITY_AMD_UNIT\NATUROBJ\';
    ParamEdiInfoCity.PathToHtmlCity  := OptionSet.WebPathToHtml + 'CITY_AMD_UNIT\NATUROBJ\';

    ParamEdiInfoCity.TypeAdminUnit := 3;

    if isNew then AddParam := OptTreeNodeAddInsert
    else AddParam := OptTreeNodeAddNone;

    ShowEditCity( ParamEdiInfoCity, AddParam, ( -1 * ParamEdiInfoCity.TypeAdminUnit ), True, CurManager );
  finally
    ParamEdiInfoCity.ElemCity.RequeryCurrentRecord;
    aElem_CityAdmObj_SUB_RELQry.Close;
    aElemCityAdmObjImg.Close;
  end;
end;

procedure ShowDicNaturObj(Caption:widestring);
//var ParamCountyAdminUnit : TParamCountyAdminUnit;
var ParamCountyAdminUnit : TParamCountyAdminUnit;
  ParamDicFormCountry: TParamFormDict;
  ParamDicFormNaturObj : TParamFormDict;
{  ParamCountyAdminUnit.ElemCountry := Elem_BrCountryQry;
  ParamCountyAdminUnit.ElemCityAdmUnit := Elem_NaturObjQry;
  ParamCountyAdminUnit.TypeObj := 3;
  ParamCountyAdminUnit.FolderName := 'NATUROBJ';
  ShowEditCountryAdminUnit( Caption, ParamCountyAdminUnit, DMServ.CurManager ); }
begin
  PrepareDefaultParamDic(ParamDicFormCountry);
  PrepareDefaultParamDic(ParamDicFormNaturObj);

  ParamDicFormCountry.PanelGridWidth := 250;
  ParamDicFormCountry.Update.VisibleUpdate := False;
  ParamDicFormCountry.paramAlignPanel.IndexPanel := 0;
  ParamDicFormCountry.paramAlignPanel.Align := alLeft;
  ParamDicFormCountry.paramAlignPanel.Splitter := True;
  ParamDicFormCountry.paramAlignPanel.SplitterAlign := alLeft;

  ParamDicFormNaturObj.Update.VisibleUpdate := True;
  ParamDicFormNaturObj.Func.LogProc := ShowLog;
  ParamDicFormNaturObj.paramAlignPanel.IndexPanel := 1;
  ParamDicFormNaturObj.paramAlignPanel.Align := alClient;
  ParamDicFormNaturObj.lng.LngAddSql := ' ( ADMIN_UNIT.ID_CITY_ADM_UNT_ITEMS_TYPE  = 3 ) ';
  ParamDicFormNaturObj.lng.LngJoinSql := ' left join ADMIN_UNIT on ADMIN_UNIT.id = CITY_ADM_UNIT.id_admin_unit ';
  ParamDicFormNaturObj.Func.AddProcGridView := UpdateNaturObjFormGridView;

  ShowEditDict( Caption, [Elem_BrCountryQry, Elem_NaturObjQry], [alClient,alClient], 800, 650, DMServ.CurManager, [ParamDicFormCountry, ParamDicFormNaturObj ] );
end;

procedure UpdateInfraObjFormGridView ( isNew : boolean; CurManager:Integer );
var ParamEdiInfoCity : TParamEdiInfoCity;
    AddParam:TOptAddTreeNode;
    aElem_CityAdmObj_SUB_RELQry:TDBShema;
    aElemCityAdmObjImg:TDBShemaView;
begin
  try
    InitElemCityAdmObjImg( Elem_InfraQry, aElem_CityAdmObj_SUB_RELQry, aElemCityAdmObjImg );

    ParamEdiInfoCity.ElemCityAdmUntItemsType := Elem_CITY_ADM_UNT_ITEMS_TYPEQry;
    ParamEdiInfoCity.ElemCITYADMUNITINFOQry := Elem_CITY_ADM_UNIT_INFOQry;
    ParamEdiInfoCity.ElemAdminUnitQry := Elem_Admin_unitQry;

    ParamEdiInfoCity.ElemAdminUnitSubQry := Elem_Admin_Unit_SubQry;
    ParamEdiInfoCity.ElemAdminUnitSubRelQry := aElem_CityAdmObj_SUB_RELQry;

    ParamEdiInfoCity.ElemCountry := Elem_BrCountryQry;
    ParamEdiInfoCity.ElemCity := Elem_InfraQry;

    ParamEdiInfoCity.ElemCityIMG  := aElemCityAdmObjImg;

    ParamEdiInfoCity.PathToImageCity := OptionSet.WebPathToImage + 'CITY_AMD_UNIT\OBJINFRA\';
    ParamEdiInfoCity.PathToHtmlCity  := OptionSet.WebPathToHtml + 'CITY_AMD_UNIT\OBJINFRA\';

    ParamEdiInfoCity.TypeAdminUnit := 4;

    if isNew then AddParam := OptTreeNodeAddInsert
    else AddParam := OptTreeNodeAddNone;

    ShowEditCity( ParamEdiInfoCity, AddParam, ( -1 * ParamEdiInfoCity.TypeAdminUnit ), True, CurManager );
  finally
    ParamEdiInfoCity.ElemCity.RequeryCurrentRecord;
    aElem_CityAdmObj_SUB_RELQry.Close;
    aElemCityAdmObjImg.Close;
  end;
end;

procedure ShowDicInfraObj(Caption:widestring);
var ParamCountyAdminUnit : TParamCountyAdminUnit;
  ParamDicFormCountry: TParamFormDict;
  ParamDicFormInfraObj : TParamFormDict;
begin
  {ParamCountyAdminUnit.ElemCountry := Elem_BrCountryQry;
  ParamCountyAdminUnit.ElemCityAdmUnit := Elem_InfraQry;
  ParamCountyAdminUnit.TypeObj := 4;

  ParamCountyAdminUnit.FolderName := 'OBJINFRA';
  ShowEditCountryAdminUnit( Caption, ParamCountyAdminUnit, DMServ.CurManager );}
  PrepareDefaultParamDic(ParamDicFormCountry);
  PrepareDefaultParamDic(ParamDicFormInfraObj);

  ParamDicFormCountry.PanelGridWidth := 250;
  ParamDicFormCountry.Update.VisibleUpdate := False;
  ParamDicFormCountry.paramAlignPanel.IndexPanel := 0;
  ParamDicFormCountry.paramAlignPanel.Align := alLeft;
  ParamDicFormCountry.paramAlignPanel.Splitter := True;
  ParamDicFormCountry.paramAlignPanel.SplitterAlign := alLeft;

  ParamDicFormInfraObj.Update.VisibleUpdate := True;
  ParamDicFormInfraObj.Func.LogProc := ShowLog;
  ParamDicFormInfraObj.paramAlignPanel.IndexPanel := 1;
  ParamDicFormInfraObj.paramAlignPanel.Align := alClient;
  ParamDicFormInfraObj.lng.LngAddSql := ' ( ADMIN_UNIT.ID_CITY_ADM_UNT_ITEMS_TYPE  = 4 ) ';
  ParamDicFormInfraObj.lng.LngJoinSql := ' left join ADMIN_UNIT on ADMIN_UNIT.id = CITY_ADM_UNIT.id_admin_unit ';
  ParamDicFormInfraObj.Func.AddProcGridView := UpdateInfraObjFormGridView;

  ShowEditDict( Caption, [Elem_BrCountryQry, Elem_InfraQry], [alClient,alClient], 800, 650, DMServ.CurManager, [ ParamDicFormCountry, ParamDicFormInfraObj ] );
end;

procedure TDMServIB.ViewServiceTypeICONPropertiesCustomClick(
  Sender: TObject);
begin
  TcxImage(Sender).LoadFromFile;
end;

procedure TDMServIB.ShowLngForCoutry( ElemCountry:TDBShemaView );
var FieldTranslateShema:TFieldTranslateShemaArr;
begin
  AddLngFieldColumnToShema( FieldTranslateShema, ElemCountry, 'NAME', 'NAME'  );
  ShowLngTranslate( ElemCountry, nil, FieldTranslateShema, 'оригінал', True, 780, DMServ.CurManager  );   //Elem_BrCountryQry
end;



procedure TDMServIB.CompTaxSystemLogQryCalcFields(DataSet: TDataSet);
var SysTax: string;
begin
  if not DataSet.FieldByName('INCOMETAXABS').IsNull then
    SysTax := DataSet.FieldByName('INCOMETAXABS').AsString + ' %'
  else
  if not DataSet.FieldByName('INCOMETAXVAL').IsNull then
    SysTax := DataSet.FieldByName('INCOMETAXVAL').AsString + ' грн.';

  DataSet.FieldByName('CalcNameTax').asString := DataSet.FieldByName('TAXNAME').AsString +' / '+SysTax;
  if DataSet.FieldByName('PAYER').AsInteger = 0 then
    DataSet.FieldByName('CalcNameTax').asString := DataSet.FieldByName('CalcNameTax').asString + ' / не платник ПДВ'
  else
    DataSet.FieldByName('CalcNameTax').asString := DataSet.FieldByName('CalcNameTax').asString + ' / ' + DataSet.FieldByName('PDVSUM').AsString +' %';
end;

procedure TDMServIB.ViewTmUsersPermLayShemID_TMUSERS_PERM_PR_SHEMAPropertiesInitPopup(
  Sender: TObject);
//var ID_TMUSERS_PERM_PR:Variant;
begin
  {ID_TMUSERS_PERM_PR := Elem_TMUSERS_PERM_LAY_SHEMQry.GetActiveCloneElem.GetVerticalGridGridByFieldNameValue('ID_TMUSERS_PERM_PR' );
  if ID_TMUSERS_PERM_PR = null then Abort;

  Elem_TMUSERS_PERM_PR.DB.Locate( Elem_TMUSERS_PERM_PR.FieldKod,ID_TMUSERS_PERM_PR,[] );}
end;

procedure TDMServIB.PermRuleCopyClick(Sender: TObject);
begin
  //Elem_TMUSERS_PERM_LAY_SHEMQry.GetActiveCloneElem.CopyRowsFromView;
end;

procedure TDMServIB.PermRulePasteClick(Sender: TObject);
begin
  //Elem_TMUSERS_PERM_LAY_SHEMQry.GetActiveCloneElem.PasteDataRowsToView;
end;

procedure TDMServIB.ViewTmUsersPermLayShemCustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var IndRULENAME:Integer;
    Indcan_insert:Integer;
    Indcan_update:Integer;
    Indcan_delete:Integer;
    valueInsert:Integer;
    valueUpdate:Integer;
    valueDelete:Integer;
begin
  IndRULENAME := TcxGridDBTableView( Sender ).GetColumnByFieldName('RULENAME').Index;
  Indcan_insert := TcxGridDBTableView( Sender ).GetColumnByFieldName('can_insert').Index;
  Indcan_update := TcxGridDBTableView( Sender ).GetColumnByFieldName('can_update').Index;
  Indcan_delete := TcxGridDBTableView( Sender ).GetColumnByFieldName('can_delete').Index;

  valueInsert :=VarToInt( AViewInfo.GridRecord.Values[Indcan_insert] );
  valueUpdate :=VarToInt( AViewInfo.GridRecord.Values[Indcan_update] );
  valuedelete :=VarToInt( AViewInfo.GridRecord.Values[Indcan_delete] );

  if (AViewInfo.Item.Index = IndRULENAME)and(valueInsert<>1)and
     (valueUpdate<>1) and (Indcan_delete<>1) then
  begin
   //  AViewInfo.Text := 'Всі складові (тільки для читтання)';
    //if AText='' then AText :='Всі складові';
    //ViewDrawFillRect( Sender, AViewInfo, ACanvas );
    //ShowTextImageInCell( Sender, ACanvas, AViewInfo, BrowseImgList, 105, OptImgPosRight );
  end;

end;

function TDMServIB.PrepareVehicleShema( Elem:TDBShema; View:TcxGridBandedTableView ):TVehiclePlaceView;
var VehicleDBDetail : TDBShemaVehicleDetail;
begin
  VehicleDBDetail.Elem := Elem;
  VehicleDBDetail.FiedlPlace :='PLACE';
  VehicleDBDetail.FiedlDirection :='DIRECTION';
  VehicleDBDetail.FiedlCol :='ACOL';
  VehicleDBDetail.FieldType :='ATYPE';
  VehicleDBDetail.FieldRow :='AROW';
  VehicleDBDetail.FieldALEVEL :='ALEVEL';
  VehicleDBDetail.FieldUsedColor :='';

  result := TVehiclePlaceView.Create( View, VehicleDBDetail, 50, False);
  result.SetHintParam( $00E8E8FF, clBlack );
  result.AddObjectPlaceColor( 0, $00E1FFFF, '', 'Місце', DMServDic.ImageListDirectionVEHICLE,[0,1,2,3],[0,1,2,3] );
  result.AddObjectPlaceColor( -1, -16777212, '','Вихід', DMServDic.ImageListVEHICLE,[],[],2 );
  result.AddObjectPlaceColor( -2, -16777212,'', 'Прохід', nil,[],[] );
  result.AddObjectPlaceColor( -3, $00EEF3F9, '','Столик', DMServDic.ImageListVEHICLE,[],[],1 );
  result.AddObjectPlaceColor( -4, $00A8A8FF, '','Службове місце', DMServDic.ImageListDirectionVEHICLE,[],[] );
  result.AddObjectPlaceColor( -5, $00A8A8FF, ' ','Службове місце з виходом', DMServDic.ImageListVEHICLE,[],[], 2 );
  result.AddObjectPlaceColor( -6, $00A8A8FF, '', 'Водій', DMServDic.ImageListVEHICLE,[],[], 3 );
  result.AddObjectPlaceColor( -7, -16777212, 'WC', 'Туалет', nil,[],[] );
  result.AddObjectPlaceColor( -8, -16777212, '', 'Сходи', DMServDic.ImageListVEHICLE, [],[], 9 );
end;


end.

{procedure TDMServIB.CustomDrawLnghangeIcon(FieldShow,FieldLngNotFound,FieldLngChange:string;
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var indName:Integer;
    IndLNGNOTFOUND:Integer;
    lngLNGCHANGE :Integer;
    CurrLngNotFound:Integer;
    CurrLngCnahge:Integer;
begin
  indName := TcxGridDBTableView( Sender ).GetColumnByFieldName(FieldShow).Index;
  IndLNGNOTFOUND:= TcxGridDBTableView( Sender ).GetColumnByFieldName(FieldLngNotFound).Index;
  lngLNGCHANGE := TcxGridDBTableView( Sender ).GetColumnByFieldName(FieldLngChange).Index;

  CurrLngNotFound :=VarToInt( AViewInfo.GridRecord.Values[IndLNGNOTFOUND] );
  CurrLngCnahge   :=VarToInt( AViewInfo.GridRecord.Values[lngLNGCHANGE] );

  if ( AViewInfo.Item.Index = indName ) and (AViewInfo.Value <> null) and
     ( ( CurrLngNotFound > 0) or ( CurrLngCnahge >0) ) then
  begin
    ViewDrawFillRect( Sender, AViewInfo, ACanvas );
    ShowTextImageInCell( Sender, ACanvas, AViewInfo, DMServ.BrowseImgList, 105, OptImgPosRight );
    ADone:=True;
  end;
end;  }


var FilePath:string;
    FileBaseStr:Widestring;
begin
  FilePath := MySelectFileDialog( '', '*.bmp' );
  if FilePath <> '^' then
  begin
    FileBaseStr := ConvertFileToBase64( FilePath );
    Elem_SERVICE_TYPEQry.UpdateVerticalGridFocusValue( Sender, FileBaseStr );
  end;
 // Elem_SERVICE_TYPEQry.se
 //    TcxBLOBEditProperties(Properties.EditProperties).Assign( TcxBLOBEditProperties(Column.Properties) );
  //  Elem_SERVICE_TYPEQry.DBAddBlobFileData('ICON',FilePath);

