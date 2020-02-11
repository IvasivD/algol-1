unit UnitGoogleMaps;

interface
uses IdHTTP,IdMultipartFormData, SysUtils, Dialogs,Variants,Classes,ShellAPI,Forms,Windows,
     IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL, IdMessageClient,UnitProc,uLkJSON,SHDocVw,Math ;

const ApiGoogle = 'https://maps.googleapis.com/maps/api/directions/'; 
      ApiGoogleObject ='https://maps.googleapis.com/maps/api/geocode/';
      ApiGoogleObjectByLocation='https://maps.googleapis.com/maps/api/place/nearbysearch/';
      ApiGoogleObjectBySearchText='https://maps.googleapis.com/maps/api/place/textsearch/';
      ApiTranslate='https://translate.googleapis.com/translate_a/single'; //client=gtx'&sl=ru&tl=ua&dt=t&q=%D0%92%D0%B5%D0%BD%D0%B0
type
  TOptParseHtmlText = (OptParseHtmlInnerText,OptParseHtmlOuterText, OptParseHtmlInnerHTML,OptParseHtmlOuterHTML);

  TResDistance = record
    value:real;
  end;

  TResDuratin = record
    value:Integer;
  end;

  TGPSLocation = record
   lat:Double;
   lng:Double;
  end;

  TArryaPlaceID = record
    PlaceId : string;
    LocationStartGPS: TGPSLocation;
    LocationEndGPS: TGPSLocation;
  end;

  TResPoint = record
    LocationName:Widestring;
    LocationAdddres:Widestring;
  end;

  TResultGoogle = record
     FromPoint:TResPoint;
     ToPoint  :TResPoint;
     
     Distance:TResDistance;
     Duration:TResDuratin;

     Place :Array of TArryaPlaceID;
     Status:Integer;
  end;

  TResultTranslateCountry = record
    TranslateCountry:Widestring;
    ShortName:Widestring;
    Translatelocality:Widestring;
    TranslateArea:Widestring;
    GeometryPoint:TGPSLocation;
    PlaceID:Widestring;
  end;

  TPointWay = record
    Country:WideString;
    City:WideString;
  end;
  TWaypointsArr = array of TPointWay;

  TGoogleObject = record
    place_id:WideString;
    shortName:WideString;
    streetNumber:WideString;
    route:WideString;
    locality:WideString;
    adminiArea:WideString;
    country:WideString;
    PostalCode:WideString;
    location:TGPSLocation;
    partialMatch:Boolean;
    Status:Integer;
  end;
  TGoogleObjectArr = array of TGoogleObject;

  TGooglePlaceId = record
   place_id:WideString;
  end;
  TGooglePlaceIdArr = array of TGooglePlaceId;
  
  TGoogleMaps  = class
  private
    FTimeOut:Integer;
    FTempDir:string;
    FKeyGoogle:TStringList;
    function FSendPostRequest( URL:Widestring; TimeOut:Integer;NeedKey:Boolean= true ):Widestring;
    function FCheckHTTPResultOnError(ResJson:Widestring):Boolean;
    function FGetApiGoogleDistaneStr ( FromPoint,ToPoint:TPointWay;waypoints:TWaypointsArr;Model:String; FormatResult:String='json') : Widestring;
    function FParserJsonResul(aJsonStr:WideString):TResultGoogle;
    function FGetGoogleKey :Widestring;
    function FJsonResulCheckOK( js:TlkJSONobject ):Boolean;
    function FJsonResulGoogleObjCheckOK( js:TlkJSONobject ):Boolean;
    function FGetWayPointsParam(waypoints:array of TPointWay):string;
    function FGetWayPointsJs(waypoints:array of TPointWay):Widestring;
    function FGetHTMLGoogleJsPositionWayStr( FromPoint,ToPoint:TPointWay;waypoints:TWaypointsArr;TravelMode:String; Zoom:Integer=5 ):TStringList;
    function FParserJsonResultGoogleObject(aJsonStr:WideString):TGoogleObjectArr;
    function FParserJsonResultGooglePlaceId(aJsonStr:WideString):TGooglePlaceIdArr;
    function FParserJsonResultGoogleTranslateCountry(aJsonStr:WideString):TResultTranslateCountry;

    function FGetApiGoogleTranslate(SameText,LnFrom,LnTo:Widestring):Widestring;
    function FGetApiGoogleObject(ObjectName, Country, City: Widestring;Lng:Widestring='en'; FormatResult:String='json'):Widestring;
    function FGetApiGoogleObjectLocation(LocLat, Loclng:Widestring; KeyWords:Widestring=''; TypeObject:Widestring='';lng:Widestring='en'; FormatResult:String='json'):Widestring;
    function FGetApiGoogleObjectByTextSearch(KeyWords:Widestring=''; LocLat:Widestring='';LocLng: Widestring='';Radius:Integer=100; TypeObject:Widestring='';FormatResult:String='json'):Widestring;
  public
    constructor Create(TimeOut:Integer=5000);
    destructor Close;
    function CheckDistanceBetweenCity( FromPoint,ToPoint:TPointWay;waypoints:TWaypointsArr; Model:String ):TResultGoogle;
    function ShowPointsDirections( FromPoint,ToPoint:TPointWay;waypoints:TWaypointsArr;TravelMode:String;Zoom:Integer=5 ):Integer;

    function GetTranslate(SameText,LnFrom,LnTo:Widestring):Widestring;
    function GetObject(ObjectName,Country,City:Widestring;Lng:Widestring='en'):TGoogleObjectArr;
    function GetObjectLocation(LocLat, LocLng: Widestring; KeyWord:Widestring=''; TypeObject:Widestring='';Lng:Widestring='en'):TGoogleObjectArr;
    function GetObjectByTextSearch(KeyWords:Widestring=''; LocLat:Widestring='';LocLng: Widestring='';Radius:Integer=100; TypeObject:Widestring='';FormatResult:Widestring='json'):TGooglePlaceIdArr;
    function GetUrlTranslate(LngFrom,LngTo:String; TextForTranslate:Widestring; TextNeedConvertToUrl:Boolean = true ):Widestring;
    function ParseResultTranslate( WB:TWebBrowser;OptParseHtmlText: TOptParseHtmlText=OptParseHtmlInnerText ):Widestring;
    function FindResultTranslate(WB:TWebBrowser):Boolean;
    function TranslateCountry(Name:Widestring;Lng:Widestring='en'): TResultTranslateCountry;
  end;
