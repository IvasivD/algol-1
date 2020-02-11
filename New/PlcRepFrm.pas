unit PlcRepFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZTVwGrid, ImgList, ActnList, Menus, Db, DBTables, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, ComCtrls, AzComboBox, SvtDBGrids;

type
  TPlaceByStateListForm = class(TZViewGridForm)
    DetailListQueryLEAVINGID: TIntegerField;
    DetailListQueryPLACEID: TIntegerField;
    DetailListQueryPLACENO: TStringField;
    DetailListQueryPLACECLASS: TSmallintField;
    DetailListQueryLEAVEDATE: TDateTimeField;
    DetailListQuerySTATE: TSmallintField;
    DetailListQueryORDERID: TIntegerField;
    DetailListQueryCLIENTNAME: TStringField;
    DetailListQueryCLIENTISENTERPR: TStringField;
    DetailListQueryPERSONID: TIntegerField;
    DetailListQueryTOURISTNAME: TStringField;
    DetailListQuerySTARTPOINT: TStringField;
    DetailListQuerySTOPPOINT: TStringField;
    DetailListQueryTICKETNO: TStringField;
    DetailListQueryRATE: TFloatField;
    DetailListQueryRATE2: TFloatField;
    DetailListQueryDISCOUNT: TFloatField;
    DetailListQueryDISCOUNT2: TFloatField;
    DetailListQueryINCREASE: TFloatField;
    DetailListQueryINCREASE2: TFloatField;
    DetailListQueryCURRENCYSHORT: TStringField;
    DetailListQueryORDERMEMO: TMemoField;
    DetailListQueryRESERVTO: TDateTimeField;
    DetailListQueryMANAGER: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    FromDatePicker: TDateTimePicker;
    TillDatePicker: TDateTimePicker;
    DirectionRadioGroup: TRadioGroup;
    ExecuteBtn: TBitBtn;
    DetailListQueryRETLEAVEDATE: TDateTimeField;
    DetailListQueryRETPLACENO: TStringField;
    StateFilterCheckBox: TCheckBox;
    StateFilterComboBox: TAzComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FromDatePickerChange(Sender: TObject);
    procedure ExecuteBtnClick(Sender: TObject);
    procedure PersonListDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TSvtColumn; State: TGridDrawState);
    procedure StateFilterCheckBoxClick(Sender: TObject);
    procedure StateFilterComboBoxClick(Sender: TObject);
  private
    procedure PrepareDatePickers;
    procedure PrepareStateFilter;
  protected
    function GetManagerName: String; override;
    function GetOrderColumns(Column: TSvtColumn): String; override;
    procedure SetDetailListQueryParams; override;
  end;

var
  PlaceByStateListForm: TPlaceByStateListForm;

procedure ShowPlaceByStateListForm;


implementation

uses VDlgs, TourConsts, OptSet, DataMod, OrderUn;

{$R *.DFM}

procedure ShowPlaceByStateListForm;
begin
  PlaceByStateListForm.Show;
  {with TPlaceByStateListForm.Create(Application) do
    try
      ShowModal;
    finally
      Free;
    end;}
end;

{ TPlaceByStateListForm }

procedure TPlaceByStateListForm.PrepareDatePickers;
begin
  FromDatePicker.DateTime := Int(Now);
  TillDatePicker.DateTime := Int(Now) + 20;
  FromDatePickerChange(Self);
end;

procedure TPlaceByStateListForm.PrepareStateFilter;
var I: Integer;
begin
  with StateFilterComboBox.Items do
    for I := ordTimeOut to ordPaid do
      {$WARN UNSAFE_TYPE OFF}
      if I <> ordAnnuled then AddObject(GetOrderPaymentStateName(I), Pointer(I));
      {$WARN UNSAFE_TYPE ON}
end;

function TPlaceByStateListForm.GetManagerName: String;
begin
  Result := DM.CurManagerName;
end;

function TPlaceByStateListForm.GetOrderColumns(Column: TSvtColumn): String;
var ColName: String;
begin
  ColName := Column.FieldName;
  if ColName = 'LEAVEDATE' then
    Result := ', CLIENTNAME, ORDERID, TOURISTNAME, PLACENO'
  else if ColName = 'ORDERID' then
    Result := ', LEAVEDATE, TOURISTNAME, PLACENO'
  else if ColName = 'CLIENTNAME' then
    Result := ', LEAVEDATE, ORDERID, TOURISTNAME, PLACENO'
  else if ColName = 'TOURISTNAME' then
    Result := ', LEAVEDATE, ORDERID, PLACENO'
  else if ColName = 'PLACENO' then
    Result := ', LEAVEDATE, ORDERID, TOURISTNAME'
  else if ColName = 'RETLEAVEDATE' then
    Result := ', CLIENTNAME, ORDERID, TOURISTNAME, RETPLACENO'
  else if ColName = 'RETPLACENO' then
    Result := ', RETLEAVEDATE, ORDERID, TOURISTNAME'
  else if ColName = 'MANAGER' then
    Result := ', LEAVEDATE, CLIENTNAME, ORDERID, TOURISTNAME, PLACENO'
  else Result := '';
  Result := inherited GetOrderColumns(Column) + Result;
