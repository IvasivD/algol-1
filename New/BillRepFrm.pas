unit BillRepFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZRepFrm, ActnList, Menus, Db, DBTables, StdCtrls, Buttons, ExtCtrls,
  Grids, DBGrids;

type
  TOrderBillListForm = class(TZReportListForm)
    RepListQueryORDERID: TIntegerField;
    RepListQueryCLIENTNAME: TStringField;
    RepListQueryBILLID: TIntegerField;
    RepListQueryBILLNO: TStringField;
    RepListQueryBILLDATE: TDateTimeField;
    RepListQueryCURRENCYSHORT: TStringField;
    RepListQueryCURRENCYRATE: TFloatField;
    RepListQueryPAID: TFloatField;
    RepListQueryDUE: TFloatField;
    RepListQueryPAYDATE: TDateTimeField;
    RepListQueryPAYMETHOD: TSmallintField;
    RepListQueryCREDITCARD: TStringField;
    RepListQueryMANAGER: TStringField;
    RepListQueryCalcMethod: TStringField;
    procedure RepListQueryCalcFields(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure PrintReport; override;
    procedure ViewHint; override;
  public
    { Public declarations }
  end;

{var
  OrderBillListForm: TOrderBillListForm;}

procedure ShowOrderBillListForm{(ARect: TRect)};


implementation

uses VDlgs;

{$R *.DFM}

procedure ShowOrderBillListForm{(ARect: TRect)};
begin
  with TOrderBillListForm.Create(Application) do
    try
      BoundsRect := Bounds(xClientWindow, yClientWindow, wClientWindow, hClientWindow);
      if ShowModal = mrOk then ;
    finally
      Free;
    end;
end;

{ TOrderBillListForm }

procedure TOrderBillListForm.PrintReport;
begin
  inherited PrintReport;
end;

procedure TOrderBillListForm.ViewHint;
begin
  SendMyStatusMsg(Format('|%s', [RepListQueryCLIENTNAME.AsString]));
end;

procedure TOrderBillListForm.RepListQueryCalcFields(DataSet: TDataSet);
begin
  RepListQueryCalcMethod.Value := PayMethodIdent(RepListQueryPAYMETHOD.AsInteger);
end;

procedure TOrderBillListForm.FormActivate(Sender: TObject);
begin
  inherited;
  with RepListQuery do
  begin
    Close;
    Prepare;
    Open;
  end;
end;

end.