implementation

{ TGoogleMaps }

constructor TGoogleMaps.Create(TimeOut:Integer=5000);
begin
 FTimeOut:=TimeOut;
 FTempDir := ExtractFilePath(Application.ExeName)+'_MAP\';
 FKeyGoogle:=TStringList.create;
 FKeyGoogle.Add('AIzaSyD9Yl2q1DmipeuiX_2BsBj3h2o2ECg4tQc');
 FKeyGoogle.Add('AIzaSyCD1sQlG2RsC3w-RrrH5cpOrVjp4pogiL8');
 FKeyGoogle.Add('AIzaSyAtRLayCL77DmnAF8PzcHjaBFMoZYj-NXc');
 FKeyGoogle.Add('AIzaSyC8Pca_Um4bPR17qSvQSLNyIybpcJvwiM4');
 FKeyGoogle.Add('AIzaSyDXbRa2Xc-r7967P5rvUDDCz3GEDmuwQuY');
 FKeyGoogle.Add('AIzaSyBTOYxZDado76VwsDWxlOjgci-u3_JjmZ0');
 FKeyGoogle.Add('AIzaSyDNZoUBCAopO4SbNsJoK0C5jwhIewvCQrk');
 FKeyGoogle.Add('AIzaSyCBRKdLsUe87iAT8VHtVz16Bkp4rn1QdZQ');
 FKeyGoogle.Add('AIzaSyBGeM1c95nWg8WDIIiEsQ621qHGlImgr-s');
 //**************Dima******************
 FKeyGoogle.Add('AIzaSyDMyD4vtPhijcYBJHNiULhxysLuOUrUTzM');  //Dima
 FKeyGoogle.Add('AIzaSyBVAqTBTRrZ6cIb0zwQLiVq5NTJBAt7Td8');
 FKeyGoogle.Add('AIzaSyC0g_hdTN5IWvzjv4d96IaB0fDDaqCU7S8');
 FKeyGoogle.Add('AIzaSyDrDvxtgk85XWGqD9cQdZadS93NvNcZ48Q');
end;
//******************************************************************************
destructor TGoogleMaps.Close;
begin
  DelDir(FTempDir,'*.*');
  FKeyGoogle.Free;
end;
//******************************************************************************
function TGoogleMaps.FGetGoogleKey :Widestring;
var i:Integer;
begin
 randomize;
 i:= RandomRange(0 , FKeyGoogle.Count-1);
 if i<FKeyGoogle.Count then
   result:=FKeyGoogle.Strings[i]
 else result:=FKeyGoogle.Strings[FKeyGoogle.count-1];
end;
//GoogleKeyJS
//******************************************************************************
function TGoogleMaps.FGetWayPointsParam(waypoints:array of TPointWay):string;
var i:Integer;
    Spliter:string[1];
begin
  Spliter:='|';
  Result:='';
  for i:=0 to Length(waypoints)-1 do
  begin
    if i = Length(waypoints)-1 then Spliter:='';
    Result:=Result+ UrlEncode(Utf8Encode(waypoints[i].City+','+waypoints[i].Country))+Spliter;
  end;
end;
//******************************************************************************
function TGoogleMaps.FGetWayPointsJs(waypoints:array of TPointWay):Widestring;
var i:Integer;
    Spliter:string[1];
begin
  //{location: 'Броди, Україна'}, {location: 'Broken Hill, NSW'}
  Spliter:=',';
  Result:='';
  for i:=0 to Length(waypoints)-1 do
  begin
    if i = Length(waypoints)-1 then Spliter:='';
    Result:=Result+'{location: '+#39+waypoints[i].City+','+waypoints[i].Country+#39+'}'+Spliter;// {location: 'Broken Hill, NSW'}';//  UrlEncode(Utf8Encode(waypoints[i].City+','+waypoints[i].Country))+Spliter;
  end;
