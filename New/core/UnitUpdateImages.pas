unit UnitUpdateImages;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitFrameUpdateImages, StdCtrls, Buttons, ExtCtrls,Core, cxGridTableView;

type
  TFunctShowUpdateImage = procedure( ImdUpd:TViewFieldImgUpd );
  TFrmUpdateImages = class(TForm)
    ModalPanel: TPanel;
    CancelBtn: TBitBtn;
    FrameUpdateImages: TFrameUpdateImages;
  private
    { Private declarations }
    FViewFieldImgUpd:TViewFieldImgUpd;
  public
    { Public declarations }
  end;
  
function ShowUpdateImages( ViewFieldImgUpd:TViewFieldImgUpd; PathToImages, NoPhotoFileName :String; ViewStyle:TcxGridTableViewStyles = nil  ):Boolean;

var
  FrmUpdateImages: TFrmUpdateImages;

implementation

{$R *.dfm}

function ShowUpdateImages( ViewFieldImgUpd:TViewFieldImgUpd; PathToImages, NoPhotoFileName :String; ViewStyle:TcxGridTableViewStyles = nil ):Boolean;
begin
  try
    Application.CreateForm( TFrmUpdateImages, FrmUpdateImages );
    FrmUpdateImages.FrameUpdateImages.InitComImageUpdateFrame( ViewFieldImgUpd, PathToImages, NoPhotoFileName, ViewStyle );

    FrmUpdateImages.ShowModal;
    Result := FrmUpdateImages.FrameUpdateImages.IsChange;
  finally
    FrmUpdateImages.FrameUpdateImages.DeactiveImageUpdateFrame;
    FrmUpdateImages.Free;
  end;
end;

end.
