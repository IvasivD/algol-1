unit UnitFrameKindType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBExtLookupComboBox, StdCtrls, ExtCtrls, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid,Core,UnitProc, cxGroupBox;

type
  TParamFrameKindType = record
    ElemType:TDBShemaView;
    ElemKindType:TDBShemaView;
    ElemKindTypeRel:TDBShema;
    FieldKeyKindRelation:string;
    CaptonType:WideString;
    CaptionkindType:WideString;
  end;

  TFrameKindType = class(TFrame)
    PanelTop: TPanel;
    CityKindLabel: TLabel;
    CityKindComboBox: TcxExtLookupComboBox;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBoxkindType: TcxGroupBox;
    GridKindType: TcxGrid;
    GridKindTypeDBTableView1: TcxGridDBTableView;
    GridKindTypeLevel1: TcxGridLevel;
    procedure CityKindComboBoxPropertiesEditValueChanged(Sender: TObject);
  private
    { Private declarations }
    FIsChange  : boolean;
    FCanUpdate : Boolean;
    FparamFrame: TParamFrameKindType;
    FFunctRefresh:TNotifyEvent;
    FSaveVisibleColumn:Boolean;
    FAviewSaveKindType: TcxGridDBTableView;
    
    procedure FCallRefresh(Sender:TObject);
    Procedure FPrepare;
    procedure FViewCellClick(Sender: TcxCustomGridTableView;
              ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
              AShift: TShiftState; var AHandled: Boolean);
    procedure FRefreshControls;
    procedure FReadElemTypeRel;
  public
    { Public declarations }
    procedure DestroyFrame;
    procedure InitFrame( paramFrame: TParamFrameKindType;CanUpdate:Boolean;  aFunctRefresh:TNotifyEvent = nil );
    procedure SaveCheckRelation;
    function  CheckError( ShowErrorMes:Boolean = true ):Boolean;
    procedure ShowData( KidValue : Variant );
  published
    property IsChange : Boolean read FIsChange write FIsChange;
  end;

implementation

{$R *.dfm}
procedure TFrameKindType.InitFrame( paramFrame: TParamFrameKindType;CanUpdate:Boolean;  aFunctRefresh:TNotifyEvent = nil );
begin
  FparamFrame := paramFrame;
  FCanUpdate := CanUpdate;
  FFunctRefresh := aFunctRefresh;
  FPrepare;
end;

procedure TFrameKindType.DestroyFrame;
begin
  CityKindComboBox.Properties.View.Destroy;
  //FparamFrame.ElemKindType.VisibleOrderColumn( True );
  //FparamFrame.ElemKindType.VisibleCheckColumn( FSaveVisibleColumn );
  FparamFrame.ElemKindType.View.OptionsView.Header := True;
  FparamFrame.ElemKindType.ViewSetEnabled(True);
  //FparamFrame.ElemKindType.SetView( nil );
  //FparamFrame.ElemKindType.SetView( FAviewSaveKindType );

  self.FparamFrame.ElemKindType.AddCellClick( nil );
  FparamFrame.ElemKindType.ClearCheckRecordBySelectColumn( FparamFrame.ElemKindType.FindFirstCheckSelectedColumn );
end;

procedure TFrameKindType.FPrepare;
begin
  if FparamFrame.CaptonType <> '' then
    CityKindLabel.Caption := FparamFrame.CaptonType;

  if FparamFrame.CaptionkindType <>'' then
     GroupBoxkindType.Caption := FparamFrame.CaptionkindType;

  FparamFrame.ElemKindType.DBOpen;
  FparamFrame.ElemKindTypeRel.DBOpen;

  SetPropInCxExtLookupComboBox( CityKindComboBox, FparamFrame.ElemType.CloneViewList( self , false ) ,'NAME', FparamFrame.ElemType.FieldKod, FCanUpdate, false );
  FAviewSaveKindType := FparamFrame.ElemKindType.View;

  GridKindType.Levels[0].GridView := FparamFrame.ElemKindType.View;
  FSaveVisibleColumn := FparamFrame.ElemKindType.VisibleCheckColumn( True );
  //FparamFrame.ElemKindType.VisibleOrderColumn( False );
  FparamFrame.ElemKindType.View.OptionsView.Header := False;

  self.FparamFrame.ElemKindType.AddCellClick( FViewCellClick );

  if FparamFrame.ElemKindType.FieldNumber <> '' then
   if FparamFrame.ElemKindType.View.GetColumnByFieldName( FparamFrame.ElemKindType.FieldNumber )<> nil then
     FparamFrame.ElemKindType.View.GetColumnByFieldName( FparamFrame.ElemKindType.FieldNumber ).Visible := False;
end;

procedure TFrameKindType.FCallRefresh ( Sender:TObject );
begin
  if Sender <> nil  then IsChange := True;
  if @FFunctRefresh <> nil then FFunctRefresh( Sender );
