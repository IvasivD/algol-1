unit LabelShadowUnit;

interface
uses
   SysUtils, Classes, Controls, StdCtrls;
type
  TLabel2 = class(TLabel);
  TLabel = class(TLabel2)
    constructor Create(own : TComponent); override;
    destructor Destroy; override; //запуск деструктора
    procedure AddShadow(x: integer = 3; y: integer = 1; colorr : integer = 0);
    procedure AddShadowText(widthh : byte = 1; colorr : integer = 0);
    procedure ClearShadow;
    private
      shad: TList;
  end;

implementation

{ TLabel }

procedure TLabel.AddShadow(x: integer = 3; y: integer = 1; colorr : integer = 0);
var sh: TLabel;
begin
  sh:=TLabel.Create(self.Owner);
  with sh do begin
    parent:=TWinControl(self.Parent);
    font:=self.Font;
    Top:=self.Top+y;
    Left:=self.Left+x;
    Font.Color:=colorr;
    caption:=self.Caption;
    transparent:=true;
  end;
  self.Transparent:=true;
  self.BringToFront;
  shad.Add(sh);
end;

procedure TLabel.AddShadowText(widthh: byte; colorr: integer);
begin
  // прямоугольник
  self.AddShadow(widthh,0, colorr);
  self.AddShadow(-1*widthh,0, colorr);
  self.AddShadow(0,widthh, colorr);
  self.AddShadow(0,-1*widthh, colorr);
  // по бокам
  self.AddShadow(widthh,widthh, colorr);
  self.AddShadow(-1*widthh,-1*widthh, colorr);
  self.AddShadow(-1*widthh,widthh, colorr);
  self.AddShadow(widthh,-1*widthh, colorr);
end;

procedure TLabel.ClearShadow;
var i:integer;
begin
  for i := 0 to shad.Count - 1 do
    TLabel(shad[i]).Destroy;
  shad.Clear;
end;

constructor TLabel.Create(own: TComponent);
begin
  inherited Create(own);
  shad:=TList.Create;
end;

destructor TLabel.Destroy;
var i:integer;
begin
  for i := 0 to shad.Count - 1 do
    TLabel(shad[i]).Destroy;
  shad.Destroy;
  inherited Destroy;
end;

end.
