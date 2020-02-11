unit UnitHookControlChangeValue;

interface
uses Classes,Windows,cxTextEdit,cxDBExtLookupComboBox,cxRadioGroup,cxImage,ComCtrls,
     cxCalendar,cxCheckBox, UnitUpdateImages,UnitFrameUpdateImages,cxImageComboBox,
     cxCheckListBox,cxDropDownEdit,cxMemo, UnitProc,Controls,Forms,Grids;
type
  TRecEventPersonal = record
    Control : TControl;
    OnChange: TNotifyEvent;
  end;
  PRecEventPersonal =  ^TRecEventPersonal;

  THookControlChangeValue = class
     private
       FPersonalOnChange : TList;
       FFunctRefresh :TNotifyEvent;
       FChange : boolean;
       FCurrChange : PRecEventPersonal;
       Procedure FInitComponents( aControl:TComponent );
       procedure FDestroyPersonalProp;

       procedure FRestoreSelfEvent( EventPersonal : PRecEventPersonal );
       procedure FAddNotifyEvent( aControl:TControl; aChange:TNotifyEvent );
       procedure FOnChange( Sender: TObject );
       function  FFindEventPersonal( Sender: TObject ):PRecEventPersonal;
       procedure FPrepareOnChangeForControl(aComp:TcxTextEdit);overload;
       procedure FPrepareOnChangeForControl(aComp:TcxExtLookupComboBox);overload;
       procedure FPrepareOnChangeForControl(aComp:TcxRadioButton);overload;
       procedure FPrepareOnChangeForControl(aComp:TComboBoxEx);overload;
       procedure FPrepareOnChangeForControl(aComp:TcxImage);overload;
       procedure FPrepareOnChangeForControl(aComp:TcxDateEdit);overload;
       procedure FPrepareOnChangeForControl(aComp:TcxCheckListBox);overload;
       procedure FPrepareOnChangeForControl(aComp:TcxCheckBox);overload;
       procedure FPrepareOnChangeForControl(aComp:TcxImageComboBox);overload;
       procedure FPrepareOnChangeForControl(aComp:TcxComboBox);overload;
       procedure FPrepareOnChangeForControl(aComp:TcxMemo);overload;

     public
       constructor Create(aControl:TComponent; aFunctRefresh:TNotifyEvent = nil );
       destructor  Close;

       procedure AddControl( aControl: TComponent );
       procedure SetIsChange( aChange:Boolean );

       procedure AddFunctRefresh(aFunctRefresh:TNotifyEvent);

       function LastChange : PRecEventPersonal;

     Property IsChange:boolean read FChange write FChange;
     end;

implementation

{ THookControlChangeValue }

constructor THookControlChangeValue.Create( aControl: TComponent; aFunctRefresh:TNotifyEvent = nil );
begin
  FFunctRefresh := aFunctRefresh;
  FPersonalOnChange := TList.Create;
  AddControl( aControl );

  SetIsChange( False );
  self.FCurrChange := nil;
end;

destructor THookControlChangeValue.Close;
begin
  FDestroyPersonalProp;
  FPersonalOnChange.Free;
end;

procedure THookControlChangeValue.AddControl( aControl: TComponent );
begin
  FInitComponents( aControl );
end;

procedure THookControlChangeValue.AddFunctRefresh(aFunctRefresh:TNotifyEvent);
begin
  FFunctRefresh := aFunctRefresh;
end;

function THookControlChangeValue.LastChange : PRecEventPersonal;
begin
  result := FCurrChange;
end;

procedure THookControlChangeValue.SetIsChange( aChange:Boolean );
begin
  FChange := aChange;
end;

procedure THookControlChangeValue.FAddNotifyEvent( aControl:TControl; aChange:TNotifyEvent );
var PersEvent:PRecEventPersonal;
begin
  New(PersEvent);
  PersEvent.Control  := aControl;
  PersEvent.OnChange := aChange;

  FPersonalOnChange.add( PersEvent );
end;

procedure THookControlChangeValue.FPrepareOnChangeForControl( aComp:TcxTextEdit );
begin
  FAddNotifyEvent( aComp, aComp.Properties.OnChange );
  aComp.Properties.OnChange := FOnChange;
