unit DocFileUn;

interface

uses Graphics, DBTables, Windows,IBQuery;

{ image sizes }
const
  nImgWebMaxWidth = 640;
  nImgWebMaxHeight = 480;
  nImgWebMinWidth = 400;
  nImgWebMinHeight = 300;
  nImgWebQuality = 75;
  nGroupLogoImageWidth = 258;
  nGroupLogoImageHeight = 145;

{ web store folders }
const
  sWebStoreFolder = '\\dwarf\HotelImages';
  sWebStoreDriverFolder = '\\dwarf\DriveImages';
  sWebStoreInterestFolder = '\\dwarf\InterestImages';
  sWebStoreNaturObjectFolder = '\\dwarf\NaturobjectImages';
  sWebStoreResortFolder = '\\dwarf\ResortImages';
  sWebStoreInfraFolder = '\\dwarf\InfrastructureImages';
  nStoreHotelFolder = 0;
  nStoreIntrstFolder = 1;

  sStoreHotelFolder = 'Hotel';
  sStoreIntrstFolder = 'Leisure';
  sContracts = 'DocStore\Contracts';
  sPartners_Docs = 'DocStore\PartnersDocs';
  sNaturObjects = 'NaturObjects';
  sInterests = 'Interests';
  sResorts = 'Resorts';
  sInfrastructures = 'Infrastructures';
//Hotel Images
  HtlAllImage = -1;
  HtlImage = 0;
  HtlBuildImage = 1;
  HtlRoomImage = 2;  
  
function GetWebStoreFolder(ObjectKind: Integer): String;

{ hotel group logo routines }
function GetGroupLogoFileFolder: String;
function GetGroupLogoFileName(const FileName: String): String;
procedure GetGroupLogo(const FileName: String; Picture: TPicture);
{ open connection to web store folder }
function OpenWebStoreFolder(const WebStoreFolder: string): Boolean;
{ close connection to web store folder }
function CloseWebStoreFolder(const WebStoreFolder: string): Boolean;

{ Image web copy routines }
function CheckImageFileSize(const ImageFile: String): Boolean;
function GetImageWebFolder(HotelId: Integer; const FileNime: String): String;
function ImageWebCopyCreate(
  HotelId: Integer; const FN, ExtraPath, WebStoreFolder: String;
  CopyWidth, CopyHeight: Integer; ForceCreate: Boolean = True): Boolean;
function ImageWebCopyDelete(HotelId: Integer; const FN, ExtraPath, WebStoreFolder: String): Boolean;
procedure ToggleImageWebCopies(
  const CategFldr, CntryFldr, WebStoreFolder: String;
  ImqQry: TIBQuery; ObjectId: Integer; ShowWeb: Boolean);
function PADR(Src: string; Lg: Integer): string;
procedure WriteDataToFile(FileName, WriteData: string);
function FullDirectoryCopy(SourceDir, TargetDir: string; StopIfNotAllCopied,
  OverWriteFiles: Boolean): Boolean;

implementation

uses SysUtils, Jpeg, DB, OptSet, TourCmnlIf, TourConsts, Dialogs;

const
  sWebStoreHotelFolder = '';
  sWebStoreIntrstFolder = '\Leisure';

function GetWebStoreFolder(ObjectKind: Integer): String;
begin
  case ObjectKind of
    nStoreHotelFolder: Result := sWebStoreHotelFolder;
    nStoreIntrstFolder: Result := sWebStoreIntrstFolder;
  else Result := '';
  end;
  if Result <> '' then Result := sWebStoreFolder + Result;
end;

function GetGroupLogoFileFolder: String;
begin
  Result :=
    IncludeTrailingPathDelimiter(
      IncludeTrailingPathDelimiter(OptionSet.StoreFolder) + 'Hotels') + 'Groups';
end;

function GetGroupLogoFileName(const FileName: String): String;
begin
  Result := IncludeTrailingPathDelimiter(GetGroupLogoFileFolder) + FileName;
