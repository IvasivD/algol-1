unit UnitPeriodAgeRange;

interface
uses Forms,Classes, UnitFrameAge, cxPC, DB,Variants,SysUtils,Dialogs,UnitProc,cxDBLookupComboBox,
     RateTypes,cxGridDBTableView,cxDBExtLookupComboBox, HeaderConfig_Form ;

type
  TPageTabOptions = (pgTabopPeriod,pgTabopAge);

  TFieldNames = record

    FieldNameCostNetto:String;
    FieldNameCostBrutto:String;
    FieldNameDiscount:String;
  end;

  TFieldTabNames = record
    FieldMainTableId:String;
    FieldMainCurrencyID:String;
    FieldMainServiceId:String;
    FieldMainServiceType:String;

    FieldId:String;

    FieldPeriodCaption:String;
    FieldFromPeriod:String;
    FieldToPeriod:String;
    FieldPeriodOrder:String;
    FieldPeriodOptions:String;

    FieldAgeCaption:String;
    FieldFromAge:String;
    FieldToAge:String;
    FieldAgeOrder:String;
    FieldAgeOptions:String;

    FieldData:TFieldNames;
  end;

  TTabPrice = record
    CostNetto:Variant;
    CostBrutto:Variant;
    AgentVal:Variant;
  end;

  TTabControl = record
    Caption:widestring;
    From:Integer;
    Till:Integer;
    OrderIndex:Integer;
    TabControl:TcxTabSheet;
    Options:Integer;
  end;
  PTabControl = ^TTabControl;

  TTabRec = record
    id:Variant;
    {PeriodTabCaption:WideString;
    PeriodFrom:Integer;
    PeriodTo:Integer;
    PeriodOrderIndex:Integer;

    Options:Integer; }

    {AgeTabCaption:WideString;
    AgeFrom:Integer;
    AgeTo:Integer;
    AgeOrderIndex:Integer;}

    Data:TTabPrice;
    
    TabPeriod:TcxTabSheet;
    TabAge:TcxTabSheet;
  end;
  PTabRec  = ^TTabRec;
  TTabRecArr = array of TTabRec;

  TDefTabValue = record
    ValId:Variant;

    Left:TTabPrice;
    Right:TTabPrice;
  end;

  TFromTo = record
    From:Integer;
    Till:Integer;
  end;


  TPriceTabPivot=class
   private
      FFieldTabNames : TFieldTabNames;
      FDB:TDataset;
      FDBDetail:TDataset;

      FVal_ID :variant;
      FVATValuePrcTable : TVATValuePrcTable;
      
      FData : TList;// TTabRecArr;
      FDataTabs:TList;
      
      FDefValue:TDefTabValue;

      FPropertyRateCmbx  : TComboProperty;
      FFrameRangeAgePrice:TFrameRangeAgePrice;
      FReadOnly :boolean;

      procedure FDeletePage(Page:TcxTabSheet);
      procedure FDataClear;
      procedure FDataTabClear;
      procedure FClearAllDataTab;
      procedure FPrepareAllTabs;

      procedure FDataDeleteByIndex(  IndexData:Integer );
      procedure FDataDelete( DataRec:PTabRec );
      procedure FDataDeleteForTab( aPage: TcxTabSheet );
      procedure FDeletePageTab(aPage: TcxTabSheet);

      function  FFindDataIndexById(Id:Integer):Integer;
      function  FGetCaptionPeriod(aCaption:widestring;aFrom,aTo:Integer):Widestring;
      function  FGetCaptionAge(aCaption:widestring;aFrom,aTo:Integer):Widestring;
      function  FGetCaptionByDataRateRange(RateData:TRateRangeData; TabOpt: TPageTabOptions):String;

      function  FGetPageControlForOpt(TabOpt: TPageTabOptions):TcxPageControl;
      procedure FInitDataForIndex(IndexData:Integer);

      procedure FAddTabControl(Page:TcxTabSheet; aRange: TRateRangeData );
      function  FGetRangeByTabControl( Page:TcxTabSheet ):TRateRangeData;
      function  FGetRangeByPageControlAndFromTo( PageControl:TcxPageControl; From,Till:Integer ):TRateRangeData;

      function  FAddPage(PageCnt:TcxPageControl;aRange: TRateRangeData; TabOpt: TPageTabOptions):TcxTabSheet;
      function  FAddDataToPages( PeriodPage,AgePage:TcxTabSheet ):integer;
      Function  FCreateStartTabForEmptyData:Integer;
      function  FCheckTabInPageByID( aPageCnt:TcxPageControl; currTab:TcxTabSheet ):boolean;
      procedure FCreatePageControls( arrTabs:TList );


      procedure FCheckADataForAllTab;
      procedure FPrepareFrame;
      
      function  FCheckTabWhenNotFoundCreate( Caption:Widestring; From,Till,Option:Integer;TabOpt: TPageTabOptions ):TcxTabSheet;
      procedure FReadRangeDataFromDB;
      procedure FShowPrices;
      function  FIndexOfRecArr(PeriodPage,AgePage:TcxTabSheet):integer;
      procedure FClearPrices;
      procedure FPrepareControls( aReadOnly:Boolean );
      procedure FShowPricesByIndex( IndexData:Integer );
      procedure FSaveDataToIndex(IndexData:Integer);
      procedure FSaveDataTo(PeriodPage,AgePage:TcxTabSheet);
      procedure FSaveActiveData;

      function  FDecimalValueFromText(aText:WideString):Double;
      function  FDecimalValueToText(aValue:Double):Widestring;

      procedure FInitUnassignValue(var aTabPrice:TTabPrice);
      procedure FPrepareAllCombobox;
      procedure FPrepareCombobox( LCombo:TcxExtLookupComboBox; aPropert:TComboProperty );
      function  FGetFromToByPage(aPage:TcxTabSheet):TFromTo;

      procedure FTabSheetShow(Sender: TObject);
      procedure FTabControlPageChanging(Sender: TObject; NewPage: TcxTabSheet; var AllowChange: Boolean);
      procedure FAddPropertyRate( var aPropert:TComboProperty; View:TcxGridDBTableView; KeyFieldName , ListFieldName,FieldValue:String;idFilter:array of Integer; CanChange:Boolean  );
      function  FGetPeriodRange:TRateRange;
      function  FGetAgeRange:TRateRange;

      procedure FButEditPeriod(Sender: TObject);
      procedure FButEditAge(Sender: TObject);

      procedure FSynchronizeTabIndexByPageTag( TabOpt: TPageTabOptions );
      procedure FSynchronizeTabIndexForRateRange( aRange: TRateRange; TabOpt: TPageTabOptions );
      procedure FDeleteSynchronizeTab( aRange: TRateRange;  TabOpt: TPageTabOptions  );
      procedure FUpdateSynchronizeTab( aRange: TRateRange;  TabOpt: TPageTabOptions );
      procedure FUpdateDataTab(aPage: TcxTabSheet; RangeData:TRateRangeData; TabOpt: TPageTabOptions );
      procedure FDBSaveCurrData( TabRec: PTabRec );
      procedure FDBDeleteNotFoundData;
      procedure FDBSaveDetail;
      procedure FBeginUpdatePageControl(PageControl:TcxPageControl);
      procedure FEndUpdatePageControl(PageControl:TcxPageControl);
   public
      constructor Create( aFrameRangeAgePrice:TFrameRangeAgePrice; aDBMain, aDBDetail : TDataset; aFieldTabNames:TFieldTabNames );
      destructor Close;

      procedure EndTabUpdate;
      procedure BeginTabUpdate;

      procedure DBSaveData( IsNew:Boolean; ID_Service,TypeService:Integer );
      procedure AddPropertyRateCmb( View:TcxGridDBTableView; KeyFieldName, ListFieldName, FieldValue:String;idFilter:array of Integer; CanChange:Boolean  );
      procedure SetReadOnly( aReadOnly:Boolean );
      procedure SetDefDataValueForEmptyData( aDefValue:TDefTabValue);
      function  FormatCurrency(const Value: Currency;IfNolEmpty:Boolean=false): string;
      function  IndexOfRecArrActiveTab:integer;
      procedure PrepareFrame;
      procedure RefreshDataFromDB;
      property  FrameRangeAgePrice:TFrameRangeAgePrice read FFrameRangeAgePrice;
   end;

