unit TourFiles;

interface

uses Classes, Windows, DragDrop;
{ ShellUtility utilities file names }

const
  fShlRateRoute = 'RouteRate';
  fShlRateHotel = 'RateMast';
  fShlRateInsure = 'InsurRate';
  fShlRateCurrency = 'CurrRead';
  fShlMastRoute = 'RouteMst';
  fShlBrwsTrip = 'TourFerr';
  fShlBrwsRoom = 'TourRoom';
  fShlBrwsExcurs = 'TourExc';
  fShlMastExcurs = 'Excurs';
  fShlBrwsInsure = 'TourInsr';
  fShlBrwsVisa = 'TourVisa';
  fShlBrwsResort = 'TourRsrt';
  fShlBrwsTours = 'TourXtra';
  fShlMastTours = 'Tours';
  fShlMastTemplate = 'Templat';
  fShlMastMnEd = 'TourMnEd';
  fShlBrwsPhns = 'MPhones';
  fShlDictionary = 'TestDict'; //'TourDict';
  fShlMainOrder = 'TourOrdr';
  fShlBrwsOrder = 'OrdrBrws';
  fShlSrchOrder = 'TourSrch';
  fShlPaymOrder = 'OrdrPay';
  fShlBrwsLog = 'TourLog';
  fShlMailSender = 'MailSender';
  fShlFaxMach = 'FaxMen';
  fShlFaxSendNew = 'SendNewFax';
  fShlOffcMoney = 'OrdMoney';
  fShlOffcRepos = 'ReposMst';
  fShlAdminMarket = 'Market';
  fShlAdminTour = 'TourMast';
  fCmdLineOrder = 'Order';
  fShlUpdProg = 'CheckUpd';

{ file names }
const
  fIniFileName = 'TourMan.ini';

{ check for parameter into environment variable }
function GetExeParamExists(const Ident: string): Boolean; overload;
function GetExeCmdLineExists(const CmdLine, Ident: string): Boolean; overload;
{ check for parameter into environment variable and return its value }
function GetExeParamExists(const Ident: string; var Value: string): Boolean; overload;
function GetExeCmdLineExists(const CmdLine, Ident: string; var Value: string): Boolean; overload;
function GetExeParamAsInteger(const Ident: string; Default: Integer = 0): Integer;

function ExtractOnlyFileName(const FileName: string): string;
function GetNewFileName(const aSourceFile: string; aID: Integer = 0): string;
procedure myCopyFile(FileName, aStoreFolder:String);
procedure DropEmptyTargetDrop(Sender: TObject;
  ShiftState: TShiftState; APoint: TPoint; DataAdapter: TDataFormatAdapter;
  const DocFolder: string);
function GetFileNamefromLink(LinkFileName: string): string;
procedure CreateLink(const PathObj, PathLink, Desc, Param: string);
procedure CreateDocFileLink(const PathObj, PathLink: string);
function myGetCountFilesForPath(aPath: string): Integer;

implementation            

uses SysUtils, ActiveX, ExtStream, DragDropFormats, Forms, UnitProc, Dialogs, 
     ShlObj, ShellAPI, ComObj;

{ check for parameter into environment variable and return its value }

function GetNormalParam(const Param: string): string;
begin
  if (Param = '') or (Param[1] in ['-', '/']) then
    Result := Param else Result := '-' + Param;
  Result := AnsiLowerCase(Result);
end;

function GetExeParamExists(const Ident: string): Boolean;
var
  Id: string;
  I: Integer;
begin
  Result := False;
  if Ident = '' then Exit else Id := GetNormalParam(Ident);
  for I := 1 to ParamCount do
    if AnsiLowerCase(ParamStr(I)) = Id then
    begin
      Result := True;
      Break;
    end;
end;

function GetExeCmdLineExists(const CmdLine, Ident: string): Boolean;
var
  Cmd, Par, Id: string;
  P: Integer;
