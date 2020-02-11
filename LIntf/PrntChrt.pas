unit PrntChrt;

interface

uses Chart;

procedure PrintChart(Chart: TCustomChart);


implementation

uses Classes, Graphics;

procedure PrintChart(Chart: TCustomChart);
var
  BckImg: TPicture;
  BckFnt: TFont;
begin
  BckImg := TPicture.Create;
  BckFnt := TFont.Create;
  with Chart do
    try
      BckImg.Assign(BackImage);
      BackImage := nil;
      BckFnt.Assign(Title.Font);
      with Title.Font do
      begin
        Name := 'Arial';
        if Size < 11 then Size := 11;
        Style := Style + [fsBold];
      end;
      PrintProportional := False;
      if Width > Height then PrintMargins := Rect(3, 4, 3, 4)
      else PrintMargins := Rect(4, 3, 4, 3);
      PrintResolution := -5;
      Print;
      PrintResolution := 0;
      Title.Font.Assign(BckFnt);
      BackImage.Assign(BckImg);
      Title.Repaint;
      Repaint;
    finally
      BckFnt.Free;
      BckImg.Free;
    end;
end;

end.
