unit JpgFrmtDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Jpeg;

type
  TJpegImageFormatDlg = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    ProgressiveEncodingCheckBox: TCheckBox;
    Label1: TLabel;
    CtrlPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    QualityTrackBar: TTrackBar;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    FJpegQuality: TJPEGQualityRange;
    FJpegProgressive: Boolean;
    procedure SetJpegProgressive(const Value: Boolean);
    procedure SetJpegQuality(const Value: TJPEGQualityRange);
  protected
    property JpegQuality: TJPEGQualityRange read FJpegQuality write SetJpegQuality;
    property JpegProgressive: Boolean read FJpegProgressive write SetJpegProgressive;
  end;

{var
  JpegImageFormatDlg: TJpegImageFormatDlg;}

function ExecuteJpegImageFormatDlg(var Quality: Integer; var ProgrEnc: Boolean): Boolean;
    {$WARN UNSAFE_TYPE OFF}
procedure JpegSizedCopyCreate(SrcName, DstName: PChar; MaxWidth, MaxHeight: Integer);
    {$WARN UNSAFE_TYPE ON}


implementation

{$R *.DFM}
                                                     
    {$WARN UNSAFE_TYPE OFF}
procedure JpegSizedCopyCreate(SrcName, DstName: PChar; MaxWidth, MaxHeight: Integer);
    {$WARN UNSAFE_TYPE ON}
var
  Bmp: TBItmap;
  Jpg: TJpegImage;
  Cal: Extended;
begin
  Jpg := TJpegImage.Create;
  try
    {$WARN UNSAFE_TYPE OFF}
    Jpg.LoadFromFile(SrcName);
    {$WARN UNSAFE_TYPE ON}
    if Jpg.Height > Jpg.Width then Cal := MaxHeight / Jpg.Height
    else Cal := MaxWidth / Jpg.Width;
    if Cal < 1 then
    begin
      Bmp := TBitmap.Create;
      try
        {Create thumbnail bitmap, keep pictures aspect ratio}
        Bmp.Width := Round(Jpg.Width * Cal);
        Bmp.Height:= Round(Jpg.Height * Cal);
        Bmp.Canvas.StretchDraw(Bmp.Canvas.ClipRect, Jpg);
        {Convert back to JPEG and save to file}
        Jpg.Assign(Bmp);
      finally
        Bmp.Free;
      end;
    end;                 
    {$WARN UNSAFE_TYPE OFF}
    Jpg.SaveToFile(DstName);
    {$WARN UNSAFE_TYPE ON}
  finally
    Jpg.Free;
  end;
end;

function ExecuteJpegImageFormatDlg(var Quality: Integer; var ProgrEnc: Boolean): Boolean;
begin
  with TJpegImageFormatDlg.Create(Application) do
    try
      JpegQuality := Quality;
      JpegProgressive := ProgrEnc;
      Result := ShowModal = mrOk;
      if Result then
      begin
        Quality := JpegQuality;
        ProgrEnc := JpegProgressive;
      end;
    finally
      Free;
    end;
end;

{ TJpegImageFormatDlg }

procedure TJpegImageFormatDlg.SetJpegProgressive(const Value: Boolean);
begin
  if Value <> FJpegProgressive then
  begin
    FJpegProgressive := Value;
    ProgressiveEncodingCheckBox.Checked := Value;
  end;
end;

procedure TJpegImageFormatDlg.SetJpegQuality(const Value: TJPEGQualityRange);
begin
  if Value <> FJpegQuality then
  begin
    FJpegQuality := Value;
    QualityTrackBar.Position := Value;
  end;
end;

procedure TJpegImageFormatDlg.FormCreate(Sender: TObject);
begin
  FJpegQuality := 100;
  FJpegProgressive := False;
end;

end.
