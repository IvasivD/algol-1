unit AntiTrial;

interface

implementation
uses windows;
const
  WndClassName = 'TAppBuilder';

var
  HWindow: HWnd;
  WndClass: TWndClass;
initialization
  fillchar(wndclass, sizeof(twndclass), #0);
  with WndClass do
  begin
    style := 0;
    lpFnWndProc := @DefWindowProc;
    cbClsExtra := 0;
    cbWndExtra := 0;
    hIcon := LoadIcon(0, idi_Application);
    hCursor := LoadCursor(0, idc_Arrow);
    hbrBackground := GetStockObject(white_Brush);
    lpszMenuName := '';
    lpszClassName := WndClassName;
  end;
  wndclass.hInstance := Hinstance;
  if RegisterClass(WndClass) = 0 then
    Halt(255);
  HWindow := CreateWindowEx(0, WndClassName, 'Delphi 5 - AntiTrial',
    ws_OverlappedWindow, 0, 0, 0, 0, 0, 0, Hinstance, nil);
finalization
  DestroyWindow(HWindow);
  UnRegisterClass(WndClassName, hinstance);
end. 