end;

procedure GetGroupLogo(const FileName: String; Picture: TPicture);
var ImageFile: String;
begin
  ImageFile := GetGroupLogoFileName(FileName);
  if FileExists(ImageFile) then Picture.LoadFromFile(ImageFile)
  else Picture.Bitmap.FreeImage;
end;

const
  sWebStoreUser = 'fileupl';
  sWebStorePswd = 'ful4him';

function OpenWebStoreFolder(const WebStoreFolder: string): Boolean;
begin
  Result := OpenNetworkConnection(WebStoreFolder, sWebStoreUser, sWebStorePswd);
end;

function CloseWebStoreFolder(const WebStoreFolder: string): Boolean;
begin
  Result := CloseNetworkConnection(WebStoreFolder);
end;

function GetIntraDocStoreFolder(const Categ, Cntry, Objct: String): String;
begin
  Result := IncludeTrailingPathDelimiter(OptionSet.StoreFolder) +
    {sHotels}Categ + PathDelim + Cntry + PathDelim + Objct;
end;

procedure ToggleImageWebCopies(
  const CategFldr, CntryFldr, WebStoreFolder: String;
  ImqQry: TIBQuery; ObjectId: Integer; ShowWeb: Boolean);
var
  Fldr, FileName: String;
  FileFld, ShowFld: TField;
begin
  with ImqQry do
  begin
    Fldr := IncludeTrailingPathDelimiter(
      GetIntraDocStoreFolder(CategFldr, CntryFldr, IntToStr(ObjectId)));
    if not Active then Open;
    FileFld := FieldByName('FILENAME');
    ShowFld := FieldByName('SHOWWEB');
    First;
    if OpenWebStoreFolder(WebStoreFolder) then
    begin
      while not Eof do
      begin
        FileName := Fldr + FileFld.AsString;
        if ShowWeb and ShowFld.AsBoolean then
          ImageWebCopyCreate(
            ObjectId, FileName, EmptyStr, WebStoreFolder, nImgWebMaxWidth, nImgWebMaxHeight, False)
        else ImageWebCopyDelete(ObjectId, FileName, EmptyStr, WebStoreFolder);
        Next;
      end;
      CloseWebStoreFolder(WebStoreFolder);
    end;
  end;
end;

{ Image web copy routines }

function GetObjectFolderEx(ObjectId: Integer; var Folder: string;
  const ExtraPath, WebStoreFolder: String): String;
begin
  Folder := IncludeTrailingPathDelimiter(IntToStr(ObjectId)) + ExtraPath;
  Result := IncludeTrailingPathDelimiter(WebStoreFolder) + Folder;
end;

function GetObjectFolder(ObjectId: Integer): String;
var Folder: String;
begin
  Result := GetObjectFolderEx(ObjectId, Folder, EmptyStr, sWebStoreFolder);
end;

function GetImageWebFolder(HotelId: Integer; const FileNime: String): String;
begin
  Result := IncludeTrailingPathDelimiter(GetObjectFolder(HotelId)) +
    ExtractFileName(FileNime);
end;

function CheckImageFileSize(const ImageFile: String): Boolean;
var FSz: Integer;
begin
  FSz := GetFileSize(ImageFile);
  Result := (FSz < OptionSet.MaxImageFileSize)
    or WarningFmtDlgYN(
      SHtlDocDlgWarningFileTooLarge, [FSz, OptionSet.MaxImageFileSize]);
end;

function CheckImageMinSize(const ImageFile: String): Boolean;
begin
  Result := FileIsJpeg(ImageFile);
  if Result then
    with TJPEGImage.Create do
      try
        LoadFromFile(ImageFile);
        Result := (Width >= nImgWebMinWidth) and (Height >= nImgWebMinHeight)
          or (Width >= nImgWebMinHeight) and (Height >= nImgWebMinWidth);
        if not Result then
          ErrorFmtDlg(SHtlImgDlgErrorImageTooSmall, [nImgWebMinWidth, nImgWebMinHeight]);
      finally
        Free;
      end;
