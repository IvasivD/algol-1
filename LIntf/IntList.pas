unit IntList;

interface

uses Classes;

type
  TIntegerList = class(TList)
  private
    function GetValue(const Index: Integer): Integer;
    procedure SetValue(const Index, Value: Integer);
  protected
  public                  
    function AddValue(Value: Integer): Integer;
    procedure DeleteValue(Index: Integer);
    property Values[const Index: Integer]: Integer read GetValue write SetValue;
  end;

  THistoryIndexList = class(TIntegerList)
  private
  protected
  public
    procedure AddToHistory(var Index: Integer; const Value: Integer);
  end;


implementation

{ TIntegerList }

function TIntegerList.AddValue(Value: Integer): Integer;
begin                           
  {$WARN UNSAFE_TYPE OFF}
  Result := Add(Pointer(Value));
  {$WARN UNSAFE_TYPE ON}
end;

procedure TIntegerList.DeleteValue(Index: Integer);
begin
  Delete(Index);
end;

function TIntegerList.GetValue(const Index: Integer): Integer;
begin
  Result := Integer(Items[Index]);
end;

procedure TIntegerList.SetValue(const Index, Value: Integer);
begin
  {$WARN UNSAFE_TYPE OFF}
  Items[Index] := Pointer(Value);
  {$WARN UNSAFE_TYPE ON}
end;

{ THistoryIndexList }

procedure THistoryIndexList.AddToHistory(var Index: Integer; const Value: Integer);
var I: Integer;
begin
  if (Count > 0) and (Index >= 0) and (Values[Index] = Value) then Exit;
  if Index >= 0 then
    for I := Count - 1 downto Succ(Index) do Delete(I);
  Index := AddValue(Value);
end;

end.
