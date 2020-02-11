unit ControlsHook;

interface

uses
  Windows, ShellApi, Controls, Forms, TypInfo, StdCtrls,Dialogs, Messages,Core,
  Menus,SysUtils,Clipbrd,UnitProc,cxGrid,cxDBTL,Classes,
  cxTextEdit,cxPC,cxCheckBox,cxRadioGroup,cxImageComboBox,Buttons,cxDBExtLookupComboBox,ComCtrls,
  cxMemo,cxDBEdit,DBCtrls, ExtCtrls, cxCalendar, UnitUserPermission, UnitAdminRoleForm, Graphics, ActnList,Variants;

const
  ButCopyName = 'Адміністрування';

type
  TJmpBlock         =  packed record
     Code:          Byte;
     Offset:        Integer;
  end;
  TEventForm = packed record
    Form:TForm;
    EventOnCreate:TNotifyevent;
    EventOnDestroy:TNotifyevent;
    EventOnShow:TNotifyevent;
  end;
  PEventForm = ^ TEventForm;

  TMyEventClass = class
    private
        FCurrControlFormAfterCreate:TForm;
        FSaveOriginalCreateEventList:TList;//TNotifyEvent;
        //procedure FMyCreateForm(Sender: TObject);
        procedure FMyShowForm(Sender: TObject);
        procedure FMyDestroyForm(Sender: TObject);
        function  FFindIndexEventInListForForm(aForm:TForm):Integer;
        function  FFindEventOnCreateForForm(aForm:TForm):TNotifyEvent;
        function  FFindEventOnShowForForm(aForm:TForm):TNotifyEvent;
        function  FFindEventOnDestroyForForm(aForm:TForm):TNotifyEvent;
        procedure FDeleteFormFromEventList(aForm:TForm);
        function  FAddEventOnCreateForForm(aForm:TForm):Boolean;
        procedure FFreeOriginalEventForm;
        procedure FFreeEventCurrForm(IndexList:Integer);

    public
      procedure CheckElemClick(Sender: TObject);
      procedure PrepareFormCreate(aForm:TForm);
      Constructor Create;
      Destructor Destroy;
  end;

procedure InitHook (aElemUserRole: TRoleShema; isAdmin:Boolean );
Procedure KillHook;

implementation

var
  HMousePopUpMenuHook:THandle;
  HCreateNewForm : THandle;
  MyEventClass : TMyEventClass;
  HookElemUserRole: TRoleShema;

function CheckParentPMenu( aCurrControl:TControl ) : TControl;
begin
   result:= nil;
   if aCurrControl = nil  then exit;
   
   if TButton(aCurrControl).PopupMenu <> nil then result := aCurrControl
   else  result := CheckParentPMenu( aCurrControl.parent ) ;
end;

function FindVCLGraphicWindow( Pos: TPoint): TControl;
var
  Window: TWinControl;
  Ctrl: TControl;
  ParentH:HWND;
  ChildH:HWND;
begin

  Result := nil;
  Window := FindVCLWindow(Pos);
  //ParentH := Window.Handle;
  if Window <> nil then
  begin
    Ctrl := Window.ControlAtPos(Window.ScreenToClient(Pos), False, False );
    if Ctrl = nil then
    begin
      if Window.Name<>'' then
        Ctrl := Window
      else Ctrl := Window.Parent;
    end;

    Result := Ctrl;
  end;

end;

function MousePopUpMenuProc(
    nCode: Integer;     // hook code
    WP: wParam; // message identifier
    LP: lParam  // mouse coordinates
   ):Integer;stdcall;
var MHS:TMOUSEHOOKSTRUCT;
    WC:TWinControl;
    P:TPoint;
    CurrControl:TControl;
    P_PM: PPropInfo;
    Parent_PM : TControl;
    Obj_PM:TObject;
