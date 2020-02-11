unit UnitText;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, SHDocVw, ExtCtrls,UnitProc, DB, IBDatabase,UnitPreviewResult,
  IBCustomDataSet, IBQuery, UnitDM, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxCustomData, cxStyles, cxTL,
  cxTLdxBarBuiltInMenu, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  cxInplaceContainer, cxTLData, cxDBTL;

type
  TStrVikiData = record
     CountryId:Integer;
     Title:Widestring;
     Value:Widestring;
  end;
  TStrVikiDataArr = array of TStrVikiData;

  TFrmMain = class(TForm)
    WebBrowser: TWebBrowser;
    Panel1: TPanel;
    Button1: TButton;
    EdUrlForParse: TEdit;
    Button2: TButton;
    procedure WebBrowserDocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
     FArrMasValue:TStrVikiDataArr;
    { Private declarations }
  public
     procedure CurrParsePage(CountryId:Integer);
     procedure ParseRunCountry(FieldForSeacrh:String);
    { Public declarations }
  end;



var
  FrmMain: TFrmMain;

implementation

uses core;

{$R *.dfm}

Function GetFirstTagFromIDPath(var aPath:WideString):String;
var i:integer;
    StrP:String;
begin
 if (Length(aPath)<>0)and(aPath[1]='/') then
     delete(aPath,1,1);

 StrP:='';
 for i:=1 to Length(aPath) do
     begin
      if (aPath[i]<>'/') then
          StrP:=StrP+aPath[i]
          else
           begin
            result:=StrP;
            Delete(aPath,1,i);
            Break;
           end;
      //**************************
      if (i=Length(aPath)) then
          begin
           result:=StrP;
           Delete(aPath,1,i);
          end;
     end;
end;
//******************************************************************************
Function ParseElemTagForPathNext(AllElem,ElemCurrDiv:variant;aPath:WideString):variant;
var CurrSubTag:String;
    i:integer;
    En:Boolean;
    CurrTag:string;
begin
 En:=false;
 CurrSubTag:=GetFirstTagFromIDPath(aPath);
 for i:=0 to AllElem.length-1 do
     begin
      if (AllElem.item(i).outerhtml=ElemCurrDiv.outerhtml)and(ElemCurrDiv.outerhtml<>'') then En:=true;
      if En then
         begin
            CurrTag:=AllElem.item(i).tagName;
            if CompareText(CurrTag,CurrSubTag)=0 then
               begin
                if aPath<>'' then CurrSubTag:=GetFirstTagFromIDPath(aPath)
                   else
                     begin
                      Result:=AllElem.item(i);
                      break;
                     end;
               end;
         end;
     end;
end;
//******************************************************************************
Function ParseElemClassDiv(IDControlPath:String;AllElem,AllElemDiv:variant):variant;
var CurrClassName:widestring;
    StartIndex:Integer;
    PathForParse:widestring;
    i:integer;
    ClassName:widestring;
    TagName:widestring;
begin
  StartIndex:=1;
  CurrClassName:=ParseTextInQuotes(IDControlPath,StartIndex,'"','"');
  PathForParse:=IDControlPath;
  Delete(PathForParse,1,StartIndex);

  for i:=0 to AllElemDiv.length-1 do
     begin
        ClassName:=AllElemDiv.item(i).className;
        TagName:=AllElemDiv.item(i).className;
        if CompareText(Trim(ClassName),Trim(CurrClassName))=0 then
           begin
            result:=ParseElemTagForPathNext(AllElem, AllElemDiv.item(i),PathForParse);   //  AllElemDiv.item(i).all
            break;
           end;
        //******************
        if CompareText(Trim(TagName),Trim(TagName))=0 then
           begin
            result:=ParseElemTagForPathNext(AllElem, AllElemDiv.item(i),PathForParse);   //  AllElemDiv.item(i).all
            break;
           end;
     end;
end;
//******************************************************************************
Function GetTagClass(aIdClassPath:widestring):widestring;
var CurrSubTag:widestring;
    CurrClassName:widestring;
    StartIndex:integer;
begin
  StartIndex:=1;
  CurrClassName:=ParseTextInQuotes(aIdClassPath,StartIndex,'"','"');
  ReplaseON(aIdClassPath,'"'+CurrClassName+'"','');
  result:=GetFirstTagFromIDPath(aIdClassPath);
end;
//******************************************************************************
Function FindElemByID( WB:TWebBrowser; IDControl:string ):variant;
var El:variant;
    SubEL:variant;
