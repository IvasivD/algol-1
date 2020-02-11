unit UnitUserPermission;

interface
uses SysUtils,Classes,DB,Controls,Forms, Variants,cxPC,ComCtrls,Menus,Graphics, UnitProc,
     TypInfo, ActnList;

type
 TParentControlName = array of string;

 TPerm = record
    ElemName:Variant;
    ComentTableName:string;
    CanInsert:Boolean;
    CanUpdate:Boolean;
    CanDelete:Boolean;
    CanHide  :Boolean;
    KindElem:Integer;
    FoundRole:Boolean;
    ParentControlName : TParentControlName;
 end;
 PPerm = ^TPerm;

 TElementName = record
   ElementName:variant;
   ParentControlName : TParentControlName;
 end;

 TRoleShema=class
 private
    FCurrUserID:Integer;
    FPermList : Tlist;
    FApplicationName: String;
    FIfNoRoleAcess:Boolean;
    FDBParam:TConnectDBParam;
    FImageListAdminIcon:TImageList;
    FImageIndex:Integer;

    function  FSql( UserId:Integer ):string;
    procedure FReplacePermission( NewPerm, OldPerm:PPerm );
    function  FAddPermission( Perm:PPerm  ):Boolean;
    function  FFindPermByTableName( ElemName:Variant;Var indexList:Integer ):PPerm;
    procedure FReadDBPermission( DB:TDataset );
    function  FPareseElement(aElem:variant):TElementName;
    procedure FClearList;
    procedure FRefreshControlRole( aControl:TComponent );
    function  FCheckParentControlName (aControl:TComponent; aPerm:PPerm ):Boolean;
 public
    constructor Create( ApplicationName:String; DBParam:TConnectDBParam; IfNoRoleAcess:Boolean = False );
    destructor Close;
    function  FindPermission(ElemName:Variant):TPerm;
    function  Permission( ElemName:Variant; UserId:integer  ):TPerm;
    function  CheckPermisAny( ElemName:String; USerId:Integer):boolean;
    function  CheckPermisAnyByElem( aPerm:PPerm ):boolean;
    function  CheckPermisIsHide( ElemName:String; USerId:Integer):boolean;
    function  CheckPermisReadOnly(ElemName:String; USerId:Integer ):boolean;
    procedure RefreshRole( UserId:integer; DBParam:TConnectDBParam );
    procedure RefreshControlRole( aControl:TComponent );
    procedure AddImageIcon( ImageListAdminIcon:TImageList; ImageIndex:Integer );
    procedure PaintIconMenuItem( menuItem:TMenuItem );
 end;

implementation
uses Core;
{ TRoleShema }

constructor TRoleShema.Create( ApplicationName: String; DBParam:TConnectDBParam; IfNoRoleAcess:Boolean = False );
begin
  FApplicationName := ApplicationName;
  FPermList := Tlist.Create;
  FDBParam := DBParam;
  
  FIfNoRoleAcess := IfNoRoleAcess;
  FCurrUserID := 0;

  self.FImageListAdminIcon := nil;
  self.FImageIndex := -1;
end;

destructor TRoleShema.Close;
begin
  FPermList.Free;
end;

function TRoleShema.FSql( UserId:Integer ):string;
begin
  result := 'select * from GET_USER_PERMISSIONS( '+ IntToStr(UserId) +','+''''+FApplicationName+''''+' )';
end;
//******************************************************************************
function TRoleShema.FFindPermByTableName( ElemName:Variant; var indexList:Integer ):PPerm;
var i:Integer;
begin
  result:=nil;
  indexList:=-1;
  for i := 0 to FPermList.Count - 1 do
  begin
    if ( ElemName <> null ) and ( ElemName <> '' ) and
       ( CompareText( VarToStr( PPerm(FPermList.Items[i])^.ElemName ) , ElemName ) = 0 ) then
    begin
      result := PPerm(FPermList.Items[i]);
      indexList := i;

      Break;
    end
    else
    if ElemName = null then
    begin
      if PPerm(FPermList.Items[i])^.ElemName = ElemName then
      begin
        result := PPerm(FPermList.Items[i]);
        indexList := i;

        Break;
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
function TRoleShema.FindPermission(ElemName:Variant):TPerm;
var indexList:Integer;
    FindPerm :PPerm;
