unit UnitDictionGrid;

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
  cxTextEdit, StdCtrls, Buttons, ExtCtrls, cxStyles, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView, UnitProc,
  cxGridDBTableView, cxGrid, ServModIB,IBQuery,UnitIBQuery,UnitGTranslate, Core,
  cefvcl, cxMaskEdit, cxDropDownEdit, cxImageComboBox,  OptSet, OrderUn,
  UnitFrameDescriptionWebHTML, Grids, DBGrids, cxImage,  cxTLData, cxDBTL,FrmProgress,
  cxPCdxBarPopupMenu, cxMemo, cxPC, UnitFrameDic;

type


  TFrmEditDict = class(TForm)
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);

  private
    FListFrame:TList;
    procedure FSetSizeFormDic( WidthForm, HeightForm :Integer);
    procedure FUpdateToolActions( Value:Integer );
    //procedure FpreparePanelGridHeight( CurrFrame:TFrameDic; currParamDic:TParamFormDict );

    function  FPrepareParentPanelIndex(CurrElemIndex:Integer; paramFormDic:TParamFormDict ): TComponent;
    procedure FPrepareFlemArr( ElemArr:array of TDBShema; AlignArr:array of TAlign; aParamDicForm:array of TParamFormDict );
    { Private declarations }

  protected
    FCurrManager:Integer;
  public
  published
    property EnabledUpdate:Integer write FUpdateToolActions;
    { Public declarations }
  end;

  function  ShowEditDict( Caption:WideString; ElemArr:array of TDBShema; AlignArr:array of TAlign;
                          WidthForm, HeightForm, CurrManager:Integer; aParamDicForm:array of TParamFormDict ):TForm;
  procedure ShowEditDictModal( Caption:WideString; ElemArr:array of TDBShema; AlignArr:array of TAlign;
                               WidthForm, HeightForm,CurrManager:Integer; aParamDicForm:array of TParamFormDict );
var
  FrmEditDict: TFrmEditDict;

implementation
uses  UnitLngTranslateEdit,UnitLngTranslate;
{$R *.dfm}


function ShowEditDict( Caption:WideString; ElemArr:array of TDBShema; AlignArr:array of TAlign; WidthForm, HeightForm, CurrManager :Integer; aParamDicForm:array of TParamFormDict ):TForm;
var aFrmEditDict:TForm;
    Progres : TProgressFormProp;
begin
  ReplaseOn( Caption,'&','');
  aFrmEditDict := FindFormByCaptionAndRestoreOnTop( Caption );
  if aFrmEditDict <> nil then
    TFrmEditDict(aFrmEditDict).FCurrManager := CurrManager
  else
  begin
    Application.CreateForm(TFrmEditDict, aFrmEditDict);

    try
      Progres := ShowProgress( WaitFormCaption );
      TFrmEditDict(aFrmEditDict).FCurrManager := CurrManager;
      aFrmEditDict.Caption := Caption;
      TFrmEditDict(aFrmEditDict).FSetSizeFormDic( WidthForm, HeightForm );
      TFrmEditDict(aFrmEditDict).FPrepareFlemArr( ElemArr, AlignArr, aParamDicForm );
    finally
      ClosedProgress( Progres.FormProgres );
    end;

    aFrmEditDict.Show;
  end;
  result := aFrmEditDict;
end;

procedure ShowEditDictModal( Caption:WideString; ElemArr:array of TDBShema; AlignArr:array of TAlign; WidthForm, HeightForm,CurrManager:Integer; aParamDicForm:array of TParamFormDict );
var aFrmEditDict:TForm;
begin
  try
    Application.CreateForm( TFrmEditDict, aFrmEditDict );
    TFrmEditDict(aFrmEditDict).FCurrManager := CurrManager;
    aFrmEditDict.Caption := Caption;
    TFrmEditDict(aFrmEditDict).FSetSizeFormDic( WidthForm, HeightForm );
    TFrmEditDict(aFrmEditDict).FPrepareFlemArr( ElemArr, AlignArr, aParamDicForm );
    
    aFrmEditDict.ShowModal;
  finally
    FreeAndNil( aFrmEditDict );
  end;
end;

{ TFrmEditDict }
procedure TFrmEditDict.FSetSizeFormDic( WidthForm, HeightForm :Integer);
begin
  self.Width := WidthForm;
  self.Height:= HeightForm;
  self.Constraints.MinWidth := WidthForm;
  self.Constraints.MinHeight := HeightForm;
end;

function TFrmEditDict.FPrepareParentPanelIndex( CurrElemIndex:Integer; paramFormDic:TParamFormDict ): TComponent;
var i:integer;
    CurrPanleName:String;