begin
  El:=WB.OleObject.Document.getelementsbytagname(GetTagClass(IDControl));
  SubEL:=ParseElemClassDiv( IDControl, WB.OleObject.Document.All , El );
  if (not VarIsClear(SubEL))and(not VarIsNull(SubEL)) then
     result:= SubEL
  else result:=null;
end;
//******************************************************************************
procedure PrepareTitle(var aTitle:Widestring);
begin
  if AnsiPos('Прапор',aTitle)<>0 then aTitle:= 'Прапор';
  if AnsiPos('Герб',aTitle)<>0 then aTitle:= 'Герб';
  if AnsiPos('Населення - оцінка',aTitle)<>0 then aTitle:= 'Населення - оцінка';
  if AnsiPos('Населення - перепис',aTitle)<>0 then aTitle:= 'Населення - перепис';
  if AnsiPos('ІРЛП',aTitle)<>0 then aTitle:= 'ІРЛП';

end;
//******************************************************************************
function GetAndFindDetailType( aTitle:Widestring ):Integer;
begin
  PrepareTitle( aTitle );

  if Elem_CountryDetailTypes.DB.Locate('NAME',aTitle,[]) then
    result := Elem_CountryDetailTypes.GetValueId
  else
  begin
    Elem_CountryDetailTypes.DB.Insert;
    Elem_CountryDetailTypes.DB.FieldByName('NAME').AsString := aTitle;
    Elem_CountryDetailTypes.DB.Post;
    result := Elem_CountryDetailTypes.GetValueId;
  end;
end;
//******************************************************************************

//******************************************************************************
procedure UpdateDetailValue( CountryId, TypeId:Integer; Value:Widestring );

procedure CrrUpdate;
var CurrExtFile:String;
    TempFile:String;
begin
  Elem_CountryDetail.DB.Edit;
  Elem_CountryDetail.DB.FieldByName('COUNTRY_ID').AsInteger := CountryId;
  Elem_CountryDetail.DB.FieldByName('COUNTRY_DET_TYPE_ID').AsInteger := TypeId;

  if AnsiPos( 'https://', Value)<>0 then
  begin
    CurrExtFile:= ExtractFileExt(Value);
    if CheckExtOnGraficFile(CurrExtFile) then
    begin
      try

        TempFile:= ExtractFilePath(Application.ExeName)+'Temp\';
        ExistsDir(TempFile);
        TempFile := TempFile + 'FileTmp' + CurrExtFile;

        GetInetFile( Value, TempFile);
        Elem_CountryDetail.DBAddBlobFileData( 'AFILE', TempFile );

      finally
        DelDir( ExtractFilePath( TempFile) , '*.*' );
      end;
    end
     else Elem_CountryDetail.DBAddBlobDataString('AURL', Value );
  end
   else
   Elem_CountryDetail.DB.FieldByName('AVALUE').AsString := Value ;

  Elem_CountryDetail.DB.Post;
end;
//************************************************
begin
  if Elem_CountryDetail.DB.Locate('COUNTRY_ID;COUNTRY_DET_TYPE_ID',VarArrayOf([CountryId,TypeId]),[]) then
  Elem_CountryDetail.DB.Edit
  else
   Elem_CountryDetail.DB.Insert;

  CrrUpdate;
end;
//******************************************************************************
procedure UpdateDBData( masValue: TStrVikiDataArr );
var i:integer;
    TypeId:Integer;
begin
  for i:=0 to Length(masValue) - 1 do
  begin
     TypeId := GetAndFindDetailType( masValue[i].Title );
     UpdateDetailValue(masValue[i].CountryId, TypeId, masValue[i].Value );
  end;
end;
//******************************************************************************
function ParseTitle( SubTR:Olevariant ):Widestring;
var ElemTitle:Olevariant;
begin
  ElemTitle := SubTR.getelementsbytagname('th');
  if ElemTitle.length<>0 then
   result := ElemTitle.item(0).innertext
  else
   ElemTitle := SubTR.getelementsbytagname('td');
  //ShowMessage( IntToStr( ElemTitle.length) );

  if ElemTitle.item(0).classname <> 'maptable' then
   if ElemTitle.length<>0 then result := ElemTitle.item(0).innertext
  else result :='';
end;
//******************************************************************************
procedure AddValueToMas(var aArrMasValue:TStrVikiDataArr; Title,Value:Widestring; CountryId:Integer );
var i:integer;
    TitleList:TStringList;
    ValueList:TStringList;
