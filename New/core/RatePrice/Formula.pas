unit Formula;

interface

uses Classes;

type
  TFromTillDate = record
    From : TDateTime;
    Till : TDateTime;
    Id : integer;
    ArrPosition : integer; // позиція в вихідному масиві (в Dll не використовується)
  end;

  TFromTillAges = record
    From : integer;
    Till : integer;
    Name : string;
    Id : integer;
    ArrPosition : integer; // позиція в вихідному масиві (в Dll не використовується)
  end;

  TFeedsTypes = record
    Name : string;
    Id : integer;
    ArrPosition : integer; // позиція в вихідному масиві (в Dll не використовується)
  end;

  TResultElement = record
    FromStrPos : integer;
    TillStrPos : integer;
    Kind : char;
             // R - кімната в цілому
             // P - оплата за персону (дор на осн ліж)
             // S - оплата за одномісне розміщення
             // F - доплата за харчування
    DoplA : integer; // зменшуване доплати харчування
    DoplA_Name : string;
    DoplB : integer; // відємник доплати харчування
    DoplB_Name : string; // відємник доплати харчування
    Percentage : integer; // процент даного елемента
  end;

  TFromTillAgesArray = array of TFromTillAges;

  TFormulaElements = record
    Count : integer;  // кількість таких елементів
    Ages : TFromTillAgesArray;
    FromStrPos : integer;
    TillStrPos : integer;
    Matched : integer;  // використовується лише в DLL для пошуку відповідної формули
  end;

  TSeasonsArray = array of TFromTillDate;
  TFeedsArray = array of TFeedsTypes;
  TFormulaElementsArray = array of TFormulaElements;
  TResultElementArray = array of TResultElement;

  TFormulaString = class
    Data : string;
    constructor Create(AData : string);
  end;

  TFormula = class
   private
    FSeasons: TSeasonsArray;
    FFeeds : TFeedsArray;
    FElements : TFormulaElementsArray;
    FResults : TResultElementArray;
    FRoomName : string;
    FRoomCapacity : integer;
    FDisplayData : string;
    function GetStoredData : string;   // представляємо дані в такому вигляді як вони зберігаються в базі
    function GetSeasonsPresent : boolean; // визначення наявності сезонів в формулі
    function GetFormulaCompleted : boolean; // визначення чи дана формула є завершеною
    function GetDisplayData : string;
    procedure SetRoomName(ARoomName : string);
    procedure SetSeasons(ASeasons : TSeasonsArray);
    procedure SetElements(AElements : TFormulaElementsArray);
    procedure SetResults(AResults : TResultElementArray);
    procedure SetFeeds(AFeeds : TFeedsArray);
   public
    constructor Create; overload;
    constructor Create(IntRepresent : string); overload;
    constructor Create(ASeasons: TSeasonsArray; AFeeds : TFeedsArray; AElements : TFormulaElementsArray; AResults : TResultElementArray; ARoomName : string); overload;
    constructor CreateCopy(ASource : TFormula);
    destructor done;
    function CompareWith(ADate : TDateTime; AAge : array of integer; AFeedType : integer) : boolean;
    procedure AddElement(AElement : TFromTillAgesArray);
    procedure AddResult(AResult : TResultElement);
    procedure RemoveElement(APosition : integer); // вилучає елемент з вказаною позицією у стрічці відображення
    procedure RemoveResult(APosition : integer);
    function GetSelectRange(APosition : integer; var StartPos, Length : integer) : boolean;
    function CanRemoveElement(APosition : integer) : boolean;
    function CanRemoveResult(APosition : integer) : boolean;
    procedure UpdateDisplayStrAndPositions;
    property StoredData : string read GetStoredData;
    property DisplayData : string read GetDisplayData;
    property SeasonsPresent : boolean read GetSeasonsPresent;
    property FormulaCompleted : boolean read GetFormulaCompleted;
    property Seasons : TSeasonsArray read FSeasons write SetSeasons;
    property Feeds : TFeedsArray read FFeeds write SetFeeds;
    property Elements : TFormulaElementsArray read FElements write SetElements;
    property Results : TResultElementArray read FResults write SetResults;
    property RoomName : string read FRoomName write SetRoomName;
    property RoomCapacity : integer read FRoomCapacity write FRoomCapacity;
  end;

  TFirstFormulasList = class(TList)
  private
    function GetItems(Index: Integer): TFormulaString;
    procedure SetItems(Index: Integer; const Value: TFormulaString);
  public
    property Items[Index: Integer]: TFormulaString read GetItems write SetItems;  default;
  end;

  TFormulasList = class(TList)
  private
    function GetItems(Index: Integer): TFormula;
    procedure SetItems(Index: Integer; const Value: TFormula);
  public
    property Items[Index: Integer]: TFormula read GetItems write SetItems;  default;
  end;