implementation

{ TPriceTabPivot }

constructor TPriceTabPivot.Create( aFrameRangeAgePrice:TFrameRangeAgePrice; aDBMain, aDBDetail : TDataset; aFieldTabNames:TFieldTabNames );
begin
   FData := TList.Create;
   FDataTabs:=TList.Create;

   FReadOnly := false;
   
   FDB := aDBMain;
   FDBDetail := aDBDetail;

   FFieldTabNames := aFieldTabNames;
   FFrameRangeAgePrice:=aFrameRangeAgePrice ;

   FFrameRangeAgePrice.TabControlPeriod.OnPageChanging:= FTabControlPageChanging;
   FFrameRangeAgePrice.TabControlAge.OnPageChanging:= FTabControlPageChanging;

   FInitUnassignValue(FDefValue.Left);
   FInitUnassignValue(FDefValue.Right);
end;
//******************************************************************************
destructor TPriceTabPivot.Close;
begin
  FDataClear;
  FData.free;

  FDataTabClear;
  FDataTabs.Free;
end;
//******************************************************************************
procedure TPriceTabPivot.FAddPropertyRate(var aPropert:TComboProperty; View:TcxGridDBTableView; KeyFieldName , ListFieldName,FieldValue:String;idFilter:array of Integer; CanChange:Boolean );
var i:integer;
begin
 aPropert.View := View;
 aPropert.KeyFieldName :=KeyFieldName;
 aPropert.ListFieldName := ListFieldName;

 aPropert.FieldValue := FieldValue;
 aPropert.CanChange:= CanChange;

 setLength( aPropert.idFilter , Length(idFilter) );
 for i:=0 to Length(idFilter)-1 do
  aPropert.idFilter[i] := IntToStr( idFilter[i]);
end;
//******************************************************************************
procedure TPriceTabPivot.AddPropertyRateCmb( View:TcxGridDBTableView; KeyFieldName, ListFieldName, FieldValue:String; idFilter:array of Integer; CanChange:Boolean );
begin
  FAddPropertyRate( FPropertyRateCmbx,View,  KeyFieldName , ListFieldName,FieldValue,idFilter, CanChange);
  FPrepareCombobox( FFrameRangeAgePrice.RateComboBox, FPropertyRateCmbx );
  FrameRangeAgePrice.PropertyComboVal := FPropertyRateCmbx;
end;
//******************************************************************************
procedure TPriceTabPivot.FPrepareCombobox( LCombo:TcxExtLookupComboBox; aPropert:TComboProperty );
begin
  SetPropInCxExtLookupComboBox( LCombo, aPropert.View, aPropert.ListFieldName, aPropert.KeyFieldName, true );
  if not self.FReadOnly then
    LCombo.Enabled:= aPropert.CanChange;
end;
//******************************************************************************
procedure TPriceTabPivot.FInitUnassignValue(var aTabPrice:TTabPrice);
begin
  if VarIsClear( aTabPrice.CostNetto ) then aTabPrice.CostNetto := null;
  if VarIsClear( aTabPrice.CostBrutto ) then aTabPrice.CostBrutto := null;
  if VarIsClear( aTabPrice.AgentVal ) then aTabPrice.AgentVal := null;
end;
//******************************************************************************
procedure TPriceTabPivot.SetReadOnly( aReadOnly:Boolean );
begin
  FReadOnly := aReadOnly;
  FPrepareControls( FReadOnly );
end;
//******************************************************************************
procedure TPriceTabPivot.SetDefDataValueForEmptyData( aDefValue:TDefTabValue );
begin
  FDefValue  := aDefValue;

  FInitUnassignValue(FDefValue.Left);
  FInitUnassignValue(FDefValue.Right);
end;
//******************************************************************************
procedure TPriceTabPivot.FPrepareAllCombobox;
begin
  FPrepareCombobox( FFrameRangeAgePrice.RateComboBox, FPropertyRateCmbx );
