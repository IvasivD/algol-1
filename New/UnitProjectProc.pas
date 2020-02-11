unit UnitProjectProc;

interface
uses
  Windows, Messages, Classes, Controls, StdCtrls, Grids, Graphics, ComCtrls,
  DB, DBCtrls, DBGrids,  Mask, cxImageComboBox, IdHTTP, SysUtils,
  cxHyperLinkEdit, cxDBEdit, ShellAPI, Core, UnitProc,cxCalendar,variants,ShFolder,
  Buttons, ActnList, CheckLst,Spin, DBCtrlsEh,TourConsts,ListActns,jpeg;

Const  clEditControlColors: array[Boolean] of TColor = (clBtnFace, clInfoBk);
const
   // edit dialog modes
  remStateEdit = 0;
  remStateAppend = 1;
  remStateCopy = 2;

  // reklama source preset types
  nReklamaPresetAgent = 1;
  nReklamaPresetRecidive = 2;

  // Send By constants
  nSendByEmail = 1;
  nSendByFax = 2;
  nSendByPhone = 3;

  // phone number kinds
  nPhoneKindNone = -1;
  nPhoneKindHome = 0;
  nPhoneKindWork = 1;
  nPhoneKindMobil = 2;
  //
  nRowNotModify = 0;  
  nRowAdd = 1;
  nRowDel = 2;
  nRowModify = 3;

  nLogCategoryNone = 0;
  nLogCategoryOrder = 1;
  nLogCategoryTrip = 2;
  nLogCategoryVisa = 3;
  nLogCategoryInsure = 4;
  nLogCategoryHotel = 5;
  nLogCategoryTourist = 6;
  nLogCategoryDict = 7;
  nLogSubCategOrderChgClient = 1;
  nLogSubCategOrderDelService = 2;
  nLogSubCategOrderAnnul = 3;
  nLogSubCategOrderRestore = 4;
  nLogSubCategTripPlaceMove = 5;
  nLogSubCategTripPlaceFree = 6;
  nLogSubCategVisaDocumState = 7;
  nLogSubCategInsurePoliceTrash = 8;
  nLogSubCategInsurePoliceRereg = 9;
  nLogSubCategTripPlaceEdit = 10;
  nLogSubCategVisaRefuse = 11;
  nLogSubCategTripRouteDelete = 12;
  nLogSubCategTripSheduleDelete = 13;
  nLogSubCategTripTripDelete = 14;
  nLogSubCategHotelPlaceAdd = 15;
  nLogSubCategHotelPlaceEdit = 16;
  nLogSubCategHotelPlaceChng = 17;
  nLogSubCategHotelPlaceMove = 18;
  nLogSubCategHotelPlaceFree = 19;
  nLogSubCategHotelBatchMove = 20;
  nLogSubCategHotelOrderFree = 21;
  nLogSubCategHotelPlaceQueue = 22;
  nLogSubCategTripPlaceQueue = 23;
  nLogSubCategHotelBatchCopy = 24;
  nLogSubCategOrderApplyTempl = 25;
  nLogSubCategOrderMoveToOther = 26;
  nLogSubCategOrderPrsnRefused = 27;
  nLogSubCategTripPlaceChange = 28;
  nLogSubCategOrderPrsnDelete = 29;
  nLogSubCategTouristNameChange = 30;
  nLogSubCategTouristBirthChange = 31;
  nLogSubCategDictContractCreate = 32;
  nLogSubCategDictContractSent = 33;
  nLogSubCategDictContractCopyAttach = 34;
  nLogSubCategDictContractPrint = 35;
  nLogSubCategDictContractUsSign = 36;
  nLogSubCategDictContractSentOrig = 37;
  nLogSubCategDictContractPartnerSign = 38;
  nLogSubCategDictContractReestr = 39;
  nLogSubCategDictContractExtend = 40;
  nLogSubCategDictContractReReestr = 41;
  nLogSubCategDictContractSuspend = 42;
  nLogSubCategDictContractCancel = 43;
  nLogSubCategDictContractRestore = 44;
  nLogSubCategDictContractEnd = 45;
  nLogSubCategDictContractRepair = 46;
  nLogSubCategDictContractFinish = 47;
  nLogSubCategDictContractPermReReestr = 48;
  nLogSubCategDictContractPromiseRcvOrg = 49;
  nLogSubCategVisaFiilingDate = 50;
  nLogSubCategVisaFillingWho = 51;
  nLogSubCategVisaBioDate = 52;
  nLogSubCategVisaGivingDate = 53;
  nLogSubCategDictContractLast = nLogSubCategDictContractPromiseRcvOrg;
  nLogActionNone = 0;
  nLogActionAppend = 1;
  nLogActionModify = 2;
  nLogActionDelete = 3;

  nContractCreate = 0;
  nContractSendMail = 1;
  nContractPrint = 2;
  nContractSign = 3;
  nContractRcvCopy = 4;
  nContractSentOrig = 5;
  nContractRcvOrig = 6;
  nContractReestr = 7;
  nContractExtend = 8;  
  nContractReReestr = 9;
  nContractFinish = 10;
  nContractPermReReestr = 11;
  nContractPromiseRcvOrg = 12;

  nTourServiceTrip = 0;
  nTourServiceHotel = 1;
  nTourServiceInsure = 2;
  nTourServiceVisa = 3;
  nTourServiceExcurs = 4;
  nTourServiceResort = 5;
  nTourServiceOther = 6;

  pCityIdents: array[0..7] of Pointer = (@SVDlgsCity0, @SVDlgsCity1,
    @SVDlgsCity2, @SVDlgsCity3, @SVDlgsCity4, @SVDlgsCity5, @SVDlgsCity6, @SVDlgsCity7);
  pStreetIdents: array[0..12] of Pointer = (@SVDlgsStreet0, @SVDlgsStreet1,
    @SVDlgsStreet2, @SVDlgsStreet3, @SVDlgsStreet4, @SVDlgsStreet5,
    @SVDlgsStreet6, @SVDlgsStreet7, @SVDlgsStreet8, @SVDlgsStreet9,
    @SVDlgsStreet10, @SVDlgsStreet11, @SVDlgsStreet12);
  pRelativeIdents: array[0..3] of Pointer = (
    @SVDlgsRelative0, @SVDlgsRelative1, @SVDlgsRelative2, @SVDlgsRelative3);
  pMarriedMUaIdents: array[0..4] of Pointer = (@SVDlgsMarriedMUa0,
    @SVDlgsMarriedMUa1, @SVDlgsMarriedMUa2, @SVDlgsMarriedMUa3, @SVDlgsMarriedMUa4);
  pMarriedFUaIdents: array[0..4] of Pointer = (@SVDlgsMarriedFUa0,
    @SVDlgsMarriedFUa1, @SVDlgsMarriedFUa2, @SVDlgsMarriedFUa3, @SVDlgsMarriedFUa4);
  pMarriedMEnIdents: array[0..4] of Pointer = (@SVDlgsMarriedMEn0,
    @SVDlgsMarriedMEn1, @SVDlgsMarriedMEn2, @SVDlgsMarriedMEn3, @SVDlgsMarriedMEn4);
  pMarriedFEnIdents: array[0..4] of Pointer = (@SVDlgsMarriedFEn0,
    @SVDlgsMarriedFEn1, @SVDlgsMarriedFEn2, @SVDlgsMarriedFEn3, @SVDlgsMarriedFEn4);

