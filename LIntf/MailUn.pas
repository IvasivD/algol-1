unit MailUn;

interface

uses Classes, SHDocVw, RegExpr, IdMessage, TourCmnlIf;
type 
  TCreateLinkForPerson = procedure(aStoreFile, aListId: string; ReferId: Integer) of object;
  
const
  sContTypePln = 'text/plain';
  sContTypeHtm = 'text/html';
  sContTypeMix = 'multipart/mixed';
  sContTypeJpg = 'image/jpeg';
  sContTypeGif = 'image/gif';
  sContEditable = 'contenteditable=true';
  sContentId = 'Content-ID:';
  sContentCId = 'cid:';
  sTagDivBeg = '<div ' + sContEditable + '>';
  sTagDivEnd = '</div>';
  sReplaceMaskTxt = '<TEXT>';
  sReplaceMaskSbj = '<SUBJECT>';
  sReplaceMaskFnt = '<REPORTFONT>';
  sReplaceMaskImg = '<IMAGEPATH>';
  sProposeInfo = '<PROPOSEINFO>';
  (*sHtmlBlankTempl =
    '<HTML><HEAD><style type="text/css"><!-- ' +
    'body {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #264D9B} ' +
    '--></style></HEAD><BODY contenteditable=true>' +
    sReplaceMaskTxt + sProposeInfo +
    '</BODY></HTML>';*)
  sHtmlFirmStyle =
    '<style type="text/css"> ' +
    '<!--' +
    'body {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 12px; color: #264D9B} ' +
    'p {padding: 0px; margin: 0px;} ' +
    '-->' +
    '</style>';
  sHtmlBlankTempl =
    '<HTML><HEAD>' +
    '<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">' +
    '%s</HEAD>' +
    '<BODY>' +
    {sTagDivBeg +} sReplaceMaskTxt + {sTagDivEnd +} sProposeInfo +
    '</BODY></HTML>';    
  sHtmlFirmHeader =
    '<table width="99%" border="0" cellspacing="0" cellpadding="5">' +
    '<tr align="center">' +
    '<td width="153" valign="top">' +
    '<table width="153" border="0" cellspacing="0" cellpadding="0">' +
    '<tr>' +
    '<td width="56" valign="top"><a href="http://www.algol.com.ua" target="_top"><img src="<IMAGEPATH>krainy_r1_c2.jpg" width="56" height="67" border="0" style="margin:0;" /></td>' +
    '<td width="57" valign="top"><a href="http://www.algol.com.ua" target="_top"><img src="<IMAGEPATH>sun_a.gif" width="57" height="67" border="0" style="margin:0;" /></a></td>' +
    '<td width="40" valign="top"><a href="http://www.algol.com.ua" target="_top"><img src="<IMAGEPATH>krainy_r1_c4.jpg" width="40" height="67" border="0" style="margin:0;" /></a></td>' +
    '</tr>' +
    '</table>' +
    '</td>' +
    '<td width="100%">' +
    '<table width="100%" border="0" cellspacing="0" cellpadding="0">' +
    '<tr>' +
    '<td align="right"><font size="1" face="Arial, Helvetica, sans-serif" color="#264D9B">Туристична фірма Алголь<br>' +
    'вул. Мельника, 16а, Львів, 79044, Україна<br>' +
    'телефони: 380 32 2424121<br>' +
    '380 97 2424121<br>' +
    '380 95 2424121<br>' +
    '380 73 2424121<br>' +
    '<a href="mailto:algol@algol.com.ua?subject=Contact">algol@algol.com.ua</a><br>' +
    '<a href="http://www.algol.com.ua">www.algol.com.ua</a></font></td>' +
    '</tr>' +
    '</table>' +
    '</td>' +
    '</tr>' +
    '</table>' +
    '<table width="99%" border="0" cellspacing="0" cellpadding="0" height="1" background="<IMAGEPATH>line_bg.gif" bgcolor="#0033CC">' +
    '<tr align="left" background="<IMAGEPATH>line_bg.gif" style="line-height:1px;">' +
    '<td background="<IMAGEPATH>line_bg.gif" bgcolor="#0033CC" height="1"><img src="<IMAGEPATH>line_end_n.gif" width="139" height="1" style="padding:0; margin:0; display:block;" /></td>' +
    '<td width="100%" bgcolor="#0033CC"><img src="<IMAGEPATH>line_bg.gif" width="10" height="1" style="display:block;padding:0;margin:0;border:0;width:100%;height:1px;"></td>' +
    '<td align="right" background="<IMAGEPATH>line_bg.gif" height="1"><img src="<IMAGEPATH>line_end.gif" width="139" height="1" style="padding:0; margin:0; display:block;"></td>' +
    '</tr>' +
    '</table>';
