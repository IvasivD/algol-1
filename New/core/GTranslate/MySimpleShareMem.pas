unit MySimpleShareMem;

interface

implementation
uses
  Windows;
const
  ClassName='{92674ACC-3118-4017-AF72-DABCDA0978D5}';
var
 MemMgr, OldMemMgr:TMemoryManager;
  WndClass:TWndClass=(Style:CS_GLOBALCLASS;lpfnWndProc:@MemMgr;lpszClassName:ClassName);
  IsFirst:Boolean;
initialization
  IsFirst:=not GetClassInfo(hInstance,ClassName,WndClass);
  if IsFirst then begin
    GetMemoryManager(TMemoryManager(WndClass.lpfnWndProc^));
    WndClass.hInstance:=hInstance;
    if RegisterClass(WndClass)=0 then begin
      MessageBox(0,'Cannot register class.','MySimpleShareMem',MB_ICONERROR or MB_TASKMODAL);
      Halt;
    end;
  end
  else begin
    GetMemoryManager(OldMemMgr);
    SetMemoryManager(TMemoryManager(WndClass.lpfnWndProc^));
  end;
finalization
  if IsFirst then
    UnregisterClass(ClassName,hInstance)
  else
    SetMemoryManager(OldMemMgr);
end.
