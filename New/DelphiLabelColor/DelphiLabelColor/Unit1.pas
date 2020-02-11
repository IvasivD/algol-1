unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, StrUtils, LabelColorsUnit, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Panel1: TPanel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
  with Label1  do begin
    ColorsPos('������', 255);
    ColorsPos('�������', 42495);
    ColorsPos('������', 65535);
    ColorsPos('�����', 32768);
    ColorsPos('���', 16760576);
    ColorsPos('�����', 16711680);
    ColorsPos('�����', 13828244);
  end;
  with Label2 do begin
    ColorsPos('������', 255);
    ColorsPos('�������', 42495);
    ColorsPos('������', 65535);
    ColorsPos('�����', 32768);
    ColorsPos('���', 16760576);
    ColorsPos('�����', 16711680);
    ColorsPos('�����', 13828244);
  end;
  with Label3 do begin
    ColorsPos('������', 255);
    ColorsPos('�������', 42495);
    ColorsPos('������', 65535);
    ColorsPos('�����', 32768);
    ColorsPos('���', 16760576);
    ColorsPos('�����', 16711680);
    ColorsPos('�����', 13828244);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Label1.ResetColors;
  Label2.ResetColors;
  Label3.ResetColors;
end;

end.