begin
  FindPerm := FFindPermByTableName( ElemName, indexList );
  if FindPerm <> nil then result := FindPerm^
  else
  begin
    result.ElemName := ElemName;
    result.ComentTableName :='';
    result.CanInsert := False;
    result.CanUpdate := False;
    result.CanDelete := False;
    result.CanHide   := False;
    result.KindElem  := -1;
    result.FoundRole := False;
    result.ParentControlName := nil;
  end;
end;
//******************************************************************************
function TRoleShema.Permission( ElemName:Variant; UserId:integer  ):TPerm;
var indexList:Integer;
    FindPerm :PPerm;
begin
  Self.FCurrUserID := UserId;
  if FPermList.count=0 then RefreshRole( Self.FCurrUserID, FDBParam );

  FindPerm := FFindPermByTableName( ElemName, indexList );
  if FindPerm <> nil then result := FindPerm^
  else
  begin
    FindPerm := FFindPermByTableName( null, indexList );
    if FindPerm <> nil then
    begin
      Result.ElemName := FindPerm.ElemName;
      Result.ComentTableName := FindPerm.ComentTableName;
      result.KindElem := FindPerm.KindElem;

      Result.CanInsert := FindPerm.CanInsert;
      Result.CanUpdate := FindPerm.CanUpdate;
      Result.CanDelete := FindPerm.CanDelete;
      Result.CanHide   := FindPerm.CanHide;
      result.FoundRole := True;
    end
    else
    begin
      Result.CanInsert := self.FIfNoRoleAcess;
      Result.CanUpdate := self.FIfNoRoleAcess;
      Result.CanDelete := self.FIfNoRoleAcess;
      Result.CanHide   := False;
      result.KindElem  := 0;
      result.FoundRole := False;
    end;
  end;
end;
//******************************************************************************
procedure TRoleShema.FReplacePermission( NewPerm, OldPerm:PPerm );
begin
  {if ( NewPerm.Prior < OldPerm.Prior ) then
  begin
    PPerm( OldPerm ).CanInsert := NewPerm.CanInsert;
    PPerm( OldPerm ).CanUpdate := NewPerm.CanUpdate;
    PPerm( OldPerm ).CanDelete := NewPerm.CanDelete;
    PPerm( OldPerm ).Prior := NewPerm.Prior;
  end
  else
  if ( NewPerm.Prior = OldPerm.Prior ) then
  begin}
  PPerm( OldPerm ).CanInsert := NewPerm.CanInsert;//MyIfThen( NewPerm.CanInsert = OldPerm.CanInsert, NewPerm.CanInsert, 0 );
  PPerm( OldPerm ).CanUpdate := NewPerm.CanUpdate;//MyIfThen( NewPerm.CanUpdate = OldPerm.CanUpdate, NewPerm.CanUpdate, 0 );
  PPerm( OldPerm ).CanDelete := NewPerm.CanDelete;//MyIfThen( NewPerm.CanDelete = OldPerm.CanDelete, NewPerm.CanDelete, 0 );
  PPerm( OldPerm ).CanHide   := NewPerm.CanHide;//MyIfThen( NewPerm.CanHide = OldPerm.CanHide, NewPerm.CanHide, 0 );

  //PPerm( OldPerm ).Prior := MyIfThen( NewPerm.Prior = OldPerm.Prior, NewPerm.Prior, 0 );
 // end;
end;
//******************************************************************************
Function TRoleShema.FAddPermission( Perm:PPerm ):Boolean;
var FindPerm: PPerm;
    indexList:Integer;
begin
  FindPerm :=FFindPermByTableName( Perm^.ElemName, indexList );
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
//******************************************************************************
function TRoleShema.FPareseElement(aElem:variant):TElementName;
var i:Integer;
    PosPoint:Integer;
    CurrListForm:TStringList;
