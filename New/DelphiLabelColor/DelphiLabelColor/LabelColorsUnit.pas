unit LabelColorsUnit;
// модуль цветных TLabel версия 0.1
// Alexpac26@yandex.ru Тольятти 2011

interface
uses  SysUtils, StrUtils, StdCtrls, Classes;

type
  TLabel = class(StdCtrls.TLabel)
    public
    procedure Colors(s,e,colorr:integer);
    procedure ColorsPos(txt:string; colorr: integer);
    procedure ResetColors;
  end;

implementation

{ TLabel }

procedure TLabel.ResetColors;
begin
  self.DestroyComponents;
end;

procedure TLabel.Colors(s, e, colorr: integer);
var realw: integer;
begin
  with TLabel.Create(self) do begin
    Parent:=self.Parent;
    color:=self.Color;
    Font:=self.Font;
    Top:=self.Top;
    AutoSize:=true;
    Layout:=self.Layout;
    Caption:=self.Caption;
    realw:=width;
    if self.Alignment=taLeftJustify then begin
      Caption:=copy(self.Caption,1,s-1);
      if s>1 then Left:=self.Left+Width else Left:=self.Left;
    end else if self.Alignment=taRightJustify then begin
      Caption:=copy(self.Caption,s,Length(caption));
      Left:=self.Left+self.width-width;
    end else if self.Alignment=taCenter then begin
      Caption:=self.Caption;
      realw:=width;
      Caption:=copy(self.Caption,1,s-1);
      if s>1 then Left:=self.Left+Width+round((self.Width-realw)/2) else Left:=self.Left+round((self.Width-realw)/2);
    end;
    Caption:=copy(self.Caption,s,e);
    Font.Color:=colorr;
    AutoSize:=false;
    Height:=self.Height;
    //Transparent:=true;
  end;
end;

procedure TLabel.ColorsPos(txt: string; colorr: integer);
var p:integer;
begin
  p:=pos(txt,Caption);
  while p>0 do begin
    self.Colors(p,length(txt),colorr);
    p:=posEx(txt,Caption,p+1);
  end;
end;

end.
