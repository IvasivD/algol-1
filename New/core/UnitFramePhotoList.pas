unit UnitFramePhotoList;

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
  cxTextEdit, cxMemo, Buttons, ExtCtrls, Core, UnitProc, cxImage, StdCtrls, ImageMD,
  DB, Grids, DBGrids, UnitUpdateImages, UnitFrameUpdateImages, ActnList,cxGridTableView;

type
  TFramePhotoList = class(TFrame)
    PhotoPanel: TPanel;
    PanelCanvas: TPanel;
    PanelBottom: TPanel;
    Panel2: TPanel;
    MemoDescript: TcxMemo;
    ImgShow: TcxImage;
    PanelInfoButton: TPanel;
    PanelFotoDate: TPanel;
    LbDateOfFoto: TLabel;
    Panel1: TPanel;
    PriorImageBtn: TSpeedButton;
    NextImageBtn: TSpeedButton;
    butEditFoto: TSpeedButton;
    ActionList1: TActionList;
    EditFoto: TAction;
    procedure PriorImageBtnClick(Sender: TObject);
    procedure NextImageBtnClick(Sender: TObject);
    procedure ImgShowDblClick(Sender: TObject);
    procedure EditFotoExecute(Sender: TObject);
  private
    { Private declarations }
    FImageMetaData: TIMageMetaData;
    FElemDBPhoto : TDBShemaView;
    FRootPath : String;
    //FFieldNamePathToPhoto : String;
    //FFieldNameDescript : String;
    FNoPhotoFileName : string;
    FCurrImageFile : string;
    FCaptionFotoDate:string;
    FCanUpdateFoto :Boolean;
    FShowPanelFotoDate :Boolean;
    FViewEditFotoStyles:TcxGridTableViewStyles;
    FImgUpdPrperty:TViewFieldImgUpd;
    FFunctShowUpdateImage : TFunctShowUpdateImage;

    procedure FRefreshControls;
    function  FGetCurrentFilePhoto(aFieldName:String):string;
    procedure FShowCurrentPhoto(aFieldName:String);
    procedure FShowCurrentPhotoDescript( aFieldNamePic, aFieldNameDescript:String );
    procedure FShowMouseCursorLoad;
    procedure FShowMouseCursorDefault;

  public
    { Public declarations }
     procedure IntitListPhotoFrame( ImgUpdPrperty:TViewFieldImgUpd;NoPhotoFileName:string='';ViewEditFotoStyles:TcxGridTableViewStyles=nil );
     procedure Refresh(RootPath:String; ShowLoadMouseCursor:Boolean=false);
     procedure ClearImage;
     procedure SetEnabled( En:Boolean );
     procedure SetShowDateFoto( En:Boolean;aCaption:string );
     procedure SetShowCanUpdateFoto( En:Boolean );
     procedure SetFunctionUpdateImage( aFunctShowUpdateImage:TFunctShowUpdateImage );
  end;

Function MyReadOriginFotoDate(const FotoFile: string):String;
implementation

{$R *.dfm}

{ TFramePhotoList }

procedure TFramePhotoList.IntitListPhotoFrame( ImgUpdPrperty:TViewFieldImgUpd;NoPhotoFileName:string='';ViewEditFotoStyles:TcxGridTableViewStyles=nil );
begin
  FElemDBPhoto := ImgUpdPrperty.ElemImages;
  FElemDBPhoto.DBOpen(true);

  // FFieldNamePathToPhoto := FieldNamePathToPhoto;
  // FFieldNameDescript := FieldNameDescript;
  FImgUpdPrperty:=ImgUpdPrperty;
  MemoDescript.Visible := FImgUpdPrperty.FieldMemo <>'';
  FNoPhotoFileName := NoPhotoFileName;
  FCaptionFotoDate := '';
  LbDateOfFoto.Caption := '';
  FShowPanelFotoDate := False;
  FViewEditFotoStyles := ViewEditFotoStyles;
  FCanUpdateFoto := True;
end;

procedure TFramePhotoList.SetEnabled( En:Boolean );
begin
  MemoDescript.Enabled := En;
  PriorImageBtn.Enabled := En;
  NextImageBtn.Enabled := En;
  ImgShow.Enabled := En;
  butEditFoto.Visible := FCanUpdateFoto;
end;

procedure TFramePhotoList.SetShowDateFoto( En:Boolean;aCaption:string );
begin
  FCaptionFotoDate := aCaption;
  FShowPanelFotoDate := En;
end;

procedure TFramePhotoList.SetShowCanUpdateFoto( En:Boolean );
begin
  FCanUpdateFoto := En;
  FRefreshControls;
end;

procedure TFramePhotoList.SetFunctionUpdateImage( aFunctShowUpdateImage:TFunctShowUpdateImage );
begin
   FFunctShowUpdateImage := aFunctShowUpdateImage;
