unit UnitBrwsDic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Core, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
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
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxTextEdit, cxMemo, cxRichEdit, cxDBRichEdit, Menus, StdActns, DBActns,
  ActnList, ExtCtrls, StdCtrls, Buttons, AzComboBox, ComCtrls, ToolWin,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, UnitExportExcel,UnitProc,
  cxDBLookupComboBox, cxCheckBox;

type
  TFieldMemoBrws = record
     Field:WideString;
     FieldTransl:WideString;
  end;

  TFrmBrwsDic = class(TForm)
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    DataSetFirstBtn: TToolButton;
    DataSetPriorBtn: TToolButton;
    DataSetNextBtn: TToolButton;
    DataSetLastBtn: TToolButton;
    DataSetRefreshBtn: TToolButton;
    SeparatorTBtn0: TToolButton;
    AppendTbtn: TToolButton;
    EditTbtn: TToolButton;
    CopyTBtn: TToolButton;
    SeparatorTBtn2: TToolButton;
    DeleteTbtn: TToolButton;
    SeparatorTBtn4: TToolButton;
    ViewMemosTBtn: TToolButton;
    SeparatorTBtn3: TToolButton;
    ListingExport2ExcelBtn: TToolButton;
    LangPanel: TPanel;
    DetailPanel: TPanel;
    ModalPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    MasterPanel: TPanel;
    SplitterMemPanel: TSplitter;
    PanelViewMemText: TPanel;
    Panel2: TPanel;
    GridElem: TcxGrid;
    GridElemDBTableView1: TcxGridDBTableView;
    GridElemLevel1: TcxGridLevel;
    LangComboBox: TcxLookupComboBox;
    LangCheckBox: TcxCheckBox;
    ActionListTopBut: TActionList;
    ActDBRefresh: TAction;
    ActViewFirst: TAction;
    ActViewPrev: TAction;
    ActViewNext: TAction;
    ActViewLast: TAction;
    ActInsertDB: TAction;
    ActDBEdit: TAction;
    ActCopyRow: TAction;
    ActViewDelete: TAction;
    ViewMemo: TAction;
    ViewExportExcel: TAction;
    PanelViewMemTextOriginal: TPanel;
    MasterDBRichEdit: TcxDBRichEdit;
    PanelViewMemTextTransl: TPanel;
    MasterDBRichEditTransl: TcxDBRichEdit;
    ActSelectAll: TAction;
    PopupMenu: TPopupMenu;
    PUpMenuFirst: TMenuItem;
    PUpMenuLast: TMenuItem;
    N3: TMenuItem;
    PUpMenuNew: TMenuItem;
    PUpMenuEdit: TMenuItem;
    N6: TMenuItem;
    PUpMenuSelectAll: TMenuItem;
    procedure LangCheckBoxPropertiesEditValueChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActDBRefreshExecute(Sender: TObject);
    procedure ActViewFirstExecute(Sender: TObject);
    procedure ActViewPrevExecute(Sender: TObject);
    procedure ActViewNextExecute(Sender: TObject);
    procedure ActViewLastExecute(Sender: TObject);
    procedure ActInsertDBExecute(Sender: TObject);
    procedure ActDBEditExecute(Sender: TObject);
    procedure ActCopyRowExecute(Sender: TObject);
    procedure ActViewDeleteExecute(Sender: TObject);
    procedure ViewMemoExecute(Sender: TObject);
    procedure ViewExportExcelExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure LangComboBoxPropertiesEditValueChanged(Sender: TObject);
    procedure ClearElem;
    procedure CheckAvailableButton(aButt:TAction);
    procedure CheckAvailableButtonOther(aButt:TToolbutton;ImageIndexNotReadOny,ImageIndexReadOny:Integer);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure PopupMenuPopup(Sender: TObject);
    procedure PUpMenuSelectAllClick(Sender: TObject);
  private
    FElem :TDBShemaView;
    FElemLanguage :TDBShemaView;

    FFieldMemView : TFieldMemoBrws;
    FReadOnly:Boolean;

    procedure RefreshLanguage;

    procedure SetElem(const aElem: TDBShemaView);
    procedure SetElemLanguage(const aElem: TDBShemaView);
    procedure SetFieldMemView(const Value: TFieldMemoBrws);
    procedure ShowMemoPanel(aMemoPanel:TPanel;aSplitter:TSplitter;PanelOrig,PanelTransl:TPanel; Show:Boolean);
    procedure SetReadOnly(const Value: Boolean);

    { Private declarations }
  public
    { Public declarations }

     procedure RefreshButt;
     property   FieldMemView:TFieldMemoBrws        read FFieldMemView  write SetFieldMemView;
     property   Elem:TDBShemaView                  read FElem          write SetElem;
     property   ElemLanguage:TDBShemaView          read FElemLanguage  write SetElemLanguage;
     property   ReadOnlyData:Boolean               read FReadOnly      write SetReadOnly;
  end;

