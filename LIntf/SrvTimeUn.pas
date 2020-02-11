unit SrvTimeUn;

interface

function IsServiceWorkTimeEnabled(WorkTime: TDateTime; ForeTime: Integer = 1): Boolean;
function IsBackupPromptTime(WorkTime: TDateTime): Boolean;
procedure ClearBackupPrompts;

implementation

uses SysUtils, TourCmnlIf, TourConsts;

const
  nBackupExecuteHours = [8, 14, 20];
  nBackupPromptCount = 4;
  nBackupPromptMinutes: array[0..nBackupPromptCount - 1] of Word =
    (55, 56, 57, 58);

var
  BackupPrompts: array[0..nBackupPromptCount - 1] of Boolean =
    (False, False, False, False);

function IsServiceWorkTimeEnabled(WorkTime: TDateTime; ForeTime: Integer = 1): Boolean;
var Hour, Min, Sec, MSec: Word;
begin
  DecodeTime(WorkTime, Hour, Min, Sec, MSec);
  Result := not (
    (Hour in [1, 2, 5]) and (Min in [(30 - ForeTime)..34])
    or (Succ(Hour) in nBackupExecuteHours) and (Min >= 60 - ForeTime)
    or (Hour in nBackupExecuteHours) and (Min in [0..4]));
end;

procedure ClearBackupPrompts;
var I: Integer;
begin
  for I := 0 to nBackupPromptCount - 1 do BackupPrompts[I] := False;
end;

function IsBackupPromptTime(WorkTime: TDateTime): Boolean;
var
  Hour, Min, Sec, MSec: Word;
  I: Integer;
begin
  DecodeTime(WorkTime, Hour, Min, Sec, MSec);
  Result := False;
  if Succ(Hour) in nBackupExecuteHours then
  begin
    if (Min = nBackupPromptMinutes[0]) and BackupPrompts[nBackupPromptCount - 1]
    then ClearBackupPrompts;
    for I := 0 to nBackupPromptCount - 1 do
      if (Min = nBackupPromptMinutes[I]) and not BackupPrompts[I] then
      begin
        ShellUtil('net', STourSrvNetSendMsg, '');
        BackupPrompts[I] := True;
        Break;
      end;
  end;
end;

end.