end;

procedure TPlaceByStateListForm.SetDetailListQueryParams;
begin
  with DetailListQuery do
  begin
    ParamByName('FromDate').AsString := DateToStr(Int(FromDatePicker.DateTime));
    ParamByName('TillDate').AsString := DateToStr(Int(TillDatePicker.DateTime) + 1);
    ParamByName('Direction').Value := DirectionRadioGroup.ItemIndex;
  end;
end;

procedure TPlaceByStateListForm.FormCreate(Sender: TObject);
begin
  inherited;
  GridUniqueColumn := DetailListQueryPLACEID;
  MemoFieldName := 'ORDERMEMO';
  UpdateQueryOnActivation := False;
  PrintOptionOrientation := DMORIENT_LANDSCAPE;
  PrepareDatePickers;
  PrepareStateFilter;
end;

procedure TPlaceByStateListForm.FromDatePickerChange(Sender: TObject);
begin
  with TillDatePicker do
  begin
    MinDate := FromDatePicker.DateTime;
    if DateTime < MinDate then DateTime := MinDate;
  end;
end;

procedure TPlaceByStateListForm.ExecuteBtnClick(Sender: TObject);
begin
  UpdateDetailListQuery;
  ToggleControlEnabled(PersonListDBGrid, True);
  if DirectionRadioGroup.ItemIndex = 0 then
  begin
    DetailListQueryLEAVEDATE.DisplayLabel := STripAnlzFrmTitle0;
    DetailListQueryRETLEAVEDATE.DisplayLabel := STripAnlzFrmTitle1;
  end
  else begin
    DetailListQueryLEAVEDATE.DisplayLabel := STripAnlzFrmTitle1;
    DetailListQueryRETLEAVEDATE.DisplayLabel := STripAnlzFrmTitle0;
  end;
end;

procedure TPlaceByStateListForm.PersonListDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TSvtColumn; State: TGridDrawState);
var Stt: Integer;
begin
  if not (gdFixed in State) then
    with (Sender as TSvtDBGrid).Canvas do
    begin
      Stt := DetailListQuerySTATE.Value;
      Brush.Style := bsSolid;
      if (Column.FieldName = 'ORDERID') and Column.Visible then
        Brush.Color := OptionSet.Colors[Stt]
      else if (Column.FieldName = 'PLACENO')
        and ((Stt = plcQueue) or (DetailListQueryPLACENO.Value = SPlaceFrmPlaceInQueue))
      then
        Brush.Color := OptionSet.Colors[plcQueue + plcInaccessible]
      else if (ActiveControl = Sender) and (gdSelected in State) then
        Brush.Color := clHighlight
      else if gdSelected in State then Brush.Color := clBtnShadow
      else Brush.Color := (Sender as TSvtDBGrid).Color;
      if (Column.FieldName <> 'ORDERID')
        and DetailListQueryCLIENTISENTERPR.AsBoolean
      then Font.Color := clFuchsia
      else
        case Brush.Color of
          clHighlight: Font.Color := clHighlightText;
          clBtnShadow: Font.Color := clHighlightText;
        else Font.Color := (Sender as TSvtDBGrid).Font.Color;
        end;
      if (Column.FieldName = 'ORDERID') and (gdSelected in State) then
        Font.Style := Font.Style + [fsBold]
      else Font.Style := Font.Style - [fsBold];
      FrameRect(Rect);
    end;
  inherited;
end;

procedure TPlaceByStateListForm.StateFilterCheckBoxClick(Sender: TObject);
begin
  ToggleControlEnabled(StateFilterComboBox, StateFilterCheckBox.Checked);
  with StateFilterComboBox do if Enabled and (ItemIndex < 0) then ItemIndex := 0;
  StateFilterComboBoxClick(Self);
end;

procedure TPlaceByStateListForm.StateFilterComboBoxClick(Sender: TObject);
begin
  with StateFilterComboBox do
    if Enabled and (ItemIndex >= 0) then
      DetailListQuery.Filter :=
        'STATE = ' + IntToStr(ItemId) //IntToStr(Integer(Items.Objects[ItemIndex]))
    else DetailListQuery.Filter := '';
end;

end.
