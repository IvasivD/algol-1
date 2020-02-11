unit TripDetFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, Db, DBTables, StdCtrls, Buttons, ExtCtrls, Menus;

type
  TTripDetailPersonListForm = class(TForm)
    PersonListDBGrid: TDBGrid;
    Panel7: TPanel;
    CloseBtn: TBitBtn;
    DetailListQuerySrc: TDataSource;
    DetailListQuery: TQuery;
    PopupMenu: TPopupMenu;
    CloseItem: TMenuItem;
    DetailListQueryLEAVINGID: TIntegerField;
    DetailListQueryPLACEID: TIntegerField;
    DetailListQueryPLACENO: TStringField;
    DetailListQueryORDERID: TIntegerField;
    DetailListQueryCLIENTNAME: TStringField;
    DetailListQueryPERSONID: TIntegerField;
    DetailListQueryTOURISTNAME: TStringField;
    DetailListQueryTOURISTNAMEEN: TStringField;
    DetailListQueryTOURISTBIRTHDATE: TDateTimeField;
    DetailListQueryTOURISTPASSPORT: TStringField;
    DetailListQuerySTARTPOINT: TStringField;
    DetailListQuerySTOPPOINT: TStringField;
    DetailListQueryFROMDATE: TDateTimeField;
    DetailListQueryDAYCOUNT: TSmallintField;
    DetailListQueryRESORTNAME: TStringField;
    DetailListQueryHOTELNAME: TStringField;
    DetailListQueryVOUCHERNO: TStringField;
    DetailListQueryRETURNDATE: TDateTimeField;
    DetailListQueryBKWPLACENO: TStringField;
    DetailListQueryTRIPTOTAL: TFloatField;
    DetailListQueryTRIPTOTAL2: TFloatField;
    DetailListQueryHOTELTOTAL: TFloatField;
    DetailListQueryHOTELTOTAL2: TFloatField;
    DetailListQueryTRANSFERTOTAL: TFloatField;
    DetailListQueryTRANSFERTOTAL2: TFloatField;
    DetailListQueryVISATOTAL: TFloatField;
    DetailListQueryVISATOTAL2: TFloatField;
    DetailListQueryEXCURSIONTOTAL: TFloatField;
    DetailListQueryEXCURSIONTOTAL2: TFloatField;
    DetailListQueryINSURETOTAL: TFloatField;
    DetailListQueryFIRMTOTAL: TFloatField;
    DetailListQueryRESORTTOTAL: TFloatField;
    DetailListQueryRESORTTOTAL2: TFloatField;
    DetailListQueryTOTALPAID: TFloatField;
    DetailListQueryTOTALPAID2: TFloatField;
    DetailListQueryMEMO: TMemoField;
    DetailListQueryCalcMemo: TStringField;
    DetailListQueryCalcDue: TCurrencyField;
    DetailListQueryCalcDue2: TCurrencyField;
    DetailListQueryOTHERTOTAL2: TFloatField;
    procedure DetailListQueryCalcFields(DataSet: TDataSet);
    procedure PersonListDBGridDblClick(Sender: TObject);
    procedure PersonListDBGridCellClick(Column: TColumn);
    procedure PersonListDBGridKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CloseItemClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    procedure ViewHint;
    procedure ViewMemo;
  end;

{var
  TripDetailPersonListForm: TTripDetailPersonListForm;}

procedure ShowTripDetailPersonList(ARect: TRect);


implementation

uses DataMod, VDlgs;

{$R *.DFM}

procedure ShowTripDetailPersonList(ARect: TRect);
begin
  with TTripDetailPersonListForm.Create(Application) do
    try
      BoundsRect := ARect;
      Caption := Format(Caption, [
        DM.TripQueryCalcFrom.AsString, DM.TripQueryCalcArrive.AsString,
        DM.TripQueryLeaveDate.DisplayText]);
      DM.UpdateQuery(DetailListQuery);
      if ShowModal = mrOk then ;
        //DM.PersonQry.Locate('TouristId', DetailListQueryCLIENTID.Value, []);
    finally
      Free;
    end;
end;

{ TTripDetailPersonListForm }

procedure TTripDetailPersonListForm.ViewHint;
begin
  SendMyStatusMsg(Format('|%s', [DetailListQueryTOURISTNAME.AsString]));
end;

procedure TTripDetailPersonListForm.ViewMemo;
const
  xSize = 200;
  ySize = 160;
var
  Field: TField;
  VwFrm: TForm;
  Col: Integer;
  M: TPoint;
begin
  M := Mouse.CursorPos;
  if DBGridDblClickIsValid(PersonListDBGrid, Col) then
  begin
    Field := PersonListDBGrid.Columns[Col].Field;
    if ((Field.DataType = ftMemo) or (Field.DataType = ftFmtMemo)) then
    begin
      VwFrm := TForm.Create(Application);
      with VwFrm do
        try
          if M.X + xSize <= Screen.Width then
            Left := M.X + 1 else Left := M.X - xSize - 1;
          if M.Y + ySize <= Screen.Height then
            Top := M.Y + 1 else Top := M.Y - ySize - 1;
          Width := xSize;
          Height := ySize;
          BorderIcons := [biSystemMenu];
          BorderStyle := bsSizeToolWin;
          with TMemo.Create(VwFrm) do
          begin
            Parent := VwFrm;
            Align := alClient;
            ScrollBars := ssVertical;
            WordWrap := True;
            Color := clInfoBk;
            Text := Field.AsString;
            ReadOnly := True;
          end;
          KeyPreview := True;
          Caption := Field.DisplayName;
          OnKeyPress := FormKeyPress;
          ShowModal;
        finally
          Free;
        end;
    end;
  end;
end;

procedure TTripDetailPersonListForm.DetailListQueryCalcFields(DataSet: TDataSet);
var S: String;
begin
  S := StringReplace(DetailListQueryMemo.AsString, #10, #32, [rfReplaceAll]);
  DetailListQueryCalcMemo.Value := StringReplace(S, #13, #32, [rfReplaceAll]);
  DetailListQueryCalcDue.Value := DetailListQueryTRIPTOTAL.Value +
    DetailListQueryHOTELTOTAL.Value + DetailListQueryTRANSFERTOTAL.Value +
    DetailListQueryVISATOTAL.Value + DetailListQueryEXCURSIONTOTAL.Value +
    DetailListQueryINSURETOTAL.Value + DetailListQueryFIRMTOTAL.Value +
    DetailListQueryRESORTTOTAL.Value - DetailListQueryTOTALPAID.Value;
  DetailListQueryCalcDue2.Value := DetailListQueryTRIPTOTAL2.Value +
    DetailListQueryHOTELTOTAL2.Value + DetailListQueryTRANSFERTOTAL2.Value +
    DetailListQueryVISATOTAL2.Value + DetailListQueryEXCURSIONTOTAL2.Value +
    DetailListQueryRESORTTOTAL2.Value + DetailListQueryOTHERTOTAL2.Value -
    DetailListQueryTOTALPAID2.Value;
end;

procedure TTripDetailPersonListForm.PersonListDBGridCellClick(Column: TColumn);
begin
  ViewHint;
end;

procedure TTripDetailPersonListForm.PersonListDBGridDblClick(Sender: TObject);
begin
  ViewMemo;
end;

procedure TTripDetailPersonListForm.PersonListDBGridKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  ViewHint;
end;

procedure TTripDetailPersonListForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    Key := #0;
    Close;
  end;
end;

procedure TTripDetailPersonListForm.CloseItemClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TTripDetailPersonListForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if CanClose then ClearMyStatusMsg;
end;

end.