implementation

uses SysUtils, DateUtils, StrUtils;

constructor TFormulaString.Create(AData : string);
begin
  inherited Create;
  Data := AData;
end;

constructor TFormula.Create;
begin
  inherited Create;
end;

constructor TFormula.Create(IntRepresent : string);
var StrPos : integer;

  function ReadParamId : integer;
  var TempStr : string;
  begin
    inc(StrPos);
    TempStr:='';
    while not (intRepresent[StrPos] in [';',',',':','=','?']) do
    begin
      TempStr:=TempStr+intRepresent[StrPos];
      inc(StrPos);
    end;
    Result:=StrToInt(TempStr);
  end;

  procedure ReadParam;
  begin
    inc(StrPos); // проскакуємо знак питання
    case intRepresent[StrPos] of
      'S' :  // сезон
        begin
          SetLength(FSeasons,Length(FSeasons)+1);
          FSeasons[High(FSeasons)].Id:=readParamId;
        end;
      'F' : // тип харчування
        begin
          SetLength(FFeeds,Length(FFeeds)+1);
          FFeeds[High(FFeeds)].Id:=readParamId;
        end;
      'A' :
        begin
          SetLength(FElements,Length(FElements)+1);
          repeat
            SetLength(FElements[High(FElements)].Ages,Length(FElements[High(FElements)].Ages)+1);
            FElements[High(FElements)].Ages[High(FElements[High(FElements)].Ages)].Id:=readParamId;
          until intRepresent[StrPos]<>',';
          FElements[High(FElements)].Count:=readParamId;
        end;
      'r' :
        begin
          SetLength(FResults,Length(FResults)+1);
          FResults[High(FResults)].Kind:='r';
          FResults[High(FResults)].Percentage:=readParamId;
        end;
      'p' :
        begin
          SetLength(FResults,Length(FResults)+1);
          FResults[High(FResults)].Kind:='p';
          FResults[High(FResults)].Percentage:=readParamId;
        end;
      's' :
        begin
          SetLength(FResults,Length(FResults)+1);
          FResults[High(FResults)].Kind:='s';
          FResults[High(FResults)].Percentage:=readParamId;
        end;
      'f' :
        begin
          SetLength(FResults,Length(FResults)+1);
          FResults[High(FResults)].Kind:='f';
          FResults[High(FResults)].Percentage:=readParamId;
          FResults[High(FResults)].DoplA:=readParamId;
          FResults[High(FResults)].DoplB:=readParamId;
        end;
    end;
  end;

begin
  inherited Create;
  StrPos:=1;
  while StrPos<Length(intRepresent) do
    case intRepresent[StrPos] of
      ';','=' : inc(StrPos);
      '?' : readParam;
    end;
end;

constructor TFormula.Create(ASeasons: TSeasonsArray; AFeeds : TFeedsArray; AElements : TFormulaElementsArray; AResults : TResultElementArray; ARoomName : string);
begin
  inherited create;
  FSeasons := ASeasons;
  FFeeds := AFeeds;
  FElements := AElements;
  FResults := AResults;
  FRoomName := ARoomName;
  UpdateDisplayStrAndPositions;
end;

destructor TFormula.Done;
var i : integer;
begin
  for i := 0 to High(Felements) do
  begin
     SetLength(Felements[i].Ages,0);
  end;
  SetLength(Felements,0);
  SetLength(Ffeeds,0);
  SetLength(Fseasons,0);
  inherited;
end;

procedure TFormula.SetSeasons(ASeasons : TSeasonsArray);
begin
  FSeasons:=ASeasons;
  UpdateDisplayStrAndPositions;
end;

procedure TFormula.SetResults(AResults : TResultElementArray);
begin
  FResults:=AResults;
  UpdateDisplayStrAndPositions;
end;

procedure TFormula.SetElements(AElements : TFormulaElementsArray);
begin
  FElements:=AElements;
  UpdateDisplayStrAndPositions;
end;

procedure TFormula.SetFeeds(AFeeds : TFeedsArray);
begin
  FFeeds:=AFeeds;
  UpdateDisplayStrAndPositions;
end;