begin
  Result:=CallNextHookEx( HMousePopUpMenuHook, nCode, WP, LP );
  if nCode=HC_ACTION then
   begin
     MHS:=PMOUSEHOOKSTRUCT(LP)^;
     if ((WP=WM_RBUTTONDOWN) or (WP=WM_RBUTTONUP)) then
      begin

        CurrControl := FindVCLGraphicWindow( MHS.pt );
        if CurrControl <> nil then
        begin
           P_PM := GetPropInfo( CurrControl.ClassInfo, 'PopupMenu' );

           if P_PM <> nil then  // Found Property PopUpMenu
           begin

             Parent_PM := CheckParentPMenu( CurrControl );
             Obj_PM := GetObjectProp( CurrControl, 'PopupMenu' );

             if ( not( CurrControl is TPanel) ) and
                ( Obj_PM = nil) and
                ( Parent_PM <> nil ) then
             begin

               Sleep( 300 );
               keybd_event( VK_ESCAPE, Mapvirtualkey( VK_ESCAPE, 0 ), 0, 0 );
               keybd_event( VK_ESCAPE, Mapvirtualkey( VK_ESCAPE, 0 ), KEYEVENTF_KEYUP,0 );

             end;

           end;
        end;


      end;
   end;
end;

function FoundFormControlByClassName(aClassName:String):TComponent;
var i:integer;
begin
  result := nil;
  for i:=0 to Application.ComponentCount-1 do
  begin
    if (Application.Components[i] is TForm)and
       ( CompareText( Application.Components[i].ClassName, aClassName)=0 ) then
    begin
      result := Application.Components[i];
      break;
    end;
  end;
end;

procedure PreparePMenuForComponentForm( Owner:TComponent; Act:TNotifyEvent; AcceptClassName:array of TClass ) ;
var i:integer;
    P: PPropInfo;
    NewButMenuItem:TMenuItem;
    Obj_PM:TPopUpMenu;
    SpliterAct:TNotifyEvent;
    ActMenuItem:TNotifyEvent;
    Bmp: Graphics.TBitmap;
    HaveActionClick:Boolean;
begin
  for i:=0 to Owner.ComponentCount-1 do
  begin

    if Owner.Components[I].ClassInfo<>nil then
    begin
      if ( Owner.Components[I] is TFrame ) then
        PreparePMenuForComponentForm( TComponent( Owner.Components[I] ), Act, AcceptClassName )
      else
      begin

        P := GetPropInfo( Owner.Components[I].ClassInfo, 'PopupMenu' );
        if P <> nil then
        begin
          if ( CheckOnClassName( TWinControl(Owner.Components[i]), AcceptClassName ) ) then
          begin
             Obj_PM := TPopUpMenu( GetObjectProp(Owner.Components[I], 'PopupMenu') );
             NewButMenuItem := AddMItemToPopUpMenuOrToNewPopAp( Owner, Obj_PM ,'SelfMenuItem_'+Owner.Components[I].Name, ButCopyName, Act );
             HookElemUserRole.PaintIconMenuItem( NewButMenuItem ); // Paint icon

             Obj_PM := TPopUpMenu( GetObjectProp(Owner.Components[I],'PopupMenu') );

             if ( Obj_PM = nil ) and ( NewButMenuItem<> nil ) then
             begin
               TypInfo.SetObjectProp( Owner.Components[I], P, TPopUpMenu( NewButMenuItem.Owner ) );
               TPopUpMenu( NewButMenuItem.Owner ).PopupComponent := Owner.Components[I];
             end;
          end;
        end
        else
        if Owner.Components[I] is TmenuItem then
        begin
          HaveActionClick := (@TmenuItem(Owner.Components[I]).OnClick <>nil) or
                             (TmenuItem(Owner.Components[I]).Action<>nil);

          if (TmenuItem(Owner.Components[I]).Caption<>'-'){and(TmenuItem(Owner.Components[I]).parent.name<>'') }then
          begin
            ActMenuItem := TmenuItem(Owner.Components[I]).OnClick;
            if @ActMenuItem =  nil then
              if TmenuItem(Owner.Components[I]).Action<> nil then
                ActMenuItem := TAction( TmenuItem(Owner.Components[I]).Action ).OnExecute;

            if HaveActionClick then
            begin

              NewButMenuItem:= CreteMenuItem( TmenuItem(Owner.Components[I]), TmenuItem(Owner.Components[I]).Name+'_Sub', ActMenuItem , TmenuItem(Owner.Components[I]).Caption, TmenuItem(Owner.Components[I]).ImageIndex );
              CreteMenuItem( TmenuItem(Owner.Components[I]), TmenuItem(Owner.Components[I]).Name+'_Sub'+'_Spiter', SpliterAct, '-', -1, False  );

              if @TmenuItem(Owner.Components[I]).OnClick<> nil then
                NewButMenuItem.OnClick := TmenuItem(Owner.Components[I]).OnClick;

              if TAction ( TmenuItem(Owner.Components[I]).Action ) <>nil then
                NewButMenuItem.Action := TmenuItem(Owner.Components[I]).Action ;

              TmenuItem(Owner.Components[I]).OnClick := nil;
              TmenuItem(Owner.Components[I]).Action := nil;
            end;


            NewButMenuItem:= CreteMenuItem( TmenuItem(Owner.Components[I]), 'SelfMenuItem_'+Owner.Components[I].Name, Act, ButCopyName );
            HookElemUserRole.PaintIconMenuItem( NewButMenuItem ); // Paint icon
          end;
        end;

      end;

    end;
  end;
