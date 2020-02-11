unit UnitPaymentBilling;

interface
uses InvokeRegistry;
const 

  sBillingsNewDetailSQL =
    'select BillingNo, BillingDate, BillingVer, ' +
    '  ManagerId, ExpireTo, Deleted, ExchCurrId, ' +
    '  Paid,  Debt, ACCOUNTID, B.CurrencyId, BillingId, C.CurrencyShort, ' +
    '  eC.CurrencyShort ExchCurrShort, B.CurrencyRate, ' +
    '  case B.CurrencyId ' +
    '  when %d then 0 ' +
    '  else 1 ' +
    '  end OrderBill ' +
    'from Billings B ' +
    'left join Currency C on C.CurrencyId = B.CurrencyId ' +
    'left join Currency eC on eC.CurrencyId = B.ExchCurrId ' +
    'where OrderId = %d and BillingNo = %d and debt > 0 ' +
    'order by 16, B.CurrencyId ';

  sBillInsertSQL =
    'insert into Bills ( ' +
    'OrderId, PayMethod, ManagerId, ' +
    'CurrencyId, CurrencyRate, ExchCurrId, BillNo, BillDate, PayDate, ' +
    'BillingNo, BillingDate, Paid, V1_Paid, V2_Paid, ' +
    'V1_BLNGDISC, V2_BLNGDISC, BLNGDISC, DocTypeId, BillingId) ' +
    'values ( ' +
    ':OrderId, :PayMethod, :ManagerId, ' +
    ':CurrencyId, :CurrencyRate, :ExchCurrId, :BillNo, :BillDate, :PayDate, ' +
    ':BillingNo, :BillingDate, :Paid, :V1_Paid, :V2_Paid, ' +
    ':V1_BLNGDISC, :V2_BLNGDISC, :BLNGDISC, :DocTypeId, :BillingId) ';

  sBillingUpdateSQL =
    'update Billings set ' +
    'V1_Paid = V1_Paid + :V1_Paid, V2_Paid = V2_Paid + :V2_Paid, Paid = Paid + :Paid, ' +
    'V1_Debt = V1_Debt - :V1_Paid, V2_Debt = V2_Debt - :V2_Paid, Debt = Debt - :Paid ' +
    'where BillingId = :BillingId ';

type
   TPaymentBillingData = class(TRemotable)

    private
      FOrderId: Integer;
      FExchCurrId: Integer;
      FBillingNo: Integer;
      FTotalSum: Extended;
      FPayMethod: Integer;
      FManagerId: Integer;
      FBillNo: string;
      FBillDate: TDateTime;
      FDocTypeId: Integer;
   public
   published
      property OrderId: Integer read FOrderId write FOrderId;
      property ExchCurrId: Integer read FExchCurrId write FExchCurrId;
      property BillingNo: Integer read FBillingNo write FBillingNo;
      property TotalSum: Extended read FTotalSum write FTotalSum;
      property PayMethod: Integer read FPayMethod write FPayMethod;
      property ManagerId: Integer read FManagerId write FManagerId;
      property BillNo: string read FBillNo write FBillNo;
      property BillDate: TDateTime read FBillDate write FBillDate;
      property DocTypeId: Integer read FDocTypeId write FDocTypeId;
   end;


function PaymentBilling( PathDB, UID, Password: String; PaymentBillingData: TPaymentBillingData ): Integer;
procedure UpdateBillingData( PathDB, UID, Password: String;
  PaymentBillingData: TPaymentBillingData; BillingId: Integer; ItemValue: Extended);

implementation

uses
  SysUtils, UnitIBQuery, IBQuery, Math;

function PaymentBilling( PathDB, UID, Password: String; PaymentBillingData: TPaymentBillingData ): Integer;
var 
  BillingsNewDetailQry, UpdServQry: TIBQuery;
  SqlText: WideString;  
  RecordNo: Integer;
  PayTakeItemValue, TotalSum, CurrencyRate: Extended;
begin
  Result := 0;
  SqlText := Format(sBillingsNewDetailSQL, [PaymentBillingData.ExchCurrId, PaymentBillingData.OrderId, PaymentBillingData.BillingNo]);
  try
    BillingsNewDetailQry := CreateDataSet(PathDB, UID, Password, SqlText);
    UpdServQry := CreateDataSet(PathDB, UID, Password, sBillInsertSQL, False);
  except
    Result := -1;
  end;
  try 
    RecordNo := 1;
    while not BillingsNewDetailQry.Eof do begin 
      if (BillingsNewDetailQry.FieldByName('DEBT').Value > 0) and (PaymentBillingData.TotalSum > 0) then      
