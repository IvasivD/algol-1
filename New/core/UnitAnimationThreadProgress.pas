unit UnitAnimationThreadProgress;

interface
uses  Windows, Messages, Classes, SysUtils, Variants, Graphics, Controls, Forms, ExtCtrls;
type
 TFunctionProgressValue = function(var aValue:Integer):Variant;

 TanimationThreadProgress = class(TThread)
  private
    FWnd: HWND;
    FInterval : integer;
    FLbProgres : TWinControl;
    FFuncValue : TFunctionProgressValue;
    FCurProgres:Integer;
  protected
    procedure Execute; override;
  public
    constructor Create( PanProgres:TWinControl; Interval:Integer; aFuncValue : TFunctionProgressValue );
  end;

function GetProgresValueChar(var aValue:Integer):Variant;

implementation

function GetProgresValueChar(var aValue:Integer):Variant;
begin
  if aValue=0 then begin result:='|'; aValue := 1; end;
  if aValue=1 then result:='|';
  if aValue=2 then result:='/';
  if aValue=3 then result:='-';
  if aValue=4 then result:='\';
  if aValue=5 then result:='|';
  if aValue=6 then result:='/';
  if aValue=7 then result:='-';
  if aValue=8 then result:='\';

  if aValue>=8 then aValue :=0;
  inc(aValue);
end;

constructor TanimationThreadProgress.Create(PanProgres: TWinControl;
  Interval: Integer; aFuncValue: TFunctionProgressValue);
begin
  inherited Create(True);
  FWnd :=   PanProgres.Handle;
  FLbProgres:= PanProgres;
  FInterval := Interval;
  FFuncValue:= aFuncValue;
  FCurProgres:= 1;
  Resume;
end;

procedure TanimationThreadProgress.Execute;
var Image: TImage;
    imagerect:TRect;
    FPaintRect: TRect;
    DC : HDC;
    S:string;
begin
  Image := TImage.Create(FLbProgres.Owner);
  Image.Parent := FLbProgres;
  FPaintRect := FLbProgres.ClientRect;
  //Image.Stretch := True;
  //if TForm(FLbProgres.Owner).Showing then TForm(FLbProgres.Owner).SetFocus;
  
  try
    with Image do 
    begin
      Width := FPaintRect.Right - FPaintRect.Left;
      Height := FPaintRect.Bottom - FPaintRect.Top;
      imagerect := Rect( 0, 0, Width, Height );
    end;

    while not Terminated do
    begin
      with Image.Canvas do
      begin
        S:= FFuncValue( FCurProgres );
        //Image.Canvas.Style := bsClear;
        Image.Canvas.Brush.Color :=  TPanel(FLbProgres).Color;
        Image.Canvas.Font.Size := 10;
        Image.Canvas.Font.Color := clWhite;
        Image.Canvas.FillRect( Rect(0, 0, FPaintRect.Right, FPaintRect.Bottom) );
        Image.Canvas.TextOut( 0, 0, S );
      end;

      DC := GetDC(FWnd);
      if DC <> 0 then
        try
          BitBlt( DC, FPaintRect.Left, FPaintRect.Top, imagerect.right, imagerect.bottom, Image.Canvas.handle, 0, 0, SRCCOPY );
        finally
          ReleaseDC(FWnd, DC);
        end;   

      Sleep(FInterval);
    end;
  finally
    Image.Free;
  end;
  InvalidateRect(FWnd, nil, True);
end;

end.
 