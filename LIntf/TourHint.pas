unit TourHint;

interface

uses Windows, Classes, Controls, Forms, Graphics;

type
  TTourHintWindow = class(THintWindow)
  private
    FRegion: THandle;
    procedure FreeCurrRegion;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    destructor Destroy; override;
    procedure ActivateHint(Rect: TRect; const AHint: string); override;
    procedure Paint; override;
  end;


implementation

{ TTourHintWindow }

procedure TTourHintWindow.ActivateHint(Rect: TRect; const AHint: string);
begin
  with Rect do Right := Right + Canvas.TextWidth('MMMM');
  InflateRect(Rect, 0, 2);
  BoundsRect := Rect;
  FreeCurrRegion;
  with BoundsRect do
    FRegion := CreateRoundRectRgn(0, 0, Width, Height, Height div 4, Height div 4);
  if FRegion <> 0 then SetWindowRgn(Handle, FRegion, True);
  inherited ActivateHint(Rect, AHint);
end;

procedure TTourHintWindow.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style and not WS_BORDER;
end;

destructor TTourHintWindow.Destroy;
begin
  FreeCurrRegion;
  inherited Destroy;
end;

procedure TTourHintWindow.FreeCurrRegion;
begin
  if FRegion <> 0 then
  begin
    SetWindowRgn(Handle, 0, True);
    DeleteObject(FRegion);
    FRegion := 0;
  end;
end;

procedure TTourHintWindow.Paint;
var Rct: TRect;
begin
  Rct := ClientRect;
  Inc(Rct.Left, 2);
  InflateRect(Rct, 0, -2);
  Canvas.Font.Color := clInfoText;
  {$WARN UNSAFE_TYPE OFF}
  DrawText(Canvas.Handle, PChar(Caption), Length(Caption), Rct,
    DT_NOPREFIX or DT_WORDBREAK or DT_CENTER or DT_VCENTER);
  {$WARN UNSAFE_TYPE ON}
  Canvas.RoundRect(Canvas.ClipRect.Left, Canvas.ClipRect.Top,
    Canvas.ClipRect.Right, Canvas.ClipRect.Bottom, Height div 4, Height div 4);
end;

initialization
  Application.ShowHint := False;
  HintWindowClass := TTourHintWindow;
  Application.ShowHint := True;
end.
