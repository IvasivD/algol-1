unit SyncUn;

interface

uses IdHTTP, dialogs;

const
  nTourSyncronizeAdd = 1;
  nTourSyncronizeEdit = 0;
  nTourSyncronizeDelete = -1;
  nTourSyncronizeAddEdit: array[Boolean] of Integer = (
    nTourSyncronizeEdit, nTourSyncronizeAdd);

function SendBoardMessage(WebHTTP: TIdHTTP;
  Author: Integer; const Title, Msg, Recip, RecGrp: String): Boolean;
function SendBoardMessageNew(WebHTTP: TIdHTTP;
  MsgId: Integer; const Recip, ListId, MessageBody, MessageSubject: String): Boolean;
function SendBoardMessageFromManager(WebHTTP: TIdHTTP;
  MsgId: Integer; const aSender, Recip, ListId, MessageBody, MessageSubject: wideString): Boolean;
function SyncronizeWebData(WebHTTP: TIdHTTP; const Host, URL, Params: String): Boolean;
function SyncronizeWebAction(
  WebHTTP: TIdHTTP; Id, Action: Integer; const Module, Params: String): Boolean;
function SyncronizeWebListIdAction(
  WebHTTP: TIdHTTP; Action: Integer; const ListId, Module, Params: String): Boolean;


implementation

uses Classes, SysUtils, Controls, Forms, IdException, TourCmnlIf, VDlgs, TourConsts, 
  OptSet, UnitProc;

const
  sRecId = 'ID=';
  sRecIds = 'IDS=';
  sSepar = '&';
  sWebHost = 'www.algol.local';
  sBoardHost = 'board.algol.local';
  sBoardPath = '/external_modules/post_message.php';
  sBoardAuthor = 'author_id=%d';
  sBoardSubject = 'subject=%s';
  sBoardMessage = 'body=%s';
  sBoardRecips = 'user_ids=%s';
  sBoardGroups = 'group_ids=%s';

function SendBoardMessage(WebHTTP: TIdHTTP;
  Author: Integer; const Title, Msg, Recip, RecGrp: String): Boolean;
var
  Par: TStrings;
  Rec, Grp: String;