type
  nLogSubCategDictContractArr = nLogSubCategDictContractCreate..nLogSubCategDictContractLast;

Procedure UpdatePrefixCountryCode( Sender:TObject; Elem:TDBShemaView; OfficeId:Variant );
function  GetPhoneCodeCountryForOfficeId( ConDBParam:TConnectDBParam; idOffice:Variant):Variant;
function  CallLink( aHandle:THandle; UserNameValue, WebLink:WideString):boolean;
function  GetSpecialFolderPath(folder : integer) : string;
procedure ToggleGroupControls(GroupBox: TCustomControl; Enable: Boolean);
procedure ToggleControlEnabled(Control: TControl; Enable: Boolean);
procedure SetFileAttrib(const DocName: String; Hide, Read: Boolean; IsFolder: Boolean = False);
procedure SetFileHidden(const DocName: String; IsFolder: Boolean = False);
function  GetLocalFileName(const FileName: string): string;

function MakePhoneNo(
  const CntryCode, AreaCode, PhoneNo: String; const PhoneExt: String = '';
  AddPrefix: Boolean = False; const FmtStr: String = ''): String;

function GetOfficeAddressString(
  SKnd, Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry: TField): string;

procedure GetOfficeAddress(Address: TStrings;
  SKnd, Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry: TField;
  Clean: Boolean = True);
