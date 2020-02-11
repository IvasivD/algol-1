unit DictLIf;

interface

const
  dictBrowseCity = 1;
  dictBrowseDrive = 2;
  dictBrowseHotel = 3;
  dictBrowseHtlGrp = 4;
  dictBrowseHtlCtg = 5;
  dictBrowseRoomType = 6;
  dictBrowseService = 7;
  dictBrowseCurrency = 8;
  dictBrowseReklama = 9;
  dictBrowseBank = 10;
  dictBrowseCompany = 11;
  dictBrowseFeedType = 12;
  dictBrowseRoomView = 13;
  dictEditEnterprise = 121;
  dictEditReklama = 122;

var
  DictionLibLoaded: Boolean;

function ShowDictionaryBrowse(Dict, MId, DId, Man: Integer): Boolean;
function GetDictionaryParameter(Dict, MId, DId, Man: Integer): string;
function EditDictionaryRecord(
  Dict: Integer; var Id: Integer; EditState, Man: Integer): Boolean;
function EditClientProperty(var Id: Integer; EditState: Integer;
  var ContactId, OfficeId, HomeId, WorkId, MobileId, FaxId, EMailId, PagerId: Integer;
  Man: Integer): Boolean;
function EditEnterpriseProperty(var Id: Integer; EditState, Man: Integer): Boolean;
function EditVendorProperty(
  var VendId: Integer; ServKind: Integer; Man: Integer): Boolean;
{function SelectReklamaBrowse(var Id: Integer): WordBool;
function SelectCurrencyBrowse(var Id: Integer): WordBool;
function SelectRoomTypeBrowse(var Id: Integer): WordBool;
function SelectHotelCategoryBrowse(var Id: Integer): WordBool;
function SelectHotelGroupBrowse(var Id: Integer): WordBool;
function SelectBankBrowse(var Id: Integer): WordBool;
function SelectCountryBrowse(var MId, DId: Integer): WordBool;
function SelectCityBrowse(var MId, DId: Integer): WordBool;
function SelectServiceBrowse(var MId, DId: Integer): WordBool;
function SelectServiceGroupBrowse(var MId, DId: Integer): WordBool;
function SelectDriveBrowse(var MId, DId: Integer): WordBool;
function SelectDriveKindBrowse(var MId, DId: Integer): WordBool;
function SelectHotelBrowse(var MId, DId: Integer): WordBool;
function SelectCompanyBrowse(var MId, DId: Integer): WordBool;}

//procedure SetDictCurManager(ManId: Integer);

function LoadDictionLib(ShowFault: Boolean): Boolean;
procedure AssignLibHandle;
procedure FreeDictionLib;

implementation

uses Windows, Forms, SysUtils, StdCtrls, Graphics, TourCmnlIf, LIfConsts;

const // set of dictionary browser identificators what browse only one dataset
  dictBrowseOnlyOne = [
    dictBrowseHtlGrp, dictBrowseHtlCtg, dictBrowseRoomType, dictBrowseCurrency,
    dictBrowseReklama, dictBrowseBank, dictBrowseFeedType, dictBrowseRoomView];

type
  TOneBrowseProc = procedure(AppHandle: Cardinal; Id: Integer; Man: Integer);
  TTwoBrowseProc = procedure(AppHandle: Cardinal; MId, DId: Integer; Man: Integer);
  TOneSelectFunc = function(
    AppHandle: Cardinal; var Id: Integer; Man: Integer): WordBool;
  TTwoSelectFunc = function(
    AppHandle: Cardinal; var MId, DId: Integer; Man: Integer): WordBool;
  TAssignAppProc = procedure(AppHandle: LongWord);
  TEditRecrdFunc = function(
    AppHandle: Cardinal; Id, EditState: Integer; Man: Integer): Boolean;
  TEditClientFunc = function(AppHandle: Cardinal;
    var Id: Integer; EditState: Integer;
    var ContactId, OfficeId, HomeId, WorkId, MobileId, FaxId,
    EMailId, PagerId: Integer; Man: Integer): Boolean;
  TEditVendorFunc = function(AppHandle: Cardinal;
    var VendId: Integer; ServKind: Integer; Man: Integer): Boolean;

var
  OneBrowseProc: TOneBrowseProc;
  TwoBrowseProc: TTwoBrowseProc;
  OneSelectFunc: TOneSelectFunc;
  TwoSelectFunc: TTwoSelectFunc;
  AssignAppProc: TAssignAppProc;
  EditRecrdFunc: TEditRecrdFunc;
  EditClientFunc: TEditClientFunc;
  EditVendorFunc: TEditVendorFunc;