begin
  Result := False;
  Rec := AnsiQuotedStr(Recip, ';');
  Grp := AnsiQuotedStr(RecGrp, ';');
  Par := TStringList.Create;
  try
  {SyncronizeBoard(WebHTTP, ,
    Format('=17;="Зміни - тест";body="%s"<br>%s;=219', [
      IntToStr(Id), IntToStr(Id)]));}
    Par.Add(Format(sBoardAuthor, [Author]));
    Par.Add(Format(sBoardSubject, [Title]));
    Par.Add(Format(sBoardMessage, [Msg]));
    Par.Add(Format(sBoardRecips, [Rec]));
    Par.Add(Format(sBoardGroups, [Grp]));
    try
      WebHTTP.Host := sBoardHost;
      WebHTTP.Post(sBoardPath, Par);
      Result := True;
    except
      on E: EIdException do
        ErrorDlg(SDataModErrorWebSyncronize + #13#13 + E.Message);
    end;
  finally
    Par.Free;
  end;
end;

function SendBoardMessageNew(WebHTTP: TIdHTTP;
  MsgId: Integer; const Recip, ListId, MessageBody, MessageSubject: String): Boolean;
const sBoardMessageId = 'messageId=%d';  
  sBoardRecipsList = 'userIds=%s';
  sBoardCompanyList = 'companyIds=%s';
  sBoardMesPath = '/_sync/_ib_send_board_message/';
  sBoardMessageBody = 'messageBody=%s';
  sBoardMessageSubject = 'messageSubject=%s';
var
  Par: TStrings;
  aMessageBody, aMessageSubject: string;
begin
  Result := False;
  if MessageBody = EmptyStr then Exit;
  Par := TStringList.Create;
  try
    aMessageBody := StringReplace(MessageBody, '&', '%26', [rfReplaceAll]);
    aMessageSubject := StringReplace(MessageSubject, '&', '%26', [rfReplaceAll]);

    Par.Add(Format(sBoardMessageId, [MsgId]));
    Par.Add(Format(sBoardRecipsList, [Recip]));
    Par.Add(Format(sBoardCompanyList, [ListId]));
    Par.Add(Format(sBoardMessageBody, [aMessageBody]));
    Par.Add(Format(sBoardMessageSubject, [aMessageSubject]));
    try
      WebHTTP.Host := sWebHost;
      WebHTTP.Post(sBoardMesPath, Par);
      Result := True;
    except
      on E: EIdException do
        ErrorDlg(SDataModErrorWebSyncronize + #13#13 + E.Message);
    end;
  finally
    Par.Free;
  end;
end;

function SendBoardMessageFromManager(WebHTTP: TIdHTTP;
  MsgId: Integer; const aSender, Recip, ListId, MessageBody, MessageSubject: wideString): Boolean;
const sBoardMessageId = 'messageId=%d';  
  sBoardRecipsList = 'userIds=%s';
  sBoardCompanyList = 'companyIds=%s';
  sBoardMessageBody = 'messageBody=%s';
  sBoardMessageSubject = 'messageSubject=%s';
  sBoardMessageSender = 'frommanager=%s';

  sBoardMesPath = '/_sync/_ib_send_board_message_from_manager/';
var
  Par: TStrings;
begin
  Result := False;
  if MessageBody = EmptyStr then Exit;
  Par := TStringList.Create;
  try     
    Par.Add(Format(sBoardMessageId, [MsgId]));
    Par.Add(Format(sBoardRecipsList, [Recip]));
    Par.Add(Format(sBoardCompanyList, [ListId]));
    Par.Add(Format(sBoardMessageBody, [MessageBody]));
    Par.Add(Format(sBoardMessageSubject, [MessageSubject]));
    Par.Add(Format(sBoardMessageSender, [aSender]));
    try
      WebHTTP.Host := sWebHost;
      WebHTTP.Post(sBoardMesPath, Par);
      Result := True;
    except
      on E: EIdException do
        ErrorDlg(SDataModErrorWebSyncronize + #13#13 + E.Message);
    end;
  finally
    Par.Free;
  end;
end;

function SyncronizeWebData(WebHTTP: TIdHTTP; const Host, URL, Params: String): Boolean;
var
  InfoFrm: TForm;
  URLPrms: String;
begin
  Result := False;
  //не синхронізувати з ТЕСТової бази
  if Pos('TEST', AnsiUpperCase(OptionSet.DatabaseFolder)) > 0 then Exit;
  Screen.Cursor := crHourGlass;
  InfoFrm := SplashPromptForm(Application.Title, SDataModSplashBoardSync);
  try
    if Assigned(InfoFrm) then
    begin
      InfoFrm.Show;
      InfoFrm.Repaint;
    end;
    try
      if Params = '' then URLPrms := URL else URLPrms := URL + '?' + Params;
      WebHTTP.Host := Host;
      WebHTTP.Get(URLPrms);
      Result := True;
    except
      on E: EIdException do
        ErrorDlg(SDataModErrorWebSyncronize + #13#13 + E.Message);
    end;
  finally
    if Assigned(InfoFrm) then InfoFrm.Free;
    Screen.Cursor := crDefault;
  end;
end;

function SyncronizeWebAction(
  WebHTTP: TIdHTTP; Id, Action: Integer; const Module, Params: String): Boolean;
var ActParam, SyncParams: String;
begin
  Result := False;
  if Action = nTourSyncronizeAdd then ActParam := 'i'
  else if Action = nTourSyncronizeDelete then ActParam := 'd'
  else if Action = nTourSyncronizeEdit then ActParam := 'u'
  else Exit;
  SyncParams := 'a=' + ActParam + sSepar + sRecId + IntToStr(Id);
  if Params <> '' then SyncParams := SyncParams + sSepar + Params;
  Result := SyncronizeWebData(WebHTTP, sWebHost, '/_sync/' + Module + '/', SyncParams);
  {SyncronizeBoard(WebHTTP, '/external_modules/post_message.php',
    Format('author_id=17;subject="Зміни - тест";body="%s"<br>%s;group_ids=219', [
      IntToStr(Id), IntToStr(Id)]));}
end;

function SyncronizeWebListIdAction(
  WebHTTP: TIdHTTP; Action: Integer; const ListId, Module, Params: String): Boolean;
var ActParam, SyncParams: String;
begin
  Result := False;
  if Action = nTourSyncronizeAdd then ActParam := 'i'
  else if Action = nTourSyncronizeDelete then ActParam := 'd'
  else if Action = nTourSyncronizeEdit then ActParam := 'u'
  else Exit;
  SyncParams := 'a=' + ActParam + sSepar + sRecIds + ListId;
  if Params <> '' then SyncParams := SyncParams + sSepar + Params;
  Result := SyncronizeWebData(WebHTTP, sWebHost, '/_sync/' + Module + '/', SyncParams);
  {SyncronizeBoard(WebHTTP, '/external_modules/post_message.php',
    Format('author_id=17;subject="Зміни - тест";body="%s"<br>%s;group_ids=219', [
      IntToStr(Id), IntToStr(Id)]));}
end;
end.