begin
  result.ElementName := aElem;
  SetLength( result.ParentControlName, 0 ) ;

  try
    CurrListForm := TStringList.Create;

    if aElem <> null then
    begin
      PosPoint := AnsiPos('.',aElem);
      if PosPoint <>0 then
      begin
        CurrListForm := ParseTextToList( aElem, ['.'] );
        if CurrListForm.Count <> 0 then
        begin
          result.ElementName := CurrListForm[CurrListForm.Count-1];
          CurrListForm.Delete( CurrListForm.Count-1 );

          SetLength(result.ParentControlName ,CurrListForm.Count);
          for i:=0 to CurrListForm.Count-1 do result.ParentControlName[i] := CurrListForm.Strings[i];
        end;
        //result.ElementName := Copy( aElem, AnsiPos( '.',aElem) +1, Length (aElem ) - PosPoint+1 );
        //result.ParentControlName := Copy( aElem, 1, PosPoint-1);
      end;
    end;
  finally
    CurrListForm.Free;
  end;
end;
//******************************************************************************
procedure TRoleShema.FReadDBPermission( DB:TDataset );
var aPerm: PPerm;
    ElementName : TElementName;
begin
  FClearList;
  while not DB.eof do
  begin
    New(aPerm);

    aPerm^.ComentTableName := DB.FieldByName('COMENTELEMENT').AsString;
    aPerm^.KindElem := DB.FieldByName('KINDELEM').asInteger;

    ElementName := FPareseElement( DB.FieldByName('ELEMENT').value );

    aPerm^.ElemName := ElementName.ElementName;
    aPerm^.ParentControlName := ElementName.ParentControlName;

    //aPerm^.LayoutName := DB.FieldByName('LAYOUTNAME').AsString;

    if DB.FieldByName('masterpermission').asInteger = 1 then
    begin
      aPerm^.CanInsert := True;
      aPerm^.CanUpdate := True;
      aPerm^.CanDelete := True;
      aPerm^.CanHide   := False;
      //aPerm^.Prior     := 0;
    end
    else
    begin
      aPerm^.CanInsert := MyIfThen( DB.FieldByName('CAN_INSERT').AsInteger = 1, True,False );
      aPerm^.CanUpdate := MyIfThen( DB.FieldByName('CAN_UPDATE').AsInteger = 1, True,False );
      aPerm^.CanDelete := MyIfThen( DB.FieldByName('CAN_DELETE').AsInteger = 1, True,False );
      aPerm^.CanHide   := MyIfThen( DB.FieldByName('CAN_HIDE').AsInteger = 1, True, False );
      //aPerm^.Prior     := DB.FieldByName('PRIOR').asInteger;
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
function TRoleShema.FCheckParentControlName( aControl:TComponent; aPerm:PPerm ):Boolean;
begin
  if Length( aPerm.ParentControlName )>0 then
  begin
    if CompareText( aPerm.ParentControlName[0], aControl.Name )=0 then result := True
    else result := False;
  end
  else result := True;
end;
//******************************************************************************
function TRoleShema.CheckPermisAny( ElemName:String; USerId:Integer):boolean;
begin
  result := (self.Permission( ElemName, UserId).CanInsert) or
            (self.Permission( ElemName, UserId).CanUpdate) or
            (self.Permission( ElemName, UserId).CanDelete) ;
end;
//******************************************************************************
function TRoleShema.CheckPermisIsHide( ElemName:String; USerId:Integer):boolean;
begin
  result := (self.Permission( ElemName, UserId).CanHide);
end;
//******************************************************************************
function TRoleShema.CheckPermisAnyByElem( aPerm:PPerm ):boolean;
begin
  result := (aPerm.CanInsert) or (aPerm.CanUpdate) or (aPerm.CanDelete );
