unit UnitFrameUpdateImages;

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
  cxContainer, ExtCtrls, StdCtrls, cxTextEdit, cxMemo, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Buttons,Core, ExtDlgs,TourCmnlIf,OptSet,UnitProc,
  cxButtonEdit, cxCheckBox, cxDBEdit, cxImage,Math;

Const
  //SHtlDocFrmErrorFolderDis = 'Не можна скопіювати файл в папку "%s".';
  SVDlgsFileCopyFatal = 'Помилка при копіюванні файлу "%s" в "%s".';
  ErrMesSelectedFileIsNotIcon ='Вибраний файл не є графічним';
type
  TViewFieldImgUpd =record
     ElemImages:TDBShemaView;
     FieldId:string;
     FieldFileName:string;
     FieldWeb:string;
     FieldMemo:string;

     FieldObject:string;
     FieldObjValue:Variant;
  end;

  TFrameUpdateImages = class(TFrame)
    PanelLeft: TPanel;
    Panel9: TPanel;
    butAdd: TSpeedButton;
    butEdit: TSpeedButton;
    butDel: TSpeedButton;
    PanelMoveUpDown: TPanel;
    BevelMainSpliterMoveRows: TBevel;
    butMoveUp: TSpeedButton;
    butMoveDown: TSpeedButton;
    Bevel1: TBevel;
    Panel2: TPanel;
    GridImgListDBTableView1: TcxGridDBTableView;
    GridImgListLevel1: TcxGridLevel;
    GridImgList: TcxGrid;
    Panel3: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    Label2: TLabel;
    BtnDocCopyTo: TSpeedButton;
    BtnDocRename: TSpeedButton;
    Bevel2: TBevel;
    butShowCurrFile: TSpeedButton;
    butShowFileFolder: TSpeedButton;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    OpenPictureDialog: TOpenPictureDialog;
    SavePictureDialog: TSavePictureDialog;
    ImgListDS: TDataSource;
    cxGridViewRepository: TcxGridViewRepository;
    ViewImgList: TcxGridDBTableView;
    ViewImgListColumnID: TcxGridDBColumn;
    ViewImgListColumnOrder: TcxGridDBColumn;
    ViewImgListColumnFileName: TcxGridDBColumn;
    ViewImgListColumnSize: TcxGridDBColumn;
    ViewImgListColumnWeb: TcxGridDBColumn;
    MemDescript: TcxDBMemo;
    ViewImage: TcxImage;
    procedure butAddClick(Sender: TObject);
    procedure butEditClick(Sender: TObject);
    procedure butDelClick(Sender: TObject);
    procedure butMoveUpClick(Sender: TObject);
    procedure butMoveDownClick(Sender: TObject);
    procedure BtnDocCopyToClick(Sender: TObject);
    procedure butShowFileFolderClick(Sender: TObject);
    procedure butShowCurrFileClick(Sender: TObject);
    procedure BtnDocRenameClick(Sender: TObject);
    procedure ViewImgListColumnSizeGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: String);
    procedure ViewImgListColumnFileNamePropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
  private
    { Private declarations }
    FViewFieldImgUpd:TViewFieldImgUpd;
    FFieldImagePath:string;
    FNoPhotoFileName:string;
    FSaveView:TcxGridDBTableView;
    FFieldObjet:string;
    FieldObjValue:Variant;
    FIsChange:Boolean;

    Function  FAddImage:Boolean;

    procedure FPrepareControls;
    procedure FDoDocLaunch;
    procedure FDoDocOpenFolder;
    procedure FRefreshData;

    function  FDoDocCopyTo( FileName, NewName: String):boolean;
    procedure ViewGridDblClick(Sender: TObject);
    procedure ViewGridFocusedRecordChanged( Sender: TcxCustomGridTableView; APrevFocusedRecord,
                                            AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
  public
    { Public declarations }
    procedure Refresh;
    procedure InitComImageUpdateFrame( ViewFieldImgUpd : TViewFieldImgUpd; PathToImages, NoPhotoFileName :String; ViewStyle:TcxGridTableViewStyles = nil );
    procedure DeactiveImageUpdateFrame;
  published
    property IsChange : Boolean read FIsChange write FIsChange;
  end;

implementation

{$R *.dfm}

procedure TFrameUpdateImages.InitComImageUpdateFrame( ViewFieldImgUpd : TViewFieldImgUpd; PathToImages, NoPhotoFileName :String; ViewStyle:TcxGridTableViewStyles = nil );
begin
  FViewFieldImgUpd := ViewFieldImgUpd;
  FFieldImagePath := CheckLastSleshOnPath( PathToImages, True );
  FNoPhotoFileName := NoPhotoFileName;

  FPrepareControls;
  FSaveView := ViewFieldImgUpd.ElemImages.View;
  ViewFieldImgUpd.ElemImages.DBOpen;

  ImgListDS.DataSet := FViewFieldImgUpd.ElemImages.DB;
  ViewFieldImgUpd.ElemImages.View := ViewImgList;
  GridImgList.Levels[0].GridView := FViewFieldImgUpd.ElemImages.GetView;
  
  MemDescript.DataBinding.DataField := FViewFieldImgUpd.FieldMemo;
  ViewImgList.DataController.KeyFieldNames := FViewFieldImgUpd.ElemImages.FieldKod;

  TcxGridDBTableView(GridImgList.Levels[0].GridView).OnFocusedRecordChanged := ViewGridFocusedRecordChanged;
  TcxGridDBTableView(GridImgList.Levels[0].GridView).OnDblClick := ViewGridDblClick;
  if ViewStyle <> nil then
    TcxGridDBTableView(GridImgList.Levels[0].GridView).Styles := ViewStyle;

  FRefreshData;
end;

procedure TFrameUpdateImages.DeactiveImageUpdateFrame;
begin
  FViewFieldImgUpd.ElemImages.View := FSaveView;
  if FViewFieldImgUpd.ElemImages.DB.State in [dsEdit,dsInsert] then
    FViewFieldImgUpd.ElemImages.DB.Post;
end;

procedure TFrameUpdateImages.FPrepareControls;
begin
  ViewImgListColumnID.DataBinding.FieldName := self.FViewFieldImgUpd.FieldId;
  ViewImgListColumnOrder.DataBinding.FieldName := self.FViewFieldImgUpd.ElemImages.FieldNumber;
  ViewImgListColumnFileName.DataBinding.FieldName := self.FViewFieldImgUpd.FieldFileName;
  ViewImgListColumnWeb.DataBinding.FieldName := self.FViewFieldImgUpd.FieldWeb;
  ViewImgListColumnWeb.Visible := self.FViewFieldImgUpd.FieldWeb<>'';
  ViewImgListColumnOrder.Visible :=self.FViewFieldImgUpd.ElemImages.FieldNumber<>'';
  //***************************************************
  if FViewFieldImgUpd.ElemImages.DB.FieldByName(FViewFieldImgUpd.FieldWeb).DataType in [ftSmallint, ftInteger ] then
  begin
     TcxCheckBoxProperties( ViewImgListColumnWeb.Properties ).ValueUnchecked := 0;
     TcxCheckBoxProperties( ViewImgListColumnWeb.Properties ).ValueChecked := 1;
     TcxCheckBoxProperties( ViewImgListColumnWeb.Properties ).ValueGrayed := 0;
  end;

  if FViewFieldImgUpd.ElemImages.DB.FieldByName(FViewFieldImgUpd.FieldWeb).DataType in [ftString, ftWideString ] then
  begin
     TcxCheckBoxProperties( ViewImgListColumnWeb.Properties ).ValueUnchecked := 'F';
     TcxCheckBoxProperties( ViewImgListColumnWeb.Properties ).ValueChecked := 'T';
     TcxCheckBoxProperties( ViewImgListColumnWeb.Properties ).ValueGrayed := 'F';
  end;

  TcxButtonEditProperties(ViewImgListColumnFileName.Properties).OnButtonClick := ViewImgListColumnFileNamePropertiesButtonClick;
  //***************************************************
  butMoveUp.Enabled := FViewFieldImgUpd.ElemImages.FieldNumber <> '';
  butMoveDown.Enabled := FViewFieldImgUpd.ElemImages.FieldNumber <> '';
  Refresh;
end;

procedure TFrameUpdateImages.Refresh;
begin
  butEdit.Enabled :=(not FViewFieldImgUpd.ElemImages.DB.IsEmpty);
  butDel.Enabled := (not FViewFieldImgUpd.ElemImages.DB.IsEmpty);
  butMoveUp.Enabled := (FViewFieldImgUpd.ElemImages.FieldNumber <>'') and (FViewFieldImgUpd.ElemImages.CheckMoveUpRow);
  butMoveDown.Enabled := (FViewFieldImgUpd.ElemImages.FieldNumber <>'') and (FViewFieldImgUpd.ElemImages.CheckMoveDownRow);

  BtnDocCopyTo.Enabled := (not FViewFieldImgUpd.ElemImages.DB.IsEmpty);
  butShowCurrFile.Enabled := (not FViewFieldImgUpd.ElemImages.DB.IsEmpty);
  butShowFileFolder.Enabled := (not FViewFieldImgUpd.ElemImages.DB.IsEmpty);
end;

procedure TFrameUpdateImages.ViewGridDblClick(Sender: TObject);
begin
  if butEdit.Enabled then butEdit.Click;
end;

Function TFrameUpdateImages.FAddImage:Boolean;
var CurrFile:WideString;
    FName:string;
begin
  CurrFile := OpenGraphicFileName( self.FFieldImagePath );
  if CurrFile <> '^' then
  begin
    result := self.FDoDocCopyTo( CurrFile, Self.FFieldImagePath + ExtractFileName( CurrFile ) );
    if result then
    begin
      self.FViewFieldImgUpd.ElemImages.DBInsert;
      if not ( self.FViewFieldImgUpd.ElemImages.DB.State in [ dsInsert,dsEdit ] ) then
        self.FViewFieldImgUpd.ElemImages.DB.Edit;

      self.FViewFieldImgUpd.ElemImages.DB.FieldByName('FILENAME').AsString := ExtractFileName( CurrFile );
      if self.FViewFieldImgUpd.FieldObject <> '' then
        self.FViewFieldImgUpd.ElemImages.DB.FieldByName(self.FViewFieldImgUpd.FieldObject ).Value := self.FViewFieldImgUpd.FieldObjValue;
      self.FViewFieldImgUpd.ElemImages.DB.Post;
      FIsChange:=True;
    end;
  end
  else result := False;
end;

procedure TFrameUpdateImages.butAddClick(Sender: TObject);
begin
  FAddImage;
  Refresh;
end;

procedure TFrameUpdateImages.butEditClick(Sender: TObject);
begin
  if FViewFieldImgUpd.ElemImages.DBEdit( True ) then
    FIsChange := True;

  Refresh;
end;

procedure TFrameUpdateImages.FRefreshData;
var LinkPathToPhoto:String;
begin
  LinkPathToPhoto := self.FFieldImagePath + FViewFieldImgUpd.ElemImages.DB.FieldByName('FILENAME').asString;
  LoadPhotoToImage( ViewImage, LinkPathToPhoto, FNoPhotoFileName );

  Refresh;
end;

procedure TFrameUpdateImages.ViewGridFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
begin
  FRefreshData;
end;

procedure TFrameUpdateImages.butDelClick(Sender: TObject);
begin
  FViewFieldImgUpd.ElemImages.DBDelete;
  Refresh;
end;

procedure TFrameUpdateImages.butMoveUpClick(Sender: TObject);
begin
  FViewFieldImgUpd.ElemImages.MoveUpRow;
  Refresh;
end;

procedure TFrameUpdateImages.butMoveDownClick(Sender: TObject);
begin
  FViewFieldImgUpd.ElemImages.MoveDownRow;
  Refresh;
end;

function TFrameUpdateImages.FDoDocCopyTo( FileName, NewName: String):boolean;
begin
  MyCopyFile( FileName ,NewName  );
  if not FileExists(NewName) then
  begin
    result := False;
    MyShowMessageDlg(  Format(SVDlgsFileCopyFatal, [ExtractFileName(FileName), ExtractFileName(NewName) ] ),mtError, but_OK )
  end
  else result := True;
end;

procedure TFrameUpdateImages.BtnDocCopyToClick(Sender: TObject);
begin
  with SaveDialog do
  begin
    FileName := FViewFieldImgUpd.ElemImages.DB.FieldByName('FILENAME').asString;
    Filter := OpenDialog.Filter;
    if Execute then
      FDoDocCopyTo( FileName, self.FFieldImagePath + ExtractFileName(FileName) );
  end;
  Refresh;
end;

procedure TFrameUpdateImages.FDoDocOpenFolder;
begin
  ShellOutward( ExtractFileDir( self.FFieldImagePath + FViewFieldImgUpd.ElemImages.DB.FieldByName('FILENAME').asString ), '', '', '', SW_NORMAL);
end;

procedure TFrameUpdateImages.FDoDocLaunch;
begin
  ShellOpenDocument( self.FFieldImagePath + FViewFieldImgUpd.ElemImages.DB.FieldByName('FILENAME').asString );
end;

procedure TFrameUpdateImages.butShowFileFolderClick(Sender: TObject);
begin
  FDoDocOpenFolder;
end;

procedure TFrameUpdateImages.butShowCurrFileClick(Sender: TObject);
begin
  FDoDocLaunch;
end;

procedure TFrameUpdateImages.BtnDocRenameClick(Sender: TObject);
var OldDir, FName: String;
begin
 { with SaveDialog do
  begin
    Filter := OpenDialog.Filter;
    OldDir := InitialDir;
    InitialDir := GetDocumentFolder;
    Options := Options + [ofNoChangeDir];
    if Execute then
    begin
      FName := UkraineToEnglish(FileName);
      if PosSubString(GetUNCFileName(OptionSet.StoreFolder), GetUNCFileName(FName)) <> 1
        then ErrorDlg(SHtlDocFrmErrorFolderChange)
      else if FileExists(FileName) then ErrorFmtDlg(SVDlgsFileExistsFatal, [FName])
      else DoDocRename(FName);
    end;
    Options := Options - [ofNoChangeDir];
    InitialDir := OldDir;
  end;}
end;

procedure TFrameUpdateImages.ViewImgListColumnSizeGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: String);
var indColFileName:Integer;
    FileName:string;
