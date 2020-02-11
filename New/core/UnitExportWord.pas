unit UnitExportWord;

interface
uses Variants, WordXP,SysUtils,UnitProc,Dialogs,TourCmnlIf,Windows,TourConsts,Printers;

const
  SServModErrorWordNotInstall = 'Помилка при спробі запуску Word:'#13'%s';
  SDataModErrorWordBookmarkNotFound = 'Помилка Microsoft Word.'#13'В шаблоні документу не знайдене поле "%s",'#13'в яке мав бути вписаний текст'#13'"%s".'#13'Повторіть операцію після того, як буде виправлений шаблон.';
  SDataModErrorWordNotInstall = 'Помилка при запуску Microsoft Word.'#13'Попробуйте відкрити Microsoft Word перед відкриттям цієї програми.'#13'Якщо це не допоможе,'#13'то, можливо, Microsoft Word не встановлений на цьому комп''ютері.';


type
  TFillWordDocProc = procedure of object;
  TFillWordDocProcNew = function(TypeTempl: Integer = 0): Boolean of object;

procedure LaunchWordDocument(WordDocum:TWordDocument;WordApplic:TWordApplication; const DocName, TemplName: String; ROnly: Boolean);
procedure WordClose( WordApplic:TWordApplication );
function  SetWordBookmark(WordDocum:TWordDocument;WordApplic:TWordApplication; BookmarkName, TextBookmark: OleVariant;  ShowWarn: Boolean = True): Boolean;
function  SetWordBookmarkDate(WordDocum:TWordDocument;WordApplic:TWordApplication; BookmarkName, BookmarkDate: OleVariant; ShowWarn: Boolean = True): Boolean;
function  WordApplicOpen(WordDocum:TWordDocument;WordApplic:TWordApplication; TemplName: string; Template, NewTemplate, DocType, Vis: OleVariant; IsShablon: Boolean = False): Boolean;
function  WordApplicConnect(WordApplic:TWordApplication; TemplName: String): Boolean;
procedure WordRestart( WordApplic:TWordApplication; TemplName: string);
function  PrintWordDoc( WordDocum:TWordDocument; WordApplic:TWordApplication; DocName: string ): Boolean;
procedure OpenShablonDoc( WordDocum:TWordDocument;WordApplic:TWordApplication; InitDir,ShablonName: string; DocVsbl: Boolean = True);

implementation

procedure CreateWordDocAppl( var WordDocum:TWordDocument; var WordApplic:TWordApplication );
begin
  WordDocum := TWordDocument.Create(nil);
  WordApplic := TWordApplication.Create(nil);
end;

procedure DestroyWordDocAppl( WordDocum:TWordDocument;  WordApplic:TWordApplication );
begin
  WordDocum.Free;
  WordApplic.Free;
end;

procedure LaunchWordDocument(WordDocum:TWordDocument;WordApplic:TWordApplication; const DocName, TemplName: String; ROnly: Boolean);
var
  Document, Convers, ReadOnly, Template, NewTemplate, ItemIndex, DocType, Vis,
  Recent, PswDoc, PswTmpl, Revert, WPswDoc, WPswTmpl, Frmt, Encod: OleVariant;
begin
  try
    Template := EmptyParam;
    NewTemplate := True;
    Template := TemplName;
    NewTemplate := False;
    Convers := EmptyParam;
    DocType := 0;
    Vis := True;
    ReadOnly := ROnly;
    ItemIndex := 1;
    //***************************
    try
      WordApplic.Connect;
    except
      on E: Exception do
      begin
        MyShowMessageDlg(  Format(SServModErrorWordNotInstall, [E.Message] ),mtError, but_OK );
        Abort;
      end;
    end;
    //***************************
    Template := TemplName;
    NewTemplate := False;
    Document := DocName;
    Vis := True;
    DocType := 0;
    if DocName <> '' then
    begin
      Recent := False;
      PswDoc := EmptyParam;
      PswTmpl := EmptyParam;
      Revert := EmptyParam;
      WPswDoc := EmptyParam;
      WPswTmpl := EmptyParam;
      Frmt := EmptyParam;
      Encod := EmptyParam;
      WordApplic.Documents.Open(Document, Convers, ReadOnly,
        Recent, PswDoc, PswTmpl, Revert, WPswDoc, WPswTmpl, Frmt, Encod,
        EmptyParam, EmptyParam, EmptyParam, Vis);
    end
    else WordApplic.Documents.Add(Template, NewTemplate, DocType, Vis);

    WordDocum.ConnectTo(WordApplic.Documents.Item(ItemIndex));
    WordApplic.Visible := True;
  except
    on E: EAbort do WordApplic.Disconnect;
    on E: Exception do
    begin
      MyShowMessageDlg( E.Message, mtError, but_OK );
      WordApplic.Disconnect;
    end;
  end;
end;

function SetWordBookmark(WordDocum:TWordDocument;WordApplic:TWordApplication; BookmarkName, TextBookmark: OleVariant;
  ShowWarn: Boolean = True): Boolean;
begin
  Result := True;
  try
    WordDocum.Bookmarks.Item(BookmarkName).Select;
    WordApplic.Selection.TypeText(TextBookmark);

  except
    Result := False;
    if ShowWarn then
      MyShowMessageDlg(  Format(SDataModErrorWordBookmarkNotFound, [BookmarkName, TextBookmark] ) , mtError, but_OK );
  end;
end;