(*    '<table width="99%" border="0" cellspacing="0" cellpadding="5">' +
    '<tr align="center">' +
    '<td width="153" valign="top">' +
    '  <table width="153" border="0" cellspacing="0" cellpadding="0">' +
    '    <tr>' +
    '      <td><font size="2" face="Arial, Helvetica, sans-serif">' +
    '        <a href="http://www.algol.com.ua" target="_top">' +
    '<img src="<IMAGEPATH>krainy_r1_c2.jpg" width="56" height="67" border="0">' +
    '<img src="<IMAGEPATH>sun_a.gif" width="57" height="67" border="0">'+
    '<img src="<IMAGEPATH>krainy_r1_c4.jpg" width="40" height="67" border="0"></a></font></td>' +
    '    </tr>' +
    '  </table>' +
    '</td>' +
    '<td width="100%">' +
    '  <table width="100%" border="0" cellspacing="0" cellpadding="0">' +
    '    <tr>' +
    '      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif" color="#264D9B">Туристична фірма Алголь<br>' +
    '        вул. Мельника, 16а, Львів, 79044, Україна<br>' +
    '        телефон/факс: + (380 32) 2424121, 2424122, 2424123<br>' +
    '        факс: + (380 32) 2424124<br>' +
{   '      <td align="right"><font size="1" face="Arial, Helvetica, sans-serif" color="#264D9B">Algol' +
    '        ltd., Travel Agency<br>' +
    '        16a Melnyka Str., Lviv, 79044 Ukraine<br>' +
    '        phone/fax: + (380 32) 2424121, 2424122, 2424123 <br>' +
    '        fax: + (380 32) 2424124<br>' +}
    '        <a href="mailto:algol@algol.com.ua?subject=Contact">algol@algol.com.ua</a><br>' +
    '        <a href="http://www.algol.com.ua">www.algol.com.ua</a></font></td>' +
    '    </tr>' +
    '  </table>' +
    '</td>' +
    '</tr>' +
    '</table>' +
    '<table width="99%" border="0" cellspacing="0" cellpadding="0" height="1"' +
    ' background="<IMAGEPATH>line_bg.gif" bgcolor="#0033CC">' +
    '<tr align="left" background="<IMAGEPATH>line_bg.gif">' +
    '<td background="<IMAGEPATH>line_bg.gif" bgcolor="#0033CC" height="1">' +
    '<img src="<IMAGEPATH>line_end_n.gif" width="139" height="1">' +
    '<img src="<IMAGEPATH>line_bg.gif" width="10" height="1"></td>' +
    '<td align="right" background="<IMAGEPATH>line_bg.gif" height="1">' +
    '<img src="<IMAGEPATH>line_end.gif" width="139" height="1"></td>' + 
    '</tr>' +
    '</table>'; *)
  sHtmlFirmTempl =
    '<html><head>' +
    '<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">' +
    '<style type="text/css"> ' +
    '<!--' +
    'body {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px;' +
    ' color: #264D9B; margin-left: 10px;} ' +
    'p {padding: 0px; margin: 0px;} ' +
    '-->' +
    '</style></head>' +
    '<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"' +
    ' text="#264D9B" link="#3366CC" vlink="#3366CC" alink="#3366CC">'+ //contenteditable=false>' +
    sHtmlFirmHeader +
    //'<table width="99%" border="0" cellspacing="0" cellpadding="5" height="100%">' +
    '<table width="99%" border="0" cellspacing="0" cellpadding="5">' +
    '<tr>' +
    '<td height="100%" valign="top"><font size="2" face="<REPORTFONT>Arial" color="#264D9B">' +
    sTagDivBeg + sReplaceMaskTxt + sTagDivEnd + '</font></td>' +
    '</tr>' +
    '</table>' + sProposeInfo +
    '</body></html>';
  sHtmlProposeInfo =
   '<BR><br>' +
   '          <A HREF="mailto:<DELETEFROM>">Натисність сюди для відписки від нашої розсилки ' +
   'на тему "<EMAILTHEME>"</A><BR>' +
   '          <A HREF="mailto:<DELETEFROM>"> Click here if you want unsubscribe from our maillist ' +
   'on theme "<EMAILTHEME>"</A><BR><BR>' +
   '          <A HREF="mailto:<DELETEFROMALL>">Натисніть сюди для відмови від нашої розсилки ' +
   'на всі теми</A><BR>' +
   '          <A HREF="mailto:<DELETEFROMALL>"> Click here if you want unsubscribe from our maillist' +
   'at all themes</A>';
  sReportFont = 'Courier, ';

