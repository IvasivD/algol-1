unit UnitApiSite;

interface
uses DB,uLkJSON, XMLIntf, msxmldom, XMLDoc,XSBuiltIns,
  ComObj, MSXML,SysUtils, UnitProc, cxDBTL,cxTL,cxCustomData, Classes, UnitSqlDB,variants;

type
  TApiFormat = (opApiJson,opApiXML);

  TStructRateDetail = record
    idRateDetail:string;
    idService : string;
    TypeService : Integer;
    NameService : WideString;
    Rate : Double;
    AgentPay :Double;
    CurrencyName:string;
  end;
  //*******************
  TRatesArr = array of TStructRateDetail;
  TStructRate = record
    idRate:string;
    NameRate : string;
    aType : Integer;
    DateStart : TDateTime;
    DateEnd : TDateTime;
    idCurrency : string;
    NameCurrency:string;
    NameCoinsCurrency:string;
    TotalRATE : Double;
    TotalAgentPay :Double;
    Rates :TRatesArr;
  end;
  //*******************
  TStructTourGroup = record
     IdGroup : string;
     GroupDate : string;
     TourDays:Integer;
     RateLines :array of TStructRate;
  end;
  TGroupsArr = array of TStructTourGroup;
  //*******************
  TStructTour = record
     IdTour:string;
     NameTour:WideString;
     Groups : TGroupsArr;
     TourDayMin:Integer;
     TourDayMax:Integer;
  end;
  //*******************
  TStructToursAndRates = array of TStructTour;

  TStructCounries = record
    Id:integer;
    Name:string;
  end;
  TStructCounriesArr = array of TStructCounries;

  TStructCountryInf = record
     id :integer;
     Value : string;
  end;
  TStructCountry = record
    NAME :string;
    id_countries_type_info : integer;
    Groups : array of TStructCountryInf;
  end;
  TStructCountryArr = array of TStructCountry;

  TSectionCountry = record
    id:integer;
    parent:integer;
    aOrder:Integer;
    Name : string;
  end;

  TRateTourGroupRate = record
    PromoPrice:Integer;
    PromoName:String;
    PromoFromDate:TDateTime;
    PromoTillDate:TDateTime;
    MainRate:Double;
    MainAgentPay:Double;
    EXT_TourId:Integer;
    EXT_TourName:string;
    CurrencyName:string;
  end;
  TRateTourGroupRateArr = array of TRateTourGroupRate;

  TRateTourGroup = record
    TourGroupId:Integer;
    TourDate : TDateTime;
    Rate:Double;
    AgentPay:Double;
    RateMaxDate:TDateTime;

    ExParam : TRateTourGroupRateArr;
  end;
  TRateTourGroupArr = Array of TRateTourGroup;

  TRatesTourGroup = record
    Rate :Double;
    AgentPay :Double;
    RateMaxDate :TDateTime;
    CurrencyName :string;
  end;

  TRatesTourGroupArr = Array of TRatesTourGroup;
  TAllServRateTourGroup = record
    ServiceId:Integer;
    ServiceName:string;
    ServicekindId:Integer;
    Descript:WideString;
    Rate : TRatesTourGroupArr;
  end;
  TAllServRateTourGroupArr = Array of TAllServRateTourGroup;

  TAllServAtypeRateTourGroup = record
    AgeTypeID : Integer;
    AgeFrom : Integer;
    AgeTo : Integer;
    AgeTypeName : string;
    Base : TAllServRateTourGroupArr;
    Required : TAllServRateTourGroupArr;
    Hidden : TAllServRateTourGroupArr;
  end;
  TAllServAtypeRateTourGroupArr = array of TAllServAtypeRateTourGroup;


  TApiSite = class
  private
    function FAddRateDataiToArr( RateDetail:TStructRateDetail;var TourArr:TStructToursAndRates;IndexTour,IndexGroup,IndRate:Integer ):integer;
    function FAddRateToArr( Rate:TStructRate;var TourArr:TStructToursAndRates;IndexTour,IndexGroup:Integer  ):integer;
    function FAddTourGroupToArr( Group:TStructTourGroup;var TourArr:TStructToursAndRates;IndexTour:Integer  ):Integer;
    function FAddTourToArr( Tour:TStructTour;var TourArr:TStructToursAndRates ):integer;
    function FMakeStructure(Dataset: TDataset; isAgent: Boolean):TStructToursAndRates;
    function FMakeJsonToursAndRates( Stucture:TStructToursAndRates;isAgent:Boolean ): WideString;
    function FMakeXMLToursAndRates( Stucture:TStructToursAndRates;isAgent:Boolean ): WideString;
    function FMakeJsonCountries( Stucture:TStructCounriesArr ): WideString;
    function FMakeStructCounries( Dataset: TDataset ):TStructCounriesArr;

    function FMakeJsonCountryInfo( jsObjTree:TlkJSONobject; Stucture:TStructCountryArr ): WideString;
    Procedure FMakeJsonSectionNode( PathLoadContent:string; aNode:TcxTreeListNode; var JsObjParent: TlkJSONobject );
    function FMakeJsonSectionCounriesObj(PathLoadContent:string; aTree:TcxDBTreeList ):TlkJSONobject;
    function FAddCountryToArr( Country:TStructCountryInf; Name:string; id_countries_type_info:Integer; var CountryArr:TStructCountryArr ):integer;
    function FMakeJsonSectionCounries( Dataset: TDataset  ):string;
    function FMakeStructCounryInfo( Dataset: TDataset ):TStructCountryArr;
    function FMakeStructSectionCounries( Dataset: TDataset ):TcxDBTreeList;
    function FConvertToXSDateTimeStr( aDateTime:TDateTime ): String;
    function FMakeJsonClientData( DataCli : PDatCli ):Widestring;
    function FMakeStructureDataCli( DBClient, DBAddres: TDataset ):PDatCli;

    function FAddRateTourGroupDate_old(TourGroupId:Integer;OnDate:TDateTime;var Struct:TRateTourGroupArr):integer;
    function FMakeStructRateTourGroupOnDate_Old( Dataset : TDataset ): TRateTourGroupArr;
    function FMakeJsonRateTourGroupOnDate_Old( RateTourGroupArr:TRateTourGroupArr ): WideString;

    function FAddServiceToATYPEAll_old( AgeTypeID:Integer; AGETYPENAME:string; AGEFROM, AGETILL:Integer; var Struct:TAllServAtypeRateTourGroupArr  ):integer;
    function FAddServiceToAll_old(ServiceId,ServiceKindId:Integer;ServiceName:string;  Descript:WideString; var Struct:TAllServRateTourGroupArr ):integer;
    function FMakeStructureAllServicesRateTourGroupOnDate_Old( Dataset : TDataset ): TAllServAtypeRateTourGroupArr;
    function FMakeJsonAllServicesRateTourGroupOnDate_Old( RateAllServArr:TAllServAtypeRateTourGroupArr ): WideString;

  public
    Function MakeJsonToursAndRates(Dataset:TDataset;isAgent:Boolean):WideString;
    function MakeXMLToursAndRates( Dataset:TDataset;isAgent:Boolean ): WideString;
    function MakeToursAndRatesObject( Dataset:TDataset; isAgent:Boolean;apiFomat:TApiFormat ): WideString;

    function MakeJsonCountries( Dataset: TDataset ): WideString;
    function MakeJsonCountryInfo( PathLoadContent:string; Dataset, DatasetSection : TDataset ): WideString;
    function MakeJsonLanguages(Dataset : TDataset ): WideString;
    function MakeJsonClientData( DBClient, DBAddres: TDataset ):Widestring;
    function MakeJsonCheckClient( DBClient: TDataset ):Widestring;
    function FMakeJsonCheckClient( aIdCompany: Integer ):Widestring;

    function MakeJsonRateTourGroupOnDate_Old( Dataset: TDataset ): WideString;
    function MakeJsonAllServicesRateTourGroupOnDate_Old ( Dataset: TDataset ): WideString;

  end;

