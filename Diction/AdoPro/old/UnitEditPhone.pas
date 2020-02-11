unit UnitEditPhone;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Mask, ExtCtrls, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxCheckBox, cxMemo,
  cxTextEdit, cxGroupBox, Core,OptSet;

type
  TFrmEditPhone = class(TForm)
    ModalPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    AreaCodeEditBtn: TSpeedButton;
    Label6: TLabel;
    MemoLabel: TLabel;
    DBCntryCode: TcxTextEdit;
    DBAreaCode: TcxTextEdit;
    DBPhoneNo: TcxTextEdit;
    DBExtention: TcxTextEdit;
    Memo: TcxMemo;
    IsEnabledCheckBox: TcxCheckBox;
    IsEnabled2CheckBox: TcxCheckBox;
    PbxSpeedCodeDBEdit: TcxTextEdit;
    CntryText: TStaticText;
    AreaText: TStaticText;
    GroupBoxUseAs: TcxGroupBox;
    IsPhoneDBCheckBox: TcxCheckBox;
    IsFaxDBCheckBox: TcxCheckBox;
    IsRedPhnDBCheckBox: TcxCheckBox;
    IsDefFaxDBCheckBox: TcxCheckBox;
    IsDefPhnDBCheckBox: TcxCheckBox;
    procedure IsEnabledCheckBoxPropertiesChange(Sender: TObject);
    procedure IsEnabled2CheckBoxPropertiesChange(Sender: TObject);
    procedure AreaCodeEditBtnClick(Sender: TObject);
  private
    { Private declarations }
    FElem_Phones:TDBShemaView;
    FElem_Offices:TDBShemaView;
    FElem_COMPANY:TDBShemaView;
    procedure FPrepareDataControls( isNew:Boolean );
    function  FUpdatePhone( MamgerId:Integer; IsNew:Boolean ):Boolean;
    procedure RefreshControls;
    procedure FRefreashCityNamebyAreaCode;
  public
    { Public declarations }
  end;

function ExecutePhoneEditFrm( aElem_Phones, aElem_Offices, aElem_COMPANY: TDBShemaView; isNew: Boolean; MamgerId:Integer ): Boolean;
var
  FrmEditPhone: TFrmEditPhone;

implementation

uses DB;


{$R *.dfm}

function ExecutePhoneEditFrm( aElem_Phones, aElem_Offices,aElem_COMPANY: TDBShemaView; isNew: Boolean; MamgerId:Integer ): Boolean;
begin
   try
     Application.CreateForm(TFrmEditPhone, FrmEditPhone);
     FrmEditPhone.FElem_Offices := aElem_Offices;
     FrmEditPhone.FElem_Phones := aElem_Phones;
     FrmEditPhone.FElem_COMPANY := aElem_COMPANY;

     FrmEditPhone.FPrepareDataControls( isNew );

     if FrmEditPhone.ShowModal = mrOk then
       result := FrmEditPhone.FUpdatePhone( MamgerId, isNew )
     else Result := False;  

   finally
     FrmEditPhone.free;
   end;
end;

function GetSqlFromAreaNameByAreaPhoneCode(AreaCode:Widestring):WideString;
begin
   result := ' select NAME from CITIES where PHONECODE ='+''''+AreaCode+'''';
end;

procedure TFrmEditPhone.FPrepareDataControls( isNew:Boolean );
begin
  if not isNew then
  begin
    DBCntryCode.Text := FElem_Phones.DB.FieldByName('CNTRYCODE').AsString;
    DBAreaCode.Text := FElem_Phones.DB.FieldByName('AREACODE').AsString;
    DBPhoneNo.Text := FElem_Phones.DB.FieldByName('PHONENO').AsString;
    DBExtention.Text := FElem_Phones.DB.FieldByName('EXTENTION').AsString;

    CntryText.Caption := FElem_Offices.DB.FieldByName('COUNTRY').AsString;
    FRefreashCityNamebyAreaCode;

    IsPhoneDBCheckBox.Checked := FElem_Phones.DB.FieldByName('ISPHN').AsBoolean;
    IsFaxDBCheckBox.Checked :=  FElem_Phones.DB.FieldByName('ISFAX').AsBoolean;

    IsDefPhnDBCheckBox.Checked := FElem_Phones.DB.FieldByName('ISDEFPHN').AsBoolean;
    IsDefFaxDBCheckBox.Checked := FElem_Phones.DB.FieldByName('ISDEFFAX').AsBoolean;

    IsRedPhnDBCheckBox.Checked := FElem_Phones.DB.FieldByName('ISREDPHN').AsBoolean;
    PbxSpeedCodeDBEdit.Text := FElem_Phones.DB.FieldByName('PBXSPEEDCODE').AsString;

    IsEnabledCheckBox.Checked := FElem_Phones.DB.FieldByName('ISENABLED').AsBoolean;
    IsEnabled2CheckBox.Checked := FElem_Phones.DB.FieldByName('ISENABLED2').AsBoolean;
    Memo.Text := FElem_Phones.DB.FieldByName('MEMO').asString;
  end
  else
  begin
     DBCntryCode.Text := FElem_Offices.DB.FieldByName('CNTRYCODE').AsString;
     DBAreaCode.Text := '';
     DBPhoneNo.Text := '';
     DBExtention.Text := '';
     Memo.Text := '';

     IsPhoneDBCheckBox.Checked := False;
     IsFaxDBCheckBox.Checked := False;

     IsDefPhnDBCheckBox.Checked :=False;
     IsDefFaxDBCheckBox.Checked := False;

     IsRedPhnDBCheckBox.Checked := False;
     PbxSpeedCodeDBEdit.Text := '';

     IsEnabledCheckBox.Checked := (FElem_Offices.DB.FieldByName('COUNTRYID').value = OptionSet.LocaleCountry)
                                    and (FElem_COMPANY.DB.FieldByName('ASTOURS').AsBoolean
                                    or FElem_COMPANY.DB.FieldByName('ASDRIVE').AsBoolean
                                    or FElem_COMPANY.DB.FieldByName('ASTICKT').AsBoolean
                                    or FElem_COMPANY.DB.FieldByName('ASHOTEL').AsBoolean
                                    or FElem_COMPANY.DB.FieldByName('ASVISAS').AsBoolean
                                    or FElem_COMPANY.DB.FieldByName('ASEXCRS').AsBoolean
                                    or FElem_COMPANY.DB.FieldByName('ASEXTRM').AsBoolean
                                    or FElem_COMPANY.DB.FieldByName('ASRECRE').AsBoolean
                                    or FElem_COMPANY.DB.FieldByName('ASAPAIR').AsBoolean );
     IsEnabled2CheckBox.Checked := True;
  end;