function TFormula.GetSelectRange(APosition : integer; var StartPos, Length : integer) : boolean;
var i : integer;
begin
  StartPos:=0;
  Length:=0;
  Result := false;
  for i:=0 to High(FElements) do
    if (APosition>=FElements[i].FromStrPos) and (APosition<=FElements[i].TillStrPos) then
    begin
      StartPos:=FElements[i].FromStrPos;
      Length:=FElements[i].TillStrPos-FElements[i].FromStrPos;
      Result:=True;
      Exit;
    end;
  for i:=0 to High(FResults) do
    if (APosition>=FResults[i].FromStrPos) and (APosition<=FResults[i].TillStrPos) then
    begin
      StartPos:=FResults[i].FromStrPos;
      Length:=FResults[i].TillStrPos-FResults[i].FromStrPos;
      Result:=True;
      Exit;
    end;
end;

procedure TFormula.AddResult(AResult : TResultElement);
var i : integer;
begin
  // пошук чи немає такого елемента
  for i:= 0 to High(FResults) do
    if (AResult.Kind = FResults[i].Kind)
      and (AResult.DoplA = FResults[i].DoplA)
      and (AResult.DoplB = FResults[i].DoplB) then
      begin
        FResults[i].Percentage:=FResults[i].Percentage + AResult.Percentage;
        UpdateDisplayStrAndPositions;
        exit;
      end;
    SetLength(FResults,Length(FResults)+1);
    FResults[High(FResults)]:=AResult;
    UpdateDisplayStrAndPositions;
    exit;
end;

procedure TFormula.AddElement(AElement : TFromTillAgesArray);

  function ArrayEquals(First,Second : TFromTillAgesArray) : boolean;
  var ii : integer;
  begin
    if Length(First) <> Length(Second) then
    begin
      Result:=false;
      Exit;
    end;
    for ii:=0 to High(First) do
      if (First[ii].From <> Second[ii].From)
        or (First[ii].Till <> Second[ii].Till)
        or (First[ii].Name <> Second[ii].Name)
        or (First[ii].Id <> Second[ii].Id)
        or (First[ii].ArrPosition <> Second[ii].ArrPosition) then
      begin
        Result:=false;
        Exit;
      end;
    Result := true;
  end;

var i : integer;
begin
  // пошук у формулі такого елемента
  for i:=0 to high(FElements) do
   if ArrayEquals(FElements[i].Ages,AElement) then
    begin
      inc(FElements[i].Count);
      UpdateDisplayStrAndPositions;
      exit;
    end;
  setLength(FElements,Length(FElements)+1);
  FElements[High(FElements)].Ages:=AElement;
  FElements[High(FElements)].Count:=1;
  UpdateDisplayStrAndPositions;
end;

procedure TFormula.RemoveElement(APosition : integer);
var i, j : integer;
begin
  for i:=0 to High(FElements) do
    if (APosition>=FElements[i].FromStrPos) and (APosition<=FElements[i].TillStrPos) then
    begin
      if FElements[i].Count>1 then dec(FElements[i].Count)
      else
      begin
        for j:=i+1 to High(FElements) do FElements[i]:=FElements[i+1];
        SetLength(FElements,Length(FElements)-1);
      end;
     UpdateDisplayStrAndPositions;
     Exit;
    end;
end;

procedure TFormula.RemoveResult(APosition : integer);
var i, j : integer;
begin
  for i:=0 to High(FResults) do
    if (APosition>=FResults[i].FromStrPos) and (APosition<=FResults[i].TillStrPos) then
    begin
      for j:=i+1 to High(FResults) do FResults[i]:=FResults[i+1];
      SetLength(FResults,Length(FResults)-1);
      UpdateDisplayStrAndPositions;
      Exit;
    end;
end;

function TFormula.CanRemoveElement(APosition : integer) : boolean;
var i : integer;
begin
  Result := false;
  for i:=0 to High(FElements) do
    if (APosition>=FElements[i].FromStrPos) and (APosition<=FElements[i].TillStrPos) then
    begin
      Result:=True;
      Exit;
    end;
end;

function TFormula.CanRemoveResult(APosition : integer) : boolean;
var i : integer;
begin
  Result := false;
  for i:=0 to High(FResults) do
    if (APosition>=FResults[i].FromStrPos) and (APosition<=FResults[i].TillStrPos) then
    begin
      Result:=True;
      Exit;
    end;
end;

procedure TFormula.SetRoomName(ARoomName : string);
begin
  FRoomName := ARoomName;
  UpdateDisplayStrAndPositions;
end;

function TFormula.GetFormulaCompleted : boolean;
begin
  Result := (Length(FElements) >0) and (Length(FResults) >0);
