unit UnitNoteEditDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, cxGraphics, cxControls,
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
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxMemo, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxImageComboBox,Core, UnitProc, cxDBEdit,cxGridDBTableView ;

const MessageSetTypeNote='Вкажіть тип нотатка';
      MessageSetTextNote='Вкаіть текст нотатка';

type
  TFrmNoteEditDlg = class(TForm)
    CtrlPanel: TPanel;
    CancelBtn: TBitBtn;
    OkBtn: TBitBtn;
    butPrevOffice: TSpeedButton;
    butNextOffice: TSpeedButton;
    MemoLabel: TLabel;
    TypeNoteComboBox: TcxImageComboBox;
    Memo: TcxMemo;
    procedure butNextOfficeClick(Sender: TObject);
    procedure butPrevOfficeClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure TypeNoteComboBoxPropertiesChange(Sender: TObject);
  private
    { Private declarations }
    FElem_TypeNote   :TDBShemaView;
    FElem_CompNoteQry:TDBShemaView;
    FIsNew:Boolean;
    FFocusedIndexRow:Integer;
    procedure FShowMemoNote( isNew:Boolean; recIndex:Integer);
    function  FFindPrevFindNoteRowIndex( aType:Variant;StartRowIndex:Integer ):Integer;
    function  FFindNextFindNoteRowIndex( aType:Variant;StartRowIndex:Integer ):Integer;

    function  FCheckFindPrevNote( aType:Variant; StartRowIndex:Integer ):Boolean;
    function  FCheckFindNextNote( aType:Variant; StartRowIndex:Integer ):Boolean;

    procedure FPrepareCmbTypeNote( isNew, CanUpdate:Boolean );
    procedure FPepare( isNew, CanUpdate:Boolean );
    procedure FPepareDBControls( isNew, CanUpdate:Boolean );
    procedure FRefreshControls;
    procedure FUpdateNote( isNew:Boolean );
    Function  FCheckData:Boolean;
  public
    { Public declarations }
  end;
procedure ShowNoteEditDlg( Elem_TypeNote, Elem_CompNoteQry:TDBShemaView; IsNew,CanUpdate:Boolean );
var
  FrmNoteEditDlg: TFrmNoteEditDlg;

implementation

{$R *.dfm}

procedure ShowNoteEditDlg( Elem_TypeNote, Elem_CompNoteQry:TDBShemaView; IsNew,CanUpdate:Boolean );
begin
  try
    Application.CreateForm(TFrmNoteEditDlg, FrmNoteEditDlg);
    FrmNoteEditDlg.FIsNew := IsNew;
    FrmNoteEditDlg.FElem_TypeNote    := Elem_TypeNote;
    FrmNoteEditDlg.FElem_CompNoteQry := Elem_CompNoteQry;


    FrmNoteEditDlg.FPepare( isNew, CanUpdate );
    
    if FrmNoteEditDlg.ShowModal = mrOk then
       FrmNoteEditDlg.FUpdateNote( IsNew );

  finally
    FrmNoteEditDlg.Free;
  end;
end;
//******************************************************************************
procedure TFrmNoteEditDlg.FPrepareCmbTypeNote( isNew, CanUpdate:Boolean );
var ItemAll:TcxImageComboBoxItem;
begin

  PreapareImageComboBoxFromDBICONBlob( TypeNoteComboBox, FElem_TypeNote.DB, FElem_TypeNote.FieldKod, 'NAME','', CanUpdate );
  if not isNew then
  begin
    ItemAll := AdValueToCombox(TypeNoteComboBox.Properties.Items, 0, 'Всі нотатки');
    ItemAll.Index := 0;
  end;
end;
//******************************************************************************
procedure TFrmNoteEditDlg.FPepare( isNew, CanUpdate:Boolean );
begin
  self.FFocusedIndexRow := FElem_CompNoteQry.View.DataController.FocusedRowIndex;
  FElem_TypeNote.DBOpen;
  FPrepareCmbTypeNote( isNew, CanUpdate );
  FPepareDBControls( isNew, CanUpdate );
  FShowMemoNote(isNew, FElem_CompNoteQry.View.DataController.FocusedRowIndex );
  FRefreshControls;
end;
//******************************************************************************
procedure TFrmNoteEditDlg.FPepareDBControls( isNew, CanUpdate:Boolean );
begin
  TypeNoteComboBox.EditValue := FElem_CompNoteQry.DB.FieldByName('TYPENOTE').Value;
  Memo.Properties.ReadOnly := CanUpdate;
  Memo.Enabled := isNew;
end;
//******************************************************************************
procedure TFrmNoteEditDlg.FShowMemoNote( isNew:Boolean; recIndex:Integer);
var IndMemo:Integer;
begin
  if not isNew then
  begin
    if recIndex <> -1 then
    begin
      IndMemo   := TcxGridDBTableView( FElem_CompNoteQry.View ).GetColumnByFieldName('MEMO').Index;
      Memo.Text := FElem_CompNoteQry.View.DataController.Values[ recIndex, IndMemo];
      FFocusedIndexRow:= recIndex;
    end;
  end
  else Memo.Text :='';
