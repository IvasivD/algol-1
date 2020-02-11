unit About;

interface

uses Windows, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, jpeg, ComCtrls;

type
  TAboutBox = class(TForm)
    InfoPanel: TPanel;
    ProgramIcon: TImage;
    ProductName1: TLabel;
    VersionLabel: TLabel;
    CopyrightLabel: TLabel;
    CommentsLabel: TLabel;
    ProductName: TLabel;
    BitBtn1: TBitBtn;
    RightLabel: TLabel;
    UsLabel: TLabel;
    CoLabel: TLabel;
    SpecVerLabel: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ProgramIconDblClick(Sender: TObject);
    procedure CommentsLabelClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    procedure LoadAboutPict;
    procedure LoadUserInfo;
    procedure LoadVersionInfo;
  end;

{var
  AboutBox: TAboutBox;}

procedure ShowAboutBox;


implementation

uses SysUtils, TourCmnlIf, TourConsts;

{$R *.DFM}

procedure ShowAboutBox;
begin
  with TAboutBox.Create(Application) do
    try
      ShowModal;
    finally
      Free;
    end;
end;

function GetInfo(var User, Comp: String): Boolean;   // чомусь не працює
var
  hInstUser: Word;
  Buffer: array[0..30] of Char;
begin
  hInstUser := LoadLibrary('USER.DLL');
  if hInstUser = 0 then hInstUser := LoadLibrary('user32.dll');
  Result := hInstUser <> 0;
  if Result then
  begin
    LoadString(hInstUser, 514, Buffer, 30);
    User := StrPas(Buffer);	// Имя пользователя
    LoadString(hInstUser, 515, Buffer, 30);
    Comp := StrPas(Buffer);	// Компания
  end;
  FreeLibrary(hInstUser);
end;

{ TAboutBox }

procedure TAboutBox.LoadAboutPict;
var
  LgRes, LgSize: Integer;
  LgResP: Pointer;
  LgMem: TMemoryStream;
begin
  Application.ProcessMessages;
  LgRes := FindResource(HInstance, 'TMAPPLG', RT_RCDATA);
  if LgRes <> 0 then
  begin
    LgSize := SizeofResource(HInstance, LgRes);
    LgRes := LoadResource(HInstance, LgRes);
    if LgRes <> 0 then
    begin
      LgResP := LockResource(LgRes);
      if LgResP <> nil then
      begin
        LgMem := TMemoryStream.Create;
        with LgMem do
        begin
          Write(LgResP^, LgSize);
          Seek(0, soFromBeginning);
          ProgramIcon.Picture.Graphic := TJPEGImage.Create;
          ProgramIcon.Picture.Graphic.LoadFromStream(LgMem);
          Free;
        end;
        UnlockResource(LgRes);
      end;
      FreeResource(LgRes);
    end;
  end;
end;

procedure TAboutBox.LoadUserInfo;
var User, Comp: String;
begin
  if GetInfo(User, Comp) then
  begin
    UsLabel.Caption := User;
    CoLabel.Caption := Comp;
    RightLabel.Show;
    UsLabel.Show;
    CoLabel.Show;
  end;
end;

procedure TAboutBox.LoadVersionInfo;
var
  Size, Size2: DWord;
  Pt, Pt2: Pointer;
begin
  Size := GetFileVersionInfoSize(PChar(Application.ExeName), Size2);
  if Size > 0 then
  begin
    GetMem (Pt, Size);
    try
       GetFileVersionInfo(PChar(Application.ExeName), 0, Size, Pt);
       // show the fixed information
       VerQueryValue(Pt, '\StringFileInfo\042204E3\ProductVersion', Pt2, Size2);
       VersionLabel.Caption := 'Version ' + PChar(Pt2);
       VerQueryValue(Pt, '\StringFileInfo\042204E3\LegalCopyright', Pt2, Size2);
       CopyrightLabel.Caption := PChar(Pt2);
       VerQueryValue (Pt, '\', Pt2, Size2);
       with TVSFixedFileInfo(Pt2^) do
       begin
         if (dwFileFlagsMask and dwFileFlags and VS_FF_PRERELEASE) <> 0 then
           with VersionLabel do Caption := Caption + ' beta';
         with SpecVerLabel do
         begin
           if (dwFileFlagsMask and dwFileFlags and VS_FF_PRIVATEBUILD) <> 0 then
             Caption := 'Private Build';
           if Caption <> '' then Caption := Caption + #13;
           if (dwFileFlagsMask and dwFileFlags and VS_FF_SPECIALBUILD) <> 0 then
             Caption := 'Special Build';
         end;
       end;
    finally
      FreeMem (Pt);
    end;
  end;
end;

procedure TAboutBox.FormCreate(Sender: TObject);
begin
  LoadAboutPict;
  LoadUserInfo;
  LoadVersionInfo;
  Caption := Copy(Caption, 1, 4) + Application.Title;
end;

procedure TAboutBox.ProgramIconDblClick(Sender: TObject);
var
  Exe: String;
  I: Integer;
begin
  Exe := Application.HelpFile;
  Exe := ExtractFilePath(ExpandFileName(Exe)) + ChangeFileExt(ExtractFileName(Exe), '.DAT');
  if (Exe = '') or (Screen.Width < 899) or not FileExists(Exe) then Exit;
  for I := Width to 899 do
  begin
    Width := Width + 1;
    if Odd(Width) then Left := Left - 1;
  end;
  with TAnimate.Create(Self) do
  begin
    Parent := InfoPanel;
    Top := 34;
    Left := 280;
    Repetitions := 3;
    Timers := True;
    try
      FileName := Exe;
      Active := True;
    except
      Visible := False;
      Self.Width := 431;
      Self.Position := poScreenCenter;
    end;
  end;
end;

procedure TAboutBox.CommentsLabelClick(Sender: TObject);
begin
  EMailSend(CommentsLabel.Caption, '', 'About program', SAboutAboutMessage, '');
end;

procedure TAboutBox.Button1Click(Sender: TObject);
begin
  //mciSendString('Set cdaudio door open', nil, 0, Handle);
end;

procedure TAboutBox.Button2Click(Sender: TObject);
begin
  //mciSendString('Set cdaudio door closed', nil, 0, Handle);
end;

end.

