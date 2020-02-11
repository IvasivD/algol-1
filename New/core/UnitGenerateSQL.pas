unit UnitGenerateSQL;

interface
uses Classes,Variants;

type
TSqlGenerate = class
   private
     FTableName:WideString;
     FFieldNameList:TstringList;
     FFieldValueList:TstringList;
     function FGetListFieldInsertSql:string;
     function FGetListValueInsertSql:string;
     function FGetListFieldValueUpdateSql:string;
   public
     constructor create(TableName:Widestring);
     destructor close;
     procedure AddFieldValue(FieldName,Value:Widestring);
     function GetInsertSql:WideString;
     function GetUpdateSql:WideString;
   end;

implementation

{ TSqlGenerate }
//******************************************************************************
procedure TSqlGenerate.AddFieldValue(FieldName, Value: Widestring);
begin
  self.FFieldNameList.Add( FieldName );
  self.FFieldValueList.Add( Value );
end;
//******************************************************************************
constructor TSqlGenerate.create(TableName:Widestring);
begin
  Self.FTableName := TableName;
  self.FFieldNameList := TStringList.Create;
  self.FFieldValueList := TStringList.Create;
end;
//******************************************************************************
destructor TSqlGenerate.close;
begin
  self.FFieldNameList.Free;
  self.FFieldValueList.Free;
end;
//******************************************************************************
function TSqlGenerate.FGetListFieldInsertSql:string;
var i:Integer;
    Sep:string[1];
begin
  result := '';
  Sep := ',';
  
  for i:=0 to self.FFieldNameList.Count-1 do
  begin
    if i = self.FFieldNameList.Count-1 then Sep :='';
    result := self.FFieldNameList.Strings[i] + Sep;
  end;
end;
//******************************************************************************
function TSqlGenerate.FGetListValueInsertSql:string;
var i:Integer;
    Sep:string[1];
begin
  result := '';
  Sep := ',';
  
  for i:=0 to self.FFieldValueList.Count-1 do
  begin
    if i = self.FFieldValueList.Count-1 then Sep :='';
    result := self.FFieldValueList.Strings[i] + Sep;
  end;
end;
//******************************************************************************
function TSqlGenerate.FGetListFieldValueUpdateSql:string;
var i:Integer;
    Sep:string[1];
begin
  result := '';
  Sep := ',';

  for i:=0 to self.FFieldNameList.Count-1 do
  begin
    if i = self.FFieldValueList.Count-1 then Sep :='';
    result := self.FFieldNameList.Strings[i] + '=' + self.FFieldValueList.Strings[i] + Sep;
  end;
end;
//******************************************************************************
function TSqlGenerate.GetInsertSql: WideString;
begin
  result := 'INSERT INTO '+self.FTableName+ '(' +FGetListFieldInsertSql+') VALUES ('+ FGetListValueInsertSql + ')';
end;
//******************************************************************************
function TSqlGenerate.GetUpdateSql: WideString;
begin
  result := 'UPDATE '+self.FTableName+' SET '+FGetListFieldValueUpdateSql;
end;
//******************************************************************************
end.
 