end;
//******************************************************************************
function GetCompElementComment(ForComponent:TComponent):Widestring;
Const KeyCaption='Caption';
var P: PPropInfo;
    CaptObjValue:TObject;
begin
  result := '';
  P := GetPropInfo( ForComponent.ClassInfo, KeyCaption );
  if (P <> nil){and( ForComponent.Fcomponents<>nil) } then
  begin
   try
     CaptObjValue := GetObjectProp( ForComponent , KeyCaption );
     if CaptObjValue <> nil then
     begin
       result := String( CaptObjValue ) ;
       ReplaseOn(result,'&','');
     end;
   except
   end;
  end;
end;
//******************************************************************************
Function GetElemNameForAdmin( ForComponent:TComponent; var ElemType:Integer; Var Comment:String ):String;
var ClickComponenet:TComponent;
    FindElem:TDBShema;
begin
  FindElem := nil;
  ElemType :=1;
  Comment :='';
  
  if ForComponent is TcxGrid then
    FindElem := FindElementByView( TcxGrid(ForComponent).Levels[0].GridView )
  else
  if ForComponent is TcxDBTreeList then
    FindElem := FindElementByTree( TcxDBTreeList(ForComponent) );

  if FindElem = nil then
  begin
    result := GetNamePathForComponent(ForComponent);
    Comment := GetCompElementComment(ForComponent);
  end;

  if FindElem <> nil then
  begin
    result := FindElem.TableName;
    ElemType:=0;
    Comment := FindElem.GetDBTableDescript;
    if result='' then
    begin
      result := GetNamePathForComponent(ForComponent);
      Comment := GetCompElementComment(ForComponent);
      ElemType:=1;
    end;
  end;
end;
//******************************************************************************
{procedure CopyElemNameForAdmin( ForComponent:TComponent;var ElemKind:Integer );
begin
  Clipboard.AsText := GetElemNameForAdmin( ForComponent, ElemKind );
end; }
//******************************************************************************
procedure TMyEventClass.CheckElemClick(Sender: TObject);
var ElemName : String;
    ElemType : Integer;
    Comment  : String;
begin
  //if TMenuItem(Sender).Tag = -1  TMenuItem(Sender).Parent.name
  if TPopUpMenu(TMenuItem(Sender).Owner).PopupComponent.Name <> '' then
    ElemName := GetElemNameForAdmin(  TPopUpMenu(TMenuItem(Sender).Owner).PopupComponent, ElemType, Comment )
  else
    ElemName := GetElemNameForAdmin(  TPopUpMenu(TMenuItem(Sender).parent), ElemType, Comment );

  ShowAdminRole( ElemName, ElemType, Comment );

