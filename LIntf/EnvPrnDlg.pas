unit EnvPrnDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZDlg, jpeg, ExtCtrls, StdCtrls, Buttons, ppPrintr, ComCtrls, ActnList,
  ImgList, ToolWin, StdActns;

type
  TEnvelopePrintDlg = class(TZDialog)
    PropertyPanel: TPanel;
    PaperNameComboBox: TComboBox;
    PrinterComboBox: TComboBox;
    BinNameComboBox: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PaperSizeLabel: TLabel;
    OrientationGroupBox: TGroupBox;
    PortraitRadioButton: TRadioButton;
    LandscapeRadioButton: TRadioButton;
    OrientationImage: TImage;
    PrintLogoCheckBox: TCheckBox;
    PageControl1: TPageControl;
    MakeTabSheet: TTabSheet;
    ViewTabSheet: TTabSheet;
    MakeScrollBox: TScrollBox;
    EnvelopePanel: TPanel;
    SenderPanel: TPanel;
    ReceiverPanel: TPanel;
    LogoImage: TImage;
    SenderRichEdit: TRichEdit;
    ReceiverRichEdit: TRichEdit;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    PercentComboBox: TComboBox;
    ImageList: TImageList;
    ActionList: TActionList;
    EditCopyAction: TEditCopy;
    EditCutAction: TEditCut;
    EditDeleteAction: TEditDelete;
    EditPasteAction: TEditPaste;
    EditSelectAllAction: TEditSelectAll;
    EditUndoAction: TEditUndo;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    FontBoldAction: TAction;
    FontItalicAction: TAction;
    FontUnderlineAction: TAction;
    FontSelectAction: TAction;
    FontColorAction: TAction;
    ParagraphLeftAction: TAction;
    ParagraphCenterAction: TAction;
    ParagraphRightAction: TAction;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    ToolButton20: TToolButton;
    ToolButton21: TToolButton;
    FontDialog: TFontDialog;
    ColorDialog: TColorDialog;
    ViewZoomInAction: TAction;
    ViewZoomOutAction: TAction;
    ViewFitAction: TAction;
    ViewScrollBox: TScrollBox;
    PreviewImage: TImage;
    PrintDialog: TPrintDialog;
    PrintEnvelopeBtn: TBitBtn;
    PrintEnvelopeAction: TAction;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure PrinterComboBoxClick(Sender: TObject);
    procedure PaperNameComboBoxChange(Sender: TObject);
    procedure PrintLogoCheckBoxClick(Sender: TObject);
    procedure OrientationRadioButtonClick(Sender: TObject);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure FontBoldActionExecute(Sender: TObject);
    procedure FontItalicActionExecute(Sender: TObject);
    procedure FontUnderlineActionExecute(Sender: TObject);
    procedure FontSelectActionExecute(Sender: TObject);
    procedure FontColorActionExecute(Sender: TObject);
    procedure PrintEnvelopeActionExecute(Sender: TObject);
    procedure SenderPanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure EnvelopePanelMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure EnvelopePanelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure EnvelopePanelResize(Sender: TObject);
    procedure ViewTabSheetShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    {FAddressReceiver: TStrings;
    FAddressSender: TStrings;}
    FDragAllowed: Boolean;
    FDragging: Boolean;
    FDragged: TWinControl;
    FDragOffsetX: Integer;
    FDragOffsetY: Integer;
    FPrinterList: TppPrinterList;
    FPrinterSetup: TppPrinterSetup;
    FPaperHeights: TStrings;
    FPaperWidths: TStrings;
    FPaperHeight: Integer;
    FPaperWidth: Integer;
    FPreviewZoom: Extended;
    FLocalAddress: Boolean;
    function GetAddressReceiver(const Index: Integer): TStrings;
    procedure ChangeOrientation;
    procedure ChangePrinter;
    procedure ChangePaperName;
    procedure DragPanel(X, Y: Integer);
    procedure LoadSettings;
    procedure PaintEnvelope(Canvas: TCanvas;
      PageWidth, PageHeight, SrcResX, SrcResY, DstResX, DstResY: Integer);
    procedure PaintPlainText(Memo: TCustomMemo; Canvas: TCanvas;
      FromLeft, FromTop, SrcResX, SrcResY, DstResX, DstResY: Integer);
    procedure PreparePrintList;
    procedure PrepareSender;
    procedure PrintEnvelope(ShowSetup: Boolean);
    procedure StoreSettings;
    procedure UpdatePreview;
  protected
    property AddressReceiver: TStrings index 0 read GetAddressReceiver;
    property AddressSender: TStrings index 1 read GetAddressReceiver;
    property LocalAddress: Boolean read FLocalAddress write FLocalAddress;
  end;

