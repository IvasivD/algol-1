unit EmbassyListfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZDlg, StdCtrls, CheckLst, Buttons, ExtCtrls, DB, DBTables,IBQuery,
  IBCustomDataSet;

type
  TEmbassyListForm = class(TForm)
    EmbassyCheckListBox: TCheckListBox;
    EmbassyListQry: TIBQuery;
    EmbassyListQryCOMPANYID: TIntegerField;
    EmbassyListQryEMBASSYID: TIntegerField;
    EmbassyListQryEMBASSYNAME: TIBStringField;
  private
    { Private declarations }
  procedure StoreEmbassies_New(List: TCheckListBox; ATag: Integer);

  public
    { Public declarations }
  end;
function ExecuteEmbassyListEdit(Capt: String; EmbQry: TIBQuery;
    ATag: Integer): Boolean;

//var
//  ZDialog1: TZDialog1;


implementation

uses ServMod, OptSet, TourDbUn;

const OurEmbass: array[3..4] of string = ('T', 'F');

function GatherEmbassValue(List: TCheckListBox): String;
var I, Id: Integer;
begin
  Result := EmptyStr;
  with List do
  for I := 0 to Items.Count - 1 do
  begin
    if Checked[I] then
    begin
      {$WARN UNSAFE_CAST OFF}
      with Items do Id := Integer(Objects[I]);
      if Id > 0 then Result := Result + IntToStr(Id) + ';';
      {$WARN UNSAFE_CAST ON}
    end;
  end;
  if Length(Result) > 0 then System.Delete(Result, Length(Result), 1);
end;

procedure DataFieldToCheckList(Field, Key, Flag: TField; ChList: TCheckListBox);
{$WARN UNSAFE_TYPE OFF}
var
  Calc: TDataSetNotifyEvent;
  Mrk: TBookmark;
  StrVal: String;
begin
  ChList.Items.Clear;
  with Field, DataSet do
  begin
    if not Active then Open;
    Mrk := GetBookmark;
    Calc := OnCalcFields;
    try
      DisableControls;
      First;
      while not Eof do
      begin
        if not IsNull then
        begin
          if DataType in [ftDate, ftTime, ftDateTime] then StrVal := DisplayText
          else StrVal := AsString;
          if Assigned(Key) then
            ChList.Items.AddObject(StrVal, Pointer(Key.AsInteger))
          else ChList.Items.AddObject(StrVal, Pointer(GetBookmark));
          if Assigned(Flag)
          then ChList.Checked[ChList.Items.IndexOfObject(Pointer(Key.AsInteger))] := not Flag.IsNull;
        end;
        Next;
      end;
    finally
      OnCalcFields := Calc;
      GotoBookmark(Mrk);
      FreeBookmark(Mrk);
      EnableControls;
    end;
  end;
{$WARN UNSAFE_TYPE ON}
end;

{$R *.dfm}

function ExecuteEmbassyListEdit(Capt: String; EmbQry: TIBQuery;
    ATag: Integer): Boolean;
var Id: Integer;
begin
  with TEmbassyListForm.Create(Application) do
  try
    Caption := Capt;
    with EmbassyListQry do
    begin
      case ATag of
       3: ParamByName('CountryId').Value := Elem_BrCountryQry.DB.FieldByName('COUNTRYID').asInteger;//Elem_CountryTable.DB.FieldByName('COUNTRYID').asInteger;
       4: ParamByName('CountryId').Value := OptionSet.LocaleCountry;
      end;
      ParamByName('EmbassCntrId').Value := Elem_BrCountryQry.DB.FieldByName('COUNTRYID').asInteger;//Elem_CountryTable.DB.FieldByName('COUNTRYID').asInteger;
      ParamByName('OurEmbassy').AsString := OurEmbass[ATag];
    end;
    DataFieldToCheckList(EmbassyListQryEMBASSYNAME, EmbassyListQryCOMPANYID, EmbassyListQryEMBASSYID, EmbassyCheckListBox);
    Result := ShowModal = mrOk;
    if Result then
    begin
      StoreEmbassies_New(EmbassyCheckListBox, ATag);
      with EmbQry do
      begin
        if RecordCount > 0 then Id := FieldByName('COMPANYID').Value
        else Id := 0;
        UpdateQuery(EmbQry);
        Locate('COMPANYID', Id, []);
      end;
      DMServ.SyncronizeWebEdit(nDictPartEmbassies, Elem_BrCountryQry.DB.FieldByName('COUNTRYID').asInteger,//Elem_CountryTable.DB.FieldByName('COUNTRYID').asInteger,
        False, EmptyStr);
    end;
  finally
    Free;
  end;
end;

{ TEmbassyListForm }

procedure TEmbassyListForm.StoreEmbassies_New(List: TCheckListBox;
  ATag: Integer);
var EmbassyListId: string;
begin
  EmbassyListId := GatherEmbassValue(List);
//  case ATag of
//   3: Elem_CountryTable.DB.FieldByName('OUREMBASSY').asString := EmbassyListId;
//   4: Elem_CountryTable.DB.FieldByName('ITSEMBASSY').asString := EmbassyListId;
//  end;
  with DMServ, StoreEmbassyProc do
  begin
    ParamByName('ListEmbassyId').Value := ';' + EmbassyListId + ';';
    ParamByName('CountryId').Value := Elem_BrCountryQry.DB.FieldByName('COUNTRYID').asInteger;//Elem_CountryTable.DB.FieldByName('COUNTRYID').asInteger;
    ParamByName('OurEmbassy').Value := OurEmbass[ATag];
    ExecProc;
  end;
end;



end.
