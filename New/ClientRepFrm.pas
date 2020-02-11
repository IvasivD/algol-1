unit ClientRepFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZTVwGrid, ActnList, Menus, Db, DBTables, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls;

type
  TClientReportForm = class(TZViewGridForm)
    DetailListQueryORDERID: TIntegerField;
    DetailListQueryDATEANDTIME: TDateTimeField;
    DetailListQueryRESERVTO: TDateTimeField;
    DetailListQueryTOTAL: TFloatField;
    DetailListQueryDISCOUNT: TFloatField;
    DetailListQueryDISCOUNTVALUE: TFloatField;
    DetailListQueryPAID: TFloatField;
    DetailListQueryTOTAL2: TFloatField;
    DetailListQueryDISCOUNT2: TFloatField;
    DetailListQueryDISCOUNTVALUE2: TFloatField;
    DetailListQueryPAID2: TFloatField;
    DetailListQuerySTATE: TSmallintField;
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
    DetailListQueryCalcState: TStringField;
    DetailListQueryOTHERTOTAL2: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure DetailListQueryCalcFields(DataSet: TDataSet);
    procedure PersonListDBGridDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    FClientId: Integer;
  protected
    procedure UpdateDetailListQuery; override;
  end;

{var
  ClientReportForm: TClientReportForm;}

procedure ShowClientReport(ClientId: Integer; const ClientName: String);


implementation

uses DataMod, VDlgs, OptSet;

{$R *.DFM}

procedure ShowClientReport(ClientId: Integer; const ClientName: String);
begin
  with TClientReportForm.Create(Application) do
    try
      FClientId := ClientId;
      Caption := Format(Caption, [ClientName]);
      ShowModal;
    finally
      Free;
    end;
end;


{ TClientReportForm }

procedure TClientReportForm.UpdateDetailListQuery;
begin
  with DetailListQuery do
  begin
    Close;
    ParamByName('ClientId').Value := FClientId;
    Prepare;
    Open;
  end;
end;

procedure TClientReportForm.FormCreate(Sender: TObject);
begin
  inherited;
  GridHintedColumn := DetailListQueryORDERID;
end;

procedure TClientReportForm.DetailListQueryCalcFields(DataSet: TDataSet);
begin
  DetailListQueryCalcState.Value := GetOrderPaymentStateName(DetailListQuerySTATE.AsInteger);
end;

procedure TClientReportForm.PersonListDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var OrderState: Integer;
begin
  if not (gdFixed in State) then
    with (Sender as TDBGrid).Canvas do
    begin
      OrderState := DetailListQuerySTATE.AsInteger;
      if Column.FieldName = 'CalcState' then
      begin
        Brush.Style := bsSolid;
        case OrderState of
          ordFinished: Brush.Color := OptionSet.Colors[0];
          ordTimeOut: Brush.Color := OptionSet.Colors[1];
          ordNotPaid: Brush.Color := OptionSet.Colors[2];
          ordPartPay: Brush.Color := OptionSet.Colors[3];
          ordPaid: Brush.Color := OptionSet.Colors[4];
          ordAnnulled: Brush.Color := OptionSet.Colors[0];
          else Brush.Color := clInfoBk;
        end;
        FillRect(Rect);
        if State = [] then Font.Style := [] else Font.Style := [fsBold];
        Font.Color := clWindowText;
      end;
      if OrderState = ordAnnulled then Font.Style := Font.Style + [fsStrikeOut]
        else Font.Style := Font.Style - [fsStrikeout];
    end;
  inherited;
end;

end.
