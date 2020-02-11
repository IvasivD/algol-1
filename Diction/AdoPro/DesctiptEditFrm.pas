unit DesctiptEditFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Core, ComCtrls, AzRichEdit,
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
  cxTextEdit, cxMemo, Grids, SvtDBGrids, DB, IBDatabase, IBCustomDataSet,
  IBUpdateSQL, IBQuery, IBTable, OleCtrls, SHDocVw, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxCheckBox, cxDBEdit;

type
  TDesctiptEditForm = class(TForm)
    DescriptEdit: TcxMemo;
    LanguageGridLevel1: TcxGridLevel;
    LanguageGrid: TcxGrid;
    ShowWebCheckBox: TcxCheckBox;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ElementAfterScroll(DataSet: TDataSet);
    procedure ElementBeforeScroll(DataSet: TDataSet);
    procedure DescriptEditExit(Sender: TObject);
  private
    FElementSource: TDBShemaView;
    FElementTarget: TDBShema;  
    FElementLanguage: TDBShemaView;  
    BeforeScrollEvent, AfterScrollEvent: TDataSetNotifyEvent;  
    FElemntDescrpt: TDBShemaView;
    procedure StroreData;
    procedure PrepareData;
    procedure RefreshLanguage;
    procedure SetDescriptToTemp;
//    procedure PrepareWebData;
  public
    { Public declarations }
  end;

function ExecuteDescriptEditForm(ElemntDescrpt, ElementSource, ElementLanguage: TDBShemaView; 
  ElementTarget: TDBShema): Boolean;

implementation

uses
  ServModIB, OrderUn;

const
  DescriptField = 'DESCRIPT';

{$R *.dfm}
function ExecuteDescriptEditForm(ElemntDescrpt, ElementSource, ElementLanguage: TDBShemaView; 
  ElementTarget: TDBShema): Boolean;
begin
  with TDesctiptEditForm.Create(Application) do
  try
    FElementSource := ElementSource;
    FElementTarget := ElementTarget;
    FElementLanguage := ElementLanguage;
    FElemntDescrpt := ElemntDescrpt;
    PrepareData;
    Result := ShowModal = mrOk;
  finally
    ElementLanguage.DB.BeforeScroll := BeforeScrollEvent;
    ElementLanguage.DB.AfterScroll := AfterScrollEvent;
    FElementSource.ClearAllValueFromTempByKey('KeyId');
    Free;
  end;
end; 

procedure TDesctiptEditForm.ElementAfterScroll(DataSet: TDataSet);
begin 
  RefreshLanguage;       
end;

procedure TDesctiptEditForm.ElementBeforeScroll(DataSet: TDataSet);
begin
  SetDescriptToTemp;
end;

procedure TDesctiptEditForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  if ModalResult = mrOk then StroreData;
end;

procedure TDesctiptEditForm.PrepareData;
var FieldKod: string;
begin
  if FElementLanguage <> nil then
    LanguageGrid.Levels[0].GridView := FElementLanguage.View;

  BeforeScrollEvent := FElementLanguage.DB.BeforeScroll;
  AfterScrollEvent := FElementLanguage.DB.AfterScroll;       
  FElementLanguage.DB.BeforeScroll := ElementBeforeScroll;
  FElementLanguage.DB.AfterScroll := ElementAfterScroll;

  FElementTarget.DBReOpen;  
  try 
    FieldKod := FElementTarget.FieldKod;
    FElementTarget.FieldKod := 'LANGID';
    FElementSource.InitializeTempValueByElement(FElementTarget, 'KeyId', 'COMMENTS');
    FElementSource.SetValueToTemp('KeyId', FElementSource.DB.FieldByName('DESCRIPT').Value, nLocalLang);
  finally
    FElementTarget.FieldKod := FieldKod;
  end;  
  if FElementSource.DBRecordCount > 0 then
    ShowWebCheckBox.Checked := FElementSource.DB.FieldByName('SHOWWEB').AsBoolean;
  RefreshLanguage;
//  PrepareWebData
end;
{
procedure TDesctiptEditForm.PrepareWebData;
const sCellEdit = 'action=edit';
      sParam = 'lang_id=%d%s&active_cell=%d%s%s';
var Frame, Flags, PostData, Head: OleVariant;
begin
  Flags := navNoHistory;
  Head := 'Content-Type: application/x-www-form-urlencoded'#10#13;
  Frame := null;
  PostData := sCellEdit;
  WebBrowser1.Navigate('http://www.algol.local/__tools/ib_edit_form/', Flags, 
    Frame, PostData, Head); 
end;   }

procedure TDesctiptEditForm.RefreshLanguage;
var ValueDesc: Variant;
begin
  ValueDesc := FElementSource.GetValueFromTemp('KeyId', FElementLanguage.GetValueId);
  if ValueDesc <> null then DescriptEdit.Lines.Text := ValueDesc
  else DescriptEdit.Lines.Clear;
end;

procedure TDesctiptEditForm.SetDescriptToTemp;
begin
  FElementSource.SetValueToTemp('KeyId', DescriptEdit.Lines.Text, FElementLanguage.GetValueId);
end;

procedure TDesctiptEditForm.StroreData;
var 
    Id: Integer;
    ValueDesc: Variant;
begin
  with FElementSource do begin
    if DBRecordCount > 0 then DB.Edit else DB.Append;
    Id := GetValueId;
    ValueDesc := FElementSource.GetValueFromTemp('KeyId', nLocalLang);
    if ValueDesc <> null then
      DB.FieldByName('DESCRIPT').Value := ValueDesc
    else 
      DB.FieldByName('DESCRIPT').Clear;
    DB.FieldByName('SHOWWEB').Value := ShowWebCheckBox.Checked;
    DB.FieldByName('TABLENAME').Value := FElemntDescrpt.TableName;
    DB.FieldByName('DESCRIPTID').Value := Id;
    DB.FieldByName('ITEMID').Value := FElemntDescrpt.GetValueId;
    DB.Post;
  end;

  try    
    FElementLanguage.DB.DisableControls;
    FElementLanguage.DB.First;
    while not FElementLanguage.DB.Eof do
    begin
      if FElementLanguage.GetValueId <> nLocalLang then 
      begin
        if FElementTarget.DB.Locate('LangId', VarArrayOf([FElementLanguage.GetValueId]), []) then
          FElementTarget.DB.Edit
        else 
          FElementTarget.DB.Append;        
        ValueDesc := FElementSource.GetValueFromTemp('KeyId', FElementLanguage.GetValueId);
        if ValueDesc <> null then
          FElementTarget.DB.FieldByName('COMMENTS').Value := ValueDesc
        else                                 
          FElementTarget.DB.FieldByName('COMMENTS').Clear;
        FElementTarget.DB.FieldByName('SERVTABLE').Value := FElementSource.TableName;
        FElementTarget.DB.FieldByName('SERVID').Value := FElementSource.GetValueId;
        FElementTarget.DB.FieldByName('LANGID').Value := FElementLanguage.GetValueId;
        FElementTarget.DB.Post;
      end;
      FElementLanguage.DB.Next;
    end;
  finally
    FElementLanguage.DB.EnableControls;
  end;
end;

procedure TDesctiptEditForm.DescriptEditExit(Sender: TObject);
begin
  inherited;
  SetDescriptToTemp;
end;

end.
 
