unit Finder;

interface

uses DB, DBTables, SvtDBGrids, SysUtils;

const
  nFindOptionEqual = 0;
  nFindOptionStart = 1;
  nFindOptionExist = 2;
  nFindOptionAtEnd = 3;

{$WARN UNSAFE_TYPE OFF}
function GrabMemoFieldAsPChar(TheField: TMemoField): PChar;
{$WARN UNSAFE_TYPE ON}
function DoFindIn(TheField: TField; const SFor: string): Boolean;
function DoFindInEx(Fld: TField;
  const SFor: string; FOpt: Integer; CIns: Boolean): Boolean;
function FindIt(TheTable: TDataSet; TheFields: array of Integer;
  const SFor: string; SearchBackward, FromBeginning: Boolean): Boolean;
function FindItEx(Tbl: TDataSet; Flds: array of Integer; const SFor: string;
  SrchBckwrd, FromBegin, CIns: Boolean; FndOpt: Integer): Boolean;
function FindInSet(TheSet: TDataSet; const SFor, SErr: string;
  SearchBackward, FromBeginning: Boolean; ErrCtx: Integer): Boolean;
function FindInSetEx(DSet: TDataSet; const SFor, SErr: string;
  SrchBckwrd, FromBegin, CaseIns: Boolean; FndOpt, ErrCtx: Integer): Boolean;
function FindInGrid(Grid: TSvtDBGrid; const SFor, SErr: string;
  SearchBackward, FromBeginning: Boolean; ErrCtx: Integer): Boolean;
function FindInGridEx(Grid: TSvtDBGrid; const SFor, SErr: string;
  SrchBckwrd, FromBegin, CaseIns: Boolean; FndOpt, ErrCtx: Integer): Boolean;
function FindInFieldEx(DSet: TDataSet; const SFld, SFor, SErr: string;
  SrchBckwrd, FromBegin, CaseIns: Boolean; FndOpt, ErrCtx: Integer): Boolean;

{ применение функции FindIt -
  if FindIt(NotesSearchT,
    [NotesSearchT.FieldByName('Leadman').Index],
    False, True, SearchText.Text) then DoSomething;
}

implementation

uses TourCmnlIf;