// insert into BILLS table
        begin
          UpdServQry.Close;
          UpdServQry.ParamByName('OrderId').AsInteger := PaymentBillingData.OrderId;
          UpdServQry.ParamByName('CurrencyId').AsInteger := BillingsNewDetailQry.FieldByName('CURRENCYID').AsInteger;
          CurrencyRate := BillingsNewDetailQry.FieldByName('CurrencyRate').Value;
          UpdServQry.ParamByName('CurrencyRate').AsFloat := CurrencyRate;
          UpdServQry.ParamByName('ExchCurrId').AsInteger := PaymentBillingData.ExchCurrId;
          UpdServQry.ParamByName('PayMethod').AsInteger := PaymentBillingData.PayMethod;
          UpdServQry.ParamByName('ManagerId').AsInteger := PaymentBillingData.ManagerId;
          UpdServQry.ParamByName('BillNo').AsString := PaymentBillingData.BillNo;
          UpdServQry.ParamByName('BillDate').AsDateTime := PaymentBillingData.BillDate;
          UpdServQry.ParamByName('PayDate').AsDateTime := PaymentBillingData.BillDate;
          UpdServQry.ParamByName('DocTypeId').AsInteger := PaymentBillingData.DocTypeId;

          UpdServQry.ParamByName('BillingNo').AsInteger := PaymentBillingData.BillingNo;
          UpdServQry.ParamByName('BillingId').AsInteger := BillingsNewDetailQry.FieldByName('BILLINGID').Value;

          if (SimpleRoundTo(BillingsNewDetailQry.FieldByName('DEBT').Value * CurrencyRate) <= PaymentBillingData.TotalSum)
            and (BillingsNewDetailQry.RecordCount >= RecordNo)
          then begin
            PayTakeItemValue := BillingsNewDetailQry.FieldByName('DEBT').Value;
            TotalSum := TotalSum - BillingsNewDetailQry.FieldByName('DEBT').Value * CurrencyRate;
          end else begin 
            PayTakeItemValue := TotalSum / CurrencyRate;
            TotalSum := 0;
          end;

          UpdServQry.ParamByName('Paid').AsFloat := PayTakeItemValue;
          UpdServQry.ParamByName('V2_Paid').AsFloat := PayTakeItemValue; 

          UpdServQry.ParamByName('V1_Paid').AsFloat := 0; 
          UpdServQry.ParamByName('V1_BLNGDISC').AsFloat := 0; 
          UpdServQry.ParamByName('V2_BLNGDISC').AsFloat := 0; 
          UpdServQry.ParamByName('BLNGDISC').AsFloat := 0; 
          if BillingsNewDetailQry.FieldByName('BILLINGDATE').Value  > 0 then           
            UpdServQry.ParamByName('BillingDate').AsDateTime := BillingsNewDetailQry.FieldByName('BILLINGDATE').Value 
          else
            UpdServQry.ParamByName('BillingDate').Clear;
            
          UpdServQry.ExecSQL;        
          UpdServQry.Transaction.Commit;
          UpdateBillingData(PathDB, UID, Password, PaymentBillingData, BillingsNewDetailQry.FieldByName('BILLINGID').Value, PayTakeItemValue);
        end;
      Inc(RecordNo);
      BillingsNewDetailQry.Next;
    end;    
  finally
    DestroyDS(BillingsNewDetailQry);
    DestroyDS(UpdServQry);
  end;
end;

procedure UpdateBillingData(PathDB, UID, Password: String; 
  PaymentBillingData: TPaymentBillingData; BillingId: Integer; ItemValue: Extended);
var UpdQry: TIBQuery;
begin
  UpdQry := CreateDataSet(PathDB, UID, Password, sBillInsertSQL, False);
  try
    UpdQry.Close;
    UpdQry.SQL.Text := sBillingUpdateSQL;
    UpdQry.ParamByName('BillingId').Value := BillingId;
    UpdQry.ParamByName('V1_Paid').Value := 0;
    UpdQry.ParamByName('V2_Paid').Value := ItemValue;
    UpdQry.ParamByName('Paid').Value := ItemValue;
    UpdQry.ExecSQL; 
    UpdQry.Transaction.Commit;
  finally
    DestroyDS(UpdQry);
  end; 
end;

end.
 