end;
//******************************************************************************
procedure TPriceTabPivot.FPrepareFrame;
begin
  FPrepareAllTabs;
  FPrepareAllCombobox;
  FPrepareControls( self.FReadOnly );
end;
//******************************************************************************
procedure TPriceTabPivot.PrepareFrame;
begin
  FPrepareFrame;
  FReadRangeDataFromDB;
  FShowPrices;
end;
//******************************************************************************
procedure TPriceTabPivot.RefreshDataFromDB;
begin
  FReadRangeDataFromDB;
end;
//******************************************************************************
function TPriceTabPivot.FCheckTabInPageByID( aPageCnt:TcxPageControl; currTab:TcxTabSheet ):boolean;
var i:integer;
begin
  result:=false;
  for i:=0 to aPageCnt.PageCount-1 do
  begin
    if aPageCnt.Pages[i] = currTab then
    begin
      result:=true;
      break;
    end;
  end;
end;
//******************************************************************************
procedure TPriceTabPivot.FPrepareAllTabs;
begin
  FCreatePageControls( FData );
end;
//******************************************************************************
procedure TPriceTabPivot.FDataClear;
var i:integer;
begin
  for i:=0 to FData.Count-1 do
   Dispose( PTabRec( FData.Items[i] ) );

  FData.Clear;
end;
//******************************************************************************
procedure TPriceTabPivot.FDataTabClear;
var i:integer;
begin
  for i:=0 to FDataTabs.Count-1 do
   Dispose( PTabControl( FDataTabs.Items[i] ) );

  FDataTabs.Clear;
end;
//******************************************************************************
procedure TPriceTabPivot.FDeletePage(Page:TcxTabSheet);
begin
  Page.OnShow := nil;
  Page.PageControl:=nil;
  Page.Destroy;
  Page:=Nil;
end;
//******************************************************************************
procedure TPriceTabPivot.FBeginUpdatePageControl(PageControl:TcxPageControl);
var i:integer;
begin
  PageControl.OnPageChanging:=nil;
  for i:=0 to PageControl.PageCount-1 do
  PageControl.Pages[i].OnShow:=nil;
end;
//******************************************************************************
procedure TPriceTabPivot.FEndUpdatePageControl(PageControl:TcxPageControl);
var i:integer;
begin
  PageControl.OnPageChanging:=FTabControlPageChanging;
  for i:=0 to PageControl.PageCount-1 do
  PageControl.Pages[i].OnShow := FTabSheetShow;
end;
//******************************************************************************
procedure TPriceTabPivot.BeginTabUpdate;
begin
  FBeginUpdatePageControl( FFrameRangeAgePrice.TabControlPeriod );
  FBeginUpdatePageControl( FFrameRangeAgePrice.TabControlAge );
end;
//******************************************************************************
procedure TPriceTabPivot.EndTabUpdate;
begin
  FEndUpdatePageControl( FFrameRangeAgePrice.TabControlPeriod );
  FEndUpdatePageControl( FFrameRangeAgePrice.TabControlAge );
end;
//******************************************************************************
procedure TPriceTabPivot.FClearAllDataTab;
begin
  try
    BeginTabUpdate;

    while FFrameRangeAgePrice.TabControlPeriod.PageCount<>0 do FDeletePage( FFrameRangeAgePrice.TabControlPeriod.Pages[0] );
    while FFrameRangeAgePrice.TabControlAge.PageCount<>0 do FDeletePage( FFrameRangeAgePrice.TabControlAge.Pages[0] );

  finally
    EndTabUpdate;
  end;

  FDataClear;
  FDataTabClear;
end;
//******************************************************************************
procedure TPriceTabPivot.FAddTabControl( Page:TcxTabSheet; aRange: TRateRangeData );
var TabControl:PTabControl;
begin
   New( TabControl );
   TabControl^.Caption:=aRange.Caption;
   TabControl^.From:=aRange.From;
   TabControl^.Till:=aRange.Till;
   TabControl^.OrderIndex:=Page.PageIndex;
   TabControl^.TabControl:=Page;

   self.FDataTabs.Add( TabControl );
end;
//******************************************************************************
function TPriceTabPivot.FGetRangeByTabControl( Page:TcxTabSheet ):TRateRangeData;
var i:integer;
begin
  result.Control:=nil;
  for i:=0 to self.FDataTabs.Count-1 do
  begin
    if PTabControl(self.FDataTabs.Items[i])^.TabControl = Page then
    begin
      result.Caption:= PTabControl(self.FDataTabs.Items[i])^.Caption;
      result.From:= PTabControl(self.FDataTabs.Items[i])^.From;
      result.Till:= PTabControl(self.FDataTabs.Items[i])^.Till;
      result.Option:= PTabControl(self.FDataTabs.Items[i])^.Options;
      result.Control:= PTabControl(self.FDataTabs.Items[i])^.TabControl;

      break;
    end;
  end;
end;
//******************************************************************************
function TPriceTabPivot.FGetRangeByPageControlAndFromTo( PageControl:TcxPageControl; From,Till:Integer ):TRateRangeData;
var i:integer;
begin
  result.Control:=nil;
  for i:=0 to self.FDataTabs.Count-1 do
  begin
    if (PTabControl(self.FDataTabs.Items[i])^.From = From ) and(PTabControl(self.FDataTabs.Items[i])^.Till = Till )and
       (PTabControl(self.FDataTabs.Items[i])^.TabControl.PageControl = PageControl) then
    begin
      result.Caption:= PTabControl(self.FDataTabs.Items[i])^.Caption;
      result.From:= PTabControl(self.FDataTabs.Items[i])^.From;
      result.Till:= PTabControl(self.FDataTabs.Items[i])^.Till;
      result.Option:= PTabControl(self.FDataTabs.Items[i])^.Options;
      result.Control:= PTabControl(self.FDataTabs.Items[i])^.TabControl;

      break;
    end;
  end;
