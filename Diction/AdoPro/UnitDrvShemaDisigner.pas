unit UnitDrvShemaDisigner;

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
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, ExtCtrls, StdCtrls, Spin, core,
  Buttons,UnitVehiclePlace, cxGridBandedTableView, Menus, cxContainer,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxRadioGroup, cxGroupBox,UnitProc,TourConsts,
  ImgList, ServModIB;

Const MessageForDelShema='Видалити схему?';
      MessageCountPlaceIsWrong='Кількість місць на схемі не відповідає заданій.';

type

  TFrmDrvShemaDisigner = class(TForm)
    CtrlPanel: TPanel;
    CancelBtn: TBitBtn;
    DriveModelPanel: TPanel;
    SettingsPanel: TPanel;
    SizeGroupBox: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    HSizeEdit: TcxSpinEdit;
    VSizeEdit: TcxSpinEdit;
    GridShemaDrv: TcxGrid;
    GridShemaDrvDBTableView1: TcxGridDBTableView;
    GridShemaDrvLevel2: TcxGridLevel;
    cxGridViewRepository1: TcxGridViewRepository;
    ViewVEHICLE: TcxGridBandedTableView;
    PopupMenuDesigner: TPopupMenu;
    butSetPlace: TMenuItem;
    butSetExit: TMenuItem;
    butSetHole: TMenuItem;
    butSetTable: TMenuItem;
    butPlaceStaf: TMenuItem;
    butPlaceStafAndExit: TMenuItem;
    butPlaceDriver: TMenuItem;
    butSetWC: TMenuItem;
    N6: TMenuItem;
    butChangeDirect: TMenuItem;
    ButFoldingBackrest: TMenuItem;
    butDelSelectedCellValue: TMenuItem;
    butDelSelectedRow: TMenuItem;
    butDelSelectedCol: TMenuItem;
    N14: TMenuItem;
    butAddCol: TMenuItem;
    butAddRow: TMenuItem;
    N21: TMenuItem;
    ButBundExchange: TMenuItem;
    butDelBand: TMenuItem;
    N1: TMenuItem;
    butBuildTemplate: TSpeedButton;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    cxGroupBox1: TcxGroupBox;
    rbByRows: TcxRadioButton;
    RBByToColumns: TcxRadioButton;
    HorizontalGroupBox: TGroupBox;
    ClearBtn: TSpeedButton;
    RBNumber: TcxRadioButton;
    RBCharset: TcxRadioButton;
    RbLeftToRight: TcxRadioButton;
    RBRightToLeft: TcxRadioButton;
    HorizontalImage: TImage;
    VerticalGroupBox: TGroupBox;
    VerticalImage: TImage;
    RbUpToDown: TcxRadioButton;
    RbDownToUp: TcxRadioButton;
    ImageList: TImageList;
    ViewVEHICLEColumn1: TcxGridBandedColumn;
    ViewVEHICLEColumn2: TcxGridBandedColumn;
    GroupBox2: TGroupBox;
    RBFirstLevel: TcxRadioButton;
    RBLastLevel: TcxRadioButton;
    RBSelfLevel: TcxRadioButton;
    N2: TMenuItem;
    BtnSaveData: TBitBtn;
    procedure butPlaceDriverClick(Sender: TObject);
    procedure butPlaceStafClick(Sender: TObject);
    procedure butPlaceStafAndExitClick(Sender: TObject);
    procedure butSetPlaceClick(Sender: TObject);
    procedure butSetHoleClick(Sender: TObject);
    procedure butSetExitClick(Sender: TObject);
    procedure butSetTableClick(Sender: TObject);
    procedure butSetWCClick(Sender: TObject);
    procedure butChangeDirectClick(Sender: TObject);
    procedure ButFoldingBackrestClick(Sender: TObject);
    procedure butDelSelectedCellValueClick(Sender: TObject);
    procedure butDelSelectedRowClick(Sender: TObject);
    procedure butDelSelectedColClick(Sender: TObject);
    procedure butAddColClick(Sender: TObject);
    procedure ButBundExchangeClick(Sender: TObject);
    procedure butDelBandClick(Sender: TObject);
    procedure PopupMenuDesignerPopup(Sender: TObject);
    procedure butBuildTemplateClick(Sender: TObject);
    procedure ClearBtnClick(Sender: TObject);
    procedure RbLeftToRightClick(Sender: TObject);
    procedure RBNumberClick(Sender: TObject);
    procedure butAddRowClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure BtnSaveDataClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    //FParamShemaDesigner : TParamShemaDesigner;

    FVehicleShemaDrvPlaceView : TVehiclePlaceView;
    FImgListIcon : TImageList;
    FImgListDirection : TImageList;

    FElemDrive  : TDBShema;
    FElemDrvKind: TDBShema;
    FElemDrvMap : TDBShema;
    FElemShemaVehicleDetail : TDBShema;
    FPlaceCount : Integer;
    function FSaveData:Boolean;
    procedure FReadOptionMap;
    procedure FSaveOptionMap;
    procedure FPrepareVehicleShema;
    procedure FRefreshControls;
    procedure FRecalculate;
    procedure FPrepare;
    procedure ActRefreshControls(Sender: TObject);
  public
    { Public declarations }
  end;
