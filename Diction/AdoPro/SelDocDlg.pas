unit SelDocDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, CheckLst, Buttons, ExtCtrls, DB, DBTables,IBQuery,
  IBCustomDataSet;

type
  TSelectDocmentsDlg = class(TForm)
    CtrlPanel: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    DocsCheckListBox: TCheckListBox;
    Label1: TLabel;
    AppendBtn: TSpeedButton;
    CleanBtn: TSpeedButton;
    SelDocQry: TIBQuery;
    SelDocQryDOCID: TIntegerField;
    SelDocQryDOCNAME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure CleanBtnClick(Sender: TObject);
    procedure AppendBtnClick(Sender: TObject);
    procedure DocsCheckListBoxDblClick(Sender: TObject);
    procedure DocsCheckListBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    FDocsCheckListChanged: Boolean;
    procedure AppendDocument;                  
    procedure EditDocument(AddNew: Boolean);
    procedure LoadDocumentList(Docs: TStrings);
    procedure RenameDocument;
    procedure SaveDocsCheckList;
    procedure StoreDocumentList(Docs: TStrings);
  end;

{var
  SelectDocmentsDlg: TSelectDocmentsDlg;}

function SelectVisaDocuments(DocList: TStrings): Boolean;


implementation

uses IniFiles, TourConsts, OptSet, TourCmnlIf, ServMod, TourDbUn;

{$R *.DFM}

function SelectVisaDocuments(DocList: TStrings): Boolean;
begin
  with TSelectDocmentsDlg.Create(Application) do
    try
      LoadDocumentList(DocList);
      Result := ShowModal = mrOk;
      if Result then StoreDocumentList(DocList);
    finally
      Free;
    end;
end;


{ SelectDocmentsDlg }

procedure TSelectDocmentsDlg.AppendDocument;
begin
  EditDocument(True);
end;

procedure TSelectDocmentsDlg.EditDocument(AddNew: Boolean);
const
  pCapt: array[Boolean] of String = (SSelDocDlgInputRename, SSelDocDlgInputAppend);
var
  S: String;
  I: Integer;
begin
  with DocsCheckListBox do
  begin
    if AddNew then S := '' else S := Items[ItemIndex];
    if VInputQuery(pCapt[AddNew], SSelDocDlgInputPrompt, S) then
    begin
      S := Trim(S);
      if Length(S) > 0 then
      begin
        I := Items.IndexOf(S);
        if I < 0 then
        begin
          if AddNew then Items.Add(S) else Items[ItemIndex] := S;
          FDocsCheckListChanged := True;
        end
        else begin
          ErrorFmtDlg(SSelDocDlgErrorDocExists, [S]);
          if AddNew then ItemIndex := I;
        end;
      end;
    end;
  end;
end;

procedure TSelectDocmentsDlg.LoadDocumentList(Docs: TStrings);
var I: Integer;
begin
  Screen.Cursor := crHourGlass;
  try
    with DocsCheckListBox do
      for I := 0 to Items.Count - 1 do Checked[I] := Docs.IndexOf(Items[I]) >= 0;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TSelectDocmentsDlg.RenameDocument;
begin
  EditDocument(False);
end;

procedure TSelectDocmentsDlg.SaveDocsCheckList;
var I: Integer;
begin
  Screen.Cursor := crHourGlass;
  with TIniFile.Create(IniFileName) do
    try
      EraseSection(iniSectVisaDocs);
      with DocsCheckListBox do
      begin
        WriteInteger(iniSectVisaDocs, iniKeyNumberCounter, Items.Count);
        for I := 0 to Items.Count - 1 do
          WriteString(iniSectVisaDocs, iniKeyNumberItem + IntToStr(I), Items[I]);
      end;
    finally
      Free;
      Screen.Cursor := crDefault;
    end;
end;

procedure TSelectDocmentsDlg.StoreDocumentList(Docs: TStrings);
var I: Integer;
begin
  Screen.Cursor := crHourGlass;
  try
    Docs.Clear;
    with DocsCheckListBox do
      for I := 0 to Items.Count - 1 do if Checked[I] then Docs.Add(Items[I]);
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TSelectDocmentsDlg.FormCreate(Sender: TObject);
begin
  DataFieldToStrings(SelDocQryDOCNAME, SelDocQryDOCID, DocsCheckListBox.Items);
  FDocsCheckListChanged := False;
end;

procedure TSelectDocmentsDlg.CleanBtnClick(Sender: TObject);
var I: Integer;
begin
  with DocsCheckListBox do for I := 0 to Items.Count - 1 do Checked[I] := False;
end;

procedure TSelectDocmentsDlg.AppendBtnClick(Sender: TObject);
begin
  AppendDocument;
end;

procedure TSelectDocmentsDlg.DocsCheckListBoxDblClick(Sender: TObject);
var  P: TPoint;
begin
  {}Exit;
  with DocsCheckListBox do
  begin
    P := ScreenToClient(Mouse.CursorPos);
    if ItemAtPos(P, True) >= 0 then RenameDocument else AppendDocument;
  end;
end;

procedure TSelectDocmentsDlg.DocsCheckListBoxKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_ADD) and (not OptionSet.UseCtrlKeyWithAdd
    or OptionSet.UseCtrlKeyWithAdd and (ssCtrl in Shift)) and AppendBtn.Enabled
  then AppendBtn.Click;
end;

procedure TSelectDocmentsDlg.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if FDocsCheckListChanged and (DocsCheckListBox.Items.Count > 0) then
    SaveDocsCheckList;
end;

end.