end;
//******************************************************************************
function TGoogleMaps.FGetApiGoogleDistaneStr( FromPoint,ToPoint:TPointWay;waypoints:TWaypointsArr;Model:String; FormatResult:String='json' ):Widestring;
var WayPointsParam:string;
begin
 WayPointsParam:=FGetWayPointsParam(waypoints);
 if WayPointsParam<>'' then
    WayPointsParam :='&waypoints=' + WayPointsParam;

 result:=ApiGoogle+FormatResult+'?origin='+UrlEncode(Utf8Encode(FromPoint.City+','+FromPoint.Country))+'&destination='+UrlEncode(Utf8Encode(ToPoint.City+','+ToPoint.Country))+WayPointsParam+'&mode='+Model;//+'&key='+FGetGoogleKey;
end;
//******************************************************************************
function TGoogleMaps.FGetApiGoogleObject(ObjectName, Country, City: Widestring; Lng:Widestring='en'; FormatResult:String='json'):Widestring;
var SearchAddr:Widestring;
begin
 SearchAddr:= ObjectName;
 ReplaseON(SearchAddr , ' ','+');
 ReplaseON(Country , ' ','+');
 ReplaseON(City , ' ','+');

 if Country<>'' then SearchAddr:= SearchAddr + MyIfThen(SearchAddr<>'','+','') + Country;
 if City<>'' then SearchAddr:=SearchAddr+'+'+City;

 result:= ApiGoogleObject+FormatResult+'?address='+SearchAddr+'&language='+Lng;// + Lng;
end;
//******************************************************************************
function TGoogleMaps.FGetApiGoogleTranslate(SameText,LnFrom,LnTo:Widestring):Widestring;
begin
  SameText := UrlEncode(SameText);
  ///ReplaseOn(SameText,' ','%20');
  result := ApiTranslate+'?client=gtx&sl='+LnFrom+'&tl='+LnTo+'&dt=t&q='+( (SameText) );
end;
//******************************************************************************
function TGoogleMaps.FGetApiGoogleObjectLocation( LocLat, Loclng:Widestring; KeyWords:Widestring=''; TypeObject:Widestring='';lng:Widestring='en'; FormatResult:String='json'):Widestring;
var SearchAddr:Widestring;
    latStr:Widestring;
    lngStr:Widestring;
begin
 latStr := LocLat;//FloatToStr(LocLat);
 lngStr := Loclng;//FloatToStr(Loclng);

 ReplaseOn(KeyWords,' ','+');
 ReplaseOn(TypeObject,' ','+');

 if TypeObject<>'' then TypeObject:='&type='+TypeObject;
 if KeyWords<>'' then SearchAddr := '&address='+KeyWords
 else SearchAddr:='';

 result:= ApiGoogleObject+FormatResult+'?latlng='+latStr+','+lngStr+SearchAddr+TypeObject;//+'&key='+FGetGoogleKey;//+'&language='+UrlEncode('UA');// + Lng;
end;
//******************************************************************************
function TGoogleMaps.FGetApiGoogleObjectByTextSearch(KeyWords:Widestring=''; LocLat:Widestring='';LocLng: Widestring='';Radius:Integer=100; TypeObject:Widestring='';FormatResult:String='json'):Widestring;
var location:Widestring;
begin
 ReplaseOn(KeyWords,' ','+');
 if (LocLat<>'')and(LocLat<>'0')and(LocLng<>'')and(LocLng<>'0') then location:='&location='+ LocLat+','+LocLng+'&sensor=true&radius='+IntToStr(Radius);
 result:= ApiGoogleObjectBySearchText+FormatResult+'?query='+KeyWords+location;//'&key='+FGetGoogleKey;
end;
//******************************************************************************
function TGoogleMaps.FCheckHTTPResultOnError(ResJson:Widestring):Boolean;
var jsBase:TlkJSONbase;
    js:TlkJSONobject;
begin
  Result :=false;
  if AnsiPos('error_message', ResJson) <>0 then Exit;

  jsBase := TlkJSON.ParseText(ResJson);
  if jsBase is TlkJSONobject then
  begin
    js := jsBase as TlkJSONobject;
    if js.Field['error_message'] = nil  then result:=false
    else
     result:=true;
  end
   else result:=false;
end;
//******************************************************************************
function TGoogleMaps.FSendPostRequest( URL:Widestring; TimeOut:Integer;NeedKey:Boolean= true ):Widestring;
var LHandler : TIdSSLIOHandlerSocket;  // Delphi 2010   TIdSSLIOHandlerSocketOpenSSL;
    Myhttp : TIdHTTP;
    ResultRequest:Widestring;
    CountRepeatWhenError:Integer;
    i:integer;
    keyStr:String;
//*************************************************
function SendRequestOK(Key:Widestring):Boolean;
var Stream:TIdMultiPartFormDataStream;
begin
  try
   Stream := TIdMultipartFormDataStream.Create;

   Stream.AddFormField('key', Key );
   try
     if Key<>'' then keyStr := '&key='+Key
     else keyStr :='';

     ResultRequest := Myhttp.Post( URL+keyStr , Stream );
   except
     ResultRequest := '';
   end;
   result:=not FCheckHTTPResultOnError( ResultRequest );
  finally
   FreeAndNil(Stream);
  end;