const
  nLogoImgCnt = 6;
  sLogoImgs: array[0..nLogoImgCnt - 1] of String = (
    'krainy_r1_c2.jpg',
    'krainy_r1_c4.jpg',
    'line_bg.gif',
    'line_end.gif',
    'line_end_n.gif',
    'sun_a.gif');
  sLogoImgDir = 'C:\Program Files\Common Files\Microsoft Shared\Stationery\Алголь\';
  sInnerSite = 'www.algol.local';
  sOuterSite = 'www.algol.com.ua';
  sCharSetWin1251 = 'windows-1251';
  sProtoFile = 'file://';
  sStampAndSign = 'Печатка і підпис Алголь 55.4х39.2.png';

function GetHtmlBlankTempl(const UseStyle: String): String;
function GetHtmlFirmHeader: String;
function LoadHTMLFromFile(Browser: TWebBrowser;
  const FileName: String; var TempFile: String; FirmTempl, IsReport: Boolean): Boolean;
function LoadHTMLFromString(
  Browser: TWebBrowser; const Text: String; var TempFile: String;
  FirmTempl, IsReport: Boolean; const UseStyle: String = ''): Boolean;
function LoadHTMLFromStrings(
  Browser: TWebBrowser; Strings: TStrings; var TempFile: String;
  FirmTempl, IsReport: Boolean; const UseStyle: String = ''): Boolean;
function ParseFiles(Str: string): TStrings;
procedure BodyHTML(IdMes: TIdMessage; SHtm: string; Imgs: TStrings);
function DoSave(OrderId, DocTypeId: Integer; IdMes: TIdMessage;
  const StoreFldr: string; CreateLinkForPerson: TCreateLinkForPerson = nil;
  const aListId: string = ''): Boolean;
function IsValideMail(const value: string): boolean; 

implementation

uses SysUtils, Forms;

function GetHtmlBlankTempl(const UseStyle: String): String;
var Style: String;
begin
  if UseStyle = '' then Style := sHtmlFirmStyle else Style := UseStyle;
  Result := Format(sHtmlBlankTempl, [Style]);
end;

{ load HTML mail body routines }

function LoadHTMLFromStrings(
  Browser: TWebBrowser; Strings: TStrings; var TempFile: String;
  FirmTempl, IsReport: Boolean; const UseStyle: String = ''): Boolean;
const
  sPreBeg = '<pre>';
  sPreEnd = '</pre>';
  sReportIndent = '         ';
var
  Fnt, S: String;
  T: TextFile;
  I: Integer;
begin
  Randomize;
  TempFile := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) +
    'tmp' + IntToStr(Round(Random(9999))) + '.htm';
  if IsReport then
    with Strings do
      for I := 0 to Count - 1 do
      begin
        S := Strings[I];
        if (Length(S) > 9) and (Pos(sReportIndent, S) = 1) then
        begin
          System.Delete(S, 1, 9);
          Strings[I] := S;
        end;
      end;
  S := Strings.Text;
  if IsReport then
  begin
    S := sPreBeg + S + sPreEnd;
    Fnt := sReportFont;
  end
  else Fnt := '';
  AssignFile(T, TempFile);
  Rewrite(T);
  try
    if FirmTempl then
      Writeln(T, StringReplace(StringReplace(StringReplace(sHtmlFirmTempl,
        sReplaceMaskImg, sLogoImgDir, [rfReplaceAll]),
        sReplaceMaskFnt, Fnt, [rfReplaceAll]),
        sReplaceMaskTxt, S, [rfReplaceAll]))
    else
      Writeln(T, StringReplace(GetHtmlBlankTempl(UseStyle),
        sReplaceMaskTxt, S, [rfReplaceAll]));
  finally
    CloseFile(T);
  end;
  Browser.Navigate('file://' + TempFile);
  Result := True;