function SetWordBookmarkDate(WordDocum:TWordDocument;WordApplic:TWordApplication; BookmarkName, BookmarkDate: OleVariant;
  ShowWarn: Boolean = True): Boolean;
var AsField, AsFull, Lang, Clnd: OleVariant;
begin
  AsField := False;
  AsFull := False;
  Lang := varNull;
  Clnd := varNull;

  Result := True;
  try
    WordDocum.Bookmarks.Item(BookmarkName).Select;
    WordApplic.Selection.InsertDateTime(BookmarkDate, AsField, AsFull, Lang, Clnd);

  except
    Result := False;
    if ShowWarn then
      MyShowMessageDlg(  Format(SDataModErrorWordBookmarkNotFound, [BookmarkName, BookmarkDate] ) , mtError, but_OK );
  end;
end;

function WordApplicConnect(WordApplic:TWordApplication; TemplName: String): Boolean;
begin
  Result := True;
  try
    WordApplic.Connect;
  except
    Result := False;
  end;
  if not Result then
    try
      ShellOutward(TemplName, '', '', '', SW_SHOWMINIMIZED);
      WordApplic.Connect;
      Result := True;
    except
      MyShowMessageDlg( SDataModErrorWordNotInstall , mtError, but_OK );
      Result := False;
      Abort;
    end;
end;

procedure WordRestart( WordApplic:TWordApplication; TemplName: string);
begin
  try
    if WordApplic.Documents.Count < 0 then ;
  except
    WordApplic.Disconnect;
    WordApplicConnect( WordApplic, TemplName );
  end;
end;

procedure WordClose(WordApplic:TWordApplication);
var
  NotSave, nDoc: OleVariant;
  I: Integer;
begin
  NotSave := False;
  for I := 1 to WordApplic.Documents.Count do
  begin
    nDoc := I;      
    WordApplic.Documents.Item(nDoc).Close(NotSave, EmptyParam, EmptyParam);
  end;

  WordApplic.Disconnect;
end;

function WordApplicOpen(WordDocum:TWordDocument;WordApplic:TWordApplication; TemplName: string; Template, NewTemplate,
  DocType, Vis: OleVariant; IsShablon: Boolean = False): Boolean;
var
  pwd, Recent: OleVariant;
begin
  Result := True;
  if not WordApplicConnect( WordApplic, TemplName) then Abort
  else
  try
  //  Перезапуск MSWord, если его закрыли до закрытия программмы
    WordRestart( WordApplic, TemplName );
    pwd := SWordPass;
    Recent := False;
    if IsShablon then WordDocum.ConnectTo(
      WordApplic.Documents.Add(Template, NewTemplate, DocType, Vis))
    else WordDocum.ConnectTo(
      WordApplic.Documents.Open(Template, EmptyParam, EmptyParam,
        Recent, pwd, pwd, EmptyParam, pwd, EmptyParam,
        EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam, EmptyParam));
  except
    //ErrorFmtDlg(SDataModErrorWordNotOpen, [TemplName]);
    MyShowMessageDlg( Format( SDataModErrorWordNotOpen, [TemplName] ), mtError, but_OK );
    Result := False;
    Abort;
  end;
end;

function PrintWordDoc( WordDocum:TWordDocument; WordApplic:TWordApplication; DocName: string ): Boolean;
var
  Template, NewTemplate, DocType, Vis, NotSave, I,Copies: OleVariant;
  HadDocum: _Document;
  PrintDialog:TPrintDialog;
begin
  try
    try
      PrintDialog:=TPrintDialog.Create( WordDocum.Owner );
      Result := False;
      Template := DocName;
      NewTemplate := False;
      Vis := False;
      DocType := 0;
      I := 1;
      WordApplicOpen( WordDocum,WordApplic, DocName, Template, NewTemplate, DocType, Vis);

      HadDocum := WordApplic.Documents.Item(I) as _Document;
      WordApplic.Visible := False;
      PrintDialog.Copies := 2;
      if not PrintDialog.Execute then Exit;
      Result := True;
      WordApplic.ActivePrinter := Printer.Printers[Printer.PrinterIndex];
      Copies := Printer.Copies;
      WordDocum.PrintOut(EmptyParam, EmptyParam, EmptyParam, EmptyParam,
        EmptyParam, EmptyParam, EmptyParam, Copies);
      HadDocum.Close(NotSave, EmptyParam, EmptyParam);

    finally
      PrintDialog.Free;
    end;

  except
    on E: EAbort do WordApplic.Disconnect;
    on E: Exception do
    begin
      ErrorDlg(E.Message);
      WordApplic.Disconnect;
    end;
  end;

end;


procedure OpenShablonDoc( WordDocum:TWordDocument;WordApplic:TWordApplication; InitDir,ShablonName: string; DocVsbl: Boolean = True);
var Template, NewTemplate, DocType, Vis: OleVariant;
    TemplName, InitialDir: string;
begin
  if ShablonName <> EmptyStr then
  begin
    InitialDir := InitDir;
    TemplName := IncludeTrailingPathDelimiter(InitialDir) + ShablonName;
    Template := TemplName;
    NewTemplate := False;
    Vis := DocVsbl;
    DocType := 0;
    if FileExists(TemplName) then
    begin
      WordApplicOpen(WordDocum,WordApplic, TemplName, Template, NewTemplate, DocType, Vis, True);
      WordApplic.Visible := DocVsbl;
    end
    else ErrorFmtDlg(SDataModErrorTemplateNotExists, [ShablonName]);
  end;
end;



end.
 