end;
//******************************************************************************
function TPriceTabPivot.FAddPage( PageCnt:TcxPageControl; aRange: TRateRangeData; TabOpt: TPageTabOptions ):TcxTabSheet;
var Caption:Widestring;
begin
  try
    BeginTabUpdate;

    Caption:= FGetCaptionByDataRateRange( aRange , TabOpt );
    result := TcxTabSheet.Create(PageCnt);
    //result.Name:= PageCnt.Name+'_'+IntToStr(PageCnt.pageCount);
    result.PageControl := PageCnt;
    result.Caption :=Caption;
    result.OnShow := FTabSheetShow;

    FAddTabControl( result, aRange );
  finally
    EndTabUpdate;
  end;
end;
//******************************************************************************
function TPriceTabPivot.FGetPageControlForOpt(TabOpt: TPageTabOptions):TcxPageControl;
begin
  if TabOpt = pgTabopPeriod then result:=FFrameRangeAgePrice.TabControlPeriod;
  if TabOpt = pgTabopAge    then result:=FFrameRangeAgePrice.TabControlAge;
end;
//******************************************************************************
procedure TPriceTabPivot.FCheckADataForAllTab;
var i,j:integer;
    index:Integer;
begin
  for i:=0 to FFrameRangeAgePrice.TabControlPeriod.PageCount-1 do
    for j:=0 to FFrameRangeAgePrice.TabControlAge.PageCount-1 do
    begin
      index := FIndexOfRecArr( FFrameRangeAgePrice.TabControlPeriod.Pages[i], FFrameRangeAgePrice.TabControlAge.Pages[j] );
      if index = -1 then
      begin
        FAddDataToPages( FFrameRangeAgePrice.TabControlPeriod.Pages[i], FFrameRangeAgePrice.TabControlAge.Pages[j] );
      end;
    end;
end;
//******************************************************************************
function TPriceTabPivot.FAddDataToPages( PeriodPage,AgePage:TcxTabSheet ):integer;
var NewData:PTabRec;
begin
  New(NewData);
  NewData^.id:=null;
  NewData^.TabPeriod := PeriodPage;
  NewData^.TabAge := AgePage;

  FData.Add( NewData );

  FInitDataForIndex( FData.Count-1 );
  result:=FData.Count-1;
end;
//******************************************************************************
procedure TPriceTabPivot.FInitDataForIndex(IndexData:Integer);
begin
  FVal_ID := FDefValue.ValId;

  PTabRec( FData.Items[IndexData])^.Data.CostNetto := FDefValue.Left.CostNetto;
  PTabRec( FData.Items[IndexData])^.Data.CostBrutto:= FDefValue.Left.CostBrutto ;
  PTabRec( FData.Items[IndexData])^.Data.AgentVal  := FDefValue.Left.AgentVal;
end;
//******************************************************************************
procedure TPriceTabPivot.FUpdateDataTab( aPage: TcxTabSheet; RangeData:TRateRangeData; TabOpt: TPageTabOptions ); //= (pgTabopPeriod,pgTabopAge);
var i:integer;
begin
  for i:=0 to FDataTabs.Count-1 do
  begin
    if PTabControl( FDataTabs.Items[i] ).TabControl = aPage then
    begin
      PTabControl( FDataTabs.Items[i] ).Caption := RangeData.Caption;
      PTabControl( FDataTabs.Items[i] ).From := RangeData.From;
      PTabControl( FDataTabs.Items[i] ).Till := RangeData.Till;
      PTabControl( FDataTabs.Items[i] ).Options := RangeData.Option;
      PTabControl( FDataTabs.Items[i] ).OrderIndex := aPage.PageIndex;

      aPage.Caption:= FGetCaptionByDataRateRange( RangeData , TabOpt);
    end;
  end;
end;
//******************************************************************************
procedure TPriceTabPivot.FDataDeleteByIndex( IndexData:Integer );
begin
  if FData.Count>IndexData then FData.Delete(IndexData);
end;
//******************************************************************************
procedure TPriceTabPivot.FDataDelete( DataRec:PTabRec );
var IndexData:Integer;
begin
  IndexData := FData.IndexOf( DataRec );
  if IndexData <> -1 then FDataDeleteByIndex( IndexData );
end;
//******************************************************************************
function TPriceTabPivot.FFindDataIndexById(Id:Integer):Integer;
var i:integer;
begin
  result:=-1;
  for i:=0 to FData.Count-1 do
  begin
    if  PTabRec(FData.Items[i]).id = Id then
    begin
      result:=i;
      break;
    end;
  end;
end;
//******************************************************************************
procedure TPriceTabPivot.FDataDeleteForTab( aPage: TcxTabSheet );
var i:integer;
begin
  i:=0;
  while i < FData.Count do
  begin
    if (PTabRec( FData.Items[i] ).TabPeriod = aPage ) or
       (PTabRec( FData.Items[i] ).TabAge = aPage ) then FDataDeleteByIndex( i )
    else inc(i);
  end;
end;
//******************************************************************************
procedure TPriceTabPivot.FDeletePageTab(aPage: TcxTabSheet);
begin
  FDataDeleteForTab( aPage );
  FDeletePage(aPage);
end;
//******************************************************************************
Function TPriceTabPivot.FCreateStartTabForEmptyData:Integer;
var tabPeriod:TcxTabSheet;
    tabAge:TcxTabSheet;
    RangePeriod:TRateRangeData;
    RangeAge:TRateRangeData;
begin
  FClearAllDataTab;
  RangePeriod.Caption :='';//'> 0';
  RangePeriod.From:=0;
  RangePeriod.Till :=-1;

  RangeAge.Caption :='';//'> 0';
  RangeAge.From:=0;
  RangeAge.Till :=-1;

  tabPeriod:=FAddPage(FFrameRangeAgePrice.TabControlPeriod, RangePeriod, pgTabopPeriod );
  tabAge:=FAddPage(FFrameRangeAgePrice.TabControlAge, RangeAge , pgTabopAge);

  result:= FAddDataToPages( tabPeriod, tabAge );
end;
//******************************************************************************
procedure TPriceTabPivot.FCreatePageControls( arrTabs:TList );
var i:integer;
    tab:TcxTabSheet;
    PageCntPeriod:TcxPageControl;
    PageCntAge:TcxPageControl;

    RangePeriod:TRateRangeData;
    RangeAge:TRateRangeData;