begin
  if paramFormDic.paramAlignPanel.IndexPanel <> -1 then
  begin
    CurrPanleName := 'PanelElem_'+IntToStr( paramFormDic.paramAlignPanel.IndexPanel );

    result := self.FindComponent( CurrPanleName );

    if result = nil then
    begin
      result := TPanel.Create(self);
      Tpanel(result).Parent := self;
      Tpanel(result).Align := paramFormDic.paramAlignPanel.Align;
      Tpanel(result).BevelOuter := bvNone;
      result.Name := CurrPanleName;
    end;
    
  end
  else result := Self;
end;

procedure TFrmEditDict.FPrepareFlemArr( ElemArr:array of TDBShema; AlignArr:array of TAlign;  aParamDicForm:array of TParamFormDict );
var i:integer;
    CurrFrame:TFrameDic;
    CurrSpliter:TSplitter;
//*****************************************************    
function GetAlignControl(aFrame:TFrameDic):TWinControl;
begin
  if aFrame.parent = Self then result := aFrame
  else result := aFrame.parent;
end;
//*****************************************************
begin
  for i:= 0 to Length(ElemArr)-1 do
  begin
    CurrFrame := TFrameDic.Create(self);
    CurrFrame.Parent := FPrepareParentPanelIndex( i, aParamDicForm[i] ) as TWinControl;

    CurrFrame.name := 'Frame_'+ElemArr[i].Name;
    CurrFrame.Align := AlignArr[i];

    CurrFrame.Init( ElemArr[i], FCurrManager, aParamDicForm[i] );

    if aParamDicForm[i].PanelGridHeight <> -1 then
    begin
      CurrFrame.Height := aParamDicForm[i].PanelGridHeight;
      CurrFrame.Constraints.MinHeight := CurrFrame.Height div 2;
    end else CurrFrame.PanelDescription.Height := self.Height div 2;

    if aParamDicForm[i].PanelGridWidth <> -1 then
    begin
      GetAlignControl(CurrFrame).Width := aParamDicForm[i].PanelGridWidth;
      GetAlignControl(CurrFrame).Constraints.MinWidth := GetAlignControl(CurrFrame).Width div 2;
    end else CurrFrame.PanelDescription.Width := self.Width div 2;

    if aParamDicForm[i].Description.DescriptionHeight <> -1 then
      CurrFrame.PanelDescription.Height := aParamDicForm[i].Description.DescriptionHeight;

    if aParamDicForm[i].paramAlignPanel.Splitter then
    begin
    
      CurrSpliter := TSplitter.Create(Self);
      //CurrSpliter.parent:= self;
      if (aParamDicForm[i].paramAlignPanel.SpliterOnPanel)and(CurrFrame.Parent <> Self) then
        CurrSpliter.parent:= GetAlignControl(CurrFrame)
      else CurrSpliter.parent:= self;
      
      CurrSpliter.Align := aParamDicForm[i].paramAlignPanel.SplitterAlign;
      //self.Realign;
      CurrFrame.Realign;

      if aParamDicForm[i].paramAlignPanel.SplitterAlign in [alLeft,alTop] then
      begin
        CurrSpliter.Left := CurrFrame.Left + CurrFrame.Width;
        CurrSpliter.Top := CurrFrame.Top + CurrFrame.Height;
      end;
      if aParamDicForm[i].paramAlignPanel.SplitterAlign in [alRight,alBottom] then
      begin
        CurrSpliter.Left := CurrFrame.Left ;
        CurrSpliter.Top := CurrFrame.Top ;
      end
    end;

    FListFrame.Add( CurrFrame );
  end;
  
  self.Realign;
end;

procedure TFrmEditDict.FUpdateToolActions( Value: Integer );
var i:Integer;
begin
  self.FCurrManager := Value;
  for i:= 0 to FListFrame.Count - 1 do
    TFrameDic(FListFrame.Items[i]).RefreshControls( self.FCurrManager );
end;

procedure TFrmEditDict.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure TFrmEditDict.FormCreate(Sender: TObject);
begin
  FListFrame := TList.Create;
end;

procedure TFrmEditDict.FormDestroy(Sender: TObject);
var i:Integer;
begin
  for i:= 0 to FListFrame.Count - 1 do
  begin
    TFrameDic(FListFrame.Items[i]).DestroyFrame;
    TFrameDic(FListFrame.Items[i]).Free;
  end;

  FListFrame.Free;
end;

procedure TFrmEditDict.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:= caFree;
end;

procedure TFrmEditDict.FormShow(Sender: TObject);
begin
  PositionFormCenterFromMainForm( self );
end;

end.