procedure MarriedIdentsToStrings(Ua, Male: Boolean; Strings: TStrings);
procedure DataFieldToStrings(Field, Key: TField; Strings: TStrings;
  Cleanup: Boolean = True; BoolField: TField = nil);

procedure DataSetToListItems(
  Field, Key, ImgFile: TField; const ImgPath: String;
  Items: TListControlItems; Images: TImageList; Cleanup: Boolean = True;
  AddExt: String = '');

function  SQLWhereStatementOr(const Where, Add: String): String;
function  GetSystemWorkArea(var WorkRect: TRect): Boolean;
procedure CityIdentsToStrings(Strings: TStrings);
function  CityIdent(Id: Integer): string;

implementation

function GetPhoneCodeCountryForOfficeId( ConDBParam:TConnectDBParam; idOffice:Variant):Variant;
var Sql : WideString;
begin
  result := '';
  if idOffice = null then Exit;

  Sql := ' select COUNTRIES_INFO.avalue from COMPOFFICES '+
         ' left join city_adm_unit on city_adm_unit.id = COMPOFFICES.id_city_adm_unit '+
         ' left join COUNTRIES_INFO on COUNTRIES_INFO.id_countries = city_adm_unit.id_country '+
         ' where COMPOFFICES.officeid = '+VarToStr( idOffice) +' and COUNTRIES_INFO.id_countries_type_info =14 ';
  result := DBGetValue(ConDBParam,  SQL, 'avalue' );
end;

Procedure UpdatePrefixCountryCode( Sender:TObject; Elem:TDBShemaView; OfficeId:Variant );
var DisplayText:variant;
    UseCountryCode:Integer;
    CurrPhoneCode:Variant;
    CaptionRow : widestring;
    MaskTemplate : TMasMaskTemplate;
begin
   if OfficeId = null then Exit;

   CaptionRow:=Elem.View.GetColumnByFieldName('AVALUE').Caption;
   DisplayText := Elem.GetVerticalGridGridByCaptionValue( CaptionRow );
   MaskTemplate := Elem.FindMaskTemplateFieldForField( 'AVALUE' );
   UseCountryCode := TDBShema(MaskTemplate.ElemeSource).DB.FieldByName('USECODECOUNTRY').AsInteger;

   if (Elem.DB.State in [dsInsert])and
      ( (DisplayText=null)or(DisplayText =  Unassigned)or(DisplayText = '+') ) then
   begin
     if ( UseCountryCode = 1 ) then // 1 - Prefix Code Country
     begin
       CurrPhoneCode := GetPhoneCodeCountryForOfficeId( Elem.DBGetParamConnect,OfficeId );
       if CurrPhoneCode <> null then
         Elem.UpdateVerticalGridByCaptionValue( Sender, CaptionRow, CurrPhoneCode);
     end
     else Elem.UpdateVerticalGridByCaptionValue( Sender, CaptionRow, '');
   end;
end;

function GetSpecialFolderPath(folder : integer) : string;
const
  SHGFP_TYPE_CURRENT = 0;
var
  path: array [0..MAX_PATH] of char;
begin
  if SUCCEEDED(SHGetFolderPath(0, folder, 0, SHGFP_TYPE_CURRENT, @path[0]))
  then Result := path
  else Result := '';
end;


function CallLink( aHandle:THandle; UserNameValue, WebLink:WideString):boolean;
var FidHTTP:TIdHTTP;
    ACource:TStrings;
    CurrLink:String;
begin
  if Trim( WebLink )<>'' then
  begin
    ReplaseON( WebLink,'#username',UserNameValue);
    ReplaseON( WebLink,'#PROGRAM_FILES', GetSpecialFolderPath(CSIDL_PROGRAM_FILES) );

    CurrLink := WebLink;
    ShellExecute(aHandle, 'open',PChar(CurrLink),nil,nil, SW_SHOWNORMAL);

    result := True;
  end
  else Result :=  false;
end;

procedure ToggleGroupControls(GroupBox: TCustomControl; Enable: Boolean);
var I: Integer;
begin
  with GroupBox do
  begin
    Enabled := Enable;
    for I := 0 to ControlCount - 1 do
    begin
      ToggleControlEnabled(Controls[I], Enable);
      if (Controls[I] is TCustomControl)
        and ((Controls[I] as TCustomControl).ControlCount > 0)
        then ToggleGroupControls(Controls[I] as TCustomControl, Enable);
    end;
  end;