var
  AppHandle: Cardinal;
  LibHandle: THandle;

function CheckDictionLibLoaded: Boolean;
begin
  if not DictionLibLoaded then
  begin
    LoadDictionLib(True);
    if DictionLibLoaded then AssignLibHandle;
  end;
  Result := DictionLibLoaded and (LibHandle <> 0);
end;

{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}

procedure ExecOneBrowse(Proc: PChar; Id, Man: Integer);
begin
  if LibHandle <> 0 then
  begin
    @OneBrowseProc := GetProcAddress(LibHandle, Proc);
    if @OneBrowseProc <> nil then OneBrowseProc(AppHandle, Id, Man);
  end;
end;

procedure ExecTwoBrowse(Proc: PChar; MId, DId, Man: Integer);
begin
  if LibHandle <> 0 then
  begin
    @TwoBrowseProc := GetProcAddress(LibHandle, Proc);
    if @TwoBrowseProc <> nil then TwoBrowseProc(AppHandle, MId, DId, Man);
  end;
end;

function ExecOneSelect(Proc: PChar; var Id: Integer; Man: Integer): WordBool;
begin
  Result := False;
  if LibHandle <> 0 then
  begin
    @OneSelectFunc := GetProcAddress(LibHandle, Proc);
    if @OneSelectFunc <> nil then Result := OneSelectFunc(AppHandle, Id, Man);
  end;
end;

function ExecTwoSelect(Proc: PChar; var MId, DId: Integer; Man: Integer): WordBool;
begin
  Result := False;
  if LibHandle <> 0 then
  begin
    @TwoSelectFunc := GetProcAddress(LibHandle, Proc);
    if @TwoSelectFunc <> nil then Result := TwoSelectFunc(AppHandle, MId, DId, Man);
  end;
end;

function ExecEditRecord(Proc: PChar;
  var Id: Integer; EditState, Man: Integer): Boolean;
begin
  Result := False;
  if LibHandle <> 0 then
  begin
    @EditRecrdFunc := GetProcAddress(LibHandle, Proc);
    if @EditRecrdFunc <> nil then Result := EditRecrdFunc(AppHandle, Id, EditState, Man);
  end;
end;

procedure ShowReklamaBrowse(Id, Man: Integer);
begin
  ExecOneBrowse('ShowReklamaBrowse', Id, Man);
end;

procedure ShowCurrencyBrowse(Id, Man: Integer);
begin
  ExecOneBrowse('ShowCurrencyBrowse', Id, Man);
end;

procedure ShowRoomTypeBrowse(Id, Man: Integer);
begin
  ExecOneBrowse('ShowRoomTypeBrowse', Id, Man);
end;

procedure ShowRoomViewBrowse(Id, Man: Integer);
begin
  ExecOneBrowse('ShowRoomViewBrowse', Id, Man);
end;

procedure ShowFeedTypeBrowse(Id, Man: Integer);
begin
  ExecOneBrowse('ShowFeedTypeBrowse', Id, Man);
end;

procedure ShowHotelCategoryBrowse(Id, Man: Integer);
begin
  ExecOneBrowse('ShowHotelCategoryBrowse', Id, Man);
end;

procedure ShowHotelGroupBrowse(Id, Man: Integer);
begin
  ExecOneBrowse('ShowHotelGroupBrowse', Id, Man);
end;

procedure ShowBankBrowse(Id, Man: Integer);
begin
  ExecOneBrowse('ShowBankBrowse', Id, Man);
end;

procedure ShowCityBrowse(MId, DId, Man: Integer);
begin
  ExecTwoBrowse('ShowCityBrowse', MId, DId, Man);
end;

procedure ShowServiceBrowse(MId, DId, Man: Integer);
begin
  ExecTwoBrowse('ShowServiceBrowse', MId, DId, Man);
end;

procedure ShowDriveBrowse(MId, DId, Man: Integer);
begin
  ExecTwoBrowse('ShowDriveBrowse', MId, DId, Man);
end;

procedure ShowHotelBrowse(MId, DId, Man: Integer);
begin
  ExecTwoBrowse('ShowHotelBrowse', MId, DId, Man);
end;

procedure ShowCompanyBrowse(MId, DId, Man: Integer);
begin
  ExecTwoBrowse('ShowCompanyBrowse', MId, DId, Man);
