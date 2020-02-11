unit InptHistDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls;

type
  TInputHistoryDlg = class(TForm)
    CtrlPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    PromptLabel: TLabel;
    ComboBox: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure ComboBoxExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FHistory: TStrings;
    FHistSect: string;
    procedure LoadHistoryStrings;
    procedure SetHistSect(const Value: string);
    procedure StoreHistoryStrings;
    function GetHistSect: string;
  protected
    property HistSect: string read GetHistSect write SetHistSect;
  end;

{var
  InputHistoryDlg: TInputHistoryDlg;}

function ExecuteInputHistory(const ACaption, APrompt: string;
  var AValue: string; const AHistSect: string = ''): Boolean;

implementation

uses IniFiles, TourCmnlIf, TourFiles;

{$R *.DFM}

const
  sHistSect = 'LastUsed\';

function ExecuteInputHistory(const ACaption, APrompt: string;
  var AValue: string; const AHistSect: string = ''): Boolean;
begin
  Result := False;
  with TInputHistoryDlg.Create(Application) do
  try
    Caption := ACaption;
    PromptLabel.Caption := APrompt;
    if AHistSect = '' then HistSect := 'InputQuery' else HistSect := AHistSect;
    ComboBox.Text := AValue;
    if ShowModal = mrOk then
    begin
      Result := True;
      AValue := ComboBox.Text;
    end;
  finally
    Free;
  end;
end;

{ TInputHistoryDlg }

function TInputHistoryDlg.GetHistSect: string;
begin
  Result := sHistSect + FHistSect;
end;

procedure TInputHistoryDlg.LoadHistoryStrings;
var
  V: string;
  I: Integer;
begin
  with TIniFile.Create(fIniFileName) do
  try
    if SectionExists(HistSect) then
    begin
      FHistory.Clear;
      for I := 0 to ComboBox.DropDownCount - 1 do
        if ValueExists(HistSect, 'Item' + IntToStr(I)) then
        begin
          V := ReadString(HistSect, 'Item' + IntToStr(I), '');
          if V <> '' then FHistory.Add(V);
        end
        else Break;
    end;
  finally
    Free;
  end;
end;

procedure TInputHistoryDlg.SetHistSect(const Value: string);
begin
  if FHistSect <> Value then
  begin
    FHistSect := Value;
    LoadHistoryStrings;
  end;
end;

procedure TInputHistoryDlg.StoreHistoryStrings;
var I: Integer;
begin
  with TIniFile.Create(fIniFileName) do
  try
    if SectionExists(HistSect) then EraseSection(HistSect);
    for I := 0 to FHistory.Count - 1 do
      WriteString(HistSect, 'Item' + IntToStr(I), FHistory[I]);
  finally
    Free;
  end;
end;

procedure TInputHistoryDlg.FormCreate(Sender: TObject);
begin
  FHistory := ComboBox.Items;
  FHistSect := '';
end;

procedure TInputHistoryDlg.ComboBoxExit(Sender: TObject);
begin
  with ComboBox do
    if (Trim(Text) <> '') and (Items.IndexOf(Text) < 0) then Items.Add(Text);
end;

procedure TInputHistoryDlg.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  ComboBoxExit(Self);
  StoreHistoryStrings;
end;

end.