end;

procedure TFramePhotoList.FRefreshControls;
begin
  if FElemDBPhoto = nil then exit;

  PriorImageBtn.Enabled := ( not FElemDBPhoto.DB.Bof ) and ( FElemDBPhoto.DBRecordCount > 1 );
  NextImageBtn.Enabled :=  ( not FElemDBPhoto.DB.Eof ) and ( FElemDBPhoto.DBRecordCount > 1 );  //RecNo<FElemDBPhoto.DB.RecordCount

  PanelFotoDate.Visible := FShowPanelFotoDate;
  butEditFoto.Visible := FCanUpdateFoto;
end;

function TFramePhotoList.FGetCurrentFilePhoto(aFieldName:String):string;
begin
  result := FRootPath + FElemDBPhoto.DB.FieldByName(aFieldName).AsString;
end;

procedure TFramePhotoList.FShowCurrentPhoto(aFieldName:String);
var LinkPathToPhoto:String;
begin
  LinkPathToPhoto := FGetCurrentFilePhoto( aFieldName );
  if CompareText( LinkPathToPhoto , FCurrImageFile ) <> 0 then
    LoadPhotoToImage( ImgShow, LinkPathToPhoto, FNoPhotoFileName );

  if (PanelFotoDate.Visible)and( FileExists(LinkPathToPhoto) ) then
    LbDateOfFoto.Caption := FCaptionFotoDate +' '+MyReadOriginFotoDate( LinkPathToPhoto )
  else LbDateOfFoto.Caption := '';

  FCurrImageFile := LinkPathToPhoto;   
end;

procedure TFramePhotoList.FShowCurrentPhotoDescript( aFieldNamePic,aFieldNameDescript:String );
begin
  if aFieldNamePic<>'' then
    FShowCurrentPhoto( aFieldNamePic );

  if aFieldNameDescript <> '' then
   MemoDescript.Lines.Text := Trim( FElemDBPhoto.DB.FieldByName( aFieldNameDescript ).AsString );
end;

procedure TFramePhotoList.PriorImageBtnClick(Sender: TObject);
begin
  FElemDBPhoto.DB.Prior;
  FShowCurrentPhotoDescript( FImgUpdPrperty.FieldFileName, FImgUpdPrperty.FieldMemo );
  FRefreshControls;
end;

procedure TFramePhotoList.NextImageBtnClick(Sender: TObject);
begin
  FElemDBPhoto.DB.Next;
  FShowCurrentPhotoDescript( FImgUpdPrperty.FieldFileName, FImgUpdPrperty.FieldMemo );
  FRefreshControls;
end;

procedure TFramePhotoList.FShowMouseCursorLoad;
begin
  Screen.Cursor := crHourGlass;
end;

procedure TFramePhotoList.FShowMouseCursorDefault;
begin
  Screen.Cursor := crDefault;
end;

procedure TFramePhotoList.Refresh( RootPath:String;ShowLoadMouseCursor:Boolean=false );
begin
  FRootPath := RootPath;
  FRefreshControls;
  FShowCurrentPhotoDescript( FImgUpdPrperty.FieldFileName, FImgUpdPrperty.FieldMemo );
end;

procedure TFramePhotoList.ImgShowDblClick(Sender: TObject);
var LinkPathToPhoto: String;
begin
  if not ImgShow.Enabled then exit;

  LinkPathToPhoto := FGetCurrentFilePhoto( FImgUpdPrperty.FieldFileName );
  if FileExists(LinkPathToPhoto) then
  begin
    try
      FShowMouseCursorLoad;
      SetAllAttrForFiles( ExtractFilePath(LinkPathToPhoto), '*.*', faArchive );
      MyShowWindowsFile(self.Handle, LinkPathToPhoto);
    finally
      FShowMouseCursorDefault;
    end;
  end;
end;

procedure TFramePhotoList.ClearImage;
begin
  ImgShow.Picture :=nil; 
end;

Function MyReadOriginFotoDate(const FotoFile: string):String;
var Bmp: TBitmap;
    ImageMetaData:TIMageMetaData;
begin
  try
    ImageMetaData := TIMageMetaData.Create;
    Bmp:= TBitmap.Create;
    try
      if ImageMetaData.ReadExif(FotoFile, Bmp) then
        result := ImageMetaData.DisplayOriginDateTag
      else
        result := '';
    finally
      Bmp.Free;
    end;
  finally
    ImageMetaData.free;
  end;
end;
//******************************************************************************
procedure TFramePhotoList.EditFotoExecute( Sender: TObject );
begin
  if @FFunctShowUpdateImage = nil then
    ShowUpdateImages( FImgUpdPrperty, FRootPath, FNoPhotoFileName, FViewEditFotoStyles )
  else FFunctShowUpdateImage( FImgUpdPrperty );
end;

end.