begin
  Result := False;
  Cmd := CmdLine;
  if (Cmd = '') or (Ident = '') then Exit else Id := GetNormalParam(Ident);
  while True do
  begin
    P := LastDelimiter(#32, Cmd);
    if P = 0 then Break;
    Par := Trim(Copy(Cmd, Succ(P), Length(Cmd)));
    Cmd := Trim(Copy(Cmd, 1, Pred(P)));
    if AnsiLowerCase(Par) = Id then
    begin
      Result := True;
      Break;
    end;
  end;
end;

function GetExeParamExists(const Ident: string; var Value: string): Boolean;
var
  Id, Par: string;
  P, I: Integer;
begin
  Result := False;
  Value := '';
  if Ident = '' then
    Exit
  else
    Id := GetNormalParam(Ident);

  for I := 1 to ParamCount do
  begin
    Par := AnsiLowerCase(ParamStr(I));
    P := Pos(Id, Par);
    if P = 1 then
    begin
      Result := True;
      if Length(Id) < Length(Par) then
        Value := Copy(Par, Length(Id) + 1, Length(Par));
      Break;
    end;
  end;
end;

function GetExeCmdLineExists(const CmdLine, Ident: string; var Value: string): Boolean;
var
  Cmd, Par, Id: string;
  P: Integer;
begin
  Result := False;
  Cmd := CmdLine;
  if (Cmd = '') or (Ident = '') then Exit else Id := GetNormalParam(Ident);
  while True do
  begin
    P := LastDelimiter(#32, Cmd);
    if P = 0 then Break;
    Par := Trim(Copy(Cmd, Succ(P), Length(Cmd)));
    Cmd := Trim(Copy(Cmd, 1, Pred(P)));
    P := Pos(Id, Par);
    if P = 1 then
    begin
      Result := True;
      if Length(Id) < Length(Par) then
        Value := Copy(Par, Length(Id) + 1, Length(Par));
      Break;
    end;
  end;
end;

function GetExeParamAsInteger(const Ident: string; Default: Integer = 0): Integer;
var Val: String;
begin
  if GetExeParamExists(Ident, Val) then
    try
      Result := StrToInt(Val);
    except
      Result := Default;
    end
  else Result := Default;
end;

function GetNewFileName(const aSourceFile: string; aID: Integer = 0): string;
  function CreateFileName(const aFileName: string; aId: Integer): string;
  begin  
    Result := Format('%s%s(%d)%s', [ExtractFilePath(aFileName),
      ChangeFileExt(ExtractFileName(aFileName), ''), aID,
      ExtractFileExt(aFileName)]);
  end;
begin
  Result := aSourceFile;   
  if aID > 0 then Result := CreateFileName(Result, aId);  
  if FileExists(Result) then Result := GetNewFileName(aSourceFile, aId + 1)
end;

procedure myCopyFile(FileName, aStoreFolder:String);
var TempDir:string;
begin
  TempDir := ExtractFilePath(Application.ExeName)+'_TempCopyFile\';
  try
    ExistsDir( TempDir );

    MyCopyAndUnBlockFile( FileName , TempDir );
    CopyFile(PAnsiChar(TempDir + ExtractFileName(FileName)), 
      PAnsiChar(GetNewFileName(aStoreFolder + ExtractFileName(FileName))), False)
  finally
    DelDir( TempDir , '*.*' );
  end;
end;

procedure DropEmptyTargetDrop(Sender: TObject;
  ShiftState: TShiftState; APoint: TPoint; DataAdapter: TDataFormatAdapter;
  const DocFolder: string);
var
  FileName, NewFileName: string;
  i: integer;
  Stream: iStream;
  StatStg: TStatStg;
  BufferSize: longInt;
  fs: tfilestream;
  aOut : TExternStream;
  TempDir: string;
begin
  for i := 0 to TVirtualFileStreamDataFormat(DataAdapter.DataFormat).FileNames.Count-1 do
  begin    
    FileName := TVirtualFileStreamDataFormat(DataAdapter.DataFormat).FileNames[i];
    Stream := TVirtualFileStreamDataFormat(DataAdapter.DataFormat).FileContentsClipboardFormat.GetStream(i);    
    if (Stream <> nil) then
    begin
      Stream.Stat(StatStg, STATFLAG_NONAME);
      BufferSize := StatStg.cbSize;      
      aOut := TExternStream.Create(Stream);      
      NewFileName := ExtractFileName(GetNewFileName(DocFolder + FileName));

      TempDir := ExtractFilePath(Application.ExeName)+'_TempStream\';
      try    
        ExistsDir( TempDir );

        fs := tfilestream.create(TempDir + NewFileName, fmCreate);
        try
          fs.copyfrom(aOut, BufferSize);
        finally
          fs.free;
          aOut.Free;
        end;    

        MyCopyAndUnBlockFile( TempDir + NewFileName , TempDir );
        CopyFile(PAnsiChar(TempDir + NewFileName), PAnsiChar(DocFolder + NewFileName), False)
      finally
        DelDir( TempDir , '*.*' );
      end;     
    end;
  end;                                                    
end;

function ExtractOnlyFileName(const FileName: string): string;
begin
  result:=StringReplace(ExtractFileName(FileName),ExtractFileExt(FileName),'',[]);
end;

function GetFileNamefromLink(LinkFileName: string): string;
var
  MyObject: IUnknown;
  MySLink: IShellLink;
  MyPFile: IPersistFile;
  FileInfo: TWin32FINDDATA;
  WidePath: array[0..MAX_PATH] of WideChar;
  Buff: array[0..MAX_PATH] of Char;
begin
  Result := '';
  if (fileexists(Linkfilename) = false) then
    exit;
  MyObject := CreateComObject(CLSID_ShellLink);
  MyPFile := MyObject as IPersistFile;
  MySLink := MyObject as IShellLink;
  StringToWideChar(LinkFileName, WidePath, SizeOf(WidePath));
  MyPFile.Load(WidePath, STGM_READ);
  MySLink.GetPath(Buff, Max_PATH, FileInfo, SLGP_UNCPRIORITY);
  Result := buff;
end;

procedure CreateLink(const PathObj, PathLink, Desc, Param: string);
var
  IObject: IUnknown;
  SLink: IShellLink;
  PFile: IPersistFile;
begin
  IObject := CreateComObject(CLSID_ShellLink);
  SLink := IObject as IShellLink;
  PFile := IObject as IPersistFile;
  with SLink do
  begin
    SetArguments(PChar(Param));
    SetDescription(PChar(Desc));
    SetPath(PChar(PathObj));
  end;
  PFile.Save(PWChar(WideString(PathLink)), FALSE);
end;

procedure CreateDocFileLink(const PathObj, PathLink: string);
begin
  CreateLink(PathObj, Format('%s%s.lnk', [PathLink, ExtractOnlyFileName(PathObj)]), 
    'Створено: ' + Application.Name, '')  
end;

function myGetCountFilesForPath(aPath: string): Integer;
var List: TStringList;
    I: Integer;
begin
  try
    List:=TStringList.Create;
    FindFile(aPath, List, '*.*', 1);
    Result := List.Count;
    for I:=0 to List.Count-1 do
    if List[I] = 'Thumbs.db' then Dec(Result);
  finally
    FreeAndNIl(List);
  end;
end;

end.