begin
  PageCntPeriod := FFrameRangeAgePrice.TabControlPeriod;
  PageCntAge := FFrameRangeAgePrice.TabControlAge;

  for i:=0 to arrTabs.Count-1 do
  begin
    //**************************
    if not FCheckTabInPageByID( PageCntPeriod, PTabRec( arrTabs.Items[i]).TabPeriod ) then
    begin
      RangePeriod := FGetRangeByTabControl( PTabRec( arrTabs.Items[i] ).TabPeriod );

      tab := FAddPage(PageCntPeriod, RangePeriod ,pgTabopPeriod );
      PTabRec( arrTabs.Items[i]).TabAge := tab;
    end;
    //**************************
    if not FCheckTabInPageByID( PageCntAge, PTabRec( arrTabs.Items[i]).TabAge ) then
    begin
      RangeAge := FGetRangeByTabControl( PTabRec( arrTabs.Items[i] ).TabAge );

      tab := FAddPage(PageCntAge, RangeAge, pgTabopAge );
      PTabRec( arrTabs.Items[i]).TabAge := tab;
    end;
    //************************** 
  end;
end;
//******************************************************************************
function TPriceTabPivot.FCheckTabWhenNotFoundCreate(  Caption:Widestring; From,Till,Option:Integer;TabOpt: TPageTabOptions ):TcxTabSheet;
var i:integer;
    aRange:TRateRangeData;
    PageConrol:TcxPageControl;
begin
  PageConrol := FGetPageControlForOpt(TabOpt);

  aRange := FGetRangeByPageControlAndFromTo( PageConrol, From, Till );
  if aRange.Control<>nil then result:= TcxTabSheet(aRange.Control)
  else 
  begin
   aRange.Caption:=Caption;
   aRange.From:=From;
   aRange.Till:=Till;
   aRange.Option:=Option;

   result:= FAddPage(PageConrol, aRange, TabOpt );
  end;
end;
//******************************************************************************
procedure TPriceTabPivot.FReadRangeDataFromDB ;
var bmk:Tbookmark;
    TabRec:PTabRec;
begin
  FClearAllDataTab;
  try

    if not self.FDB.Active then exit;
    if not self.FDBDetail.Active then exit;
    
    self.FVal_ID := self.FDB.fieldByName(FFieldTabNames.FieldMainCurrencyID).AsVariant;

    Self.FDBDetail.DisableControls;
    bmk := Self.FDBDetail.GetBookmark;

    Self.FDBDetail.First;
    while not self.FDBDetail.Eof do
    begin
      New(TabRec);

      TabRec^.id := FDBDetail.FieldByName( FFieldTabNames.FieldId ).AsInteger;
      TabRec^.TabPeriod:= FCheckTabWhenNotFoundCreate( Self.FDBDetail.FieldByName( FFieldTabNames.FieldPeriodCaption ).AsString,
                                                       Self.FDBDetail.FieldByName( FFieldTabNames.FieldFromPeriod ).AsInteger,
                                                       Self.FDBDetail.FieldByName( FFieldTabNames.FieldToPeriod ).AsInteger,
                                                       Self.FDBDetail.FieldByName( FFieldTabNames.FieldPeriodOptions ).AsInteger, pgTabopPeriod );

      TabRec^.TabPeriod.tag := Self.FDBDetail.FieldByName( FFieldTabNames.FieldPeriodOrder ).AsInteger;

      TabRec^.TabAge:= FCheckTabWhenNotFoundCreate( Self.FDBDetail.FieldByName( FFieldTabNames.FieldAgeCaption ).AsString,
                                                       Self.FDBDetail.FieldByName( FFieldTabNames.FieldFromAge ).AsInteger,
                                                       Self.FDBDetail.FieldByName( FFieldTabNames.FieldToAge ).AsInteger,
                                                       Self.FDBDetail.FieldByName( FFieldTabNames.FieldAgeOptions ).AsInteger, pgTabopAge );

      TabRec^.TabAge.tag := Self.FDBDetail.FieldByName( FFieldTabNames.FieldAgeOrder ).AsInteger;

      TabRec^.Data.CostNetto := Self.FDBDetail.FieldByName( FFieldTabNames.FieldData.FieldNameCostNetto ).AsFloat;
      TabRec^.Data.CostBrutto:= Self.FDBDetail.FieldByName( FFieldTabNames.FieldData.FieldNameCostBrutto ).AsFloat;
      TabRec^.Data.AgentVal := Self.FDBDetail.FieldByName( FFieldTabNames.FieldData.FieldNameDiscount ).AsFloat;

      FData.Add( TabRec );
      Self.FDBDetail.Next;
    end;

    FCheckADataForAllTab;
    FSynchronizeTabIndexByPageTag( pgTabopPeriod );
    FSynchronizeTabIndexByPageTag( pgTabopAge );

  finally
  
    if ( Self.FDBDetail.BookmarkValid(bmk))and
       ( not Self.FDBDetail.IsEmpty )  then Self.FDBDetail.GotoBookmark(bmk);
    Self.FDBDetail.EnableControls;

    Self.FShowPrices;
  end;
end;
//******************************************************************************
function TPriceTabPivot.FIndexOfRecArr( PeriodPage, AgePage:TcxTabSheet ):integer;
var i:integer;
begin
  result:=-1;
  for i:=0 to FData.Count -1 do
  begin
    if (PTabRec(FData.Items[i]).TabPeriod = PeriodPage) and
       (PTabRec(FData.Items[i]).TabAge = AgePage )  then
    begin
      result:=i;
      break;
    end;
  end;
end;
//******************************************************************************
function TPriceTabPivot.IndexOfRecArrActiveTab:integer;
begin
  result := FIndexOfRecArr( FFrameRangeAgePrice.TabControlPeriod.ActivePage, FFrameRangeAgePrice.TabControlAge.ActivePage );