end;

procedure ToggleControlEnabled(Control: TControl; Enable: Boolean);
begin
  if (Control is TSpeedButton) and Assigned(Control.Action) then
    (Control.Action as TCustomAction).Enabled := Enable
  else if not (Control is TLabel) or Assigned((Control as TLabel).FocusControl)
  then Control.Enabled := Enable;
  if Control is TEdit then
    with Control as TEdit do
      Color := clEditControlColors[Enabled and not ReadOnly]
  else if Control is TDBEdit then
    with Control as TDBEdit do
      Color := clEditControlColors[Enabled and not ReadOnly]
  else if Control is TComboBox then
    (Control as TComboBox).Color := clEditControlColors[Enable]
  //else if Control is TAzComboBox then
    //(Control as TAzComboBox).Color := clEditControlColors[Enable]
  else
  if Control is TDBComboBox then
    with Control as TDBComboBox do
      Color := clEditControlColors[Enabled and not ReadOnly]
  else if Control is TDBLookupComboBox then
    with Control as TDBLookupComboBox do
      Color := clEditControlColors[Enabled and not ReadOnly]
  else if Control is TListBox then
    (Control as TListBox).Color := clEditControlColors[Enable]
  else if Control is TCheckListBox then
    (Control as TCheckListBox).Color := clEditControlColors[Enable]
  else if Control is TDBLookupListBox then
    with Control as TDBLookupListBox do
      Color := clEditControlColors[Enabled and not ReadOnly]
  else if Control is TDateTimePicker then
    (Control as TDateTimePicker).Color := clEditControlColors[Enable]
  else if Control is TSpinEdit then
    with Control as TSpinEdit do
      Color := clEditControlColors[Enabled and not ReadOnly]
  else if Control is TDBGrid then
    with Control as TDBGrid do
      Color := clEditControlColors[Enabled and not ReadOnly]
  else if Control is TDrawGrid then
    (Control as TDrawGrid).Color := clEditControlColors[Enable]
  else if Control is TMemo then
    with Control as TMemo do
      Color := clEditControlColors[Enabled and not ReadOnly]
  else if Control is TDBMemo then
    with Control as TDBMemo do
      Color := clEditControlColors[Enabled and not ReadOnly]
  else if Control is TRichEdit then
    with Control as TRichEdit do
      Color := clEditControlColors[Enabled and not ReadOnly]
  else if Control is TDBRichEdit then
    with Control as TDBRichEdit do
      Color := clEditControlColors[Enabled and not ReadOnly]
  else if Control is TMaskEdit then
    with Control as TMaskEdit do
      Color := clEditControlColors[Enabled and not ReadOnly]
  else if Control is TcxHyperLinkEdit then
    with Control as TcxHyperLinkEdit do
      Style.Color := clEditControlColors[Enabled and not Properties.ReadOnly]
  else if Control is TDBDateTimeEditEh then
    with Control as TDBDateTimeEditEh do
      Color := clEditControlColors[Enabled and not ReadOnly]      
  //else if Control is TAdvDateTimePicker then
  //  with Control as TAdvDateTimePicker do Color := clEditControlColors[Enabled]
  else if Control is TComboBoxEx then
    (Control as TComboBoxEx).Color := clEditControlColors[Enable]
end;

procedure SetFileAttrib(const DocName: String; Hide, Read: Boolean; IsFolder: Boolean = False);
var Attr: Integer;
begin
  Attr := 0;
  if Read then Attr := Attr + faReadOnly;
  if Hide then Attr := Attr + faHidden;
  if IsFolder then Attr := Attr + faArchive;
  FileSetAttr(DocName, Attr);
end;

procedure SetFileHidden(const DocName: String; IsFolder: Boolean = False);
begin
  if IsFolder then FileSetAttr(DocName, faHidden)
  else FileSetAttr(DocName, faHidden + faArchive);
end;

function MakePhoneNo(
  const CntryCode, AreaCode, PhoneNo: String; const PhoneExt: String = '';
  AddPrefix: Boolean = False; const FmtStr: String = ''): String;
var
  CalcArea: String;
  LeadZero: Boolean;