end;

function TFormula.GetSeasonsPresent : boolean;
begin
  Result := Length(Seasons)>0;
end;

function TFormula.GetStoredData : string;
var i,j : integer;
begin
  Result:='';
  // частина умов
  for i:=0 to high(FSeasons) do
    Result:=Result + format('?S%d',[Seasons[i].Id]);
  Result:=Result+';';
  for i:=0 to high(FFeeds) do
    Result:=Result + format('?F%d',[Feeds[i].Id]);
  Result:=Result+';';
  for i:=0 to high(FElements) do
  begin
    Result:=Result+'?A';
    for j:=0 to High(FElements[i].Ages) do
      Result:=Result + format('%d,',[FElements[i].Ages[j].Id]);
    Result[Length(Result)]:=':';
    Result:=Result+IntToStr(FElements[i].Count);
  end;
  Result:=Result+'=';
  // частина результатів
  for i:=0 to High(FResults) do
  begin
    if FResults[i].Kind<>'f' then Result:=Result+format('?%s%d',[FResults[i].Kind, FResults[i].Percentage])
      else Result:=Result+ format('?f%d:%d:%d',[FResults[i].Percentage,FResults[i].DoplA,FResults[i].DoplB]);
  end;
  Result:=Result+';';
end;

procedure TFormula.UpdateDisplayStrAndPositions;

  function AgeName(AFrom, ATill : integer; AName : string) : string;
  begin
    if ATill<>-1 then Result:=AName + '(' + (IntToStr(AFrom)+' - '+IntToStr(ATill)) + ')'
    else Result:=AName + ('(>'+IntToStr(AFrom)+')');
  end;

var
  i, j, FBegin, FEnd : integer;
  FeedStr, FName, TempStr : string;
begin
  FDisplayData:='';
  FBegin:=0;
  // опрацювання сезонів
  if Length(Seasons) > 0 then
  begin
    for i:=0 to High(Seasons) do
    begin
      if not ((i>0) and (DateOf(Seasons[i].From)-DateOf(Seasons[i-1].Till)=1)) then
         FDisplayData:=FDisplayData+ FormatDateTime('dd.mm.yy - ',Seasons[i].From);
      if not((i<High(Seasons)) and (DateOf(Seasons[i].Till)-DateOf(Seasons[i+1].From)=-1)) then
         FDisplayData:=FDisplayData+ ifthen(Seasons[i].Till<>-1,FormatDateTime('dd.mm.yy, ',Seasons[i].Till),'..., ');
    end;
    FDisplayData[Length(FDisplayData)-1]:=':';
    FDisplayData[Length(FDisplayData)]:=' ';
  end;
  // формування стрічки, що визначає типи харчування
  FeedStr:='';
  if Length(Feeds) > 0 then
  begin
    FeedStr:='[';
    for i:=0 to High(Feeds) do
      FeedStr:=FeedStr+Feeds[i].Name +',';
    SetLength(FeedStr,Length(FeedStr)-1);
    FeedStr:=FeedStr+']';
  end;
  // опрацювання елементів
  if Length(FElements) > 0 then
  begin
    for i:=0 to High(FElements) do
    begin
      if Length(FElements[i].Ages)>0 then
      begin
        if FElements[i].Count>1 then FDisplayData:=FDisplayData+IntToStr(FElements[i].Count);
        FElements[i].FromStrPos:=Length(FDisplayData);
        for j:=0 to High(FElements[i].Ages) do
        begin
          if (FName = '') or (FElements[i].Ages[j].Name = 'Adlt') then FName := FElements[i].Ages[j].Name;
          if not((j>0) and (FElements[i].Ages[j].From-FElements[i].Ages[j-1].Till=0)) then
            FBegin:=FElements[i].Ages[j].From;
          if not((j<High(FElements[i].Ages)) and (FElements[i].Ages[j].Till-FElements[i].Ages[j+1].From=0)) then
          begin
            FEnd :=FElements[i].Ages[j].Till;
            FDisplayData:=FDisplayData+AgeName(FBegin,FEnd,FName)+',';
            FName := '';
          end;
        end;
        SetLength(FDisplayData,Length(FDisplayData)-1);
        FDisplayData:=FDisplayData+FeedStr;
        FElements[i].TillStrPos:=Length(FDisplayData);
      end;
      FDisplayData:=FDisplayData + ' + ';
    end;
    FDisplayData[Length(FDisplayData)-1]:='=';
  end;
  // опрацювання результатів
  if Length(FResults) > 0 then
    for i := 0 to High(FResults) do
    begin
      FResults[i].FromStrPos:=Length(FDisplayData);
      //формуємо напис
      TempStr:='';
      //знак
      if FResults[i].Percentage < 0 then
      begin
        TempStr:=TempStr+' - ';
        FResults[i].FromStrPos:=FResults[i].FromStrPos+3;
      end
      else if i>0 then
      begin
        TempStr:=TempStr+' + ';
        FResults[i].FromStrPos:=FResults[i].FromStrPos+3;
      end;
      //процент
      if abs(FResults[i].Percentage)<>100 then TempStr:=TempStr+IntToStr(FResults[i].Percentage)+'%';
      //власне тип результату
      case FResults[i].Kind of
        'r' : TempStr:=TempStr + RoomName;
        'p' : TempStr:=TempStr + 'PP';
        's' : TempStr:=TempStr + 'SGL';
        'f' : TempStr:=TempStr + format('(Adlt(%s) - Adlt(%s))',[FResults[i].DoplA_Name, FResults[i].DoplB_Name]);
      end;
      FDisplayData := FDisplayData + TempStr;
      FResults[i].TillStrPos:=Length(FDisplayData);
    end;
    SetLength(FDisplayData,Length(FDisplayData));
