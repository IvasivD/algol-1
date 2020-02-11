unit UnitTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, IBCustomDataSet, IBQuery, IBDatabase, StdCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,IdMultipartFormData,
  IdIOHandler, IdIOHandlerSocket, IdSSLOpenSSL, IdMessageClient, IdSMTP ,UnitGoogleMaps, UnitProc,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
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
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxListBox, Buttons ;

type
  TForm1 = class(TForm)
    IBTransaction1: TIBTransaction;
    IBDatabase1: TIBDatabase;
    IBQueryCity: TIBQuery;
    CityDS: TDataSource;
    IBQueryCityCITYID: TIntegerField;
    IBQueryCityCITY: TIBStringField;
    IBQueryCityCOUNTRY: TIBStringField;
    Button2: TButton;
    LabelDist: TLabel;
    ComboCityFrom: TcxLookupComboBox;
    ComboCityTo: TcxLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    LookupComboBoxCurrWayPoint: TcxLookupComboBox;
    SpeedButton1: TSpeedButton;
    ListBoxWayPoint: TcxListBox;
    DellCurrWayPoint: TSpeedButton;
    butClearWayPoint: TSpeedButton;
    LabelDur: TLabel;
    ListBoxGeoCoordinate: TcxListBox;
    Button1: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure IdHTTP1Status(ASender: TObject; const AStatus: TIdStatus;
      const AStatusText: String);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure butClearWayPointClick(Sender: TObject);
    procedure DellCurrWayPointClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private

    procedure GetWayPoints(KeyFieledName:String; DatatSet:TDataset;var  WayPoints: TWaypointsArr);
    Function  GetPointById( KeyFieledName:String; KeyValue:Variant; DatatSet:TDataset ):TPointWay;
    procedure GetParamForSearch( var FromPoint:TPointWay;var ToPoint:TPointWay  );
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 IBDatabase1.Connected:=true;
 IBQueryCity.Active:=true;
end;

procedure TForm1.IdHTTP1Status(ASender: TObject; const AStatus: TIdStatus;
  const AStatusText: String);
begin
 ShowMessage(AStatusText);
end;

Function TForm1.GetPointById( KeyFieledName:String; KeyValue:Variant; DatatSet:TDataset ):TPointWay;
begin
  DatatSet.Locate(KeyFieledName , KeyValue , [] );
  result.Country := DatatSet.FieldByName('COUNTRY').AsString;
  result.City := DatatSet.FieldByName('CITY').AsString;
end;

procedure TForm1.GetParamForSearch(var FromPoint:TPointWay;var ToPoint:TPointWay );
begin
 if ComboCityFrom.EditValue = null then Exit;
 if ComboCityTo.EditValue = null then Exit;
 
 try
   ComboCityFrom.Properties.ListSource.DataSet.DisableControls;

   FromPoint:=GetPointById( 'CITYID' , ComboCityFrom.EditValue , ComboCityFrom.Properties.ListSource.DataSet );
   ToPoint:=GetPointById( 'CITYID' , ComboCityTo.EditValue , ComboCityTo.Properties.ListSource.DataSet );
   
 finally
  ComboCityFrom.Properties.ListSource.DataSet.EnableControls;
 end;

end;

procedure TForm1.GetWayPoints( KeyFieledName:String; DatatSet:TDataset;var  WayPoints: TWaypointsArr );
var i:Integer;
    CurrPoint:TPointWay;

begin
  SetLength( WayPoints , ListBoxWayPoint.Count );
 for i:=0 to ListBoxWayPoint.Count -1 do
 begin
   DatatSet.GotoBookmark( ListBoxWayPoint.Items.Objects[i] );
   CurrPoint:= GetPointById( KeyFieledName, DatatSet.FieldByName(KeyFieledName).Value, DatatSet );
   WayPoints[i].Country:=CurrPoint.Country;
   WayPoints[i].City:=CurrPoint.City;
 end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var GoogleMaps:TGoogleMaps;
    Distance:TResultGoogle;
    FromPoint:TPointWay;
    ToPoint:TPointWay;
    Duration:Double;
    Hour:Integer;
    Min:Integer;
    i:integer;
    WayPoints: TWaypointsArr;