implementation

{ TApiSite }
function TApiSite.FAddRateDataiToArr( RateDetail:TStructRateDetail; var TourArr:TStructToursAndRates;IndexTour,IndexGroup,IndRate:Integer  ):integer;
var i:Integer;
    find:Boolean;
    len:Integer;
begin
  find:=False;
  //***************
  for i:=0 to Length( TourArr[IndexTour].Groups[IndexGroup].RateLines[IndRate].Rates ) - 1 do
  begin
    if TourArr[IndexTour].Groups[IndexGroup].RateLines[IndRate].Rates[i].idRateDetail = RateDetail.idRateDetail then
    begin
      find := True;
      result := i;
      Break;
    end;
  end;
  //***************
  if not find then
  begin
    len :=Length( TourArr[IndexTour].Groups[IndexGroup].RateLines[IndRate].Rates );
    SetLength(TourArr[IndexTour].Groups[IndexGroup].RateLines[IndRate].Rates,len+1);
    TourArr[IndexTour].Groups[IndexGroup].RateLines[IndRate].Rates[len] := RateDetail;
    result := Len;
  end;
end;
//******************************************************************************

function TApiSite.FAddRateToArr( Rate:TStructRate; var TourArr:TStructToursAndRates;IndexTour,IndexGroup:Integer  ):integer;
var i:Integer;
    find:Boolean;
    len:Integer;
begin
  find:=False;
  //***************
  for i:=0 to Length( TourArr[IndexTour].Groups[IndexGroup].RateLines ) - 1 do
  begin
    if TourArr[IndexTour].Groups[IndexGroup].RateLines[i].idRate = Rate.idRate then
    begin
      find := True;
      result := i;
      Break;
    end;
  end;
  //***************
  if not find then
  begin
    len :=Length( TourArr[IndexTour].Groups[IndexGroup].RateLines );
    SetLength(TourArr[IndexTour].Groups[IndexGroup].RateLines,len+1);
    TourArr[IndexTour].Groups[IndexGroup].RateLines[len]:= Rate;
    result := Len;
  end;
end;
//******************************************************************************
function TApiSite.FAddTourGroupToArr( Group:TStructTourGroup; var TourArr:TStructToursAndRates;IndexTour:Integer ):Integer;
var i:Integer;
    find:Boolean;
    len:Integer;
begin
  find:=False;
  //***************
  for i:=0 to Length( TourArr[IndexTour].Groups )-1 do
  begin
    if TourArr[IndexTour].Groups[i].IdGroup = Group.IdGroup then
    begin
      find := True;
      result := i;
      Break;
    end;
  end;
  //***************
  if not find then
  begin
    len :=Length( TourArr[IndexTour].Groups );
    SetLength(TourArr[IndexTour].Groups,len+1);
    TourArr[IndexTour].Groups[len]:= Group;
    result := len;
  end;
end;
//******************************************************************************
function TApiSite.FAddTourToArr( Tour:TStructTour; var TourArr:TStructToursAndRates ):integer;
var i:Integer;
    find:Boolean;
    len:Integer;
begin
  find:=False;
  //***************
  for i:=0 to Length( TourArr )-1 do
  begin
    if TourArr[i].IdTour = Tour.IdTour then
    begin
      find := True;
      result := i;
      Break;
    end;
  end;
  //***************
  if not find then
  begin
    len :=Length( TourArr );
    SetLength(TourArr,len+1);
    TourArr[len]:= Tour;
    TourArr[len].TourDayMin := 0;
    TourArr[len].TourDayMax := 0;

    result := len;
  end;
end;
//******************************************************************************
function TApiSite.FMakeStructure(Dataset: TDataset; isAgent: Boolean):TStructToursAndRates;
var Tour:TStructTour;
    Group:TStructTourGroup;
    Rate:TStructRate;
    RateDetail:TStructRateDetail;

    indArrTour:Integer;
    indArrGroups:Integer;
    indRate:Integer;
begin
  if not Dataset.Active then Dataset.Open;
  Dataset.First;
  while not Dataset.Eof do
  begin

    Tour.IdTour := Dataset.FieldByName('TourId').asString;
    Tour.NameTour := Dataset.FieldByName('TourName').asString;

    indArrTour := FAddTourToArr( Tour, result );

    Group.IdGroup := Dataset.FieldByName('TourGroupId').asString;
    Group.GroupDate := Dataset.FieldByName('Tourdate').asString;
    Group.TourDays := Dataset.FieldByName('TourDays').asInteger;

    indArrGroups := FAddTourGroupToArr( Group, Result, indArrTour );

    Rate.idRate := Dataset.FieldByName('RateLineId').asString;
    Rate.NameRate := Dataset.FieldByName('RateLineName').asString;
    Rate.aType := Dataset.FieldByName('RateLineType').asInteger;
    Rate.DateStart := Dataset.FieldByName('RateLineDateStart').AsDateTime; //
    Rate.DateEnd := Dataset.FieldByName('RateLineDateEnd').AsDateTime;    //
    Rate.idCurrency := Dataset.FieldByName('id_currency').AsString;
    Rate.NameCurrency := Dataset.FieldByName('NameCurrency').AsString;
    Rate.NameCoinsCurrency := Dataset.FieldByName('NameCoinsCurrency').AsString;

    indRate := FAddRateToArr( Rate, result,indArrTour,indArrGroups );

    Result[indArrTour].Groups[indArrGroups].RateLines[indRate].TotalRATE := Result[indArrTour].Groups[indArrGroups].RateLines[indRate].TotalRATE + Dataset.FieldByName('RATE').AsFloat;
    Result[indArrTour].Groups[indArrGroups].RateLines[indRate].TotalAgentPay := Result[indArrTour].Groups[indArrGroups].RateLines[indRate].TotalAgentPay + Dataset.FieldByName('agentpay').AsFloat;

    if (Dataset.FieldByName('TourDays').asInteger <= Result[indArrTour].TourDayMin) or
       (Result[indArrTour].TourDayMin=0) then
      Result[indArrTour].TourDayMin := Dataset.FieldByName('TourDays').asInteger;

    if (Dataset.FieldByName('TourDays').asInteger >= Result[indArrTour].TourDayMax) or
       (Result[indArrTour].TourDayMin=0) then
      Result[indArrTour].TourDayMax := Dataset.FieldByName('TourDays').asInteger;

    RateDetail.idRateDetail := Dataset.FieldByName('RateLineDetailId').asString;
    RateDetail.idService := Dataset.FieldByName('ID_SERVICE').asString;
    RateDetail.TypeService := Dataset.FieldByName('TYPE_SERVICE').asInteger;
    RateDetail.NameService := Dataset.FieldByName('NameService').AsString;
    RateDetail.Rate := Dataset.FieldByName('RATE').AsFloat;
    RateDetail.AgentPay := Dataset.FieldByName('agentpay').AsFloat;
    RateDetail.CurrencyName:= Dataset.FieldByName('CURRENCYNAME').asString;
    //RateDetail.AGEFrom :=  Dataset.FieldByName('AGEFROM').asInteger;
    //RateDetail.AGETILL :=  Dataset.FieldByName('AGETILL').asInteger;
    FAddRateDataiToArr( RateDetail, result, indArrTour,indArrGroups,IndRate );
    
    Dataset.Next;
  end;