{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
function GrabMemoFieldAsPChar(TheField: TMemoField): PChar;
begin
  with TBlobStream.Create(TheField, bmRead) do
  begin
    GetMem(Result, Size + 1);
    FillChar(Result^, Size + 1, #0);
    Read(Result^, Size);
    Free;
  end;
end;
{$WARN UNSAFE_CODE ON}
{$WARN UNSAFE_TYPE ON}

function DoFindIn(TheField: TField; const SFor: string): Boolean;
var SMemo: string;
begin
  case TheField.DataType of
    ftString: Result := Pos(SFor, AnsiUpperCase(TheField.AsString)) > 0;
    ftInteger: Result := Pos(SFor, TheField.AsString) > 0;
    ftBoolean: Result := SFor = AnsiUpperCase(TheField.AsString);
    ftFloat: Result := Pos(SFor, TheField.AsString) > 0;
    ftCurrency: Result := Pos(SFor, TheField.AsString) > 0;
    ftDate..ftDateTime: Result := Pos(SFor, TheField.AsString) > 0;
    ftMemo:
      begin
        SMemo := AnsiUpperCase(GrabMemoFieldAsPChar(TMemoField(TheField)));
        Result := Pos(SMemo, SFor) > 0;
      end;
    else Result := False;
  end;
end;

function DoFindInEx(Fld: TField; const SFor: string; FOpt: Integer; CIns: Boolean): Boolean;
var
  SFld: string;
  P: Integer;
begin
  case Fld.DataType of
    ftString: SFld := Fld.AsString;
    ftInteger: SFld := Fld.AsString;
    ftBoolean:
      begin
        Result := SFor = AnsiUpperCase(Fld.AsString);
        Exit;
      end;
    ftFloat: SFld := Fld.DisplayText;
    ftCurrency: SFld := Fld.DisplayText;
    ftDate..ftDateTime: SFld := Fld.AsString;
    ftMemo: SFld := GrabMemoFieldAsPChar(Fld as TMemoField);
    else
      begin
        Result := False;
        Exit;
      end;
  end;
  if CIns then
    P := Pos(AnsiUpperCase(SFor), AnsiUpperCase(SFld)) else P := Pos(SFor, SFld);
  case FOpt of
    nFindOptionEqual: Result := (P = 1) and (Length(SFor) = Length(SFld));
    nFindOptionStart: Result := P = 1;
    nFindOptionExist: Result := P > 0;
    nFindOptionAtEnd: Result := P = Length(SFld) - Length(SFor) + 1;
    else Result := False;
  end;
end;

function FindIt(TheTable: TDataSet; TheFields: array of Integer;
  const SFor: string; SearchBackward, FromBeginning: Boolean): Boolean;
var
  I, HighTheFields, LowTheFields: Integer;
  {$WARN UNSAFE_TYPE OFF}
  Mrk: TBookmark;
  {$WARN UNSAFE_TYPE ON}
  S: string;
begin
  Result := False;
  TheTable.DisableControls;
  {$WARN UNSAFE_TYPE OFF}
  Mrk := TheTable.GetBookmark;
  {$WARN UNSAFE_TYPE ON}
  try
    LowTheFields := Low(TheFields);
    HighTheFields := High(TheFields);
    S := AnsiUpperCase(SFor);
    //for I := 1 to Length(S) do if S[I] = 'І' then S[I] := 'I'; //cyr -> lat
    if FromBeginning then TheTable.First;
    if SearchBackward then
    begin
      TheTable.Prior;
      while not TheTable.BOF do
      begin
        for I := LowTheFields to HighTheFields do
          if DoFindIn(TheTable.Fields[TheFields[I]], S) then
          begin
            Result := True;
            Break;
          end;
        if Result then Break else TheTable.Prior;
      end;
    end else
    begin
      if not FromBeginning then TheTable.Next;
      while not TheTable.EOF do
      begin
        for I := LowTheFields to HighTheFields do
          if DoFindIn(TheTable.Fields[TheFields[I]], S) then
          begin
            Result := True;
            Break;
          end;
        if Result then Break else TheTable.Next;
      end;
    end;
  finally
    TheTable.EnableControls;
    {$WARN UNSAFE_TYPE OFF}
    if not Result then TheTable.GotoBookmark(Mrk);
    TheTable.FreeBookmark(Mrk);
    {$WARN UNSAFE_TYPE ON}
  end;
end;

function FindItEx(Tbl: TDataSet; Flds: array of Integer; const SFor: string;
  SrchBckwrd, FromBegin, CIns: Boolean; FndOpt: Integer): Boolean;
var
  I, HighFlds, LowFlds: Integer;
  {$WARN UNSAFE_TYPE OFF}
  Mrk: TBookmark;
  {$WARN UNSAFE_TYPE ON}
  S: string;
begin
  Result := False;
  Tbl.DisableControls;
  {$WARN UNSAFE_TYPE OFF}
  Mrk := Tbl.GetBookmark;
  {$WARN UNSAFE_TYPE ON}
  try
    LowFlds := Low(Flds);
    HighFlds := High(Flds);
    S := AnsiUpperCase(SFor);
    //for I := 1 to Length(S) do if S[I] = 'І' then S[I] := 'I'; //cyr -> lat
    if FromBegin then Tbl.First;
    if SrchBckwrd then
    begin
      Tbl.Prior;
      while not Tbl.BOF do
      begin
        for I := LowFlds to HighFlds do
          if DoFindInEx(Tbl.Fields[Flds[I]], S, FndOpt, CIns) then
          begin
            Result := True;
            Break;
          end;
        if Result then Break else Tbl.Prior;
      end;
    end else
    begin
      if not FromBegin then Tbl.Next;
      while not Tbl.EOF do
      begin
        for I := LowFlds to HighFlds do
          if DoFindInEx(Tbl.Fields[Flds[I]], S, FndOpt, CIns) then
          begin
            Result := True;
            Break;
          end;
        if Result then Break else Tbl.Next;
      end;
    end;
  finally
    Tbl.EnableControls;
    {$WARN UNSAFE_TYPE OFF}
    if not Result then Tbl.GotoBookmark(Mrk);
    Tbl.FreeBookmark(Mrk);
    {$WARN UNSAFE_TYPE ON}
  end;
end;

function FindInSet(TheSet: TDataSet; const SFor, SErr: string;
  SearchBackward, FromBeginning: Boolean; ErrCtx: Integer): Boolean;
var
  N: string;
  A: array of Integer;
  I: Integer;
begin
  N := EmptyStr;
  Result := False;
  with TheSet do
  begin
    if TheSet is TTable and ((TheSet as TTable).IndexFieldCount > 0) then
      with TheSet as TTable do
      begin
        SetLength(A, IndexFieldCount);
        for I := 0 to IndexFieldCount - 1 do
          with IndexFields[I] do
          begin
            A[I] := Index;
            N := N + DisplayName + ';';
          end;
      end
    else if TheSet is TTable then
      with TheSet as TTable do
      begin
        SetLength(A, FieldCount);
        for I := 0 to FieldCount - 1 do
          with Fields[I] do
          begin
            A[I] := Index;
            N := N + DisplayName + ';';
          end;
      end
    else if TheSet is TQuery then
      with TheSet as TQuery do
      begin
        SetLength(A, FieldCount);
        for I := 0 to FieldCount - 1 do
          with Fields[I] do
          begin
            A[I] := Index;
            N := N + DisplayName + ';';
          end;
      end
    else Exit;
    if N <> EmptyStr then System.Delete(N, Length(N), 1);
    Result := FindIt(TheSet, A, SFor, SearchBackward, FromBeginning);
  end;
  if not Result and (SErr <> EmptyStr) then
    ErrorFmtHlpDlg(SErr, [SFor, N], ErrCtx);
end;

function FindInSetEx(DSet: TDataSet; const SFor, SErr: string;
  SrchBckwrd, FromBegin, CaseIns: Boolean; FndOpt, ErrCtx: Integer): Boolean;
var
  N: string;
  A: array of Integer;
  I: Integer;
begin
  N := EmptyStr;
  Result := False;
  with DSet do
  begin
    if DSet is TTable and ((DSet as TTable).IndexFieldCount > 0) then
      with DSet as TTable do
      begin
        SetLength(A, IndexFieldCount);
        for I := 0 to IndexFieldCount - 1 do
          with IndexFields[I] do
          begin
            A[I] := Index;
            N := N + DisplayName + ';';
          end;
      end
    else if DSet is TTable then
      with DSet as TTable do
      begin
        SetLength(A, FieldCount);
        for I := 0 to FieldCount - 1 do
          with Fields[I] do
          begin
            A[I] := Index;
            N := N + DisplayName + ';';
          end;
      end
    else if DSet is TQuery then
      with DSet as TQuery do
      begin
        SetLength(A, FieldCount);
        for I := 0 to FieldCount - 1 do
          with Fields[I] do
          begin
            A[I] := Index;
            N := N + DisplayName + ';';
          end;
      end
    else Exit;
    if N <> EmptyStr then System.Delete(N, Length(N), 1);
    Result := FindItEx(DSet, A, SFor, SrchBckwrd, FromBegin, CaseIns, FndOpt);
  end;
  if not Result and (SErr <> EmptyStr) then
    ErrorFmtHlpDlg(SErr, [SFor, N], ErrCtx);
end;

function FindInGrid(Grid: TSvtDBGrid; const SFor, SErr: string;
  SearchBackward, FromBeginning: Boolean; ErrCtx: Integer): Boolean;
var
  N: string;
  A: array of Integer;
  I: Integer;
begin
  N := '';
  with Grid.Columns do
  begin
    SetLength(A, Count);
    for I := 0 to Count - 1 do
      with Items[I] do
      begin
        A[I] := Field.Index;
        N := N + Title.Caption + ';';
      end;
  end;
  if N <> '' then System.Delete(N, Length(N), 1);
  Result := FindIt(Grid.DataSource.DataSet, A, SFor, SearchBackward, FromBeginning);
  if not Result and (SErr <> '') then ErrorFmtHlpDlg(SErr, [SFor, N], ErrCtx);
end;

function FindInGridEx(Grid: TSvtDBGrid; const SFor, SErr: string;
  SrchBckwrd, FromBegin, CaseIns: Boolean; FndOpt, ErrCtx: Integer): Boolean;
var
  N: string;
  A: array of Integer;
  I: Integer;
begin
  N := '';
  with Grid.Columns do
  begin
    SetLength(A, Count);
    for I := 0 to Count - 1 do
      with Items[I] do
      begin
        A[I] := Field.Index;
        N := N + Title.Caption + ';';
      end;
  end;
  if N <> '' then System.Delete(N, Length(N), 1);
  Result := FindItEx(Grid.DataSource.DataSet, A, SFor, SrchBckwrd, FromBegin, CaseIns, FndOpt);
  if not Result and (SErr <> '') then ErrorFmtHlpDlg(SErr, [SFor, N], ErrCtx);
end;

function FindInFieldEx(DSet: TDataSet; const SFld, SFor, SErr: string;
  SrchBckwrd, FromBegin, CaseIns: Boolean; FndOpt, ErrCtx: Integer): Boolean;
var
  N: string;
  A: array of Integer;
begin
  Result := False;
  with DSet do
  begin
    SetLength(A, 1);
    if DSet is TTable then
      with DSet as TTable do
      begin
        A[0] := FieldByName(SFld).Index;
        N := FieldByName(SFld).DisplayName;
      end
    else if DSet is TQuery then
      with DSet as TQuery do
      begin
        A[0] := FieldByName(SFld).Index;
        N := FieldByName(SFld).DisplayName;
      end
    else Exit;
    Result := FindItEx(DSet, A, SFor, SrchBckwrd, FromBegin, CaseIns, FndOpt);
  end;
  if not Result and (SErr <> '') then ErrorFmtHlpDlg(SErr, [SFor, N], ErrCtx);
end;

end.