procedure AddToArr(aTitle,aValue:Widestring);
var len:integer;
begin
  len := length(aArrMasValue);
  SetLength(aArrMasValue,len+1);
  aArrMasValue[len].CountryId :=CountryId;
  aArrMasValue[len].Title :=Trim(aTitle);
  aArrMasValue[len].Value :=Trim(aValue);
 // ShowMessage(aArrMasValue[len].Title+'  '+aArrMasValue[len].Value);
end;
begin
  try
    TitleList := TStringList.Create;
    ValueList := TStringList.Create;

    ReplaseOn(Title,'&nbsp','');
    ReplaseOn(Value,'&nbsp','');

    TitleList.Text := Title;
    ValueList.Text := Value;

    if (TitleList.Count = ValueList.Count)and(AnsiPos('Столиця',Title)=0)and(AnsiPos('найбільше місто',Title)=0) then
    begin
      for i:=0 to TitleList.Count-1 do
        AddToArr(TitleList[i],ValueList[i]);
    end
    else
    begin
      if (AnsiPos('Столиця',Title)<>0) then
      begin
        if (AnsiPos('найбільше місто',Title)<>0 ) then
        begin
          AddToArr('Столиця',ValueList.strings[0]);
          AddToArr('Найбільше місто',ValueList.strings[0]);
        end
        else
          AddToArr('Столиця',ValueList.strings[0]);
      end
      else
        AddToArr(Title,Value);
    end;

  //#$D#$A'(та найбільше місто)'

  finally
    TitleList.Free;
    ValueList.Free;
  end;
end;
//*******************************************************
procedure ParseFlag( aElem:Olevariant;  var aArrMasValue:TStrVikiDataArr; CountryId:Integer );
var i:integer;
    currClassName:String;
    LinkElem:OleVariant;
    ImgElem:OleVariant;
    CurrBeginTitle:Widestring;
    CurrTitle:Widestring;
    CurrValue:Widestring;
begin
  currClassName := aElem.classname; // maptable
  if currClassName = 'maptable' then
  begin
    LinkElem := aElem.getelementsbytagname('a');
    for i:=0 to LinkElem.length-1 do
    begin

      if (LinkElem.length>0) then
      begin
        ImgElem := LinkElem.item(i).getelementsbytagname('img');
        CurrTitle :=LinkElem.item(i).text;
        if trim(CurrTitle)='' then CurrTitle:= LinkElem.item(i).title;

        if CurrTitle<>CurrBeginTitle then CurrTitle := Trim(CurrBeginTitle)+' '+Trim(CurrTitle);

        if ImgElem.length>0 then
         CurrValue:=ImgElem.item(0).src
        else
        CurrValue :=LinkElem.item(i).href;

        AddValueToMas(aArrMasValue, CurrTitle, CurrValue, CountryId );
      end;
    end;
  end;
end;
//******************************************************************************