end;
//******************************************************************************
function TApiSite.FMakeJsonToursAndRates( Stucture:TStructToursAndRates;isAgent:Boolean ): WideString;
var i,j,k,l:Integer;
    ListTours : TlkJSONlist;
    ListGroups : TlkJSONlist;
    ListRateDetail  : TlkJSONlist;
    ObjectTours : TlkJSONobject;
    ObjectGroups: TlkJSONobject;
    ObjectRates : TlkJSONobject;
    ObjectRatesDetail : TlkJSONobject;

    ObjectAll:TlkJSONobject;

   // aJSValue: TJSONValue;
begin
  try
    ObjectAll := TlkJSONobject.Create;
    ListTours := TlkJSONlist.Create;

    for i:=0 to Length( Stucture )-1 do
    begin

      ObjectTours:= TlkJSONobject.Create;

      ObjectTours.Add( 'ID_TOUR',Stucture[i].IdTour );
      ObjectTours.Add( 'NAME_TOUR',Stucture[i].NameTour );
      ObjectTours.Add( 'DAY_COUNT_MIN', Stucture[i].TourDayMin );
      ObjectTours.Add( 'DAY_COUNT_MAX', Stucture[i].TourDayMax );

      ListGroups := TlkJSONlist.Create;
      for j:=0 to Length( Stucture[i].Groups )-1 do
      begin
        ObjectGroups := TlkJSONobject.Create;

        ObjectGroups.Add( 'ID_GROUP', Stucture[i].Groups[j].IdGroup );
        ObjectGroups.Add( 'DATE_GROUP', Stucture[i].Groups[j].GroupDate );
        ObjectGroups.Add( 'DAY_COUNT', Stucture[i].Groups[j].TourDays );

        ListGroups.Add( ObjectGroups );

        for k:=0 to Length( Stucture[i].Groups[j].RateLines )-1 do
        begin
          ObjectRates := TlkJSONobject.Create;
          ObjectRates.Add('ID_RATELINE', Stucture[i].Groups[j].RateLines[k].idRate );
          ObjectRates.Add('NAME_RATELINE', Stucture[i].Groups[j].RateLines[k].NameRate );
          ObjectRates.Add('TYPE_RATELINE', Stucture[i].Groups[j].RateLines[k].aType );
          ObjectRates.Add('DATE_START_RATELINE', FConvertToXSDateTimeStr( Stucture[i].Groups[j].RateLines[k].DateStart ) );
          ObjectRates.Add('DATE_END_RATELINE', FConvertToXSDateTimeStr( Stucture[i].Groups[j].RateLines[k].DateEnd ) );
          ObjectRates.Add('TOTAL_RATELINE', Stucture[i].Groups[j].RateLines[k].TotalRATE );
          if isAgent then
            ObjectRates.Add('TOTAL_AGENTPAY', Stucture[i].Groups[j].RateLines[k].TotalAgentPay );

          ObjectRates.Add('ID_CURRENCY', Stucture[i].Groups[j].RateLines[k].idCurrency );
          ObjectRates.Add('NAME_CURRENCY', Stucture[i].Groups[j].RateLines[k].NameCurrency );
          ObjectRates.Add('NAME_COIN_CURRENCY', Stucture[i].Groups[j].RateLines[k].NameCoinsCurrency );

          ObjectGroups.Add('RATE',ObjectRates);
          ListRateDetail := TlkJSONlist.Create;
          for l:=0 to Length( Stucture[i].Groups[j].RateLines[k].Rates )-1 do
          begin
            ObjectRatesDetail := TlkJSONobject.Create;
            ObjectRatesDetail.Add('ID_RATE_LINE_DETAIL', Stucture[i].Groups[j].RateLines[k].Rates[l].idRateDetail );
            ObjectRatesDetail.Add('ID_SERVICE', Stucture[i].Groups[j].RateLines[k].Rates[l].idService );
            ObjectRatesDetail.Add('TYPE_SERVICE', Stucture[i].Groups[j].RateLines[k].Rates[l].TypeService );
            ObjectRatesDetail.Add('NAME_SERVICE', Stucture[i].Groups[j].RateLines[k].Rates[l].NameService );
            ObjectRatesDetail.Add('PRICE', Stucture[i].Groups[j].RateLines[k].Rates[l].Rate );
            if isAgent then
              ObjectRatesDetail.Add('AGENTPAY', Stucture[i].Groups[j].RateLines[k].Rates[l].AgentPay );

            ListRateDetail.Add( ObjectRatesDetail );
          end;
          ObjectRates.Add('RATE_DETAILS', ListRateDetail );

        end;
      end;

      ObjectTours.Add('GROUPS',ListGroups );
      ListTours.Add( ObjectTours );

    end;

    ObjectAll.Add( 'TOURS', ListTours );
    i := 0;
    result := {Utf8Decode} GenerateReadableText( ObjectAll, i ) ;
  finally
    ObjectAll.Free;
  end;
end;
//******************************************************************************
function TApiSite.MakeJsonToursAndRates( Dataset: TDataset; isAgent: Boolean ): WideString;
begin
  result := FMakeJsonToursAndRates ( FMakeStructure( Dataset, isAgent ), isAgent  );
end;
//******************************************************************************
function TApiSite.FMakeXMLToursAndRates( Stucture:TStructToursAndRates;isAgent:Boolean ): WideString;
var i,j,k,l:Integer;
  xml: TXMLDocument;
  ObjectTours:IXMLNode;
  ObjectGroups:IXMLNode;
  ObjectRates:IXMLNode;
  ObjectRatesDetail:IXMLNode;
  //ProcesInst:IXMLDOMProcessingInstruction;
  Root:IXMLNode;
