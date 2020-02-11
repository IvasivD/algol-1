unit UnitUserPermission;

interface
uses SysUtils,Classes,DB,Variants, UnitProc;

type
 TPerm = record
    TableName:Variant;
    ComentTableName:string;
    LayoutName:string;
    CanView:Boolean;
    CanUpdate:Boolean;
    CanDelete:Boolean;
    Prior:Integer;
 end;
 PPerm = ^TPerm;

 TRoleShema=class
 private
    FPermList : Tlist;
    FApplicationName: String;
    FIfNoRoleAcess:Boolean;
    FDBParam:TConnectDBParam;

    function FSql( UserId:Integer ):string;
    procedure FReplacePermission( NewPerm, OldPerm:PPerm );
    function FAddPermission( Perm:PPerm  ):Boolean;
    function  FFindPermByTableName( TableName:Variant;Var indexList:Integer ):PPerm;
    procedure FReadDBPermission( DB:TDataset );
    procedure FClearList;
 public
    constructor Create( ApplicationName:String; DBParam:TConnectDBParam; IfNoRoleAcess:Boolean = False );
    destructor Close;

    function  Permission( TableName:Variant; UserId:integer  ):TPerm;
    procedure RefreshRole( UserId:integer; DBParam:TConnectDBParam );
 end;

implementation
uses Core;
{ TRoleShema }

constructor TRoleShema.Create(ApplicationName: String; DBParam:TConnectDBParam; IfNoRoleAcess:Boolean = False );
begin
  FApplicationName:=ApplicationName;
  FPermList := Tlist.Create;
  FDBParam := DBParam;
  
  FIfNoRoleAcess := IfNoRoleAcess;
end;

destructor TRoleShema.Close;
begin
  FPermList.Free;
end;

function TRoleShema.FSql( UserId:Integer ):string;
begin
  result := 'select * from GET_USER_PERMISSIONS( '+ IntToStr(UserId) +','+''''+FApplicationName+''''+' )  order by prior';
end;
//******************************************************************************
function TRoleShema.FFindPermByTableName( TableName:Variant; var indexList:Integer ):PPerm;
var i:Integer;
begin
  result:=nil;
  indexList:=-1;
  for i := 0 to FPermList.Count - 1 do
  begin
    if ( TableName <> null ) and ( TableName <> '' ) and
       ( CompareText( VarToStr( PPerm(FPermList.Items[i])^.TableName ) , TableName ) = 0 ) then
    begin
      result := PPerm(FPermList.Items[i]);
      indexList := i;
      if PPerm(FPermList.Items[i]).Prior = 0 then Break;
    end
    else
    if TableName = null then
    begin
      if PPerm(FPermList.Items[i])^.TableName = TableName then
      begin
        result := PPerm(FPermList.Items[i]);
        indexList := i;
        if PPerm(FPermList.Items[i]).Prior = 0 then Break;
      end;
    end;
  end;
end;
//******************************************************************************
procedure TRoleShema.FClearList;
var i:Integer;
begin
  for i := 0 to FPermList.Count - 1 do
    Dispose( PPerm( FPermList[i] ));

  FPermList.Clear;
end;
//******************************************************************************
function TRoleShema.Permission( TableName:Variant; UserId:integer ):TPerm;
var indexList:Integer;
    FindPerm :PPerm;
begin
  if FPermList.count=0 then RefreshRole( UserId, FDBParam );

  FindPerm := FFindPermByTableName( TableName, indexList );
  if FindPerm <> nil then result := FindPerm^
  else
  begin
    FindPerm := FFindPermByTableName( null, indexList );
    if FindPerm <> nil then
    begin
      Result.TableName := FindPerm.TableName;
      Result.ComentTableName := FindPerm.ComentTableName;
      Result.LayoutName := FindPerm.LayoutName;
      
      Result.CanView   := FindPerm.CanDelete;
      Result.CanUpdate := FindPerm.CanDelete;
      Result.CanDelete := FindPerm.CanDelete;

    end
    else
    begin
       Result.CanView   := self.FIfNoRoleAcess;
       Result.CanUpdate := self.FIfNoRoleAcess;
       Result.CanDelete := self.FIfNoRoleAcess;

    end;
  end;
end;
//******************************************************************************
procedure TRoleShema.FReplacePermission( NewPerm, OldPerm:PPerm );
begin
  if ( NewPerm.Prior < OldPerm.Prior ) then
  begin
    PPerm( OldPerm ).CanView := NewPerm.CanView;
    PPerm( OldPerm ).CanUpdate := NewPerm.CanUpdate;
    PPerm( OldPerm ).CanDelete := NewPerm.CanDelete;
    PPerm( OldPerm ).Prior := NewPerm.Prior;
  end
  else
  if ( NewPerm.Prior = OldPerm.Prior ) then
  begin
    PPerm( OldPerm ).CanView := MyIfThen( NewPerm.CanView = OldPerm.CanView, NewPerm.CanView, 0 );
    PPerm( OldPerm ).CanUpdate := MyIfThen( NewPerm.CanUpdate = OldPerm.CanUpdate, NewPerm.CanUpdate, 0 );
    PPerm( OldPerm ).CanDelete := MyIfThen( NewPerm.CanDelete = OldPerm.CanDelete, NewPerm.CanDelete, 0 );
    PPerm( OldPerm ).Prior := MyIfThen( NewPerm.Prior = OldPerm.Prior, NewPerm.Prior, 0 );
  end;
end;
//******************************************************************************
Function TRoleShema.FAddPermission( Perm:PPerm ):Boolean;
var FindPerm: PPerm;
    indexList:Integer;
begin
  FindPerm :=FFindPermByTableName( Perm^.TableName, indexList );
  if ( FindPerm <> nil ) then
  begin
    result := False;
    FReplacePermission( Perm, FindPerm );
  end
  else
  begin
    FPermList.Add( Perm );
    result := True;
  end;
end;
//****************************************************************************** }
procedure TRoleShema.FReadDBPermission( DB:TDataset );
var aPerm: PPerm;
begin
  FClearList;
  while not DB.eof do
  begin
    New(aPerm);
    
    aPerm^.TableName := DB.FieldByName('tablename').Value;
    aPerm^.ComentTableName := DB.FieldByName('ComentTableName').AsString;
    aPerm^.LayoutName := DB.FieldByName('LAYOUTNAME').AsString;

    if DB.FieldByName('masterpermission').asInteger = 1 then
    begin
      aPerm^.CanView := True;
      aPerm^.CanUpdate := True;
      aPerm^.CanDelete := True;
      aPerm^.Prior     := 0;
    end
    else
    begin
      aPerm^.CanView := MyIfThen( DB.FieldByName('CAN_VIEW').AsInteger = 1, True,False );
      aPerm^.CanUpdate := MyIfThen( DB.FieldByName('CAN_UPDATE').AsInteger = 1, True,False );
      aPerm^.CanDelete := MyIfThen( DB.FieldByName('CAN_DELETE').AsInteger = 1, True,False );
      aPerm^.Prior     := DB.FieldByName('PRIOR').asInteger;
    end;

    if not FAddPermission( aPerm ) then Dispose( aPerm );
    DB.Next;
  end;
end;
//****************************************************************************** }
procedure TRoleShema.RefreshRole( UserId:integer; DBParam:TConnectDBParam );
var DB:TDataset;
begin
  try
    DB := DBCreate( FSql( UserId ), nil, DBParam );
    FReadDBPermission( DB );

  finally
    DestroyDB( DB );
  end;
end;
//******************************************************************************
end.
 