end;

function TFrmEditPhone.FUpdatePhone( MamgerId:Integer; IsNew:Boolean ):Boolean;
begin
  result := False;
  if IsNew then FElem_Phones.DB.Insert
  else FElem_Phones.DB.Edit;

  FElem_Phones.DB.FieldByName('CNTRYCODE').AsString := DBCntryCode.Text ;
  FElem_Phones.DB.FieldByName('AREACODE').AsString := DBAreaCode.Text;
  FElem_Phones.DB.FieldByName('PHONENO').AsString := DBPhoneNo.Text;
  FElem_Phones.DB.FieldByName('EXTENTION').AsString := DBExtention.Text;

  FElem_Phones.DB.FieldByName('ISPHN').AsBoolean := IsPhoneDBCheckBox.Checked;
  FElem_Phones.DB.FieldByName('ISFAX').AsBoolean := IsFaxDBCheckBox.Checked ;

  FElem_Phones.DB.FieldByName('ISDEFPHN').AsBoolean := IsDefPhnDBCheckBox.Checked;
  FElem_Phones.DB.FieldByName('ISDEFFAX').AsBoolean := IsDefFaxDBCheckBox.Checked;

  FElem_Phones.DB.FieldByName('ISREDPHN').AsBoolean := IsRedPhnDBCheckBox.Checked;
  FElem_Phones.DB.FieldByName('PBXSPEEDCODE').AsString := PbxSpeedCodeDBEdit.Text ;

  FElem_Phones.DB.FieldByName('ISENABLED').AsBoolean := IsEnabledCheckBox.Checked;
  FElem_Phones.DB.FieldByName('ISENABLED2').AsBoolean := IsEnabled2CheckBox.Checked;

  FElem_Phones.DB.FieldByName('MEMO').asString := Memo.Text;
  FElem_Phones.DB.Post;
  result := True;
end;

procedure TFrmEditPhone.RefreshControls;
begin
  DBCntryCode.Enabled := False;
  DBAreaCode.Enabled := AreaCodeEditBtn.Down;
  IsDefPhnDBCheckBox.Enabled := IsPhoneDBCheckBox.Checked;
  IsDefFaxDBCheckBox.Enabled := IsFaxDBCheckBox.Checked;
  IsRedPhnDBCheckBox.Enabled := IsPhoneDBCheckBox.Checked;
  IsEnabledCheckBox.Enabled :=  IsFaxDBCheckBox.Checked;
  Memo.Enabled := not IsEnabledCheckBox.Checked and IsEnabledCheckBox.Enabled;
end;

procedure TFrmEditPhone.IsEnabledCheckBoxPropertiesChange(Sender: TObject);
begin
  RefreshControls;
end;

procedure TFrmEditPhone.IsEnabled2CheckBoxPropertiesChange(
  Sender: TObject);
begin
  RefreshControls;
end;

procedure TFrmEditPhone.AreaCodeEditBtnClick(Sender: TObject);
begin
  FRefreashCityNamebyAreaCode;
  RefreshControls;
end;

procedure TFrmEditPhone.FRefreashCityNamebyAreaCode;
begin
  if DBAreaCode.Text <>'' then
    AreaText.Caption  :=  VarToStr(  DBGetValue(FElem_Phones.DBGetParamConnect,
                          GetSqlFromAreaNameByAreaPhoneCode(DBAreaCode.Text), 'NAME' ) )
  else AreaText.Caption :='';
end;
end.