end;

function TFormula.CompareWith(ADate : TDateTime; AAge : array of integer; AFeedType : integer) : boolean;
var i, j, j1 : integer;
  Matched : boolean;
begin
  // перевіряємо попадання в сезонний діапазон
  Result:= not SeasonsPresent; // визначаємо наявність сезонів
  if not Result then  // якщо сезони наявні то визначаємо попадання в них
    for i:=0 to High(FSeasons) do
      Result := Result or ((DateOf(ADate) >= Seasons[i].From) and (DateOf(ADate) <= Seasons[i].Till));
  if not Result then Exit;
  // перевіряємо попадання в тип харчування
  Result:= not (Length(Feeds)>0); // визначаємо наявність сезонів
  if not Result then  // якщо сезони наявні то визначаємо попадання в них
    for i:=0 to High(FFeeds) do
      Result := Result or (Feeds[i].Id=AFeedType);
  if not Result then Exit;
  // перевіряємо співпадіння вікових категорій
  for i:= 0 to High(FElements) do
    FElements[i].Matched := 0;
  for i:= 0 to High(AAge) do
  begin
  Matched := false;
    for j := 0 to High(FElements) do
      if FElements[j].Matched < FElements[j].Count then
      begin
        for j1 := 0 to High(FElements[j].ages) do
        begin
          if (FElements[j].ages[j1].From <= AAge[i]) // нижня межа
            and ((FElements[j].ages[j1].Till <= AAge[i]) or (FElements[j].ages[j1].Till = -1)) then // верхня межа
          begin
            Matched := true;
            Break;
          end;
        end;
        if Matched then
        begin
          inc(FElements[j].Matched);
        end;
      end;
    if not Matched then
    begin
      Result:=false;
      exit;
    end;
  end;
  // якщо в формулі залишилися вільні елементи то така формула не підходить
  for i:= 0 to High(FElements) do
    if FElements[i].Matched < FElements[i].Count then
    begin
      Result:=false;
      exit;
    end;
  Result:=true;
end;

function TFormula.GetDisplayData : string;
begin
  UpdateDisplayStrAndPositions;
  Result := FDisplayData;
end;

{ TFormulasList }

function TFormulasList.GetItems(Index: Integer): TFormula;
begin
  result:= TFormula(inherited Items[Index]);
end;

procedure TFormulasList.SetItems(Index: Integer; const Value: TFormula);
begin
  inherited Items[Index] := Value;
end;

constructor TFormula.CreateCopy(ASource: TFormula);
begin
  Create;
  FSeasons:=Copy(ASource.FSeasons);
  FFeeds:=Copy(ASource.FFeeds);
  FElements:=Copy(ASource.Elements);
  FResults:=Copy(ASource.FResults);
  FRoomName:=ASource.FRoomName;
  FRoomCapacity:=ASource.FRoomCapacity;
  FDisplayData:=ASource.FDisplayData;
end;

{ TFirstFormulasList }

{ TFirstFormulasList }

function TFirstFormulasList.GetItems(Index: Integer): TFormulaString;
begin
  result:= TFormulaString(inherited Items[Index]);
end;

procedure TFirstFormulasList.SetItems(Index: Integer;
  const Value: TFormulaString);
begin
  inherited Items[Index] := Value;
end;

end.