function ShowBrwsDicForm( aCaption:WideString; Elem, ElemLanguage:TDBShemaView; FieldMemo : TFieldMemoBrws;
                          ReadOnly:Boolean=False; VarFrm:TFrmBrwsDic  = nil ):TFrmBrwsDic;

var
  FrmBrwsDic: TFrmBrwsDic;

implementation

{$R *.dfm}

function ShowBrwsDicForm( aCaption:WideString; Elem, ElemLanguage:TDBShemaView; FieldMemo : TFieldMemoBrws;
                          ReadOnly:Boolean=False; VarFrm:TFrmBrwsDic  = nil ):TFrmBrwsDic;
begin
  if VarFrm = nil  then VarFrm:=FrmBrwsDic;

  Application.CreateForm(TFrmBrwsDic, VarFrm);
  VarFrm.Caption:= aCaption;
  VarFrm.FReadOnly := ReadOnly;
  VarFrm.Elem   := Elem;
  VarFrm.ElemLanguage := ElemLanguage;

  VarFrm.FieldMemView := FieldMemo;

  VarFrm.Show;
  result := VarFrm;
end;

procedure TFrmBrwsDic.LangCheckBoxPropertiesEditValueChanged(
  Sender: TObject);
begin
 if (LangCheckBox.Checked)and(LangComboBox.EditValue = null) then
   LangComboBox.EditValue:= ElemLanguage.GetValueId;

 RefreshButt;
end;

procedure TFrmBrwsDic.ClearElem;
begin
  GridElem.Levels[0].GridView:=nil;
  if FElem<>nil then
    FElem.ClearNavigationButton;
end;

procedure TFrmBrwsDic.SetElem(const aElem: TDBShemaView);
begin
  FElem := aElem;
  GridElem.Levels[0].GridView := aElem.View;
  if not FElem.DB.Active then FElem.DBOpen;
  FElem.AddNavigationButton(TButton(DataSetFirstBtn), TButton(DataSetPriorBtn), TButton(DataSetNextBtn),TButton(DataSetLastBtn));
end;

procedure TFrmBrwsDic.SetElemLanguage(const aElem: TDBShemaView);
begin
  FElemLanguage := aElem;
  if not FElemLanguage.DB.Active then FElemLanguage.DBOpen;

  if aElem <> nil then
    SetPropInCxtLookupComboBox(LangComboBox, FElemLanguage.DS,'LANGUAGENAME',FElemLanguage.FieldKod, true)
   else
    SetPropInCxtLookupComboBox(LangComboBox, FElemLanguage.DS,'LANGUAGENAME',FElemLanguage.FieldKod, true,true);
 //**************  
 RefreshButt;
end;

procedure TFrmBrwsDic.ShowMemoPanel(aMemoPanel:TPanel;aSplitter:TSplitter;PanelOrig , PanelTransl:TPanel; Show:Boolean);
begin
 aMemoPanel.Visible :=Show;
 aSplitter.Visible  :=Show;
 aSplitter.Top:=aMemoPanel.Top;
 PanelTransl.Visible := LangCheckBox.Checked;
 PanelTransl.Realign;
 PanelOrig.Realign;
end;

procedure TFrmBrwsDic.CheckAvailableButton(aButt:TAction);
begin
  if (aButt.Enabled) then aButt.Enabled := not FReadOnly
end;
//******************************************************************************
procedure TFrmBrwsDic.CheckAvailableButtonOther(aButt:TToolbutton;ImageIndexNotReadOny,ImageIndexReadOny:Integer);
begin
   if FReadOnly then aButt.ImageIndex := ImageIndexReadOny
   else aButt.ImageIndex := ImageIndexNotReadOny;