end;

function SelectReklamaBrowse(var Id: Integer; Man: Integer): WordBool;
begin
  Result := ExecOneSelect('SelectReklamaBrowse', Id, Man);
end;

function SelectCurrencyBrowse(var Id: Integer; Man: Integer): WordBool;
begin
  Result := ExecOneSelect('SelectCurrencyBrowse', Id, Man);
end;

function SelectRoomTypeBrowse(var Id: Integer; Man: Integer): WordBool;
begin
  Result := ExecOneSelect('SelectRoomTypeBrowse', Id, Man);
end;

function SelectFeedTypeBrowse(var Id: Integer; Man: Integer): WordBool;
begin
  Result := ExecOneSelect('SelectFeedTypeBrowse', Id, Man);
end;

function SelectHotelCategoryBrowse(var Id: Integer; Man: Integer): WordBool;
begin
  Result := ExecOneSelect('SelectHotelCategoryBrowse', Id, Man);
end;

function SelectHotelGroupBrowse(var Id: Integer; Man: Integer): WordBool;
begin
  Result := ExecOneSelect('SelectHotelGroupBrowse', Id, Man);
end;

function SelectBankBrowse(var Id: Integer; Man: Integer): WordBool;
begin
  Result := ExecOneSelect('SelectBankBrowse', Id, Man);
end;

function SelectCountryBrowse(var MId, DId: Integer; Man: Integer): WordBool;
begin
  Result := ExecTwoSelect('SelectCountryBrowse', MId, DId, Man);
end;

function SelectCityBrowse(var MId, DId: Integer; Man: Integer): WordBool;
begin
  Result := ExecTwoSelect('SelectCityBrowse', MId, DId, Man);
end;

function SelectServiceBrowse(var MId, DId: Integer; Man: Integer): WordBool;
begin
  Result := ExecTwoSelect('SelectServiceBrowse', MId, DId, Man);
end;

function SelectServiceGroupBrowse(var MId, DId: Integer; Man: Integer): WordBool;
begin
  Result := ExecTwoSelect('SelectServiceGroupBrowse', MId, DId, Man);
end;

function SelectDriveBrowse(var MId, DId: Integer; Man: Integer): WordBool;
begin
  Result := ExecTwoSelect('SelectDriveBrowse', MId, DId, Man);
end;

function SelectDriveKindBrowse(var MId, DId: Integer; Man: Integer): WordBool;
begin
  Result := ExecTwoSelect('SelectDriveKindBrowse', MId, DId, Man);
end;

function SelectHotelBrowse(var MId, DId: Integer; Man: Integer): WordBool;
begin
  Result := ExecTwoSelect('ShowHotelBrowse', MId, DId, Man);
end;

function SelectCompanyBrowse(var MId, DId: Integer; Man: Integer): WordBool;
begin
  Result := ExecTwoSelect('SelectCompanyBrowse', MId, DId, Man);
end;

function ShowDictionaryBrowse(Dict, MId, DId, Man: Integer): Boolean;
begin
  Result := CheckDictionLibLoaded;
  if Result then
    case Dict of
      dictBrowseCity: ShowCityBrowse(MId, DId, Man);
      dictBrowseDrive: ShowDriveBrowse(MId, DId, Man);
      dictBrowseHotel: ShowHotelBrowse(MId, DId, Man);
      dictBrowseHtlGrp: ShowHotelGroupBrowse(DId, Man);
      dictBrowseHtlCtg: ShowHotelCategoryBrowse(DId, Man);
      dictBrowseRoomType: ShowRoomTypeBrowse(DId, Man);
      dictBrowseRoomView: ShowRoomViewBrowse(DId, Man);
      dictBrowseService: ShowServiceBrowse(MId, DId, Man);
      dictBrowseCurrency: ShowCurrencyBrowse(DId, Man);
      dictBrowseReklama: ShowReklamaBrowse(DId, Man);
      dictBrowseBank: ShowBankBrowse(DId, Man);
      dictBrowseCompany: ShowCompanyBrowse(MId, DId, Man);
      dictBrowseFeedType: ShowFeedTypeBrowse(DId, Man);
    end;
end;

function EditEnterpriseProperty(var Id: Integer; EditState, Man: Integer): Boolean;
begin
  Result := CheckDictionLibLoaded
    and ExecEditRecord('EditEnterpriseProperty', Id, EditState, Man);
end;

