unit DocLstFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, ExtCtrls;

type
  TDocumentListForm = class(TForm)
    Panel7: TPanel;
    CloseBtn: TBitBtn;
    HNotDocsListBox: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    HaveDocsListBox: TListBox;
    MoveDownBtn: TSpeedButton;
    MoveUpBtn: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure MoveDownBtnClick(Sender: TObject);
    procedure MoveUpBtnClick(Sender: TObject);
    procedure DocsListBoxDblClick(Sender: TObject);
  private    
    procedure MoveSelected(List: TCustomListBox; Items: TStrings);
    procedure SetItem(List: TListBox; Index: Integer);
    function GetFirstSelection(List: TCustomListBox): Integer;
    procedure UpdateBottons;
  public
    function DocumentsState: Smallint;
    procedure FillDocumentLists(const NotHave, Have: String);
    function HaveDocuments: String;
  end;

var
  DocumentListForm: TDocumentListForm;

implementation

uses VDlgs;

{$R *.DFM}

function TDocumentListForm.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
    if List.Selected[Result] then Exit;
  Result := LB_ERR;
end;

procedure TDocumentListForm.MoveSelected(List: TCustomListBox; Items: TStrings);
var I: Integer;
begin
  for I := List.Items.Count - 1 downto 0 do
    if List.Selected[I] then
    begin
      Items.AddObject(List.Items[I], List.Items.Objects[I]);
      List.Items.Delete(I);
    end;
end;

procedure TDocumentListForm.SetItem(List: TListBox; Index: Integer);
var MaxIndex: Integer;
begin
  with List do
  begin
    SetFocus;
    MaxIndex := List.Items.Count - 1;
    if Index = LB_ERR then Index := 0
    else if Index > MaxIndex then Index := MaxIndex;
    Selected[Index] := True;
  end;
  UpdateBottons;
end;

procedure TDocumentListForm.UpdateBottons;
begin
  with HNotDocsListBox do
    MoveDownBtn.Enabled := (Items.Count > 0); // and (ItemIndex >= 0);
  with HaveDocsListBox do
    MoveUpBtn.Enabled := (Items.Count > 0); // and (ItemIndex >= 0);
end;

function TDocumentListForm.DocumentsState: Smallint;
begin
  if HaveDocsListBox.Items.Count = 0 then Result := 0
  else if HNotDocsListBox.Items.Count = 0 then Result := 2 else Result := 1;
end;

procedure TDocumentListForm.FillDocumentLists(const NotHave, Have: String);
var I: Integer;
begin
  DelimitedToStrings(NotHave, HNotDocsListBox.Items);
  DelimitedToStrings(Have, HaveDocsListBox.Items);
  with HNotDocsListBox do
    for I := Items.Count - 1 downto 0 do
      if HaveDocsListBox.Items.IndexOf(Items[I]) >= 0 then Items.Delete(I);
  with HNotDocsListBox do if Items.Count > 0 then ItemIndex := 0;
  with HaveDocsListBox do if Items.Count > 0 then ItemIndex := 0;
end;

function TDocumentListForm.HaveDocuments: String;
begin
  Result := StringsToDelimited(HaveDocsListBox.Items);
end;

procedure TDocumentListForm.FormActivate(Sender: TObject);
begin
  UpdateBottons;
end;

procedure TDocumentListForm.MoveDownBtnClick(Sender: TObject);
var Index: Integer;
begin
  Index := GetFirstSelection(HNotDocsListBox);
  MoveSelected(HNotDocsListBox, HaveDocsListBox.Items);
  SetItem(HNotDocsListBox, Index);
  //UpdateBottons;
end;

procedure TDocumentListForm.MoveUpBtnClick(Sender: TObject);
var Index: Integer;
begin
  Index := GetFirstSelection(HaveDocsListBox);
  MoveSelected(HaveDocsListBox, HNotDocsListBox.Items);
  SetItem(HaveDocsListBox, Index);
  //UpdateBottons;
end;

procedure TDocumentListForm.DocsListBoxDblClick(Sender: TObject);
var
  Box: TListBox;
  P: TPoint;
begin
  Box := Sender as TListBox;
  P := Box.ScreenToClient(Mouse.CursorPos);
  if Box.ItemAtPos(P, True) >= 0 then
    case Box.Tag of
      0: MoveDownBtn.Click;
      1: MoveUpBtn.Click;
    end;
end;

end.