end;
//******************************************************************************
function TRoleShema.CheckPermisReadOnly( ElemName:String; USerId:Integer ):boolean;
var Perm:TPerm;
begin
  Perm := self.Permission( ElemName, UserId );
  result:= ( Perm.FoundRole ) and ( not Perm.CanInsert )and ( not Perm.CanUpdate ) and (not Perm.CanDelete)
end;
//******************************************************************************
procedure TRoleShema.FRefreshControlRole( aControl:TComponent );
var i:integer;
    currComponent : TComponent;
    P_En:PPropInfo;
    P_Visible:PPropInfo;
begin
  for i := 0 to FPermList.Count - 1 do
  begin
    if ( PPerm(FPermList[i])^.KindElem = 1 ) and
       ( FCheckParentControlName( aControl, PPerm(FPermList[i]) ) ) then
    begin

       currComponent:= FindComponentByNameArr( PPerm(FPermList[i]).ParentControlName, aControl, 1 );
       if Length( PPerm(FPermList[i]).ParentControlName ) = 0 then currComponent := aControl;

       if ( currComponent <> nil )and( currComponent is TControl ) then
       begin
         currComponent :=currComponent.FindComponent( PPerm(FPermList[i]).ElemName );
         if currComponent <> nil then
         begin
           //P_En := GetPropInfo( currComponent.ClassInfo, 'Enabled' );
           //if P_En <> nil then
           //  TypInfo.SetObjectProp( currComponent, 'Enabled',  TObject( CheckPermisAnyByElem( PPerm(FPermList[i] ) ))  );

           //TControl(currComponent).Enabled := ( TControl(currComponent).Enabled ) and ( CheckPermisAnyByElem( PPerm(FPermList[i] ) ) );
           if currComponent is TControl then
             TControl(currComponent).Enabled := CheckPermisAnyByElem( PPerm(FPermList[i] ) );

           if currComponent is TMenuitem then
             if TMenuitem(currComponent).Action <> nil then
               TAction ( TMenuitem(currComponent).Action ).Enabled := CheckPermisAnyByElem( PPerm(FPermList[i] ) )
             else TMenuitem(currComponent).Enabled := CheckPermisAnyByElem( PPerm(FPermList[i] ) );


           if currComponent is TcxTabSheet then TcxTabSheet(currComponent).TabVisible := not PPerm(FPermList[i]).CanHide
           else
           if currComponent is TTabSheet then TTabSheet(currComponent).TabVisible := not PPerm(FPermList[i]).CanHide
           else
           begin
             if currComponent is TControl then TControl(currComponent).Visible := not PPerm(FPermList[i]).CanHide
             else
             if currComponent is TMenuitem then 
               if TMenuitem(currComponent).Action <> nil then
                 TAction ( TMenuitem(currComponent).Action ).Visible := not PPerm(FPermList[i]).CanHide
               else TMenuitem(currComponent).Visible := not PPerm(FPermList[i]).CanHide;

           end;

         end;
       end;

    end;
  end;
end;
//******************************************************************************
procedure TRoleShema.RefreshControlRole( aControl:TComponent );
begin
  FRefreshControlRole( aControl );
end;
//******************************************************************************
procedure TRoleShema.AddImageIcon(ImageListAdminIcon: TImageList; ImageIndex: Integer);
begin
  self.FImageListAdminIcon := ImageListAdminIcon;
  self.FImageIndex := ImageIndex;
end;
//******************************************************************************
procedure TRoleShema.PaintIconMenuItem( menuItem:TMenuItem );
var Bmp:Graphics.TBitmap;
begin
  if self = nil then exit;
  if self.FImageListAdminIcon = nil then exit;
  
  if menuItem.GetImageList <> nil then
  begin
    Bmp := Graphics.TBitmap.Create;
    self.FImageListAdminIcon.GetBitmap( self.FImageIndex, Bmp );
    menuItem.Bitmap.Assign(Bmp);
    Bmp.free;
  end
  else
  begin
    menuItem.GetParentMenu.Images := self.FImageListAdminIcon;
    menuItem.ImageIndex := self.FImageIndex;
  end;
end;
//******************************************************************************

end.
 