end;
//*************************************************
begin
 try
   Myhttp:=TIdHTTP.Create(nil);
   LHandler :=  TIdSSLIOHandlerSocket.Create(nil);           //  Delphi 2010   TIdSSLIOHandlerSocketOpenSSL;
   Myhttp.IOHandler:=LHandler;
   Myhttp.Request.ContentType := 'application/json; charset=UTF-8';
   LHandler.SSLOptions.Method:= sslvTLSv1;   //sslvSSLv23;

   Myhttp.ReadTimeout:=TimeOut;
   Myhttp.HandleRedirects:=true;

   // Myhttp.Request.BasicAuthentication:=true;

   result:='';
   if NeedKey then
   begin
     if not SendRequestOK('AIzaSyBTOYxZDado76VwsDWxlOjgci-u3_JjmZ0') then //FGetGoogleKey
     begin
       for i:=self.FKeyGoogle.Count-1 downto 0 do
         if SendRequestOK(self.FKeyGoogle.Strings[i]) then break;
     end;
     result:= ResultRequest;
   end
    else
      begin
        CountRepeatWhenError:=0;
        while (not SendRequestOK('')) do
        begin
          Application.ProcessMessages;
          inc(CountRepeatWhenError);
          if (CountRepeatWhenError > 100) then break;
        end;
        result:= ResultRequest;
      end;
 finally
   result:= ResultRequest;
   FreeAndNIl(Myhttp);
 end;
end;
//******************************************************************************
function TGoogleMaps.FJsonResulCheckOK( js:TlkJSONobject ):Boolean;
var i:Integer;
    currValue:Variant;
begin
  Result:=True;
  for i:=0 to js.Field['geocoded_waypoints'].Count-1  do
  begin
     if js.Field['geocoded_waypoints'].Child[i].Field['geocoder_status'].Value <> 'OK' then         //"geocoder_status" : "ZERO_RESULTS"
     begin
       Result:=false;
       Break;
     end;
  end;
end;
//******************************************************************************
function TGoogleMaps.FJsonResulGoogleObjCheckOK( js:TlkJSONobject ):Boolean;
begin
  Result:=False;
  if js.Field['status'].Value = 'OK' then result:=true;
end;
//******************************************************************************
function TGoogleMaps.FParserJsonResul(aJsonStr:WideString):TResultGoogle;
var
  js:TlkJSONobject;
  i: Integer;
  CurrDist:Variant;
  CurrDur:Variant;
  CountPoint:Integer;
begin
  js := TlkJSON.ParseText(aJsonStr) as TlkJSONobject;

  if not FJsonResulCheckOK( js ) then
  begin
   Result.Status:=-1;
   exit;
  end
   else Result.Status:=0;
   
  Result.Distance.value:=0;
  Result.Duration.value:=0; 
  CountPoint:=js.Field['routes'].Child[0].Field['legs'].Count;

  for i:=0 to CountPoint-1 do
  begin
   CurrDist:= js.Field['routes'].Child[0].Field['legs'].Child[i].Field['distance'].Field['value'].Value;
   if CurrDist <> null then
   Result.Distance.value:=Result.Distance.value +  CurrDist ;

   CurrDur:= js.Field['routes'].Child[0].Field['legs'].Child[i].Field['duration'].Field['value'].Value;
   if CurrDur <> null  then
    Result.Duration.value:=Result.Duration.value +  CurrDur ;
  end;

  Result.FromPoint.LocationAdddres:= js.Field['routes'].Child[0].Field['legs'].Child[0].Field['start_address'].Value;
  Result.ToPoint.LocationAdddres:= js.Field['routes'].Child[0].Field['legs'].Child[CountPoint-1].Field['end_address'].Value;

  // Result.ToPoint.LocationGPS.lat:= js.Field['routes'].Child[0].Field['legs'].Child[CountPoint-1].Field['end_location'].Field['lat'].Value;
  // Result.ToPoint.LocationGPS.lng:= js.Field['routes'].Child[0].Field['legs'].Child[CountPoint-1].Field['end_location'].Field['lng'].Value;

  SetLength( Result.Place , js.Field['geocoded_waypoints'].Count );

  for i:=0 to js.Field['geocoded_waypoints'].Count-1  do
  begin
    Result.Place[i].PlaceId:= js.Field['geocoded_waypoints'].Child[i].Field['place_id'].Value;

    if i<CountPoint then
    begin
     Result.Place[i].LocationStartGPS.lat:= js.Field['routes'].Child[0].Field['legs'].Child[i].Field['start_location'].Field['lat'].Value;
     Result.Place[i].LocationStartGPS.lng:= js.Field['routes'].Child[0].Field['legs'].Child[i].Field['start_location'].Field['lng'].Value;

     Result.Place[i].LocationEndGPS.lat:= js.Field['routes'].Child[0].Field['legs'].Child[i].Field['end_location'].Field['lat'].Value;
     Result.Place[i].LocationEndGPS.lng:= js.Field['routes'].Child[0].Field['legs'].Child[i].Field['end_location'].Field['lng'].Value;
    end
     else
      begin
       Result.Place[i].LocationStartGPS.lat:=-1;
       Result.Place[i].LocationStartGPS.lng:=-1;
       Result.Place[i].LocationEndGPS.lat  :=-1;
       Result.Place[i].LocationEndGPS.lng  :=-1;
      end;
  end;  
