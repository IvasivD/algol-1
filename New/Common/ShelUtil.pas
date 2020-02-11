unit ShelUtil;

interface

function AzShellOutward(Handle: LongWord;
  ExeName, Params, ExePath, Capture: PChar; ShowCommand: Integer): Boolean;
function AzShellUtil(Handle: LongWord;
  ExeName, Params, Capture: PChar; ShowCommand: Integer): LongWord;
function AzEMailSend(Handle: LongWord;
  Address, Copies, Subject, Text, Attachements: PChar): Boolean;
function AzWebBrowse(Handle: LongWord; WebAddress: PChar): Boolean;


implementation

uses Windows, ShellAPI, SysUtils, LibConsts, AzMsgDlg;

function AzShellOutward(Handle: LongWord; ExeName, Params, ExePath, Capture: PChar;
  ShowCommand: Integer): Boolean;
var ExeCapture: String;
begin
  if Length(Capture) = 0 then ExeCapture := ExeName else ExeCapture := Capture;
  Result := ShellExecute(Handle, nil, ExeName, Params, ExePath, ShowCommand) > 32;
  if not Result then
    AzErrorFmtDlg(Handle, PChar(SShelUtilLaunchError), [ExeCapture]);
end;

function AzShellUtil(Handle: LongWord;
  ExeName, Params, Capture: PChar; ShowCommand: Integer): LongWord;
var ExeCapture: String;
begin
  if Length(Capture) = 0 then ExeCapture := ExeName else ExeCapture := Capture;
  Result := ShellExecute(Handle, nil, ExeName, Params, nil, ShowCommand);
  if Result <= 32 then
    AzErrorFmtDlg(Handle, PChar(SShelUtilLaunchError), [ExeCapture]);
end;

function AzEMailSend(Handle: LongWord; Address, Copies, Subject, Text, Attachements: PChar): Boolean;
begin
  if (Attachements <> nil) and (StrLen(Attachements) > 0) then
    AzErrorDlg(Handle, PChar(SShellUtilErrorAttachNotSupported));
  Result := AzShellOutward(Handle,
    PChar(Format('mailto:%s?cc=%s&subject=%s&text=%s', [Address, Copies, Subject, Text])),
    nil, nil, Address, SW_SHOWNORMAL);
end;

function AzWebBrowse(Handle: LongWord; WebAddress: PChar): Boolean;
begin
  Result := (WebAddress = nil) or (
    AzShellUtil(Handle, 'explorer.exe',
      PChar('/n/maximize,' + AnsiQuotedStr(WebAddress, '"')),
      WebAddress, SW_SHOWNORMAL) > 32)
    or AzShellOutward(Handle, WebAddress, nil, nil, WebAddress, SW_SHOWNORMAL);
end;

end.