procedure ShowDrvShemaDisigner( ElemDrive,ElemDrvKind, ElemDrvMap, ElemShemaVehicleDetail:TDBShema; PlaceCount:Integer );
var
  FrmDrvShemaDisigner: TFrmDrvShemaDisigner;

implementation

{$R *.dfm}
procedure ShowDrvShemaDisigner( ElemDrive, ElemDrvKind, ElemDrvMap, ElemShemaVehicleDetail:TDBShema; PlaceCount:Integer  );
begin
  try
    Application.CreateForm(TFrmDrvShemaDisigner, FrmDrvShemaDisigner);

    FrmDrvShemaDisigner.FElemDrive := ElemDrive;
    FrmDrvShemaDisigner.FElemDrvKind := ElemDrvKind;
    FrmDrvShemaDisigner.FElemDrvMap := ElemDrvMap;
    FrmDrvShemaDisigner.FElemShemaVehicleDetail := ElemShemaVehicleDetail;
    FrmDrvShemaDisigner.FPlaceCount := PlaceCount;


    //FrmDrvShemaDisigner.FImgListIcon := ImgListIcon;
    //FrmDrvShemaDisigner.FImgListDirection :=ImgListDirection;

    FrmDrvShemaDisigner.FPrepare;
    FrmDrvShemaDisigner.ShowModal;
  finally
    FrmDrvShemaDisigner.FElemShemaVehicleDetail.LogOnOff( True );
    FrmDrvShemaDisigner.Free;
  end;
end;


function TFrmDrvShemaDisigner.FSaveData:Boolean;
begin
  result := False;
  if FPlaceCount<>FVehicleShemaDrvPlaceView.CountAllPlaceFromView then
  begin
     MyShowMessageDlg( MessageCountPlaceIsWrong, mtError, but_Ok );
     exit;
  end;

  FElemShemaVehicleDetail.LogOnOff( false );
  FVehicleShemaDrvPlaceView.SaveData(1);
  FSaveOptionMap;
  FElemShemaVehicleDetail.Requery;
  FRefreshControls;
  result := True;
end;

procedure TFrmDrvShemaDisigner.FReadOptionMap;
begin
  RBNumber.Checked := MyIfThen( FElemDrvMap.DB.FieldByName('NUMBERDIRECTION').asInteger=0,True,False);
  RBCharset.Checked := not RBNumber.Checked;
  
  RbByRows.Checked := MyIfThen( FElemDrvMap.DB.FieldByName('GORIZONTDIRECTION').asInteger=0,True,False);
  RBByToColumns.Checked := not RbByRows.Checked;

  RbUpToDown.Checked := MyIfThen ( FElemDrvMap.DB.FieldByName('VERTICALDIRECTION').asInteger=0,TRue,False) ;
  RbDownToUp.Checked := not RbUpToDown.Checked;
end;

procedure TFrmDrvShemaDisigner.FSaveOptionMap;
begin
  if FElemDrvMap.DB.State in [dsBrowse] then FElemDrvMap.DB.Edit;
  FElemDrvMap.DB.FieldByName('PLACECOUNT').AsInteger := FVehicleShemaDrvPlaceView.CountAllPlaceFromView;
  FElemDrvMap.DB.FieldByName('NUMBERDIRECTION').asInteger := MyIfThen( RBNumber.Checked,0,1);
  FElemDrvMap.DB.FieldByName('GORIZONTDIRECTION').asInteger := MyIfThen( RbByRows.Checked,0,1);
  FElemDrvMap.DB.FieldByName('VERTICALDIRECTION').asInteger := MyIfThen( RbUpToDown.Checked,0,1);
  FElemDrvMap.DB.Post;
