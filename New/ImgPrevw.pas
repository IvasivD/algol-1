unit ImgPrevw;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus;

type
  TImagePreviewForm = class(TForm)
    Image: TImage;
    PopupMenu: TPopupMenu;
    CloseItem: TMenuItem;
    procedure CloseItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{var
  ImagePreviewForm: TImagePreviewForm;}

procedure ShowImagePreview(AnImage: TPicture);


implementation

{$R *.DFM}

procedure ShowImagePreview(AnImage: TPicture);
begin
  with TImagePreviewForm.Create(Application) do
    try
      Image.Picture.Assign(AnImage);
      ShowModal;
    finally
      Free;
    end;
end;

procedure TImagePreviewForm.CloseItemClick(Sender: TObject);
begin
  Close;
end;

end.
