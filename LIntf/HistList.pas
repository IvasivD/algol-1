unit HistList;

interface

uses Classes, Menus;

type
  THistoryItem = class
  private
    FCaption: String;
    FValue: Integer;
    FTag: Integer;
  protected
  public
    constructor Create(const ACaption: String; AValue: Integer);
    property Caption: String read FCaption write FCaption;
    property Value: Integer read FValue write FValue;
    property Tag: Integer read FTag write FTag;
  end;

  THistoryList = class
  private
    FList: TList;
    FItemIndex: Integer;
    function GetItem(const Index: Integer): THistoryItem;
    function GetCount: Integer;
    function GetCurrentItem: THistoryItem;
    function GetValue(const Index: Integer): Integer;
    procedure SetValue(const Index, Value: Integer);
  protected
    procedure SetItemIndex(const Value: Integer); virtual;
  public
    constructor Create;
    destructor Destroy; override;
    function Add(Item: THistoryItem): Integer; virtual;
    procedure AddToHistory(var Index: Integer; Item: THistoryItem);
    procedure Clear; virtual;
    procedure Delete(Index: Integer); virtual;
    function IndexOf(Item: THistoryItem): Integer;
    function IndexOfText(const Text: String): Integer;
    function IndexOfValue(Value: Integer): Integer;
    procedure Insert(Index: Integer; Item: THistoryItem); virtual;
    property Count: Integer read GetCount;
    property CurrentItem: THistoryItem read GetCurrentItem;
    property Items[const Index: Integer]: THistoryItem read GetItem; default;
    property ItemIndex: Integer read FItemIndex write SetItemIndex;
    property Values[const Index: Integer]: Integer read GetValue write SetValue;
  end;

  THistoryMenuList = class(THistoryList)
  private
    FForwardMenu: TMenuItem;
    FBackwardMenu: TMenuItem;
    FMenuItemOnClick: TNotifyEvent;
    FSelectedIndex: Integer;
    procedure ClearMenus;
    function GetMenuOwner: TComponent;
    function NewMenuItem(const Index: Integer): TMenuItem;
    procedure RebuildMenus;
    procedure SetSelectedIndex(const Value: Integer);
  protected
    procedure SetItemIndex(const Value: Integer); override;
  public               
    constructor Create;
    function Add(Item: THistoryItem): Integer; override;
    procedure Clear; override;
    procedure Delete(Index: Integer); override;
    procedure Insert(Index: Integer; Item: THistoryItem); override;
    procedure ToggleSelected(Select: Boolean);
    property ForwardMenu: TMenuItem read FForwardMenu write FForwardMenu;
    property BackwardMenu: TMenuItem read FBackwardMenu write FBackwardMenu;
    property MenuOwner: TComponent read GetMenuOwner;
    property MenuItemOnClick: TNotifyEvent read FMenuItemOnClick write FMenuItemOnClick;
    property SelectedIndex: Integer read FSelectedIndex write SetSelectedIndex;
  end;

implementation

uses Math;

{ THistoryItem }

constructor THistoryItem.Create(const ACaption: String; AValue: Integer);
begin
  Caption := ACaption;
  Value := AValue;
  FTag := 0;
end;

{ THistoryList }

function THistoryList.Add(Item: THistoryItem): Integer;
begin
  Result := FList.Add(Item);
end;

procedure THistoryList.AddToHistory(var Index: Integer; Item: THistoryItem);
begin
  if IndexOfValue(Item.Value) >= 0 then Exit;
  Index := GetCount;
  Add(Item);
end;

procedure THistoryList.Clear;
var I: Integer;
begin
  for I := Count - 1 downto 0 do
  begin
    Items[I].Free;
    FList.Delete(I);
  end;
end;

constructor THistoryList.Create;
begin
  FList := TList.Create;
  FItemIndex := -1;
end;

procedure THistoryList.Delete(Index: Integer);
begin
  FList.Delete(Index);
end;

destructor THistoryList.Destroy;
begin
  Clear;
  FList.Free;