end;

procedure TFrmDrvShemaDisigner.FPrepareVehicleShema;
begin
  FVehicleShemaDrvPlaceView := DMServIB.PrepareVehicleShema( FElemShemaVehicleDetail, ViewVEHICLE );
  FVehicleShemaDrvPlaceView.SetLevelParam( FElemDrvKind.DB.fieldByName('NAME_LEVEL').AsString );
  FVehicleShemaDrvPlaceView.SetRefreshFunction( ActRefreshControls );
  FVehicleShemaDrvPlaceView.View;

  HSizeEdit.EditValue := FVehicleShemaDrvPlaceView.GetCountMaxColLevel;
  VSizeEdit.EditValue := FVehicleShemaDrvPlaceView.GetCountRow;
end;

procedure TFrmDrvShemaDisigner.FPrepare;
begin
  FPrepareVehicleShema;

  DriveModelPanel.Caption :=  Format( SDriveDlgDriveModel, [ FElemDrive.DB.FieldByName('LookDriveKind').asString,
                                                             FElemDrive.DB.FieldByName('MODEL').asString,
                                                             FElemDrive.DB.FieldByName('PLACECOUNT').asInteger] );
  FReadOptionMap;
  FRefreshControls;
end;
procedure TFrmDrvShemaDisigner.butPlaceDriverClick(Sender: TObject);
begin
  FVehicleShemaDrvPlaceView.MakeSelectedToObject( -6 );
end;

procedure TFrmDrvShemaDisigner.butPlaceStafClick(Sender: TObject);
begin
  FVehicleShemaDrvPlaceView.MakeSelectedToObject( -4 );
end;

procedure TFrmDrvShemaDisigner.butPlaceStafAndExitClick(Sender: TObject);
begin
  FVehicleShemaDrvPlaceView.MakeSelectedToObject( -5 );
end;

procedure TFrmDrvShemaDisigner.butSetPlaceClick(Sender: TObject);
begin
  FVehicleShemaDrvPlaceView.MakeSelectedToObject( 0, 0 );
end;

procedure TFrmDrvShemaDisigner.butSetHoleClick(Sender: TObject);
begin
  FVehicleShemaDrvPlaceView.MakeSelectedToObject( -2 );
end;

procedure TFrmDrvShemaDisigner.butSetExitClick(Sender: TObject);
begin
  FVehicleShemaDrvPlaceView.MakeSelectedToObject( -1 );
end;

procedure TFrmDrvShemaDisigner.butSetTableClick(Sender: TObject);
begin
  FVehicleShemaDrvPlaceView.MakeSelectedToObject( -3 );
end;

procedure TFrmDrvShemaDisigner.butSetWCClick(Sender: TObject);
begin
  FVehicleShemaDrvPlaceView.MakeSelectedToObject( -7 );
end;

procedure TFrmDrvShemaDisigner.butChangeDirectClick(Sender: TObject);
var Direct:Variant;
begin
  Direct := FVehicleShemaDrvPlaceView.GetSelectionDirect;
  if Direct<>null then
  begin
    if ( Direct = 0 )then Direct:=1
    else
    if ( Direct = 1 )then Direct:=0
    else
    if ( Direct = 2 )then Direct:=3
    else
    if ( Direct = 3 )then Direct:=2;

    FVehicleShemaDrvPlaceView.SetDirectionForSelected(Direct);
  end;

end;

procedure TFrmDrvShemaDisigner.ButFoldingBackrestClick(Sender: TObject);
var Direct:Variant;
begin
  Direct := FVehicleShemaDrvPlaceView.GetSelectionDirect;
  if Direct<>null then
  begin
    if ( Direct = 0 )then Direct:=2
    else
    if ( Direct = 1 )then Direct:=3
    else
    if ( Direct = 2 )then Direct:=0
    else
    if ( Direct = 3 )then Direct:=1;

    FVehicleShemaDrvPlaceView.SetDirectionForSelected(Direct);
  end;
end;