end;

function GetHtmlFirmHeader: String;
begin
  Result := StringReplace(
    sHtmlFirmHeader, sReplaceMaskImg, sLogoImgDir, [rfReplaceAll, rfIgnoreCase]);
end;

function LoadHTMLFromFile(Browser: TWebBrowser;
  const FileName: String; var TempFile: String; FirmTempl, IsReport: Boolean): Boolean;
var B: TStrings;
begin
  B := TStringList.Create;
  try
    B.LoadFromFile(FileName);
    Result := LoadHTMLFromStrings(Browser, B, TempFile, FirmTempl, IsReport);
  finally
    B.Free;
  end;
end;

function LoadHTMLFromString(
  Browser: TWebBrowser; const Text: String; var TempFile: String;
  FirmTempl, IsReport: Boolean; const UseStyle: String = ''): Boolean;
var B: TStrings;
begin
  B := TStringList.Create;
  try
    B.Text := Text;
    Result :=
      LoadHTMLFromStrings(Browser, B, TempFile, FirmTempl, IsReport, UseStyle);
  finally
    B.Free;
  end;
end;

function ParseFiles(Str: string): TStrings;
begin
  Result := TStringList.Create;
  with TRegExpr.Create do
    try
      ModifierS := False;
      Expression := 'src="file://([a-zA-Z0-9\.\\\-_аяАЯіІїЇєЄёЁыЫ/:\,]+)"';
        //'<tour><id>(.+)</id><name>(.+)</name><file>(.+)</file><url>(.+)</url></tour>';
      if Exec(Str) then
        repeat
          Result.Add(StringReplace(Match[1], '/', '\', [rfReplaceAll]));
        until not ExecNext;
    finally
      Free;
    end;
end;

procedure BodyHTML(IdMes: TIdMessage; SHtm: string; Imgs: TStrings);
var I: Integer;
begin
  with IdMes do
  begin
    MessageParts.Clear;
    with TIdText.Create(MessageParts, nil) do
    begin
      Body.Text := 'Text';
      ContentType := sContTypePln + '; charset=' + sCharSetWin1251;
    end;

    with TIdText.Create(MessageParts, nil) do
    begin
      Body.Text := SHtm;
      ContentType := sContTypeHtm + '; charset=' + sCharSetWin1251;
    end;

    for I := 0 to nLogoImgCnt - 1 do
    if Pos(sContentCId + sLogoImgs[I], SHtm) > 0 then
    with TIdAttachment.Create(MessageParts, sLogoImgDir + sLogoImgs[I]) do
    begin
      if (Pos('.jpg', sLogoImgs[I]) <> 0) then ContentType := sContTypeJpg;
      if (Pos('.gif', sLogoImgs[I]) <> 0) then ContentType := sContTypeGif;
      ExtraHeaders.Add(sContentId + '<' + sLogoImgs[I] + '>');
      ContentDisposition := 'inline';
    end;
    if Assigned(Imgs) then
    for I := 0 to Imgs.Count - 1 do
    with TIdAttachment.Create(MessageParts, Imgs[I]) do
    begin
      if (Pos('.jpg', Imgs[I]) <> 0) then ContentType := sContTypeJpg;
      if (Pos('.gif', Imgs[I]) <> 0) then ContentType := sContTypeGif;
      ExtraHeaders.Add(sContentId + ExtractFileName(Imgs[I]));
      ContentDisposition := 'inline';
    end;
  end;
end;

function DoSave(OrderId, DocTypeId: Integer; IdMes: TIdMessage;
  const StoreFldr: string; CreateLinkForPerson: TCreateLinkForPerson = nil;
  const aListId: string = ''): Boolean;
const sMailExt = '.eml';
var Fldr, Subj, FileName: String;
begin
  Fldr := StoreFldr;
  Subj := IdMes.Subject;
  Result := MakeDocStoreFileName(Fldr, Subj, [OrderId, DocTypeId]);
  if Result then begin 
    FileName := Fldr + Subj + sMailExt;
    IdMes.SaveToFile(FileName);
    if Assigned(CreateLinkForPerson) then CreateLinkForPerson(FileName, aListId, OrderId);
  end;
end;

function IsValideMail(const value: string): boolean; 
  function CheckAllowed(const s: string): Boolean; 
  var i: Integer; 
  begin 
    Result:= False; 
    for i:= 1 to length(s) do 
    { недопустимий символ в s } 
      if not (s[i] in ['a'..'z', 'A'..'Z', '0'..'9', '_', '-', '.']) 
      then Exit; 
    Result:= True; 
  end; 
var I: Integer; 
  NamePart, ServerPart: string; 
  subStr: pChar;
begin 
  Result:= False; 
  i:= pos('@', Value); 
  if i = 0 then Exit;   
  NamePart := copy(value, 1, i - 1); 
  ServerPart := copy(value, i + 1, length(value)); 
  // @ не указано имя имя или сервер не указаны; минимально для сервера. " a.com" 
  if (length(NamePart) = 0) or ((length(ServerPart) < 4)) 
  then Exit; 
//  i:= pos('.', ServerPart); 
  // должно иметь точку и как минимум три знака от конца 
//  if (i = 0) or (i > (length(ServerPart) - 2)) 
//  then Exit; 
  subStr := AnsiStrRScan(PChar(ServerPart), '.');
  if (subStr = nil) or (length(subStr) < 3) then Exit;
  Result:= CheckAllowed(NamePart) and CheckAllowed(ServerPart); 
end;                                  
                                        

{function LoadHTMLFromStrings(Browser: TWebBrowser;
  Strings: TStrings; var TempFile: String; FirmTempl, IsReport: Boolean): Boolean;
const
  sPreBeg = '<pre>';
  sPreEnd = '</pre>';
  sReportIndent = '         ';
var
  Fnt, S: String;
  T: TextFile;
  I: Integer;
begin
  Randomize;
  TempFile := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName)) +
    'tmp' + IntToStr(Round(Random(9999))) + '.htm';
  if IsReport then
    with Strings do
      for I := 0 to Count - 1 do
      begin
        S := Strings[I];
        if (Length(S) > 9) and (Pos(sReportIndent, S) = 1) then
        begin
          System.Delete(S, 1, 9);
          Strings[I] := S;
        end;
      end;
  S := Strings.Text;
  if IsReport then
  begin
    S := sPreBeg + S + sPreEnd;
    Fnt := sReportFont;
  end
  else Fnt := '';
  AssignFile(T, TempFile);
  Rewrite(T);
  try
    if FirmTempl then
      Writeln(T, StringReplace(StringReplace(StringReplace(StringReplace(sHtmlFirmTempl,
        sReplaceMaskImg, sLogoImgDir, [rfReplaceAll]),
        sReplaceMaskFnt, Fnt, [rfReplaceAll]),
        sReplaceMaskTxt, S, [rfReplaceAll]),
        '/images/', sLogoImgDir, [rfReplaceAll]))
    else Writeln(T, StringReplace(sHtmlBlankTempl, sReplaceMaskTxt, S, [rfReplaceAll]));
  finally
    CloseFile(T);
  end;
  Browser.Navigate(sProtoFile + TempFile);
  Result := True;
end;

function LoadHTMLFromFile(Browser: TWebBrowser;
  const FileName: String; var TempFile: String; FirmTempl, IsReport: Boolean): Boolean;
var B: TStrings;
begin
  B := TStringList.Create;
  try
    B.LoadFromFile(FileName);
    Result := LoadHTMLFromStrings(Browser, B, TempFile, FirmTempl, IsReport);
  finally
    B.Free;
  end;
end;

function LoadHTMLFromString(Browser: TWebBrowser;
  const Text: String; var TempFile: String; FirmTempl, IsReport: Boolean): Boolean;
var B: TStrings;
begin
  B := TStringList.Create;
  try
    B.Text := Text;
    Result := LoadHTMLFromStrings(Browser, B, TempFile, FirmTempl, IsReport);
  finally
    B.Free;
  end;
end;}

end.