{var
  EnvelopePrintDlg: TEnvelopePrintDlg;}

function ExecuteEnvelopePrintDlg(
  Local: Boolean; Send, Recip: TStrings; const RecipName: String;
  const RecipPhone: String = ''; PrintPhone: Boolean = False;
  ShowDialog: Boolean = True): Boolean;


implementation

uses Printers, RichEdit, Math, VDlgs, TourConsts, PrntUn, Types;

const
  SenderLeft: Integer = 32;
  SenderTop: Integer = 32;
  SenderWidth: Integer = 417;
  SenderHeight: Integer = 201;
  SenderImage: Boolean = True;
  SenderFontName: String = 'Arial';
  SenderFontSize: Integer = 12;
  SenderFontBold: Boolean = False;
  SenderFontItal: Boolean = False;
  ReciverLeft: Integer = 132;
  ReciverTop: Integer = 240;
  ReciverWidth: Integer = 417;
  ReciverHeight: Integer = 161;
  ReciverFontName: String = 'Arial';
  ReciverFontSize: Integer = 12;
  ReciverFontBold: Boolean = False;
  ReciverFontItal: Boolean = False;
  PrinterName: String = 'SHARP AR-205';
  PaperSize: String = 'A4';
  PaperBin: String = 'Bypass Tray';
  PaperPortrait: Boolean = False;
  PrintDialogExecuted: Boolean = False;

{$R *.DFM}

function ExecuteEnvelopePrintDlg(
  Local: Boolean; Send, Recip: TStrings; const RecipName: String;
  const RecipPhone: String = ''; PrintPhone: Boolean = False;
  ShowDialog: Boolean = True): Boolean;
