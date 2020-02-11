unit CityBr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, ImgList, ExtCtrls, ComCtrls, DBCtrls, ToolWin, Grids, StdCtrls,
  Buttons, ActnList, Menus, DBActns, StdActns, SvtDBGrids, DBGrids,
  AzComboBox,UnitEditInfoCountry, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridLevel, cxClasses, cxGridCustomView, UnitProc,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxContainer, cxTextEdit;

type
  TCityBrowseForm = class(TForm)
    Timer: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure DataSrcDataChange(Sender: TObject; Field: TField);
    procedure ShowTwinActionExecute(Sender: TObject);
    procedure BrowseProvinceActionExecute(Sender: TObject);
    procedure TouristTemplateActionExecute(Sender: TObject);
    procedure OpenURLActionExecute(Sender: TObject);
    procedure FlagDBImageClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure RecordEditActionExecute(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TSvtColumn; State: TGridDrawState);
    procedure VendorlinkActionExecute(Sender: TObject);
    procedure RecordDeleteActionExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LangCheckBoxClick(Sender: TObject);
  private
    FColWidth: Integer;
    FCol2Width: Integer;  
    FCol3Width: Integer;
    FCol4Width: Integer;
    FWinWidth: Integer;
    FmPanelWidth: Integer;
    FPathToImage:string;
    procedure UpdateCityQry;
  protected
    procedure AddToListing(Lst: TStrings);
    function CanAccessAdd: Boolean;
    function CanAccessEdit: Boolean;
    function CanAccessDelete: Boolean;
    function DataSetToggleFilter: Boolean;
    function GetOrderByColumns(Index: Integer): String;
    function ShowEditor(EditState: Integer): Boolean;
    procedure InitDataSets;
    procedure UpdateDBGrids;
    procedure UpdateGridQuery;
    procedure ApplyCashedUpdates(Apply: Boolean);
    procedure UpdateToolButtons;
    procedure ExecuteDescritpForm;
    procedure RepfreshPanelCountryInfo( aData:TRecDataInfoArr );
    procedure RefreshCountryInfo;
    procedure RefreshControlTranslate;

    procedure ViewBrCountryFocusedRecordChanged( Sender: TcxCustomGridTableView; APrevFocusedRecord,
                                                 AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
    procedure ViewBrCountryCellDblClick(Sender: TcxCustomGridTableView;
                                        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
                                        AShift: TShiftState; var AHandled: Boolean);
    procedure ViewBrCityCellDblClick(Sender: TcxCustomGridTableView;
                                        ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
                                        AShift: TShiftState; var AHandled: Boolean);
  end;

var
  CityBrowseForm: TCityBrowseForm;

procedure ShowCityBrowse(MId, DId, Man: Integer);
function SelectCountryBrowse(var MId, DId: Integer; Man: Integer): WordBool;
function SelectCityBrowse(var MId, DId: Integer; Man: Integer): WordBool;


implementation

uses ServMod,CityNewForm, OptSet, TmplFrm, TourConsts,
  TourCmnlIf, TourDbUn, {ProvBr,}  DBTables, {CityFltrDlg,} OrderUn,
  {VendorHotelNameFrm, ClientDlg, TmplFrmNew,} DesctiptEditFrm, core, IBQuery;

{$R *.DFM}

procedure ShowCityBrowse(MId, DId, Man: Integer);
var Id0, Id1: Integer;
begin
{  with DMServ do
  begin
    CurManager := Man;
    if MId > 0 then Id0 := MId
      else if BrCountryQry.Active then Id0 := Elem_BrCountryQry.DB.FieldByName('COUNTRYID').asInteger
      else Id0 := OptionSet.LastOpDictCountry;
    if DId > 0 then Id1 := DId
      else if BrCityQry.Active then Id1 := Elem_BrCityQry.DB.FieldByName('CITYID').asInteger
      else Id1 := OptionSet.LastOpDictCity;
    BrCountryQry.Parameters.ParamByName('LangId').Value := nLocalLang;
    UpdateQuery(BrCountryQry);
    BrCityQry.Parameters.ParamByName('LangId').Value := nLocalLang;
    UpdateQuery(BrCityQry);
    if Id0 > 0 then BrCountryQry.Locate('COUNTRYID', Id0, []);
    if Id1 > 0 then BrCityQry.Locate('CITYID', Id1, []);
    with CurrencyTable do if not Active then Open;
  end; }


  {if not Assigned(CityEditNewForm) then
  begin
    Application.CreateForm(TCountryEditForm, CountryEditForm);
    Application.CreateForm(TCityEditNewForm, CityEditNewForm);
    Application.CreateForm(TCityBrowseForm, CityBrowseForm);
  end;
  try
    CityBrowseForm.Show;
  except
    Application.CreateForm(TCountryEditForm, CountryEditForm);
    Application.CreateForm(TCityEditNewForm, CityEditNewForm);
    Application.CreateForm(TCityBrowseForm, CityBrowseForm);
    CityBrowseForm.Show;
  end;}



end;

function SelectCountryBrowse(var MId, DId: Integer; Man: Integer): WordBool;
begin
 { with DMServ do
  begin
    CurManager := Man;
    UpdateQuery(BrCountryQry);
    UpdateQuery(BrCityQry);
    with CurrencyTable do if not Active then Open;
    if MId > 0 then BrCountryQry.Locate('CountryId', MId, []);
    if DId > 0 then BrCityQry.Locate('CityId', DId, []);
  end;
  //ShowSelect
  Result := False;  }
end;

function SelectCityBrowse(var MId, DId: Integer; Man: Integer): WordBool;
begin
 { with DMServ do
  begin
    CurManager := Man;
    UpdateQuery(BrCountryQry);
    UpdateQuery(BrCityQry);
    with CurrencyTable do if not Active then Open;
    if MId > 0 then BrCountryQry.Locate('CountryId', MId, []);
    if DId > 0 then BrCityQry.Locate('CityId', DId, []);
  end;
  //ShowSelectDetail
  Result := False;  }
end;

{ TCityBrowseForm }

procedure TCityBrowseForm.AddToListing(Lst: TStrings);
begin
  (*
  if not IsMasterSet then inherited AddToListing(Lst)
  else
    with DMServ do
    begin
      // Я заремив
     { Lst.Add(Elem_BrCountryQry.DB.FieldByName('NAME').asString + ', ' + Elem_BrCountryQry.DB.FieldByName('FULLNAME').asString);
      Lst.Add(BrCountryQryCOUNTRYNAMETRANSLATE.Value + ', ' + BrCountryQryFULLNAME_ENG.Value);
      Lst.Add(#9 + SCityBrShortSign + ':'#9 + Elem_BrCountryQry.DB.FieldByName('SHORTSIGN').asString +
        #9 + Elem_BrCountryQry.DB.FieldByName('CODE2').asString + #9 + Elem_BrCountryQry.DB.FieldByName('CODE3').asString);
      Lst.Add(#9 + SCityBrPhoneCode + ':'#9 + Elem_BrCountryQry.DB.FieldByName('CalcPhoneCode').asString);
      Lst.Add(#9 + SCityBrCapital + ': ' + Elem_BrCountryQry.DB.FieldByName('CAPITAL').asString + ','#9 +
        SCityBrTimeBias + ': ' + BrCountryQryTIMEBIAS.DisplayText);
      Lst.Add(#9 + SCityBrCurrency + ':'#9 + Elem_BrCountryQry.DB.FieldByName('CURRENCYNAME').asString +
        ' (' + Elem_BrCountryQry.DB.FieldByName('CURRENCYSHORT').asString + ')');
      Lst.Add('');}
    end;*)
end;

function TCityBrowseForm.CanAccessAdd: Boolean;
begin
 { Result := CanAccessView
    and not IsMasterSet and GetUspCanEdit(DMServ.CurManagerPerms[uspDictCity]); }
end;

function TCityBrowseForm.CanAccessEdit: Boolean;
begin
 { Result := CanAccessView and (
    IsMasterSet and (
      GetUspCanAdmin(DMServ.CurManagerPerms[uspDictCountry])
      or GetUspCanEdit(DMServ.CurManagerPerms[uspDictCountry])
        and (Elem_BrCountryQry.DB.FieldByName('ADDMANID').asInteger = DMServ.CurManager))
    or not IsMasterSet and GetUspCanEdit(DMServ.CurManagerPerms[uspDictCity])); }
end;

function TCityBrowseForm.CanAccessDelete: Boolean;
begin
  {Result := CanAccessView
    and not IsMasterSet and GetUspCanEdit(DMServ.CurManagerPerms[uspDictCity]);}
end;

function TCityBrowseForm.DataSetToggleFilter: Boolean;
const
  sCitySQL = 'select Ci.CountryId, Ci.CityId, Co.Name as Country, ' +
    'Ci.Name, Ci.Name_Eng, Pr.Name as Province, Ci.ProvinceId, ' +
    'Ci.ShortSign, Ci.TimeBias, Ci.PhoneCode, Ci.ShowWeb, Ci.Memo ' +
    'from Cities Ci left join Provinces Pr on Pr.ProvinceId = Ci.ProvinceId, ' +
    'Countries Co ' +
    'where Co.CountryId = Ci.CountryId and Ci.TownshipId is null ' +
    'order by Co.Name, Ci.Name';
var
  Id: Integer;
  Fltr: String;
begin
  (*with DMServ, BrCityQry do
  begin
    if Active then Id := Elem_BrCityQry.DB.FieldByName('CITYID').asInteger else Id := 0;
    //Fltr := Filter;
    {if ExecuteCityFilterDlg(Elem_BrCityQry.DB.FieldByName('COUNTRYID').asInteger, Fltr) then
    begin

    end;}
    if (Id > 0) and (Elem_BrCityQry.DB.FieldByName('CITYID').asInteger <> Id) then Locate('CITYID', Id, []);
    Result := Filtered;
  end; *)
end;

function TCityBrowseForm.GetOrderByColumns(Index: Integer): String;
begin
  //Result := inherited GetOrderByColumns(Index);
 { if IsMasterSet then Result := 'Name'
  else
    case Index of
      0: Result := 'Country, NAME, Province';
      2: Result := 'CityKind, Country, NAME';
      3: Result := 'NAME, Province';
      4: Result := 'CityNameTranslate, Province';
      5: Result := 'Province, CityKind, Country, NAME';
      6: Result := 'ProvinceTranslate, CityKind, Country, CityNameTranslate';
      7: Result := 'TIMEBIAS, NAME, Province';
      8: Result := 'PHONECODE, NAME, Province';
      9: Result := 'SHOWWEB Desc, Country, NAME';
    else Result := 'COUNTRYID, CITYID';
    end;}
end;

procedure TCityBrowseForm.FormCreate(Sender: TObject);
begin
  //FColWidth := DBGrid1.Columns[3].Width;
  //FCol2Width := DBGrid1.Columns[5].Width;
  //FCol4Width := DBGrid.Columns[0].Width + 1;
 { FWinWidth := Width;
  FmPanelWidth := MasterPanel.Width;
  inherited;
  MastEditForm := CountryEditForm;
  EditForm := CityEditNewForm;
  MasterBrowseKey := DMServ.BrCountryQryCOUNTRYID;
  DetailBrowseKey := DMServ.BrCityQryCITYID;
  MasterEditKey := DMServ.BrCountryQryCOUNTRYID;//CountryTableCountryId;
  DetailEditKey := DMServ.BrCityQryCityId;
  LocaleTimeLabel.Caption := '';
  MasterSearchHint := 'Country';
  DetailSearchHint := 'City';
  Timer.Enabled := True; }

  FPathToImage  := CheckLastSleshOnPath( OptionSet.StoreFolder,True)+'IMAGES\COUNTRIES\';
  Elem_BrCountryQry.AddFocusedRecordChanged( ViewBrCountryFocusedRecordChanged );
  Elem_BrCountryQry.AddCellDblClick( ViewBrCountryCellDblClick );
  Elem_BrCityQry.AddCellDblClick( ViewBrCityCellDblClick );


  Elem_COUNTRIES_INFO.DBOpen;
  Elem_CurrencyQry.DBOpen;
end;

procedure TCityBrowseForm.DataSrcDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  //if DataSrc.DataSet = DMServ.BrCountryQry then
  //  URLBtn.Enabled := not DMServ.BrCountryQryURL.IsNull;
end;

procedure TCityBrowseForm.ShowTwinActionExecute(Sender: TObject);
begin
  inherited;
  //DetailPanel.Visible := MasterPanel.Visible;
  UpdateCityQry;
  UpdateDBGrids;
end;

procedure TCityBrowseForm.RecordEditActionExecute(Sender: TObject);
begin  // disable add for locale country
{  if (DataSrc.DataSet = DMServ.BrCityQry)
    and ((Sender as TComponent).Tag = remStateAppend)
    and (Elem_BrCountryQry.DB.FieldByName('COUNTRYID').asInteger = OptionSet.LocaleCountry)
  then ErrorFmtDlg(SCityBrErrorNewCityDisabled, [Elem_BrCountryQry.DB.FieldByName('NAME').asString])
  else
  if (DataSrc.DataSet = DMServ.BrCityQry)
    and ((Sender as TComponent).Tag = remStateEdit)
    and (Elem_BrCityQry.DB.FieldByName('CITYKIND').asInteger < 0)
  then ErrorDlg('В довіднику "Країни та міста" курорти заборонено редагувати.'#13'Перейдіть в довідник "Курорти".')
  else
   begin
     if DataSrc.DataSet = DMServ.BrCityQry then inherited RecordEditActionExecute(Sender);
     //if DataSrc.DataSet = DMServ.BrCountryQry then ShowEditCountryInfo(False, FPathToImage );
   end;
 }
end;

procedure TCityBrowseForm.BrowseProvinceActionExecute(Sender: TObject);
begin
 { with DMServ do
    ShowProvinceBrowse(
      Elem_BrCountryQry.DB.FieldByName('COUNTRYID').asInteger, Elem_BrCityQry.DB.FieldByName('PROVINCEID').asInteger, CurManager);}
end;

procedure TCityBrowseForm.TouristTemplateActionExecute(Sender: TObject);
var
//  Lst: TStringList;
  Cntry: String;
  St: Integer;
begin

 // TouristTemplateNewForm := TTouristTemplateNewForm.Create(Application);
 { with TouristTemplateNewForm do
    try
      Cntry := Elem_BrCountryQry.DB.FieldByName('NAME').asString;
      Caption := Format(Caption, [Cntry]);
(*      Lst := TStringList.Create;
      try
        Lst.Add(Cntry);
        if DMServ.BrCountryQrySHENGEN.AsBoolean then
          Lst.Add(STmplFrmLastShengen);
        Lst.Add(STmplFrmLastAll);
        LastVisitsComboBox.Items.Assign(Lst);
        LastEmbassyComboBox.Items.Assign(Lst);
      finally
        Lst.Free;
      end;   *)
      if DMServ.AnketTempTable.RecordCount = 0 then
        St := remStateAppend else St := remStateEdit;
      ShowRecord(St);
      if MayBeDeleted then DMServ.AnketTempTable.Delete;
    finally
      Free;
    end; }
end;

procedure TCityBrowseForm.OpenURLActionExecute(Sender: TObject);
begin
  //with DMServ.BrCountryQryURL do if AsString <> '' then WebBrowse(AsString);
end;

procedure TCityBrowseForm.FlagDBImageClick(Sender: TObject);
begin
  //ActiveControl := DBGrid;
  //ExecuteEditAction;
end;

procedure TCityBrowseForm.TimerTimer(Sender: TObject);
begin
 { with LocaleTimeLabel do
    if not Assigned(DBTimeBias.Field) or DBTimeBias.Field.IsNull then Caption := ''
    else Caption :=
      FormatDateTime(SCityBrLocaleTimeMsg, Now + DBTimeBias.Field.AsFloat / 24);}
end;

procedure TCityBrowseForm.DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TSvtColumn; State: TGridDrawState);
begin
//  inherited;
 { if not (gdFixed in State)
  then with Sender as TSvtDBGrid do
  begin
    if Column.FieldName = 'SHOWWEB' then
    begin
      Canvas.FillRect(Rect);
      if Column.Field.AsBoolean then
        DMServ.BrowseImgList.Draw(Canvas,
          (Rect.Left + Rect.Right) div 2 - 8, Rect.Top + 1, 61);
    end else if Column.FieldName = 'CalcCityType' then
      if DMServ.BrCityQryAsResort.AsBoolean then
        DMServ.BrowseImgList.Draw(Canvas, Rect.Right - 17, Rect.Top + 1, 106);    
  end;  }
end;

function TCityBrowseForm.ShowEditor(EditState: Integer): Boolean;
var MstKey, DetKey, Key: Integer;
begin  
  (*if not IsMasterSet then begin
    Result := Assigned(EditForm) and EditForm.Execute(EditState);
    if Result then
      SyncronizeEdit(DetailBrowseKey.AsInteger, EditState = remStateAppend);
  end else begin
{    if Assigned(MastEditForm) then with MasterEditSet do if not Active then Open;
    if (MasterBrowseKey.Value <> MasterEditKey.Value) and Assigned(MastEditForm)
      then MasterEditSet.Locate(MasterFieldName, MasterBrowseKey.Value, []);}
    MstKey := MasterEditKey.AsInteger;
    DetKey := DetailEditKey.AsInteger;
    try
      Result := Assigned(CurEditor) and CurEditor.ShowRecord(EditState);
    finally
    end;
//    ApplyCashedUpdates(Result);
    if Result then
    begin
      if IsMasterSet then
        MstKey := MasterEditKey.Value else DetKey := DetailEditKey.Value;
      if (MasterEditKey <> MasterBrowseKey) and Assigned(MastEditForm) then
        DMServ.DataSetRefresh(DBGrid.DataSource{.DataSet});
      if DetailEditKey <> DetailBrowseKey then
        DMServ.DataSetRefresh(DBGrid1.DataSource{.DataSet});
      if Assigned(MastEditForm) then
        DBGrid.DataSource.DataSet.Locate(MasterFieldName, MstKey, []);
      with DBGrid1.DataSource.DataSet do
        if RecordCount > 0 then Locate(DetailFieldName, DetKey, []);
      if Assigned(CurEditor) then
      begin
        if IsMasterSet then Key := MstKey else Key := DetKey;
        SyncronizeEdit(Key, EditState = remStateAppend);
  {      DMServ.SyncronizeWebEdit(
          CurEditor.DictionPart, Key, EditState = remStateAppend, '');}
      end;
    end;
  
  end;*)
end;

procedure TCityBrowseForm.InitDataSets;
begin
  //inherited;
  //DMServ.PrepareLangComboBox(LangComboBox.Items);
  UpdateDBGrids;
end;

procedure TCityBrowseForm.UpdateDBGrids;
var ChkLang: Boolean;
begin
  {with DBGrid1 do
  begin
    Columns.Items[0].Visible := not MasterPanel.Visible;
    Columns.Items[1].Visible := False;
    Columns.Items[0].Width := DBGrid.Columns.Items[0].Width + 
      DBGrid.Columns.Items[2].Width + 20;
    FCol3Width := Columns.Items[0].Width div 2;  
  end;
  ChkLang := LangCheckBox.Checked;
  LangComboBox.Enabled := ChkLang;
  if ChkLang and not ShowTwinAction.Checked then begin 
    MasterPanel.Width := FmPanelWidth + FCol4Width;
    Constraints.MinWidth := FWinWidth + FCol4Width;
    Width := FWinWidth + FCol4Width;
  end else begin 
    MasterPanel.Width := FmPanelWidth;
    Constraints.MinWidth := FWinWidth;
    Width := FWinWidth;
  end;
  with DBGrid1 do begin 
    SetColWidth(Columns[4], Columns[3], FColWidth, ChkLang);
    SetColWidth(Columns[6], Columns[5], FCol2Width, ChkLang);
    if ShowTwinAction.Checked 
    then SetColWidth(Columns[1], Columns[0], FCol3Width, ChkLang);
  end;
  DBGrid.Columns[1].Visible := ChkLang and not ShowTwinAction.Checked;
  with TranslateDBRichEdit do begin 
    Width := SecondPanel.Width div 2;
    Visible := ChkLang;
  end;}
end;

procedure TCityBrowseForm.UpdateGridQuery;
var CountryId, CityId: Integer;
begin
 { with DMServ, BrCountryQry do
  begin
    CountryId := Elem_BrCountryQry.DB.FieldByName('COUNTRYID').asInteger;
    CityId := Elem_BrCityQry.DB.FieldByName('CITYID').asInteger;
    Parameters.ParamByName('LangId').Value := LangComboBox.ItemId;
    BrCityQry.Parameters.ParamByName('LangId').Value := LangComboBox.ItemId;
    UpdateQuery(BrCountryQry);
    UpdateQuery(BrCityQry);
    Locate('CountryId', CountryId, []);
    BrCityQry.Locate('CityId', CityId, []);
  end; }
end;


procedure TCityBrowseForm.ApplyCashedUpdates(Apply: Boolean);
begin
  {if Assigned(MastEditForm) and MasterEditSet.CachedUpdates then
    DMServ.DatabaseApplyUpdates([MasterEditSet], Apply)
  else begin
    if Assigned(MastEditForm) then MasterEditSet.Refresh;
    DetailEditSet.Refresh;
  end;  }
end;

procedure TCityBrowseForm.VendorlinkActionExecute(Sender: TObject);
var VendId: Integer;
begin
 { inherited;
  if ExecuteChooseClientDlg(Elem_SelVendorQry, ClientOrigin, False, VendId) then
    ExecuteVendorCityLinkForm(VendId); }
end;

procedure TCityBrowseForm.UpdateToolButtons;
begin
  inherited;
 // VendorlinkAction.Enabled := CanAccessEdit and DMServ.BrCityQry.Active;
end;

procedure TCityBrowseForm.ExecuteDescritpForm;
var ElemntDescrpt: TDBShemaView;
begin
  inherited;  
  //if DataSrc.DataSet = DMServ.BrCityQry then ElemntDescrpt := Elem_BrCityQry
  //else if DataSrc.DataSet = DMServ.BrCountryQry then ElemntDescrpt := Elem_BrCountryQry;
  DMServ.PrepareLangQry;
                               
  TIBQuery(Elem_ItDesriptQry.DB).ParamByName('TableName').Value := ElemntDescrpt.TableName;
  TIBQuery(Elem_ItDesriptQry.DB).ParamByName('ItemId').Value := ElemntDescrpt.GetValueId;  
  Elem_ItDesriptQry.DBReOpen;

  {TIBQuery(Elem_ForeignLangQry.DB).ParamByName('ServTable').Value := Elem_ItDesriptQry.TableName;
  TIBQuery(Elem_ForeignLangQry.DB).ParamByName('ServId').Value := Elem_ItDesriptQry.GetValueId;
  Elem_ForeignLangQry.DBReOpen;  }
  
  //ExecuteDescriptEditForm(ElemntDescrpt, Elem_ItDesriptQry, Elem_SelLanguageQry, Elem_ForeignLangQry);
end;

procedure TCityBrowseForm.UpdateCityQry;
var Id: Integer;
begin
 { Elem_BrCityQry.DB.DisableControls;
  if ShowTwinAction.Checked then begin
    TIBQuery(Elem_BrCityQry.DB).DataSource := nil;
    TIBQuery(Elem_BrCityQry.DB).ParamByName('COUNTRYID').Clear;
    Elem_BrCityQry.Requery;
  end
  else
  begin
    Id := Elem_BrCityQry.GetValueId;
    TIBQuery(Elem_BrCityQry.DB).DataSource := DMServ.BrCountrySrc;
    Elem_BrCityQry.DB.Locate('CItyId', Id, []);
  end;
  Elem_BrCityQry.DB.EnableControls;}
end;

procedure TCityBrowseForm.RecordDeleteActionExecute(Sender: TObject);
begin
  Elem_BrCityQry.DB.Delete;  
end;

procedure TCityBrowseForm.RepfreshPanelCountryInfo( aData:TRecDataInfoArr );
var CurrData:TRecDataInfoArr;
begin
  {EdCountryName.EditValue := Elem_BrCountryQry.DB.fieldByName('NAME').asString;
  LbShortSign.Caption :=  Elem_BrCountryQry.DB.fieldByName('SHORTSIGN').asString; 

  CurrData := FindDataCountryInfByTypeInf( aData, 14 );
  if Length(CurrData)>0 then EdPhoneCode.EditValue :=CurrData[0].aValue
  else EdPhoneCode.EditValue :='';

  CurrData := FindDataCountryInfByTypeInf( aData, 4 );
  if Length(CurrData)>0 then EdCapital.EditValue :=CurrData[0].AddValue
  else EdCapital.EditValue :='';

  CurrData := FindDataCountryInfByTypeInf( aData, 6 );
  if Length(CurrData)>0 then
  begin
    if Elem_CurrencyQry.DB.Locate(Elem_CurrencyQry.FieldKod, CurrData[0].IdValue,[]) then
      EdCurrency.EditValue :=Elem_CurrencyQry.DB.FieldByName('CURRENCYNAME').asString;
    EdCurrencyShort.EditValue :=CurrData[0].AddValue;
  end
  else
  begin
    EdCurrency.EditValue :='';
    EdCurrencyShort.EditValue :='';
  end;

  if not Elem_BrCountryQry.DB.fieldByName('TIMEBIAS').IsNull then
  begin
    EdTimeDifference.Text := Elem_BrCountryQry.DB.fieldByName('TIMEBIAS').AsString;
    LocaleTimeLabel.Caption := FormatDateTime( SCityBrLocaleTimeMsg, Now + Elem_BrCountryQry.DB.fieldByName('TIMEBIAS').asFloat / 24 );
  end
  else
  begin
    EdTimeDifference.Text := '';
    LocaleTimeLabel.Caption := '';
  end;

  CurrData := FindDataCountryInfByTypeInf( aData, 3 );
  if Length(CurrData)>0 then EdFullName.Text := CurrData[0].aValue
  else EdFullName.Text :='';

  CurrData := FindDataCountryInfByTypeInf( aData, 1 );
  if Length(CurrData)>0 then LoadImageInf( ImgGerb, FPathToImage+'GERB\'+  CurrData[0].aValue )
  else ImgGerb.Picture:=nil;

  CurrData := FindDataCountryInfByTypeInf( aData, 2 );
  if Length(CurrData)>0 then LoadImageInf( ImgFlag, FPathToImage+'FLAG\'+  CurrData[0].aValue )
  else ImgFlag.Picture:=nil;  }
end;

procedure TCityBrowseForm.RefreshCountryInfo;
var aData:TRecDataInfoArr;
begin
   ReadDataCountryInf( aData );
   RepfreshPanelCountryInfo( aData );
end;

procedure TCityBrowseForm.RefreshControlTranslate;
begin
  //PanelTransalte.Visible := LangCheckBox.Checked;
end;

procedure TCityBrowseForm.ViewBrCountryFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  RefreshCountryInfo;
end;

procedure TCityBrowseForm.ViewBrCountryCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  //EditTbtn.Click;
end;

procedure TCityBrowseForm.ViewBrCityCellDblClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  //EditTbtn.Click;
end;

procedure TCityBrowseForm.FormShow(Sender: TObject);
begin
  inherited;
  RefreshCountryInfo;
  RefreshControlTranslate;
end;

procedure TCityBrowseForm.LangCheckBoxClick(Sender: TObject);
begin
  inherited;
  RefreshControlTranslate;
end;

end.