end;
//******************************************************************************
procedure TFrmBrwsDic.RefreshButt;
begin
  ViewMemosTBtn.Visible := FieldMemView.Field <> '';
  //************************************************************
  LangPanel.Visible := ElemLanguage <> nil;
  LangComboBox.Enabled := LangCheckBox.Checked;

  LangPanel.Visible:= ElemLanguage <> nil;
  ShowMemoPanel( PanelViewMemText , SplitterMemPanel, PanelViewMemTextOriginal,PanelViewMemTextTransl, ViewMemosTBtn.Down );
  //************************************************************
  CheckAvailableButtonOther( EditTbtn, 1, 53);
  CheckAvailableButton( TAction(AppendTbtn.Action) );
  CheckAvailableButton( TAction(CopyTBtn.Action) );
  CheckAvailableButton( TAction(DeleteTbtn.Action) );
  CheckAvailableButton( TAction(ListingExport2ExcelBtn.Action) );
  //************************************************************  
  RefreshLanguage;
end;

procedure TFrmBrwsDic.RefreshLanguage;
begin
  if LangCheckBox.Checked then
   Elem.DBChangeLanguage( LangComboBox .EditValue )
  else
   Elem.DBChangeLanguage( 0 );

  Elem.ViewShowFieldForTranslate( LangCheckBox.Checked );
end;

procedure TFrmBrwsDic.SetFieldMemView(const Value: TFieldMemoBrws);
begin
  FFieldMemView := Value;
  MasterDBRichEdit.DataBinding.DataSource:= Elem.DS;
  MasterDBRichEdit.DataBinding.DataField := Value.Field;

  MasterDBRichEditTransl.DataBinding.DataSource:= Elem.DS;
  MasterDBRichEditTransl.DataBinding.DataField := Value.FieldTransl;
end;

procedure TFrmBrwsDic.FormShow(Sender: TObject);
begin
 RefreshButt;
end;

procedure TFrmBrwsDic.OkBtnClick(Sender: TObject);
begin
  ModalResult := mrOk;
end;

procedure TFrmBrwsDic.CancelBtnClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFrmBrwsDic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmBrwsDic.ActDBRefreshExecute(Sender: TObject);
begin
  FElem.Requery;
end;

procedure TFrmBrwsDic.ActViewFirstExecute(Sender: TObject);
begin
  Elem.View.DataController.GotoFirst;
end;

procedure TFrmBrwsDic.ActViewPrevExecute(Sender: TObject);
begin
  Elem.View.DataController.GotoPrev;
end;

procedure TFrmBrwsDic.ActViewNextExecute(Sender: TObject);
begin
   Elem.View.DataController.GotoNext;
end;

procedure TFrmBrwsDic.ActViewLastExecute(Sender: TObject);
begin
  Elem.View.DataController.GotoLast;
end;

procedure TFrmBrwsDic.ActInsertDBExecute(Sender: TObject);
begin
  Elem.DB.Append;
end;

procedure TFrmBrwsDic.ActDBEditExecute(Sender: TObject);
begin
  if not FReadOnly then Elem.DB.Edit
  else Elem.ViewActionValueDB;
end;

procedure TFrmBrwsDic.ActCopyRowExecute(Sender: TObject);
begin
  Elem.DBInsertCopyRow;
end;

procedure TFrmBrwsDic.ActViewDeleteExecute(Sender: TObject);
begin
  Elem.DeleteRecordFromView;
end;

procedure TFrmBrwsDic.ViewMemoExecute(Sender: TObject);
begin
  ViewMemo.Checked := not ViewMemo.Checked;
  ViewMemosTBtn.Down := ViewMemo.Checked;

  RefreshButt;
end;

procedure TFrmBrwsDic.ViewExportExcelExecute(Sender: TObject);
begin
  PrepareAndExportExel(Elem);
end; 

procedure TFrmBrwsDic.FormDestroy(Sender: TObject);
begin
  ClearElem;
  self := nil;
end;

procedure TFrmBrwsDic.LangComboBoxPropertiesEditValueChanged(
  Sender: TObject);
begin
  RefreshButt;
end;

procedure TFrmBrwsDic.SetReadOnly(const Value: Boolean);
begin
  FReadOnly := Value;
  RefreshButt;
end;

procedure TFrmBrwsDic.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
  if PanelViewMemTextTransl.Visible then
  begin
   PanelViewMemTextTransl.Width := PanelViewMemText.Width div 2;
   PanelViewMemTextOriginal.Width   := PanelViewMemTextTransl.Width;
  end
   else
     PanelViewMemTextOriginal.Width   := PanelViewMemText.Width;
end;

procedure TFrmBrwsDic.PopupMenuPopup(Sender: TObject);
begin
  PUpMenuSelectAll.Enabled := Elem.View<>nil;
end;

procedure TFrmBrwsDic.PUpMenuSelectAllClick(Sender: TObject);
begin
  Elem.ViewSelectAll;
end;

end.
