unit ExcelUn;

interface

uses ExcelXP;

procedure DrawBorders(aRange, aStyle: Variant);

implementation

procedure DrawBorders(aRange, aStyle: Variant);
begin
  aRange.Borders[xlEdgeLeft].Weight := aStyle;
  aRange.Borders[xlEdgeTop].Weight := aStyle;
  aRange.Borders[xlEdgeBottom].Weight := aStyle;
  aRange.Borders[xlEdgeRight].Weight := aStyle;
  aRange.Borders[xlInsideVertical].Weight := aStyle;
  aRange.Borders[xlInsideHorizontal].Weight := aStyle;  
end;

end.
 