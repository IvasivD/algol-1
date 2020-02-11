{**************************************************************************************}
{                                                                                      }
{ CCR Exif - Delphi class library for reading and writing Exif metadata in JPEG files  }
{ Version 1.5.2 beta                                                                   }
{                                                                                      }
{ The contents of this file are subject to the Mozilla Public License Version 1.1      }
{ (the "License"); you may not use this file except in compliance with the License.    }
{ You may obtain a copy of the License at http://www.mozilla.org/MPL/                  }
{                                                                                      }
{ Software distributed under the License is distributed on an "AS IS" basis, WITHOUT   }
{ WARRANTY OF ANY KIND, either express or implied. See the License for the specific    }
{ language governing rights and limitations under the License.                         }
{                                                                                      }
{ The Original Code is TimeShiftForm.pas.                                              }
{                                                                                      }
{ The Initial Developer of the Original Code is Chris Rolliston. Portions created by   }
{ Chris Rolliston are Copyright (C) 2009-2012 Chris Rolliston. All Rights Reserved.    }
{                                                                                      }
{**************************************************************************************}

unit ExifTimeEditForm;

{
  Based on the TimeShift Demo, enhanced by Fr0sT.
    * Now you can adjust dates much more flexibly, i.e. shift the necessary date part
      (year/month/day/hour/minute/second) by a value or just set the date part
      to a value you input.
    * Process large numbers of files without application hang.
    * Processed files remain in the list with changed props, so you can continue
      adjusting
    * Press Ctrl-A to select all items, Del to remove selected items
    * Determine time shift tool: calculate time shift between selected file's EXIF
      timestamp and the timestamp you input.
  Possible use cases:
    * Correct timestamps if your camera's clocks are late by several minutes
    * Correct timestamps to the local time zone if you forgot to adjust your camera clocks in a trip
    * Correct timestamps if you had your camera's clocks cleared to factory defaults
      (usually this means complete difference with current timestamp)
    * Set last-modified property of a file to EXIF timestamp
  Please keep in mind leap years and the day of 29/02 when changing year/month date parts!
}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Vcl.Dialogs,
  StdCtrls, ExtCtrls, ToolWin, ComCtrls, Menus, ActnList, ImgList, Vcl.ExtDlgs,
  {$IF CompilerVersion >= 23}System.UITypes,{$IFEND} ShellApi, DateUtils,
  Registry, Vcl.Buttons,
  CCR.Exif.BaseUtils, CCR.Exif,
  DetermineShiftForm, DateParts;

type
  TListView = class(ComCtrls.TListView) //OK, using an interposer class is a bit lazy,
  protected                             //but this isn't a big app...
    procedure WMDropFiles(var Message: TWMDropFiles); message WM_DROPFILES;
  end;

  TfrmExifTimeEdit = class(TForm)
    lvFiles: TListView;
    imlColor: TImageList;
    ActionList: TActionList;
    actAdd: TAction;
    actRemove: TAction;
    actProcess: TAction;
    dlgOpen: TOpenPictureDialog;
    actFileTimeOpts: TAction;
    imlDisabled: TImageList;
    panOptions: TPanel;
    ToolBar: TToolBar;
    btnAdd: TToolButton;
    btnRemove: TToolButton;
    sep1: TToolButton;
    btnProcess: TToolButton;
    GroupBox1: TGroupBox;
    btnDetermineShift: TToolButton;
    StaticText1: TStaticText;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    cbFileDateTime: TComboBox;
    cbEXIFDateTime: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    cbEXIFOrigDigit: TComboBox;
    cbDatePart: TComboBox;
    cbAction: TComboBox;
    eNumber: TEdit;
    updNumber: TUpDown;
    GroupBox2: TGroupBox;
    rgErrors: TRadioGroup;
    rgAbsentEXIF: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure actRemoveUpdate(Sender: TObject);
    procedure actRemoveExecute(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure actProcessUpdate(Sender: TObject);
    procedure actProcessExecute(Sender: TObject);
    procedure edtNumberKeyPress(Sender: TObject; var Key: Char);
    procedure lvFilesDeletion(Sender: TObject; Item: TListItem);
    procedure lvFilesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDetermineShiftClick(Sender: TObject);
    procedure cbEXIFOrigDigitChange(Sender: TObject);
  private
    procedure OpenFile(FilePath: string);
    procedure OpenFiles(Files: TStrings);
    procedure ProcessFiles;
    procedure UpdListItem(DataPatcher: TExifDataPatcher; Item: TListItem);
    procedure EnableControls(Enable: Boolean);
  end;

var
  frmExifTimeEdit: TfrmExifTimeEdit;

implementation

{$R *.dfm}

resourcestring
  SMsgReadOnlyFile = 'Cannot get write access to read-only file "%s":'#13#10'%s.'#13#10'Skipping.';
  SMsgShitHappened = 'Shit happened';
  SMsgShiftOptionsNotSet = 'Some of shift options hasn''t been set';
  SMsgNothingToDo = 'Nothing to do';
  SMsgTimestampsMissing = 'Both Original and Digitized timestamps are empty.';
  SMsgErrorProcessing = 'Error modifying file "%s":'#13#10'%s.'#13#10'Skip?';
  SMsgEXIFAdditionNeeded = 'Warning for file "%s":'#13#10+
    'one or more EXIF fields need to be added. This will require file rewriting instead of usual patching.'#13#10+
    'Proceed with rewriting?'#13#10+
    '   YES - add fields with rewriting.'#13#10+
    '   NO - skip additional fields.';
  SFormLabel = 'EXIF Date/Time Editor';
  SLblProgressOpen = 'Opening: (%d / %d)';
  SLblProgressProcessing = 'Processing: (%d / %d)';
  SHint_cbFileDateTime = 'File date/time is a file property (not metadata). Useful for sorting with file managers';
  SHint_cbEXIFDateTime = 'EXIF date/time field holds a timestamp of the last image modification';
  SHint_btnDetermineShift = 'Determine shift value.'#13#10+
                            'Use this tool if you have a file with wrong timestamps but'#13#10+
                            'you know what they should be';
  SHint_cbEXIFOrigDigit = 'Select whether modify EXIF fields DateTimeOriginal and DateTimeDigitized or not';
  SHint_cbDatePart = 'Select date part to shift (Year/Month/Day/...)';
  SHint_cbAction = 'Select action to perform (add/substract/set)';

type
  TTimestampAction = (ftKeep, ftMatchExif, ftSetToNow);
  TProcessAction = (paAsk, paSkip, paDo);

const
  RegPath = 'Software\CCR';
  ActionLabels: array[0..2] of Char =
    ('+', '-', '=');

{ TListView }

procedure TListView.WMDropFiles(var Message: TWMDropFiles);
var
  I: Integer;
  Buffer: array[0..MAX_PATH] of Char;
  FileName: string;
  Files: TStringList;
begin
  Files := TStringList.Create;
  try
    for I := 0 to DragQueryFile(HDROP(Message.Drop), $FFFFFFFF, nil, 0) - 1 do
    begin
      SetString(FileName, Buffer, DragQueryFile(HDROP(Message.Drop), I, Buffer,
        Length(Buffer)));
      Files.Add(FileName);
    end;
    frmExifTimeEdit.OpenFiles(Files);
  finally
    DragFinish(HDROP(Message.Drop));
    FreeAndNil(Files);
  end;
end;

{ TfrmTimeShiftDemo }

procedure TfrmExifTimeEdit.FormCreate(Sender: TObject);
var
  IntVal: Integer;
  BoolVal: Boolean;
  s: string;
  Files: TStringList;
begin
  // visual init
  Caption := SFormLabel;
  Application.Title := SFormLabel;
  cbFileDateTime.Hint := SHint_cbFileDateTime;
  cbEXIFDateTime.Hint := SHint_cbEXIFDateTime;
  cbEXIFOrigDigit.Hint := SHint_cbEXIFOrigDigit;
  btnDetermineShift.Hint := SHint_btnDetermineShift;
  cbDatePart.Hint := SHint_cbDatePart;
  cbAction.Hint := SHint_cbAction;

  with TRegIniFile.Create(RegPath) do
  try
    IntVal := ReadInteger(Application.Title, 'FileTimeAction', 0);
    if TTimestampAction(IntVal) in [Low(TTimestampAction)..High(TTimestampAction)] then
      cbFileDateTime.ItemIndex := IntVal;
    IntVal := ReadInteger(Application.Title, 'EXIFTimeAction', 0);
    if TTimestampAction(IntVal) in [Low(TTimestampAction)..High(TTimestampAction)] then
      cbEXIFDateTime.ItemIndex := IntVal;
    BoolVal := ReadBool(Application.Title, 'EXIFOrigDigitModify', False);
    if BoolVal
      then cbEXIFOrigDigit.ItemIndex := 1
      else cbEXIFOrigDigit.ItemIndex := 0;
    cbEXIFOrigDigit.OnChange(cbEXIFOrigDigit); // imitate change

    IntVal := ReadInteger(Application.Title, 'ErrorAction', 0);
    if TTimestampAction(IntVal) in [Low(TTimestampAction)..High(TTimestampAction)] then
      rgErrors.ItemIndex := IntVal;
    IntVal := ReadInteger(Application.Title, 'AbsentEXIFAction', 0);
    if TTimestampAction(IntVal) in [Low(TTimestampAction)..High(TTimestampAction)] then
      rgAbsentEXIF.ItemIndex := IntVal;
  finally
    Free;
  end;

  DragAcceptFiles(lvFiles.Handle, True);
  //prevent list view flicker if running on Vista or above
  if Win32MajorVersion >= 6 then lvFiles.DoubleBuffered := True;
  // fixup the toolbar
  updNumber.HandleNeeded;
  // fill combobox items
  for s in ActionLabels do
    cbAction.Items.Add(s);
  for s in DatePartLabels do
    cbDatePart.Items.Add(s);

  // load files from command line
  Files := TStringList.Create;
  try
    for IntVal := 1 to ParamCount do
      Files.Add(ParamStr(IntVal));
    OpenFiles(Files);
  finally
    FreeAndNil(Files);
  end;
end;

procedure TfrmExifTimeEdit.FormClose(Sender: TObject; var Action: TCloseAction);
var
  RegIniFile: TRegIniFile;
begin
  RegIniFile := nil;
  try
    RegIniFile := TRegIniFile.Create(RegPath);
    RegIniFile.WriteInteger(Application.Title, 'FileTimeAction', cbFileDateTime.ItemIndex);
    RegIniFile.WriteInteger(Application.Title, 'EXIFTimeAction', cbEXIFDateTime.ItemIndex);
    RegIniFile.WriteBool(Application.Title, 'EXIFOrigDigitModify', cbEXIFOrigDigit.ItemIndex = 1);
    RegIniFile.WriteInteger(Application.Title, 'ErrorAction', rgErrors.ItemIndex);
    RegIniFile.WriteInteger(Application.Title, 'AbsentEXIFAction', rgAbsentEXIF.ItemIndex);
  finally
    RegIniFile.Free;
  end;
end;

// Open one file and add it to the listview
procedure TfrmExifTimeEdit.OpenFile(FilePath: string);
var
  DataPatcher: TExifDataPatcher;
  Item: TListItem;
begin
  if FileIsReadOnly(FilePath) then // we can't open a read-only file with read/write access obviously
    // try to make file RW
    if not FileSetReadOnly(FilePath, False) then
    begin
      MessageDlg(Format(SMsgReadOnlyFile, [FilePath, SysErrorMessage(GetLastError)]), mtError, [mbOK], 0);
      Exit;
    end;

  try
    DataPatcher := TExifDataPatcher.Create(FilePath);
  except
    on E: EInvalidJPEGHeader do     //If it's just that a certain file isn't a JPEG or
    begin                           //is corrupt, we still want to continue with any
      Application.ShowException(E); //other filenames we have been requested to process.
      Exit;
    end
    else
      raise;
  end;
  Item := lvFiles.Items.Add;
  Item.Data := DataPatcher;
  Item.Caption := ExtractFileName(FilePath);
  Item.SubItems.Add('');
  Item.SubItems.Add('');
  Item.SubItems.Add('');
  Item.SubItems.Add('');
  UpdListItem(DataPatcher, Item);
end;

// Open & add all the files from given list.
// Shows progress label and refreshes form view during the cycle
procedure TfrmExifTimeEdit.OpenFiles(Files: TStrings);
var
  S: string;
  Counter: Integer;
begin
  if Files.Count = 0 then Exit;
  Counter := 0;
  EnableControls(False);  // ! disable the panel to avoid unneeded user input while doing the job
  try
    for S in Files do
    begin
      OpenFile(S);
      Inc(Counter);
      // visual refresh each 10 iterations
      if Counter mod 10 <> 0 then Continue;
      Caption := Format(SLblProgressOpen, [Counter, Files.Count]);
      Application.ProcessMessages;
    end;
  finally
    Caption := SFormLabel;
    EnableControls(True);
  end;
end;

// Do main job
procedure TfrmExifTimeEdit.ProcessFiles;
var
  ChangeAction: TDateChangeAction;
  DatePart: TDatePart;
  Number: Integer;

// If a given DateTime is valid, change it according to settings.
// Uses external variables:
//   [R] ChangeAction, DatePart, Number
function DoChangeTime(const DateTime: TDateTimeTagValue): TDateTimeTagValue;
begin
  if DateTime.MissingOrInvalid then Exit(Datetime);
  Result := ChangeDate(ChangeAction, DatePart, Number, DateTime.Value);
end;

var
  DataPatcher: TCustomExifData;
  I, ErrReply: Integer;
  EXIFOrigDigitLeave, EXIFAddNeeded, DoEXIFAdd: Boolean;
  ValidTimestamp: TDateTimeTagValue;
  FileDtAction, ExifDtAction: TTimestampAction;
  ErrorsAction, EXIFAction: TProcessAction;
  FileName: string;
  FileDateTime: TDateTime;
  DateTime: TDateTimeInfoRec;
begin
  // Get and check current options
  FileDtAction := TTimestampAction(cbFileDateTime.ItemIndex);
  if not (FileDtAction in [Low(TTimestampAction)..High(TTimestampAction)]) then
    raise Exception.Create(SMsgShitHappened);
  ExifDtAction := TTimestampAction(cbEXIFDateTime.ItemIndex);
  if not (ExifDtAction in [Low(TTimestampAction)..High(TTimestampAction)]) then
    raise Exception.Create(SMsgShitHappened);
  // Shift options
  EXIFOrigDigitLeave := cbEXIFOrigDigit.ItemIndex = 0;
  if not EXIFOrigDigitLeave then
  begin
    Number := updNumber.Position;
    case cbAction.ItemIndex of // '+', '-', '='
      0: begin ChangeAction := dcaShift; end;
      1: begin ChangeAction := dcaShift; Number := -Number; end;
      2: begin ChangeAction := dcaSet; end;
      else     ChangeAction := TDateChangeAction(-1);
    end;
    DatePart := TDatePart(cbDatePart.ItemIndex);
    // check if all values are set
    if (DatePart = TDatePart(-1)) or (ChangeAction = TDateChangeAction(-1)) then
      raise Exception.Create(SMsgShiftOptionsNotSet);
  end;
  // Process actions
  ErrorsAction := TProcessAction(rgErrors.ItemIndex);
  if not (ErrorsAction in [Low(TProcessAction)..High(TProcessAction)]) then
    raise Exception.Create(SMsgShitHappened);
  EXIFAction := TProcessAction(rgErrors.ItemIndex);
  if not (EXIFAction in [Low(TProcessAction)..High(TProcessAction)]) then
    raise Exception.Create(SMsgShitHappened);

  // Check if there's something to change
  if (FileDtAction = ftKeep) and (ExifDtAction = ftKeep) and
     ( EXIFOrigDigitLeave or ( (ChangeAction = dcaShift) and (Number = 0) ) ) then
    raise Exception.Create(SMsgNothingToDo);

  // Action!
  EnableControls(False);  // ! disable the panel to avoid unneeded user input while doing the job

  for I := 0 to lvFiles.Items.Count - 1 do
  try
    DataPatcher := lvFiles.Items[I].Data;
    FileName := TExifDataPatcher(DataPatcher).FileName;
    DoEXIFAdd := False;

    // Check if addition of some EXIF fields is needed
    EXIFAddNeeded :=
      (not EXIFOrigDigitLeave   and DataPatcher.DateTimeOriginal.MissingOrInvalid) or
      (not EXIFOrigDigitLeave   and DataPatcher.DateTimeDigitized.MissingOrInvalid) or
      ((ExifDtAction <> ftKeep) and DataPatcher.DateTime.MissingOrInvalid);
    if EXIFAddNeeded then
    begin
      if EXIFAction = paAsk then
        case MessageDlg(Format(SMsgEXIFAdditionNeeded, [TExifDataPatcher(DataPatcher).FileName]),
                        mtWarning,
                        [mbYes, mbYesToAll, mbNo, mbNoToAll],
                        0) of
          mrYes      : DoEXIFAdd := True;
          mrYesToAll : EXIFAction := paDo;
          mrNo       : DoEXIFAdd := False;
          mrNoToAll  : EXIFAction := paSkip;
        end;
      case EXIFAction of
        paAsk  : ; //
        paSkip : DoEXIFAdd := False;
        paDo   : DoEXIFAdd := True;
      end;
    end; // if

    // Will be adding absent EXIF fields - change patcher to TExifData
    if DoEXIFAdd then
    begin
      FreeAndNil(DataPatcher);
      DataPatcher := TExifData.Create;
      try
        TExifData(DataPatcher).LoadFromGraphic(FileName);
      except
        FreeAndNil(DataPatcher);
        DataPatcher := TExifDataPatcher.Create(FileName);
        lvFiles.Items[I].Data := DataPatcher;
        raise;
      end;
    end;

    // change EXIF dates

    // change DateTimeOriginal and DateTimeDigitized
    if not EXIFOrigDigitLeave then
    begin
      // error if both timestamps are missing
      if DataPatcher.DateTimeOriginal.MissingOrInvalid and
         DataPatcher.DateTimeDigitized.MissingOrInvalid then
        raise Exception.Create(SMsgTimestampsMissing);
      // if only one of two timestamps is missing, assign value of other timestamp to it
      // (EXIF addition mode only)
      if DoEXIFAdd then
        if DataPatcher.DateTimeOriginal.MissingOrInvalid then
          DataPatcher.DateTimeOriginal := DataPatcher.DateTimeDigitized
        else
        if DataPatcher.DateTimeDigitized.MissingOrInvalid then
          DataPatcher.DateTimeDigitized := DataPatcher.DateTimeOriginal;
      // shift the timestamps
      DataPatcher.DateTimeOriginal  := DoChangeTime(DataPatcher.DateTimeOriginal);
      DataPatcher.DateTimeDigitized := DoChangeTime(DataPatcher.DateTimeDigitized);
    end;

    // choose valid timestamp (one or both could be absent, we must foresee it)
    ValidTimestamp := DataPatcher.DateTimeOriginal;
    if ValidTimestamp.MissingOrInvalid then
      ValidTimestamp := DataPatcher.DateTimeDigitized;
    // change DateTime
    case ExifDtAction of
      ftKeep      : ; // skip
      ftMatchExif :
        if (DoEXIFAdd or not DataPatcher.DateTime.MissingOrInvalid) and
           not ValidTimestamp.MissingOrInvalid then
          DataPatcher.DateTime := ValidTimestamp;
      ftSetToNow  :
        if (DoEXIFAdd or not DataPatcher.DateTime.MissingOrInvalid) then
          DataPatcher.DateTime := Now;
    end;

    // save file timestamp
    FileGetDateTimeInfo(FileName, DateTime);

    // save changes and set file timestamp

    if DataPatcher is TExifDataPatcher then
      TExifDataPatcher(DataPatcher).UpdateFile
    else
    if DataPatcher is TExifData then
    begin
      TExifData(DataPatcher).SaveToGraphic(FileName);
      // switch back to patcher
      FreeAndNil(DataPatcher);
      DataPatcher := TExifDataPatcher.Create(FileName);
    end;

    case FileDtAction of
      ftKeep      :
        TExifDataPatcher(DataPatcher).FileDateTime := DateTime.TimeStamp;
      ftMatchExif :
        if not ValidTimestamp.MissingOrInvalid then
          TExifDataPatcher(DataPatcher).FileDateTime := ValidTimestamp.Value;
      ftSetToNow  :
        TExifDataPatcher(DataPatcher).FileDateTime := Now;
    end;

    // dislay changes
    lvFiles.Items[I].Data := DataPatcher;
    UpdListItem(TExifDataPatcher(DataPatcher), lvFiles.Items[I]);

    // visual refresh each 10 iterations
    if I mod 10 <> 0 then Continue;
    Caption := Format(SLblProgressProcessing, [I, lvFiles.Items.Count]);
    Application.ProcessMessages;
  except on E: Exception do
    begin
      if ErrorsAction = paAsk then
      begin
        ErrReply :=
          MessageDlg(Format(SMsgErrorProcessing, [FileName, E.Message]),
                     mtWarning,
                     [mbYes, mbYesToAll, mbAbort],
                     0);
        case ErrReply of
          mrYes      : ; // Continue
          mrYesToAll : ErrorsAction := paSkip;
          mrAbort    : ErrorsAction := paDo;
        end;
      end; // if
      case ErrorsAction of
        paAsk  : ; // Continue
        paSkip : ; // Continue
        paDo   : Break;
      end;
    end;
  end; // try & for

  Caption := SFormLabel;
  EnableControls(True);
end;

procedure TfrmExifTimeEdit.EnableControls(Enable: Boolean);
begin
  panOptions.Enabled := Enable;
end;

// Updates visual look of a listview item according to the values of associated DataPatcher
procedure TfrmExifTimeEdit.UpdListItem(DataPatcher: TExifDataPatcher; Item: TListItem);

function DateTimeToText(const DateTime: TDateTimeTagValue): string;
begin
  if DateTime.MissingOrInvalid then
    Result := '<missing>'
  else
    Result := SysUtils.DateTimeToStr(DateTime);
end;

begin
  Item.SubItems[0] := DateTimeToText(DataPatcher.FileDateTime);
  Item.SubItems[1] := DateTimeToText(DataPatcher.DateTime);
  Item.SubItems[2] := DateTimeToText(DataPatcher.DateTimeOriginal);
  Item.SubItems[3] := DateTimeToText(DataPatcher.DateTimeDigitized);
end;

// Free associated object (+ close the file) when deleting an item from the list
procedure TfrmExifTimeEdit.lvFilesDeletion(Sender: TObject; Item: TListItem);
begin
  TExifDataPatcher(Item.Data).Free;
end;

// Process Ctrl-A and Del
procedure TfrmExifTimeEdit.lvFilesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_DELETE:
      actRemove.Execute;
    Word('A'):
      if Shift = [ssCtrl] then
        (Sender as TListView).SelectAll;
  end;
end;

// filter all non-digit keystrokes
procedure TfrmExifTimeEdit.edtNumberKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(Key, ['0'..'9']) then
  begin
    Key := #0;
    Beep;
  end;
end;

// Open dialog and add files
procedure TfrmExifTimeEdit.actAddExecute(Sender: TObject);
begin
  if dlgOpen.Execute then OpenFiles(dlgOpen.Files);
end;

// control the enabled state of "Remove" action
procedure TfrmExifTimeEdit.actRemoveUpdate(Sender: TObject);
begin
  actRemove.Enabled := (lvFiles.SelCount > 0);
end;

procedure TfrmExifTimeEdit.btnDetermineShiftClick(Sender: TObject);
begin
  with TfrmDetermineShift.Create(nil) do
  begin
    if ShowModal = mrOk then
    begin
      cbDatePart.ItemIndex := cbDatePart.Items.IndexOf(DatePartLabels[dpMinute]);
      if ShiftMins > 0 then
        cbAction.ItemIndex := 0
      else if ShiftMins < 0 then
        cbAction.ItemIndex := 1
      else if ShiftMins = 0 then
        cbAction.ItemIndex := 2;
      updNumber.Position := Abs(ShiftMins);
    end;
    Free;
  end;
end;

procedure TfrmExifTimeEdit.cbEXIFOrigDigitChange(Sender: TObject);
begin
  cbAction.Enabled   := TComboBox(Sender).ItemIndex = 1;
  cbDatePart.Enabled := TComboBox(Sender).ItemIndex = 1;
  updNumber.Enabled  := TComboBox(Sender).ItemIndex = 1;
  eNumber.Enabled    := TComboBox(Sender).ItemIndex = 1;
end;

procedure TfrmExifTimeEdit.actProcessUpdate(Sender: TObject);
begin
  actProcess.Enabled := (lvFiles.Items.Count > 0);
  StaticText1.Visible := not (lvFiles.Items.Count > 0);
end;

procedure TfrmExifTimeEdit.actProcessExecute(Sender: TObject);
begin
  ProcessFiles;
end;

// remove selected items from the list
procedure TfrmExifTimeEdit.actRemoveExecute(Sender: TObject);
var
  i, FocusIdx: Integer;
begin
  FocusIdx := lvFiles.ItemFocused.Index;
  // remove
  for i := lvFiles.Items.Count - 1 downto 0 do
    if lvFiles.Items[i].Selected then
      lvFiles.Items[i].Delete;
  // focus & select next item, or the last one
  if lvFiles.Items.Count = 0 then Exit; // do nothing if list is empty
  if FocusIdx >= lvFiles.Items.Count then
    FocusIdx := lvFiles.Items.Count - 1;
  lvFiles.Items[FocusIdx].Selected := True;
  lvFiles.Items[FocusIdx].Focused := True;
end;

end.