begin
  LeadZero := CntryCode = '380';  // stub - may be found in the Countries table
  if LeadZero and (AreaCode <> '') and (AreaCode[1] = '0') then
    CalcArea := Copy(AreaCode, 2, Length(AreaCode))
  else CalcArea := AreaCode;
  if FmtStr = '' then
  begin
    Result := Trim(CntryCode + #32 + CalcArea + #32 + PhoneNo);
    if PhoneExt <> '' then Result := Trim(Result + #32 + PhoneExt);
    if AddPrefix and (Result <> '') and (CntryCode <> '') then
      Result := '+' + Result;
  end
  else Result := Format(FmtStr, [CntryCode, CalcArea, PhoneNo, PhoneExt]);
end;

procedure ResourceToStrings(Strings: TStrings; Res: array of Pointer; AddAsObject: Boolean = False);
var I: Integer;
begin
  if Assigned(Strings) then
    with Strings do
    begin
      Clear;
      for I := 0 to High(Res) do
        if AddAsObject then AddObject(LoadResString(Res[I]), Pointer(I))
        else Add(LoadResString(Res[I]));
    end;
end;

function StreetIdent(Id: Integer): string;
begin
  Result := LoadResString(pStreetIdents[Id]);
end;

function CityIdent(Id: Integer): string;
begin
  if Id = 0 then Result := '' else Result := LoadResString(pCityIdents[Id]);
end;

procedure CityIdentsToStrings(Strings: TStrings);
begin
  ResourceToStrings(Strings, pCityIdents);
end;

procedure GetOfficeAddress(Address: TStrings;
  SKnd, Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry: TField;
  Clean: Boolean = True);
var Adr: string;
begin
  Adr := House.AsString; // hause
  if Assigned(Ten) then
    with Ten do // + tenement
      if AsString <> '' then Adr := Format('%s, ξτ³ρ %s', [Adr, AsString]);
  with Address do
  begin
    if Clean then Clear;
    with Addr do // address
      if Trim(Adr) = '' then
        Adr := AsString else Adr := Format('%s, %s', [AsString, Adr]);
    if Assigned(SKnd) and not SKnd.IsNull then
      Adr := StreetIdent(SKnd.AsInteger) + #32 + Adr;
    Add(Adr);
    Adr := City.AsString; // city
    if Assigned(CKnd) then Adr := CityIdent(CKnd.AsInteger) + #32 + Adr;
    if Assigned(TShp) then
      with TShp do
        if AsString <> '' then Adr := Adr + #32 + AsString; // + township
    Add(Trim(Adr));
    if Assigned(Prov) then
      with Prov do if AsString <> '' then Add(AsString); // province
    if Assigned(Zip) then Adr := Zip.AsString else Adr := ''; // zip code
    if Assigned(Cntry) then Adr := Adr + '  ' + Cntry.AsString; // country
    if Adr <> '' then Add(Trim(Adr));
  end;
end;

function GetOfficeAddressString(
  SKnd, Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry: TField): string;
var
  Address: TStrings;
  I: Integer;
begin
  Result := '';
  Address := TStringList.Create;
  try
    GetOfficeAddress(Address,
      SKnd, Addr, House, Ten, CKnd, City, TShp, Prov, Zip, Cntry);
    with Address do
      for I := 0 to Count - 1 do
        if Strings[I] <> '' then Result := Result + Strings[I] + #32;
  finally
    Address.Free;
  end;
end;

procedure MarriedIdentsToStrings(Ua, Male: Boolean; Strings: TStrings);
begin
  if Ua then
    case Male of
      False: ResourceToStrings(Strings, pMarriedFUaIdents);
      True: ResourceToStrings(Strings, pMarriedMUaIdents);
    end
  else
    case Male of
      False: ResourceToStrings(Strings, pMarriedFEnIdents);
      True: ResourceToStrings(Strings, pMarriedMEnIdents);
    end;
end;

procedure DataFieldToStrings(Field, Key: TField; Strings: TStrings;
  Cleanup: Boolean = True; BoolField: TField = nil);
{$WARN UNSAFE_TYPE OFF}
var
  Calc: TDataSetNotifyEvent;
  Mrk: TBookmark;
  StrVal: String;
begin
  if Cleanup then Strings.Clear;

  if not Field.DataSet.Active then Field.DataSet.Open;
  Mrk := Field.DataSet.GetBookmark;
  Calc := Field.DataSet.OnCalcFields;

  try
    Field.DataSet.DisableControls;
    Field.DataSet.First;
    while not Field.DataSet.Eof do
    begin
      if not Field.IsNull and (not Assigned(BoolField) or not BoolField.AsBoolean) then
      begin

        if Field.DataType in [ftDate, ftTime, ftDateTime] then StrVal := Field.DisplayText
        else StrVal := Field.AsString;

        if Assigned(Key) then
          Strings.AddObject(StrVal, Pointer(Key.AsInteger))
        else Strings.AddObject(StrVal, Pointer(Field.DataSet.GetBookmark));

      end;
      Field.DataSet.Next;
    end;

  finally
    Field.DataSet.OnCalcFields := Calc;
    Field.DataSet.GotoBookmark(Mrk);
    Field.DataSet.FreeBookmark(Mrk);
    Field.DataSet.EnableControls;
  end;

{$WARN UNSAFE_TYPE ON}
end;

procedure DataSetToListItems(
  Field, Key, ImgFile: TField; const ImgPath: String;
  Items: TListControlItems; Images: TImageList; Cleanup: Boolean = True;
  AddExt: String = '');
{$WARN UNSAFE_TYPE OFF}
var
  Calc: TDataSetNotifyEvent;
  Mrk: TBookmark;
  Jpg: TJPEGImage;
  Bmp: TBitmap;
  FN: String;
  Rct: TRect;
begin
  if Cleanup then
  begin
    Items.Clear;
    Images.Clear;
  end;
  Jpg := TJPEGImage.Create;
  Bmp := TBitmap.Create;
  with Field, DataSet do
  try
    Bmp.Width := Images.Width;
    Bmp.Height := Images.Height;
    if not Active then Open;
    Mrk := GetBookmark;
    Calc := OnCalcFields;
    try
      DisableControls;
      First;
      while not Eof do
      begin
        if not IsNull then
          with Items.Add do
          begin
            Caption := AsString;
            if Assigned(Key) then Data := Pointer(Key.AsInteger);
            if Assigned(ImgFile) then
            begin
              FN := IncludeTrailingPathDelimiter(ImgPath) + ImgFile.AsString + AddExt;
              if FileExists(FN) then
              begin
                Jpg.LoadFromFile(FN);
                Rct := Bmp.Canvas.ClipRect;
                Bmp.Canvas.StretchDraw(Rct, Jpg);
                ImageIndex := Images.AddMasked(Bmp, clInfoBk);
              end
              else ImageIndex := -1;
            end;
          end;
        Next;
      end;
    finally
      OnCalcFields := Calc;
      GotoBookmark(Mrk);
      FreeBookmark(Mrk);
      EnableControls;
    end;
  finally
    Bmp.Free;
    Jpg.Free;
  end;
{$WARN UNSAFE_TYPE ON}
end;

function SQLWhereStatementAdd(const Where, Add: String): String;
begin     // adding condition to Where statement
  if Trim(Add) = '' then Result := Where
  else if Trim(Where) = '' then Result := Add
  else Result := Where + ' and ' + Add;
end;

function SQLWhereStatementOr(const Where, Add: String): String;
begin     // adding 'or' condition to Where statement
  if Trim(Add) = '' then Result := Where
  else if Trim(Where) = '' then Result := Add
  else Result := Where + ' or ' + Add;
end;


function GetSystemWorkArea(var WorkRect: TRect): Boolean;
begin
  {$WARN UNSAFE_CODE OFF}
  Result := SystemParametersInfo(SPI_GETWORKAREA, 0, @WorkRect, 0);
  {$WARN UNSAFE_CODE ON}
end;

function GetLocalFileName(const FileName: string): string;
var
  Comp: array[0..255] of Char;
  SComp: string;
  N: Cardinal;
begin
  Result := FileName;
//  Result := ExpandUNCFileName(FileName);
  if (Length(Result) > 1) and (Result[2] <> ':') // UNC file name
    and GetComputerName(Comp, N)
    then begin
    SComp := AnsiUpperCase(Comp);
    if AnsiUpperCase(Copy(Result, 3, N)) = SComp then
    begin // file allocate on locale computer
      System.Delete(Result, 1, N + 3);
      Result := Result[1] + ':' + Copy(Result, 2, Length(Result));
    end;
  end;
end;


end.
 