begin
  try
    xml := TXMLDocument.Create(nil);
    xml.Active := True;
    Root := xml.CreateNode('TOURS');

    xml.DocumentElement := Root;
    for i:=0 to Length( Stucture )-1 do
    begin
      ObjectTours := xml.CreateNode('Tour');

      ObjectTours.setAttribute( 'ID_TOUR', Stucture[i].IdTour );
      ObjectTours.setAttribute( 'NAME_TOUR', Stucture[i].NameTour );
      ObjectTours.setAttribute( 'DAY_COUNT_MIN', Stucture[i].TourDayMin );
      ObjectTours.setAttribute( 'DAY_COUNT_MAX', Stucture[i].TourDayMax );

      for j:=0 to Length( Stucture[i].Groups )-1 do
      begin
        ObjectGroups := xml.CreateNode('GROUPS');

        ObjectGroups.setAttribute( 'ID_GROUP', Stucture[i].Groups[j].IdGroup );
        ObjectGroups.setAttribute( 'DATE_GROUP', Stucture[i].Groups[j].GroupDate );
        ObjectGroups.setAttribute( 'DAY_COUNT', Stucture[i].Groups[j].TourDays );
        ObjectTours.ChildNodes.Add( ObjectGroups );

        for k:=0 to Length( Stucture[i].Groups[j].RateLines )-1 do
        begin
          ObjectRates := xml.CreateNode('RATE');
          ObjectRates.setAttribute('ID_RATELINE', Stucture[i].Groups[j].RateLines[k].idRate );
          ObjectRates.setAttribute('NAME_RATELINE', Stucture[i].Groups[j].RateLines[k].NameRate );
          ObjectRates.setAttribute('TYPE_RATELINE', Stucture[i].Groups[j].RateLines[k].aType );
          ObjectRates.setAttribute('DATE_START_RATELINE', FConvertToXSDateTimeStr( Stucture[i].Groups[j].RateLines[k].DateStart ) );
          ObjectRates.setAttribute('DATE_END_RATELINE', FConvertToXSDateTimeStr( Stucture[i].Groups[j].RateLines[k].DateEnd ) );
          ObjectRates.setAttribute('TOTAL_RATELINE', Stucture[i].Groups[j].RateLines[k].TotalRATE );
          if isAgent then
            ObjectRates.setAttribute('TOTAL_AGENTPAY', Stucture[i].Groups[j].RateLines[k].TotalAgentPay );

          ObjectRates.setAttribute('ID_CURRENCY', Stucture[i].Groups[j].RateLines[k].idCurrency );
          ObjectRates.setAttribute('NAME_CURRENCY', Stucture[i].Groups[j].RateLines[k].NameCurrency );
          ObjectRates.setAttribute('NAME_COIN_CURRENCY', Stucture[i].Groups[j].RateLines[k].NameCoinsCurrency );

          ObjectGroups.ChildNodes.Add( ObjectRates );

          for l:=0 to Length( Stucture[i].Groups[j].RateLines[k].Rates )-1 do
          begin
            ObjectRatesDetail := xml.CreateNode('RATE_DETAILS');
            ObjectRatesDetail.setAttribute('ID_RATE_LINE_DETAIL', Stucture[i].Groups[j].RateLines[k].Rates[l].idRateDetail );
            ObjectRatesDetail.setAttribute('ID_SERVICE', Stucture[i].Groups[j].RateLines[k].Rates[l].idService );
            ObjectRatesDetail.setAttribute('TYPE_SERVICE', Stucture[i].Groups[j].RateLines[k].Rates[l].TypeService );
            ObjectRatesDetail.setAttribute('NAME_SERVICE', Stucture[i].Groups[j].RateLines[k].Rates[l].NameService );
            ObjectRatesDetail.setAttribute('PRICE', Stucture[i].Groups[j].RateLines[k].Rates[l].Rate );
            if isAgent then
              ObjectRatesDetail.setAttribute('AGENTPAY', Stucture[i].Groups[j].RateLines[k].Rates[l].AgentPay );

            ObjectRates.ChildNodes.Add( ObjectRatesDetail );
          end;
        end;

      end;

      Root.ChildNodes.Add( ObjectTours );
    end;
    Result := Utf8Decode( xml.XML.Text );
  finally

  end;
end;
//******************************************************************************
function TApiSite.MakeXMLToursAndRates( Dataset:TDataset;isAgent:Boolean ): WideString;
begin
  result := FMakeXMLToursAndRates( FMakeStructure( Dataset, isAgent ), isAgent ) ;
end;
//******************************************************************************
function TApiSite.MakeToursAndRatesObject( Dataset:TDataset; isAgent:Boolean;apiFomat:TApiFormat ): WideString;
begin
  if apiFomat = opApiJson then
     result:= MakeJsonToursAndRates( Dataset, isAgent );

  if apiFomat = opApiXML then
     Result := MakeXMLToursAndRates( Dataset, isAgent );
end;
//******************************************************************************
function TApiSite.FMakeJsonCountries( Stucture:TStructCounriesArr ): WideString;   // ok
var i:Integer;
    ObjectAll : TlkJSONobject;
    ListCountries : TlkJSONlist;
    ListGroups : TlkJSONlist;
    ObjectCountries : TlkJSONobject;
begin
  try
    ObjectAll := TlkJSONobject.Create;
    ListCountries := TlkJSONlist.Create;
     for i:=0 to Length( Stucture )-1 do
    begin
      ObjectCountries:= TlkJSONobject.Create;
      ObjectCountries.Add( 'ID', Stucture[i].Id );
      ObjectCountries.Add( 'NAME', Stucture[i].NAME );

      ListCountries.Add( ObjectCountries );
    end;

    ObjectAll.Add( 'COUNTRIES', ListCountries );
    i := 0;
    result :=  GenerateReadableText( ObjectAll, i ) ;
  finally
    ObjectAll.Free;
  end;
end;
//******************************************************************************
function TApiSite.FMakeStructCounries( Dataset: TDataset ):TStructCounriesArr;
var Country: TStructCounries;
    len : Integer;
begin
  if not Dataset.Active then Dataset.Open;
  Dataset.First;
  SetLength(result,0);

  while not Dataset.Eof do
  begin

    Country.Id := Dataset.FieldByName('ID').asInteger;
    Country.Name := Dataset.FieldByName('NAME').asString;

    len := Length( result );
    SetLength( result, len+1 );
    result[len] := Country;

    Dataset.next;
  end;
end;
//******************************************************************************
function TApiSite.MakeJsonCountries( Dataset: TDataset ): WideString;
begin
  result := FMakeJsonCountries ( FMakeStructCounries( Dataset ) );
end;
//******************************************************************************
function TApiSite.FMakeJsonCountryInfo( jsObjTree:TlkJSONobject; Stucture:TStructCountryArr ): WideString;
var i,j:Integer;
    ObjectAll : TlkJSONobject;
    LisCountryInfo : TlkJSONlist;
    ListGroups : TlkJSONlist;
    ObjectGroups: TlkJSONobject;
    ObjectCountries : TlkJSONobject;
    //jsObjTreeList : TlkJSONlist;
begin
  try
    ObjectAll := TlkJSONobject.Create;
    LisCountryInfo := TlkJSONlist.Create;
    for i:=0 to Length( Stucture ) - 1 do
    begin
      ObjectCountries := TlkJSONobject.Create;
      ObjectCountries.Add( 'ID', Stucture[i].id_countries_type_info );
      ObjectCountries.Add( 'NAME', Stucture[i].NAME );

      ListGroups := TlkJSONlist.Create;
      for j:=0 to Length( Stucture[i].Groups ) - 1 do
      begin
        ObjectGroups := TlkJSONobject.Create;

        ObjectGroups.Add( 'ID', Stucture[i].Groups[j].id );
        ObjectGroups.Add( 'VALUE', Stucture[i].Groups[j].Value );

        ListGroups.Add( ObjectGroups );
      end;

      ObjectCountries.Add('LIST', ListGroups );
      LisCountryInfo.Add(ObjectCountries);
    end;

    ObjectAll.Add( 'StaticInfo', LisCountryInfo );
    ObjectAll.Add( 'InfoTree', jsObjTree );

    i := 0;
    result :=  GenerateReadableText( ObjectAll, i ) ;

  finally
    ObjectAll.Free;
  end;