end;
//******************************************************************************
procedure TFrmNoteEditDlg.FRefreshControls;
begin
  butNextOffice.Enabled := FCheckFindNextNote( TypeNoteComboBox.EditValue, Self.FFocusedIndexRow );
  butPrevOffice.Enabled := FCheckFindPrevNote( TypeNoteComboBox.EditValue, Self.FFocusedIndexRow );
end;
//******************************************************************************
procedure TFrmNoteEditDlg.butNextOfficeClick(Sender: TObject);
var FindRowIndex:Integer;
begin
  FindRowIndex := FFindNextFindNoteRowIndex( TypeNoteComboBox.EditValue, FFocusedIndexRow );
  if FindRowIndex <> -1 then
    FShowMemoNote( self.FIsNew, FindRowIndex );

  FRefreshControls;
end;
//******************************************************************************
procedure TFrmNoteEditDlg.butPrevOfficeClick(Sender: TObject);
var FindRowIndex:Integer;
begin
  FindRowIndex := FFindPrevFindNoteRowIndex( TypeNoteComboBox.EditValue, FFocusedIndexRow );
  if FindRowIndex <> -1 then
    FShowMemoNote( self.FIsNew, FindRowIndex );

  FRefreshControls;  
end;
//******************************************************************************
function TFrmNoteEditDlg.FFindPrevFindNoteRowIndex( aType:Variant; StartRowIndex:Integer ):Integer;
var IndTYPENOTE:Integer;
    IndMemo:Integer;
    recIndex:Integer;
begin
   IndTYPENOTE   := TcxGridDBTableView( FElem_CompNoteQry.View ).GetColumnByFieldName('TYPENOTE').Index;
   IndMemo       := TcxGridDBTableView( FElem_CompNoteQry.View ).GetColumnByFieldName('MEMO').Index;

   result := -1;
   recIndex := StartRowIndex;

   while recIndex > 0 do
   begin
     if recIndex > 0 then Dec(recIndex);

     if (aType = 0 ) or (FElem_CompNoteQry.View.DataController.Values[recIndex,IndTYPENOTE] = aType) then
     begin
       result := recIndex;
       Break;
     end;
   end;
end;
//******************************************************************************
function TFrmNoteEditDlg.FFindNextFindNoteRowIndex( aType:Variant; StartRowIndex:Integer ):Integer;
var IndTYPENOTE:Integer;
    IndMemo:Integer;
    recIndex:Integer;
begin
   IndTYPENOTE   := TcxGridDBTableView( FElem_CompNoteQry.View ).GetColumnByFieldName('TYPENOTE').Index;
   IndMemo       := TcxGridDBTableView( FElem_CompNoteQry.View ).GetColumnByFieldName('MEMO').Index;

   result := -1;
   recIndex := StartRowIndex;

   while recIndex < FElem_CompNoteQry.View.ViewData.RowCount-1 do
   begin
     if recIndex < FElem_CompNoteQry.View.ViewData.RowCount-1 then Inc(recIndex);

     if (aType = 0 ) or (FElem_CompNoteQry.View.DataController.Values[ recIndex, IndTYPENOTE ] = aType) then
     begin
       result := recIndex;
       Break;
     end;
   end;
end;
//******************************************************************************
function TFrmNoteEditDlg.FCheckFindNextNote( aType:Variant; StartRowIndex:Integer ):Boolean;
begin
  result := FFindNextFindNoteRowIndex( aType, StartRowIndex ) <> -1;
end;
//******************************************************************************
function TFrmNoteEditDlg.FCheckFindPrevNote( aType:Variant; StartRowIndex:Integer ):Boolean;
begin
  result := FFindPrevFindNoteRowIndex( aType, StartRowIndex ) <> -1;
end;
//******************************************************************************
procedure TFrmNoteEditDlg.FUpdateNote( isNew:Boolean );
begin
  if isNew then
  begin
    self.FElem_CompNoteQry.DB.Insert;
    self.FElem_CompNoteQry.DB.FieldByName('TYPENOTE').Value := TypeNoteComboBox.EditValue;
    self.FElem_CompNoteQry.DB.FieldByName('MEMO').asString :=  Memo.Text;
    self.FElem_CompNoteQry.DB.Post;
  end;
end;
//******************************************************************************
Function TFrmNoteEditDlg.FCheckData :Boolean;
begin
  result := False;
  if TypeNoteComboBox.EditValue = null then
     MyShowMessageDlg( MessageSetTypeNote, mtError, but_OK )
  else
  if Memo.Text = '' then
     MyShowMessageDlg( MessageSetTextNote, mtError, but_OK )
  else result := True;
end;
//******************************************************************************
procedure TFrmNoteEditDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if (FIsNew)and( not FCheckData ) then
    CanClose := False
  else CanClose := True;
end;
//******************************************************************************
procedure TFrmNoteEditDlg.TypeNoteComboBoxPropertiesChange(
  Sender: TObject);
begin
  FRefreshControls;
end;

end.