begin
 GetParamForSearch( FromPoint ,ToPoint );
 GetWayPoints('CITYID', IBQueryCity ,WayPoints);
 try
  GoogleMaps := TGoogleMaps.Create;
  Distance:=GoogleMaps.CheckDistanceBetweenCity(FromPoint,ToPoint, WayPoints ,'bus');
  if Distance.Status<>-1 then
  begin
    Duration:= (Distance.Duration.value /3600 );
    
    Hour:=Trunc( Duration );
    Min :=Round( Frac ( Duration ) *  60 ); 

    LabelDist.Caption := formatfloat('0.0',Distance.Distance.value /1000)+' км.';
    LabelDur.Caption  := IntToStr( Hour )+' год.'+' '+IntToStr( Min )+' min.';

    ///Distance.Place[i].LocationStartGPS.lat
    ListBoxGeoCoordinate.Clear;
    for i:=0 to Length(Distance.Place)-1 do
    begin
     ListBoxGeoCoordinate.AddItem('Lat:'+FloatToStr( Distance.Place[i].LocationStartGPS.lat ) +' Lng:'+  FloatToStr( Distance.Place[i].LocationStartGPS.lng ) , nil);
     ListBoxGeoCoordinate.AddItem('Lat:'+FloatToStr( Distance.Place[i].LocationEndGPS.lat ) +' Lng:'+  FloatToStr( Distance.Place[i].LocationEndGPS.lng ) , nil);

    // Memo1.Lines.Add('Lat:'+FloatToStr( Distance.Place[i].LocationStartGPS.lat ) +' Lng:'+  FloatToStr( Distance.Place[i].LocationStartGPS.lng) );
    // Memo1.Lines.Add('Lat:'+FloatToStr( Distance.Place[i].LocationEndGPS.lat ) +' Lng:'+  FloatToStr( Distance.Place[i].LocationEndGPS.lng) );
    end;

  end
  else
   begin
    LabelDist.Caption:='Error';
    LabelDur.Caption:='Error';
   end;
 finally
  GoogleMaps.free;
 end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var CurrWayPoint:TPointWay;
begin
 CurrWayPoint:=GetPointById( 'CITYID' , LookupComboBoxCurrWayPoint.EditValue , LookupComboBoxCurrWayPoint.Properties.ListSource.DataSet );
 ListBoxWayPoint.AddItem( CurrWayPoint.City, LookupComboBoxCurrWayPoint.Properties.ListSource.DataSet.GetBookmark);
end;

procedure TForm1.butClearWayPointClick(Sender: TObject);
begin
 ListBoxWayPoint.Clear;
end;

procedure TForm1.DellCurrWayPointClick(Sender: TObject);
begin
 ListBoxWayPoint.DeleteSelected;
end;

procedure TForm1.Button1Click(Sender: TObject);
var GoogleMaps:TGoogleMaps;
    Distance:TResultGoogle;
    FromPoint:TPointWay;
    ToPoint:TPointWay;
    WayPoints: TWaypointsArr;
begin
 GetParamForSearch( FromPoint ,ToPoint );
 GetWayPoints('CITYID', IBQueryCity ,WayPoints);
 try
  GoogleMaps := TGoogleMaps.Create;
  GoogleMaps.ShowPointsDirections(FromPoint,ToPoint, WayPoints ,'DRIVING');      //WALKING
 finally
  GoogleMaps.Close;
 end;
end;

end.


https://maps.googleapis.com/maps/api/directions/json?origin=place_id:ChIJ685WIFYViEgRHlHvBbiD5nE&destination=place_id:ChIJA01I-8YVhkgRGJb0fW4UX7Y&key=AIzaSyBxX2bqPLNEUlpy_GrmIuzMeAP48i0aY2s


https://maps.googleapis.com/maps/api/directions/json?origin=Львів,Україна&destination=Стрий,Україна&departure_time=1343641500&mode=transit&key=AIzaSyBxX2bqPLNEUlpy_GrmIuzMeAP48i0aY2s
https://maps.googleapis.com/maps/api/directions/json?origin=Boston,MA&destination=Concord,MA&waypoints=Charlestown,MA|via:Lexington,MA&key=AIzaSyBxX2bqPLNEUlpy_GrmIuzMeAP48i0aY2s


https://maps.googleapis.com/maps/api/directions/json?origin=Львів,Україна&destination=Стрий,Україна&key=AIzaSyBxX2bqPLNEUlpy_GrmIuzMeAP48i0aY2s

'%CB%FC%E2%B3%E2%2C%D3%EA%F0%E0%BF%ED%E0'
https://maps.googleapis.com/maps/api/directions/json?origin=
%D0%9B%D1%8C%D0%B2%D1%96%D0%B2,%D0%A3%D0%BA%D1%80%D0%B0%D1%97%D0%BD%D0%B0&destination=%D0%A1%D1%82%D1%80%D0%B8%D0%B9,%D0%A3%D0%BA%D1%80%D0%B0%D1%97%D0%BD%D0%B0&key=AIzaSyBxX2bqPLNEUlpy_GrmIuzMeAP48i0aY2s