end;
//******************************************************************************
function TApiSite.MakeJsonCountryInfo( PathLoadContent:string; Dataset, DatasetSection : TDataset ): WideString;
var jsObjTree:TlkJSONobject;
    i:Integer;
begin
  try
    //ObjectAll := TlkJSONobject.Create;
    jsObjTree := FMakeJsonSectionCounriesObj( PathLoadContent, FMakeStructSectionCounries( DatasetSection ) );
    //ObjectAll.Add('InfoTree', jsObjTree );
    //result := FMakeJsonCountryInfo ( jsObjTree, FMakeStructCounryInfo( Dataset ) );
    //i:=0;
    //result :=  GenerateReadableText( jsObjTree, i ) ;
    result := FMakeJsonCountryInfo ( jsObjTree, FMakeStructCounryInfo( Dataset ) );
  finally
    //ObjectAll.Free;
  end;
end;
//******************************************************************************
procedure TApiSite.FMakeJsonSectionNode( PathLoadContent:string; aNode:TcxTreeListNode; var JsObjParent: TlkJSONobject );
var IndId:Integer;
    IndParent :Integer;
    IndName:Integer;
    IndKeyName:Integer;
    CurrJsObj:TlkJSONobject;
    ContentList:TStringList;
    LisNodes : TlkJSONlist;
    CurrFileNameContent:string;
    CurrIdStr:string;
    ObjNodes : TlkJSONlist;
begin
  if aNode = nil then exit;

  IndId := TcxDBTreeList(aNode.TreeList).GetColumnByFieldName('ID').ItemIndex;
  IndParent := TcxDBTreeList(aNode.TreeList).GetColumnByFieldName('PARENT').ItemIndex;
  IndName := TcxDBTreeList(aNode.TreeList).GetColumnByFieldName('NAME_ITEM').ItemIndex;
  IndKeyName := TcxDBTreeList(aNode.TreeList).GetColumnByFieldName('KEYNAME').ItemIndex;
  try
    ContentList := TStringList.Create;
    ObjNodes := TlkJSONlist.Create;

    while aNode <> nil do
    begin
      CurrIdStr := aNode.Texts[IndId];
      CurrFileNameContent := PathLoadContent + AddNolForLengthNumber( CurrIdStr,4) +'.php';
      if FileExists( CurrFileNameContent ) then ContentList.LoadFromFile( CurrFileNameContent )
      else ContentList.Clear;

      CurrJsObj:= TlkJSONobject.Create;
      CurrJsObj.Add( 'ID', aNode.Texts[IndId] );
      CurrJsObj.Add( 'PARENT', aNode.Texts[IndParent] );
      CurrJsObj.Add( 'NAME', aNode.Texts[IndName] );
      CurrJsObj.Add( 'CONTENT', ContentList.Text );

      {if aNode.Texts[IndKeyName]<>'' then
        JsObjParent.Add( aNode.Texts[IndKeyName], CurrJsObj )
      else }
      //JsObjParent.Add( 'NODES', CurrJsObj );
      //ObjNodes.Add( JsObjParent );

      ObjNodes.Add( CurrJsObj );

      if (aNode.HasChildren)and(aNode.getFirstChild<>nil) then
        FMakeJsonSectionNode( PathLoadContent, aNode.getFirstChild, CurrJsObj ); 



      aNode:=aNode.getNextSibling;

    end;

    JsObjParent.Add('NODES', ObjNodes);

  finally
    ContentList.Free;
  end; 
end;
//******************************************************************************
function TApiSite.FMakeJsonSectionCounriesObj( PathLoadContent:string; aTree:TcxDBTreeList ):TlkJSONobject;
var i:Integer;
    aNode:TcxTreeListNode;
    ObjTree : TlkJSONobject;
    ObjList:TlkJSONlist;
begin
  result := TlkJSONobject.Create;
  aNode := aTree.TopNode;

  if aNode <> nil then
  begin
    FMakeJsonSectionNode( PathLoadContent, aNode, result );
  end
  else result := nil;
end;
//******************************************************************************
function TApiSite.FMakeJsonSectionCounries( Dataset: TDataset ):string;
var i,j:Integer;
    ObjectAll : TlkJSONobject;
    Sect:TSectionCountry;
begin
  ObjectAll := TlkJSONobject.Create;
  Dataset.First;
  while not Dataset.Eof do
  begin
    Sect.id := Dataset.FieldByName('ID').AsInteger;
    Sect.parent := Dataset.FieldByName('PARENT').AsInteger;
    Sect.aOrder := Dataset.FieldByName('AORDER').AsInteger;
    Sect.Name   := Dataset.FieldByName('NAME_ITEM').asString;


    Dataset.Next;
  end;
end;
//******************************************************************************
function TApiSite.FAddCountryToArr( Country:TStructCountryInf; Name:string; id_countries_type_info:Integer; var CountryArr:TStructCountryArr ):integer;
var i:Integer;
    find:Boolean;
    len:Integer;
begin
  find:=False;
  //***************
  for i:=0 to Length( CountryArr )-1 do
  begin
    if  CountryArr[i].id_countries_type_info  = id_countries_type_info  then
    begin
      find := True;
      result := i;
      Break;
    end;
  end;
  //***************
  if not find then
  begin
    result:= length( CountryArr );
    SetLength( CountryArr, result+1 );
  end;
  //***************
  CountryArr[result].id_countries_type_info := id_countries_type_info ;
  CountryArr[result].Name := Name;
  
  len:= Length( CountryArr[result].Groups );
  SetLength(CountryArr[result].Groups, len+1);
  CountryArr[result].Groups[len]:= Country;
end;
//******************************************************************************
function TApiSite.FMakeStructCounryInfo( Dataset: TDataset ):TStructCountryArr;
var Country: TStructCountryInf;
    len : Integer;
    currIdTypeInfo : Integer;
    CurrName:string;
begin
  if not Dataset.Active then Dataset.Open;
  Dataset.First;

  while not Dataset.Eof do
  begin
    currIdTypeInfo := Dataset.FieldByName('id_countries_type_info').AsInteger;
    CurrName := Dataset.FieldByName('NAME').asString;

    Country.Id := Dataset.FieldByName('id').AsInteger;
    if Dataset.FieldByName('aValue').asString <> '' then
      Country.Value := Dataset.FieldByName('aValue').asString+Dataset.FieldByName('unitmeasur').asString
    else Country.Value :=Dataset.FieldByName('ADDValue').asString;

    FAddCountryToArr( Country, CurrName, currIdTypeInfo, result );
    Dataset.next;
  end;
  