procedure TFrmDrvShemaDisigner.butDelSelectedCellValueClick(Sender: TObject);
begin
  FVehicleShemaDrvPlaceView.ClearSelectedValue;
end;

procedure TFrmDrvShemaDisigner.butDelSelectedRowClick(Sender: TObject);
begin
  FVehicleShemaDrvPlaceView.DelRows;
end;

procedure TFrmDrvShemaDisigner.butDelSelectedColClick(Sender: TObject);
begin
  FVehicleShemaDrvPlaceView.DelColumns;
end;

procedure TFrmDrvShemaDisigner.butAddColClick(Sender: TObject);
begin
  FVehicleShemaDrvPlaceView.AddCol;
end;

procedure TFrmDrvShemaDisigner.butAddRowClick(Sender: TObject);
begin
  FVehicleShemaDrvPlaceView.AddRow;
end;

procedure TFrmDrvShemaDisigner.ButBundExchangeClick(Sender: TObject);
begin
  FVehicleShemaDrvPlaceView.ExChangeLevelBySelectedColumn;
end;

procedure TFrmDrvShemaDisigner.butDelBandClick(Sender: TObject);
begin
  FVehicleShemaDrvPlaceView.DeleteLevelBySelectedColumn;
end;

procedure TFrmDrvShemaDisigner.PopupMenuDesignerPopup(Sender: TObject);
var Direct:Variant;
begin
  ButBundExchange.Enabled := FVehicleShemaDrvPlaceView.CanExChangeLevelBySelectedColumn;
  Direct := FVehicleShemaDrvPlaceView.GetSelectionDirect;
  ButFoldingBackrest.Checked := (Direct<>null)and((Direct=0)or(Direct=1));
end;

procedure TFrmDrvShemaDisigner.FRefreshControls;
begin
  if RbLeftToRight.Checked then ImageListIndexToImage( HorizontalImage, ImageList, 0 )
  else ImageListIndexToImage( HorizontalImage, ImageList, 1 );

  BtnSaveData.Enabled := FVehicleShemaDrvPlaceView.ShemaIsChange;
end;

procedure TFrmDrvShemaDisigner.FRecalculate;
var NumbOnLevel:Integer;
begin
  if RBFirstLevel.Checked then NumbOnLevel :=0;
  if RBLastLevel.Checked  then NumbOnLevel :=1;
  if RBSelfLevel.Checked  then NumbOnLevel :=2;

  FVehicleShemaDrvPlaceView.RenumberPlaces ( MyIfThen(RBNumber.Checked,0,1), RBByRows.Checked, RBRightToLeft.Checked, NumbOnLevel );
end;

procedure TFrmDrvShemaDisigner.butBuildTemplateClick(Sender: TObject);
begin
  HSizeEdit.PostEditValue;
  VSizeEdit.PostEditValue;
  FVehicleShemaDrvPlaceView.AddLevel(  VSizeEdit.EditValue, HSizeEdit.EditValue );
end;

procedure TFrmDrvShemaDisigner.ClearBtnClick(Sender: TObject);
begin
  if ( ( FVehicleShemaDrvPlaceView.ShemaIs ) and
     ( MyShowMessageDlg( MessageForDelShema, mtConfirmation, but_YES_NO ) = Res_YES )) or
     ( not FVehicleShemaDrvPlaceView.ShemaIs ) then
    FVehicleShemaDrvPlaceView.ClearAll;
end;

procedure TFrmDrvShemaDisigner.RbLeftToRightClick(Sender: TObject);
begin
  FRecalculate;
  FRefreshControls;
end;

procedure TFrmDrvShemaDisigner.RBNumberClick(Sender: TObject);
begin
  FRecalculate;
end;

procedure TFrmDrvShemaDisigner.N2Click(Sender: TObject);
begin
  FVehicleShemaDrvPlaceView.MakeSelectedToObject( -8 );
end;

procedure TFrmDrvShemaDisigner.ActRefreshControls(Sender: TObject);
begin
  FRefreshControls;
end;

procedure TFrmDrvShemaDisigner.BtnSaveDataClick(Sender: TObject);
begin
  FSaveData;
end;

procedure TFrmDrvShemaDisigner.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if BtnSaveData.Enabled then
    if MyShowMessageDlg( AskChangeDataSave, mtConfirmation, but_YES_NO ) = Res_YES then
       CanClose := self.FSaveData;
end;


end.