end;
//******************************************************************************
function TGoogleMaps.FParserJsonResultGoogleObject(aJsonStr:WideString):TGoogleObjectArr;
var
  js:TlkJSONobject;
  i,j: Integer;
  partMach:Variant;
begin
  js := TlkJSON.ParseText(aJsonStr) as TlkJSONobject;
  //******************************************
  if not FJsonResulGoogleObjCheckOK( js ) then
  begin
   SetLength(Result,0);
   exit;
  end;
  //******************************************
  SetLength(Result,js.Field['results'].Count);
  //******************************************
  for j:=0 to js.Field['results'].Count-1 do
  begin


    for i:=0 to js.Field['results'].Child[j].Field['address_components'].Count -1  do
    begin

     if CompareText(  js.Field['results'].Child[j].Field['address_components'].Child[i].Field['types'].Child[0].Value , 'street_number') = 0 then
       Result[j].streetNumber:= js.Field['results'].Child[j].Field['address_components'].Child[i].Field['long_name'].Value;

     if CompareText(  js.Field['results'].Child[j].Field['address_components'].Child[i].Field['types'].Child[0].Value , 'locality') = 0 then
       Result[j].locality:= js.Field['results'].Child[j].Field['address_components'].Child[i].Field['long_name'].Value;

     if CompareText(  js.Field['results'].Child[j].Field['address_components'].Child[i].Field['types'].Child[0].Value , 'route') = 0 then
       Result[j].route:= js.Field['results'].Child[j].Field['address_components'].Child[i].Field['long_name'].Value;

     if CompareText(  js.Field['results'].Child[j].Field['address_components'].Child[i].Field['types'].Child[0].Value , 'administrative_area_level_1') = 0 then
       Result[j].adminiArea:= js.Field['results'].Child[j].Field['address_components'].Child[i].Field['long_name'].Value;

     if CompareText(  js.Field['results'].Child[j].Field['address_components'].Child[i].Field['types'].Child[0].Value , 'country') = 0 then
       Result[j].country:= js.Field['results'].Child[j].Field['address_components'].Child[i].Field['long_name'].Value;

     if CompareText(  js.Field['results'].Child[j].Field['address_components'].Child[i].Field['types'].Child[0].Value , 'country') = 0 then
       Result[j].shortName:= js.Field['results'].Child[j].Field['address_components'].Child[i].Field['short_name'].Value;

     if CompareText(  js.Field['results'].Child[j].Field['address_components'].Child[i].Field['types'].Child[0].Value , 'postal_code') = 0 then
       Result[j].PostalCode:= js.Field['results'].Child[j].Field['address_components'].Child[i].Field['long_name'].Value;

    end;
    //******************************************
    if js.Field['results'].Child[j].Field['partial_match'] <> nil then
    begin
     if (js.Field['results'].Child[j].Field['partial_match'].Value<>Null)and(js.Field['results'].Child[0].Field['partial_match'].Value<>True) then
       Result[j].partialMatch := false
     else Result[j].partialMatch := true;
    end
     else Result[j].partialMatch := false;
    //******************************************
   Result[j].place_id := js.Field['results'].Child[j].Field['place_id'].Value;
   Result[j].Status:=0;
  end;

end;
//******************************************************************************
function TGoogleMaps.FParserJsonResultGoogleTranslateCountry(aJsonStr:WideString):TResultTranslateCountry;
var
  js:TlkJSONobject;
  i,j: Integer;
  partMach:Variant;
  aValue:Variant;
begin
  js := TlkJSON.ParseText(aJsonStr) as TlkJSONobject;
  //******************************************
  if not FJsonResulGoogleObjCheckOK( js ) then
  begin
   Result.TranslateCountry:='';
   Result.Translatelocality:='';
   Result.TranslateArea:='';


   Result.GeometryPoint.lat:=-1;
   Result.GeometryPoint.lng:=-1;
   exit;
  end;
  //******************************************
  //Result.TranslateName := js.Field['results'].Child[0].Field['address_components'].Child[0].Field['long_name'].Value;
  for j:=0 to js.Field['results'].Count-1 do
  begin
    for i:=0 to js.Field['results'].Child[j].Field['address_components'].Count -1  do
    begin

     if CompareText(  js.Field['results'].Child[j].Field['address_components'].Child[i].Field['types'].Child[0].Value , 'locality') = 0 then
        Result.Translatelocality:= js.Field['results'].Child[j].Field['address_components'].Child[i].Field['long_name'].Value;

     if CompareText(  js.Field['results'].Child[j].Field['address_components'].Child[i].Field['types'].Child[0].Value , 'administrative_area_level_1') = 0 then
        Result.TranslateArea:= js.Field['results'].Child[j].Field['address_components'].Child[i].Field['long_name'].Value;

     if CompareText(  js.Field['results'].Child[j].Field['address_components'].Child[i].Field['types'].Child[0].Value , 'country') = 0 then
        Result.TranslateCountry:= js.Field['results'].Child[j].Field['address_components'].Child[i].Field['long_name'].Value;

     if CompareText(  js.Field['results'].Child[j].Field['address_components'].Child[i].Field['types'].Child[0].Value , 'country') = 0 then
        Result.ShortName:= js.Field['results'].Child[j].Field['address_components'].Child[i].Field['short_name'].Value;
    end;
  end;

  if  Result.TranslateCountry <> '' then
  begin
    if (js.Field['results'].Child[0].Field['geometry'].Field['location']<> nil)and(js.Field['results'].Child[0].Field['geometry'].Field['location']<> nil) then
    begin
      Result.GeometryPoint.lat := js.Field['results'].Child[0].Field['geometry'].Field['location'].Field['lat'].Value  ;
      Result.GeometryPoint.lng := js.Field['results'].Child[0].Field['geometry'].Field['location'].Field['lng'].Value  ;
    end
     else
     begin
       if ( js.Field['results'].Child[0].Field['geometry'].Field['bounds']<> nil)and(js.Field['results'].Child[0].Field['geometry'].Field['bounds'].Field['northeast']<>nil) then
       begin
         Result.GeometryPoint.lat := js.Field['results'].Child[0].Field['geometry'].Field['bounds'].Field['northeast'].Field['lat'].Value ;
         Result.GeometryPoint.lng := js.Field['results'].Child[0].Field['geometry'].Field['bounds'].Field['northeast'].Field['lng'].Value ;
       end
     end;

    Result.PlaceID := js.Field['results'].Child[0].Field['place_id'].value;

  end;