function ClearValue(aValue:widestring):Widestring;
var i:integer;
begin
  ReplaseOn( aValue, '%E2%96%BC','');
  ReplaseOn( aValue, '%E2%96%AC','-');
  ReplaseOn( aValue, '%C2%B0','°');
  ReplaseOn( aValue, '%E2%80%B2','''');
  ReplaseOn( aValue, 'вЂІ','''');
  ReplaseOn( aValue, 'Рґ.п»ї / п»ї',#13#10);
  ReplaseOn( aValue, 'Рґ.п»ї /',#13#10);
  ReplaseOn( aValue, 'Рґ.п»ї',#13#10);
  ReplaseOn( aValue, 'ВІ','');
  ReplaseOn( aValue, 'в–ј','');
  ReplaseOn( aValue, 'в€’','-');

  ReplaseOn( aValue, 'в–І','');
  ReplaseOn( aValue, '(?)','');
  //for i:=0 to 10 do
  //begin
  ParepareClearValue( aValue,'(',')');
  ParepareClearValue( aValue,'[',']');
  //end;
  //' (UTCв€’5 РґРѕ в€’10)'
  //'в–ј 42 444 919  (РЅР°СЏРІРЅРµ РЅР°СЃРµР»РµРЅРЅСЏ, Р±РµР· СѓСЂР°С…СѓРІР°РЅРЅСЏ С‚РёРјС‡Р°СЃРѕРІРѕ РѕРєСѓРїРѕРІР°РЅРѕС— С‚РµСЂРёС‚РѕСЂС–С— РђРІС‚РѕРЅРѕРјРЅРѕС— Р РµСЃРїСѓР±Р»С–РєРё РљСЂРёРј С– Рј. РЎРµРІР°СЃС‚РѕРїРѕР»СЏ) (32)'
  //'РњРѕСЃРєРІР°'#$D#$A'55В°45' РїРЅ. С€. 37В°37' СЃС…. '#$D#$A'55.750В° РїРЅ. С€. 37.617В° СЃС…. Рґ.п»ї / 55.750; 37.617'
  // 55.750° пн. ш. 37.617° сх. д.
  //'РњРѕСЃРєРІР°'#$D#$A'55В°45вЂІ РїРЅ. С€. 37В°37вЂІ СЃС…. Рґ.п»ї / п»ї55.750В° РїРЅ. С€. 37.617В° СЃС…. Рґ.п»ї / 55.750; 37.617'

  //'Москва'#$D#$A'55°45? пн. ш. 37°37? сх. д.? / ?55.750° пн. ш. 37.617° сх. д.? / 55.750; 37.617'
  //'%CC%EE%F1%EA%E2%E0%0D%0A55%B045%3F+%EF%ED%2E+%F8%2E+37%B037%3F+%F1%F5%2E+%E4%2E%3F+%2F+%3F55%2E750%B0+%EF%ED%2E+%F8%2E+37%2E617%B0+%F1%F5%2E+%E4%2E%3F+%2F+55%2E750%3B+37%2E617'

  result := aValue;
end;
//******************************************************************************
procedure ParseDataWithLinkInside( BeginTitle:String; aElem:Olevariant;MainRowInd:Integer; var IndElem:Integer;
                                  var aArrMasValue:TStrVikiDataArr; CountryId:Integer );
var i,Ind:integer;
    currTagName:String;
    CurrTitle:Widestring;
    CurrValue:Widestring;
    len:Integer;
begin
  Ind:=0;
  len :=aElem.item(IndElem).parentElement.cells.length;

  for i:=IndElem to IndElem+len-1 do
  begin
    currTagName :=aElem.item(i).tagname;

    if ((currTagName ='TH') or (currTagName ='TD')) and( (Ind mod 2)=0 ) then
      CurrTitle := aElem.item(i).innertext
    else
    begin
      CurrValue := ClearValue( ( Utf8Encode(  aElem.item(i).innertext)) );
      CurrValue := Utf8decode(CurrValue);
      CurrValue := Trim(CurrValue);
      CurrTitle := Trim(CurrTitle);

      if (CurrTitle<>BeginTitle)and( CurrTitle<>'' )and(CurrTitle[1]='-') then
        CurrTitle := Trim(BeginTitle)+' '+Trim(CurrTitle);

      if CurrValue <>'' then
        AddValueToMas(aArrMasValue, CurrTitle, CurrValue,CountryId );
    end;
    inc(Ind);

  end;

  IndElem:=i;

end;
//******************************************************************************
procedure ParseData( BeginTitle:String; aElem:Olevariant;MainRowInd:Integer; var IndElem:Integer;  var aArrMasValue:TStrVikiDataArr;CountryId:Integer );
var currTagName:String;
    LinkElem:Olevariant;
begin

  currTagName :=aElem.item(IndElem).tagname;
  if ((currTagName ='TH') or (currTagName ='TD')) then
  begin
    //LinkElem := aElem.item(IndElem).getelementsbytagname('a');
    //if LinkElem.length>0 then
      ParseDataWithLinkInside( BeginTitle, aElem,MainRowInd, IndElem, aArrMasValue,CountryId );
  end;

end;
//******************************************************************************
procedure ParseValueAndTile( SubTR:Olevariant;var IndElem:Integer; var aArrMasValue:TStrVikiDataArr; CountryId:Integer );
var CurrBeginTitle:Widestring;
    CurrTitle :Widestring;
    CurrValue :Widestring;
    i:Integer;
    AllElem:Olevariant;
    currTagName:Widestring;
    currClassName:Widestring;
    lenTH:Integer;
    lenTD:Integer;
    LinkElem:Olevariant;
    ImgElem:Olevariant;
//*******************************************************
begin
  currClassName := SubTR.item(IndElem).classname;
  if (currClassName = 'mergedtoprow')or(currClassName='') then
  begin
    CurrBeginTitle := ParseTitle( SubTR.item(IndElem) );

    while true do
    begin
      lenTH := SubTR.item(IndElem).getelementsbytagname('th').length;
      lenTD := SubTR.item(IndElem).getelementsbytagname('td').length;

      if lenTH + lenTD >1 then
      begin
        AllElem := SubTR.item(IndElem).cells;
        i:=0;
        While i<=AllElem.length-1 do

        begin
          currClassName :=AllElem.item(i).classname;
          currTagName :=AllElem.item(i).tagname;

          if (currTagName ='TD')or(currTagName='TH')or(currTagName='') then
          begin

            if currClassName='maptable' then
            begin
              ParseFlag( AllElem.item(i),  aArrMasValue, CountryId );
              inc(i);
            end
            else
              ParseData( CurrBeginTitle, AllElem,IndElem, i, aArrMasValue,CountryId );
          end
          else
          inc(i);

        end;
      end;

      if IndElem+1<SubTR.length then currClassName := SubTR.item(IndElem+1).classname
      else currClassName :='';

      if (currClassName<>'mergedrow')and
         (currClassName<>'mergedbottomrow') then break
      else
       begin
         inc(IndElem);
       end;
    end;
  end;
  Inc(IndElem);
end;
//******************************************************************************
procedure TFrmMain.CurrParsePage(CountryId:Integer);
var i,j:integer;
    IDControlTable:string;
    SubEL:Olevariant;
    SubTR:Olevariant;
    SubTD:Olevariant;
    currClassName:String;
begin
  SubEL:=WebBrowser.OleObject.Document.getElementsByClassName( 'infobox geography' );
  if SubEL.length=0 then
    SubEL:=WebBrowser.OleObject.Document.getElementsByClassName( 'infobox' );

  if SubEL.length=0 then Exit;
  if SubEL.item(0).tagName<>'TABLE' then exit;

  SubTR := SubEL.item(0).rows;

  i:=0;
  While i <= SubTR.length-1 do
  begin
    currClassName := SubTR.item(i).classname;
    ParseValueAndTile( SubTR, i, FArrMasValue, CountryId );
  end;

end;
//******************************************************************************
procedure TFrmMain.WebBrowserDocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var El:variant;
    SubEL:variant;
    IDControlFlag:string;
    IDControlGerb:string;
    IDControlCapital:string;
begin
  CurrParsePage( Elem_Country.GetValueId );

  if not Elem_Country.DB.eof then
  begin
    Elem_Country.DB.Next;
    ParseRunCountry( DM.ParseByField );
  end
   else
   begin
     UpdateDBData( FArrMasValue );
     ShowMessage('Finish');
   end;
end;
//******************************************************************************
procedure TFrmMain.ParseRunCountry( FieldForSeacrh:String );
var CurrUrl:String;
    CurrCountry:WideString;
begin
  CurrCountry := Elem_Country.DB.FieldByName( FieldForSeacrh ).AsString;
  //ReplaseOn(CurrCountry,'i','і');
  ReplaseOn(CurrCountry,' ','_');

  CurrUrl:='https://uk.wikipedia.org/wiki/'+UrlEncode( CurrCountry );
  EdUrlForParse.Text := CurrUrl;
  WebBrowser.Navigate( EdUrlForParse.text );
end;

procedure TFrmMain.Button2Click(Sender: TObject);
begin
  SetLength(FArrMasValue,0);
  Elem_Country.DB.First;
  //Elem_Country.DB.Locate('COUNTRY_ID',235,[]);
  
  ParseRunCountry( DM.ParseByField );
end;

procedure TFrmMain.Button1Click(Sender: TObject);
begin
  ShowCountryDetail;

end;

end.





  {IDControlFlag:='"infobox geography vcard"/tbody/tr/tr/td/div/div/div/div/a/img';
  IDControlGerb:='"infobox geography vcard"/tbody/tr/tr/td/div/div/div/div/div/div/div/div/a/img';
  IDControlCapital:='"infobox geography vcard"/tbody/tr/tr/tr/tr/tr/td/a';

  SubEL:= FindElemByID(WebBrowser,IDControlFlag);
  ShowMessage(SubEL.SRC);

  SubEL:= FindElemByID(WebBrowser,IDControlGerb);
  ShowMessage(SubEL.SRC);

  SubEL:= FindElemByID(WebBrowser,IDControlCapital);
  ShowMessage(SubEL.InnerText);}