end;

function GetWebCopyFileName(
  HotelId: Integer; const FileName, ExtraPath, WebStoreFolder: String; 
  var Path, Folder: String): String;
begin
  Path := GetObjectFolderEx(HotelId, Folder, ExtraPath, WebStoreFolder);
  Result := IncludeTrailingPathDelimiter(Path) + ExtractFileName(FileName);
end;

function ImageWebCopyCreate(
  HotelId: Integer; const FN, ExtraPath, WebStoreFolder: String;
  CopyWidth, CopyHeight: Integer; ForceCreate: Boolean = True): Boolean;
var WebPath, WebFldr, WebFile: String;
begin
  WebFile := GetWebCopyFileName(HotelId, FN, ExtraPath, WebStoreFolder, WebPath, WebFldr);
  Result := OpenWebStoreFolder(WebStoreFolder);
  if Result then
  begin
    Result := CheckImageMinSize(FN);
    if Result then
    begin
      Result := SetCurrentDir(WebStoreFolder)
        and (DirectoryExists(WebFldr) or ForceDirectories{CreateDir}(WebPath))
        and (not ForceCreate and FileExists(WebFile)
          or JpegCopyCreate(FN, WebFile, CopyWidth, CopyHeight));
      if not Result then ErrorDlg(SHtlImgDlgErrorImageCopyWebCreate);
    end;
    CloseWebStoreFolder(WebStoreFolder);
  end;
end;

function ImageWebCopyDelete(HotelId: Integer; const FN, ExtraPath, WebStoreFolder: String): Boolean;
var WebPath, WebFldr, WebFile: String;
begin
  WebFile := GetWebCopyFileName(HotelId, FN, ExtraPath, WebStoreFolder, WebPath, WebFldr);
  Result := OpenWebStoreFolder(WebStoreFolder);
  if Result then
  begin
    Result := not DirectoryExists(WebPath) or not FileExists(WebFile)
      or DeleteFile(WebFile);
    CloseWebStoreFolder(WebStoreFolder);
  end;
end;

function PADR(Src: string; Lg: Integer): string;
begin
  Result := Src;
  while Length(Result) < Lg do
    Result := Result + ' ';
end;

procedure WriteDataToFile(FileName, WriteData: string);
var
  myFile : TextFile;
begin
  AssignFile(myFile, FileName);
  ReWrite(myFile);
  WriteLn(myFile, WriteData);
  CloseFile(myFile);
end;

function FullDirectoryCopy(SourceDir, TargetDir: string; StopIfNotAllCopied,
  OverWriteFiles: Boolean): Boolean;
var
  SR: TSearchRec;
  I: Integer;
begin
  Result := False;
  SourceDir := IncludeTrailingBackslash(SourceDir);
  TargetDir := IncludeTrailingBackslash(TargetDir);
  if not DirectoryExists(SourceDir) then
    Exit;
  if not ForceDirectories(TargetDir) then
    Exit;

  I := FindFirst(SourceDir + '*', faAnyFile, SR);
  try
    while I = 0 do
    begin
      if (SR.Name <> '') and (SR.Name <> '.') and (SR.Name <> '..') then
      begin
        if SR.Attr = faDirectory then
          Result := FullDirectoryCopy(SourceDir + SR.Name, TargetDir + SR.NAME,
            StopIfNotAllCopied, OverWriteFiles)
        else if not (not OverWriteFiles and FileExists(TargetDir + SR.Name))
          then
          Result := CopyFile(Pchar(SourceDir + SR.Name), Pchar(TargetDir +
            SR.Name), False)
        else
          Result := True;
        if not Result and StopIfNotAllCopied then
          exit;
      end;
      I := FindNext(SR);
    end;
  finally
    SysUtils.FindClose(SR);
  end;
end;
end.