end;
//******************************************************************************
{procedure TMyEventClass.FMyCreateForm(Sender: TObject);
var SelfEventOnCreate:TNotifyEvent;
begin
  SelfEventOnCreate := FFindEventOnCreateForForm( TForm(Sender) );
  PreparePMenuForComponentForm( TComponent(Sender), self.CheckElemClick,
                               [TcxTextEdit, TcxPageControl, TcxTabSheet, TTabSheet, TcxMemo,TMemo,TcxDBMemo,TDBMemo,
                                TcxGrid, TcxDBTreeList, TcxCheckBox, TcxRadioButton, TcxImageCombobox, TbitBtn,
                                TSpeedButton, TButton, TcxTextEdit, TcxExtLookUpCombobox, TMenuItem,TcxDateEdit,TDateTimePicker ]  ) ;


  if @SelfEventOnCreate <> nil then SelfEventOnCreate( Sender );
end;  }
//******************************************************************************
procedure TMyEventClass.FMyShowForm(Sender: TObject);
var SelfEventOnShow:TNotifyEvent;
begin
  SelfEventOnShow := FFindEventOnShowForForm( TForm(Sender) );

  if Application.Tag = -1 then
    PreparePMenuForComponentForm( TComponent(Sender), self.CheckElemClick,
                                [TcxTextEdit, TcxPageControl, TcxTabSheet, TTabSheet, TcxMemo,TMemo,TcxDBMemo,TDBMemo,
                                TcxGrid, TcxDBTreeList, TcxCheckBox, TcxRadioButton, TcxImageCombobox, TbitBtn,
                                TSpeedButton, TButton, TcxTextEdit, TcxExtLookUpCombobox, TToolButton, TMenuItem,TcxDateEdit,TDateTimePicker ]  ) ;

  HookElemUserRole.RefreshControlRole( TForm(Sender) );

  if @SelfEventOnShow <> nil then SelfEventOnShow( Sender );
end;
//******************************************************************************
procedure TMyEventClass.FMyDestroyForm(Sender: TObject);
var SelfEventOnDestroy:TNotifyEvent;
begin
  SelfEventOnDestroy := FFindEventOnDestroyForForm(  TForm(Sender) );
  FDeleteFormFromEventList( TForm(Sender) );

  if @SelfEventOnDestroy <> nil then SelfEventOnDestroy( Sender );
end;
//******************************************************************************
function TMyEventClass.FFindIndexEventInListForForm(aForm:TForm):Integer;
var i:integer;
begin
  result := -1;
  for i:=0 to FSaveOriginalCreateEventList.Count-1 do
  begin
    if PEventForm(FSaveOriginalCreateEventList.Items[i])^.Form = aForm then
    begin
      result := i;
      break;
    end;
  end;
end;
//******************************************************************************
function TMyEventClass.FFindEventOnCreateForForm(aForm:TForm):TNotifyEvent;
var i:integer;
begin
  result := nil;
  i := FFindIndexEventInListForForm(aForm);
  if i <> -1 then
    result := PEventForm(FSaveOriginalCreateEventList.Items[i])^.EventOnCreate;
end;
//******************************************************************************
function TMyEventClass.FFindEventOnShowForForm(aForm: TForm): TNotifyEvent;
var i:integer;
begin
  result := nil;
  i := FFindIndexEventInListForForm(aForm);
  if i <> -1 then
    result := PEventForm(FSaveOriginalCreateEventList.Items[i])^.EventOnShow;
end;
//******************************************************************************
function TMyEventClass.FFindEventOnDestroyForForm(aForm:TForm):TNotifyEvent;
var i:integer;
begin
  result := nil;
  i := FFindIndexEventInListForForm(aForm);
  if i <> -1 then
    result := PEventForm(FSaveOriginalCreateEventList.Items[i])^.EventOnDestroy;
end;
//******************************************************************************
procedure TMyEventClass.FDeleteFormFromEventList(aForm:TForm);
var FindIndex:Integer;
begin
  FindIndex := FFindIndexEventInListForForm(aForm);
  if FindIndex <> -1 then FFreeEventCurrForm(FindIndex);
end;
//******************************************************************************
function TMyEventClass.FAddEventOnCreateForForm(aForm:TForm):Boolean;
var PCurrEvent:PEventForm;
begin
  result := False;
  if (@aForm.OnCreate = nil) and (@aForm.OnDestroy = nil) then exit;
  if FFindIndexEventInListForForm(aForm)<>-1 then exit;

  new(PCurrEvent);
  PCurrEvent^.Form := aForm;
  PCurrEvent^.EventOnCreate := aForm.OnCreate;
  PCurrEvent^.EventOnDestroy:= aForm.OnDestroy;
  PCurrEvent^.EventOnShow   := aForm.OnShow;

  FSaveOriginalCreateEventList.Add( PCurrEvent );
  result := True;
