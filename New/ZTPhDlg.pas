unit ZTPhDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZTDlg, DBCtrls, ExtDlgs, Menus, StdCtrls, Buttons, ExtCtrls, Db,
  StdActns, ActnList, ImgList, DBTables;

type
  TZTourPhotoDialog = class(TZTourDialog)
    PhotoPopupMenu: TPopupMenu;
    PhotoLoadItem: TMenuItem;
    PhotoSaveAsItem: TMenuItem;
    N1: TMenuItem;
    PhotoCopyItem: TMenuItem;
    PhotoPasteItem: TMenuItem;
    PhotoClearItem: TMenuItem;
    DBPhoto: TDBImage;
    StretchImage: TImage;
    ImageActionList: TActionList;
    ImageCopyAction: TEditCopy;
    ImagePasteAction: TEditPaste;
    ImageClearAction: TAction;
    ImageOpenAction: TAction;
    ImageSaveAsAction: TAction;
    ImagePreviewAction: TAction;
    N10: TMenuItem;
    N11: TMenuItem;
    ImageScanAction: TAction;
    N12: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBPhotoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBPhotoDblClick(Sender: TObject);
    procedure ImageOpenActionExecute(Sender: TObject);
    procedure ImageSaveAsActionExecute(Sender: TObject);
    procedure ImageCopyActionExecute(Sender: TObject);
    procedure ImagePasteActionExecute(Sender: TObject);
    procedure ImageClearActionExecute(Sender: TObject);
    procedure ImagePreviewActionExecute(Sender: TObject);
  private
    FActiveDBImage: TDBImage;
    procedure StretchPhoto(Image: TGraphic; DBControl: TDBImage);
  protected
    property ActiveDBImage: TDBImage read FActiveDBImage write FActiveDBImage;
  end;

var
  ZTourPhotoDialog: TZTourPhotoDialog;

implementation

uses ClipBrd, Jpeg, VDlgs, TourConsts, OptSet, DataMod, ImgPrevw,
  TourCmnlIf;

{$R *.DFM}

procedure TZTourPhotoDialog.StretchPhoto(Image: TGraphic; DBControl: TDBImage);
var DrawRect: TRect;
begin
  with StretchImage do
  begin
    if Height <> DBControl.Height then Height := DBControl.Height;
    if Width <> DBControl.Width then Width := DBControl.Width;
    DrawRect := ClientRect;
    Canvas.Brush.Color := DBControl.Color;
    Canvas.FillRect(DrawRect);
    with DrawRect do
      if (Image.Width > Right - Left) or (Image.Height > Bottom - Top) then
      begin
        if Image.Width > Image.Height then
          Bottom := Top + MulDiv(Image.Height, Right - Left, Image.Width)
        else
          Right := Left + MulDiv(Image.Width, Bottom - Top, Image.Height);
        Canvas.StretchDraw(DrawRect, Image);
      end
      else
        with DrawRect do
          Canvas.Draw(Left + (Right - Left - Image.Width) div 2,
            Top + (Bottom - Top - Image.Height) div 2, Image);
  end;
  DBControl.Picture.Bitmap.Assign(StretchImage.Picture);
end;

procedure TZTourPhotoDialog.FormCreate(Sender: TObject);
begin
  inherited;
  ActiveDBImage := DBPhoto;
end;

procedure TZTourPhotoDialog.FormActivate(Sender: TObject);
begin
  inherited;
  DM.OpenPictureDialog.InitialDir := OptionSet.PictureFolder;
  DM.SavePictureDialog.InitialDir := OptionSet.PictureFolder;
end;

procedure TZTourPhotoDialog.DBPhotoMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var OkDSet, EmptyField: boolean;
begin
  inherited;
  OkDSet :=
    (ActiveDBImage.DataSource <> nil) and (ActiveDBImage.DataField <> '');
  EmptyField := OkDSet and ActiveDBImage.Field.IsNull;
  ImageOpenAction.Enabled := EmptyField;
  ImageSaveAsAction.Enabled := OkDSet and not EmptyField;
  ImageCopyAction.Enabled := OkDSet and not EmptyField;
  ImagePasteAction.Enabled := EmptyField and Clipboard.HasFormat(CF_BITMAP);//PICTURE);
  ImageClearAction.Enabled := OkDSet and not EmptyField;
  ImagePreviewAction.Enabled := OkDSet and not EmptyField;
end;

procedure TZTourPhotoDialog.DBPhotoDblClick(Sender: TObject);
begin
  inherited;
  with ImagePreviewAction do if Enabled then Click;
end;

procedure TZTourPhotoDialog.ImageOpenActionExecute(Sender: TObject);
var
  Image: TGraphic;
  Ext: String;
begin
  inherited;
  with DM.OpenPictureDialog do
    if Execute then
    begin
      Ext := AnsiLowerCase(ExtractFileExt(FileName));
      if (Ext = '.jpg') or (Ext = '.jpeg') then Image := TJpegImage.Create
        else Image := TBitmap.Create;
      try
        Image.LoadFromFile(FileName);
        if Image.Width > 0 then
        begin
          StretchPhoto(Image, FActiveDBImage);
          if (FActiveDBImage <> DBPhoto) and FActiveDBImage.Field.IsNull then
            StretchPhoto(Image, DBPhoto);
        end;
      finally
        Image.Free;
      end;
    end;
end;

procedure TZTourPhotoDialog.ImageSaveAsActionExecute(Sender: TObject);
begin
  inherited;
  with DM.SavePictureDialog do
    if Execute then ActiveDBImage.Picture.SaveToFile(FileName);
end;

procedure TZTourPhotoDialog.ImageCopyActionExecute(Sender: TObject);
begin
  inherited;
  ActiveDBImage.CopyToClipboard;
end;

procedure TZTourPhotoDialog.ImagePasteActionExecute(Sender: TObject);
begin
  inherited;
  ActiveDBImage.PasteFromClipboard;
end;

procedure TZTourPhotoDialog.ImageClearActionExecute(Sender: TObject);
begin
  inherited;
  if ConfirmDlg(SZTPhDlgPhotoClear) = mrYes then ActiveDBImage.Field.Clear;
end;

procedure TZTourPhotoDialog.ImagePreviewActionExecute(Sender: TObject);
begin
  inherited;
  ShowImagePreview(ActiveDBImage.Picture);
end;

end.