end;
//******************************************************************************
procedure TPriceTabPivot.FPrepareControls( aReadOnly:Boolean );
begin
  //SetEnabledControlsOnFrom( FFrameRangeAgePrice, not aReadOnly);

  FFrameRangeAgePrice.CheckAllVal.Visible:= not aReadOnly;

  FFrameRangeAgePrice.RateComboBox.Enabled := not aReadOnly;
  FFrameRangeAgePrice.AgentPercRadioButton.Enabled := not aReadOnly;
  FFrameRangeAgePrice.AgentAbsRadioButton.Enabled := not aReadOnly;
  FFrameRangeAgePrice.NetCostVatEdit.Enabled{Properties.ReadOnly} := aReadOnly;
  FFrameRangeAgePrice.BrutCostVatEdit.Enabled{Properties.ReadOnly} := aReadOnly;
  FFrameRangeAgePrice.AgentPercEdit.Enabled {Properties.ReadOnly} := aReadOnly;
  FFrameRangeAgePrice.AgentPayValEdit.Enabled{Properties.ReadOnly} := aReadOnly;
  FFrameRangeAgePrice.PanelPriceDiscountSelect.Enabled := not aReadOnly; 

  if not aReadOnly then FrameRangeAgePrice.butEditPeriod.OnClick := self.FButEditPeriod
    else FrameRangeAgePrice.butEditPeriod.OnClick := nil;

  if not aReadOnly then FrameRangeAgePrice.butEditAge.OnClick    := self.FButEditAge
    else FrameRangeAgePrice.butEditAge.OnClick    := nil;

  FrameRangeAgePrice.butEditPeriod.Enabled := not aReadOnly;
  FrameRangeAgePrice.butEditAge.Enabled := not aReadOnly;
end;
//******************************************************************************
procedure TPriceTabPivot.FClearPrices;
begin
  FFrameRangeAgePrice.NetCostVatEdit.Text := '';
  FFrameRangeAgePrice.BrutCostVatEdit.Text := '';
  FFrameRangeAgePrice.AgentPercEdit.Text :='';
  FFrameRangeAgePrice.AgentPayValEdit.Text :='';
end;
//******************************************************************************
function TPriceTabPivot.FormatCurrency(const Value: Currency;IfNolEmpty:Boolean): string;
begin
  Result := FormatCurr('0.00;-0.00;0', Value);
  if (IfNolEmpty)and(Value=0) then result:='';
end;
//******************************************************************************
procedure TPriceTabPivot.FShowPricesByIndex( IndexData:Integer );
begin
  FFrameRangeAgePrice.RateComboBox.EditValue    := self.FVal_ID;

  FFrameRangeAgePrice.NetCostVatEdit.EditValue  := PTabRec(FData.Items[IndexData]).Data.CostNetto;
  FFrameRangeAgePrice.BrutCostVatEdit.EditValue := PTabRec(FData.Items[IndexData]).Data.CostBrutto;
  FFrameRangeAgePrice.AgentPayValEdit.EditValue := PTabRec(FData.Items[IndexData]).Data.AgentVal;
  FFrameRangeAgePrice.AgentAbsRadioButton.Checked:= MyIfThen( PTabRec(FData.Items[IndexData]).Data.AgentVal = null,0, FFrameRangeAgePrice.AgentPayValEdit.EditValue ) <>0 ;
  FFrameRangeAgePrice.AgentPercRadioButton.Checked:= MyIfThen( PTabRec(FData.Items[IndexData]).Data.AgentVal = null,0, FFrameRangeAgePrice.AgentPayValEdit.EditValue ) = 0 ;

  //FFrameRangeAgePrice.AgentPayCheckBox.Checked  :=  MyIfThen(  PTabRec(FData.Items[IndexData]).Data.AgentVal = null,0, FFrameRangeAgePrice.AgentPayValEdit.EditValue )<> 0;

end;
//******************************************************************************
procedure TPriceTabPivot.FSaveDataToIndex(IndexData:Integer);
begin
  PostEditValue(FFrameRangeAgePrice);
  FVal_ID := FFrameRangeAgePrice.RateComboBox.EditValue;
  FDefValue.ValId := FVal_ID;

  PTabRec(FData.Items[IndexData]).Data.CostNetto  := FFrameRangeAgePrice.NetCostVatEdit.EditValue;
  PTabRec(FData.Items[IndexData]).Data.CostBrutto := FFrameRangeAgePrice.BrutCostVatEdit.EditValue;
  PTabRec(FData.Items[IndexData]).Data.AgentVal   := FFrameRangeAgePrice.AgentPayValEdit.EditValue;
end;
//******************************************************************************
function TPriceTabPivot.FDecimalValueFromText(aText:WideString):Double;
begin
  if DecimalSeparator<>'.' then
    ReplaseOn(aText , '.', DecimalSeparator);
  //****************************************
  if IsStrANumber(aText) then result:= StrToFloat( aText)
    else result:=0;
end;
//******************************************************************************
function TPriceTabPivot.FDecimalValueToText( aValue:Double ):Widestring;
begin
  if (aValue<>0) then result:=FloatToStr( aValue )
    else result:='';
end;
//******************************************************************************
procedure TPriceTabPivot.FSaveDataTo( PeriodPage , AgePage:TcxTabSheet );
var IndexData:Integer;
begin
  IndexData := FIndexOfRecArr( PeriodPage , AgePage );
  if IndexData = -1 then
    IndexData:= FAddDataToPages( PeriodPage, AgePage );

  FSaveDataToIndex(IndexData);
end;
//******************************************************************************
procedure TPriceTabPivot.FDBSaveCurrData( TabRec: PTabRec );
var RangePeriod:TRateRangeData;
    RangeAge:TRateRangeData;
