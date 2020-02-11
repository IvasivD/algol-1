unit MyHint;

interface
 
uses
  windows, classes, graphics, controls ,Math, forms;

type
  TMyHint = class( TCustomControl )
  private
    FHintRect : TRect;
    FRndRect  : TRect;

    FAutoResizeText:Boolean;
    FTextMarginLeft:Integer;
    FTextMarginTop:Integer;

    FHintText : string;
    FHintTextList:TStringList;
    
    FColorHint: TColor;
    FColorBorderHint:TColor;
    procedure DoSetHintLayout;
    procedure FTextOut(Canvas:TCanvas;ArawDrawText:TRect; Color:TColor; TextList:TStringList);
    function  FTextExtent( TextList:TStringList ):TSize;
  protected
    procedure Paint; override;
  public
    procedure SetHintRect(aRect:TRect;AutoResizeText:Boolean);

    property  HintText : string read FHintText;
    function  TextExtent( Text:Widestring  ):TSize;
    procedure SetHintTextMargin(aLeft , aTop:Integer );
    procedure ShowHintText(const Value: string; aColorHint:TColor  = clYellow; aColorBorderHint:TColor = -1 );
    constructor Create(AOwner: TComponent );
  end;
function StrToStringList(aText:Widestring):TStringList;
var
  ArrowHint : TMyHint;
 
implementation

uses Types;
 
{ TMyHint }
constructor TMyHint.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FTextMarginLeft:= 2;
  FTextMarginTop := 1;
  FAutoResizeText:=true;
end;
//******************************************************************************
function StrToStringList(aText:Widestring):TStringList;
begin
 result:=TStringList.Create;
 result.Text:=aText;
end;
//******************************************************************************
procedure TMyHint.ShowHintText(const Value: string; aColorHint:TColor = clYellow; aColorBorderHint:TColor = -1);
begin
  self.FColorHint := aColorHint;
  self.FColorBorderHint := aColorBorderHint;
  FHintText := Value;
  FHintTextList:= StrToStringList(Value);

  DoSetHintLayout;
  Invalidate;
  Show;
end;
//******************************************************************************
procedure TMyHint.SetHintTextMargin(aLeft , aTop:Integer );
begin
 self.FTextMarginLeft:= aLeft;
 self.FTextMarginTop:= aTop;
end;
//******************************************************************************
procedure TMyHint.SetHintRect(aRect:TRect;AutoResizeText:Boolean);
begin
 FHintRect := aRect;
 self.Left := aRect.Left;
 self.Top  := aRect.Top;

 FAutoResizeText := AutoResizeText;
end;
//******************************************************************************
function TMyHint.TextExtent( Text:Widestring ):TSize;
begin
  result:=self.FTextExtent( StrToStringList( Text ) );
end;
//******************************************************************************
function TMyHint.FTextExtent( TextList:TStringList ):TSize;
var i:Integer;
    currSize:TSize;
begin
  result.cx:=0;
  result.cy:=0;
  
  for i:=0 to TextList.Count-1 do
  begin
    currSize := Canvas.TextExtent( TextList.Strings[i] );

    result.cy:=result.cy + currSize.cy;
    if result.cx < currSize.cx then
     result.cx := currSize.cx;
  end;
end;
//******************************************************************************
procedure TMyHint.DoSetHintLayout;
var
  hClipRgn  : HRGN;
  FTextExt  : TSize;
  WidthByText:Integer;
  HeightByText:Integer;
begin
  // Hint text size in pixels
  FTextExt := FTextExtent( FHintTextList );
  
  Width  := FHintRect.Right - FHintRect.Left;
  Height := FHintRect.Bottom - FHintRect.Top;

  WidthByText := FTextMarginLeft+ FTextExt.cx + FTextMarginLeft;
  HeightByText := FTextMarginTop + FTextExt.cy + FTextMarginTop;

  FRndRect.Left   := 0;
  FRndRect.Top    := 0;
  
  if TForm(self.Owner).Width-GetSystemMetrics(SM_CYHSCROLL) < FHintRect.left + WidthByText then
    self.left := TForm(self.Owner).Width  - WidthByText - FTextMarginLeft - GetSystemMetrics(SM_CYHSCROLL);

  if not FAutoResizeText then
  begin
    FRndRect.Right  := FHintRect.Right - FHintRect.Left ;
    FRndRect.Bottom := FHintRect.Bottom - FHintRect.Top;
  end
  else
  begin
    if Width<WidthByText then FRndRect.Right := WidthByText
    else
    FRndRect.Right  := Width;

    if Height<HeightByText then FRndRect.Bottom := HeightByText
    else
    FRndRect.Bottom := Height;

    Width:=FRndRect.Right;
    Height:=FRndRect.Bottom;
  end;

  SetWindowRgn( Handle, hClipRgn, True );
end;
//******************************************************************************
procedure TMyHint.FTextOut(Canvas:TCanvas;ArawDrawText:TRect; Color:TColor; TextList:TStringList);
var //StepTopShowText:Integer;
    i:Integer;
    X,Y:Integer;
begin
  if TextList.Count = 0 then Exit;

  Canvas.Brush.Color := Color;

  X:= ArawDrawText.Left + FTextMarginLeft;
  Y:= ArawDrawText.Top + FTextMarginTop;

  for i:=0 to TextList.Count-1 do
  begin
    // Canvas.ClipRect.Left + Canvas.TextWidth( TextList.Strings[i] );
    //Canvas.PenPos.Y ClipRect.Left
    Canvas.TextOut( X, Y, TextList.Strings[i] );
    Y := Y + Canvas.TextHeight( TextList.Strings[0] );
  end;
end;
//******************************************************************************
procedure TMyHint.Paint;
var
  hClipRgn : HRGN;
begin
  // Get current window region
  hClipRgn := CreateRectRgn(0, 0, Width, Height);
  GetWindowRgn( Handle, hClipRgn );

  // Fill it in with yellow background
  Canvas.Brush.Color := FColorHint;
  PaintRgn( Canvas.Handle, hClipRgn );

  // Draw hint text within rounded rectangle
  FTextOut(Canvas, FRndRect , FColorHint , FHintTextList );

  // Draw black frame around the region
  if FColorBorderHint<>-1 then
  begin
    Canvas.Brush.Color := FColorBorderHint;
    FrameRgn( Canvas.Handle, hClipRgn, Canvas.Brush.Handle, 1, 1 );
  end;

end;
//******************************************************************************


end.
 