end;
//******************************************************************************
function TApiSite.FMakeStructSectionCounries( Dataset: TDataset ):TcxDBTreeList;
var i:Integer;
    DS   : TDatasource;
    aCol : TcxDBTreeListColumn;
    aC: TcxTreeListColumn;
begin

  DS := TDatasource.Create(nil);
  DS.DataSet := Dataset;

  result := TcxDBTreeList.Create(nil);
  result.DataController.DataSource := DS;
  result.DataController.KeyField   :=  'ID';
  result.DataController.ParentField := 'PARENT';
  result.DataController.CreateAllItems;

  result.GetColumnByFieldName('AORDER').SortOrder := soAscending;
end;
//******************************************************************************
function TApiSite.FConvertToXSDateTimeStr( aDateTime:TDateTime ): String;
var aDate:TXSDateTime;
begin
  aDate := TXSDateTime.Create;

  try
    aDate.AsDateTime := aDateTime;
    result := aDate.NativeToXS;
  finally
    aDate.Free;
  end;

  if aDateTime<0 then result :='';
end;
//******************************************************************************
function TApiSite.MakeJsonLanguages(Dataset : TDataset ): WideString;
var i : Integer;
    ObjectAll : TlkJSONobject;
    ListLng   : TlkJSONlist;
    LngObj    : TlkJSONobject;
begin
  try
    ObjectAll := TlkJSONobject.Create;
    ListLng := TlkJSONlist.Create;

    Dataset.First;
    while not Dataset.Eof do
    begin
      LngObj := TlkJSONobject.Create;

      LngObj.Add( 'id',  Dataset.FieldByName('id').asInteger );
      LngObj.Add( 'Translate', Dataset.FieldByName('active_translate').asInteger );
      LngObj.Add( 'icon', Dataset.FieldByName('icon').asString );
      LngObj.Add( 'UkrName', Dataset.FieldByName('UkrName').asString );
      LngObj.Add( 'name', Dataset.FieldByName('name').asString );

      ListLng.Add( LngObj );

      Dataset.Next;
    end;

    ObjectAll.Add( 'LNG', ListLng );

    i := 0;
    result :=  GenerateReadableText( ObjectAll, i ) ;

  finally
    ObjectAll.Free;
  end;
