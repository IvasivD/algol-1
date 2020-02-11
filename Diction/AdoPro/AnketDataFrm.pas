unit AnketDataFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, AzStringGrid, StdCtrls, Buttons, ExtCtrls, DB,
  ActnList, Math, IBCustomDataSet, IBQuery, IBDatabase;

type
  TAnketDataForm = class(TForm)
    Panel1: TPanel;
    SourceListBox: TListBox;
    TargetListBox: TListBox;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ActionList1: TActionList;
    AddItenAction: TAction;
    DelItemAction: TAction;
    TargetTransaction: TIBTransaction;
    TargetQry: TIBQuery;
    TargetQryTEMPLID: TIntegerField;
    TargetQryTYPEID: TIntegerField;
    TargetQryFIELDNAME: TIBStringField;
    TargetQryEMBASSYID: TIntegerField;
    procedure SourceListBoxDblClick(Sender: TObject);
    procedure TargetListBoxDblClick(Sender: TObject);
    procedure AddItenActionExecute(Sender: TObject);
    procedure DelItemActionExecute(Sender: TObject);
    procedure ActionList1Update(Action: TBasicAction;
      var Handled: Boolean);
    procedure TargetListBoxDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
  private
    FTypeAnket: Integer;
    procedure PrepareSourceListBox;
    procedure MoveItem(SourceList, TargetList: TListBox);
    procedure StoreAnketData;
    procedure UpdateTargetQry;
    procedure PrepareTargetListBox;
  end;

function ExecuteAnketData(TypeAnket: Integer): Boolean;

implementation

uses
  TourCmnlIf, TourConsts, ServModIB, ServMod;

{$R *.dfm}
function ExecuteAnketData(TypeAnket: Integer): Boolean;
const CaptArr: array[0..1] of string = ('Анкетні дані для відбору документів', 
  'Анкетні дані для реєстрації на подачу');
begin
  with TAnketDataForm.Create(Application) do
   try
     FTypeAnket := TypeAnket;
     Caption := CaptArr[FTypeAnket];
     UpdateTargetQry;
     Elem_AnketTempQry.DBOpen;
     PrepareTargetListBox;
     PrepareSourceListBox;
     Result := ShowModal = mrOk;
     if Result then StoreAnketData;
   finally
     Free;
   end;
end;
{ TAnketDataForm }

procedure TAnketDataForm.MoveItem(SourceList, TargetList: TListBox);
begin
  TargetList.Items.AddObject(SourceList.Items[SourceList.ItemIndex],
    TObject(PChar(SourceList.Items.Objects[SourceList.ItemIndex])));
  SourceList.Items.Delete(SourceList.ItemIndex);
end;

procedure TAnketDataForm.PrepareSourceListBox;
var I: Integer;
    AnketFields: TFields;
    DisplayName: string;
begin
  AnketFields := Elem_ANKETTEMPQry.DB.Fields;
  for I := 0 to AnketFields.Count - 1 do begin 
    DisplayName := Trim(AnketFields[I].DisplayName);
    if (AnketFields[I].DataType = ftString) and AnketFields[I].AsBoolean
      and (DisplayName <> AnketFields[I].FieldName)
      and (DisplayName <> EmptyStr)
      and not TargetQry.Locate('FieldName', AnketFields[I].FieldName, [])
    then SourceListBox.Items.AddObject(DisplayName, TObject(PChar(AnketFields[I].FieldName)));
  end;
end;

procedure TAnketDataForm.SourceListBoxDblClick(Sender: TObject);
begin
  inherited;  
  AddItenAction.Execute;  
end;

procedure TAnketDataForm.TargetListBoxDblClick(Sender: TObject);
begin
  inherited;
  DelItemAction.Execute;
end;

procedure TAnketDataForm.AddItenActionExecute(Sender: TObject);
var ItemId: Integer;
begin
  inherited;
  ItemId := SourceListBox.ItemIndex;
  if ItemId = -1 then ErrorDlg('Не вибрано елеменет для переміщення')
  else begin   
    MoveItem(SourceListBox, TargetListBox);
    ItemId := Min(ItemId, SourceListBox.Items.Count - 1); 
    if ItemId >= 0 then SourceListBox.Selected[ItemId] := True;
  end;
end;

procedure TAnketDataForm.DelItemActionExecute(Sender: TObject);
var ItemId: Integer;
begin
  inherited;
  ItemId := TargetListBox.ItemIndex;
  if ItemId = -1 then ErrorDlg('Не вибрано елеменет для переміщення')
  else begin   
    MoveItem(TargetListBox, SourceListBox);
    ItemId := Min(ItemId, TargetListBox.Items.Count - 1);
    if ItemId >= 0 then TargetListBox.Selected[ItemId] := True;
  end;
end;

procedure TAnketDataForm.ActionList1Update(Action: TBasicAction;
  var Handled: Boolean);
begin
  inherited;
  AddItenAction.Enabled := SourceListBox.Items.Count > 0;
  DelItemAction.Enabled := TargetListBox.Items.Count > 0;
end;

procedure TAnketDataForm.StoreAnketData;
const DeleteSql = 'Delete From TouristAnketTemplates where EmbassyId = %d and TypeId = %d';
  InsertSql = 'Insert Into TouristAnketTemplates(TypeId, FieldName, EmbassyId) ' +
    'Values(%d, ''%s'', %d)';
var I: Integer;    
begin
 { with DMServ, DMServIB do begin
    WorkQueryExecute(Format(DeleteSql, [Elem_ItsKonsulQry.DB.FieldByName('COMPANYID').asInteger, FTypeAnket]),
      STourMainErrorUpdateTour);
    for I := 0 to TargetListBox.Items.Count - 1 do
    WorkQueryExecute(Format(InsertSql, [FTypeAnket, 
      PChar(TargetListBox.Items.Objects[I]),
      Elem_ItsKonsulQry.DB.FieldByName('COMPANYID').asInteger]),
      STourMainErrorUpdateTour);  
  end; }
end;

procedure TAnketDataForm.UpdateTargetQry;
begin
  with TargetQry do begin
    //if Transaction.Active then Transaction.Commit;
    Close;
    ParamByName('TypeId').Value := FTypeAnket;
    ParamByName('EmbassyId').Value := Elem_CNTREMBASSIES.DB.fieldByName('COMPANYID').Value;//Elem_ItsKonsulQry.DB.FieldByName('COMPANYID').asInteger;
    Open;
  end;
end;

procedure TAnketDataForm.PrepareTargetListBox;
var aField: TField;
begin
  with TargetQry do
  while not Eof do begin
    aField := Elem_ANKETTEMPQry.DB.FindField(TargetQryFIELDNAME.Value);
    if aField <> nil then
      TargetListBox.Items.AddObject(aField.DisplayLabel, 
        TObject(PChar(Elem_ANKETTEMPQry.DB.FieldByName(TargetQryFIELDNAME.AsString).FieldName)));
    Next;                    
  end;
end;

procedure TAnketDataForm.TargetListBoxDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  inherited;
  if not Elem_ANKETTEMPQry.DB.FieldByName(PChar(TargetListBox.Items.Objects[Index])).AsBoolean
  then
  with TargetListBox.Canvas do begin
    FillRect(Rect);
    Font.Color := clred;
    TextOut(Rect.Left, Rect.Top, TargetListBox.Items[Index]);  
  end else 
  with TargetListBox.Canvas do begin
    FillRect(Rect);
    TextOut(Rect.Left, Rect.Top, TargetListBox.Items[Index]);  
  end;
end;

end.
