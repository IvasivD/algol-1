unit AdvUn;

interface

uses AdvEdit, DB, SysUtils, DBTables,IBQuery;

procedure UpdateSearchEdit(SearchEdit: TAdvEdit; FieldName, FieldID: TField);
procedure UpdateCityField(Value: Integer; AdvEdit: TAdvEdit; Qry: TDataset);


implementation

procedure UpdateSearchEdit(SearchEdit: TAdvEdit; FieldName, FieldID: TField);
var DataQuery: TDataSet; 
    ID: Integer;  
begin
  SearchEdit.Text := EmptyStr;
  with SearchEdit.Lookup do
  begin     
    DisplayList.Clear;
    ValueList.Clear;    
    if Assigned(FieldName) then 
    begin               
      ID := FieldID.AsInteger;
      DataQuery := FieldName.DataSet;
      DataQuery.DisableControls;
      if not DataQuery.Active then DataQuery.Open;
      DataQuery.First;
      while not DataQuery.Eof do
      begin
        DisplayList.Add(FieldName.AsString);
        ValueList.Add(FieldID.AsString);
        DataQuery.Next;
      end;
      DataQuery.Locate(FieldId.FieldName, ID, []);
      DataQuery.EnableControls;
    end;
  end;
end;

procedure UpdateCityField(Value: Integer; AdvEdit: TAdvEdit; Qry: TDataset);
begin
  with Qry do begin 
    Close;
    if Qry is TQuery then TQuery(Qry).ParamByName('CountryId').Value := Value;
    if Qry is TIBQuery then TIBQuery(Qry).ParamByName('CountryId').Value := Value;

    UpdateSearchEdit(AdvEdit, FieldByName('NAME'), FieldByName('CITYID'));    
  end;
end;

end.