end;
//******************************************************************************
function TGoogleMaps.FParserJsonResultGooglePlaceId(aJsonStr:WideString):TGooglePlaceIdArr;
var js:TlkJSONobject;
    j:integer;
begin
  js := TlkJSON.ParseText(aJsonStr) as TlkJSONobject;
  if not FJsonResulGoogleObjCheckOK( js ) then
  begin
   SetLength(Result,0);
   exit;
  end;
  //******************************************
  SetLength( Result , js.Field['results'].Count );
  //******************************************
  for j:=0 to js.Field['results'].Count-1 do
    Result[j].place_id := js.Field['results'].Child[j].Field['place_id'].Value;
end;
//******************************************************************************
function TGoogleMaps.CheckDistanceBetweenCity( FromPoint,ToPoint:TPointWay;waypoints:TWaypointsArr; Model:String ): TResultGoogle;
var URLApiStr:WideString;
    ResJson:WideString;
    Res:TResultGoogle;
begin
  URLApiStr:=FGetApiGoogleDistaneStr( FromPoint, ToPoint , Waypoints, Model );
  ResJson := FSendPostRequest( URLApiStr,  FTimeOut );
  Result := FParserJsonResul( ResJson );

  Result.FromPoint.LocationName:= FromPoint.City+','+FromPoint.Country;
  Result.ToPoint.LocationName:= ToPoint.City+','+ToPoint.Country;