const sPhn: array[Boolean] of String = (SVDlgsPhoneEn, SVDlgsPhoneUa);
begin
  with TEnvelopePrintDlg.Create(Application) do
    try
      FLocalAddress := Local;
      LoadSettings;
      if Assigned(Send) then AddressSender.Assign(Send) else PrepareSender;
      if Assigned(Recip) then AddressReceiver.Assign(Recip);
      AddressReceiver.Insert(0, RecipName);
      if PrintPhone and (RecipPhone <> '') then
        AddressReceiver.Add(#13 + sPhn[Local] + #32 + RecipPhone);
      Result := not ShowDialog or (ShowModal = mrOk);
      if Result and (Recip.Count > 0) and (Trim(Recip.Text) <> '') then
        PrintEnvelope(ShowDialog);
      StoreSettings;
    finally
      Free;
    end;
end;

{ TEnvelopePrintDlg }

function TEnvelopePrintDlg.GetAddressReceiver(const Index: Integer): TStrings;
begin
  case Index of
    0: Result := ReceiverRichEdit.Lines;
    1: Result := SenderRichEdit.Lines;
    else Result := nil;
  end;
end;

procedure TEnvelopePrintDlg.ChangeOrientation;
begin
  if PortraitRadioButton.Checked then
  begin
    EnvelopePanel.Width := Round(FPaperWidth / 250 * Self.PixelsPerInch);
    EnvelopePanel.Height := Round(FPaperHeight / 250 * Self.PixelsPerInch);
  end
  else begin
    EnvelopePanel.Width := Round(FPaperHeight / 250 * Self.PixelsPerInch);
    EnvelopePanel.Height :=Round(FPaperWidth / 250 * Self.PixelsPerInch); 
  end;
  UpdatePreview;
end;

procedure TEnvelopePrintDlg.ChangePaperName;
begin
  with PaperNameComboBox do
    if Items.Count > 0 then
    begin
      FPaperWidth := StrToInt(FPaperWidths[ItemIndex]);
      FPaperHeight := StrToInt(FPaperHeights[ItemIndex]);
      PaperSizeLabel.Caption := Format('%d x %d', [
        Round(FPaperWidth / 10), Round(FPaperHeight / 10)]);
      ChangeOrientation;
    end
    else PaperSizeLabel.Caption := '';
end;

procedure TEnvelopePrintDlg.ChangePrinter;
var
  Cap: TppPrinterCapabilities;
  IsSel: Boolean;
begin
  IsSel := PrinterComboBox.ItemIndex >= 0;
  ToggleControlEnabled(PaperNameComboBox, IsSel);
  ToggleControlEnabled(BinNameComboBox, IsSel);
  if IsSel then
  begin
    Cap := FPrinterList.PrinterInfo[PrinterComboBox.Text].Capabilities;
    PaperNameComboBox.Items.Assign(Cap.PaperNames);
    FPaperHeights.Assign(Cap.PaperHeights);
    FPaperWidths.Assign(Cap.PaperWidths);
    BinNameComboBox.Items.Assign(Cap.BinNames);
    with PaperNameComboBox do if Items.Count > 0 then ItemIndex := 0;
    PaperNameComboBoxChange(Self);
    with BinNameComboBox do if Items.Count > 0 then ItemIndex := 0;
  end
  else begin
    PaperNameComboBox.Items.Clear;
    FPaperHeights.Clear;
    FPaperWidths.Clear;
    BinNameComboBox.Items.Clear;
  end;
  UpdatePreview;
end;

procedure TEnvelopePrintDlg.DragPanel(X, Y: Integer);
begin
  if Assigned(FDragged) then
    with FDragged do
    begin
      Left := X - FDragOffsetX;
      Top := Y - FDragOffsetY;
    end;
end;

procedure TEnvelopePrintDlg.LoadSettings;
begin 
  with PrinterComboBox do ItemIndex := Items.IndexOf(PrinterName);
  ChangePrinter;
  with PaperNameComboBox do ItemIndex := Items.IndexOf(PaperSize);
  ChangePaperName;
  with BinNameComboBox do ItemIndex := Items.IndexOf(PaperBin);
  if PaperPortrait then PortraitRadioButton.Checked := True
    else LandscapeRadioButton.Checked := True;
  ChangeOrientation;
  SenderPanel.Left := SenderLeft;
  SenderPanel.Top := SenderTop;
  SenderPanel.Width := SenderWidth;
  SenderPanel.Height := SenderHeight;
  PrintLogoCheckBox.Checked := SenderImage;
  PrintLogoCheckBoxClick(Self);
  with SenderRichEdit.Font do
  begin
    Name := SenderFontName;
    Size := SenderFontSize;
    if SenderFontBold then
      Style := Style + [fsBold] else Style := Style - [fsBold];
    if SenderFontItal then
      Style := Style + [fsItalic] else Style := Style - [fsItalic];
  end;
  ReceiverPanel.Left := ReciverLeft;
  ReceiverPanel.Top := ReciverTop;
  ReceiverPanel.Width := ReciverWidth;
  ReceiverPanel.Height := ReciverHeight;
  with ReceiverRichEdit.Font do
  begin
    Name := ReciverFontName;
    Size := ReciverFontSize;
    if ReciverFontBold then
      Style := Style + [fsBold] else Style := Style - [fsBold];
    if ReciverFontItal then
      Style := Style + [fsItalic] else Style := Style - [fsItalic];
  end;
end;

procedure TEnvelopePrintDlg.PaintEnvelope(Canvas: TCanvas;
  PageWidth, PageHeight, SrcResX, SrcResY, DstResX, DstResY: Integer);
var
  Rct: TRect;
  X, Y: Integer;
begin
  with Canvas do
  begin
    X := MulDiv(SenderPanel.Left, DstResX, SrcResX);
    Y := MulDiv(SenderPanel.Top, DstResX, SrcResX);
    Rct := Bounds(
      X + MulDiv(LogoImage.Left, DstResX, SrcResX),
      Y + MulDiv(LogoImage.Top, DstResY, SrcResY),
      MulDiv(LogoImage.Width, DstResX, SrcResX),
      MulDiv(LogoImage.Height, DstResY, SrcResY));
    if LogoImage.Visible then StretchDraw(Rct, LogoImage.Picture.Graphic);
  end;
  PaintPlainText(SenderRichEdit, Canvas,
    X, Y, SrcResX, SrcResY, DstResX, DstResY);
  PaintPlainText(ReceiverRichEdit, Canvas,
    ReceiverPanel.Left, ReceiverPanel.Top,
//    MulDiv(ReceiverPanel.Left, DstResX, SrcResX),
//    MulDiv(ReceiverPanel.Top, DstResY, SrcResY),
    SrcResX, SrcResY, DstResX, DstResY);
end;

procedure TEnvelopePrintDlg.PaintPlainText(Memo: TCustomMemo; Canvas: TCanvas;
  FromLeft, FromTop, SrcResX, SrcResY, DstResX, DstResY: Integer);
var
  Rct: TRect;
  X, Y, W, I: Integer;
begin
  with Canvas do
  begin
    X := FromLeft + MulDiv(Memo.Left, DstResX, SrcResX);
    Y := FromTop + MulDiv(Memo.Top, DstResX, SrcResX);
    W := MulDiv(Memo.Width + 8, DstResX, SrcResX);
    Rct := Rect(X, Y, X + W, Y);
    if Memo is TMemo then Font.Assign((Memo as TMemo).Font)
    else if Memo is TRichEdit then Font.Assign((Memo as TRichEdit).Font);
    for I := 0 to Memo.Lines.Count - 1 do
    begin
      with Font do
        if (I = 0) and (Memo = ReceiverRichEdit) then Style := Style + [fsBold]
          else  Style := Style - [fsBold];
      PrintAlignedTextCalc(Canvas, Rct, Memo.Lines[I], DT_LEFT);
      Rct.Top := Rct.Bottom;
    end;
  end;
end;

procedure TEnvelopePrintDlg.PreparePrintList;
begin
  PrinterComboBox.Items.Assign(FPrinterList.PrinterNames);
  PrinterComboBoxClick(Self);
end;

procedure TEnvelopePrintDlg.PrepareSender;
begin
  with AddressSender do
  begin
    Clear;
    if FLocalAddress then
    begin
      Add(STourConstsContractSa4);
      Add(SVDlgsSign3);
      Add(SVDlgsSign4);
      Add('');
      Add(SVDlgsSignUa0);
      Add(SVDlgsSignUa1);
      Add(SVDlgsSignUa2);
    end
    else begin
      Add(SVDlgsSign2);
      Add(SVDlgsSign3);
      Add(SVDlgsSign4);
      Add('');
      Add(SVDlgsSignEn0);
      Add(SVDlgsSignEn1);
      Add(SVDlgsSignEn2);
    end;
  end;
end;

procedure TEnvelopePrintDlg.PrintEnvelope(ShowSetup: Boolean);
var XRes, YRes: Integer;
begin
  with ppPrinter do
    try
      PrinterName := PrinterComboBox.Text;
      with PrinterSetup do
      begin
        PaperName := PaperNameComboBox.Text;
        BinName := BinNameComboBox.Text;
        if PortraitRadioButton.Checked then
          Orientation := poPortrait else Orientation := poLandscape;
      end;
      if ShowSetup then
        with TppPrinterSetupDialog.Create(Application) do
        try
          Printer := ppPrinter;
          if not Execute then Exit;
        finally
          Free;
        end;
    finally
    end;
  Screen.Cursor := crHourGlass;
  with ppPrinter do
  try
    BeginDoc;
    try
      XRes := PixelsPerInch.X; //GetDeviceCaps(Handle, LOGPIXELSX);
      YRes := PixelsPerInch.Y; //GetDeviceCaps(Handle, LOGPIXELSY);
      PaintEnvelope(Canvas, PaperWidth, PaperHeight,
        Self.PixelsPerInch, Self.PixelsPerInch, XRes, YRes);
    finally
      EndDoc;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TEnvelopePrintDlg.StoreSettings;
begin
  SenderLeft := SenderPanel.Left;
  SenderTop := SenderPanel.Top;
  SenderWidth := SenderPanel.Width;
  SenderHeight := SenderPanel.Height;
  SenderImage := LogoImage.Visible;
  with SenderRichEdit.Font do
  begin
    SenderFontName := Name;
    SenderFontSize := Size;
    SenderFontBold := fsBold in Style;
    SenderFontItal := fsItalic in Style;
  end;
  ReciverLeft := ReceiverPanel.Left;
  ReciverTop := ReceiverPanel.Top;
  ReciverWidth := ReceiverPanel.Width;
  ReciverHeight := ReceiverPanel.Height;
  with ReceiverRichEdit.Font do
  begin
    ReciverFontName := Name;
    ReciverFontSize := Size;
    ReciverFontBold := fsBold in Style;
    ReciverFontItal := fsItalic in Style;
  end;
  PrinterName := PrinterComboBox.Text;
  PaperSize := PaperNameComboBox.Text;
  PaperBin := BinNameComboBox.Text;
  PaperPortrait := PortraitRadioButton.Checked;
end;

procedure TEnvelopePrintDlg.UpdatePreview;
var Zoom: Integer;
begin
  Zoom := Round(FPreviewZoom * 100);
  with PreviewImage do
  begin
    Width := MulDiv(EnvelopePanel.Width, Zoom, 100);
    Height := MulDiv(EnvelopePanel.Height, Zoom, 100);
    Picture := nil;
    PaintEnvelope(Canvas, Width, Height, 100, 100, Zoom, Zoom);
  end;
end;

procedure TEnvelopePrintDlg.FormCreate(Sender: TObject);
begin
  inherited;
  FDragAllowed := True;
  FDragging := False;
  FPaperHeight := 0;
  FPaperWidth := 0;
  FPrinterList := TppPrinterList.Create;
  FPaperHeights := TStringList.Create;
  FPaperWidths := TStringList.Create;
  FPrinterSetup := TppPrinterSetup.Create(Self);
  FPreviewZoom := 0.5;
  PreparePrintList;
  //PrepareSender;
end;

procedure TEnvelopePrintDlg.PrinterComboBoxClick(Sender: TObject);
begin
  ChangePrinter;
end;

procedure TEnvelopePrintDlg.PaperNameComboBoxChange(Sender: TObject);
begin
  ChangePaperName;
end;

procedure TEnvelopePrintDlg.PrintLogoCheckBoxClick(Sender: TObject);
begin
  LogoImage.Visible := PrintLogoCheckBox.Checked;
end;

procedure TEnvelopePrintDlg.OrientationRadioButtonClick(Sender: TObject);
begin
  ChangeOrientation;
end;

procedure TEnvelopePrintDlg.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  inherited;
  if ActiveControl is TRichEdit then
    with (ActiveControl as TRichEdit).Font{.SelAttributes} do
    begin
      FontBoldAction.Checked := fsBold in Style;
      FontItalicAction.Checked := fsItalic in Style;
      FontUnderlineAction.Checked := fsUnderline in Style;
    end;
  PrintEnvelopeAction.Enabled := PrinterComboBox.ItemIndex >= 0;
end;

procedure TEnvelopePrintDlg.FontBoldActionExecute(Sender: TObject);
begin
  if ActiveControl is TRichEdit then
    with FontBoldAction do
    begin
      Checked := not Checked;
      with (ActiveControl as TRichEdit).Font{.SelAttributes} do
        if Checked then Style := Style + [fsBold]
        else Style := Style - [fsBold];
    end;
end;

procedure TEnvelopePrintDlg.FontItalicActionExecute(Sender: TObject);
begin
  if ActiveControl is TRichEdit then
    with FontItalicAction do
    begin
      Checked := not Checked;
      with (ActiveControl as TRichEdit).Font{.SelAttributes} do
        if Checked then Style := Style + [fsItalic]
        else Style := Style - [fsItalic];
    end;
end;

procedure TEnvelopePrintDlg.FontUnderlineActionExecute(Sender: TObject);
begin
  if ActiveControl is TRichEdit then
    with FontItalicAction do
    begin
      Checked := not Checked;
      with (ActiveControl as TRichEdit).Font{.SelAttributes} do
        if Checked then Style := Style + [fsUnderline]
        else Style := Style - [fsUnderline];
    end;
end;

procedure TEnvelopePrintDlg.FontSelectActionExecute(Sender: TObject);
begin
  if ActiveControl is TRichEdit then
    with (ActiveControl as TRichEdit) do
    begin
      FontDialog.Font.Assign(SelAttributes);
      if FontDialog.Execute then {SelAttributes.}Font.Assign(FontDialog.Font);
    end;
end;

procedure TEnvelopePrintDlg.FontColorActionExecute(Sender: TObject);
begin
  if ActiveControl is TRichEdit then
    with (ActiveControl as TRichEdit).Font{.SelAttributes} do
    begin
      ColorDialog.Color := Color;
      if ColorDialog.Execute then Color := ColorDialog.Color;
    end;
end;

procedure TEnvelopePrintDlg.PrintEnvelopeActionExecute(Sender: TObject);
begin
  PrintEnvelope(True);
end;

procedure TEnvelopePrintDlg.SenderPanelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FDragAllowed then
  begin
    FDragged := Sender as TWinControl;
    FDragging := True;
    SetCapture(EnvelopePanel.Handle); // Перехоплення всіх подій від мишки.
    FDragOffsetX := X;
    FDragOffsetY := Y;
  end;
end;

procedure TEnvelopePrintDlg.EnvelopePanelMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if FDragging then DragPanel(X, Y);
end;

procedure TEnvelopePrintDlg.EnvelopePanelMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if FDragging then
  begin
    DragPanel(X, Y);
    FDragging := False;
    FDragged := nil;
    ReleaseCapture; // Звільнити перехоплення подій від мишки
  end;
end;

procedure TEnvelopePrintDlg.EnvelopePanelResize(Sender: TObject);
var W, H: Integer;
begin
  W := EnvelopePanel.Width;
  H := EnvelopePanel.Height;
  with ReceiverPanel do
  begin
    if Left + Width > W then
      Left := Max(SenderPanel.Left, W - Left - Width) - 5;
    if Top + Height > H then
      Top := Max(SenderPanel.Top, H - Top - Height) - 5;
  end;
end;

procedure TEnvelopePrintDlg.ViewTabSheetShow(Sender: TObject);
begin
  UpdatePreview;
end;

procedure TEnvelopePrintDlg.FormDestroy(Sender: TObject);
begin               
  FPrinterSetup.Free;
  FPrinterList.Free;
  FPaperHeights.Free;
  FPaperWidths.Free;
  inherited;
end;

end.