begin
  if (TabRec.id <> null) and (FDBDetail.Locate( FFieldTabNames.FieldId, TabRec.id,[] )) then
    FDBDetail.Edit
  else FDBDetail.Insert;

  RangePeriod := FGetRangeByTabControl( TabRec^.TabPeriod );
  RangeAge := FGetRangeByTabControl( TabRec^.TabAge );

  Self.FDBDetail.FieldByName( FFieldTabNames.FieldFromPeriod ).AsInteger := RangePeriod.From  ;
  Self.FDBDetail.FieldByName( FFieldTabNames.FieldToPeriod ).AsInteger := RangePeriod.Till;
  Self.FDBDetail.FieldByName(FFieldTabNames.FieldPeriodCaption ).AsString := RangePeriod.Caption;
  Self.FDBDetail.FieldByName( FFieldTabNames.FieldPeriodOrder ).AsInteger := TabRec^.TabPeriod.PageIndex;

  Self.FDBDetail.FieldByName( FFieldTabNames.FieldFromAge ).AsInteger:=   RangeAge.From  ;
  Self.FDBDetail.FieldByName( FFieldTabNames.FieldToAge ).AsInteger :=    RangeAge.Till  ;
  Self.FDBDetail.FieldByName(FFieldTabNames.FieldAgeCaption ).AsString := RangeAge.Caption;
  Self.FDBDetail.FieldByName( FFieldTabNames.FieldAgeOrder ).AsInteger := TabRec^.TabAge.PageIndex;

  Self.FDBDetail.FieldByName( FFieldTabNames.FieldData.FieldNameCostNetto ).value := TabRec^.Data.CostNetto ;
  Self.FDBDetail.FieldByName( FFieldTabNames.FieldData.FieldNameCostBrutto ).value:= TabRec^.Data.CostBrutto;
  Self.FDBDetail.FieldByName( FFieldTabNames.FieldData.FieldNameDiscount ).value :=  TabRec^.Data.AgentVal;

  Self.FDBDetail.Post;
end;
//******************************************************************************
procedure TPriceTabPivot.FDBDeleteNotFoundData;
var bmk:Tbookmark;
    CurrID:Integer;
begin
  try
    Self.FDBDetail.DisableControls;
    bmk := Self.FDBDetail.GetBookmark;

    Self.FDBDetail.First;
    while not self.FDBDetail.Eof do
    begin
      if FFindDataIndexById(FDBDetail.FieldByName( FFieldTabNames.FieldId ).AsInteger)=-1 then
        self.FDBDetail.Delete
      else
        self.FDBDetail.Next;
    end;

  finally
    if Self.FDBDetail.BookmarkValid(bmk) then Self.FDBDetail.GotoBookmark(bmk);
    Self.FDBDetail.EnableControls;
  end;
end;
//******************************************************************************
procedure TPriceTabPivot.FDBSaveDetail;
var i,j:integer;
    index:Integer;
begin
  FDBDeleteNotFoundData;
  for i:=0 to FFrameRangeAgePrice.TabControlPeriod.PageCount-1 do
    for j:=0 to FFrameRangeAgePrice.TabControlAge.PageCount-1 do
    begin
      index := FIndexOfRecArr( FFrameRangeAgePrice.TabControlPeriod.Pages[i], FFrameRangeAgePrice.TabControlAge.Pages[j] );
      if index <> -1 then
        FDBSaveCurrData( PTabRec(FData[index]) );
    end;
end;
//******************************************************************************
procedure TPriceTabPivot.DBSaveData(IsNew:Boolean; ID_Service,TypeService:Integer );
var i,j:integer;
    index:Integer;
begin
  FSaveActiveData;

  if IsNew then
    self.FDB.Insert
  else
    self.FDB.Edit;

  self.FDB.fieldByName(FFieldTabNames.FieldMainServiceId).AsVariant := ID_Service ;
  self.FDB.fieldByName(FFieldTabNames.FieldMainServiceType).AsVariant := TypeService ;
  self.FDB.fieldByName(FFieldTabNames.FieldMainCurrencyID).AsVariant := self.FVal_ID ;
  self.FDB.Post;

  FDBSaveDetail;
end;
//******************************************************************************
procedure TPriceTabPivot.FShowPrices;
var indexData:integer;
begin
   indexData:= IndexOfRecArrActiveTab;
   FClearPrices;

   if indexData = -1 then
     indexData := FCreateStartTabForEmptyData;

   FShowPricesByIndex( indexData );
   FFrameRangeAgePrice.RefreshControl;
end;
//******************************************************************************
procedure TPriceTabPivot.FSaveActiveData;
begin
  FSaveDataTo( FFrameRangeAgePrice.TabControlPeriod.ActivePage , FFrameRangeAgePrice.TabControlAge.ActivePage );
end;
//******************************************************************************
procedure TPriceTabPivot.FTabControlPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  FSaveActiveData;
end;
//******************************************************************************
procedure TPriceTabPivot.FTabSheetShow(Sender: TObject);
begin
  FShowPrices;
end;
//******************************************************************************
function TPriceTabPivot.FGetFromToByPage(aPage:TcxTabSheet):TFromTo;
var i:integer;
begin
  for i:=0 to self.FDataTabs.Count-1 do
  begin
    if PTabControl(self.FDataTabs.Items[i]).TabControl = aPage then
    begin
      result.From := PTabControl(self.FDataTabs.Items[i]).From;
      result.Till := PTabControl(self.FDataTabs.Items[i]).Till;
    end;
  end;
end;
//******************************************************************************
function TPriceTabPivot.FGetPeriodRange:TRateRange;
var i:integer;
    FromTo:TFromTo;
begin
  SetLength( result, FrameRangeAgePrice.TabControlPeriod.PageCount);
  for i:=0 to FrameRangeAgePrice.TabControlPeriod.PageCount-1 do
  begin
     result[i].Caption :='';
     FromTo := FGetFromToByPage( FrameRangeAgePrice.TabControlPeriod.Pages[i] );

     result[i].From := FromTo.From;
     result[i].Till := FromTo.Till;
     result[i].Control :=  FrameRangeAgePrice.TabControlPeriod.Pages[i];
  end;
end;
//******************************************************************************
function TPriceTabPivot.FGetCaptionPeriod(aCaption:widestring;aFrom,aTo:Integer):Widestring;
var RangeData: TRateRangeData;
begin
 RangeData.Caption := aCaption;
 RangeData.From := aFrom;
 RangeData.Till := aTo;
 result := PeriodName(RangeData);
end;
//******************************************************************************
function TPriceTabPivot.FGetCaptionAge(aCaption:widestring;aFrom,aTo:Integer):Widestring;
var RangeData: TRateRangeData;
begin
 RangeData.Caption := aCaption;
 RangeData.From := aFrom;
 RangeData.Till := aTo;
 result := AgeName(RangeData);