end;
//******************************************************************************
function TGoogleMaps.FGetHTMLGoogleJsPositionWayStr( FromPoint,ToPoint:TPointWay;waypoints:TWaypointsArr;TravelMode:String;Zoom:Integer=5 ):TStringList;
var WayPointsJS:WideString;
begin

  WayPointsJS:=FGetWayPointsJs( waypoints );

  Result:=TStringList.Create;

  Result.Add('<!DOCTYPE html>');

  Result.Add('<html>');
  Result.Add('  <head> ');
  Result.Add('    <meta name="viewport" content="initial-scale=1.0, user-scalable=no"> ');
  //Result.Add('    <meta charset="utf-8">');
  Result.Add('    <meta http-equiv="Content-Type" content="text/html;charset=windows-1251">');
  Result.Add('    <title>Draggable directions</title> ');
  Result.Add('    <style> ');
  Result.Add('      #right-panel { ');
  Result.Add('        font-family: ''Roboto'',''sans-serif'';');
  Result.Add('        line-height: 30px;');
  Result.Add('        padding-left: 10px;');
  Result.Add('      } ');

  Result.Add('      #right-panel select, #right-panel input {');
  Result.Add('        font-size: 15px; ');
  Result.Add('      } ');

  Result.Add('      #right-panel select { ');
  Result.Add('        width: 100%;');
  Result.Add('       } ');

  Result.Add('       #right-panel i { ');
  Result.Add('         font-size: 12px; ');
  Result.Add('       }  ');
  Result.Add('       html, body {  ');
  Result.Add('         height: 100%;  ');
  Result.Add('         margin: 0; ');
  Result.Add('         padding: 0; ');
  Result.Add('       }   ');
  Result.Add('       #map {  ');
  Result.Add('         height: 100%; ');
  Result.Add('         float: left; ');
  Result.Add('         width: 63%;');
  Result.Add('         height: 100%; ');
  Result.Add('       } ');
  Result.Add('       #right-panel { ');
  Result.Add('        float: right;  ');
  Result.Add('        width: 34%; ');
  Result.Add('        height: 100%;  ');
  Result.Add('      } ');
  Result.Add('      .panel { ');
  Result.Add('        height: 100%;');
  Result.Add('        overflow: auto; ');
  Result.Add('      } ');
  Result.Add('    </style>');
  Result.Add('  </head>');
  Result.Add('  <body> ');
  Result.Add('    <div id="map"></div> ');
  Result.Add('    <div id="right-panel">  ');
  //Result.Add('      <p>Відстань маршруту: <span id="total"></span></p> ');
  Result.Add('    </div> ');
  Result.Add('    <script> ');
  Result.Add('      function initMap() { ');
  Result.Add('        var map = new google.maps.Map(document.getElementById(''map''), {');
  Result.Add('          zoom: '+IntToStr(Zoom)); //,
  //Result.Add('          center: {lat: 50.4498503, lng: 30.5238646 } ');
  Result.Add('        }); ');

  Result.Add('        var directionsService = new google.maps.DirectionsService;');
  Result.Add('        var directionsDisplay = new google.maps.DirectionsRenderer({ ');
  Result.Add('          draggable: true, ');
  Result.Add('          map: map, ');
  Result.Add('          panel: document.getElementById(''right-panel'')');
  Result.Add('        });');

  Result.Add('        directionsDisplay.addListener(''directions_changed'', function() { ');
  Result.Add('          computeTotalDistance(directionsDisplay.getDirections());  ');
  Result.Add('        });  ');

  Result.Add('        displayRoute('''+FromPoint.City+','+FromPoint.Country+''', '''+ToPoint.City+','+ToPoint.Country+''', directionsService, ');
  Result.Add('            directionsDisplay);');
  Result.Add('      } ');

  Result.Add('      function displayRoute(origin, destination, service, display) { ');
  Result.Add('        service.route({ ');
  Result.Add('          origin: origin, ');
  Result.Add('          destination: destination,');
  Result.Add('          waypoints: ['+WayPointsJS+' ], ');
  Result.Add('          travelMode: '''+TravelMode+''',');
  Result.Add('          avoidTolls: true ');
  Result.Add('        }, function(response, status) { ');
  Result.Add('          if (status === ''OK'') { ');
  Result.Add('            display.setDirections(response);  ');
  Result.Add('          } else {  ');
  Result.Add('            alert(''Could not display directions due to: '' + status);');
  Result.Add('          } ');
  Result.Add('        }); ');
  Result.Add('      } ');

  Result.Add('      function computeTotalDistance(result) { ');
  Result.Add('        var total = 0; ');
  Result.Add('        var myroute = result.routes[0]; ');
  Result.Add('        for (var i = 0; i < myroute.legs.length; i++) {');
  Result.Add('          total += myroute.legs[i].distance.value;');
  Result.Add('        }  ');
  Result.Add('        total = total / 1000; ');
  Result.Add('        document.getElementById(''total'').innerHTML = total + '' km''; ');
  Result.Add('      } ');
  Result.Add('    </script> ');
  Result.Add('    <script async defer ');
  Result.Add('    src="https://maps.googleapis.com/maps/api/js?key='+FGetGoogleKey+'&callback=initMap"> ');
  Result.Add('    </script>  ');
  Result.Add('  </body> ');
  Result.Add('</html>  ');
end;
//******************************************************************************
function TGoogleMaps.ShowPointsDirections( FromPoint,ToPoint:TPointWay;waypoints:TWaypointsArr; TravelMode:String;Zoom:Integer=5  ):Integer;
var HTMLList:TStringList;
    TempDir:string;
    Uid: TGuid;
    FileHtml:String;
begin
  HTMLList:=FGetHTMLGoogleJsPositionWayStr( FromPoint, ToPoint, waypoints, TravelMode ,Zoom );
  try
    DelDir(FTempDir,'*.*');
    ExistsDir( FTempDir );

    CreateGuid(Uid);
    FileHtml := FTempDir + GuidToString(Uid)+'.html';

    HTMLList.SaveToFile( FileHtml );

    ShellExecuteA( Application.Handle,'open', PAnsiChar( FileHtml ) , nil, nil, SW_SHOWNORMAL);
    Sleep(1000);
  finally
    //DelDir(TempDir,'*.*');
  end;
end;
//******************************************************************************
function TGoogleMaps.GetObject(ObjectName, Country,
  City: Widestring;Lng:Widestring='en'): TGoogleObjectArr;
var URLApiStr:WideString;
    ResJson:WideString;
    Res:TResultGoogle;
begin
  URLApiStr:=FGetApiGoogleObject( ObjectName , Country, City, Lng );
  ResJson := FSendPostRequest( URLApiStr,  FTimeOut );
  Result  := FParserJsonResultGoogleObject( ResJson );
end;
//******************************************************************************
function TGoogleMaps.GetTranslate(SameText,LnFrom,LnTo:Widestring):Widestring;
var URLApiStr:WideString;
    ResJson:WideString;
    Res:TResultGoogle;
    StatInd:Integer;
begin
  URLApiStr := FGetApiGoogleTranslate( SameText, LnFrom, LnTo );
  ResJson := FSendPostRequest( URLApiStr,  FTimeOut, false );
  //ResJson := Utf8ToAnsi( ResJson );
  StatInd :=1;
  result  := ParseTextInQuotes(ResJson,StatInd,'"','"' );
  result  := Utf8ToAnsi ( Utf8Encode( (result) ) );
end;
//******************************************************************************
function TGoogleMaps.TranslateCountry(Name:Widestring;Lng:Widestring='en'): TResultTranslateCountry;
var URLApiStr:WideString;
    ResJson:WideString;
    Res:TResultGoogle;
    ParseRes:TGoogleObjectArr;
begin
  URLApiStr:=FGetApiGoogleObject( Utf8Encode(Name) , '', '', Lng );
  ResJson := FSendPostRequest( URLApiStr,  FTimeOut );
  result  := FParserJsonResultGoogleTranslateCountry(ResJson);

  //ParseRes.
  //Result := ParseRes[0].
end;
//******************************************************************************
function TGoogleMaps.GetObjectLocation(LocLat, LocLng: Widestring; KeyWord:Widestring=''; TypeObject:Widestring=''; Lng:Widestring='en' ): TGoogleObjectArr;
var URLApiStr:WideString;
    ResJson:WideString;
    Res:TResultGoogle;
begin
 URLApiStr:=FGetApiGoogleObjectLocation( LocLat, LocLng, KeyWord, TypeObject , Lng );
 ResJson := FSendPostRequest( URLApiStr,  FTimeOut );
 Result  := FParserJsonResultGoogleObject( ResJson );
end;
//******************************************************************************
function TGoogleMaps.GetObjectByTextSearch(KeyWords:Widestring=''; LocLat:Widestring='';LocLng: Widestring='';Radius:Integer=100; TypeObject:Widestring='';FormatResult:Widestring='json'):TGooglePlaceIdArr;
var URLApiStr:WideString;
    ResJson:WideString;
begin
 URLApiStr:=FGetApiGoogleObjectByTextSearch(KeyWords,LocLat,LocLng,Radius,TypeObject,FormatResult);
 ResJson := FSendPostRequest( URLApiStr,  FTimeOut );
 Result  := self.FParserJsonResultGooglePlaceId(ResJson);
end;
//******************************************************************************
function TGoogleMaps.GetUrlTranslate(LngFrom,LngTo:String; TextForTranslate:Widestring; TextNeedConvertToUrl:Boolean = true ):Widestring;
begin
  if TextNeedConvertToUrl then
  begin
    TextForTranslate:= UrlEncode(Utf8Encode(TextForTranslate));
    ReplaseON(TextForTranslate,'+','%20');
    ReplaseON(TextForTranslate,' ','%20');
  end;
  //result := 'https://translate.google.com/#'+LngFrom+'/'+LngTo+'/'+TextForTranslate;
  result := 'https://translate.google.com/#view=home&op=translate&sl='+LngFrom+'&tl='+LngTo+'&text='+TextForTranslate;
end;
//******************************************************************************
function TGoogleMaps.ParseResultTranslate( WB:TWebBrowser; OptParseHtmlText: TOptParseHtmlText=OptParseHtmlInnerText ):Widestring;
var ElemTextIn:Olevariant;
    ElemResult:Olevariant;
begin
  {ElemTextIn := WB.oleobject.document.getelementbyID('gt-src-c');
  if (not VarIsClear(ElemTextIn))and(not VarIsNull(ElemTextIn)) then
  begin
    ElemTextIn.parentNode.removeChild(ElemTextIn);
  end;  }

  ElemResult := WB.oleobject.document.getelementbyId('result_box');
  if (not VarIsClear(ElemResult))and(not VarIsNull(ElemResult)) then
  begin
    if OptParseHtmlText=OptParseHtmlInnerText then result := ElemResult.InnerText;
    if OptParseHtmlText=OptParseHtmlOuterText then result := ElemResult.OuterText;
    if OptParseHtmlText=OptParseHtmlInnerHTML then result := ElemResult.InnerHTML;
    if OptParseHtmlText=OptParseHtmlOuterHTML then result := ElemResult.OuterHTML;
  end
  else result := '';
end;

function TGoogleMaps.FindResultTranslate(WB:TWebBrowser):Boolean;
var ElemTextIn:Olevariant;
    ElemResult:Olevariant;
begin
  if (not VarIsNull( WB.oleobject)) and(not VarIsError( WB.oleobject) ) then
  begin
    ElemResult := WB.oleobject.document.getelementbyID('result_box');
    if (not VarIsClear(ElemResult))and(not VarIsNull(ElemResult)) then
      result := Trim( ElemResult.InnerText) <> ''
    else result := false;
  end
  else
  begin
    Sleep(10000);
    result := false;
  end;
end;


end.


// Doc https://developers.google.com/maps/documentation/directions/intro?hl=ru

//https://maps.googleapis.com/maps/api/geocode/json?place_id=ChIJ2aVH4kuepkARstlzgjyGxpM&key=AIzaSyAtRLayCL77DmnAF8PzcHjaBFMoZYj-NXc&language=ua

//https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=41.655304559534535,24.690966606140137&radius=10&key=AIzaSyC8Pca_Um4bPR17qSvQSLNyIybpcJvwiM4

//https://maps.googleapis.com/maps/api/place/textsearch/json?query=ROYAL+PARK+Bulgaria+SUNNY+BEACH&type=hotell&radius=10&type=restaurants&key=AIzaSyC8Pca_Um4bPR17qSvQSLNyIybpcJvwiM4
//https://maps.googleapis.com/maps/api/place/textsearch/json?query=Hotel+ROYAL+BEACH+CHAIKA+Bulgaria&sensor=true&location=42.703262,27.811326&Radius=10&key=AIzaSyC8Pca_Um4bPR17qSvQSLNyIybpcJvwiM4

