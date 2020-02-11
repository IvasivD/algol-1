unit UnittTestTranslater;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UnitTranslate , UnitGoogleMaps;

type
  TForm1 = class(TForm)
    Button1: TButton;
    MemoRes: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  MemoRes.Text := ShowTranslateText('auto','ru','Bundesland+Ober%C3%B6sterreich',false);
end;

procedure TForm1.Button2Click(Sender: TObject);
var GoogleMap:TGoogleMaps;
    aText:String;
begin
  GoogleMap := TGoogleMaps.Create;
  aText := GoogleMap.GetTranslate('germany','auto','ru');
  ShowMessage( aText );
  GoogleMap.Free;
end;

end.
