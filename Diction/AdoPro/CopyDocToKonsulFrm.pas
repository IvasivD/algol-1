unit CopyDocToKonsulFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AzComboBox, Buttons, ExtCtrls, DB,
  IBCustomDataSet, IBDatabase, IBQuery,UnitProjectProc;

type
  TCopyDocToKonsulForm = class(TForm)
    AllKonsulRBtn: TRadioButton;
    OneKonsulRBtn: TRadioButton;
    CopyLabel: TLabel;
    EmbassyComboBox: TAzComboBox;
    Label1: TLabel;
    CountryComboBox: TAzComboBox;
    CountryQry: TIBQuery;
    EmbassyQry: TIBQuery;
    Transaction: TIBTransaction;
    CountrySrc: TDataSource;
    CountryQryCOUNTRYID: TIntegerField;
    CountryQryNAME: TIBStringField;
    EmbassyQryCOMPANYID: TIntegerField;
    EmbassyQryEMBASSYNAME: TIBStringField;
    CtrlPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    procedure OneKonsulRBtnClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CountryComboBoxChange(Sender: TObject);
    procedure EmbassyComboBoxChange(Sender: TObject);
  private
    function CheckData: Boolean;
    procedure PrepareEmbassyList;
    procedure UpdateBtn;
    function GetEmbassyList: string;
  end;

//var
//  CopyDocToKonsulForm: TCopyDocToKonsulForm;
function ExecuteCopyDocToKonsul(var CountryId: Integer; 
  var EmbassyListId, EmbassyName, CountryName: string;
  const DocName: string; TypeSelDoc: Integer = 0): Boolean;

implementation

uses
  ServMod, TourConsts, TourCmnlIf, ServModIB;

{$R *.dfm}
function ExecuteCopyDocToKonsul(var CountryId: Integer;
  var EmbassyListId, EmbassyName, CountryName: string;
  const DocName: string; TypeSelDoc: Integer = 0): Boolean;
begin
   with TCopyDocToKonsulForm.Create(Application) do
   try
     case TypeSelDoc of
     0: CopyLabel.Caption := Format('Копіювати всі документи?'#13'"%s"', [EmbassyName]);
     1: CopyLabel.Caption := Format('Копіювати документ "%s"?', [DocName]);
     else CopyLabel.Caption := Format('Копіювати вибрані документи?'#13'"%s"', [EmbassyName]); 
     end;
     PrepareEmbassyList;
     Result := ShowModal = mrOk;
     EmbassyListId := EmptyStr;
     if Result then
     begin
       EmbassyListId := GetEmbassyList;
       CountryId := CountryComboBox.ItemId;
       EmbassyName := EmbassyComboBox.Items[EmbassyComboBox.ItemIndex];
       CountryName := CountryComboBox.Text;
     end;
   finally
     Free;
   end;
end;

procedure TCopyDocToKonsulForm.OneKonsulRBtnClick(Sender: TObject);
begin
  inherited;
  with EmbassyComboBox do begin 
    Enabled := OneKonsulRBtn.Checked;
    if not Enabled then ItemId := 0;
  end;
  UpdateBtn;
end;

procedure TCopyDocToKonsulForm.PrepareEmbassyList;
var Id, IdDoc: Integer;
begin
  DataFieldToStrings(CountryQryNAME, CountryQryCOUNTRYID, CountryComboBox.Items);
  CountryComboBox.ItemId := Elem_BrCountryQry.DB.FieldByName('COUNTRYID').asInteger;//Elem_CountryTable.DB.FieldByName('COUNTRYID').asInteger;
{  with DMServ, DMServIB do
  begin
    Id := Elem_ItsKonsulQry.DB.FieldByName('COMPANYID').asInteger;
    IdDoc := Elem_ItsDocumVisaListQry.DB.FieldByName('VISADOCUMENTID').asInteger;
    ItsKonsulQry.DisableControls;
    DataFieldToStrings(ItsKonsulQryEMBASSYNAME,
      ItsKonsulQryCOMPANYID, EmbassyComboBox.Items);
    EmbassyComboBox.ItemId := Id;
    EmbassyComboBox.Items.Delete(EmbassyComboBox.ItemIndex);
    ItsKonsulQry.Locate('COMPANYID', Id, []);
    ItsDocumVisaListQry.Locate('VISADOCUMENTID', IdDoc, []); 
    ItsKonsulQry.EnableControls;
  end;   }
end;

procedure TCopyDocToKonsulForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  CanClose := (ModalResult <> mrOk) or CheckData;
end;

function TCopyDocToKonsulForm.CheckData: Boolean;
begin
  Result := AllKonsulRBtn.Checked or (EmbassyComboBox.ItemId > 0);
  if not Result then begin
    ErrorDlg('Не вибрано консульство!');
    ActiveControl := EmbassyComboBox;
  end;
end;

procedure TCopyDocToKonsulForm.CountryComboBoxChange(Sender: TObject);
begin
  inherited;
  CountryQry.Locate('CountryId', CountryComboBox.ItemId, []);
  DataFieldToStrings(EmbassyQryEMBASSYNAME, EmbassyQryCOMPANYID, EmbassyComboBox.Items);
  
  if CountryComboBox.ItemId = Elem_BrCountryQry.DB.FieldByName('COUNTRYID').asInteger//Elem_CountryTable.DB.FieldByName('COUNTRYID').asInteger
  then begin 
    EmbassyComboBox.ItemId := Elem_CNTREMBASSIES.DB.fieldByName('COMPANYID').Value;//Elem_ItsKonsulQry.DB.FieldByName('COMPANYID').asInteger;
    EmbassyComboBox.Items.Delete(EmbassyComboBox.ItemIndex);
  end;
  UpdateBtn;
end;

procedure TCopyDocToKonsulForm.UpdateBtn;
begin
  OkBtn.Enabled := (CountryComboBox.ItemId > 0) and
    (AllKonsulRBtn.Checked or (EmbassyComboBox.ItemId > 0));    
end;

procedure TCopyDocToKonsulForm.EmbassyComboBoxChange(Sender: TObject);
begin
  inherited;
  UpdateBtn;
end;

function TCopyDocToKonsulForm.GetEmbassyList: string;
var Id: Integer;
begin
  Result := EmptyStr;
  if OneKonsulRBtn.Checked then Result := IntToStr(EmbassyComboBox.ItemId)
  else with EmbassyQry do
  begin
    Id := EmbassyQryCOMPANYID.Value;
    First;
    while not Eof do
    begin
      Result := Result + EmbassyQryCOMPANYID.AsString + ',';
      Next;
    end;    
    if Length(Result) > 0 then System.Delete(Result, Length(Result), 1);
  end;
end;

end.
