unit Splash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, jpeg;

type
  TSplashForm = class(TForm)
    Panel: TPanel;
    Image: TImage;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);  
  private
    procedure LoadAboutPict;
  end;

var
  SplashForm: TSplashForm;

implementation

{$R *.DFM} 
{$R TMANLGO.RES}

procedure TSplashForm.LoadAboutPict;
var
  LgRes, LgSize: integer;
  LgResP: Pointer;
  LgMem: TMemoryStream;
begin
  Application.ProcessMessages;
  LgRes := FindResource(HInstance, 'TMAPPLG', RT_RCDATA);
  if LgRes <> 0 then
  begin
    LgSize := SizeofResource(HInstance, LgRes);
    LgRes := LoadResource(HInstance, LgRes);
    if LgRes <> 0 then
    begin
      LgResP := LockResource(LgRes);
      if LgResP <> nil then
      begin
        LgMem := TMemoryStream.Create;
        with LgMem do
        begin
          Write(LgResP^, LgSize);
          Seek(0, soFromBeginning);
          Image.Picture.Graphic := TJPEGImage.Create;
          Image.Picture.Graphic.LoadFromStream(LgMem);
          Free;
        end;
        UnlockResource(LgRes);
      end;
      FreeResource(LgRes);
    end;
  end;
end;

procedure TSplashForm.FormCreate(Sender: TObject);
begin
  LoadAboutPict;
end;

procedure TSplashForm.FormActivate(Sender: TObject);
begin
  ClientHeight := Image.Picture.Height - 16;
  ClientWidth := Image.Picture.Width;
end;

end.