end;

procedure THookControlChangeValue.FPrepareOnChangeForControl( aComp:TcxExtLookupComboBox );
begin
  FAddNotifyEvent( aComp, aComp.Properties.OnChange );
  aComp.Properties.OnChange := FOnChange;
end;

procedure THookControlChangeValue.FPrepareOnChangeForControl( aComp:TcxRadioButton );
begin
  FAddNotifyEvent( aComp, aComp.OnClick );
  aComp.OnClick := FOnChange;
end;

procedure THookControlChangeValue.FPrepareOnChangeForControl( aComp:TcxCheckListBox );
begin
  FAddNotifyEvent( aComp, aComp.OnClick );
  aComp.OnClick := FOnChange;
end;

procedure THookControlChangeValue.FPrepareOnChangeForControl( aComp:TcxCheckBox );
begin
  FAddNotifyEvent( aComp, aComp.OnClick );
  aComp.OnClick := FOnChange;
end;

procedure THookControlChangeValue.FPrepareOnChangeForControl( aComp:TComboBoxEx );
begin
  FAddNotifyEvent( aComp, aComp.OnChange );
  aComp.OnChange := FOnChange;
end;

procedure THookControlChangeValue.FPrepareOnChangeForControl( aComp:TcxImage );
begin
  FAddNotifyEvent( aComp, aComp.Properties.OnChange );
  aComp.Properties.OnChange := FOnChange;
end;

procedure THookControlChangeValue.FPrepareOnChangeForControl( aComp:TcxDateEdit );
begin
  FAddNotifyEvent( aComp, aComp.Properties.OnChange );
  aComp.Properties.OnChange := FOnChange;
end;

procedure THookControlChangeValue.FPrepareOnChangeForControl( aComp:TcxImageComboBox );
begin
  FAddNotifyEvent( aComp, aComp.Properties.OnChange );
  aComp.Properties.OnChange := FOnChange;
end;

procedure THookControlChangeValue.FPrepareOnChangeForControl( aComp:TcxComboBox );
begin
  FAddNotifyEvent( aComp, aComp.Properties.OnChange );
  aComp.Properties.OnChange := FOnChange;
end;

procedure THookControlChangeValue.FPrepareOnChangeForControl( aComp: TcxMemo );
begin
  FAddNotifyEvent( aComp, aComp.Properties.OnChange );
  aComp.Properties.OnChange := FOnChange;
end;

function THookControlChangeValue.FFindEventPersonal( Sender: TObject ):PRecEventPersonal;
var i:integer;
begin
  result := nil;
  for i:=0 to FPersonalOnChange.Count-1 do
  begin
    if PRecEventPersonal( FPersonalOnChange.Items[i] )^.Control = Sender then
    begin
      result :=PRecEventPersonal( FPersonalOnChange.Items[i] );
      Break;
    end;
  end;
end;

procedure THookControlChangeValue.FOnChange( Sender: TObject );
var EventPersonal : PRecEventPersonal;
begin
  EventPersonal := FFindEventPersonal( Sender );
  if EventPersonal <> nil then
    if @EventPersonal.OnChange <> nil then EventPersonal.OnChange( Sender );
  FChange := True;

  FCurrChange := EventPersonal;
  if @FFunctRefresh <> nil then FFunctRefresh(Sender);
end;