end;
//******************************************************************************
{function TApiSite.FAddRateToArr( Rate:TStructRate; var TourArr:TStructToursAndRates;IndexTour,IndexGroup:Integer  ):integer;
var i:Integer;
    find:Boolean;
    len:Integer;
begin
  find:=False;
  //***************
  for i:=0 to Length( TourArr[IndexTour].Groups[IndexGroup].RateLines ) - 1 do
  begin
    if TourArr[IndexTour].Groups[IndexGroup].RateLines[i].idRate = Rate.idRate then
    begin
      find := True;
      result := i;
      Break;
    end;
  end;
  //***************
  if not find then
  begin
    len :=Length( TourArr[IndexTour].Groups[IndexGroup].RateLines );
    SetLength(TourArr[IndexTour].Groups[IndexGroup].RateLines,len+1);
    TourArr[IndexTour].Groups[IndexGroup].RateLines[len]:= Rate;
    result := Len;
  end;
end;
//****************************************************************************** }
function TApiSite.FAddRateTourGroupDate_old(TourGroupId:Integer;OnDate:TDateTime;var Struct:TRateTourGroupArr):integer;
var i:Integer;
    find:boolean;
    len:Integer;
begin
  find:=false;
  for i:=0 to Length( Struct ) - 1 do
  begin
    if (Struct[i].TourDate = OnDate)and(Struct[i].TourGroupId =TourGroupId ) then
    begin
      find := True;
      result := i;
      Break;
    end;
  end;
  //***************
  if not find then
  begin
    len :=Length( Struct );
    SetLength( Struct ,len+1);
    Struct[len].TourGroupId:= TourGroupId;
    Struct[len].TourDate:= OnDate;
    result := Len;
  end;
end;
//******************************************************************************
function TApiSite.FMakeStructRateTourGroupOnDate_Old( Dataset : TDataset ): TRateTourGroupArr;
var GroupInd:Integer;
    Len:Integer;
begin
  Dataset.First;
  while not Dataset.Eof do
  begin
    GroupInd := FAddRateTourGroupDate_old( Dataset.FieldByName('TOURGROUPID').AsInteger, Dataset.FieldByName('TOURDATE').AsDateTime, Result );
    Result[GroupInd].Rate :=Dataset.FieldByName('Rate').AsFloat;
    Result[GroupInd].AgentPay := Dataset.FieldByName('AgentPay').AsFloat;
    Result[GroupInd].RateMaxDate := Dataset.FieldByName('RATEMAXDATE').AsDateTime;

    Len:= Length( Result[GroupInd].ExParam );
    SetLength( Result[GroupInd].ExParam,len+1);
    Result[GroupInd].ExParam[Len].PromoPrice := Dataset.FieldByName('PROMOPRICE').asInteger;
    Result[GroupInd].ExParam[Len].PromoName :=  Dataset.FieldByName('PROMONAME').AsString;
    Result[GroupInd].ExParam[Len].PromoFromDate := MyIfThen( Dataset.FieldByName('PROMOFROMDATE').IsNull,-1, Dataset.FieldByName('PROMOFROMDATE').AsDateTime);
    Result[GroupInd].ExParam[Len].PromoTillDate := MyIfThen( Dataset.FieldByName('PROMOTILLDATE').IsNull,-1, Dataset.FieldByName('PROMOTILLDATE').AsDateTime);
    Result[GroupInd].ExParam[Len].MainRate := Dataset.FieldByName('MAINRATE').asFloat;
    Result[GroupInd].ExParam[Len].MainAgentPay := Dataset.FieldByName('MainAgentPay').asFloat;
    Result[GroupInd].ExParam[Len].EXT_TourId  := Dataset.FieldByName('EXTERNAL_TOURID').asInteger;
    Result[GroupInd].ExParam[Len].EXT_TourName  := Dataset.FieldByName('EXTERNAL_TOURNAME').asString;
    Result[GroupInd].ExParam[Len].CurrencyName := Dataset.FieldByName('CURRENCYNAME').asString;
    Dataset.Next;
  end;
end;
//******************************************************************************
function TApiSite.FMakeJsonRateTourGroupOnDate_Old( RateTourGroupArr:TRateTourGroupArr ): WideString;
var i,j : Integer;
    ObjectAll : TlkJSONobject;
    ListTourGroup : TlkJSONlist;
    RateObj : TlkJSONobject;
    ListTourExParam : TlkJSONlist;
    ObjectTourGroup: TlkJSONobject;
begin
  try
    ObjectAll := TlkJSONobject.Create;
    ListTourGroup := TlkJSONlist.Create;

    for i:=0 to Length(RateTourGroupArr)-1 do
    begin

      ObjectTourGroup:= TlkJSONobject.Create;
      ObjectTourGroup.Add( 'TourGroupId',RateTourGroupArr[i].TourGroupId );
      ObjectTourGroup.Add( 'TourDate', FConvertToXSDateTimeStr( RateTourGroupArr[i].TourDate ) );
      ObjectTourGroup.Add( 'Rate',  RateTourGroupArr[i].Rate );
      ObjectTourGroup.Add( 'AgentPay',  RateTourGroupArr[i].AgentPay  );
      ObjectTourGroup.Add( 'RateMaxDate',  FConvertToXSDateTimeStr( RateTourGroupArr[i].RateMaxDate ) );

      ListTourExParam := TlkJSONlist.Create;
      for j:=0 to Length(RateTourGroupArr[i].ExParam)-1 do
      begin
        RateObj := TlkJSONobject.Create;
        RateObj.Add('PromoPrice',  RateTourGroupArr[i].ExParam[j].PromoPrice );
        RateObj.Add('PromoName',  RateTourGroupArr[i].ExParam[j].PromoName );

        RateObj.Add('PromoFromDate', FConvertToXSDateTimeStr( RateTourGroupArr[i].ExParam[j].PromoFromDate ) );
        RateObj.Add('PromoTillDate',  FConvertToXSDateTimeStr( RateTourGroupArr[i].ExParam[j].PromoTillDate ) );

        RateObj.Add('MainRate',  RateTourGroupArr[i].ExParam[j].MainRate );
        RateObj.Add('MainAgentPay',  RateTourGroupArr[i].ExParam[j].MainAgentPay );
        RateObj.Add('EXT_TourId',  RateTourGroupArr[i].ExParam[j].EXT_TourId );
        RateObj.Add('EXT_TourName',  RateTourGroupArr[i].ExParam[j].EXT_TourName );
        RateObj.Add('CurrencyName',  RateTourGroupArr[i].ExParam[j].CurrencyName );

        ListTourExParam.Add( RateObj );
      end;

      ObjectTourGroup.add( 'ExParam', ListTourExParam );
      ListTourGroup.Add( ObjectTourGroup );
    end;

    ObjectAll.Add( 'TOURGROUPS', ListTourGroup );
    i := 0;
    result :=  GenerateReadableText( ObjectAll, i ) ;
  finally
    ObjectAll.Free;
  end;
end;
//******************************************************************************
function TApiSite.MakeJsonRateTourGroupOnDate_Old( Dataset: TDataset ): WideString;
begin
  Result := FMakeJsonRateTourGroupOnDate_Old( FMakeStructRateTourGroupOnDate_Old( Dataset ) );
end;
//******************************************************************************
function TApiSite.FAddServiceToAll_old(ServiceId,ServiceKindId:Integer;ServiceName:string; Descript:WideString; var Struct:TAllServRateTourGroupArr ):integer;
var i:Integer;
    find:boolean;
    len:Integer;
begin
  find:=false;
  for i:=0 to Length( Struct ) - 1 do
  begin
    if ( Struct[i].ServiceId = ServiceId )and (Struct[i].ServicekindId = ServiceKindId) then
    begin
      find := True;
      result := i;
      Break;
    end;
  end;
  //***************
  if not find then
  begin
    len :=Length( Struct );
    SetLength( Struct,len+1);
    Struct[len].ServiceId:= ServiceId;
    Struct[len].ServicekindId:= ServiceKindId;
    Struct[len].ServiceName:= ServiceName;
    Struct[len].Descript :=Descript;
    result := Len;
  end;
end;
//******************************************************************************
function TApiSite.FAddServiceToATYPEAll_old( AgeTypeID:Integer; AGETYPENAME:string; AGEFROM, AGETILL:Integer; var Struct:TAllServAtypeRateTourGroupArr ):integer;
var i:Integer;
    find:boolean;
    len:Integer;
begin
  find:=false;
  for i:=0 to Length( Struct ) - 1 do
  begin
    if (Struct[i].AgeTypeID = AgeTypeID ) then
    begin
      find := True;
      result := i;
      Break;
    end;
  end;
  //***************
  if not find then
  begin
    len :=Length( Struct );
    SetLength( Struct ,len+1);
    Struct[len].AgeTypeID:= AgeTypeID;
    Struct[len].AgeFrom:= AgeFrom;
    Struct[len].AgeTo:= AGETILL;
    Struct[len].AgeTypeName := AGETYPENAME;
    result := Len;
  end;
end;
//******************************************************************************

function TApiSite.FMakeStructureAllServicesRateTourGroupOnDate_Old( Dataset : TDataset ): TAllServAtypeRateTourGroupArr;
var GroupIndAgeTypeId:Integer;
    GroupInd:Integer;
    Len:Integer;
    CurrStruct:TAllServRateTourGroupArr;

Function AddSerToAll(var CurrStruct:TAllServRateTourGroupArr):Integer;
var Len:Integer;
begin
  result := FAddServiceToAll_old( Dataset.FieldByName('SERVICEID').AsInteger,
                                    Dataset.FieldByName('SERVICE_KIND').asInteger,
                                    Dataset.FieldByName('SERVICENAME').asString,
                                    Dataset.FieldByName('DESCRIPTION').asString , CurrStruct );

  Len:= Length( CurrStruct[result].Rate );
  SetLength( CurrStruct[result].Rate,len+1);
  CurrStruct[result].Rate[Len].Rate := Dataset.FieldByName('Rate').AsFloat;
  CurrStruct[result].Rate[Len].AgentPay := Dataset.FieldByName('AgentPay').AsFloat;
  CurrStruct[result].Rate[Len].RateMaxDate := Dataset.FieldByName('RATEMAXDATE').AsDateTime;
  CurrStruct[result].Rate[Len].CurrencyName :=Dataset.FieldByName('CURRENCYNAME').asString;
end;
//******************************
begin
  Dataset.First;
  while not Dataset.Eof do
  begin
    GroupIndAgeTypeId := FAddServiceToATYPEAll_old( Dataset.FieldByName('AgeTypeID').AsInteger,
                                                    Dataset.FieldByName('AGETYPENAME').asString,
                                                    Dataset.FieldByName('AGEFROM').asInteger,
                                                    Dataset.FieldByName('AGETILL').AsInteger,  Result );

    if Dataset.FieldByName('ATYPE').AsInteger =0 then  GroupInd := AddSerToAll( Result[GroupIndAgeTypeId].Base );
    if Dataset.FieldByName('ATYPE').AsInteger =1 then  GroupInd := AddSerToAll( Result[GroupIndAgeTypeId].Required );
    if Dataset.FieldByName('ATYPE').AsInteger =2 then  GroupInd := AddSerToAll( Result[GroupIndAgeTypeId].Hidden );

    Dataset.Next;
  end;
end;
//******************************************************************************
function TApiSite.FMakeJsonAllServicesRateTourGroupOnDate_Old( RateAllServArr:TAllServAtypeRateTourGroupArr ): WideString;
var i : Integer;
    ObjectAll : TlkJSONobject;
    ListAllServices : TlkJSONlist;

    ObjectAgeType:TlkJSONobject;
    ListAge : TStringList;

function AddRateToJsonObj( CurrArrRate:TAllServRateTourGroupArr ):TlkJSONlist;
var i,j:Integer;
    ServObj:TlkJSONobject;
    RateObj:TlkJSONobject;
    ListRateObj:TlkJSONlist;
begin
  result := TlkJSONlist.Create;
  for i:=0  to Length( CurrArrRate )-1 do
  begin
    ServObj := TlkJSONobject.Create;
    ServObj.Add( 'ServiceId', CurrArrRate[i].ServiceId );
    ServObj.Add( 'ServiceName', CurrArrRate[i].ServiceName );
    ServObj.Add( 'ServicekindId', CurrArrRate[i].ServicekindId );
    ServObj.Add( 'Descript', CurrArrRate[i].Descript );

    ListRateObj:=TlkJSONlist.Create;

    for j:=0 to Length( CurrArrRate[i].Rate )-1 do
    begin
       RateObj:=  TlkJSONobject.Create;
       RateObj.Add('Rate',CurrArrRate[i].Rate[j].Rate );
       RateObj.Add('AgentPay',CurrArrRate[i].Rate[j].AgentPay );


       RateObj.Add('RateMaxDate', FConvertToXSDateTimeStr( CurrArrRate[i].Rate[j].RateMaxDate ) );
       RateObj.Add('CurrencyName',CurrArrRate[i].Rate[j].CurrencyName );

       ListRateObj.Add(RateObj);
    end;
    ServObj.Add( 'Rates', ListRateObj );

    result.Add(ServObj);
  end;
end;

begin
  try
    ListAge := TStringList.Create;
    ObjectAll := TlkJSONobject.Create;
    ListAllServices := TlkJSONlist.Create;

    //ListAllObjAge := TlkJSONlist.Create;

    for i:=0 to Length(RateAllServArr)-1 do
    begin
      ObjectAgeType := TlkJSONobject.Create;
      ObjectAgeType.Add( 'AgeTypeID', RateAllServArr[i].AgeTypeID );
      ObjectAgeType.Add( 'AgeFrom', RateAllServArr[i].AgeFrom );
      ObjectAgeType.Add( 'AgeTo', RateAllServArr[i].AgeTo );
      ObjectAgeType.Add( 'AgeTypeName', RateAllServArr[i].AgeTypeName );

      ObjectAgeType.add( 'Base', AddRateToJsonObj( RateAllServArr[i].Base ) );
      ObjectAgeType.add( 'Required', AddRateToJsonObj( RateAllServArr[i].Required ) );
      ObjectAgeType.add( 'Hidden', AddRateToJsonObj( RateAllServArr[i].Hidden ) );

      ListAllServices.Add( ObjectAgeType );
    end;

    ObjectAll.Add( 'AllServices', ListAllServices );
    i := 0;
    result :=  GenerateReadableText( ObjectAll, i ) ;
    
  finally
    ObjectAll.Free;
    ListAge.Free;
  end;
end;
//******************************************************************************
function TApiSite.MakeJsonAllServicesRateTourGroupOnDate_Old ( Dataset: TDataset ): WideString;
begin
  result := FMakeJsonAllServicesRateTourGroupOnDate_Old( FMakeStructureAllServicesRateTourGroupOnDate_Old( Dataset ));
end;
//******************************************************************************
function TApiSite.FMakeStructureDataCli( DBClient, DBAddres: TDataset ) : PDatCli;
begin
  result := GetDataDBClientByDataset( DBClient );
  GetAddressClientByDataset( DBAddres, result );

end;
//******************************************************************************
function TApiSite.FMakeJsonClientData( DataCli : PDatCli ):Widestring;
var ObjectAll : TlkJSONobject;
    ClientData : TlkJSONobject;
    AddresData : TlkJSONobject;
    i:integer;
begin
  try
    ObjectAll := TlkJSONobject.Create;
    ClientData := TlkJSONobject.Create;

    ClientData.Add( 'ID', DataCli.ContragentID );
    ClientData.Add( 'Name', DataCli.Name );
    ClientData.Add( 'FullName', DataCli.FullName );
    ClientData.Add( 'HeadContragentID', DataCli.HeadContragentID );
    ClientData.Add( 'Legal', DataCli.Legal );
    ClientData.Add( 'INN', DataCli.INN );
    ClientData.Add( 'EDRPOU', DataCli.EDRPOU );
    ClientData.Add( 'ISPRIVATE', DataCli.ISPRIVATE );
    ClientData.Add( 'ISFILIYA', DataCli.ISFILIYA );
    ClientData.Add( 'BranchNo', DataCli.BranchNo );
    ClientData.Add( 'Resident', DataCli.Resident );
    ClientData.Add( 'UsedInAccounting', DataCli.UsedInAccounting );
    ClientData.Add( 'Code', DataCli.Code );

    AddresData := TlkJSONobject.Create;
    AddresData.Add('Representation', DataCli.Address.Representation );
    AddresData.Add('ZIP', DataCli.Address.ZIP );
    AddresData.Add('State', DataCli.Address.State );
    AddresData.Add('Region', DataCli.Address.Region );
    AddresData.Add('District', DataCli.Address.District );
    AddresData.Add('City', DataCli.Address.City );
    AddresData.Add('Settlement', DataCli.Address.Settlement );
    AddresData.Add('Street', DataCli.Address.Street );
    AddresData.Add('House', DataCli.Address.House );
    AddresData.Add('Building', DataCli.Address.Building );
    AddresData.Add('Appartment', DataCli.Address.Appartment );

    ClientData.Add( 'Addres', AddresData );
    ObjectAll.Add( 'COMPANY', ClientData );
    i := 0;
    result :=  GenerateReadableText( ObjectAll, i )  ;

  finally
    ObjectAll.Free;
  end;
end;
//******************************************************************************
function TApiSite.MakeJsonClientData( DBClient, DBAddres: TDataset ):Widestring;
var PData : PDatCli;
begin
  try
    PData:=FMakeStructureDataCli( DBClient, DBAddres );
    result := FMakeJsonClientData( PData );

  finally
    Dispose( PData );
  end;
end;
//******************************************************************************
function TApiSite.FMakeJsonCheckClient( aIdCompany: Integer ):Widestring;
var i:Integer;
    ObjectAll : TlkJSONobject;
    ClientData : TlkJSONobject;
    aIdCompanyStr:string;
begin
  try
    ObjectAll := TlkJSONobject.Create;
    ClientData := TlkJSONobject.Create;

    if aIdCompany = null then aIdCompanyStr :=''
    else aIdCompanyStr := IntToStr(aIdCompany);

    ClientData.Add('ID', aIdCompany );
    ObjectAll.Add( 'COMPANY', ClientData );

    i := 0;
    result :=  GenerateReadableText( ObjectAll , i );
  finally
     ObjectAll.Free;
  end;
end;
//******************************************************************************
function TApiSite.MakeJsonCheckClient( DBClient: TDataset ):Widestring;
begin
  result := FMakeJsonCheckClient( DBClient.fieldByName('COMPANYID').asInteger );
end;
//******************************************************************************
end.



{function TApiSite.FAddToArr( arrValue:variant; aArr:array of variant ):ArrVar;
var i:Integer;
    find:Boolean;
    len:Integer;
begin
  find:=False;
  for i:=0 to Length( aArr )-1 do
  begin
    if aArr[i] = arrValue then
    begin
      find := True;
      Break;
    end;
  end;
  //***************
  if not find then
  begin
    len :=Length( aArr );
    SetLength( result, len+1 );
    result[len] := arrValue;
  end;
end;}