end;
//******************************************************************************
function TPriceTabPivot.FGetCaptionByDataRateRange( RateData:TRateRangeData; TabOpt: TPageTabOptions ):String;
begin
  if TabOpt = pgTabopPeriod then result := FGetCaptionPeriod(RateData.Caption, RateData.From, RateData.Till );
  if TabOpt = pgTabopAge then result := FGetCaptionAge(RateData.Caption, RateData.From, RateData.Till );
end;
//******************************************************************************
function TPriceTabPivot.FGetAgeRange:TRateRange;
var i:integer;
    FromTo:TFromTo;
begin
  SetLength( result, FrameRangeAgePrice.TabControlAge.PageCount);
  for i:=0 to FrameRangeAgePrice.TabControlAge.PageCount-1 do
  begin
    result[i].Caption := '';
    FromTo := FGetFromToByPage( FrameRangeAgePrice.TabControlAge.Pages[i] );
    
    result[i].From := FromTo.From;
    result[i].Till := FromTo.Till;
    result[i].Control:= FrameRangeAgePrice.TabControlAge.Pages[i];
  end;
end;
//******************************************************************************
procedure TPriceTabPivot.FSynchronizeTabIndexForRateRange( aRange: TRateRange; TabOpt: TPageTabOptions );
var i:integer;
    PageControl:TcxPageControl;
begin
  PageControl := FGetPageControlForOpt(TabOpt);
  for i:=0 to Length(aRange)-1 do
    TcxTabSheet( aRange[i].Control).Tag := i;

  FSynchronizeTabIndexByPageTag( TabOpt );
end;
//******************************************************************************
procedure TPriceTabPivot.FSynchronizeTabIndexByPageTag( TabOpt: TPageTabOptions );
var i:integer;
    PageControl:TcxPageControl;
    currPage:TcxTabSheet;

function GetPageByTagIndex(TagIndex:Integer):TcxTabSheet;
var i:integer;
begin
  result:=nil;
  for i:=0 to PageControl.PageCount-1 do
  begin
    if PageControl.Pages[i].Tag = TagIndex then
    begin
      result:=PageControl.Pages[i];
      break;
    end;
  end;
end;
begin
  try
     BeginTabUpdate;

     PageControl := FGetPageControlForOpt(TabOpt);
     for i:=PageControl.PageCount-1 downto 0 do
     begin
       currPage:= GetPageByTagIndex( i );
       if currPage<>nil then
       begin
         currPage.PageIndex:=i;
         currPage.Tag:=0;
       end;
     end;
     if PageControl.PageCount<>0 then PageControl.ActivePageIndex:=0;
  finally
    EndTabUpdate;
  end;
end;
//******************************************************************************
procedure TPriceTabPivot.FDeleteSynchronizeTab( aRange: TRateRange; TabOpt: TPageTabOptions );
var i:integer;
    PageControl:TcxPageControl;
function FindTabOnRange(aPage:TcxTabSheet):boolean;
var i:integer;
begin
  result:=false;
  for i:=0 to Length(aRange)-1 do
    if aRange[i].Control = aPage then
    begin
      result:=true;
      break;
    end;
end;
//**********************************************
begin
   i:=0;
   PageControl := FGetPageControlForOpt(TabOpt);
   while i< PageControl.PageCount do
   begin
     if not FindTabOnRange( PageControl.Pages[i] ) then
     begin
      FDataDeleteForTab( PageControl.Pages[i] );
      FDeletePage( PageControl.Pages[i] );
     end
     else inc(i);
   end;
end;
//******************************************************************************
procedure TPriceTabPivot.FUpdateSynchronizeTab( aRange: TRateRange; TabOpt: TPageTabOptions );
var i:integer;
    PageCnt:TcxPageControl;
begin
   PageCnt:= FGetPageControlForOpt(TabOpt);

   for i:=0 to Length(aRange)-1 do
     if aRange[i].Control = nil then
       aRange[i].Control := FAddPage( PageCnt,aRange[i], TabOpt );

   FCheckADataForAllTab;

   for i:=0 to Length(aRange)-1 do
     FUpdateDataTab( TcxTabSheet(aRange[i].Control), aRange[i], TabOpt );
end;
//******************************************************************************
procedure TPriceTabPivot.FButEditPeriod(Sender: TObject);
var aRange: TRateRange;
begin
  FSaveActiveData;
  aRange := FGetPeriodRange;
  if ExecuteHeaderConfigPeriodForm(aRange) then
  begin
    FDeleteSynchronizeTab( aRange, pgTabopPeriod );
    FUpdateSynchronizeTab( aRange, pgTabopPeriod );
    FSynchronizeTabIndexForRateRange( aRange, pgTabopPeriod );
    Self.FShowPrices;
  end;
end;
//******************************************************************************
procedure TPriceTabPivot.FButEditAge(Sender: TObject);
var aRange: TRateRange;
begin
  FSaveActiveData;
  aRange:=FGetAgeRange;
  if ExecuteHeaderConfigAgeForm(aRange) then
  begin
    FDeleteSynchronizeTab( aRange, pgTabopAge );
    FUpdateSynchronizeTab( aRange, pgTabopAge );
    FSynchronizeTabIndexForRateRange( aRange, pgTabopAge );
    Self.FShowPrices;
  end;
end;
//******************************************************************************




end.



{procedure TPriceTabPivot.FPrepareReadVatTable;
var len:integer;
    aDB:TDataset;
begin
  SetLength( FVATValuePrcTable, 0 ) ;
  aDB:= FPropertyRateCmbx.View.DataController.DataSet;
  aDB.First;
  while not aDB.Eof do
  begin
    len:=Length(FVATValuePrcTable);
    SetLength( FVATValuePrcTable, len+1 );

    FVATValuePrcTable[len].id := aDB.fieldByName(FPropertyRateCmbx.KeyFieldName).AsInteger;
    FVATValuePrcTable[len].Value := aDB.fieldByName(FPropertyRateCmbx.FieldValue).AsFloat;

    aDB.Next;
  end;
end;}
//******************************************************************************