end;

procedure TFrameKindType.FViewCellClick(Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  FCallRefresh(Sender);
end;

procedure TFrameKindType.FReadElemTypeRel;
var ColCheck : TcxGridDBColumn;
    currId : Variant;
begin
  self.FparamFrame.ElemKindTypeRel.DB.DisableControls;
  FparamFrame.ElemKindType.ClearCheckRecordBySelectColumn( FparamFrame.ElemKindType.FindFirstCheckSelectedColumn );
  try
    self.FparamFrame.ElemKindTypeRel.DB.First;
    while not self.FparamFrame.ElemKindTypeRel.DB.Eof do
    begin
      ColCheck := self.FparamFrame.ElemKindType.FindFirstCheckSelectedColumn;
      currId := self.FparamFrame.ElemKindTypeRel.DB.FieldByName(self.FparamFrame.FieldKeyKindRelation).Value;
      if self.FparamFrame.ElemKindType.DB.Locate( self.FparamFrame.ElemKindType.FieldKod, currId ,[] ) then
        self.FparamFrame.ElemKindType.AddCheckRecordBySelectColumn( ColCheck, currId );

      self.FparamFrame.ElemKindTypeRel.DB.Next;
    end;
  finally
    self.FparamFrame.ElemKindTypeRel.DB.EnableControls;
  end;
end;

procedure TFrameKindType.ShowData(  KidValue:Variant );
var IndColId:Integer;
begin
  IndColId := TcxGridDBTableView(CityKindComboBox.Properties.View ).GetColumnByFieldName(TcxGridDBTableView(CityKindComboBox.Properties.View ).DataController.KeyFieldNames).Index;
  if (KidValue = null )and( TcxGridDBTableView(CityKindComboBox.Properties.View ).ViewData.RowCount = 1) then
    KidValue := TcxGridDBTableView(CityKindComboBox.Properties.View ).ViewData.Rows[0].Values[ IndColId ];;

  CityKindComboBox.EditValue := KidValue;
  if FparamFrame.ElemType.DB.Locate( FparamFrame.ElemType.FieldKod, KidValue, [] ) then
  begin
    if not FparamFrame.ElemKindType.DB.IsEmpty then FReadElemTypeRel;
  end;
  self.FIsChange := False;
  self.FCallRefresh(nil);
  FRefreshControls;
end;

function TFrameKindType.CheckError( ShowErrorMes:Boolean = true ):Boolean;
begin
  Result := False;
  if ValidateValueControl( CityKindComboBox, '¬каж≥ть '+CityKindLabel.Caption  ) then
    result := True;
end;

procedure TFrameKindType.SaveCheckRelation;
var i:integer;
    currId:Variant;
    SaveIdBefore : TStringList;
    FindIndSave  : Integer;
begin
  try
    SaveIdBefore := CreateSaveListId( FparamFrame.ElemKindType.VIew, FparamFrame.ElemKindType.FieldKod );
    //**********************************
    for i:=0 to FparamFrame.ElemKindType.GetObjectCheckSelectedViewRow.Count-1 do
    begin
      currId:= PCheckViewColumn( FparamFrame.ElemKindType.GetObjectCheckSelectedViewRow.Items[i] ).idValue;

      if not FparamFrame.ElemKindTypeRel.DB.locate( FparamFrame.FieldKeyKindRelation, currId ,[] ) then
      begin
        FparamFrame.ElemKindTypeRel.DB.Insert;
        FparamFrame.ElemKindTypeRel.DB.FieldByName( FparamFrame.FieldKeyKindRelation ).Value := currId;
        FparamFrame.ElemKindTypeRel.DB.Post;
      end;

      FindIndSave:=SaveIdBefore.IndexOf( VarToStr( currId ) );
      if FindIndSave <> -1 then SaveIdBefore.Delete(FindIndSave);
    end;
    //**********************************
    for i:=0 to SaveIdBefore.Count-1 do
      if FparamFrame.ElemKindTypeRel.DB.Locate( FparamFrame.FieldKeyKindRelation, SaveIdBefore.Strings[i],[] ) then
        FparamFrame.ElemKindTypeRel.DB.Delete;
    //**********************************
    IsChange := false;
  finally
    SaveIdBefore.free;
  end;
end;

procedure TFrameKindType.FRefreshControls;
begin
  CityKindComboBox.Enabled := FCanUpdate;
  FparamFrame.ElemKindType.ViewSetEnabled( FparamFrame.ElemKindType.View.ViewData.RowCount <>0 );
end;

procedure TFrameKindType.CityKindComboBoxPropertiesEditValueChanged(
  Sender: TObject);
begin
  FCallRefresh(Sender);
  FRefreshControls;
end;

end.
