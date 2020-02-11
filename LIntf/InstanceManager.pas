unit InstanceManager;
{$WARN SYMBOL_PLATFORM OFF}

interface 

{Notes: make InstanceManager the *very first* unit in your program's USES 
clause.  To take advantage of the notification and launch-string, put a
method with no parameters in one of your forms and assign it to triggerProc. 
Once triggerProc is called, rcvStr contains the command line of the launch 
attempt. 

If the only reaction you want is to bring the first instance to the front, 
just put a method like the following in your main form, and in the form's 
OnCreate set InstanceManager.triggerProc:=ToFront; 

    procedure TForm1.ToFront; 
    begin
      Application.Restore;
      Application.BringToFront;
    end;

If you don't have a dependable main form, make ToFront a class procedure of
any old class.}

{ Customize these constants before using }
const
  UniqueAppName = 'OrderMaster';
  AppNotifyValue: Integer = 0;

var
  RcvStr: string;
  RcvValue: Integer;
  ForbidOtherInstance: Boolean = True;
  TriggerProc: procedure of object;

implementation

uses Windows, SysUtils, Messages; 

{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}

var
 Mutex, ThisWnd: HWND;
 IMWndClass: TWndClassA;
 MustHalt: Boolean;
 CopyData: TCopyDataStruct;

function IMWndProc(HWindow: HWnd; Message, WParam: Longint; LParam: Longint): Longint; stdcall;
begin
  if Message = WM_COPYDATA then
  begin
    RcvStr := StrPas(PCopyDataStruct(LParam).lpData);
    RcvStr := Copy(RcvStr, 1, PCopyDataStruct(LParam).cbData);
    RcvValue := PCopyDataStruct(LParam).dwData;
    if Assigned(TriggerProc) then TriggerProc;
    Result := Ord(ForbidOtherInstance);
  end
  else
    Result := DefWindowProc(hWindow, Message, WParam, LParam);
end;

initialization
  FillChar(IMWndClass, SizeOf(IMWndClass), 0);
  IMWndClass.lpfnWndProc := @IMWndProc;
  IMWndClass.hInstance := HInstance;
  IMwndClass.lpszClassName := 'TInstanceManager';
  if Windows.RegisterClass(IMWndClass) = 0 then RaiseLastOSError;
  Mutex := CreateMutex(nil, True, UniqueAppName);
  {if GetLastError = ERROR_ALREADY_EXISTS then
  begin
    MustHalt := True;
    if WaitForSingleObject(Mutex, 5000) = WAIT_OBJECT_0 then
    begin
      ThisWnd := FindWindow(IMwndClass.lpszClassName, UniqueAppName);
      if ThisWnd = 0 then RaiseLastOSError;
      CopyData.dwData := AppNotifyValue;
      CopyData.lpData := CmdLine;
      CopyData.cbData := StrLen(CmdLine);
      MustHalt := (SendMessage(ThisWnd, WM_COPYDATA, 0, Integer(@CopyData)) > 0);
    end;
    ThisWnd := 0;
    ReleaseMutex(Mutex);
    if MustHalt then Halt;
  end
  else begin
    ThisWnd := CreateWindow(IMwndClass.lpszClassName, UniqueAppName,
      0, 0, 0, 0, 0, 0, 0, HInstance, nil);
    if ThisWnd = 0 then RaiseLastOSError;
    ReleaseMutex(Mutex);
  end;}
  if GetLastError = ERROR_ALREADY_EXISTS then
  begin
    MustHalt := True;
    if WaitForSingleObject(Mutex, 5000) = WAIT_OBJECT_0 then
    begin
      ThisWnd := FindWindow(IMwndClass.lpszClassName, UniqueAppName);
      if ThisWnd <> 0 then
      begin
        CopyData.dwData := AppNotifyValue;
        CopyData.lpData := CmdLine;
        CopyData.cbData := StrLen(CmdLine);
        MustHalt := (SendMessage(ThisWnd, WM_COPYDATA, 0, Integer(@CopyData)) > 0);
      end
      else MustHalt := False;
    end;
    ThisWnd := 0;
    ReleaseMutex(Mutex);
    if MustHalt then Halt;
  end
  else begin
    ThisWnd := CreateWindow(IMwndClass.lpszClassName, UniqueAppName,
      0, 0, 0, 0, 0, 0, 0, HInstance, nil);
    if ThisWnd <> 0 then ReleaseMutex(Mutex);
  end;

finalization
  if ThisWnd > 0 then DestroyWindow(ThisWnd);

end.
