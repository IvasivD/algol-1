unit UnitGridViewDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitGridView, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
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
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, Buttons, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid, core,UnitProc,
  StdCtrls, ExtCtrls, ImgList;

type
  TResGridViewDetail = record
     ElemId:Variant;
     ElemDetailDetail:Variant;
  end;

  TFrmGridViewDetail = class(TFrmGridView)
    Splitter1: TSplitter;
    PanelBottom: TPanel;
    PanelEditDetail: TPanel;
    butDelDetail: TSpeedButton;
    butEditDetail: TSpeedButton;
    butAddDetail: TSpeedButton;
    GridViewDetail: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    PaneDetaillMoveUpDown: TPanel;
    Bevel1: TBevel;
    butMoveDetailUp: TSpeedButton;
    butMoveDetailDown: TSpeedButton;
    procedure butDelDetailClick(Sender: TObject);
    procedure butEditDetailClick(Sender: TObject);
    procedure butAddDetailClick(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure butMoveUpClick(Sender: TObject);
    procedure butMoveDownClick(Sender: TObject);
  private
    { Private declarations }

    FElemDetail:TDBShemaView;
    FParamPanelEditDetail:TPanelEdit;
    FButOkCaptionDetail:TButModalProperty;
    FButCancelCaptionDetail:TButModalProperty;
    procedure InitDetailElem( aPanelEditDetail:TPanelEdit; DetailElem:TDBShemaView; ButOkCaption, ButCancelCaption:TButModalProperty );
    procedure FPreparePanleEditDetail( aParam : TPanelEdit; ButOkCaption, ButCancelCaption:TButModalProperty );

    procedure Refresh; overload;
    procedure ViewCellDblClick(
              Sender: TcxCustomGridTableView;
              ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
              AShift: TShiftState; var AHandled: Boolean);
  public
    { Public declarations }
    property ElemDetail:TDBShemaView read FElemDetail;
  end;
  
Function ShowGridViewDetail( FormCaption:Widestring;
                             Elem, ElemDetail:TDBShemaView; aPanelEdit, aPanelEditDetail:TPanelEdit;
                             ButOkCaption,
                             ButCancelCaption:TButModalProperty ):TResGridViewDetail;

var
  FrmGridViewDetail: TFrmGridViewDetail;

implementation

{$R *.dfm}

Function ShowGridViewDetail( FormCaption:Widestring;
                             Elem, ElemDetail:TDBShemaView; aPanelEdit, aPanelEditDetail:TPanelEdit;
                             ButOkCaption,
                             ButCancelCaption:TButModalProperty ):TResGridViewDetail;
begin

  try
    Application.CreateForm(TFrmGridViewDetail, FrmGridViewDetail);

    FrmGridViewDetail.FButOkCaptionDetail := ButOkCaption;
    FrmGridViewDetail.FButCancelCaptionDetail := ButCancelCaption;

    FrmGridViewDetail.InitTopElem( aPanelEdit, Elem, ButOkCaption, ButCancelCaption );
    FrmGridViewDetail.InitDetailElem( aPanelEditDetail, ElemDetail,ButOkCaption, ButCancelCaption  );

    FrmGridViewDetail.Caption := FormCaption;
    if FrmGridViewDetail.ShowModal = mrok then
    begin
      result.ElemId := Elem.GetValueId;
      Result.ElemDetailDetail := ElemDetail.GetValueId;
    end
    else
    begin
      result.ElemId := null;
      result.ElemDetailDetail := null;
    end;
    
  finally
    FrmGridViewDetail.Free;
  end;
end;

procedure TFrmGridViewDetail.InitDetailElem( aPanelEditDetail:TPanelEdit; DetailElem:TDBShemaView;ButOkCaption, ButCancelCaption:TButModalProperty  );
begin
  GridViewDetail.Levels[0].GridView := DetailElem.View;
  FElemDetail := DetailElem;
  DetailElem.DBOpen;
  FElemDetail.AddCellDblClick( ViewCellDblClick );
  FParamPanelEditDetail := aPanelEditDetail;
  FPreparePanleEditDetail( aPanelEditDetail, ButOkCaption, ButCancelCaption );
  PrepareShowEditPanel( PanelEditDetail, aPanelEditDetail );
  PaneDetaillMoveUpDown.Visible := FElemDetail.FieldNumber <> '';

  if aPanelEditDetail.WidthForm <> -1 then
    self.Width := aPanelEditDetail.WidthForm;
end;

procedure TFrmGridViewDetail.FPreparePanleEditDetail( aParam : TPanelEdit; ButOkCaption, ButCancelCaption:TButModalProperty );
var i:Integer;
begin
  PrepareButton( OkBtn, ButOkCaption );
  PrepareButton( CancelBtn, ButCancelCaption );

  PanelEditDetail.Visible:= False;
  //**************************************
  if PanelEditDetail.Visible then
  begin
    butAddDetail.Visible := aParam.Show[0];
    butEditDetail.Visible := aParam.Show[1];
    butDelDetail.Visible := aParam.Show[2];
  end;
end;


procedure TFrmGridViewDetail.Refresh;
begin
  if self.Name='' then exit;
  inherited;

  butEditDetail.Enabled :=(not FElemDetail.DB.IsEmpty){and (self.FCurrManager > 0)};
  butDelDetail.Enabled := (not FElemDetail.DB.IsEmpty){and (self.FCurrManager > 0)};
  butMoveDetailUp.Enabled := (FElemDetail.FieldNumber <>'') and (FElemDetail.CheckMoveUpRow){ and (self.FCurrManager > 0)};
  butMoveDetailDown.Enabled := (FElemDetail.FieldNumber <>'') and (FElemDetail.CheckMoveDownRow){ and (self.FCurrManager > 0)};
end;

procedure TFrmGridViewDetail.ViewCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  if (butEditDetail.Visible)and(PanelEditDetail.Visible) then
    butEditDetail.Click;
end;

procedure TFrmGridViewDetail.butDelDetailClick(Sender: TObject);
begin
  inherited;
  if @FParamPanelEditDetail.DelAction <> nil then
    FParamPanelEditDetail.DelAction(self.ElemDetail)
  else ElemDetail.DBDelete;

  Refresh;
end;

procedure TFrmGridViewDetail.butEditDetailClick(Sender: TObject);
begin
  inherited;
   if @FParamPanelEditDetail.EditAction <> nil then
    FParamPanelEditDetail.EditAction(ElemDetail)
  else
  begin
   if not ElemDetail.UpdateForm then
     ElemDetail.DBEdit(True);
  end;

  Refresh;
end;

procedure TFrmGridViewDetail.butAddDetailClick(Sender: TObject);
begin
  inherited;
  if @FParamPanelEditDetail.AddAction <> nil then
    FParamPanelEditDetail.AddAction(ElemDetail)
  else
  begin
   if not ElemDetail.UpdateForm then
     ElemDetail.DBInsert(True);
  end;
  
  Refresh;
end;

procedure TFrmGridViewDetail.OkBtnClick(Sender: TObject);
begin
  if @FButOkCaptionDetail.Action <> nil then
  begin
    if FButOkCaptionDetail.Action( Self.Elem, Self.ElemDetail ) then
      ConfirmClose := True
    else
      ConfirmClose := False;
  end
    else ConfirmClose := True;
end;

procedure TFrmGridViewDetail.CancelBtnClick(Sender: TObject);
begin
  if @FButCancelCaptionDetail.Action <> nil then
  begin
    if FButCancelCaptionDetail.Action( Self.Elem, self.ElemDetail ) then
      ConfirmClose := True
    else
      ConfirmClose := False;
  end
    else ConfirmClose := True;
end;

procedure TFrmGridViewDetail.butMoveUpClick(Sender: TObject);
begin
  inherited;
  FElemDetail.MoveUpRow;

  Refresh;
end;

procedure TFrmGridViewDetail.butMoveDownClick(Sender: TObject);
begin
  inherited;
  FElemDetail.MoveDownRow;

  Refresh;
end;

end.