end;

function THistoryList.GetCount: Integer;
begin
  Result := FList.Count;
end;

function THistoryList.GetCurrentItem: THistoryItem;
begin
  if FItemIndex < 0 then Result := nil else Result := Items[FItemIndex];
end;

function THistoryList.GetItem(const Index: Integer): THistoryItem;
begin
  {$WARN UNSAFE_CAST OFF}
  Result := THistoryItem(FList.Items[Index]);
  {$WARN UNSAFE_CAST ON}
end;

function THistoryList.GetValue(const Index: Integer): Integer;
begin
  Result := Items[Index].Value;
end;

function THistoryList.IndexOf(Item: THistoryItem): Integer;
begin
  Result := FList.IndexOf(Item);
end;

function THistoryList.IndexOfText(const Text: String): Integer;
var I: Integer;
begin
  Result := -1;
  for I := 0 to GetCount - 1 do
    if Items[I].Caption = Text then
    begin
      Result := I;
      Break;
    end;
end;

function THistoryList.IndexOfValue(Value: Integer): Integer;
var I: Integer;
begin
  Result := -1;
  for I := 0 to GetCount - 1 do
    if Items[I].Value = Value then
    begin
      Result := I;
      Break;
    end;
end;

procedure THistoryList.Insert(Index: Integer; Item: THistoryItem);
begin
  FList.Insert(Index, Item);
end;

procedure THistoryList.SetItemIndex(const Value: Integer);
begin
  if (Value >= -1) and (Value < GetCount) then FItemIndex := Value;
end;

procedure THistoryList.SetValue(const Index, Value: Integer);
begin
  Items[Index].Value := Value;
end;

{ THistoryMenuList }

function THistoryMenuList.Add(Item: THistoryItem): Integer;
begin
  Result := inherited Add(Item);
  ItemIndex := Result;
end;

procedure THistoryMenuList.Clear;
begin
  inherited;
  ClearMenus;
end;

procedure THistoryMenuList.ClearMenus;
begin
  FBackwardMenu.Clear;
  FForwardMenu.Clear;
end;

constructor THistoryMenuList.Create;
begin
  inherited;
  FSelectedIndex := -1;
end;

procedure THistoryMenuList.Delete(Index: Integer);
begin
  inherited Delete(Index);
  ItemIndex := Max(Index, Count - 1);
end;

function THistoryMenuList.GetMenuOwner: TComponent;
begin
  Result := FForwardMenu.Owner;
end;

procedure THistoryMenuList.Insert(Index: Integer; Item: THistoryItem);
begin
  inherited Insert(Index, Item);
  ItemIndex := Index;
end;

function THistoryMenuList.NewMenuItem(const Index: Integer): TMenuItem;
begin
  Result := TMenuItem.Create(GetMenuOwner);
  with Items[Index] do
  begin
    Result.Caption := Caption;
    Result.Tag := Value;
  end;
  Result.OnClick := FMenuItemOnClick;
end;

procedure THistoryMenuList.RebuildMenus;
var I: Integer;
begin
  ClearMenus;
  if Count > 0 then
  begin
    for I := 0 to FItemIndex do
      if I <> FSelectedIndex then FBackwardMenu.Add(NewMenuItem(I));
    for I := Count - 1 downto Succ(FItemIndex) do
      FForwardMenu.Add(NewMenuItem(I));
  end;
end;

procedure THistoryMenuList.SetItemIndex(const Value: Integer);
begin
  inherited;
  RebuildMenus;
end;

procedure THistoryMenuList.SetSelectedIndex(const Value: Integer);
begin
  FSelectedIndex := Value;
  if Value > 0 then ItemIndex := Value else RebuildMenus;
end;

procedure THistoryMenuList.ToggleSelected(Select: Boolean);
begin
  case Select of
    True: if SelectedIndex <> ItemIndex then SelectedIndex := ItemIndex;
    False: if SelectedIndex >= 0 then SelectedIndex := -1;
  end;
end;

end.