function EditReklamaRecord(var Id: Integer; EditState, Man: Integer): Boolean;
begin
  Result := CheckDictionLibLoaded
    and ExecEditRecord('ExecReklamaEdit', Id, EditState, Man);
end;

function EditClientProperty(var Id: Integer; EditState: Integer;
  var ContactId, OfficeId, HomeId, WorkId, MobileId, FaxId, EMailId, PagerId: Integer;
  Man: Integer): Boolean;
begin
  Result := False;
  if CheckDictionLibLoaded then
  begin
    @EditClientFunc := GetProcAddress(LibHandle, 'EditClientProperty');
    if @EditClientFunc <> nil then
      Result := EditClientFunc(AppHandle, Id, EditState, ContactId, OfficeId,
        HomeId, WorkId, MobileId, FaxId, EMailId, PagerId, Man);
  end;
end;

function EditVendorProperty(
  var VendId: Integer; ServKind: Integer; Man: Integer): Boolean;
begin
  Result := CheckDictionLibLoaded;
  if Result then
  begin
    @EditVendorFunc := GetProcAddress(LibHandle, 'EditVendorProperty');
    if @EditVendorFunc = nil then Result := False
    else Result := EditVendorFunc(AppHandle, VendId, ServKind, Man);
  end;
end;

function EditDictionaryRecord(
  Dict: Integer; var Id: Integer; EditState, Man: Integer): Boolean;
begin
  Result := CheckDictionLibLoaded;
  if Result then
    case Dict of
      dictEditEnterprise: Result := EditEnterpriseProperty(Id, EditState, Man);
      dictEditReklama: Result := EditReklamaRecord(Id, EditState, Man);
    end;
end;

function GetDictionaryParameter(Dict, MId, DId, Man: Integer): string;
begin
  case Dict of
    dictBrowseCity: Result := 'City';
    dictBrowseDrive: Result := 'Drive';
    dictBrowseHotel: Result := 'Hotel';
    dictBrowseHtlGrp: Result := 'HotelGroup';
    dictBrowseHtlCtg: Result := 'HotelCateg';
    dictBrowseRoomType: Result := 'RoomType';
    dictBrowseService: Result := 'Service';
    dictBrowseCurrency: Result := 'Currency';
    dictBrowseReklama: Result := 'Reklama';
    dictBrowseBank: Result := 'Bank';
    dictBrowseCompany: Result := 'Company';
    dictBrowseFeedType: Result := 'FeedType';
    else Result := '';
  end;
  if Dict in dictBrowseOnlyOne then Result := Result + '+0+' + IntToStr(DId)
  else Result := Result + '+' + IntToStr(MId) + '+' + IntToStr(DId);
end;

procedure AssignLibHandle;
begin
  if LibHandle <> 0 then
  begin
    @AssignAppProc := GetProcAddress(LibHandle, 'AssignAppHandle');
    if @AssignAppProc <> nil then AssignAppProc(Application.MainForm.Handle);
  end;
end;

{$WARN UNSAFE_CODE ON}
{$WARN UNSAFE_TYPE ON}

function LoadingMessageForm: TForm;
begin
  Result := TForm.Create(Application);
  with Result do
  begin
    BiDiMode := Application.BiDiMode;
    BorderStyle := bsSingle;
    BorderIcons := [];
    Caption := Application.Title;
    ClientHeight := 65;
    ClientWidth := 266;
    Font.Color := clWindowText;
    Position := poScreenCenter;
    FormStyle := fsStayOnTop;
    with TLabel.Create(Result) do
    begin
      Left := 16;
      Top := 24;
      Parent := Result;
      Caption := SLibLoadDictionPrompt;
      Result.Width := Left * 2 + Width;
    end;
    Show;
    Update;
  end;
end;

function LoadDictionLib(ShowFault: Boolean): Boolean;
//var Msg: TForm;
begin
  //Msg := LoadingMessageForm;
  LibHandle := LoadLibrary('Dictionl.dll');
  Result := LibHandle <> 0;
  //if Assigned(Msg) then Msg.Free;
  if not Result and ShowFault then ErrorDlg(SLibLoadDictionFatal);
  DictionLibLoaded := Result;
end;

procedure FreeDictionLib;
begin
  FreeLibrary(LibHandle);
  DictionLibLoaded := False;
end;

initialization      
  AppHandle := Application.Handle;
  DictionLibLoaded := False;
finalization
  if DictionLibLoaded then FreeDictionLib;
end.