end;
//******************************************************************************
procedure TMyEventClass.PrepareFormCreate( aForm:TForm );
begin
  if not FAddEventOnCreateForForm(aForm) then exit;

  //aForm.OnCreate := FMyCreateForm;
  aForm.OnShow   := FMyShowForm;
  aForm.OnDestroy:= FMyDestroyForm;
end;
//******************************************************************************
procedure TMyEventClass.FFreeEventCurrForm(IndexList:Integer);
begin
  if IndexList <> -1 then
  begin
    PEventForm(FSaveOriginalCreateEventList.Items[IndexList]).Form.OnCreate := PEventForm(FSaveOriginalCreateEventList.Items[IndexList]).EventOnCreate;
    PEventForm(FSaveOriginalCreateEventList.Items[IndexList]).Form.OnDestroy := PEventForm(FSaveOriginalCreateEventList.Items[IndexList]).EventOnDestroy;

    Dispose( PEventForm(FSaveOriginalCreateEventList.Items[IndexList]) );
    FSaveOriginalCreateEventList.Delete( IndexList );
  end;
end;
//******************************************************************************
procedure TMyEventClass.FFreeOriginalEventForm;
var i:integer;
begin
  for i:=0 to FSaveOriginalCreateEventList.Count-1 do
    FFreeEventCurrForm( i );
end;
//******************************************************************************
constructor TMyEventClass.Create;
begin
  FSaveOriginalCreateEventList := TList.Create;
end;

destructor TMyEventClass.Destroy;
begin
  FFreeOriginalEventForm;
  FSaveOriginalCreateEventList.Free;
end;
//******************************************************************************
function CreateNewFormProc(aCode: Integer; aWParam: WPARAM; aLParam: LPARAM): LRESULT; stdcall;
var
 hWindow: HWND;
 CurrControl:TComponent;
 CBTCreateWnd: PCBTCreateWnd ;
 sClassName:string;
begin

  Result := CallNextHookEx( HCreateNewForm, aCode, aWParam, aLParam );
   if aCode<0 then exit;
   If ( aCode = HCBT_CREATEWND ) and
      ( Pointer(aLParam) <> Nil ) and
      ( PCBTCreateWnd(aLParam).lpcs <> Nil )and
      ( PCBTCREATEWND(aLParam).lpcs.lpszName <> nil ) Then
     begin
       hWindow := HWND(aWParam);

       try
         if (Integer( PCBTCREATEWND(aLParam).lpcs^.lpszClass) <> $8002 ) and
            (Integer( PCBTCREATEWND(aLParam).lpcs^.lpszClass) <> $C017 ) and
            (Integer( PCBTCREATEWND(aLParam).lpcs^.lpszClass) <> $C019 ) then
         begin
           sClassName := PCBTCREATEWND(aLParam).lpcs.lpszClass; //PCBTCreateWnd(aLParam)^.lpcs^.lpszClass;
           CurrControl := FoundFormControlByClassName( sClassName );
           if (CurrControl<>nil)and(CurrControl is TForm ) then
             MyEventClass.PrepareFormCreate( TForm( CurrControl ) );
         end;
       except
       end;
     end;
end;

procedure InitHook( aElemUserRole: TRoleShema; isAdmin:Boolean );
var
  dwThreadID : DWORD;
begin
  if aElemUserRole = nil then exit;
  
  if isAdmin then Application.Tag := -1
  else Application.Tag := 0;

  HookElemUserRole := aElemUserRole;
  MyEventClass:= TMyEventClass.create;
  HMousePopUpMenuHook:=SetWindowsHookEx(WH_MOUSE,@MousePopUpMenuProc,HInstance,GetCurrentThreadID);

  dwThreadID := GetCurrentThreadId;
  HCreateNewForm := SetWindowsHookEx( WH_CBT , @CreateNewFormProc, hInstance, dwThreadID);
end;

Procedure KillHook;
begin
  if (HMousePopUpMenuHook <> 0) then
    UnhookWindowsHookEx( HMousePopUpMenuHook );

  if (HCreateNewForm <> 0 ) then
    UnhookWindowsHookEx( HCreateNewForm );

  if MyEventClass <>nil then
    MyEventClass.Free;
end;





initialization
  // Set the function hook


finalization
  KillHook;

end.