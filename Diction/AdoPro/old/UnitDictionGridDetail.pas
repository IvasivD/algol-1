unit UnitDictionGridDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
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
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, DB, cxDBData, ExtCtrls, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, core,
  UnitLngTranslate,UnitLngTranslateEdit, UnitDictionGrid,UnitProc,
  cxGridDBTableView, cxGrid, cxTextEdit, Buttons, StdCtrls,UnitGTranslate,
  cxPCdxBarPopupMenu, cxPC, cxTL, cxTLdxBarBuiltInMenu, cxInplaceContainer,
  cxTLData, cxDBTL, cxMaskEdit, cxDBExtLookupComboBox, Menus, ImgList,
  UnitFrameDic;

type
  TFrmEditDictDetail = class(TForm)
    Splitter1: TSplitter;
    FrameDic1: TFrameDic;
    FrameDicDetail: TFrameDic;
    {procedure butSearchClick(Sender: TObject);
    procedure butSearchDetailClick(Sender: TObject);
    procedure EdSearchKeyPress(Sender: TObject; var Key: Char);
    procedure EdSearchDetailKeyPress(Sender: TObject; var Key: Char);
    procedure butRefreshClick(Sender: TObject);
    procedure butAddClick(Sender: TObject);
    procedure butEditClick(Sender: TObject);
    procedure butDelClick(Sender: TObject);
    procedure ButTranslateLngClick(Sender: TObject);
    procedure ButTranslateLngDetailClick(Sender: TObject);
    procedure butRefreshDetailClick(Sender: TObject);
    procedure butAddDetailClick(Sender: TObject);
    procedure butEditDetailClick(Sender: TObject);
    procedure butDelDetailClick(Sender: TObject);
    procedure butMoveUpClick(Sender: TObject);
    procedure butMoveDownClick(Sender: TObject);
    procedure butMoveDetailUpClick(Sender: TObject);
    procedure butMoveDetailDownClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButShowLogClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure butAddToLevelClick(Sender: TObject);
    procedure butAddToSubLevelClick(Sender: TObject);
    procedure DBTreeListDblClick(Sender: TObject);
    procedure PMMainDetailTreePopup(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormActivate(Sender: TObject); }

  private
    { Private declarations }
    //FElem : TDBShemaView;
    //FElemDetail : TDBShema;

    Elem : TDBShemaView;
    ElemDetail : TDBShema;


    FCurrManager:Integer;
    FGoogleTranslate : TGoogleTranslate;
    //FSaveFocusedRecordChangedEvent : TcxGridFocusedRecordChangedEvent;
    //FSaveFocusedRecordChangedEventDetail : TcxGridFocusedRecordChangedEvent;
    //FSaveElemView:TcxGridDBTableView;
    //FSaveElemDetailView:TcxGridDBTableView;

   // FParamDicFormMain :  TParamFormDict;
   // FParamDicFormDetail: TParamFormDict;

    //FSaveFocusedRecordChanged :TcxGridFocusedRecordChangedEvent;
    //FSaveCellDblClick:TcxGridCellClickEvent;
    //FSaveUpdateForm:Boolean;

    //FSaveCellDblClickDetail:TcxGridCellClickEvent;
    //FSaveUpdateFormDetail:Boolean;

   { procedure FPrepare( aElem : TDBShemaView; aElemDetail:TDBShema );
    procedure FRefresh;
    procedure FInitElem( aElem : TDBShemaView; aElemDetail:TDBShema );

    procedure ViewElemCellDblClick(
          Sender: TcxCustomGridTableView;
          ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
          AShift: TShiftState; var AHandled: Boolean);

    procedure ViewElemDetailCellDblClick(
          Sender: TcxCustomGridTableView;
          ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
          AShift: TShiftState; var AHandled: Boolean);

    procedure ViewMainElemFocusedRecordChanged( Sender: TcxCustomGridTableView; APrevFocusedRecord,
         AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);

    procedure ViewDetailElemFocusedRecordChanged( Sender: TcxCustomGridTableView; APrevFocusedRecord,
         AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean); }

   // procedure FUpdateToolActions( Value:Integer );
  public
  published
   // property EnabledUpdate:Integer write FUpdateToolActions;
    { Public declarations }
  end;

 function ShowEditDictDetail( Caption:WideString; Elem: TDBShemaView; ElemDetail:TDBShema; GoogleTranslate : TGoogleTranslate; WidthForm, HeightForm, CurrManager:Integer;
                              ParamDicFormMain,ParamDicFormDetail: TParamFormDict  ):TForm;
var
  FrmEditDictDetail: TFrmEditDictDetail;

implementation

uses ServModIB;

{$R *.dfm}


function ShowEditDictDetail( Caption:WideString; Elem: TDBShemaView; ElemDetail:TDBShema; GoogleTranslate : TGoogleTranslate;  WidthForm, HeightForm, CurrManager:Integer;
                             ParamDicFormMain,ParamDicFormDetail: TParamFormDict  ):TForm;
var aFrmEditDictDetail:TForm;
begin
  ReplaseOn( Caption,'&','');
  aFrmEditDictDetail := FindFormByCaption(Caption);
  if ( aFrmEditDictDetail <> nil ) and ( Assigned(aFrmEditDictDetail) ) then
  begin
    FormFocus(aFrmEditDictDetail.Handle, SW_RESTORE );
    TFrmEditDictDetail(aFrmEditDictDetail).FCurrManager := CurrManager;
    aFrmEditDictDetail.FormStyle:= fsStayOnTop;
    aFrmEditDictDetail.FormStyle:= fsNormal;
    Exit;
  end
  else
  begin
    Application.CreateForm(TFrmEditDictDetail, aFrmEditDictDetail);
   { TFrmEditDictDetail(aFrmEditDictDetail).FCurrManager := CurrManager;
    aFrmEditDictDetail.Caption := Caption;
    TFrmEditDictDetail(aFrmEditDictDetail).FGoogleTranslate := GoogleTranslate;
    TFrmEditDictDetail(aFrmEditDictDetail).FPrepare( Elem, ElemDetail );
    aFrmEditDictDetail.Width := WidthForm;
    aFrmEditDictDetail.Height:= HeightForm;
    TFrmEditDictDetail(aFrmEditDictDetail).FParamDicFormMain := ParamDicFormMain;
    TFrmEditDictDetail(aFrmEditDictDetail).FParamDicFormDetail:=ParamDicFormDetail;  }

    aFrmEditDictDetail.Show;
  end;
  result := aFrmEditDictDetail;
end;


end.





  if ElemDetail is TDBShemaView then
    TDBShemaView(ElemDetail).View.BeginUpdate;

   if ElemDetail is TDBShemaView then
    TDBShemaView(ElemDetail).View.EndUpdate;