begin
   indColFileName := TcxGridDBTableView(Sender.GridView).GetColumnByFieldName(self.FViewFieldImgUpd.FieldFileName).Index;
   FileName := self.FFieldImagePath + ARecord.Values[indColFileName];
   if FileExists(FileName) then
     AText :=  FormatFloat('### ###.##', Ceil( MyGetFileSize( FileName ) / 1024 ) )+' КБ'
   else AText :='немає';
end;

procedure TFrameUpdateImages.ViewImgListColumnFileNamePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var SelectFile:string;
    PathToImage:string;
    NewFileName:string;
begin

  SelectFile :=OpenGraphicFileName('');         //GetMaskFilterGraphicFiles
  if SelectFile <> '^' then
  begin
    if not CheckExtOnGraficFile( ExtractFileExt(SelectFile) ) then
      MyShowMessageDlg( ErrMesSelectedFileIsNotIcon, mtError, but_Ok )
    else
    //if not FileGraphicCheckOnSize( SelectFile,16,16 ) then
    //  MyShowMessageDlg( ErrMesSelectedFileIsNotIcon16_16, mtError, but_Ok )
    //else
    begin
      NewFileName := ExtractFileName(SelectFile);
      if FDoDocCopyTo( SelectFile, FFieldImagePath + NewFileName ) then
        FViewFieldImgUpd.ElemImages.UpdateVerticalGridFocusValue( Sender, NewFileName );
    end;
  end;
end;

end.
