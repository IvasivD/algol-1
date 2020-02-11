unit EmailFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AzComboBox, ExtCtrls, Buttons, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxMemo, cxCheckBox,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,DB,
  cxDBExtLookupComboBox, cxRadioGroup, cxTextEdit,Core,UnitProc,cxGridDBTableView;

type
  TEmailAddressEditFrm = class(TForm)
    ModalPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    WorkPanel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    OfficeGroupBox: TGroupBox;
    LabelMemo: TLabel;
    EmailEdit: TcxTextEdit;
    AliasEdit: TcxTextEdit;
    OfficeRadioButton2: TcxRadioButton;
    OfficeRadioButton1: TcxRadioButton;
    OfficeComboBox: TcxExtLookupComboBox;
    IsDefaultCheckBox: TcxCheckBox;
    IsEnabledCheckBox: TcxCheckBox;
    IsEnabled2CheckBox: TcxCheckBox;
    Memo: TcxMemo;
    procedure OfficeRadioButton2Click(Sender: TObject);
  private
    { Private declarations }
    FElem_Emails : TDBShemaView;
    FElem_CompEmails : TDBShemaView;
    FElem_Offices : TDBShemaView;
    FMamgerId:Integer;
    function FCheckIsDefaultEmail:Boolean;
    procedure RefreshControls;
    procedure FUpdateEmail( MamgerId:Integer; IsNew:Boolean );
    procedure FPrepareDataControls( isNew:Boolean );
    procedure FPrepare( isNew,CanUpdate:Boolean );
  public
    { Public declarations }
  end;
function ExecuteEmailAddressEditFrm( aElem_Emails, aElem_CompEmails, aElem_Offices: TDBShemaView; isNew,CanUpdate: Boolean; MamgerId:Integer ): Boolean;
var
  EmailAddressEditFrm: TEmailAddressEditFrm;

implementation

{$R *.dfm}

function ExecuteEmailAddressEditFrm( aElem_Emails,aElem_CompEmails, aElem_Offices: TDBShemaView; isNew,CanUpdate: Boolean; MamgerId:Integer ): Boolean;
begin
  try
    Application.CreateForm(TEmailAddressEditFrm, EmailAddressEditFrm);
    EmailAddressEditFrm.FElem_Emails :=  aElem_Emails;
    EmailAddressEditFrm.FElem_CompEmails := aElem_CompEmails;
    EmailAddressEditFrm.FElem_Offices := aElem_Offices;
    EmailAddressEditFrm.FMamgerId := MamgerId;
    EmailAddressEditFrm.FPrepare( isNew, CanUpdate );
    if EmailAddressEditFrm.ShowModal = mrOk then
      EmailAddressEditFrm.FUpdateEmail( MamgerId, IsNew );

  finally
    EmailAddressEditFrm.Free;
  end;

end;

function TEmailAddressEditFrm.FCheckIsDefaultEmail:Boolean;
begin
  try
    FElem_CompEmails.SaveBookmark;
    FElem_CompEmails.DB.DisableControls;
    if not FElem_CompEmails.DB.Locate('ISDEFAULT',  'T',[loCaseInsensitive] ) then
      result := True
    else result := False;

  finally
    FElem_CompEmails.GotoBookmark;
    FElem_CompEmails.DB.EnableControls;
  end;
end;

procedure TEmailAddressEditFrm.FPrepareDataControls( isNew:Boolean );
begin
  if not IsNew then
  begin
    FElem_CompEmails.DB.Locate('linkemailid', FElem_Emails.GetValueId,[] );

    EmailEdit.Text := FElem_Emails.DB.FieldByName('EMAIL').AsString;
    AliasEdit.Text := FElem_Emails.DB.FieldByName('ALIAS').AsString;
    IsEnabledCheckBox.Checked := FElem_Emails.DB.FieldByName('ISENABLED').AsBoolean;
    IsEnabled2CheckBox.Checked := FElem_Emails.DB.FieldByName('ISENABLED2').AsBoolean;

    IsDefaultCheckBox.Checked := FElem_CompEmails.DB.FieldByName('ISDEFAULT').AsBoolean ;
  end
  else
  begin
    EmailEdit.Text := '';
    AliasEdit.Text := '';
    IsEnabledCheckBox.Checked := True;
    IsEnabled2CheckBox.Checked := True;
  end;
end;

procedure TEmailAddressEditFrm.FPrepare( isNew,CanUpdate:Boolean );
begin
  SetPropInCxExtLookupComboBox( OfficeComboBox, TcxGridDBTableView( FElem_Offices.ViewList) ,'CalcAddress', FElem_Offices.FieldKod, CanUpdate, false );
  FPrepareDataControls( isNew);

  EmailEdit.Properties.ReadOnly:= not CanUpdate;
  AliasEdit.Properties.ReadOnly:= not CanUpdate;
  IsEnabledCheckBox.Properties.ReadOnly:= not CanUpdate;
  IsEnabled2CheckBox.Properties.ReadOnly:= not CanUpdate;
end;


procedure TEmailAddressEditFrm.FUpdateEmail( MamgerId:Integer; IsNew:Boolean );
begin
  IsDefaultCheckBox.Checked := FCheckIsDefaultEmail;

  if IsNew then FElem_Emails.DB.Insert
  else FElem_Emails.DB.Edit;

  FElem_Emails.DB.FieldByName('EMAIL').AsString := EmailEdit.Text;
  FElem_Emails.DB.FieldByName('ALIAS').AsString := AliasEdit.Text;
  FElem_Emails.DB.FieldByName('ISENABLED').AsBoolean := IsEnabledCheckBox.Checked;
  FElem_Emails.DB.FieldByName('ISENABLED2').AsBoolean := IsEnabled2CheckBox.Checked;
  FElem_Emails.DB.Post;

  if isNew then FElem_CompEmails.DB.Insert
  else FElem_CompEmails.DB.Edit;

  FElem_CompEmails.DB.FieldByName('LINKEMAILID').asInteger := FElem_Emails.GetValueId;
  FElem_CompEmails.DB.FieldByName('ISDEFAULT').AsBoolean := IsDefaultCheckBox.Checked;
  FElem_CompEmails.DB.FieldByName('ADDMANID').asInteger := self.FMamgerId;
  FElem_CompEmails.DB.Post;

  FElem_CompEmails.RequeryCurrentRecord;
  FElem_Emails.RequeryCurrentRecord;
end;

procedure TEmailAddressEditFrm.RefreshControls;
begin
  OfficeComboBox.Enabled := OfficeRadioButton1.Checked;
  Memo.Enabled := not IsEnabledCheckBox.Checked;
  LabelMemo.Enabled := Memo.Enabled;
end;


procedure TEmailAddressEditFrm.OfficeRadioButton2Click(Sender: TObject);
begin
  RefreshControls;
end;

end.