procedure THookControlChangeValue.FInitComponents( aControl:TComponent );
var i:integer;
begin
  for i:=0 to aControl.ComponentCount-1 do
  begin
    if aControl.Components[i].Tag <> -1 then
    begin
      if aControl.Components[i] is TcxTextEdit then FPrepareOnChangeForControl( TcxTextEdit(aControl.Components[i]) );
      if aControl.Components[i] is TcxExtLookupComboBox then FPrepareOnChangeForControl( TcxExtLookupComboBox(aControl.Components[i]) );
      if aControl.Components[i] is TcxRadioButton then FPrepareOnChangeForControl( TcxRadioButton(aControl.Components[i]) );
      if aControl.Components[i] is TcxCheckListBox then FPrepareOnChangeForControl( TcxCheckListBox(aControl.Components[i]) );
      if aControl.Components[i] is TcxCheckBox then FPrepareOnChangeForControl( TcxCheckBox(aControl.Components[i]) );
      if aControl.Components[i] is TComboBoxEx then FPrepareOnChangeForControl( TComboBoxEx(aControl.Components[i]) );
      if aControl.Components[i] is TcxImage then FPrepareOnChangeForControl( TcxImage(aControl.Components[i]) );
      if aControl.Components[i] is TcxDateEdit then FPrepareOnChangeForControl( TcxDateEdit(aControl.Components[i]) );
      if aControl.Components[i] is TcxImageComboBox then FPrepareOnChangeForControl( TcxImageComboBox(aControl.Components[i]) );
      if aControl.Components[i] is TcxComboBox then FPrepareOnChangeForControl( TcxComboBox(aControl.Components[i]) );
      if aControl.Components[i] is TcxMemo then FPrepareOnChangeForControl( TcxMemo(aControl.Components[i]) );
    end;
   end;
end;

procedure THookControlChangeValue.FRestoreSelfEvent( EventPersonal : PRecEventPersonal );
begin
   if PRecEventPersonal( EventPersonal ).Control is TcxTextEdit then TcxTextEdit( PRecEventPersonal( EventPersonal ).Control ).Properties.OnChange := PRecEventPersonal( EventPersonal ).OnChange;
   if PRecEventPersonal( EventPersonal ).Control is TcxExtLookupComboBox then TcxExtLookupComboBox( PRecEventPersonal( EventPersonal ).Control ).Properties.OnChange := PRecEventPersonal( EventPersonal ).OnChange;
   if PRecEventPersonal( EventPersonal ).Control is TcxRadioButton then TcxRadioButton( PRecEventPersonal( EventPersonal ).Control ).OnClick := PRecEventPersonal( EventPersonal ).OnChange;
   if PRecEventPersonal( EventPersonal ).Control is TcxCheckListBox then TcxCheckListBox( PRecEventPersonal( EventPersonal ).Control ).OnClick := PRecEventPersonal( EventPersonal ).OnChange;
   if PRecEventPersonal( EventPersonal ).Control is TcxCheckBox then TcxCheckBox( PRecEventPersonal( EventPersonal ).Control ).OnClick := PRecEventPersonal( EventPersonal ).OnChange;
   if PRecEventPersonal( EventPersonal ).Control is TComboBoxEx then TComboBoxEx( PRecEventPersonal( EventPersonal ).Control ).OnChange := PRecEventPersonal( EventPersonal ).OnChange;
   if PRecEventPersonal( EventPersonal ).Control is TcxImage then TcxImage( PRecEventPersonal( EventPersonal ).Control ).Properties.OnChange := PRecEventPersonal( EventPersonal ).OnChange;
   if PRecEventPersonal( EventPersonal ).Control is TcxDateEdit then TcxDateEdit( PRecEventPersonal( EventPersonal ).Control ).Properties.OnChange := PRecEventPersonal( EventPersonal ).OnChange;
   if PRecEventPersonal( EventPersonal ).Control is TcxImageComboBox then TcxImageComboBox( PRecEventPersonal( EventPersonal ).Control ).Properties.OnChange := PRecEventPersonal( EventPersonal ).OnChange;
   if PRecEventPersonal( EventPersonal ).Control is TcxComboBox then TcxComboBox( PRecEventPersonal( EventPersonal ).Control ).Properties.OnChange := PRecEventPersonal( EventPersonal ).OnChange;
   if PRecEventPersonal( EventPersonal ).Control is TcxMemo then TcxMemo( PRecEventPersonal( EventPersonal ).Control ).Properties.OnChange := PRecEventPersonal( EventPersonal ).OnChange;
end;

procedure THookControlChangeValue.FDestroyPersonalProp;
var i:integer;
begin
  for i:=0 to FPersonalOnChange.Count-1 do
  begin
    FRestoreSelfEvent( FPersonalOnChange.Items[i] );
    Dispose( FPersonalOnChange.Items[i] );
  end;
end;


end.
 