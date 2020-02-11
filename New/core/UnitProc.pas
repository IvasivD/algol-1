unit UnitProc;

interface
uses ShlObj,Forms,Windows,Classes,Messages,Dialogs,SysUtils, Controls, StdCtrls,iniFiles,Spin,ExtCtrls ,DB, Menus, WinSock , cxRadioGroup, FileCtrl,
     cxDBLookupComboBox,cxGrid,cxCheckComboBox,cxGridCustomTableView,cxGridTableView,cxGRidDBTableView,cxFilter,cxCheckBox,ADODB,cxPC, Math,ShellCtrls,NB30,
     cxImageComboBox, cxDropDownEdit,ShellAPI,cxLookAndFeelPainters,cxDBExtLookupComboBox,Graphics,MSHTML,WinInet,IdHTTP,cxTextEdit,cxCalendar,cxTreeView,ComCtrls,Variants,
     IdFTP,IdFTPList ,cxMemo, jpeg ,Tlhelp32,DateUtils, cxDBLookupEdit ,cxSpinEdit,cxDBEdit , cxCheckListBox ,cxTrackBar ,dxmdaset,Clipbrd,Printers,WinSpool,registry, Buttons,
     CommCtrl, ActiveX,ComObj,EncdDecd,cxDBTL,cxClasses,cxCurrencyEdit,cxEdit, IBQuery, IBTable,IBDatabase,IdSSLOpenSSL,SHDocVw,XMLDoc, XMLIntf,
     xmldom, Xmlxform,Provider,ADOInt,DBTables,cxImage,dxGDIPlusClasses  ;

const MasMonth:array[1..12] of string =('January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December');
      MasMonthRus:array[1..12] of string = ('января', 'февраля', 'марта', 'апреля','мая', 'июня', 'июля', 'августа', 'сентября', 'октября', 'ноября','декабря');
      MasDayShortUkr  :array[1..7] of string = ('Пн','Вт','Ср','Чт','Пт','Сб','Нд');
      //MasDayUkr  :array[1..7] of string = ('Понеділок','Вівторок','Середа','Четвер','П''ятниця','Субота','Неділя');
      UnixStartDate: TDateTime = 25569.0; // 01/01/1970

      gNormalPixelsPerInch = 96;

type
  TOptMessageDlgButs = ( but_OK, but_YES_NO, but_OK_CANCEL, but_YES_NO_CANCEL, but_RETRY_CANCEL, but_ABORT_RETRY_IGNORE);
  TOptMessageDlgButRes = (res_OK, res_CANCEL, res_ABORT, res_RETRY, res_IGNORE, res_YES, res_NO, res_CLOSE, res_HELP);

  TOptTypeConnect =(optTypeConIB,optTypeConADO,optTypeConUnknown );
  TConnectDBParam = record
    UID:WideString;
    Password:WideString;
    PathDB:WideString;
    ADOConnection:TADOConnection;
    IBDatabaseConnection:TIBDatabase;
    DatabaseConnection:TDatabase;
    TypeConnect : TOptTypeConnect;
  end;

  TOptKeyboardLayout = (klEnglish,klRussian,klUkrainian);

  PShellLinkInfoStruct = ^TShellLinkInfoStruct;
  TShellLinkInfoStruct = record
    FullPathAndNameOfLinkFile: array[0..MAX_PATH] of Char;
    FullPathAndNameOfFileToExecute: array[0..MAX_PATH] of Char;
    ParamStringsOfFileToExecute: array[0..MAX_PATH] of Char;
    FullPathAndNameOfWorkingDirectroy: array[0..MAX_PATH] of Char;
    Description: array[0..MAX_PATH] of Char;
    FullPathAndNameOfFileContiningIcon: array[0..MAX_PATH] of Char;
    IconIndex: Integer;
    HotKey: Word;
    ShowCommand: Integer;
    FindData: TWIN32FINDDATA;
  end;

 TMasValues=array of variant;

 TNavBut=(NwFirst,NwPriorPage,NwPrior,NwNext,NwNextPage,NwLast,NwInsert,
         NwDelete,NwEdit,NwPost,NwCancel,NwRefresh,NwSaveBookmark,NwGotoBookmark,NwFilter);

 TMyImageSize=record
        Width :single;
        Height:single;
        LeeftShift:single;
        BorderWidth:Single;
 end;
 TMyDateFormat=Record
        Year:Integer;
        Month:Integer;
        Day:Integer;
        end;
 TMyResultBolValue=record
        Value:Variant;
        Status:Boolean;
        end;
 TMyParamBuildDatasetbyViewSummeryGroup=record
        IndGroupColFromView:integer;
        ColGroupValueGrop  :array of string;
        ColToField         :array of string;
        end;

 TMyStringListIndex = record
      List:TStringList;
      Index:TList;
 end;

 // Ping

  ip_option_information = packed record // Информация заголовка IP (Наполнение
    // этой структуры и формат полей описан в RFC791.
    Ttl: byte; // Время жизни (используется traceroute-ом)
    Tos: byte; // Тип обслуживания, обычно 0
    Flags: byte; // Флаги заголовка IP, обычно 0
    OptionsSize: byte; // Размер данных в заголовке, обычно 0, максимум 40
    OptionsData: Pointer; // Указатель на данные
  end;

  icmp_echo_reply = packed record
    Address: u_long; // Адрес отвечающего
    Status: u_long; // IP_STATUS (см. ниже)
    RTTime: u_long; // Время между эхо-запросом и эхо-ответом
    // в миллисекундах
    DataSize: u_short; // Размер возвращенных данных
    Reserved: u_short; // Зарезервировано
    Data: Pointer; // Указатель на возвращенные данные
    Options: ip_option_information; // Информация из заголовка IP
  end;

  PIPINFO = ^ip_option_information;
  PVOID = Pointer;
 //*********************
 

procedure SwitchToThisWindow(Wnd: HWND; Restore: Boolean); stdcall; external 'user32.dll' name 'SwitchToThisWindow';

function  BrowseForFolder(const browseTitle: String; const initialFolder: String ='';
                         mayCreateNewFolder: Boolean = False): String;
procedure FindFile(Path:String;Var List:TStringList;Mask:String;Param:Integer);
procedure LoadContrFromIni(AParent:TComponent;AfileIni,Afolder:String;AExtKey:String='');
procedure SaveContrToIni(AParent:TComponent;AfileIni,Afolder:String;AExtKey:String='');
function  MyCopyFileApi( ASource,ADest:string ):Boolean;
function  MyCopyFile (FromPath, ToPath: string):Boolean;
Function  MyCopyAllFiles(DirFrom,DirTo:widestring;AMask:String;Aprogres:TProgressBar=nil;IncludeFolder:Boolean=true):TStringList;

Function  ExistsDir(Dir:String):String;
procedure CreateAllDir(APath:String);
Function  FindExistsLevelDir(APath:String):String;

procedure CreateIniFile(AFileName:String;ASection,AKey:String;AValue:String);

Procedure ShowFormInPositionButton(AForm:TForm;Butt:TWinControl;Alignment:TAlignment;Top:Boolean=False);
Procedure ShowControlInPositionPoint(Acontrol:TControl;Point:TPoint;Alignment:TAlignment;Top:Boolean=False);

function  ReplaseON( var MainStr: Widestring; SubStrOld, SubStrNew: Widestring):boolean;
function  ReplaceONJustFromPosition( var MainStr: Widestring; SubStrOld, SubStrNew: WideString; Position:Integer):boolean;
function  ParsePath(CurrPath:String;LevelUp:Integer;FromLast:Boolean=false):string;
Function  ReadIniFile(AFileName:String;ASection,AKey:String):String;
procedure DeleteIniFileKey(AFileName:String;ASection,AKey:String);
procedure DeleteIniFileSection(AFileName:String;ASection:string);
Function  ReadIniFileSection(AFileName:String;ASection:string):TStringList;
function  GetFileNameOptionIni(ExtName:string=''):string;

function  GetCountRowOnDB(Acon:TAdoConnection;Atablename,AMainFieldKod,AMainValueKod:String;ExtSql:String):integer;
function  ExtReturtSQL(Acon:TAdoConnection;ASql:WideString):variant;
function  ExecuteSQL(Acon:TAdoConnection;ASql:WideString):Integer;
Procedure FormingImageComboboxColumnByComboboxItem(Items: TcxImageComboBoxItems;AlistData,AListDataValue:TStringList;UseDescriptAsValue:Boolean=false);
Procedure FormingImageComboboxColumn(Column:TcxGridDBColumn;AlistData,AListDataValue:TStringList;UseDescriptAsValue:Boolean=false);
Procedure FormingImageComboboxTreeColumn(Column:TcxDBTreeListColumn;AlistData,AListDataValue:TStringList;UseDescriptAsValue:Boolean=false);

Function  MakeStringListForArray(aStrArray:array of String):TStringList;
function  FindImageIndexFromListIndex(ListIndex:TMyStringListIndex;Value:Variant):Integer;
procedure FormingImageIndexForColumn( Column:TcxGridDBColumn; ListIndex:TMyStringListIndex; imageList:TImageList );
procedure FormingImageIndexForColumnTree( Column:TcxDBTreeListColumn; ListIndex:TMyStringListIndex; imageList:TImageList );

Procedure FormingImageComboBox(CmbImage:TcxImageCombobox;AlistData:TStringList;UseDescriptAsValue:Boolean=false);
function  CreteMenuItem( Amenu:TmenuItem;Name:String; Act:TNotifyEvent; aStr:string; ImageIndex:Integer=-1;Enabled:Boolean = true ):TmenuItem; overload;
function  CreteMenuItem( Amenu:TPopUpMenu;Name:String; Act:TNotifyEvent; aStr:string; ImageIndex:Integer=-1;Enabled:Boolean = true ):TmenuItem; overload;
procedure CreateMenuDB( DB:TDataSet; FieldId, FiedlName, PrefixMenuItem:string;
                        Amenu:TmenuItem; Act:TNotifyEvent );

function  AdValueToCombox(Items:TcxImageComboBoxItems;Value:Variant;ADescription:String;ImageIndex:Integer=-1):TcxImageComboBoxItem;
procedure PreapareImageComboBoxFromDBICONBlob( CbBox: TcxImageComboBox; DB:TDataset;FieldId,FieldName,FieldICON:string; CanUpdate:Boolean );
function  ConvertFieldTypeToString(FieldData:TFieldType):String;
//procedure NawVisibleButton(AView:TcxGRidDBTableView;Locked:Boolean;MasVisibleButton:Array of Boolean);
Procedure SetEvenetOnNawView(AView:TcxGRidDBTableView;But:TNavBut;Event:TNotifyEvent);
procedure ShowPropertyMenu(Control:TControl;Amenu:TPopUpMenu; MenuCapt:Array of string;Act:array of TNotifyEvent);
function  ReadValueMenuItemForIni(FileIni:String;Amenu:TPopUpMenu;Control:TControl):string;
function  CloneItemMenuSubToPopUp( MItem:TMenuItem ):TPopUpMenu;
function  AddMItemToPopUpMenuOrToNewPopAp( Owner:TComponent; aPopUp:TPopUpMenu; NameButton , aCaption:String;
                                          Act:TNotifyEvent; AddSpliterMenu:Boolean=True; ImageIndex:Integer=-1;Enabled:Boolean = true ):TmenuItem;

Function  ShowDialogMessage(ACaption,AText:String;Var Value:String):Boolean;
procedure FindSubDirFiles(StartDir:string;Mask:string;var List:TStringList;IncludeFolder:Boolean=true;Param:integer=1);
Procedure BuildShelTree(ApathToFolder,AStartpath:String; Atree:TCxTreeView; ShowCountFiles:Boolean;MaskFilesCount:string);
Function  GetCurrPathFromTree(Atree:TCxTreeView; CurrNode:TTreeNode):string;
function  GetCountFilesForPath(Apath:String;Mask:String;IncludeSubFolder:Boolean=True):Integer;
function  AddNolForLengthNumber(Anumber:string;AMaxdigital:Integer;ch:string='0'):string;
Function  SeparateNumber(Anumber,ASeparator:String;step:Integer):string;
function  MyGetFileSize(FileName: string): Longint;
function  MyGetFolderSize ( path: string ): Longint;
function  CalculateSizeFilePixel(FileName:String):String;
function  CalculateSizeFileIn(FileName:String;DPI:Integer ):String;
function  IsStrANumber(const S: string;JusInt:Boolean=false): Boolean;
function  VarToInt(const AVariant: Variant): integer;
function  ReadFromIniAsociationColumnAndParam(AiniFile,ColumnName:String):string;
Procedure SaveToIniAsociationColumnAndParam(AiniFile,ColumnName:String;Value:Variant);
function  GetLocalIP: String;
function  GetMACAdress: string;
Procedure RetMasFieldDataFormView(Aview:TcxGRidDBTableView;FieldName:string;Var MasID:array of Widestring;Distinct:Boolean);
function  IsNullValue(Avalue:Variant;DefValue:widestring=''):widestring;
function  ConvertDateTime(Date:TdateTime;TypeDate:Integer=0;MySeparatorDate:char='.'):String;
Function  MyStrToDate(DateStr:String;FormatDate:String='yyyy-mm-dd hh24:mm:ss'):TDateTime;

//Function  GetListFileFTP(Login,Pass,Adress:String; aList: TstringList; Mask:string='*.*';FtpPath:string='/'):Boolean;
//Function  DeleteFilesFromFtp(Login,Pass,Adress:String;FileList:TStringList;FtpPath:string='/'):Boolean;
//Function  UploadFileFTP(Login,Pass,Adress:String;FileName:string;MessageIFExists:Boolean=false; FileNameOnFTP:String='';FtpPath:string='/'):Boolean;
function  DayOfWeekEngByNumber(NDay: Integer): string;
function  DayOfWeekEng(S: TDateTime): string;
function  DayOfWeekRusByNumber(NDay: Integer): widestring;
function  DayOfWeekRus(S: TDateTime): widestring;
function  DayOfWeekUkrByNumber(NDay: Integer): widestring;
function  DayOfWeekShortUkrByNumber( NDay: Integer ) : widestring;
function  DayOfWeekShortUkr(S: TDateTime): widestring;

function  NumberDayOfWeekByEngName(name: string): integer;
function  GetDateWeekByDayOfWeek(aData:TDate;aDayOfWeek:integer):TDate;
Function  GetDateWeekByDayOfWeekFromDate(aData:TDate;aDayOfWeek:integer):TDate;
function  GetDateWeekByNameDay(aData:TDate;aDayName:String):TDate;
Function  GetMonthEnNameByNumber(MonthNumber:integer):String;
Function  GetMonthRusNameByNumber(MonthNumber:integer):String;
Function  GetMonthDay(aDate:TDate):String;
function  GetMonthDayRus(aDate:TDate): string;
Function  GetDateLastDayMonth(aDate:Tdate):Tdate;
Function  GetDateLastDayYear(aDate:Tdate):Tdate;
Function  GetDateFirstDayYear(aDate:Tdate):Tdate;

function  GetIndexFromFileName(var FileName:widestring;RemoveIndex:boolean):Integer;
Procedure DelAllFilesFromLevelDir(Dir:String;Mask:String);
procedure DelAllFilesFromDir(StartDir: string; Mask:string);
procedure DelDir(StartDir: string; Mask:string);
Function  ConvertTimeToMS(aTime:TTime):int64;
Function  ConvertMSToTime(aMs:int64):TDateTime;
function  RunExeFileAndWait(const FileProgram: string;CreationFlag:Cardinal=CREATE_NO_WINDOW): Boolean;
Function  CheckLastSleshOnPath(Path:string;Present:Boolean; Slash:string='\'):string;
function  AppIsResponding(WindowName: string): Boolean;
procedure SendTextToHandle(Handle:THandle;WindowName:String; AText:String;RestoreWindow:Boolean);
procedure FormFocus(hWnd: HWND; nCmdShow: Integer; Delay: Integer = 0);
Function  GetPathForParam(InifileName,ParamName:String):String;
Procedure AddPathForParam(InifileName,ParamName:String;Value:String);
Function  MyCreateMutex(MutexName:string):Thandle;
procedure MyDeleteMutex(aHandle:THandle);
Function  MyCheckMutex(MutexName:string):Thandle;
procedure SetPropInCxtLookupComboBox(ComboBoxDB:TcxLookUpComboBox;
                                     ListSource :TDataSource; aListFieldName, aKeyField:String; CanUpdate:Boolean; Destroy:Boolean=false);
procedure SetPropInDBCxEdit(EditDB:TcxDBTextEdit;DAtasource:Tdatasource;Datafield:String;CanUpdate:Boolean;Destroy:Boolean=false);
procedure SetPropInDBCxSpinEdit(EditDB:TcxDBSpinEdit;DAtasource:Tdatasource;Datafield:String;CanUpdate:Boolean;Destroy:Boolean=FALSE);
procedure SetPropInDBComboBox(EditCmbBox:TcxDBComboBox;DAtasource:Tdatasource;Datafield:String;CanUpdate:Boolean;Destroy:Boolean=FALSE);
procedure SetPropInDBCheckBox(DBCheckBox:TcxDBCheckBox;DAtasource:Tdatasource;Datafield:String;CanUpdate:Boolean;Destroy:Boolean=false);
procedure SetPropInCxExtLookupComboBox(ComboBoxDB:TcxExtLookupComboBox;
                                         aView:TcxGridDBTableView; aListFieldName, aKeyField:String; CanUpdate:Boolean; Destroy:Boolean=false);
procedure InitLocateDBKeyValueInCxExtLookupComboBox(ComboBoxDB:TcxExtLookupComboBox);
procedure SetPropInCxColumnExtLookupComboBox(ColExtLookUpProperty:TcxExtLookupComboBoxProperties;
                                         aView:TcxGridDBTableView; aListFieldName, aKeyField:String; CanUpdate:Boolean; Destroy:Boolean=false);

procedure SetPropInDBCxExtLookupComboBox(ComboBoxDB:TcxDBExtLookupComboBox;DAtasource:Tdatasource;Datafield:String;
                                         aView:TcxGridDBTableView; aListFieldName, aKeyField:String; CanUpdate:Boolean; Destroy:Boolean=false);
procedure SetPropInDBImageComboBox(ComboBoxDB:TcxDBImageComboBox;DAtasource:Tdatasource;Datafield:String;CanUpdate:Boolean;Destroy:Boolean=false);

Function  EnableInputJustNumber(Sender: TObject; Key: Char;IsDecimal:boolean=true):Char;
Function  EnableInputJustLatAndDigit(Sender: TObject; Key: Char):Char;
Function  EnableInputJustLat(Sender: TObject; Key: Char):Char;
function  ThisIsChar(achar:WideChar):boolean;
Function  ThisIsLatChar(aChar:Char):Boolean;
Function  DeleteAllGarbageFromStr(Astr:widestring;DelDigital:Boolean):widestring;
Function  DeleteAllCharStayJustDigitalFromStr(Astr:widestring):widestring;
function  EnableInputJustChar(Sender: TObject; Key: Char):Char;
Function  EnableInputNumberChar(Sender: TObject; Key: Char;MasEnableChar:array of Char):Char;

function  KillTask(ExeFileName: string;AcceptProcessID:Cardinal=0): Integer;
Function  CheckDateForinterval(aDate:TDate;aFrom,aTo:TDate):boolean;
Function  GetDateFirstDayMonth(aDate:Tdate):Tdate;
Procedure SetAllAttrForFiles(Path:String;Mask:String;attr:Integer);
Procedure CopySelectFileByDailog(FilterMask:String;CopyPathTo:String;Aprogres:TProgressBar=nil);
procedure DeleteFilesFormView(aView:TcxGRidDBTableView;FieldFileName:String;Aprogres:TProgressBar=nil);
Procedure MoveSelectFilesFromView(aView:TcxGRidDBTableView;FieldFileName,MoveToPath:String; Aprogres:TProgressBar=nil);


Procedure ListRandom(aList:TStringList;Count:integer=1);
Function  GetFileDateTime(FileName: string): TDateTime;
function  GetDirDateTime(const Dir: string): TDateTime;
Function  CheckDayFromSelectBox(ChListBox:TcxCheckListBox;ForDateTime:TDatetime):boolean;
procedure GetArrStatusCheckListBox(MaxCount:Integer; aValueListBox:variant; var ResValues:TMasValues);
function  FindSimilaryValuesInTwoArr(Arr1,Arr2:array of Variant; TrueValues:Variant):Boolean;
procedure SetDateModifiedToFile(FileName: string; aDate:TDateTime);

Function  GetDateTimeFormat(aDateTime:TDateTime):String;
Function  GetDateFormat(aDateTime:TDateTime;ShortMonth:Boolean=false):String;
Function  GetCurrDateFormat:String;
function  FileIsLock(FileName: string): Boolean;
Function  CheckFilesFolderIsLocked(aPath:String):boolean;
procedure LockControl(c: TWinControl; bLock: Boolean);
Function  GetFirstSubPathNotHiden(aPath:String;ExceptAtribute:Integer):String;
Procedure CreateEmptyFile(Path,NameFile:String);
function  PathIsHide(aPath:String):Boolean;
Procedure SortMultiSelFilesOpenDialog(aOpenDialog:TOpenDialog;aToListFiles:TStringList);
Function  ParseDateFromStr(StrWithDate:wideString;StartPos:Integer):TMyDateFormat;
Function  ParseDateTimeFromStr( StrWithDate:wideString;StartPos:Integer=1 ):TDateTime;
Procedure WindowsPlayMp3(aHandle:Thandle;aFileName:String);
procedure MyShowFolder(aHandle:THandle;aPath:String);
Procedure MyShowWindowsFile(aHandle:THandle;aFileName:String);
Function  MySelectFile(KeySavePath,FilterMask:String):String;
Function  MySelectFileDialog(Path,FilterMask:String):String;
Function  MySaveFileDialog(Path,FilterMask:String):String;
function  MyLoadImageFromSelectFile(Path,FilterMask:String;Img:TImage):Boolean; overload;
function  MyLoadImageFromSelectFile(Path,FilterMask:String;Img:TcxImage):Boolean; overload;
function  LoadImageInImageDialog(aImage:TImage):boolean; overload;
function  LoadImageInImageDialog(aImage:TcxImage):boolean; overload;
procedure LoadImageInImage(aImage:TImage;aFileName:string);overload;
procedure LoadImageInImage(aImage:TcxImage;aFileName:string);overload;
procedure LoadPhotoToImage( Img:TcxImage; aFieldName,aFileEmptyName:String );
procedure SaveFromImageToFileJpg( aImage:TImage;aFileName:string); overload;
procedure SaveFromImageToFileJpg( aImage:TcxImage; aFileName:string ); overload;
procedure SaveFromImageToFilePng( aImage:TImage; aFileName:string ); overload;
procedure SaveFromImageToFilePng( aImage:TcxImage; aFileName:string ); overload;

Function  MyIfThen(aValue:Boolean;IfTrue,IfFalse:Variant):Variant;
Procedure UpdateValueBySQL(aCon:TAdoConnection;aSql:String;masFieldName:array of String;MasValueForField:array of variant);
Function  SetNormalValueForSql(Avalue:WideString):WideString;

Function  UpFirstChar(Atext:Widestring):widestring;
Procedure PrepareColumnMarkerTag(aView:TcxGRidTableView;masCapt:array of String;MarkerTag:Integer);
Function  CorrectText(Atext:wideString):wideString;

Procedure SaveListCheckViewToIni(AfileIni,AExtKey:String;aView:TcxGRidDbTableView;FieldID:string;aList:TList);
Procedure ReadListCheckViewToIni(AfileIni,AExtKey:String;aView:TcxGRidDbTableView;FieldID:string;aList:TList);
function  ChangeDigitAndCharPlace(aStr:WideString):WideString;
procedure ClosePDF(AfileName:string);
Function  DigitalIsEven(aValue:Integer):Boolean;

Function  AddHistoryToCmBox(CBBox:TcxCombobox;Text:String):boolean;
Procedure LoadFronIniHistoryCmBox(AfileIni,Afolder:String; CBBox:TcxCombobox);
Procedure SaveIniHistoryCmBox(AfileIni,Afolder:String; CBBox:TcxCombobox);
//Procedure BuildDatasetbyViewSummeryGroup(aView:TcxGridTableView;ColGroupInd,IndSummary:Integer;aDataset:TDataset;FiledGoup,fieldRes:String;ParamExtCol:TMyParamBuildDatasetbyViewSummeryGroup);
Function  ParseTextToList(aText:widestring;Split:array of string;IncludeSpliterToWord:Boolean=false):TStringList;
function  GetControlHandle(AHandle: HWND; ControlTextRus,ControlTextEn, Classname:widestring):THandle;
function  PasteFromClipBoardPhoneTo3Edit(Code:String;Edit1,Edit2,Edit3:TCxTextedit):boolean;
procedure FormatMask(var MaskStr:widestring;Maskchar, MaskValue:widestring);
function  ParseTextInQuotes(ALNGText:wideString;Var StartIndex:Integer;KawChar:WideChar;KawCharEnd:wideChar=#0):wideString;
procedure MyNetDownload(Owner:TComponent;Url:WideString;FileName:String);
function  GetInetFile(const fileURL, FileName: string): boolean;
Function  ConvertTimeToZone(aDateTime:TDateTime;TimeShift:real):TDateTime;
Function  ConvertimeZoneToRealFormat(ShiftPart:String):real;
Function  ConvertimeZoneToStrFormat(ShiftReal:Real):String;
Function  GetTime(aDateTime:TDateTime):TTime;
Function  TimeToJustHour(aTime:TTime):TTime;
function  StringToWideString(const s: AnsiString; codePage: Word): WideString;
function  WideStringToString(const ws: WideString; codePage: Word): AnsiString;
Function  DecPlusInt(Val1,Val2:Integer):integer;
Function  FindBeginParam(aLine:wideString;KawChar:widechar;IndexPos:Integer):Integer;
Procedure CopyDB(aFromDB,aToDB: TDataset;AcceptField:array of String;aFfieldSaveIDFrom:String='';aFfieldSaveIDTo:String='');
Function  ConvertStrToAsciKod(aStr,KodBeforeChar:String;LengthChar:integer=3):String;
Procedure CopyMasArray(aMasFrom:TMasValues;var aMasTo:TMasValues);
Procedure PrepareListPaperSize(PaperName:TStringList;PaperValue:TStringList;PrinterIndex:Integer=-1);
Procedure PrepareListPrinter(PrinterName:TStringList;PrinterValue:TStringList);
procedure SetDefaultPrinter(PrinterName: String) ;
procedure GetListPrinters(List: TStringList;ConvertToXLS:boolean=false;ExcelVersion:Real=11);
function  GetDefaultPrinterName:string;
Function  ConVertNamePrinterToXLS(aPrinterName:String;ExcelVersion:Real):String;
function  FindPrintIndexByName(NamePrint:Widestring):Integer;
function  DateTimeToUnix(dtDate: TDateTime): Longint;
function  UnixToDateTime(USec: Longint): TDateTime;
Function  AlignTextToWidth(aText:widestring;aWidth:Integer;AligAddChar:wideChar=' '):widestring;
Function  FormingShortlyTextToWidth(aText:widestring;aWidth:Integer;StartBefore:widestring='...'):widestring;
Function  FormingShortlyTextToWidthByControl(aControl:TControl; aText:widestring;aWidth:Integer;StartBefore:widestring='...';EndContiniue:widestring='...'):widestring;
Procedure MergePdfToTemplate(MainPdf,TemplatePdf,ReSultFilaName,PathToPDF_FTK:String);
Procedure SplitPdfToPages(MainPdf,PathOutput,ParamOutput,PathToPDF_FTK:String);
Procedure SetPagesToPdf(PdfPagesPath,MaskTextPage,PostText,FontName:wideString;FontSize:Integer;PathToUtil_PDF:String);
function  GetFileExtAssociatedIcon(const AFileName: string; AIsSmallIcon, AIsLink: Boolean): HIcon;
procedure GetFileExtAssociatedIconSaveToFile( FileName,SaveToFile: string; AIsSmallIcon, AIsLink: Boolean;Width,Height:Integer);
Function  GetFileExtAssociatedIconSaveToStrem( FileName: string; AIsSmallIcon, AIsLink: Boolean; Width,Height:Integer):TMemoryStream;
function  GetFileTypeStr(const strFilename: string): string;
function  GetIconFomApplication(aBig:Boolean) :TIcon;
function  CheckExtOnGraficFile( ExtFile:String ):Boolean;
function  GetMaskFilterGraphicFiles:string;
procedure MyCopyAndUnBlockFile(FileName,CopyToPath:String);
Procedure MyStreamFileCopy( const sourceFileName, targetFileName: String );
function  GetNewIndexFileName(const aSourceFile: string; aID: Integer = 0): string;
procedure RotateBitmap(Bitmap: TBitmap; Angle: Double; BackColor: TColor);
Function  LoadDataFromBlobFiled( Blob: TBlobField ):TMemoryStream;
function  MyFileExists(FileName:String):Boolean;
function  MyDeleteFile(FileName:String):Boolean;
procedure MyDeleteFilesByListNames( aList:TStringList );
function  UrlDecode(Str: string): string;
function  UrlEncode(Str: string): string;
function  BestFitCharcters(const AInput: AnsiString): AnsiString;
function  CheckCyrillicSymbol(S: String): Boolean;
Function  BitmapToIco( Bmp: TBitmap ):TIcon;
procedure ImageListIndexToImage( Img:TImage;ImageList:TImageList;ImageIndex:integer );
procedure ImageListIndexToSpeedButton( but:TSpeedButton;ImageList:TImageList;ImageIndex:integer );
function  FileGraphicCheckOnSize(FileName:string;SizeW:Integer;SiseH:Integer):Boolean;
procedure JPegToBitmap(FileName:widestring;ToBitmap:TBitmap);
procedure LoadImagesToListFormPath( aPath:Widestring; ListIndex:TMyStringListIndex;  mask:array of String; ToImageList:TImageList );
procedure StringToBinaryStream(const S: string; AStream: TMemoryStream);
function  BinaryStreamToString(AStream: TMemoryStream): string;
function  GetAttribFileLink(FileLink:String):TShellLinkInfoStruct;
function  StringSimilarityRatio(const Str1, Str2: String; IgnoreCase: Boolean=true): Double;
Function  SplitToWords(Str:widestring):TStringList;
Function  SplitToWordsBySpliters( Str:widestring; aSplits:array of String ):TStringList;
function  StringIsLike(const Str1, Str2: String;DeltaCompare:Real =0.55;CalcMaxCountWords:Boolean=true):Boolean;
function  CrackEaGetMail(PathToEaGetMail:Widestring=''):boolean;
function  GetWinDir: string;
function  MyShowMessageDlg(const Msg: string; DlgType: TMsgDlgType; Buttons: TOptMessageDlgButs ):TOptMessageDlgButRes;
function  GetMonthsBetween(FirstDate, LastDate: TDate): integer;
function  ParseTextBetweenMarks(ALNGText:String;Var StartIndex:Integer;KawChar:Char;KawCharEnd:Char=#0):String;
procedure PostKeyEx32(key: Word; const shift: TShiftState; specialkey: Boolean);
function  OpenFileName(ForDir:String;AFilter:String):String;
function  OpenGraphicFileName(ForDir:String):String;
Function  ShowDialogColor(ACurrentColor:TColor):TColor;
function  RGBtoHTMLColor(cl: TColor; ResultType: Word): string;
function  ColorToHtml(DelphiColor:TColor):string;
function  HtmlToColor(Color: string): TColor;
Function  ReadParam(AHtmlKod:String;KeyWord:String;KawChar:Char='"'):String;
Function  ChechInPartWord(MainStr,KeyWord:String;FromIndex:Integer):Boolean;
Function  ChechInPartWordArr(MainStr:string; KeyWords:array of String;FromIndex:Integer):Boolean;
function  GetIdYoutubeUrl(url:Widestring):WideString;
function  ParseUrlWithoutParam(url:Widestring):WideString;
function  CheckDataInSelectCheckBox(CheckComboBox:TcxCheckComboBox;aText:String ):boolean;
procedure FillDataCheckBox(CheckComboBox:TcxCheckComboBox;AListData:TStringList);
Function  ConvertFileToBase64(FileName:String;ForHtml:Boolean=false):Widestring;
procedure ConvertBase64ToFile( CodeStrBase64:Widestring; SaveToFileName:String);
Function  CalculatePosText( Canvas:TCanvas; Text:String;Rect:TRect;aLignHor:TAlignment; aLignVert:TcxAlignmentVert ):TPoint;
function  CalculateHeightControlForText(aControl:TWinControl;aText:Widestring;DeltaW:Integer):Integer;
procedure PostEditValue(Parent:TControl);
function  ValidateValueControl( control:TControl;MessError:widestring;NotNol:Boolean=false  ):boolean;
function  GenGuid: String;
procedure PositionFormCenter( aForm:TForm; offsetX, offsetY:Integer );
procedure PositionFormCenterFromMainForm( aForm:TForm; offsetX:Integer = 0; offsetY:Integer = 0 );
procedure CreateDayWeekOnCheckListBox( ChListBox:TcxCheckListBox; MasDay:array of String );
procedure CreateDayWeekOnColumnCombobox( ChComboColumn:TcxCheckComboBoxProperties; MasDay:array of String );

procedure CreateMonthWeekOnCheckListBox( CmbImage:TcxImageCombobox; MasMonth:array of String );
procedure CreateDayByMonthOnImageListBox( CmbImage:TcxImageCombobox; Month:Integer );
procedure SetEnabledControlsOnFrom(aForm:TWinControl; En:Boolean);
procedure SetEnabledControlsOnFromByClassName(aForm:TWinControl;ClassName:TClass;En:Boolean);
procedure SetEnabledChildControls(aParent:TWinControl;En:Boolean; AcceptControls:array of TWinControl; AcceptClassName:array of TClass);

function Ping(Host: string; TimeOut:Integer=5000 ): boolean;
function TranslitRusToLat( s:Widestring ):Widestring;
function TranslitUkrToLat( s:Widestring ):Widestring;
function TranslitRusToUkr( s:Widestring ):Widestring;
function TranslitUkrToRus( s:Widestring ):Widestring;
function TranslitLatToUkr( s:Widestring ):Widestring;
function TranslitLatToRus( s:Widestring ):Widestring;
Function AllWordsInUpFirstChar(aStr:Widestring):Widestring;

Procedure TestIBDatasetOnDataForm(aOwner:TComponent;SaveProblemToFile:String; Progress:TProgressBar );

function FoldTwoIntToInt( first, Sec:Integer ): Integer;
function GetTwoIntFromFoldInt( value: Integer): TPoint;
procedure ChangeKeyBoardLayout( klOption:TOptKeyboardLayout = klUkrainian );
function  FindFormByCaption(Caption:TCaption):TForm;
function  FindFormByCaptionAndRestoreOnTop( aFormCaption:Widestring ):TForm;
function  GetFormForComponent( aComponent:TComponent ):TForm;
function  FindDatasourceByDataset(aDataset:TDataset):TDataSource;
procedure WebBrowserBlank(WB:TWebBrowser);
procedure WebBrowserSetHTMLCode( WebBrowser: TWebBrowser; HTMLCode: string );
function  WebBrowserGetHTMLCode(WebBrowser: TWebBrowser; ACode: TStrings): Boolean;
function  GetCommonPartFromPaths( aPath1:Widestring; aPath2:Widestring ) : Widestring;
function  PreparePathToWebPath(aPath:Widestring):Widestring;
function  PrpareBlockContentToPrefixPathShow( HtmlContent , PathPrefix :String;aColorBGBrowser:string='' ) : TStringList;
function  PrpareBlockFileContentToPrefixPathShow( ContentFileName , PathPrefix :String; aColorBGBrowser:string='' ) : TStringList;
function  GetArrPathsFromWebBrowser( WebBrowser: TWebBrowser; TagName, TagChildName, AttrName : string  ):TStringList;
procedure SetArrPathsFromWebBrowser( WebBrowser: TWebBrowser; TagName, TagChildName, AttrName : string;PathListObj:TStringList );
procedure PreparePathsAttrFromWebBrowser( WebBrowser: TWebBrowser; TagName, TagChildName, AttrName : string; AddPrefixToPath:String='\');
function  GetTextFromFile( aFileName:widestring ):WideString;
procedure SaveTextToFile( aText:WideString; aFileName:widestring );
function  GetStringFromFileByByte(const FileName: string): String;
function  FindStrInFile(FileName,StrToFind: string):boolean;
Function  MyGetModulePath:Widestring;
function  GetParamWebConfig(const FileName: WideString;SectionName,Key:Widestring ): WideString;
Function  GetDosOutput( const CommandLine, WorkDir: String; var ResultCode: Cardinal ): String;
function  GetCountVisiblePages( PControl:TcxPageControl ):Integer;
function  MaskFormatRegExp(Mask:string; Value:String): string;
function  FindComponentByName(aCompName:String; aControl:TComponent ):TComponent;
function  FindComponentByNameArr( aCompName:array of String; aControl:TComponent;StartIndSearch:Integer=0  ):TComponent;
function  StringsToDelimited(Strings: TStrings): string;
procedure DelimitedToStrings(const Delimit: string; Strings: TStrings);
procedure DBAddBlobFileData( DB:TDataset; fieldName, FileName:String );
function  FindArrKeyWordInStr( KeyWords: Array of widestring; SourceStr:WideString;PrefixKeyWord:Widestring='';EndfixKeyWord:Widestring='' ):TStringList;
procedure SynchronizeButtonPanelAndPmenu(ButPanel:TPanel;Pm:TPopupMenu);
function  CheckOnClassName(aCurrControl:TWinControl; AcceptClassName:array of TClass):Boolean;
function  GetNamePathForComponent(aComponent:TComponent):String;

function  FindAllClassFrom(Path:String;mask:string='*.dfm';SubDirFind:Boolean=False):TStringList;
//**************** Ping ********************************************************
function IcmpCreateFile(): THandle; stdcall; external 'ICMP.DLL' name 'IcmpCreateFile';
function IcmpCloseHandle(IcmpHandle: THandle): BOOL; stdcall; external 'ICMP.DLL' name 'IcmpCloseHandle';
function IcmpSendEcho(
  IcmpHandle: THandle; // handle, возвращенный IcmpCreateFile()
  DestAddress: u_long; // Адрес получателя (в сетевом порядке)
  RequestData: PVOID; // Указатель на посылаемые данные
  RequestSize: Word; // Размер посылаемых данных
  RequestOptns: PIPINFO; // Указатель на посылаемую структуру
  // ip_option_information (может быть nil)
  ReplyBuffer: PVOID; // Указатель на буфер, содержащий ответы.
  ReplySize: DWORD; // Размер буфера ответов
  Timeout: DWORD // Время ожидания ответа в миллисекундах
  ): DWORD; stdcall; external 'ICMP.DLL' name 'IcmpSendEcho';

function RecordsetFromXML(const XML: string): _Recordset;
function RecordsetToXML(const Recordset: _Recordset): string;
function GetSystemFont: TFont;


var       lg_StartFolder: String;

implementation

//******************************************************************************
(*procedure NawVisibleButton(AView:TcxGRidDBTableView;Locked:Boolean;MasVisibleButton:Array of Boolean);
Var I:Integer;
begin
 //******************Set Visible Button****************************************
 For i:=0 to Aview.NavigatorButtons.ButtonCount-1 do
   begin
    Aview.NavigatorButtons[i].Visible:=False;
    if (MasVisibleButton[i]=true)then Aview.NavigatorButtons[i].Visible:=TRue;
   end;
 //*************************************************************************
     AView.OptionsData.Deleting :=not Locked;
   //*************************************************
     AView.OptionsData.Editing  :=not Locked;
   //*************************************************
//     AView.OptionsData.Appending:=not Locked;F
   //*************************************************
     AView.OptionsData.Inserting:=not Locked;
 //***************************************************************
   Aview.OptionsBehavior.NavigatorHints:=True;
 //***************************************************************
  IF LEngth(MasVisibleButton)<>0 then Aview.OptionsView.Navigator:=True
     Else Aview.OptionsView.Navigator:=FAlse;
   Aview.OptionsData.DeletingConfirmation:=false;
 //****************************************************************************
end;*)
//******************************************************************************
Procedure SetEvenetOnNawView(AView:TcxGRidDBTableView;But:TNavBut;Event:TNotifyEvent);
begin
 case But Of
       NwFirst    :Aview.NavigatorButtons.First.OnClick    :=Event;
       NwPriorPage:Aview.NavigatorButtons.PriorPage.OnClick:=Event;
       NwPrior    :Aview.NavigatorButtons.Prior.OnClick    :=Event;
       NwNext     :Aview.NavigatorButtons.Next.OnClick     :=Event;
       NwNextPage :Aview.NavigatorButtons.NextPage.OnClick :=Event;
       NwLast     :Aview.NavigatorButtons.Last.OnClick     :=Event;
       NwInsert   :Aview.NavigatorButtons.Insert.OnClick   :=Event;
       NwDelete   :Aview.NavigatorButtons.Delete.OnClick   :=Event;
       NwEdit     :Aview.NavigatorButtons.Edit.OnClick     :=Event;
       NwPost     :Aview.NavigatorButtons.Post.OnClick     :=Event;
       NwCancel   :Aview.NavigatorButtons.Cancel.OnClick   :=Event;
       NwRefresh  :Aview.NavigatorButtons.Refresh.OnClick  :=Event;
       NwSaveBookmark:Aview.NavigatorButtons.SaveBookmark.OnClick:=Event;
       NwGotoBookmark:Aview.NavigatorButtons.GotoBookmark.OnClick:=Event;
       NwFilter      :Aview.NavigatorButtons.Filter.OnClick:=Event;
  end;
end;
//******************************************************************************
//******************************************************************************
function BrowseForFolderCallBack(Wnd: HWND; uMsg: UINT; lParam,
lpData: LPARAM): Integer stdcall;
begin
  if uMsg = BFFM_INITIALIZED then
    SendMessage(Wnd,BFFM_SETSELECTION, 1, Integer(@lg_StartFolder[1]));
  result := 0;
end;
//******************************************************************************
function ReplaseON( var MainStr: Widestring; SubStrOld, SubStrNew: Widestring):boolean;
var PosSubStrOld: integer;
begin
  result:=false;
  //StringReplace(MainStr,SubStrOld,SubStrNew,[rfReplaceAll, rfIgnoreCase]);
  PosSubStrOld:= 1;
  if Ansipos(SubStrOld,SubStrNew)<>0 then exit;     // No cycled
  while PosSubStrOld <> 0 do
  begin
    PosSubStrOld:= AnsiPos(AnsiLowerCase(SubStrOld), AnsiLowerCase(MainStr));
    if PosSubStrOld <> 0 then
       begin
        if AnsiPos('K@REPL@', MainStr)<>0 then
        begin
          ShowMessage('STOP');
          exit;
        end;

        MainStr:=Copy(MainStr, 1, PosSubStrOld-1)+SubStrNew+
                 Copy(MainStr, PosSubStrOld + Length(SubStrOld), Length(MainStr));
        result:=true;
       end;
  end;
end;
//******************************************************************************
function ReplaceONJustFromPosition( var MainStr: Widestring; SubStrOld, SubStrNew: WideString; Position:Integer):boolean;
var PosSubStrOld: integer;
begin
  result:=false;
  //StringReplace(MainStr,SubStrOld,SubStrNew,[rfReplaceAll, rfIgnoreCase]);
  PosSubStrOld:= Position;
  if Ansipos(SubStrOld,SubStrNew)<>0 then exit;     // No cycled
  //while PosSubStrOld <> 0 do
  //begin
    //PosSubStrOld:= AnsiPos(AnsiLowerCase(SubStrOld), AnsiLowerCase(MainStr));
  if PosSubStrOld <> 0 then
     begin
      if AnsiPos('K@REPL@', MainStr)<>0 then
      begin
        ShowMessage('STOP');
        exit;
      end;

      MainStr:=Copy(MainStr, 1, PosSubStrOld-1)+SubStrNew+
               Copy(MainStr, PosSubStrOld + Length(SubStrOld), Length(MainStr));
      result:=true;
     end;
  //end;
end;
//******************************************************************************
//******************************************************************************
function BrowseForFolder(const browseTitle: String;
  const initialFolder: String ='';
  mayCreateNewFolder: Boolean = False): String;
const
  BIF_NEWDIALOGSTYLE=$40;
  BIF_NONEWFOLDERBUTTON=$200;

var
  browse_info: TBrowseInfo;
  folder: array[0..MAX_PATH] of char;
  find_context: PItemIDList;

begin
  
  //--------------------------
  // Initialise the structure.
  //--------------------------
  FillChar(browse_info,SizeOf(browse_info),#0);
  lg_StartFolder := initialFolder;
  browse_info.pszDisplayName := @folder[0];
  browse_info.lpszTitle := PChar(browseTitle);
  browse_info.ulFlags := BIF_RETURNONLYFSDIRS or BIF_NEWDIALOGSTYLE;
  if not mayCreateNewFolder then
    browse_info.ulFlags := browse_info.ulFlags or BIF_NONEWFOLDERBUTTON;

  browse_info.hwndOwner := Application.Handle;
  if initialFolder <> '' then
    browse_info.lpfn := BrowseForFolderCallBack;
  find_context := SHBrowseForFolder(browse_info);
  if Assigned(find_context) then
  begin
    if SHGetPathFromIDList(find_context,folder) then
      result :=  folder
    else
      result := '';
    GlobalFreePtr(find_context);
  end
  else
    result := '';
end;
//******************************************************************************
procedure FindFile(Path:String;Var List:TStringList;Mask:String;Param:Integer);
Var FileSearch:TSearchRec;
begin
  //List.Clear;
  if FindFirst(Path+Mask, faAnyFile, FileSearch)=0 THEN
   repeat
    if (FileSearch.Name<>'.')and(FileSearch.Name<>'..')then
    begin //1
    if (Param=0)and(FileSearch.Attr =faDirectory)
        then  List.Add(FileSearch.Name);
    if (Param=1)and(FileSearch.Attr<>faDirectory)and(FileSearch.Attr<>8208)and
       (FileSearch.Attr <> 8240 )
       then List.Add(FileSearch.Name);

    if (Param=2) then List.Add(FileSearch.Name);
    if (Param=3) and (FileSearch.Attr<>faHidden)
        then  List.Add(FileSearch.Name);        //not Hiden

    if (Param=4) and(FileSearch.Attr<>faDirectory) and (FileSearch.Attr<>8230)
        then  List.Add(FileSearch.Name);

    end; //1
   until FindNext(FileSearch)<>0;
  sysutils.FindClose(FileSearch);
end;
//******************************************************************************
Procedure SetAllAttrForFilesByList(List:TStringList;attr:Integer);
var i:integer;
    Flags: Integer;
begin
  for i:=0 to List.Count-1 do
  begin
    Flags := GetFileAttributes( PChar(List[i]) );
    FileSetAttr( PChar(List[i]) , Flags and attr );
  end;
end;
//******************************************************************************
Procedure SetAllAttrForFiles( Path:String; Mask:String; attr:Integer );
var List:TStringList;
    i:integer;
    Flags: Integer;
begin
  try
   List:=TStringList.Create;
   findSubDirFiles( Path, Mask, List, false);
   SetAllAttrForFilesByList( List, attr);
  finally
   FreeAndNIl( List );
  end;
end;
//******************************************************************************
//CheckExtOnGraficFile( ExtFile:String ):Boolean;
//******************************************************************************
procedure CreateIniFile(AFileName:String;ASection,AKey:String;AValue:String);
var Ini:TiniFile;
    KEY:string;
begin
   try
    Ini:=TiniFile.Create(AFileName);
    INI.WriteString(ASection,AKEY,AValue);
   finally
    Ini.Free;
   end;
end;
//******************************************************************************
Function ReadIniFile(AFileName:String;ASection,AKey:String):String;
var Ini:TiniFile;
    KEY:string;
begin
   try
    Ini:=TiniFile.Create(AFileName);
    Result:=INI.ReadString(ASection,AKEY,'');
   finally
    Ini.Free;
   end;
end;
//******************************************************************************
procedure  DeleteIniFileKey(AFileName:String;ASection,AKey:String);
var Ini:TiniFile;
    KEY:string;
begin
   try
    Ini:=TiniFile.Create(AFileName);
    INI.DeleteKey(ASection,AKEY);
   finally
    Ini.Free;
   end;
end;
//******************************************************************************
procedure  DeleteIniFileSection(AFileName:String;ASection:string);
var Ini:TiniFile;
    KEY:string;
begin
   try
    Ini:=TiniFile.Create(AFileName);
    INI.EraseSection(ASection);
   finally
    Ini.Free;
   end;
end;
//******************************************************************************
Function ReadIniFileSection(AFileName:String;ASection:string):TStringList;
var Ini:TiniFile;
begin
 result:=TStringLIst.Create;
  try
   Ini:=TiniFile.Create(AFileName);
   Ini.ReadSection(ASection,Result);
  finally
   Ini.Free;
  end;
end;
//******************************************************************************
function IsStrANumber(const S: string;JusInt:Boolean=false): Boolean;
var
  P: PChar;
  DecimalSep:string[1];
begin
  P      := PChar(S);
  Result := False;

  if LowerCase(S)='e' then exit;
  if LowerCase(S)='-' then exit;

  if JusInt then DecimalSep:=''
     else DecimalSep:=DecimalSeparator;

  while P^ <> #0 do
  begin
    //************************
    if not (P^ in ['0'..'9','-',DecimalSep[1]]) then
       begin
         Result := False;
         Exit;
       end;
    //************************
    Inc(P);
    Result := True;
  end;
end;
//******************************************************************************
function VarToInt(const AVariant: Variant): integer;
begin
  if VarIsNull( AVariant ) then
    Result := 0
  else
    Result := AVariant;
end;
//******************************************************************************
procedure SaveContrToIni(AParent:TComponent;AfileIni,Afolder:String;AExtKey:String='');
var i:integer;
    j:integer;
    Value:string;
    Key:String;
    currPath:string;
    atext:Widestring;
    BigValue:Int64;
begin
  if  Afolder<>'' then Afolder:=Afolder+'\';
  CurrPath:=ExtractFilePath(Application.ExeName)+Afolder;
  Key:=AParent.Name+'_Options'+AExtKey;
  if ExtractFilePath(AfileIni)<>'' then CurrPath:='';

  if AParent.Tag<>-1 then
     begin
        //**************************
        if (AParent is TForm)and(TForm(AParent).BorderStyle=bsSizeable) then
           begin
            CreateIniFile(CurrPath+AfileIni,Key,AParent.Name+'Width',IntToStr(TWinControl(AParent).Width));
            CreateIniFile(CurrPath+AfileIni,Key,AParent.Name+'Height',IntToStr(TWinControl(AParent).Height));
           end;
        //**************************
        if AParent.Tag<>-2 then
           begin
            CreateIniFile(CurrPath+AfileIni,Key,AParent.Name+'Top',IntToStr(TWinControl(AParent).Top+Screen.MonitorFromWindow(TForm(AParent).Handle).Top-TForm(AParent).Monitor.Top));
            CreateIniFile(CurrPath+AfileIni,Key,AParent.Name+'Left',IntToStr( TWinControl(AParent).Left+Screen.MonitorFromWindow(TForm(AParent).Handle).Left-TForm(AParent).Monitor.Left));
           end;
        CreateIniFile(CurrPath+AfileIni,Key,AParent.Name+'MonitorNumber',IntToStr(Screen.MonitorFromWindow(TForm(AParent).Handle).MonitorNum));
     end;

  for i:=0 to AParent.ComponentCount-1 do
      begin //1
         if  AParent.Components[i] is TCheckBox then
             begin
                if AParent.Components[i].Tag<>-1 then
                   begin
                     if TCheckBox(AParent.Components[i]).Checked then  CreateIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name,'1')
                        else CreateIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name,'0');
                   end;
             end;
        //*************************************************************************************
        if  AParent.Components[i] is TcxCheckBox then
             begin
                if AParent.Components[i].Tag<>-1 then
                   begin
                     if TcxCheckBox(AParent.Components[i]).Checked then  CreateIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name,'1')
                        else CreateIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name,'0');
                   end;
             end;
        //*************************************************************************************
         if  AParent.Components[i] is TcxCheckListBox then
             begin
               if AParent.Components[i].Tag<>-1 then
                  begin
                   for j:=0 to TcxCheckListBox(AParent.Components[i]).Items.Count-1 do
                       begin
                        if TcxCheckListBox(AParent.Components[i]).Items[j].Checked then Value:='1'
                           else Value:='0';
                        CreateIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name+'_'+IntToStr(j), Value);
                       end;
                  end;
             end;
        //*************************************************************************************
         if  AParent.Components[i] is TcxRadioButton then
             begin
                if AParent.Components[i].Tag<>-1 then
                   begin
                     if TcxRadioButton(AParent.Components[i]).Checked then  CreateIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name,'1')
                        else CreateIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name,'0');
                   end;
             end;
        //*************************************************************************************
         if  AParent.Components[i] is TEdit then
             begin
              if TEdit(AParent.Components[i]).Tag<>-1 then
                 CreateIniFile(CurrPath+AfileIni,Key,AParent.Components[i].Name, TEdit(AParent.Components[i]).Text);
             end;
        //*************************************************************************************
         if  AParent.Components[i] is TcxTextEdit then
             begin
               if AParent.Components[i].Tag<>-1 then
                  begin
                    if TcxTextEdit(AParent.Components[i]).Tag=0 then
                       CreateIniFile(CurrPath+AfileIni,Key,AParent.Components[i].Name, TcxTextEdit(AParent.Components[i]).Text);
                  end;
             end;
        //*************************************************************************************
         if  AParent.Components[i] is TMemo then
             begin
               if AParent.Components[i].Tag<>-1 then
                  begin
                   atext:=TMemo(AParent.Components[i]).Text;
                   ReplaseOn(atext,#13#10,'^^^');
                   CreateIniFile(CurrPath+AfileIni,Key,AParent.Components[i].Name, atext);
                  end;
             end;
        //*************************************************************************************
         if  AParent.Components[i] is TcxMemo then
             begin
               if AParent.Components[i].Tag<>-1 then
                  begin
                   atext:=TcxMemo(AParent.Components[i]).Text;
                   ReplaseOn(atext,#13#10,'^^^');
                   CreateIniFile(CurrPath+AfileIni,Key,AParent.Components[i].Name, atext);
                  end;
             end;
        //*************************************************************************************
         if  AParent.Components[i] is TSpinEdit then
             if AParent.Components[i].Tag<>-1 then
                CreateIniFile(CurrPath+AfileIni,Key,AParent.Components[i].Name, TSpinEdit(AParent.Components[i]).Text);
        //*************************************************************************************
         if  AParent.Components[i] is TComboBox then
             if AParent.Components[i].Tag<>-1 then
                CreateIniFile(CurrPath+AfileIni,Key,AParent.Components[i].Name, IntToStr(TComboBox(AParent.Components[i]).ItemIndex));
        //*************************************************************************************
         if  AParent.Components[i] is TcxComboBox then
             begin
               if AParent.Components[i].Tag<>-1 then
                  begin
                    CreateIniFile(CurrPath+AfileIni,Key,AParent.Components[i].Name, IntToStr(TcxComboBox(AParent.Components[i]).ItemIndex));
                  end;
             end;
        //*************************************************************************************
         if  AParent.Components[i] is TcxCheckComboBox then
             if (AParent.Components[i].Tag<>-1) then
                begin
                 if TcxCheckComboBox(AParent.Components[i]).EditValue<>null then
                    begin
                     BigValue:=TcxCheckComboBox(AParent.Components[i]).EditValue;
                     Value:=IntToStr(BigValue);
                    end
                     else Value:='';

                     CreateIniFile(CurrPath+AfileIni,Key,AParent.Components[i].Name, Value);
                end;
        //*************************************************************************************
         if  AParent.Components[i] is TcxDateEdit then
             if AParent.Components[i].Tag<>-1 then
                begin
                  if TcxDateEdit(AParent.Components[i]).Text<>'' then
                      Value:= DateToStr(TcxDateEdit(AParent.Components[i]).date)
                        else Value:='';
                         CreateIniFile(CurrPath+AfileIni,Key,AParent.Components[i].Name, Value);
                end;

        //*************************************************************************************
         if  AParent.Components[i] is TcxImageComboBox then
             if AParent.Components[i].Tag<>-1 then
                begin
                 if TcxImageComboBox(AParent.Components[i]).EditValue=null then Value:=''
                    else
                      if IsStrANumber(TcxImageComboBox(AParent.Components[i]).EditValue) then  value:=IntToStr(TcxImageComboBox(AParent.Components[i]).EditValue)
                         else value:=TcxImageComboBox(AParent.Components[i]).EditValue;

                 CreateIniFile(CurrPath+AfileIni,Key,AParent.Components[i].Name, value);
                end;
        //*************************************************************************************
         if  AParent.Components[i] is TcxLookupComboBox then
             if (AParent.Components[i].Tag<>-1) then
                 begin
                  if TcxLookupComboBox(AParent.Components[i]).EditValue<>null then Value:=TcxLookupComboBox(AParent.Components[i]).EditValue
                     else Value:='';
                  CreateIniFile(CurrPath+AfileIni,Key,AParent.Components[i].Name, Value);
                 end;
        //*************************************************************************************
        if  AParent.Components[i] is TcxExtLookupComboBox then
            begin
               if AParent.Components[i].Tag<>-1 then
                  begin
                    if TcxExtLookupComboBox(AParent.Components[i]).EditValue<>null then
                       CreateIniFile(CurrPath+AfileIni,Key,AParent.Components[i].Name, TcxExtLookupComboBox(AParent.Components[i]).EditValue)
                        else  CreateIniFile(CurrPath+AfileIni,Key,AParent.Components[i].Name, '');
                  end;
            end;

         if  AParent.Components[i] is Tpanel then
              begin
                if AParent.Components[i].Tag<>-1 then
                   begin
                    CreateIniFile(CurrPath+AfileIni,Key,AParent.Components[i].Name+'_height', IntToStr(Tpanel(AParent.Components[i]).Height));
                    CreateIniFile(CurrPath+AfileIni,Key,AParent.Components[i].Name+'_Width', IntToStr(Tpanel(AParent.Components[i]).Width));
                   end;
              end;
          //*************************************************************************************
         if AParent.Components[i] is TcxPageControl then
            begin
               if AParent.Components[i].Tag<>-1 then
                  begin
                   CreateIniFile(CurrPath+AfileIni,Key,AParent.Components[i].Name, IntToStr(TcxPageControl(AParent.Components[i]).ActivePageIndex));
                   CreateIniFile(CurrPath+AfileIni,Key,AParent.Components[i].Name+'_height', IntToStr(TcxPageControl(AParent.Components[i]).Height));
                   CreateIniFile(CurrPath+AfileIni,Key,AParent.Components[i].Name+'_Width' , IntToStr(TcxPageControl(AParent.Components[i]).Width));
                  end;
            end;
          //*************************************************************************************
         if  AParent.Components[i] is TSpeedButton then
             begin

               if (AParent.Components[i].Tag<>-1)and(TSpeedButton(AParent.Components[i]).AllowAllUp) then
                  begin
                     if TSpeedButton(AParent.Components[i]).Down then CreateIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name,'1')
                         else CreateIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name,'0');
                  end;
             end;
          //*************************************************************************************
         if AParent.Components[i] is TColorBox then
             if AParent.Components[i].Tag<>-1 then
                CreateIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name,IntToStr(TColorBox(AParent.Components[i]).ItemIndex));
          //*************************************************************************************

         if Aparent.Components[i] is TShellListView then
          begin
            if AParent.Components[i].Tag<>-1 then
               begin
                CreateIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name,TShellListView(Aparent.Components[i]).RootFolder.PathName);
                for j:=0 to TShellListView(Aparent.Components[i]).Columns.Count-1 do
                     begin
                       CreateIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name+'Column_'+IntToStr(j),IntToStr(TShellListView(Aparent.Components[i]).Columns.Items[j].Width));
                     end;
               end;
          end;

        { if Aparent.Components[i] is TShellComboBox then
            begin
              CreateIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name,TShellComboBox(Aparent.Components[i]).Path);
              //CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name);
              //if CurrValue<>'' then TShellComboBox(Aparent.Components[i]).Path:=CurrValue;
            end;}

      if  Aparent.Components[i] is TDriveComboBox then
           begin
            if AParent.Components[i].Tag<>-1 then
               CreateIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name,TDriveComboBox(Aparent.Components[i]).Drive);
           end;

      if  Aparent.Components[i] is TDirectoryListBox then
           begin
             if AParent.Components[i].Tag<>-1 then
                begin
                 if TDirectoryListBox(Aparent.Components[i]).ItemIndex<>-1 then
                    CreateIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name,TDirectoryListBox(Aparent.Components[i]).Directory);
                end;
           end;

      if  Aparent.Components[i] is TFileListBox then
          begin
            if AParent.Components[i].Tag<>-1 then
               CreateIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name,TFileListBox(Aparent.Components[i]).FileName);
          end;

     (* if  Aparent.Components[i] is TCxVerticalGrid then
          begin
          if AParent.Components[i].Tag<>-1 then
             CreateIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name+'_Width',IntToStr(TCxVerticalGrid(Aparent.Components[i]).OptionsView.RowHeaderWidth));
          end;   *)

      if  Aparent.Components[i] is TcxTrackBar then
          begin
             if AParent.Components[i].Tag<>-1 then
                CreateIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name ,IntToStr(TcxTrackBar(Aparent.Components[i]).Position));

          end;

     if  Aparent.Components[i] is TTrackBar then
          begin
             if AParent.Components[i].Tag<>-1 then
                CreateIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name ,IntToStr(TTrackBar(Aparent.Components[i]).Position));
          end;

      end;
end;
//******************************************************************************
procedure LoadContrFromIni(AParent:TComponent;AfileIni,Afolder:String;AExtKey:String='');
var i:integer;
    j:integer;
    Value:string;
    Key:String;
    currPath:string;
    CurrValue:string;
    atext:Widestring;
    IndexMonitor:Integer;
    Atop:integer;
    Aleft:integer;
    Awidth:Integer;
    Aheight:integer;
    Ev:TNotiFyEvent;
    BigInt:Int64;
begin
  if  Afolder<>'' then Afolder:=Afolder+'\';
  CurrPath:=ExtractFilePath(Application.ExeName)+Afolder;
  Key:=AParent.Name+'_Options'+AExtKey;
  if ExtractFilePath(AfileIni)<>'' then CurrPath:='';

  if AParent.Tag<>-1 then
     begin
      //CreateIniFile(CurrPath+AfileIni,Key,AParent.Name+'MonitorNumber',IntToStr(Screen.MonitorFromWindow(TForm(AParent).Handle).MonitorNum));
      CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Name+'MonitorNumber');
      if CurrValue<>'' then
         IndexMonitor:=strToInt(CurrValue)
           else IndexMonitor:=0;

      if (AParent is TForm)and(TForm(AParent).BorderStyle=bsSizeable) then
         begin
          CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Name+'Width');
          if CurrValue<>'' then TWincontrol(AParent).Width:=StrToInt(CurrValue);

          CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Name+'Height');
          if CurrValue<>'' then TWincontrol(AParent).Height:=StrToInt(CurrValue);
         end;

      CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Name+'Top');
      if CurrValue<>'' then TWincontrol(AParent).Top:=StrToInt(CurrValue);

      CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Name+'Left');
      if CurrValue<>'' then TWincontrol(AParent).Left:=StrToInt(CurrValue);

    end;

   for i:=0 to AParent.ComponentCount-1 do
      begin //1
       try

         if  AParent.Components[i] is TCheckBox then
             begin
             if AParent.Components[i].Tag<>-1 then
                begin
                   CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name);
                   if CurrValue='1' then TCheckBox(AParent.Components[i]).Checked:=true
                      else
                       if CurrValue='0' then TCheckBox(AParent.Components[i]).Checked:=false;
                end;
             end;

         if  AParent.Components[i] is TcxCheckBox then
             begin
                if AParent.Components[i].Tag<>-1 then
                   begin
                     CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name);
                     if CurrValue='1' then TcxCheckBox(AParent.Components[i]).Checked:=true
                        else
                          if CurrValue='0' then TcxCheckBox(AParent.Components[i]).Checked:=false;
                   end;
             end;

         if  AParent.Components[i] is TcxCheckComboBox then
             begin
                if AParent.Components[i].Tag<>-1 then
                   begin
                     CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name);
                     if IsStrANumber(CurrValue) then TcxCheckComboBox(AParent.Components[i]).Value:=StrToInt64(CurrValue);
                   end;
             end;

         if  AParent.Components[i] is TcxCheckListBox then
             begin
               if AParent.Components[i].Tag<>-1 then
                  begin
                   for j:=0 to TcxCheckListBox(AParent.Components[i]).Items.Count-1 do
                       begin
                        CurrValue:=ReadIniFile(CurrPath+AfileIni, Key , AParent.Components[i].Name+'_'+IntToStr(j) );

                        if CurrValue='1' then TcxCheckListBox(AParent.Components[i]).Items[j].Checked:=true
                           else
                             if CurrValue='0' then  TcxCheckListBox(AParent.Components[i]).Items[j].Checked:=false;
                       end;
                  end;
             end;

         if  AParent.Components[i] is TcxRadioButton then
             begin
              if TEdit(AParent.Components[i]).Tag<>-1 then
                 begin
                   CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name);
                   if CurrValue='1' then TcxRadioButton(AParent.Components[i]).Checked:=true
                      else
                       if CurrValue='0' then TcxRadioButton(AParent.Components[i]).Checked:=false;
                 end;
             end;

         if  AParent.Components[i] is TEdit then
             begin
              if TEdit(AParent.Components[i]).Tag<>-1 then
                 TEdit(AParent.Components[i]).Text:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name);
             end;

         if  AParent.Components[i] is TcxTextEdit then
             begin
              if TcxTextEdit(AParent.Components[i]).Tag<>-1 then
                 TcxTextEdit(AParent.Components[i]).Text:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name);
             end;

         if  AParent.Components[i] is TcxDateEdit then
             begin
              if TcxDateEdit(AParent.Components[i]).Tag<>-1 then
                 begin
                   CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name);
                   if CurrValue<>'' then TcxDateEdit(AParent.Components[i]).Date:=StrToDate(CurrValue);
                 end;
             end;

         if  AParent.Components[i] is TMemo then
              begin
               if AParent.Components[i].Tag<>-1 then
                  begin
                    atext:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name);
                    ReplaseOn(atext,'^^^',#13#10);
                    TMemo(AParent.Components[i]).Text:=atext;
                  end;
              end;

         if  AParent.Components[i] is TcxMemo then
              begin
               if AParent.Components[i].Tag<>-1 then
                  begin
                    atext:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name);
                    ReplaseOn(atext,'^^^',#13#10);
                    TcxMemo(AParent.Components[i]).Text:=atext;
                  end;
              end;

         if  AParent.Components[i] is TSpinEdit then
             begin
               if AParent.Components[i].Tag<>-1 then
                  begin
                    CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name);
                    if IsStrANumber(CurrValue) then  TSpinEdit(AParent.Components[i]).Text:=CurrValue;
                  end;
             end;

         if  AParent.Components[i] is TComboBox then
             begin
               if AParent.Components[i].Tag<>-1 then
                  begin
                    CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name);
                    if IsStrANumber(CurrValue) then TComboBox(AParent.Components[i]).ItemIndex:=StrToInt(CurrValue);
                  end;
             end;

         if  AParent.Components[i] is TcxComboBox then
             begin
               if AParent.Components[i].Tag<>-1 then
                   begin
                     CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name);
                     if IsStrANumber(CurrValue) then TcxComboBox(AParent.Components[i]).ItemIndex:=StrToInt(CurrValue);
                   end;
             end;

         if  AParent.Components[i] is TcxImageComboBox then
             begin
              try
                if AParent.Components[i].Tag<>-1 then
                   begin
                    CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name);
                    if IsStrANumber(CurrValue) then TcxImageComboBox(AParent.Components[i]).EditValue:=StrToInt(CurrValue)
                       else
                         if CurrValue<>'' then TcxImageComboBox(AParent.Components[i]).EditValue:=CurrValue;

                    if @TcxImageComboBox(AParent.Components[i]).Properties.OnCloseUp<>nil then
                       TcxImageComboBox(AParent.Components[i]).Properties.OnCloseUp(nil);
                   end;
               except
               end;
             end;

         if  AParent.Components[i] is TcxLookupComboBox then
             begin
                if AParent.Components[i].Tag<>-1 then
                   begin
                    CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name);
                    if CurrValue<>'' then TcxLookupComboBox(AParent.Components[i]).EditValue:=CurrValue
                       else TcxLookupComboBox(AParent.Components[i]).EditValue:=null;
                   end;
             end;

         if  AParent.Components[i] is TcxExtLookupComboBox then
             begin
                if AParent.Components[i].Tag<>-1 then
                   begin
                      CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name);
                      if CurrValue<>'' then TcxExtLookupComboBox(AParent.Components[i]).EditValue:=CurrValue
                         else TcxExtLookupComboBox(AParent.Components[i]).EditValue:=null;
                   end;
             end;

         if  AParent.Components[i] is Tpanel then
              begin
                if AParent.Components[i].Tag<>-1 then
                   begin
                    CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name+'_height');
                    if IsStrANumber(CurrValue) then
                       Tpanel(AParent.Components[i]).Height:=StrToInt(CurrValue);
                    CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name+'_Width');
                    if IsStrANumber(CurrValue) then Tpanel(AParent.Components[i]).Width:=StrToInt(CurrValue);
                   end;
              end;

         if AParent.Components[i] is TcxPageControl then
            begin
               if AParent.Components[i].Tag<>-1 then
                  begin
                    CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name);
                    if IsStrANumber(CurrValue) then TcxPageControl(AParent.Components[i]).ActivePageIndex:=StrToInt(CurrValue);

                    CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name+'_height');
                    if IsStrANumber(CurrValue) then TcxPageControl(AParent.Components[i]).Height:=StrToInt(CurrValue);

                    CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name+'_Width');
                    if IsStrANumber(CurrValue) then TcxPageControl(AParent.Components[i]).Width:=StrToInt(CurrValue);

                  end;
            end;

        if  AParent.Components[i] is TSpeedButton then
             begin
               if (AParent.Components[i].Tag<>-1)and(TSpeedButton(AParent.Components[i]).AllowAllUp) then
                  begin
                   CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name);
                   if Trim(CurrValue)='1' then
                      begin
                       TSpeedButton(AParent.Components[i]).Down:=true;
                       if @TSpeedButton(AParent.Components[i]).OnClick<>nil then
                          TSpeedButton(AParent.Components[i]).OnClick(nil); // Click;
                      end;
                  end;
             end;

        if AParent.Components[i] is TColorBox then
           begin
           if AParent.Components[i].Tag<>-1 then
              begin
                CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name);
                if IsStrANumber(CurrValue) then  TColorBox(AParent.Components[i]).ItemIndex:=StrToInt(CurrValue);
              end;
           end;
          //********************************************************************

       if Aparent.Components[i] is TShellListView then
          begin
           if AParent.Components[i].Tag<>-1 then
              begin
                  CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name);
                  if CurrValue<>'' then
                     if ExtractFilePath(CurrValue)<>'' then TShellListView(Aparent.Components[i]).Root:=ExtractFilePath(CurrValue);

                  for j:=0 to TShellListView(Aparent.Components[i]).Columns.Count-1 do
                       begin
                         CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name+'Column_'+IntToStr(j));
                         if IsStrANumber(CurrValue) then
                            TShellListView(Aparent.Components[i]).Columns.Items[j].Width:=StrToInt(CurrValue);
                       end;
              end;
          end;

       if  Aparent.Components[i] is TDriveComboBox then
           begin
              if AParent.Components[i].Tag<>-1 then
                 begin
                  CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name);
                  if CurrValue<>'' then
                     TDriveComboBox(Aparent.Components[i]).Drive:=CurrValue[1];
                 end;
           end;

       if  Aparent.Components[i] is TDirectoryListBox then
           begin
              if AParent.Components[i].Tag<>-1 then
                 begin
                    CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name);
                    if CurrValue<>'' then
                       TDirectoryListBox(Aparent.Components[i]).Directory:=CurrValue;
                 end;
           end;
      if  Aparent.Components[i] is TTrackBar then
          begin
            if AParent.Components[i].Tag<>-1 then
               begin
                 CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name);
                 if IsStrANumber(CurrValue) then
                    TTrackBar(AParent.Components[i]).Position:=StrToInt(CurrValue);
               end;
          end;
     if  Aparent.Components[i] is TCxTrackBar then
          begin
            if AParent.Components[i].Tag<>-1 then
               begin
                 CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name);
                 if IsStrANumber(CurrValue) then
                    TCxTrackBar(AParent.Components[i]).Position:=StrToInt(CurrValue);
               end;
          end;
        //*************************************************************************************
      if  Aparent.Components[i] is TFileListBox then
          begin
          if AParent.Components[i].Tag<>-1 then
             begin
                CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name);
                if CurrValue<>'' then
                     TFileListBox(Aparent.Components[i]).FileName:=CurrValue;
             end;
          end;
        //*************************************************************************************
     (* if  Aparent.Components[i] is TCxVerticalGrid then
          begin
          if AParent.Components[i].Tag<>-1 then
             begin
               CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, AParent.Components[i].Name+'_Width');
               if IsStrANumber(CurrValue) then TCxVerticalGrid(Aparent.Components[i]).OptionsView.RowHeaderWidth:=StrToInt(CurrValue);
             end;
          end;  *)
        //*************************************************************************************
       except
        ShowMessage('Sys error: '+Aparent.Components[i].Name);
       end;
      //*************************************************************************************
      end;
end;
//******************************************************************************
function MyCopyFile (FromPath, ToPath: String):Boolean;
var NewFileName:string;
begin
  result:=false;
  //*****************************************
  if CompareText( AnsiUpperCase(FromPath), AnsiUpperCase(ToPath) ) =0 then Exit;
  if not FileExists(FromPath)then exit;
  // If FileExists(ToPath)      then exit;
  //*****************************************
  NewFileName:=ExtractFileName( ToPath );
  if NewFileName='' then
  begin
    NewFileName:=ExtractFileName( FromPath );
    ToPath := ToPath + NewFileName;
  end;

  ExistsDir(ExtractFilePath(ToPath));
  if FileExists(ToPath) then
    if CompareText(FromPath,ToPath)<>0 then DeleteFile(PChar(ToPath));

  //CopyFileW( PWideChar(FromPath), PWideChar(ToPath),False );
  CopyFileA( PAnsiChar(FromPath), PAnsiChar(ToPath),False );
  result := TRUE;
end;
//******************************************************************************
function MyCopyFileApi( ASource,ADest:string ):Boolean;
var P:_SHFILEOPSTRUCT;
begin
  P.Wnd:=Application.Handle;
  P.wFunc := FO_COPY;
  P.pFrom := PChar(ASource);
  P.pTo := PChar(ADest);
  P.fFlags:=FOF_RENAMEONCOLLISION;

  SHFileOperation(P);
  Result:=not P.fAnyOperationsAborted;
end;
//******************************************************************************
Function MyCopyAllFiles(DirFrom,DirTo:widestring;AMask:String;Aprogres:TProgressBar=nil;IncludeFolder:Boolean=true):TStringList;
var i:integer;
    onlyFindFile:wideString;
begin
 if not DirectoryExists(DirFrom)then exit;
 //*********************************
 Result := TStringList.Create;
 //*********************************
 if Aprogres<>nil then
    begin
      Aprogres.Position:=0;
      Aprogres.Max:=result.Count;
    end;
 //*********************************
 FindSubDirFiles(DirFrom,Amask,result,IncludeFolder);
 //***********************************
 for i:=0 to result.Count-1 do
 begin //2

   OnlyFindFile:=(result.Strings[i]);
   ReplaseOn(onlyFindFile,DirFrom,'');

   if result.Strings[i][Length(result.Strings[i])]='\' then
   begin //1
     if not DirectoryExists(DirTo+onlyFindFile) then
       CreateAllDir(DirTo+onlyFindFile+'\');
   end   //1
   else
   begin
     try
       MyCopyFile ((result.Strings[i]),(DirTo+onlyFindFile));
     except

      //MessageDlg('Файл '+'['+onlyFindFile+'] використовується іншою програмою', mtError, [mbOK], 0);
      //exit;
     end;
     
   end;
   //**************************************************
   if Aprogres<>nil then
   begin
     Aprogres.Position:=Aprogres.Position+1;
     Aprogres.Repaint;
   end;
 end; //2
 //********************************
end;
//******************************************************************************
procedure CreateAllDir(APath:String);
var i:integer;
    SubDir:WideString;
    Kil:Integer;
    rem:Integer;
    ExePath :String;
begin
 ExePath:=ExtractFilePath(Application.ExeName);
 kil:=0;
 //*************************************************
 for i:=1 To Length(APath) do
    begin //1
     if APath[i]='\' then
     begin //1
      kil:=0;
      SubDir:=copy(APath,1,i);
      if (Trim(SubDir)<>'\')and(Trim(SubDir)<>'\\')then
          begin
           try
            if (not DirectoryExists(SubDir))and(AnsiPos(SubDir,ExePath)=0)

                then MkDir(SubDir);
            except
             //exit;
            end;
          end;

     end;//1
    end;  //1
end;
//******************************************************************************
Function ExistsDir(Dir:String):String;
begin
 if not DirectoryExists(Dir) then
        CreateAllDir(Dir);
 result:=Dir;
end;
//******************************************************************************
Function FindExistsLevelDir(APath:String):String;
var i:integer;
    SubDir:WideString;
    Kil:Integer;
    rem:Integer;
    ExePath :String;
    OldSubDir:String;
begin
 ExePath:=ExtractFilePath(Application.ExeName);
 kil:=0;
 result:='';
 //*************************************************
 for i:=1 To Length(APath) do
    begin //1
      if APath[i]='\' then
         begin //1
          kil:=0;
          SubDir:=copy(APath,1,i);
          if (Trim(SubDir)<>'\')and(Trim(SubDir)<>'\\')then
              begin
               try
                if (not DirectoryExists(SubDir))and(AnsiPos(SubDir,ExePath)=0) then
                      begin
                        result:=OldSubDir;
                        break;
                      end
                       else OldSubDir:=SubDir;
                except

                end;
              end;
         end;//1
    end;  //1
  //*****************************
  if result='' then result:=APath;
end;
//******************************************************************************
Procedure ShowControlInPositionPoint(Acontrol:TControl;Point:TPoint;Alignment:TAlignment;Top:Boolean=False);
begin
 if not Top then
        Acontrol.Top:=Point.Y
      Else Acontrol.Top:=Point.Y -Acontrol.Height;
   //*********************************************
    if Alignment=taLeftJustify then
       Acontrol.Left:=Point.X-Acontrol.Width;
    if (Alignment=taRightJustify) then
       Acontrol.Left:=Point.X;
end;
//******************************************************************************
Procedure ShowControlInPosition(Acontrol:TControl;Butt:TWinControl;Alignment:TAlignment;Top:Boolean=False);
begin
 if not Top then
        Acontrol.Top:=Butt.ClientOrigin.Y+Butt.Height
      Else Acontrol.Top:=Butt.ClientOrigin.Y -Acontrol.Height;
   //*********************************************
    if Alignment=taLeftJustify then
       Acontrol.Left:=Butt.ClientOrigin.X+Butt.Width-Acontrol.Width;
    if (Alignment=taRightJustify) then
       Acontrol.Left:=Butt.ClientOrigin.X;
end;
//******************************************************************************
Procedure ShowFormInPositionButton(AForm:TForm;Butt:TWinControl;Alignment:TAlignment;Top:Boolean=False);
begin
//***********************
if Butt<>nil then
   begin //1
      ShowControlInPosition(AForm,Butt,Alignment,Top);
    end //1
      else AForm.Position:=poScreenCenter;
   //*********************************************
end;
//******************************************************************************
function ParsePath(CurrPath:String;LevelUp:Integer;FromLast:Boolean=false):string;
var i:integer;
    LicDir:Integer;
    FindIndex:Integer;
    filename:string;
    Sep:string[1];
begin
 if CurrPath='' then
    begin
     result:='';
     exit;
    end;
 //***************************************
 if AnsiPos('/',CurrPath)<>0 then Sep:='/'
    else Sep:='\';

 LicDir:=0;
 Filename:=ExtractFileName(CurrPath);

 if (Sep='\')and(filename='')and(CurrPath[Length(CurrPath)]<>Sep) then
    CurrPath:=CurrPath+Sep;

 if (Sep='/')and(CurrPath[Length(CurrPath)]<>Sep) then
    CurrPath:=CurrPath+Sep;
 //*******************************************************
 for i:=Length(CurrPath) downTo 1 do
  begin   //1
    if  CurrPath[i]=Sep then Inc(LicDir);
    if  LicDir=LevelUp then begin FindIndex:=i;break;end;
  end;   //1
 //***********************************

 if not FromLast then result:=Copy(CurrPath,0,FindIndex)
    else result:=Copy(CurrPath,FindIndex,Length(CurrPath)-FindIndex+1);
 //***********************************
end;
//******************************************************************************
function GetFileNameOptionIni(ExtName:string):string;
var S:Widestring;
begin
 if ExtName<>'' then ExtName:='_'+ExtName;
 S:=ExtractFileName(Application.ExeName);
 ReplaseOn(s,'.exe','');
 Result:=s+ExtName+'.ini';
end;
//******************************************************************************
function ExtReturtSQL(Acon:TAdoConnection;ASql:WideString):variant;
var ADS:TAdoDataset;
begin
  try
   ADS:=TAdoDataset.Create(nil);
   ADS.Connection:=aCon;
   ADS.CommandText:=ASql;
   ADS.Open;
   result:=ADS.fields[0].value;
   ADS.Close;

  finally
     freeandNIl(ADS);
  end;
end;
//******************************************************************************
function ExecuteSQL(Acon:TAdoConnection;ASql:WideString):Integer;
var ADS:TAdoQuery;
begin
  try
   ADS:=TAdoQuery.Create(nil);
   ADS.Connection:=aCon;
   ADS.SQL.Add(ASql);
   result:=ADS.ExecSQL;
  finally
     freeandNIl(ADS);
  end;
end;
//******************************************************************************
function GetCountRowOnDB(Acon:TAdoConnection;Atablename,AMainFieldKod,AMainValueKod:String;ExtSql:String):integer;
var ADS:TAdoDataset;
    WhereExtSQL:String;
begin
  try
   ADS:=TAdoDataset.Create(nil);
   ADS.Connection:=aCon;
   if (AMainFieldKod<>'')and(AMainValueKod<>'') then WhereExtSQL:=' where '+AMainFieldKod+'='+#39+AMainValueKod+#39
      else  WhereExtSQL:='';
   //*************************************************
   if  ExtSql<>'' then
       begin
         if (WhereExtSQL<>'')and(ExtSql<>'') then
             WhereExtSQL:=WhereExtSQL+'  and '+ExtSql
             else WhereExtSQL:='where '+ ExtSql;
       end;
   //*************************************************
   ADS.CommandText:='select '+'Count(*) CountRow'+' from '+ATableName+' '+WhereExtSQL;
   ADS.Open;
   //**********************
   if ADS.RecordCount<>0 then
      result:=ADS.fieldByName('CountRow').AsInteger
       else result:=0;
   //**********************
   ADS.Close;
 finally
   freeandNIl(ADS);
 end;
end;
//******************************************************************************
function ConvertFieldTypeToString(FieldData:TFieldType):String;
begin
  result:='AsVariant';
  if FieldData = ftUnknown then result:='value';
  if FieldData = ftString then result:='asString';
  if FieldData = ftWideString then result:='asString';
  if FieldData = ftSmallint then result:='asInteger';
  if FieldData = ftInteger then result:='asInteger';
  if FieldData = ftWord then result:='asInteger';
  if FieldData = ftBoolean then result:='asBoolean';
  if FieldData = ftFloat then result:='asFloat';
  if FieldData = ftBCD then result:='asBcd';
  if FieldData = ftTime then result:='asDateTime';
  if FieldData = ftDateTime then result:='asDateTime';
  if FieldData = ftTimeStamp then result:='asDateTime';
  if FieldData = ftVariant then result:='AsVariant';
end;
//******************************************************************************
procedure PreapareImageComboBoxFromDBICONBlob( CbBox: TcxImageComboBox; DB:TDataset;FieldId,FieldName,FieldICON:string; CanUpdate:Boolean );
var ImageList:TImageList;
    ImageListName:String;
    AFindComp:TComponent;
    Bmk:TBookmark;
    currImageIndex:Integer;
    CurrBmp:TBitmap;
    MemStream:TMemoryStream;
begin
  ImageListName := CbBox.Name+'_ImageList';
  AFindComp := CbBox.Owner.FindComponent( CbBox.Name+'_ImageList' );

  if FieldICON <> '' then
  begin
    if AFindComp = nil then
    begin
      ImageList := TImageList.Create( CbBox.Owner );
      ImageList.Name := ImageListName;
    end
    else ImageList := TImageList(AFindComp);
    ImageList.Clear;
  end else ImageList := nil;
  //**********************************************
  CbBox.Properties.Items.Clear;
  CbBox.Properties.Images :=ImageList;
  CbBox.Properties.ReadOnly := not CanUpdate;
  //**********************************************
  try
    DB.DisableControls;
    MemStream := TMemoryStream.Create;
    Bmk := DB.GetBookmark;
    DB.First;
    CurrBmp := TBitmap.Create;
    While not DB.Eof do
    begin
      MemStream.Clear;
      if FieldICON <> '' then
      begin
        TBlobField( DB.FieldByName( FieldICON )).SaveToStream( MemStream );
        MemStream.Position:=0;
        CurrBmp.LoadFromStream( MemStream );
        currImageIndex := ImageList.AddIcon( BitmapToIco( CurrBmp ) );
      end;

      AdValueToCombox( CbBox.Properties.Items, DB.FieldByName( FieldId ).Value, DB.FieldByName( FieldName ).Value, currImageIndex );
      DB.Next;
    end;
  finally
    CurrBmp.Free;
    MemStream.Free;
    DB.GotoBookmark( Bmk );
    DB.EnableControls;
  end;
end;
//******************************************************************************
function AdValueToCombox(Items:TcxImageComboBoxItems;Value:Variant;ADescription:String;ImageIndex:Integer=-1):TcxImageComboBoxItem;
var item: TcxImageComboBoxItem;
begin
 Item := Items.Add as TcxImageComboBoxItem; // Add a new item
 Item.Description:=ADescription;
 Item.ImageIndex:=ImageIndex;
 Item.Value:=Value;
 result := Item;
end;
//******************************************************************************
Procedure FormingImageComboboxColumnByComboboxItem(Items: TcxImageComboBoxItems;AlistData,AListDataValue:TStringList;UseDescriptAsValue:Boolean=false);
var i:integer;
    Value:variant;
    Descript:widestring;
begin
    Items.BeginUpdate;
    Items.Clear;
    //*********************
    for i:=0 to AlistData.count-1 do
       begin
         if AListDataValue<>nil then
            Value:=AListDataValue.Strings[i]
             else Value:=AlistData.Strings[i];

         if not UseDescriptAsValue then Value:=i;

         AdValueToCombox(Items, Value, AlistData.Strings[i] );
       end;

  Items.EndUpdate;
end;
//******************************************************************************
Procedure FormingImageComboboxColumn(Column:TcxGridDBColumn;AlistData,AListDataValue:TStringList;UseDescriptAsValue:Boolean=false);
var i:integer;
    Items: TcxImageComboBoxItems;
    Value:variant;
    Descript:widestring;
begin
  Items := TcxImageComboBoxProperties(Column.Properties).Items;
  FormingImageComboboxColumnByComboboxItem( Items, AlistData,AListDataValue,UseDescriptAsValue );
end;
//******************************************************************************
Procedure FormingImageComboboxTreeColumn(Column:TcxDBTreeListColumn;AlistData,AListDataValue:TStringList;UseDescriptAsValue:Boolean=false);
var i:integer;
    Items: TcxImageComboBoxItems;
    Value:variant;
    Descript:widestring;
begin
  Items := TcxImageComboBoxProperties(Column.Properties).Items;
  FormingImageComboboxColumnByComboboxItem( Items, AlistData, AListDataValue, UseDescriptAsValue );
end;
//******************************************************************************
Function MakeStringListForArray(aStrArray:array of String):TStringList;
var i:integer;
begin
  result :=TStringList.Create;
  for i:=0 to Length(aStrArray)-1 do
    result.Add( aStrArray[i] );
end;
//******************************************************************************
function FindImageIndexFromListIndex(ListIndex:TMyStringListIndex;Value:Variant):Integer;
var i:integer;
    currFileValueTag:WideString;
begin
 result:=-1;
 for i:=0 to ListIndex.List.Count-1 do
 begin
   currFileValueTag := ListIndex.List.Strings[i];
   ReplaseON(currFileValueTag,ExtractFileExt( ListIndex.List.Strings[i]),'' );

   if  currFileValueTag = Value then
   begin
     result:= Integer( ListIndex.Index.Items[i]);
     Break;
   end;
 end;
end;
//******************************************************************************
procedure FormingImageIndexForColumn( Column:TcxGridDBColumn; ListIndex:TMyStringListIndex; imageList:TImageList );
var i:Integer;
    Items: TcxImageComboBoxItems;
begin
  Items := TcxImageComboBoxProperties( Column.Properties ).Items;
  for i:=0 to Items.Count-1 do
    Items.Items[i].ImageIndex:=FindImageIndexFromListIndex( ListIndex, Items.Items[i].Value);
end;
//******************************************************************************
procedure FormingImageIndexForColumnTree( Column:TcxDBTreeListColumn; ListIndex:TMyStringListIndex; imageList:TImageList );
var i:Integer;
    Items: TcxImageComboBoxItems;
begin
  Items := TcxImageComboBoxProperties( Column.Properties ).Items;
  for i:=0 to Items.Count-1 do
    Items.Items[i].ImageIndex:=FindImageIndexFromListIndex( ListIndex, Items.Items[i].Value);
end;
//******************************************************************************
Procedure  FormingImageComboBox( CmbImage:TcxImageCombobox;AlistData:TStringList;UseDescriptAsValue:Boolean=false);
var i:integer;
    Items: TcxImageComboBoxItems;
    Value:variant;
begin
    Items := CmbImage.Properties.Items;

    Items.BeginUpdate;
    Items.Clear;
    for i:=0 to AlistData.count-1 do
       begin
         if not UseDescriptAsValue then Value:=i
            else Value:=AlistData.Strings[i];

         AdValueToCombox( Items, Value, AlistData.Strings[i] );
       end;
end;
//******************************************************************************
procedure CreateMenuDB( DB:TDataSet; FieldId, FiedlName, PrefixMenuItem:string;
                        Amenu:TmenuItem; Act:TNotifyEvent );
var currMen : TmenuItem;
    bmk:TBookmark;
begin
  Amenu.Clear;
  try
    bmk := DB.GetBookmark;
    DB.DisableControls;
    DB.First;

    while not DB.Eof do
    begin
      DB.FieldByName(FieldId).AsVariant;

      currMen := CreteMenuItem( Amenu, PrefixMenuItem+DB.FieldByName(FieldId).AsString,
                     Act,
                     DB.FieldByName(FiedlName).AsString );
      if  DB.FieldByName(FieldId).DataType in [ftSmallint, ftInteger] then
        currMen.Tag := DB.FieldByName(FieldId).AsInteger;
      DB.Next;
  end;
  finally
    DB.GotoBookmark(bmk);
    DB.EnableControls;
  end;
end;
//******************************************************************************
function aCreteMenuItem( Amenu : TComponent; Name:String; Act:TNotifyEvent; aStr:string; ImageIndex:Integer=-1;Enabled:Boolean = true ):TmenuItem;
begin
  result :=TmenuItem.Create( Amenu );
  result.Name:=Name;
  result.Caption := Astr;
  result.OnClick := Act;
  result.Tag     :=-1;
  result.ImageIndex := ImageIndex;
  result.Enabled := Enabled;
end;
//******************************************************************************
function CreteMenuItem( Amenu:TmenuItem;Name:String; Act:TNotifyEvent; aStr:string; ImageIndex:Integer=-1;Enabled:Boolean = true ):TmenuItem;
var NewMenu :TmenuItem;
begin
   if Trim(Astr)='' then exit;
   NewMenu := aCreteMenuItem( Amenu, Name, Act, aStr, ImageIndex, Enabled );

   Amenu.Add(NewMenu);
   Result := NewMenu;
end;
//******************************************************************************
function CreteMenuItem( Amenu:TPopUpMenu;Name:String; Act:TNotifyEvent; aStr:string; ImageIndex:Integer=-1;Enabled:Boolean = true ):TmenuItem;
var NewMenu :TmenuItem;
begin
   if Trim(Astr) = '' then exit;
   NewMenu := aCreteMenuItem( Amenu, Name, Act, aStr, ImageIndex, Enabled );

   Amenu.Items.Add( NewMenu );
   Result := NewMenu;
end;
//******************************************************************************
procedure ShowPropertyMenu(Control:TControl;Amenu:TPopUpMenu; MenuCapt:Array of string;Act:array of TNotifyEvent);
var i:integer;
begin
  Amenu.Items.Clear;
  for i:=0 to length(MenuCapt)-1 do
      begin
        CreteMenuItem(Amenu,Control.Name+'_Item'+IntTostr(i), Act[i], MenuCapt[i]);
      end;
  Amenu.Popup(TControl(Control).ClientOrigin.X , TControl(Control).ClientOrigin.Y+TControl(Control).Height)
end;
//******************************************************************************
Procedure UnCheckAllItemInMEnu(Amenu:TPopUpMenu;Val:Boolean=false );
var i:integer;
begin
   for i:=0 to Amenu.Items.Count -1 do
       Amenu.Items[i].Checked:= Val;
end;
//******************************************************************************
Procedure SaveMenuToIni(FileIni:String;Amenu:TPopUpMenu);
var I:integer;
    Acheck:String;
begin
   for i:=0 to Amenu.Items.Count-1 do
      begin
        //*******************************
        if Amenu.Items[i].Checked then
           Acheck:='1'
           else Acheck:='0';
        //*******************************
        CreateIniFile(fileIni, Amenu.Name , Amenu.Items[i].Name, Acheck );
      end;
end;
//******************************************************************************
Procedure ReadMenuFromIni(FileIni:String;Amenu:TPopUpMenu);
var I:integer;
    Acheck:String;
begin
   for i:=0 to Amenu.Items.Count-1 do
      begin
        Acheck:=ReadIniFile(fileIni, Amenu.Name , Amenu.Items[i].Name);
        if Acheck='1' then
           Amenu.Items[i].Checked:=true
            else Amenu.Items[i].Checked:=false;
      end;
end;
//******************************************************************************
Function ReadStatusMenuItemForIni(FileIni:String;Amenu:TPopUpMenu;Control:TControl; ContItem:Integer):integer;
var I:Integer;
    Acheck:String;
begin
   result:=0;
   for i:=0 to ContItem-1 do
       begin
          Acheck:=ReadIniFile(fileIni, Amenu.Name , Control.Name+'_Item'+IntTostr(i));
          if Acheck='1' then
             begin
               Result:=i;
               break;
             end;
       end;
end;
//******************************************************************************
function ReadValueMenuItemForIni(FileIni:String;Amenu:TPopUpMenu;Control:TControl):string;
var I:Integer;
    Value:String;
    curControl:String;
begin
   result:='';
   if AnsiPos('_Item0',Control.Name)=0 then
      curControl:=Control.Name+'_Item0'
      else curControl:=Control.Name;

   Value:=ReadIniFile(fileIni, Amenu.Name , curControl);
   result:=Value;
 end;
//******************************************************************************
function CloneItemMenuSubToPopUp( MItem:TMenuItem ):TPopUpMenu;
var i:integer;
begin
  result := TPopUpMenu.Create( MItem.Owner );
  result.Images := MItem.GetParentMenu.Images;

  for i:=0 to MItem.Count-1 do
    CreteMenuItem( result, MItem.Items[i].Name+'_PM', MItem.Items[i].OnClick, MItem.Items[i].Caption, MItem.Items[i].ImageIndex, MItem.Items[i].Enabled );
end;
//******************************************************************************
function AddMItemToPopUpMenuOrToNewPopAp( Owner:TComponent; aPopUp:TPopUpMenu; NameButton , aCaption:String;
                                          Act:TNotifyEvent; AddSpliterMenu:Boolean=True; ImageIndex:Integer=-1;Enabled:Boolean = true ):TmenuItem;
var i:integer;
    SpliterAct:TNotifyEvent;
    aCurrMenItemName:String;
begin
  if aPopUp = nil then
  begin
    aPopUp := TPopUpMenu.Create( Owner );
    aPopUp.Name := 'PupMenu_'+NameButton;
  end;

  for i:=0 to aPopUp.Items.Count-1 do           // Find Same Button With Same Action
  begin
    aCurrMenItemName := aPopUp.Items[i].Name ;
    if @aPopUp.Items[i].OnClick = @Act then exit;

    if CompareText( aCurrMenItemName , NameButton )=0 then exit;
  end;

  if AddSpliterMenu then
    CreteMenuItem( aPopUp, NameButton+'_Spiter', SpliterAct, '-', -1, False  );

  result := CreteMenuItem( aPopUp, NameButton, Act, aCaption, ImageIndex, Enabled  );
end;
//******************************************************************************
Function ShowDialogMessage(ACaption,AText:String;Var Value:String):Boolean;
begin
   result :=InputQuery(ACaption,AText, Value) ;
end;
//******************************************************************************
procedure FindSubDirFiles(StartDir:string;Mask:string;var List:TStringList;IncludeFolder:Boolean=true;Param:integer=1);
var  SearchRec : TSearchRec;
begin
 try
  IF Mask=''then Mask:='*.*';
  IF StartDir[Length(StartDir)]<>'\'then StartDir := StartDir + '\';
  // Сначала находим и печатаем все файлы из
  // главной папки по маске Mask
  if IncludeFolder then List.Add(StartDir);
  IF FindFirst(StartDir+Mask,faAnyFile,SearchRec)=0 then
     Repeat
      if (Param=0)and(SearchRec.Attr=faDirectory)then List.Add(SearchRec.Name);
      If (Param=1)and((SearchRec.Attr and faDirectory)<>faDirectory) then
          List.Add(StartDir+SearchRec.Name);

      if (Param=2) then List.Add(SearchRec.Name);
      if (Param=3) and (SearchRec.Attr<>faHidden) then  List.Add(SearchRec.Name); //not Hiden

     Until FindNext(SearchRec)<>0;
    sysutils.FindClose(SearchRec);
   // Теперь находим все подпапки и продолжаем в них поиск
    IF FindFirst(StartDir+'*.*',faAnyFile,SearchRec)=0 then
    Repeat
      IF((SearchRec.Attr and faDirectory)=faDirectory)and
        ((SearchRec.Name<>'..')and(SearchRec.Name <> '.'))then
         FindSubDirFiles(StartDir+SearchRec.Name+'\',Mask,List,IncludeFolder);
    Until FindNext(SearchRec)<>0;
 finally
    sysutils.FindClose(SearchRec);
 end;
end;
//******************************************************************************
Function GetCurrPathFromTree(Atree:TCxTreeView; CurrNode:TTreeNode):string;
var Node: TTreeNode;
    Path:string;
    Acaption:string;
Procedure RemoveCounfile(Var text:string);
var i:integer;
begin
 for i:=Length(Text) downto 1 do
     begin
      if Text[i]='(' then
         begin
           text:=Trim(Copy(Text,1,i-1));

           break;
         end;
     end;
end;
begin
   Path:='';
   Node:=CurrNode;
   while Node<>nil do
      begin
        Acaption:=Node.Text;
        RemoveCounfile(Acaption);
        Path:=Acaption+'\'+Path;
        result:=Path;
        Node:=Node.Parent;
      end;
   //ShowMessage(Path);
end;
//******************************************************************************
procedure AddToTree(Atree:TCxTreeView;ApathToFolder,APath:string;ShowCountFiles:Boolean;MaskFilesCount:string);
var i,j:Integer;
    SubDir:String;
    CurrDir:string;
    IndLast:integer;
    Alevel:Integer;
    FindText:boolean;
    ParentNode:TTreeNode;
    ListSub:TStringList;
begin
  IndLast:=1;
  Alevel:=0;
  ParentNode:=nil;
 try
  ListSub:=TStringList.Create;
  for i:=1 To Length(APath) do
    begin
     if APath[i]='\' then
     begin //*
      SubDir:=copy(APath,IndLast,i-IndLast);
      CurrDir:=copy(APath,1,i);
      IndLast:=i+1;
      FindText:=false;

      if ShowCountFiles then
              begin
                FindFile(ApathToFolder+CurrDir,ListSub,MaskFilesCount,1);
                SubDir:=SubDir+' ('+IntTostr(ListSub.count)+')';
              end;

      for j:=0 to Atree.Items.Count-1 do
          begin //1
            if Atree.Items.Item[j].Level=Alevel then
               begin //2
                 if CompareText(SubDir,Atree.Items.Item[j].Text)=0 then
                    begin //3
                      FindText:=true;
                      ParentNode:= Atree.Items.Item[j];
                      Break;
                    end;//3
               end;//2
          end; //1

      if not FindText then
         begin
           Atree.Items.AddChild(ParentNode,SubDir);
         end;
      inc(Alevel);
     end;//*
    end;
 finally
   FreeAndNil(ListSub);
 end;
end;
//******************************************************************************
Procedure BuildShelTree(ApathToFolder,AStartpath:String; Atree:TCxTreeView; ShowCountFiles:Boolean;MaskFilesCount:string);
var List   :TStringList;

    i:integer;
    CurrPath:WideString;
    CountFiles:Integer;
begin
  try
   List:=TStringList.Create;

   FindSubDirFiles(Astartpath, '*.*' , List);
   For i:=0 to List.Count-1 do
       begin
         CurrPath:=ExTractFilePath(List.Strings[i]);

         REplaseOn(CurrPath,ApathToFolder,'');
         AddToTree(Atree, ApathToFolder, CurrPath , ShowCountFiles, MaskFilesCount);

       end;
  finally

   FreeAndNIl(List);

  end;
end;
//******************************************************************************
function GetCountFilesForPath(Apath:String;Mask:String;IncludeSubFolder:Boolean=True):Integer;
var i:Integer;
    AlistFiles:TStringList;
begin
 try
  AlistFiles:=TStringList.Create;
  if IncludeSubFolder then
    FindSubDirFiles(Apath,Mask,AlistFiles,false)
  else FindFile(aPath, AlistFiles, Mask, 1 );
  
  Result := AlistFiles.Count;

  for i:=0 to AlistFiles.Count-1 do
    if CompareText( ExtractFileName( AlistFiles[i]) ,'Thumbs.db' ) = 0 then Dec(Result);

 finally
   FreeAndNil(AlistFiles);
 end;
end;
//******************************************************************************
function AddNolForLengthNumber(Anumber:string;AMaxdigital:Integer;ch:string='0'):string;
var i:integer;
begin
  result:=Anumber;
  for i:=Length(Anumber)+1 to AMaxdigital do
      Result:= ch+result;
end;
//******************************************************************************
Function SeparateNumber(Anumber,ASeparator:String;step:Integer):string;
var I:integer;
    //modSep:Integer;
    IndSep:Integer;
begin
   result:='';
  // modSep:=Length(Anumber) div Step;
   IndSep:=0;
   for i:=1 to Length(Anumber) do
       begin
         if IndSep=step then
            begin
              Insert(ASeparator,Anumber,i);
              IndSep:=-1;
            end;
         inc(IndSep);
       end;
  result:= Anumber;
end;
//******************************************************************************
function MyGetFileSize(FileName: string): Longint;
var
  SearchRec: TSearchRec;
begin
 try
  if FindFirst(FileName, faAnyFile, SearchRec) = 0 then
    Result:=SearchRec.Size
  else
    Result:=-1; { Return Error, it Will be less then 0 }
 finally
  sysutils.FindClose(SearchRec);
 end;
end;
//******************************************************************************
function MyGetFolderSize ( path: string ): Longint;
var
 tsr: TSearchRec;
begin
 result := 0;
 path := IncludeTrailingBackSlash ( path );
 if FindFirst ( path + '*', faAnyFile, tsr ) = 0 then begin
  repeat
   if ( tsr.attr and faDirectory ) > 0 then begin
    if ( tsr.name <> '.' ) and ( tsr.name <> '..' ) then
     inc ( result, MyGetFileSize ( path + tsr.name ) );
   end
   else
    inc ( result, tsr.size );
  until FindNext ( tsr ) <> 0;
  sysutils.FindClose(tsr);
 end;
end;
//******************************************************************************
function GetSizeImage(FileName:String):TMyImageSize;
var JpegImage:TJpegImage;
begin
  try
   JpegImage := TJpegImage.Create;
   JpegImage.LoadFromFile(FileName);
   result.Width:=JpegImage.Width;
   result.Height:=JpegImage.Height;

  finally
   freeAndNil(JpegImage);
  end;
end;
//******************************************************************************
function  CalculateSizeFilePixel(FileName:String):String;
var MySize:TMyImageSize;
begin
    if FileExists(FileName) then
       begin
           MySize:=GetSizeImage(FileName);
           result:= IntToStr(round(MySize.Width))+'x'+ IntToStr(Round(MySize.Height));
       end
       else result:='';
end;
//******************************************************************************
function  CalculateSizeFileIn(FileName:String;DPI:Integer ):String;
var MySize:TMyImageSize;
begin
    if FileExists(FileName) then
       begin
           MySize:=GetSizeImage(FileName);
           result:= FloatToStr(RoundTo((MySize.Width / DPI),-2) )+'x'+ FloatToStr(RoundTo((MySize.Height /DPI ),-2));
       end
       else result:='';
end;
//******************************************************************************
Procedure SaveToIniAsociationColumnAndParam(AiniFile,ColumnName:String;Value:Variant);
var CurrPath:string;
begin
  CurrPath:=ExtractFilePath(Application.ExeName);
  CreateIniFile(CurrPath+AiniFile,'ColumnViweAsociateValue',ColumnName,Value);
end;
//******************************************************************************
function ReadFromIniAsociationColumnAndParam(AiniFile,ColumnName:String):string;
var CurrPath:string;
begin
  CurrPath:=ExtractFilePath(Application.ExeName);
  result:=ReadIniFile(CurrPath+AiniFile,'ColumnViweAsociateValue',ColumnName);
end;
//******************************************************************************
function GetLocalIP: String;
const WSVer = $101;
var
  wsaData: TWSAData;
  P: PHostEnt;
  Buf: array [0..127] of Char;
begin
  Result := '';
  if WSAStartup(WSVer, wsaData) = 0 then begin
    if GetHostName(@Buf, 128) = 0 then begin
      P := GetHostByName(@Buf);
      if P <> nil then Result := iNet_ntoa(PInAddr(p^.h_addr_list^)^);
    end;
    WSACleanup;
  end;

end;
//******************************************************************************
function GetMACAdress: string;
 var
   NCB: PNCB;
   Adapter: PAdapterStatus;

   URetCode: PChar;
   RetCode: PChar;
   I: integer;
   Lenum: PlanaEnum;
   _SystemID: string;
   TMPSTR: string;
 begin
   Result    := '';
   _SystemID := '';
   Getmem(NCB, SizeOf(TNCB));
   Fillchar(NCB^, SizeOf(TNCB), 0);

   Getmem(Lenum, SizeOf(TLanaEnum));
   Fillchar(Lenum^, SizeOf(TLanaEnum), 0);

   Getmem(Adapter, SizeOf(TAdapterStatus));
   Fillchar(Adapter^, SizeOf(TAdapterStatus), 0);

   Lenum.Length    := chr(0);
   NCB.ncb_command := chr(NCBENUM);
   NCB.ncb_buffer  := Pointer(Lenum);
   NCB.ncb_length  := SizeOf(Lenum);
   RetCode         := PChar( Netbios(NCB) );

   i := 0;
   repeat
     Fillchar(NCB^, SizeOf(TNCB), 0);
     Ncb.ncb_command  := chr(NCBRESET);
     Ncb.ncb_lana_num := lenum.lana[I];
     RetCode          := PChar( Netbios(Ncb) );

     Fillchar(NCB^, SizeOf(TNCB), 0);
     Ncb.ncb_command  := chr(NCBASTAT);
     Ncb.ncb_lana_num := lenum.lana[I];
     // Must be 16
    Ncb.ncb_callname := '*               ';

     Ncb.ncb_buffer := Pointer(Adapter);

     Ncb.ncb_length := SizeOf(TAdapterStatus);
     RetCode        := PChar( Netbios(Ncb) );
     //---- calc _systemId from mac-address[2-5] XOR mac-address[1]...
    if (RetCode = chr(0)) or (RetCode = chr(6)) then
     begin
       _SystemId := IntToHex(Ord(Adapter.adapter_address[0]), 2) + '-' +
         IntToHex(Ord(Adapter.adapter_address[1]), 2) + '-' +
         IntToHex(Ord(Adapter.adapter_address[2]), 2) + '-' +
         IntToHex(Ord(Adapter.adapter_address[3]), 2) + '-' +
         IntToHex(Ord(Adapter.adapter_address[4]), 2) + '-' +
         IntToHex(Ord(Adapter.adapter_address[5]), 2);
     end;
     Inc(i);
   until (I >= Ord(Lenum.Length)) or (_SystemID <> '00-00-00-00-00-00');
   FreeMem(NCB);
   FreeMem(Adapter);
   FreeMem(Lenum);
   GetMacAdress := _SystemID;
 end;
//******************************************************************************
function IsNullValue(Avalue:Variant;DefValue:widestring=''):widestring;
begin
  if Avalue <> null then
     result:=Avalue
      else  result:=DefValue;
end;
//******************************************************************************
Function GetIndexColFromWiew(AFieldName:String;AView:TcxGRidDBTableView):integer;
var i:integer;
begin
   result:=-1;
  for i:=0 to AView.ColumnCount-1 do
      begin
        if CompareText(AView.Columns[i].DataBinding.FieldName,AFieldName)=0 then
           begin
            result:=i;
            break;
           end;
      end;
end;
//******************************************************************************
function GetValueFromRecord(FieldName:String;AView:TcxGRidDBTableView; IndRecord:Integer):Variant;
var IndexValue:integer;
begin
  IndexValue:=GetIndexColFromWiew(FieldName, Aview);
  result:=Aview.ViewData.Records[IndRecord].Values[IndexValue];
end;
//******************************************************************************
function GetValueFromSelectRecord(FieldName:String;AView:TcxGRidDBTableView;IndSel:Integer=0):Variant;
var IndexValue:integer;
begin
  IndexValue:=GetIndexColFromWiew(FieldName, Aview);
  result:=Aview.DataController.Controller.SelectedRecords[IndSel].Values[IndexValue];
end;
//******************************************************************************
Procedure RetMasFieldDataFormView(Aview:TcxGRidDBTableView;FieldName:string;Var MasID:array of Widestring;Distinct:Boolean);
var i:integer;
    List:TstringList;
    CurrValue:Widestring;
begin
  try
   List:=TstringList.Create;
   for i:=0 to Aview.ViewData.RecordCount-1 do
       begin
        CurrValue:=IsNullValue(GetValueFromRecord(FieldName,Aview,i));
        if CurrValue<>'' then
           begin
              if (Distinct)and(List.IndexOf(CurrValue)=-1) then
                 begin
                    MasID[i]:=CurrValue;
                    List.Add(CurrValue);
                 end
                  else
                   if (not Distinct) then MasID[i]:=CurrValue;
             // List.Add(MasID[i]);
           end;
       end;
  finally
   FreeAndNIl(List);
  end;
end;
//******************************************************************************
function BuildSQLFilterByCombobox(MainTableName,MainTableFieldID:String;MasCombo:array of TcxComboBox;
                                  MasTableName:Array of String;MaxFieldValueFilter,MasMainFieldName:Array of string;AddSql:String):string;
var MainPartSql:String;
    WherePartSQl:String;
    i:integer;
    ConteiterUsedTableName:TstringList;
    //AndPart:String;
function AndPart:string;
begin
 if WherePartSQl='' then result:=''
    else  result:=' and '
end;
begin
 try
    ConteiterUsedTableName:=TstringList.Create;
    for i:=0 to Length(MasCombo)-1 do
        begin
           if (MasCombo[i].ItemIndex<>-1)and( MasCombo[i].Text<>'All') then
              begin
               //if WherePartSQl<>'' then AndPart:='and'
               //   else AndPart:='';

               if (MasTableName[i]<>'')and(ConteiterUsedTableName.IndexOf(MasTableName[i])=-1) then
                  MainPartSql:=MainPartSql+' left join '+MasTableName[i]+' on '+MasTableName[i]+'.'+MasMainFieldName[i]+'='+MainTableName+'.'+MainTableFieldID;

               if (MaxFieldValueFilter[i]<>'') then
                  WherePartSQl:=WherePartSQl+' '+AndPart+' '+MasTableName[i]+'.'+MaxFieldValueFilter[i]+'='+#39+MasCombo[i].Text+#39;

               ConteiterUsedTableName.Add(MasTableName[i]);
              end;
        end;
    if WherePartSQl<>'' then
       WherePartSQl:='  Where '+WherePartSQl;

    if (AddSql<>'') then
        begin
         if WherePartSQl='' then
            WherePartSQl:='Where '+AddSql
             else WherePartSQl:=WherePartSQl+' and '+AddSql;
        end;
 finally
  FreeandNil(ConteiterUsedTableName);
 end;
   //result:='select '+MainTableName+'.'+'* from '+MainTableName+' '+MainPartSql+WherePartSQl;
    result:='select Distinct('+MainTableName+'.'+MainTableFieldID+') from '+MainTableName+' '+MainPartSql+WherePartSQl;
    result:='Select * from '+MainTableName+' where '+MainTableFieldID+' in ('+result+')'
end;
//******************************************************************************
function ConvertDateTime(Date:TdateTime;TypeDate:Integer=0;MySeparatorDate:char='.'):String;
var Year  :Word;
    Month :Word;
    Day   :Word;
    Hour  :Word;
    Min   :Word;
    Sec   :Word;
    MSec  :Word;
  DAteStr,TimeStr:String;
begin
 DecodeDate(Date,Year,Month,Day);
 DecodeTime(DAte,Hour,MIn,Sec,MSec);

 DAteStr :=AddNolForLengthNumber( IntToStr(Day),2) + MySeparatorDate+ AddNolForLengthNumber( IntToStr(Month), 2 ) +MySeparatorDate+AddNolForLengthNumber( IntToStr(Year) , 2);
 TimeStr:=AddNolForLengthNumber(IntToStr(Hour),2) +':'+AddNolForLengthNumber(IntToStr(Min),2)+':'+AddNolForLengthNumber(IntToStr(Sec),2);

 if TypeDate=0 Then Result:=DateStr+' '+TimeStr;
 if TypeDate=1 Then Result:=DateStr;
 if TypeDate=2 Then Result:=TimeStr;
 if TypeDate=3 Then Result:=AddNolForLengthNumber(IntToStr(Month),2)+MySeparatorDate+AddNolForLengthNumber(IntToStr(Day),2)+  MySeparatorDate+IntToStr(Year);
 if TypeDate=4 Then Result:=IntToStr(Year) +MySeparatorDate+AddNolForLengthNumber(IntToStr(Month),2)+MySeparatorDate+AddNolForLengthNumber(IntToStr(Day),2);
 if TypeDate=5 Then Result:=IntToStr(Year) +MySeparatorDate+AddNolForLengthNumber(IntToStr(Day),2)  +MySeparatorDate+AddNolForLengthNumber(IntToStr(Month),2);

 if TypeDate=6 Then Result:=AddNolForLengthNumber(IntToStr(Month),2)+MySeparatorDate+AddNolForLengthNumber(IntToStr(Day),2)+  MySeparatorDate+IntToStr(Year)+' '+TimeStr;
 if TypeDate=7 Then Result:=IntToStr(Year) +MySeparatorDate+AddNolForLengthNumber(IntToStr(Month),2)+MySeparatorDate+AddNolForLengthNumber(IntToStr(Day),2)+' '+TimeStr;
 if TypeDate=8 Then Result:=IntToStr(Year) +MySeparatorDate+AddNolForLengthNumber(IntToStr(Day),2)  +MySeparatorDate+AddNolForLengthNumber(IntToStr(Month),2)+' '+TimeStr;

 if TypeDate=9 Then
    Result:=IntToStr(Year) +MySeparatorDate+AddNolForLengthNumber(IntToStr(Month),2)+MySeparatorDate+AddNolForLengthNumber(IntToStr(Day),2)+'T'+TimeStr+'.000Z'; //W3C DateTime format.'2011-03-10T05:00:00.000Z'


 //'2011-03-10T05:00:00.000Z'

 // TypeDate =0 - Return Date+Time
 // TypeDate =1 - Return Date DDmmYYYY
 // TypeDate =2 - Return Time
 // TypeDate =3 - Return Date mmDDYYYY
 // TypeDate =4 - Return Date YYYYmmDD
 // TypeDate =5 - Return Date YYYYDDmm
end;
//******************************************************************************
Function MyStrToDate(DateStr:String;FormatDate:String='yyyy-mm-dd hh24:mm:ss'):TDateTime;
var SaveFormatDate:String;
    SaveDateSaparator:Char;
    TestSep:WideString;
begin
 try
 SaveFormatDate:= ShortDateFormat;
 SaveDateSaparator:= DateSeparator;
 TestSep:=Copy(FormatDate,1,7);
 ReplaseOn(TestSep,'y','');
 ReplaseOn(TestSep,'m','');
 ReplaseOn(TestSep,'d','');

 DateSeparator:= Char(TestSep[1]);

 ShortDateFormat := FormatDate;
 //ShortTimeFormat :='hh:mm:ss';
 Result := StrToDateTime( DateStr);
 finally
  ShortDateFormat := SaveFormatDate;
  DateSeparator := SaveDateSaparator;
 end;
end;
//******************************************************************************
function CountCharInStr(Sub:char;main:String):integer;
var i:integer;
begin
  result:=0;
  for i:=1 to Length(main) do
      if main[i]=Sub then inc(result);
end;
//******************************************************************************
Function PatrsePathServer(aPath:String;Level:integer;FromLast:boolean=false):string;
var I:integer;
    LicDir:integer;
    FindIndex:integer;
begin
  if (aPath[Length(aPath)]<>'/') then
          aPath:=aPath+'/';

  //if (aPath[0]='/') then Delete(aPath,1,1);
  LicDir:=0;
  for i:=1 to Length(aPath) do
  begin   //1
    if  aPath[i]='/' then Inc(LicDir);
    if  LicDir=Level+1 then begin FindIndex:=i;break;end;
  end;   //1
 //***********************************
 if not FromLast then result:=Copy(aPath,1,FindIndex)
    else result:=Copy(aPath,FindIndex,Length(aPath)-FindIndex+1);
 //***********************************
end;
//******************************************************************************
Procedure CreateAllDirFtp(ftp:TIdFTP;Path:String);
var
  i:integer;
  currPath:WideString;
  PrevPath:WideString;
begin
  try
      i:=1;
      PrevPath:='';
      while true do
       begin
          currPath:=PatrsePathServer(Path,i);
          if PrevPath<>currPath then
             begin
               try
                ftp.MakeDir(currPath);
               except
               end;
             end
              else break;
          //***************
          PrevPath:=currPath;
          inc(i);
         //***************
       end;
  except
  end;

end;
//******************************************************************************
{Function UploadFileFTP(Login,Pass,Adress:String;FileName:string;MessageIFExists:Boolean=false;FileNameOnFTP:String='';FtpPath:string='/'):Boolean;
var
  ftp: TIdFTP;
  ms:  TMemoryStream;
  i:integer;
  DirList: TIdFTPListItems;
begin
  try
    try
      ftp:=TIdFTP.Create(Application);
      ms:=TMemoryStream.Create;

      ftp.Host:=Adress;// ftp адрес сервера
      ftp.Port:=21;
      ftp.Username:=Login;//логин
      ftp.Password:=Pass;//Пароль
      ftp.Passive:=true;

      ftp.Connect( Adress, 2000);
      AssErt(ftp.Connected);

      CreateAllDirFtp(ftp, FtpPath);

      ftp.ChangeDir(FtpPath);//Установить папку на сервере
      Application.ProcessMessages;

      ftp.List(nil);
      DirList := ftp.DirectoryListing;

      //********************************************************
      if FileNameOnFTP='' then FileNameOnFTP:=ExtractFileName(FileName);

      for i := 0 to DirList.Count - 1 do
          if CompareText(FileNameOnFTP, DirList[i].FileName)=0 then
             begin
              if MessageIFExists then showMessage('File already FTP uploaded.');
              exit;
             end;
      //********************************************************

      ftp.Put(FileName, FileNameOnFTP ,false); //Файл Откуда-Куда
     result:=true;
    finally
      ms.Free; ftp.Free;
    end;
  except
    result:=false;
  end;
end; }
//******************************************************************************
Function GetParamFileFTPfromList(Alist:TstringList;Index,ParamInd:integer):string;
var I:integer;
    Astring:widestring;
    CurrParam:integer;
begin
  //filename.pdf|date|size
  result:='';
  if Index<Alist.Count then
     begin
      CurrParam:=0;
      Astring:=Alist.Strings[Index];
      Astring:='|'+Astring;
      for i:=1 to Length(Astring) do
          begin
            if Astring[i]='|' then inc(CurrParam);
            if (CurrParam=ParamInd)and(Astring[i]<>'|') then
                result:=result+Astring[i];
          end;
     end;
end;
//******************************************************************************
{Function GetListFileFTP(Login,Pass,Adress:String; aList: TstringList; Mask:string='*.*';FtpPath:string='/'):Boolean;
var
  ftp: TIdFTP;
  ms:  TMemoryStream;
  i:integer;
  DirList: TIdFTPListItems;
begin
  ftp:=TIdFTP.Create(Application);
  ms:=TMemoryStream.Create;
  try
    try
      ftp.Host := Adress;// ftp адрес сервера
      ftp.Port:=21;
      ftp.Username:=Login;//логин
      ftp.Password:=Pass;//Пароль
      ftp.Connect( Adress , 2000);

      AssErt(ftp.Connected);
      ftp.Passive:=true;
      ftp.DirectoryListing.Clear;

      ftp.ChangeDir(FtpPath);//Установить папку на сервере
      Application.ProcessMessages;

      ftp.List(nil,mask);        // я зарем

      DirList := ftp.DirectoryListing;

      for i := 0 to DirList.Count - 1 do
          aList.Add(DirList[i].FileName+'|'+DateTimeToStr(DirList[i].ModifiedDate)+'|'+ IntToStr(DirList[i].Size));

      result:=true;
    finally
      ms.Free;
      ftp.Free;
    end;
  except
    result:=false;
  end;
end; }
//******************************************************************************
{Function DeleteFilesFromFtp(Login,Pass,Adress:String;FileList:TStringList;FtpPath:string='/'):Boolean;
var
  ftp: TIdFTP;
  ms:  TMemoryStream;
  i:integer;
begin
  ftp:=TIdFTP.Create(Application);
  ms:=TMemoryStream.Create;
  try
    try
      ftp.Host:=Adress;// ftp адрес сервера
      ftp.Port:=21;
      ftp.Username:=Login;//логин
      ftp.Password:=Pass;//Пароль
      ftp.Connect( Adress, 2000);
      AssErt(ftp.Connected);
      ftp.ChangeDir(FtpPath);//Установить папку на сервере
      Application.ProcessMessages;
      for i:=0 to FileList.Count-1 do
          ftp.Delete(FileList.Strings[i]);
     result:=true;
    finally
      ms.Free;
      ftp.Free;
    end;
  except
    result:=false;
  end;
end; }
//******************************************************************************
function DayOfWeekEngByNumber(NDay: Integer): string;
begin
  case NDay of
     1: Result := 'Monday';
     2: Result := 'Tuesday';
     3: Result := 'Wednesday';
     4: Result := 'Thursday';
     5: Result := 'Friday';
     6: Result := 'Saturday';
     7: Result := 'Sunday';
  end;
end;
//******************************************************************************
function DayOfWeekRusByNumber(NDay: Integer): widestring;
begin
  case NDay of
     1: Result := 'Понедельник';
     2: Result := 'Вторник';
     3: Result := 'Среда';
     4: Result := 'Четверг';
     5: Result := 'Пятница';
     6: Result := 'Субота';
     7: Result := 'Воскресение';
  end;
end;
//******************************************************************************
function DayOfWeekUkrByNumber(NDay: Integer): widestring;
begin
  case NDay of
     1: Result := 'Понеділок';
     2: Result := 'Вівторок';
     3: Result := 'Середа';
     4: Result := 'Четвер';
     5: Result := 'П''ятниця';
     6: Result := 'Субота';
     7: Result := 'Неділя';
  end;
end;
//******************************************************************************
function DayOfWeekShortUkrByNumber(NDay: Integer): widestring;
Begin
  result := MasDayShortUkr[ NDay ] ;
end;
//******************************************************************************
function DayOfWeekShortUkr(S: TDateTime): widestring;
Begin
  result := DayOfWeekShortUkrByNumber( DayOfTheWeek(S));
end;
//******************************************************************************
function DayOfWeekEng(S: TDateTime): string;
begin
  result:=DayOfWeekEngByNumber(DayOfTheWeek(S));
end;
//******************************************************************************
function DayOfWeekRus(S: TDateTime): widestring;
begin
 result:=DayOfWeekRusByNumber(DayOfTheWeek(S));
end;
//******************************************************************************
function NumberDayOfWeekByEngName(name: string): integer;
var i:integer;
begin
  result:=-1;
  for i:=1 to 7 do
    if  CompareText(DayOfWeekEngByNumber(i), name )=0 then
        begin
         result:=i;
         break;
        end;
end;
//******************************************************************************
function GetDateWeekByDayOfWeek(aData:TDate;aDayOfWeek:integer):TDate;
var CurrIndDay:Integer;
    NeedIndDay:Integer;
    DayOffset:integer;
begin
  CurrIndDay:=DayOfTheWeek(aData);
  NeedIndDay:=aDayOfWeek;//NumberDayOfWeekByEngName(aDayName);
  DayOffset:=0;

  if NeedIndDay<CurrIndDay then DayOffset:=(CurrIndDay-NeedIndDay)*-1;
  if NeedIndDay>CurrIndDay then DayOffset:=(NeedIndDay-CurrIndDay);

  result:=IncDay(aData,DayOffset);
end;
//******************************************************************************
Function GetDateWeekByDayOfWeekFromDate(aData:TDate;aDayOfWeek:integer):TDate;
begin
 while DayOfTheWeek(aData)<>aDayOfWeek do
       aData:=IncDay(aData,1);

 result:=aData;
end;
//******************************************************************************
function GetDateWeekByNameDay(aData:TDate;aDayName:String):TDate;
begin
  result:=GetDateWeekByDayOfWeek(aData, NumberDayOfWeekByEngName(aDayName));
end;
//******************************************************************************
Function GetMonthEnNameByNumber(MonthNumber:integer):String;
begin
 if Length(MasMonth)>=MonthNumber then Result:=MasMonth[MonthNumber];
end;
//******************************************************************************
Function GetMonthRusNameByNumber(MonthNumber:integer):String;
begin
 if Length(MasMonth)>=MonthNumber then Result:=MasMonthRus[MonthNumber];
end;
//******************************************************************************
Function GetMonthDay(aDate:TDate):String;
begin
 result:=IntToStr(DayOf(aDate))+' '+GetMonthEnNameByNumber(MonthOf(aDate));
end;
//******************************************************************************
function GetMonthDayRus(aDate:TDate): string;
begin
   result:=IntToStr(DayOf(aDate))+' '+GetMonthRusNameByNumber(MonthOf(aDate));
end;
//******************************************************************************
function GetIndexFromFileName(var FileName:widestring;RemoveIndex:boolean):Integer;
var IndStr:WideString;
    I:integer;
    NewFileName:String;
begin
  IndStr:='';
  i:=1;
  while (FileName[i]<>'.')or(i<Length(FileName)) do
      begin
        if not (IsStrANumber(FileName[i])) then
            delete(FileName,i,1)
             else break;
      end;
  //*******************************************************************
  for i:=1 to Length(FileName) do
     begin
       if (IsStrANumber(FileName[i]))and(FileName[i]<>'.') then IndStr:=IndStr+FileName[i]
          else
           begin
            if RemoveIndex then NewFileName:=Copy(FileName,i,Length(FileName)-i+1);
            Break;
           end;
     end;
  //*******************************************
  if (RemoveIndex) then
      begin
        if (CompareText(NewFileName,ExtractFileExt(FileName))=0) then
           begin
            FileName:='_'+FileName;
            IndStr:='';
           end
            else FileName:=NewFileName;
      end;
  //*******************************************
  if IsStrANumber(IndStr) then
     result:=StrToInt(IndStr)
      else Result:=-1;
end;
//******************************************************************************
Procedure DelAllFilesFromLevelDir(Dir:String;Mask:String);
var aList:TStringList;
    i:integer;
begin
 try
  Dir:=CheckLastSleshOnPath(Dir,true);
  aList:=TStringList.Create;
  FindFile(Dir,aList,Mask,1);
  for i:=0 to aList.count-1 do
      DeleteFile(PAnsiChar(Dir+aList.strings[i]));
 finally
  FreeAndNIl(aList);
 end;
end;
//******************************************************************************
procedure DelAllFilesFromDir(StartDir: string; Mask:string);
var  SearchRec : TSearchRec;
begin
 try
 if Mask = '' then Mask := '*.*';
  if StartDir[Length(StartDir)] <> '\' then StartDir := StartDir + '\';
   if FindFirst(StartDir+Mask, faAnyFile, SearchRec) = 0 then
      begin
         repeat
            Application.ProcessMessages;
               if (SearchRec.Attr and faDirectory) <> faDirectory
                 then
                  begin
                    FileSetReadOnly(PAnsiChar(StartDir + SearchRec.Name) ,false);
                    DeleteFile(PAnsiChar(StartDir + SearchRec.Name)) //List.Add(StartDir + SearchRec.Name)
                  end
                    else
                      if (SearchRec.Name <> '..') and (SearchRec.Name <> '.') then
                        begin
                          FileSetReadOnly(PAnsiChar(StartDir + SearchRec.Name) ,false);
                          DeleteFile(PAnsiChar(StartDir + SearchRec.Name));
                          DelDir(StartDir + SearchRec.Name + '\',Mask);
                        end;
          until FindNext(SearchRec) <> 0;
   end;

  finally
   sysutils.FindClose(SearchRec);
  end;
end;
//******************************************************************************
procedure DelDir(StartDir: string; Mask:string);
begin
   DelAllFilesFromDir(StartDir, Mask);
   RemoveDir(PChar(StartDir));
end;
//******************************************************************************
Function ConvertTimeToMS(aTime:TTime):int64;
var Hour, Min, Sec, MSec: Word;
begin
 Result:=0;
 DecodeTime(aTime, Hour, Min, Sec, MSec);
 Result:=Result+Hour*60*60*1000;
 Result:=Result+Min*60*1000;
 Result:=Result+Sec*1000;
 Result:=Result+MSec;

// 1 cek= 1000 ms
// 1 min= 60*1000
// 1 hr=60*60*1000;
end;
//******************************************************************************
Function ConvertMSToTime(aMs:int64):TDateTime;
begin
 Result:=aMs/1000/SecsPerDay;
end;
//******************************************************************************
function RunExeFileAndWait(const FileProgram: string;CreationFlag:Cardinal=CREATE_NO_WINDOW): Boolean;
var
  SI: TStartupInfo;
  PI: TProcessInformation;
  ExitCode: Cardinal;
begin
  FillChar(SI, SizeOf(SI), 0);
  SI.cb := SizeOf(SI);

  Result := CreateProcess(nil, PChar( FileProgram ), nil, nil, False,  CreationFlag , nil, nil, SI, PI);    //  CREATE_NO_WINDOW    / 0

  if Result then
  begin
    //Application.MainForm.Hide;
    while GetExitCodeProcess(PI.hProcess, ExitCode) and
      (ExitCode = STILL_ACTIVE) do
      ; // ждем завершения, пустой цикл
    //Application.MainForm.Show;
  end;
end;
//******************************************************************************
Function CheckLastSleshOnPath(Path:string;Present:Boolean; Slash:string='\' ):string;
begin
   if present then
      begin
       if (Path<>'')and ( (Path[Length(Path)]<>'\') and (Path[Length(Path)]<>'/') ) then
          Path:=Path+Slash;
      end
       else
         begin
            if (Path<>'')and( (Path[Length(Path)]='\') or (Path[Length(Path)]='/') ) then
               Delete(Path,Length(Path),1);
         end;
  result:=Path;
end;

procedure FormFocus(hWnd: HWND; nCmdShow: Integer; Delay: Integer = 0);
begin
 ShowWindow(hWnd, nCmdShow);
 Sleep(Delay);
 SwitchToThisWindow(hWnd, True);
end;
//******************************************************************************
procedure SendTextToHandle(Handle:THandle;WindowName:String; AText:String;RestoreWindow:Boolean);
const
  CMD_SETLABELTEXT = 1; //Задаем ID команды
var
  CDS: TCopyDataStruct;
  MyHandle:THandle;
begin
    try
     if AText<>'' then
        begin
         MyHandle:=FindWindow(nil, PChar(WindowName));    // 'Jpg Viewer'
         if RestoreWindow then FormFocus(MyHandle, SW_RESTORE, 100);
           //Устанавливаем тип команды
         CDS.dwData := CMD_SETLABELTEXT;
         //Устанавливаем длину передаваемых данных
         CDS.cbData := Length(AText) + 1;
         //Выделяем память буфера для передачи данных
         GetMem(CDS.lpData, CDS.cbData);
            //Копируем данные в буфер
        end;
        StrPCopy(CDS.lpData, AnsiString(AText));
        SendMessage(MyHandle, WM_COPYDATA, Handle, Integer(@CDS));
    finally
      //Высвобождаем буфер
      if  AText<>'' then
          FreeMem(CDS.lpData, CDS.cbData);
    end;
end;
//******************************************************************************
function AppIsResponding(WindowName: string): Boolean;
 const
   { Specifies the duration, in milliseconds, of the time-out period }
   TIMEOUT = 50;
 var
   Res: DWORD;
   h: HWND;
 begin
   h := FindWindow(nil, PChar(WindowName));
   if h <> 0 then
     Result := SendMessageTimeOut(H,
       WM_NULL,
       0,
       0,
       SMTO_NORMAL or SMTO_ABORTIFHUNG,
       TIMEOUT,
       Res) <> 0;
   //else
   //  ShowMessage(Format('%s not found!', [ClassName]));
 end;
//******************************************************************************
Procedure AddPathForParam(InifileName,ParamName:String;Value:String);
begin
  CreateIniFile(InifileName,'Action',ParamName, Value);
end;
//******************************************************************************
Function GetPathForParam(InifileName,ParamName:String):String;
begin
 result:=ReadIniFile(InifileName,'Action',ParamName);
end;
//******************************************************************************
Function MyCheckMutex(MutexName:string):Thandle;
var MutexHandle:Thandle;
begin
  MutexHandle := OpenMutex(MUTEX_ALL_ACCESS, false, PChar(MutexName) );
  Result:=MutexHandle;
  {if MutexHandle <> 0 then
     begin
      //CloseHandle(MutexHandle);
      result:=true;
     end
      else result:=false; }
end;
//******************************************************************************
Function MyCreateMutex(MutexName:string):Thandle;
var MutexHandle:Thandle;
begin
  MutexHandle:=MyCheckMutex(MutexName);
  if MutexHandle<>0 then
     begin
       result:= MutexHandle;
       exit;
     end
     else
       result := CreateMutex(nil, false, PChar(MutexName));
end;
//******************************************************************************
procedure  MyDeleteMutex(aHandle:THandle);
begin
  //MutexHandle := OpenMutex(MUTEX_ALL_ACCESS, false, PAnsiChar(MutexName));
  if aHandle <> 0 then
     begin
      //ReleaseMutex(aHandle);
      CloseHandle(aHandle);
     end;
end;
//******************************************************************************
procedure SetPropInCxtLookupComboBox(ComboBoxDB:TcxLookUpComboBox;
                                     ListSource :TDataSource; aListFieldName, aKeyField:String; CanUpdate:Boolean; Destroy:Boolean);
var Prev:TPersistent;
begin
try
 if Destroy then
    begin
     ComboBoxDB.Properties.ListSource:=nil;
     ComboBoxDB.Properties.ListFieldNames:='';
     ComboBoxDB.Text:='';
    end
      else
       begin
        //Prev:=ComboBoxDB.Properties.ListColumns;
        if aListFieldName<>'' then
           ComboBoxDB.Properties.ListFieldNames:=aListFieldName;
        //ComboBoxDB.Properties.ListColumns.Assign(Prev);

        ComboBoxDB.Properties.ListSource    :=ListSource;
        ComboBoxDB.Properties.KeyFieldNames :=aKeyField;

       end;

 if not CanUpdate then
    ComboBoxDB.Properties.ReadOnly:=true
   else ComboBoxDB.Properties.ReadOnly:=False;
finally
end;
end;
//******************************************************************************
procedure SetPropInDBCxEdit(EditDB:TcxDBTextEdit;DAtasource:Tdatasource;Datafield:String;CanUpdate:Boolean;Destroy:Boolean);
begin
  EditDB.DataBinding.DataField:='';
if Destroy then
   begin
    EditDB.DataBinding.DataSource:=nil;
    EditDB.Text:='';
   end
     else EditDB.DataBinding.DataSource:=DAtasource;
   EditDB.DataBinding.DataField:=Datafield;

if (not CanUpdate)or(EditDB.Properties.ReadOnly) then
   EditDB.Properties.ReadOnly:=true
  else EditDB.Properties.ReadOnly:=False;
end;
//******************************************************************************
procedure SetPropInDBCxSpinEdit(EditDB:TcxDBSpinEdit;DAtasource:Tdatasource;Datafield:String;CanUpdate:Boolean;Destroy:Boolean);
begin
  EditDB.DataBinding.DataField:='';
if Destroy then
   begin
    EditDB.DataBinding.DataSource:=nil;
    EditDB.Text:='';
   end
     else EditDB.DataBinding.DataSource:=DAtasource;
   EditDB.DataBinding.DataField:=Datafield;

if (not CanUpdate)or(EditDB.Properties.ReadOnly) then
   EditDB.Properties.ReadOnly:=true
  else EditDB.Properties.ReadOnly:=False;
end;
//******************************************************************************
procedure SetPropInDBComboBox(EditCmbBox:TcxDBComboBox;DAtasource:Tdatasource;Datafield:String;CanUpdate:Boolean;Destroy:Boolean);
begin
  EditCmbBox.DataBinding.DataField:='';
if Destroy then
   begin
    EditCmbBox.DataBinding.DataSource:=nil;
    EditCmbBox.Text:='';
   end
     else EditCmbBox.DataBinding.DataSource:=DAtasource;
   EditCmbBox.DataBinding.DataField:=Datafield;

if (not CanUpdate)or(EditCmbBox.Properties.ReadOnly) then
   EditCmbBox.Properties.ReadOnly:=true
  else EditCmbBox.Properties.ReadOnly:=False;
end;
//******************************************************************************
procedure SetPropInDBCheckBox(DBCheckBox:TcxDBCheckBox;DAtasource:Tdatasource;Datafield:String;CanUpdate:Boolean;Destroy:Boolean);
begin
if Destroy Then DBCheckBox.DataBinding.DataSource:=nil
           Else DBCheckBox.DataBinding.DataSource:=DAtasource;
   DBCheckBox.DataBinding.DataField:=Datafield;
if not CanUpdate then
   DBCheckBox.Properties.ReadOnly:=true
  else DBCheckBox.Properties.ReadOnly:=False;
end;
//******************************************************************************
procedure SetPropInCxExtLookupComboBox(ComboBoxDB:TcxExtLookupComboBox;
                                       aView:TcxGridDBTableView; aListFieldName, aKeyField:String; CanUpdate:Boolean; Destroy:Boolean);
begin
try
 if Destroy then
    begin
     ComboBoxDB.Properties.View:=nil;
     ComboBoxDB.Properties.ListFieldItem:=nil;
     ComboBoxDB.Text:='';
    end
      else
       begin
        ComboBoxDB.Properties.View:=aView;
        ComboBoxDB.Properties.ListFieldItem:=aView.GetColumnByFieldName(aListFieldName);
        ComboBoxDB.Properties.KeyFieldNames :=aKeyField;
       end;

 if not CanUpdate then
    ComboBoxDB.Properties.ReadOnly:=true
   else ComboBoxDB.Properties.ReadOnly:=False;
finally
end;
end;
//******************************************************************************
procedure InitLocateDBKeyValueInCxExtLookupComboBox(ComboBoxDB:TcxExtLookupComboBox);
begin
  if TcxGridDBTableView( TcxExtLookupCombobox(ComboBoxDB).Properties.View).DataController.DataSet.FieldByName(TcxExtLookupCombobox(ComboBoxDB).Properties.KeyFieldNames).Value<>TcxExtLookupCombobox(ComboBoxDB).EditValue then
    TcxGridDBTableView( TcxExtLookupCombobox(ComboBoxDB).Properties.View).DataController.DataSet.Locate(TcxExtLookupCombobox(ComboBoxDB).Properties.KeyFieldNames,TcxExtLookupCombobox(ComboBoxDB).EditValue,[] );
end;
//******************************************************************************
procedure SetPropInCxColumnExtLookupComboBox(ColExtLookUpProperty:TcxExtLookupComboBoxProperties;
                                         aView:TcxGridDBTableView; aListFieldName, aKeyField:String; CanUpdate:Boolean; Destroy:Boolean=false);
begin
try
 if Destroy then
    begin
     ColExtLookUpProperty.View:=nil;
     ColExtLookUpProperty.ListFieldItem:=nil;
     ColExtLookUpProperty.KeyFieldNames:='';
    end
      else
       begin
        ColExtLookUpProperty.View:=aView;
        ColExtLookUpProperty.ListFieldItem:=aView.GetColumnByFieldName(aListFieldName);
        ColExtLookUpProperty.KeyFieldNames :=aKeyField;
       end;

 if not CanUpdate then
    ColExtLookUpProperty.ReadOnly:=true
   else ColExtLookUpProperty.ReadOnly:=False;
finally
end;
end;
//******************************************************************************
procedure SetPropInDBCxLookupComboBox(ComboBoxDB:TcxDBLookupComboBox;DAtasource:Tdatasource;aListFieldName,aKeyField:String;CanUpdate:Boolean;Destroy:Boolean);
var BeforeEdit:TDatasetNotiFyEvent;
begin
try
 BeforeEdit:=DAtasource.DataSet.BeforeEdit;
 DAtasource.DataSet.BeforeEdit:=nil;
 if Destroy then
    begin
     ComboBoxDB.DataBinding.DataSource:=nil;
     ComboBoxDB.Text:='';
    end
      else ComboBoxDB.DataBinding.DataSource:=DAtasource;
    ComboBoxDB.DataBinding.DataField        :=aListFieldName;
    ComboBoxDB.Properties.KeyFieldNames     :=aKeyField;

 if not CanUpdate then
    ComboBoxDB.Properties.ReadOnly:=true
   else ComboBoxDB.Properties.ReadOnly:=False;
finally
 DAtasource.DataSet.BeforeEdit:=BeforeEdit;
end;
end;
//******************************************************************************
procedure SetPropInCxLookupComboBox(ComboBoxDB:TcxLookupComboBox;ListSource:Tdatasource;aListFieldName,aKeyField:String;CanUpdate:Boolean;Destroy:Boolean=false);
begin
try
 if Destroy then
    begin
     ComboBoxDB.Properties.ListSource:=nil;
     ComboBoxDB.Text:='';
    end
      else ComboBoxDB.Properties.ListSource:=ListSource;

 ComboBoxDB.Properties.ListFieldNames    :=aListFieldName;
 ComboBoxDB.Properties.KeyFieldNames     :=aKeyField;

 if not CanUpdate then
    ComboBoxDB.Properties.ReadOnly:=true
   else ComboBoxDB.Properties.ReadOnly:=False;
finally
end;

end;
//******************************************************************************
procedure SetPropInDBCxExtLookupComboBox(ComboBoxDB:TcxDBExtLookupComboBox;DAtasource:Tdatasource;Datafield:String;
                                         aView:TcxGridDBTableView; aListFieldName, aKeyField:String; CanUpdate:Boolean; Destroy:Boolean);
var BeforeEdit:TDatasetNotiFyEvent;
begin
try
 BeforeEdit:=DAtasource.DataSet.BeforeEdit;
 DAtasource.DataSet.BeforeEdit:=nil;
 if Destroy then
    begin
     ComboBoxDB.DataBinding.DataSource:=nil;
     ComboBoxDB.Text:='';
    end
      else
       begin
        ComboBoxDB.DataBinding.DataSource:=DAtasource;
        ComboBoxDB.DataBinding.DataField:=Datafield;
        ComboBoxDB.Properties.View:=aView;

        ComboBoxDB.Properties.KeyFieldNames :=aKeyField;
        ComboBoxDB.Properties.ListFieldItem:=aView.GetColumnByFieldName(aListFieldName);
       end;

 if not CanUpdate then
    ComboBoxDB.Properties.ReadOnly:=true
   else ComboBoxDB.Properties.ReadOnly:=False;
finally
 DAtasource.DataSet.BeforeEdit:=BeforeEdit;
end;
end;
//******************************************************************************
procedure SetPropInDBImageComboBox(ComboBoxDB:TcxDBImageComboBox;DAtasource:Tdatasource;Datafield:String;CanUpdate:Boolean;Destroy:Boolean);
var BeforeEdit:TDatasetNotiFyEvent;
begin
try
 BeforeEdit:=DAtasource.DataSet.BeforeEdit;
 DAtasource.DataSet.BeforeEdit:=nil;
 if Destroy then
    begin
     ComboBoxDB.DataBinding.DataSource:=nil;
     ComboBoxDB.Text:='';
    end
      else ComboBoxDB.DataBinding.DataSource:=DAtasource;
    ComboBoxDB.DataBinding.DataField:=Datafield;

 if not CanUpdate then
    ComboBoxDB.Properties.ReadOnly:=true
   else ComboBoxDB.Properties.ReadOnly:=False;
finally
 DAtasource.DataSet.BeforeEdit:=BeforeEdit;
end;
end;
//******************************************************************************
procedure SetPropInDBListBox(DBListBox:TcxDBListBox;DAtasource:Tdatasource;Datafield:String;CanUpdate:Boolean;Destroy:Boolean);
begin
if Destroy Then DBListBox.DataBinding.DataSource:=nil
           Else DBListBox.DataBinding.DataSource:=DAtasource;
   DBListBox.DataBinding.DataField:=Datafield;
if not CanUpdate then
   DBListBox.ReadOnly:=true
  else DBListBox.ReadOnly:=False;
end;
//******************************************************************************
procedure SetPropInDBDateEdit(DateEditDB:TcxDBDateEdit;DAtasource:Tdatasource;Datafield:String;CanUpdate:Boolean;Destroy:Boolean);
begin
if Destroy Then DateEditDB.DataBinding.DataSource:=nil
           Else DateEditDB.DataBinding.DataSource:=DAtasource;
   DateEditDB.DataBinding.DataField:=Datafield;
if not CanUpdate then
   DateEditDB.Properties.ReadOnly:=true
  else DateEditDB.Properties.ReadOnly:=False;
end;
//******************************************************************************
Function EnableInputJustNumber(Sender: TObject; Key: Char;IsDecimal:boolean=true):Char;
var k:integer;
begin
 result:=Key;

 if ((key in['0'..'9','-',DecimalSeparator,#8])and(IsDecimal)) or
    ((key in['0'..'9','-',#8])and(not IsDecimal)) then
  begin
  if (Key='-')and(AnsiPos('-',TEdit(Sender).Text)<>0) then result:=#0;
  if (key in[DecimalSeparator])and(IsDecimal) then
    begin
    if  TEdit(Sender).Text='' then key:=#0;
      For k:=1 to Length( TEdit(Sender).Text) do
      begin
       if  TEdit(Sender).Text[k]in[DecimalSeparator] then result:=#0;
      end;
    end;
  end else result:=#0;
end;
//******************************************************************************
Function EnableInputJustLat(Sender: TObject; Key: Char):Char;
var k:integer;
begin
 result:=Key;
 if not ThisIsLatChar(Key) then
  else result:=#0;
end;
//******************************************************************************
Function EnableInputJustLatAndDigit(Sender: TObject; Key: Char):Char;
var k:integer;
begin
 result:=EnableInputJustNumber(Sender, Key,false);
 if (result=#0) then
 begin
   if (ThisIsLatChar(Key)) then result:= Key
   else result:=#0;
 end;
end;
//******************************************************************************
{function ThisIsChar(achar:WideString):boolean;
var i:integer;
begin
  result:=false;
  i:=65;

  while i<=255 do
     begin
       //**************************
       if WideString(Chr(i))=achar[1] then
          begin
           result:=true;
           exit;
          end;
       //**************************
       inc(i);
       if i=91 then i:=97;
       if i=123 then i:=188;
       //**************************
     end;
end;
//******************************************************************************}
Function ThisIsChar(aChar:WideChar):Boolean;
var r:integer;

begin
 result:=true;
 //***********************
 r:=Ord('0');
 if (Ord(aChar)>=0)and(Ord(aChar)<=47)    then result:=false;
 if (Ord(aChar)>=58)and(Ord(aChar)<=64)   then result:=false;
 if (Ord(aChar)>=91)and(Ord(aChar)<=96)   then result:=false;
 if (Ord(aChar)>=123)and(Ord(aChar)<=187) then result:=false;
 if (Ord(aChar)>=48)and(Ord(aChar)<=59)   then result:=false;  // is not Digital
end;
//******************************************************************************
Function ThisIsLatChar(aChar:Char):Boolean;
var r:integer;
begin
 result:=false;
 if (Ord(aChar)>=65)and(Ord(aChar)<=90)    then result:=true;
 if (Ord(aChar)>=97)and(Ord(aChar)<=122)   then result:=true;
end;
//******************************************************************************
Function ThisIsDigital(aChar:WideChar):Boolean;
begin
 result:=false;
 if (Ord(aChar)>=48)and(Ord(aChar)<=59) then result:=true;
end;
//******************************************************************************
Function DeleteAllGarbageFromStr(Astr:widestring;DelDigital:Boolean):widestring;
var i:integer;
begin
 i:=1;
 Result:='';
 While i<=Length(Astr) do
     begin
      if (DelDigital)and(ThisIsChar(Astr[i])) then Result:=Result+Astr[i]
          else
           if (not DelDigital)and((ThisIsChar(Astr[i]))or(ThisIsDigital(Astr[i]))) then Result:=Result+Astr[i];

      inc(i);
     end;
end;
//******************************************************************************
Function DeleteAllCharStayJustDigitalFromStr(Astr:widestring):widestring;
var i:integer;
begin
 i:=1;
 Result:='';
 While i<=Length(Astr) do
     begin
      if (ThisIsDigital(Astr[i])) then Result:=Result+Astr[i];

      inc(i);
     end;

end;
//******************************************************************************
function EnableInputJustChar(Sender: TObject; Key: Char):Char;
begin
 if not ThisIsChar(Widechar(Key)) then result:=#0
    else  result:=Key;
end;
//******************************************************************************
Function EnableInputNumberChar(Sender: TObject; Key: Char;MasEnableChar:array of Char):Char;
var i:integer;
    aKey:Char;
begin
 aKey:=#0;
 for i:=0 to Length(MasEnableChar)-1 do
     begin
      if Key=MasEnableChar[i] then
         begin
          aKey:=MasEnableChar[i];
          Break;
         end;
     end;
 //*************************************
 if aKey=#0 then
    aKey:=EnableInputJustNumber(Sender, Key, false);
 if aKey=#0 then
    aKey:=EnableInputJustChar(Sender, Key);
 //*************************************
 Result:=aKey;
end;
//******************************************************************************
function KillTask(ExeFileName: string;AcceptProcessID:Cardinal): Integer;
const
  PROCESS_TERMINATE = $0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
Procedure KillProcess(ProcessID:Cardinal);
var k:integer;
begin
  k:=Integer(TerminateProcess( OpenProcess(PROCESS_TERMINATE,BOOL(0),ProcessID), 0));
  while k<>0 do
   k:=Integer(TerminateProcess( OpenProcess(PROCESS_TERMINATE,BOOL(0),ProcessID), 0));
end;

begin
  Result := 0;
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);

  while Integer(ContinueLoop) <> 0 do
  begin
    if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) =
      UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) =
      UpperCase(ExeFileName))) then
        begin
          if (AcceptProcessID<>FProcessEntry32.th32ProcessID) then
              KillProcess(FProcessEntry32.th32ProcessID);
              {Result := Integer(TerminateProcess(
                                OpenProcess(PROCESS_TERMINATE,
                                            BOOL(0),
                                            FProcessEntry32.th32ProcessID),
                                            0)); }
        end;

     ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;
//******************************************************************************
Function CheckDateForinterval(aDate:TDate;aFrom,aTo:TDate):boolean;
begin
 if (aDate>=aFrom)and(aDate<=aTo) then result:=true
     else result:=false
end;
//******************************************************************************
Function GetDateFirstDayMonth(aDate:Tdate):Tdate;
var Year, Month, Day:Word;
begin
 result:=EnCodeDate(YearOf(aDate), MonthOf(aDate), 1);
end;
//******************************************************************************
Function GetDateLastDayMonth(aDate:Tdate):Tdate;
var Year, Month, Day:Word;
    LastDay:Word;
begin
 //FirstDay:=GetDateFirstDayMonth(aDate);
 //Result := FirstDay + DaysInMonth(aDate) - 1;
 DecodeDate(aDate,Year,Month,Day);
 result:=EncodeDate(Year,Month,DaysInAMonth(Year,Month));
end;
//******************************************************************************
Function GetDateFirstDayYear(aDate:Tdate):Tdate;
var Year, Month, Day:Word;
begin
 result:=EnCodeDate(YearOf(aDate), 1, 1);
end;
//******************************************************************************
Function GetDateLastDayYear(aDate:Tdate):Tdate;
var Year:word;
begin
 Year:=YearOf(aDate);
 result:=EncodeDate(Year,12,DaysInAMonth(Year,12));
end;
//******************************************************************************
Procedure CopySelectFileByDailog(FilterMask:String;CopyPathTo:String;Aprogres:TProgressBar=nil);
var OpenDailog:TOpenDialog;
    i:integer;
begin
 try
   OpenDailog:=TOpenDialog.Create(nil);
   OpenDailog.Filter:=FilterMask;
   OpenDailog.Options:=[ofHideReadOnly,ofAllowMultiSelect,ofEnableSizing];
   if OpenDailog.Execute then
      begin //2
         if Aprogres<>nil then Aprogres.Max:=OpenDailog.Files.Count;
         for i:=0 to OpenDailog.Files.Count-1 do
             begin //1
                MyCopyFile(OpenDailog.Files.Strings[i],CopyPathTo + ExtractFileName(OpenDailog.Files.Strings[i]));
                if Aprogres<>nil then
                   Aprogres.position:=Aprogres.position+1;
             end; //1
      end;//2
 finally
  FreeAndNIl(OpenDailog);
 end;
end;
//******************************************************************************
procedure DeleteFilesFormView(aView:TcxGRidDBTableView;FieldFileName:String;Aprogres:TProgressBar=nil);
var i:integer;
    CurrFilename:string;
    Value:Variant;
begin
  if Aprogres<>nil then Aprogres.Max:=aView.DataController.Controller.SelectedRecordCount;
  for i:=0 to aView.DataController.Controller.SelectedRecordCount-1 do
      begin
       Value:=GetValueFromSelectRecord(FieldFileName,aView,i);
       if (Value<>null)and(Value<>'') then
           begin
            CurrFilename:=value;
            DeleteFile(PAnsiChar(CurrFilename));
           end;
       //*******************************
       if Aprogres<>nil then
          Aprogres.position:=Aprogres.position+1;
      end;
end;
//******************************************************************************
Procedure MoveSelectFilesFromView(aView:TcxGRidDBTableView;FieldFileName,MoveToPath:String; Aprogres:TProgressBar=nil);
var i:integer;
    CurrFilename:string;
    Value:Variant;
begin
  if Aprogres<>nil then Aprogres.Max:=aView.DataController.Controller.SelectedRecordCount;
  for i:=0 to aView.DataController.Controller.SelectedRecordCount-1 do
      begin
       Value:=GetValueFromSelectRecord(FieldFileName,aView,i);
       if (Value<>null)and(Value<>'') then
           begin
            CurrFilename:=value;
            MoveFile( PChar(CurrFilename),PChar(MoveToPath+ExtractFileName(CurrFilename)) );
           end;
       //*******************************
       if Aprogres<>nil then
          Aprogres.position:=Aprogres.position+1;
      end;
end;
//******************************************************************************

(*function BrowsSelectFolder(Caption:String;Path:String):String;
var Res:TStringList;
begin
 try
  Res:=TStringList.Create;
  Res:=SelectFolders(Caption,Path,false);
  if (Res<>nil)and(Res.Count<>0) then
     Result:=Res.Strings[0]
      else Result:='^';
 finally
  FreeAndNil(Res);
 end;
end; *)
//******************************************************************************
(*Procedure SelectFolder(Ed:TcxTextEdit);
var Apath:TStringList;
    PathMusicDialog:string;
begin
  try
   //PathMusicDialog:=ReadIniFile(GetFileNameOptionIni, 'Options' ,'PathToMp3');
   Apath:=SelectFolders('Select folder', Ed.Text , false);
   if Apath<>nil then
      Ed.Text:=Apath.Strings[0];
  finally
   FreeandNIl(Apath);
  end;
end;    *)
//******************************************************************************
function GetAssociationProgram(const DocFileName: string): string;
var
  FileClass: string;
  Reg: TRegistry;
begin
  Result := '';
  Reg := TRegistry.Create(KEY_EXECUTE);
  Reg.RootKey := HKEY_CLASSES_ROOT;
  FileClass := '';
  if Reg.OpenKeyReadOnly(ExtractFileExt(DocFileName)) then
  begin
    FileClass := Reg.ReadString('');
    Reg.CloseKey;
  end;
  if FileClass <> '' then begin
    if Reg.OpenKeyReadOnly(FileClass + '\Shell\Open\Command') then
    begin
      Result := Reg.ReadString('');
      Reg.CloseKey;
    end;
  end;
  Reg.Free;
end;
//******************************************************************************
procedure MyShowFolder(aHandle:THandle;aPath:String);
var Path:String;
begin
   if aPath='' then
      aPath:=Application.ExeName;

   Path:=ExtractFilePath(aPath);
   Path:=CheckLastSleshOnPath(Path,true);
   //ExistsDir(Path);
   if DirectoryExists(Path) then
     ShellExecute(aHandle, 'open',PChar(Path),nil,nil, SW_SHOWNORMAL)
   else ShowMessage('Directory '+Path+' not found.');
end;
//******************************************************************************
Procedure MyShowWindowsFile(aHandle:THandle;aFileName:String);
begin
  if aFileName='' then exit;

  if FileExists(aFileName) then
    ShellExecute( aHandle , 'open',PChar( aFileName ),nil,nil, SW_SHOW )
  else ShowMessage('File '+ExtractFileName(aFileName)+' not found.');
end;
//******************************************************************************
Procedure ListRandom(aList:TStringList;Count:integer=1);
var i,j:integer;
    k:Integer;
begin
 if aList.Count<=1 then exit;
 //**************************
 for k:=1 to Count do
     begin
      for i:=0 to aList.Count-1 do
         begin
          Randomize;
          j:=Random(aList.Count-1);
          if j+1<=aList.Count-1 then
             aList.Exchange(0,j+1);
         end;
     end;
end;
//******************************************************************************
function GetDirDateTime(const Dir: string): TDateTime;
var Sr : TSearchRec;
    vlDateTime : TDateTime;
begin
 CheckLastSleshOnPath(Dir,True);
 vlDateTime := -1;
 if FindFirst(Dir + '*.*' , faDirectory, sr) = 0 then
     vlDateTime := FileDateToDateTime(Sr.Time);
 sysUtils.FindClose(Sr);
 result := vlDateTime;
end;
//******************************************************************************
Function GetFileDateTime(FileName: string): TDateTime;
var intFileAge: LongInt;
begin
  intFileAge := FileAge(FileName);
  if intFileAge = -1 then
     Result := 0
  else
    Result := FileDateToDateTime(intFileAge)
end;
//******************************************************************************
procedure SetDateModifiedToFile(FileName: string; aDate:TDateTime);
begin
  FileSetDate( FileName , DateTimeToFileDate( aDate ) );
end;
//******************************************************************************
Function CheckDayFromSelectBox( ChListBox:TcxCheckListBox; ForDateTime:TDatetime ):boolean;
var CurrDayOfDay:Integer;
begin
 CurrDayOfDay:=DayOfTheWeek(ForDateTime);
 if CurrDayOfDay in [1..7] then
    result:=ChListBox.Items[CurrDayOfDay-1].Checked;
end;
//******************************************************************************
procedure GetArrStatusCheckListBox( MaxCount:Integer; aValueListBox:variant; var ResValues:TMasValues );
var i:Integer;
    ChListBox:TcxCheckListBox;
     V: Int64;
begin
  V := VarAsType(aValueListBox, varInt64);
  SetLength( ResValues, MaxCount );
    
  for I := 0 to MaxCount - 1 do
  begin
    if V and 1 = 0 then // перевірка на парність
      ResValues[I] := cbsUnchecked
    else
      ResValues[I] := cbsChecked;
    V := V shr 1;                // або v = trunc( aValueListBox / exp( aRightShift*ln(2) ) )  Trunc( aValueListBox * 2^aRightShift ) mod 2 <> 0 - не парне підходить
  end;
end;
//******************************************************************************
function FindSimilaryValuesInTwoArr(Arr1,Arr2:array of Variant; TrueValues:Variant):Boolean;
var i:Integer;
begin
  result := False;
  if Length(Arr1)<>Length(Arr2) then exit;
  //*************************
  for i:=0 to Length(Arr1)-1 do
     if (Arr1[i]=TrueValues)and(Arr2[i]=TrueValues) then
     begin
       result := True;
       exit;
     end;
end;
//******************************************************************************

(*Function CheckDayFromSelectBoxCheckListColumn(CheckComboBoxColumn:TcxGridDBColumn;ForDate:TDate):boolean;
var CurrDayOfDay:Integer;
    i:integer;
begin
 CurrDayOfDay:=DayOfTheWeek(ForDate);
 if CurrDayOfDay in [1..7] then
     with TcxCheckComboBoxProperties(CheckComboBoxColumn.Properties) do
        begin
            items.BeginUpdate;
          try
            if CheckStates[CurrDayOfDay-1] = cbsChecked then
               result:=true
                else result:=false;
          finally
            items.EndUpdate;
          end;
        end;
end;
*)
//******************************************************************************
(*function GetComboPropertiesChecks(cxCheckComboBoxProperties: TcxCheckComboBoxProperties;Ind:Integer): boolean;
Var
  i: Integer;
begin
  result:=false;
  with cxCheckComboBoxProperties do
    begin
      if Ind>items.Count-1 then exit;
      //*****************************
      //items.BeginUpdate;
      try
        result := CheckStates[Ind] = cbsChecked;
      finally
       // items.EndUpdate;
      end;//try
    end;//with
end;
*)
//******************************************************************************

Function GetDateTimeFormat(aDateTime:TDateTime):String;
var AYear,AMonth,ADay : word;
    aTime:TTime;
begin
  aTime:=aDateTime;
  DecodeDate(aDateTime,AYear,AMonth,ADay);
  Result:=GetMonthEnNameByNumber(AMonth)+' '+IntToStr(ADay)+', '+DayOfWeekEng(aDateTime)+' '+TimeToStr(aTime);
end;
//******************************************************************************
Function GetDateFormat(aDateTime:TDateTime;ShortMonth:Boolean=false):String;
var AYear,AMonth,ADay : word;
    CurrMonthStr:widestring;
begin
  DecodeDate(aDateTime,AYear,AMonth,ADay);
  CurrMonthStr:=GetMonthEnNameByNumber(AMonth);
  if ShortMonth then CurrMonthStr:=copy(CurrMonthStr,1,3)+'.';
  Result:=CurrMonthStr+' '+IntToStr(ADay);
end;
//******************************************************************************
Function GetCurrDateFormat:String;
var AYear,AMonth,ADay : word;
begin
  Result:=GetDateTimeFormat(Now);
end;
//******************************************************************************
function FileIsLock(FileName: string): Boolean;
var
  h: THandle;
  e: DWORD;
begin
 result:=false;
 if not fileExists(FileName) then exit;

 h:=CreateFile( PChar(FileName), GENERIC_READ ,0, nil, OPEN_EXISTING, 0, 0 );    //or GENERIC_WRITE
 if h=INVALID_HANDLE_VALUE then
    result:=true
     else CloseHandle(h);
end;
//******************************************************************************
(*Procedure FileUnLock(aFileName:String);
var h: THandle;
    aFileSize : Integer;
begin
 if FileIsLock(aFileName) then
    begin
     h:= CreateFile(PChar(aFileName), GENERIC_READ, 0, {exclusive} nil, {security} OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
        begin
         //aFileSize   := GetFileSize(aHandle,nil);
         aFileSize:= GetFileSize(h,nil);
         Win32Check(lockFile(h,0,0,aFileSize,0));
         Win32Check(UnlockFile(h,0,0,aFileSize,0));
        end;
    end;
end; *)
//******************************************************************************
procedure FileUnlock(FileName:string);
var handle: HWND;
     Ov: OVERLAPPED;
     aFileSize : Integer;
begin
  handle := CreateFile(PChar(FileName), GENERIC_READ, 0, nil, OPEN_EXISTING, 0, 0);
  try
    ov.Internal := 0;
    ov.InternalHigh := 0;
    ov.Offset := 0;
    ov.OffsetHigh := 0;
    ov.hEvent := handle;

    aFileSize:= GetFileSize(handle,nil);
    lockFileEx( handle ,0,0,aFileSize,0,Ov);
    UnlockFileEx( handle, 0, 0, aFileSize, Ov);
  finally
    CloseHandle(handle);
  end;
end;
//******************************************************************************
Function CheckFilesFolderIsLocked(aPath:String):boolean;
var aList:TStringList;
    i:integer;
begin
  try
    result:=false;
    aList:=TStringList.create;
    FindSubDirFiles(aPath,'*.*',aList);
    for i:=0 to aList.count-1 do
        begin
          if FileIsLock(aList.Strings[i]) then
             begin
              //if not IfLockThenUnlock then
                 begin
                  result:=true;
                  break;
                 end;
                 { else
                   FileUnLock(aList.Strings[i]); }
             end;
        end;
  finally
   FreeAndNIl(aList);
  end;
end;
//*****************************************************************************
procedure LockControl(c: TWinControl; bLock: Boolean);
begin
  if (c = nil) or (c.Handle = 0) then Exit;
  if bLock then
    SendMessage(c.Handle, WM_SETREDRAW, 0, 0)
  else
  begin
    SendMessage(c.Handle, WM_SETREDRAW, 1, 0);
    RedrawWindow(c.Handle, nil, 0,
      RDW_ERASE or RDW_FRAME or RDW_INVALIDATE or RDW_ALLCHILDREN);
  end;
end;
//******************************************************************************
Function GetFirstSubPathNotHiden(aPath:String;ExceptAtribute:Integer):String;
var  AList:TStringList;
     i:integer;
     Attrs:Integer;
     CurrSubPath:String;
     CountFind:Integer;
     Flags:integer;
begin
  try
    AList:=TStringList.Create;
    aPath:=CheckLastSleshOnPath(aPath,true);
    Result:=aPath;
    //**************************************
    FindFile(aPath,  AList, '*.*', 0);
    //if AList.Count=0 then
    //   FindFile(aPath,  AList, '*.*', 2);

    CountFind:=0;
    for i:=0 to Alist.Count-1 do
         begin
           CurrSubPath:=CheckLastSleshOnPath(aPath+Alist[i],true);
           Attrs:= FileGetAttr(CurrSubPath);
           inc(CountFind);
           if (Attrs and ExceptAtribute  <=0) then
               begin
                Result:=CurrSubPath;
                break;
               end;
         end;
     //************************************
    { if CountFind = Alist.Count then
        begin
         for i:=0 to Alist.Count-1 do
             begin
              CurrSubPath:=CheckLastSleshOnPath(aPath+Alist[i],true);

              Flags := GetFileAttributes(PChar(aPath+AList[i]));
              FileSetAttr(CurrSubPath,Flags and not ExceptAtribute );
              SetAllAttrForFiles(CurrSubPath,'*.*',not ExceptAtribute);

              //FileSetAttr(CurrSubPath,not ExceptAtribute);
              if i=0 then result:=CurrSubPath;
             end;
        end;}
  finally
   FreeAndNIl(AList);
  end;
end;
//******************************************************************************
Procedure CreateEmptyFile(Path,NameFile:String);
var aFile:TStringList;
begin
  DeleteFile(PAnsiChar(Path+NameFile));
  try
   aFile:=TStringList.Create;
   aFile.SaveToFile(Path+NameFile);
  finally
   FreeAndNIl(aFile);
  end;
end;
//******************************************************************************
function PathIsHide(aPath:String):Boolean;
var Attrs:Integer;
begin
  Attrs:= FileGetAttr(aPath);
  if (Attrs and faHidden<=0) then
      result:=false
       else result:=true;
end;
//******************************************************************************
Procedure SortMultiSelFilesOpenDialog(aOpenDialog:TOpenDialog;aToListFiles:TStringList);
var PathFiles:String;
    i:integer;
    ShellListView:TShellListView;
    Form:TForm;
begin
 PathFiles:=ExtractFilePath(aOpenDialog.FileName);// GetNamePath;
 try
   PathFiles:=CheckLastSleshOnPath(PathFiles,true);
   Form:=TForm.Create(nil);
   ShellListView:=TShellListView.Create(Form);

   ShellListView.Visible:=false;
   ShellListView.Parent:=Form;
   ShellListView.Root:=PathFiles;
   ShellListView.ObjectTypes:=[otFolders,otNonFolders,otHidden];
   //****************************

   if ShellListView.Items.Count=0 then showmessage('NOLL FIND FILES '+ShellListView.Root);
   for i:=0 to ShellListView.Items.Count-1 do
       begin
        if aOpenDialog.Files.IndexOf(ShellListView.Folders[i].PathName)<>-1 then
            aToListFiles.Add(ShellListView.Folders[i].PathName);
       end;
   //****************************
 finally
  ShellListView.Root:='c:\';
  FreeAndNil(ShellListView);
  FreeAndNil(Form);
 end;
end;
//******************************************************************************
Function ParseDateFromStr(StrWithDate:wideString;StartPos:Integer):TMyDateFormat;
var DateStr:String;
    YearStr:String;
    MonthStr:String;
    DayStr:String;
begin
 DateStr:=Copy(StrWithDate,StartPos,10);
 YearStr:=Copy(DateStr,1,4);
 if IsStrANumber(YearStr,true) then
    begin
     MonthStr:=Copy(DateStr,6,2);
     DayStr  :=Copy(DateStr,9,2);
    end
     else
      begin
        YearStr:=Copy(DateStr,10-3,4);
        MonthStr:=Copy(DateStr,1,2);
        DayStr:=Copy(DateStr,4,2);
      end;
 //********************************
 if (IsStrANumber(YearStr,true)) then
     Result.Year:=StrToInt(YearStr)
     else Result.Year:=-1;

 if (IsStrANumber(MonthStr,true)) then
     Result.Month:=StrToInt(MonthStr)
      else Result.Month:=-1;

 if (IsStrANumber(DayStr,true)) then
     Result.Day:=StrToInt(DayStr)
      else Result.Day:=-1;
 //********************************
end;
//******************************************************************************
Function ParseDateTimeFromStr( StrWithDate:wideString;StartPos:Integer=1 ):TDateTime;
var DateStr:WideString;
    YearStr:String;
    MonthStr:String;
    DayStr:String;
    HourStr:String;
    MinStr:string;
    SecStr:string;
begin
  result := -1;

  DateStr := Copy( StrWithDate, StartPos,14 );
  if Length(DateStr)=14 then
  begin

    YearStr := Copy( DateStr,1,4 );
    if IsStrANumber( YearStr, true ) then
    begin
      MonthStr := Copy(DateStr,5,2);
      DayStr   := Copy(DateStr,7,2);
      if ( IsStrANumber( MonthStr, true ) ) and ( IsStrANumber( DayStr, true ) ) then
      begin
        HourStr:=Copy(DateStr,9,2);
        MinStr :=Copy(DateStr,11,2);
        SecStr :=Copy(DateStr,13,2);
      end;
    end;

    if (IsStrANumber( HourStr, true ) ) and( IsStrANumber(MinStr,True) ) and ( IsStrANumber(SecStr,True) ) then
      result := EncodeDateTime( StrToInt( YearStr ), StrToInt( MonthStr ), StrToInt(DayStr), StrToInt( HourStr ), StrToInt( MinStr ), StrToInt( SecStr ), 0 );
  end;
end;
{Procedure AddPathForParam(ButName,ParamName:String;Value:String);
var ExePath:string;
begin
  ExePath:=ExtractFilePath(Application.ExeName);
  CreateIniFile(ExePath+GetFileNameOptionIni('Option'),ButName,ParamName, Value);
end;
//******************************************************************************
Function GetPathForParam(ButName,ParamName:String):String;
var ExePath:string;
begin
 ExePath:=ExtractFilePath(Application.ExeName);
 result:=ReadIniFile(ExePath+GetFileNameOptionIni('Option'),ButName,ParamName);
end;
//****************************************************************************** }
Procedure WindowsPlayMp3(aHandle:Thandle;aFileName:String);
begin
  if FileExists(aFileName) then
     ShellExecute (aHandle, 'open', 'wmplayer.exe' , PChar('"'+aFileName+'"'), nil, SW_ShowNormal)
      else ShowMessage('File '+aFileName+' not found');
end;
//******************************************************************************
Function MySelectFile(KeySavePath,FilterMask:String):String;
var OpenDialog:TOpenDialog;
    PathDialog:String;
    Path:string;
begin
 try
   Path:=ExtractFilePath(Application.ExeName);
   OpenDialog:=TOpenDialog.Create(nil);
   OpenDialog.Filter:=FilterMask;
   PathDialog:=ReadIniFile(Path+GetFileNameOptionIni, 'Options' ,KeySavePath);
   OpenDialog.InitialDir:=PathDialog;
   OpenDialog.FileName:='';
   if OpenDialog.Execute then
      begin
       CreateIniFile(Path+GetFileNameOptionIni, 'Options' ,KeySavePath, ExtractFilePath(OpenDialog.FileName));
       result:=OpenDialog.FileName;
      end
       else result:='^';
 finally
   FreeAndNIl(OpenDialog);
 end;
end;
//******************************************************************************
Function MySelectFileDialog(Path,FilterMask:String):String;
var OpenDialog:TOpenDialog;
begin
 try

   Path:=CheckLastSleshOnPath(Path,true);
   ExistsDir(Path);
   OpenDialog:=TOpenDialog.Create(nil);
   OpenDialog.Options:=[ofHideReadOnly,ofEnableSizing];
   OpenDialog.Filter:=FilterMask;
   OpenDialog.InitialDir:=Path;
   OpenDialog.FileName:='';
   if OpenDialog.Execute then
      begin
       result:=OpenDialog.FileName;
      end
       else result:='^';
 finally
   FreeAndNIl(OpenDialog);
 end;
end;
//******************************************************************************
Function MySaveFileDialog(Path,FilterMask:String):String;
var SaveDialog:TSaveDialog;
    PathDialog:String;
begin
 try
   Path:=CheckLastSleshOnPath(Path,true);
   ExistsDir(Path);
   SaveDialog:=TSaveDialog.Create(nil);
   SaveDialog.Options:=[];
   SaveDialog.Filter:=FilterMask;
   SaveDialog.InitialDir:=Path;
   SaveDialog.FileName:='';
   if SaveDialog.Execute then
      begin
       result:=SaveDialog.FileName;
      end
       else result:='^';
 finally
   FreeAndNIl(SaveDialog);
 end;
end;
//******************************************************************************
function MyLoadImageFromSelectFile(Path,FilterMask:String;Img:TImage):Boolean;
begin
  result:=False;
  Path := MySelectFileDialog(Path,FilterMask);
  if Path <> '^' then
  begin
    try
      Img.Picture.LoadFromFile(Path);
      result:=True;
    except

    end;
  end;
end;
//******************************************************************************
function MyLoadImageFromSelectFile(Path,FilterMask:String;Img:TcxImage):Boolean;
begin
  result:=False;
  Path := MySelectFileDialog(Path,FilterMask);
  if Path <> '^' then
  begin
    try
      Img.Picture.LoadFromFile(Path);
      result:=True;
    except

    end;
  end;
end;
//******************************************************************************
function LoadImageInImageDialog(aImage:TImage):boolean;
begin
  result := MyLoadImageFromSelectFile('','*.png;*.gif;*.jpg;*.jpeg;*.bmp)|*.png;*.gif;*.jpg;*.jpeg;*.bmp',aImage);
end;
//******************************************************************************
function LoadImageInImageDialog(aImage:TcxImage):boolean;
begin
  result := MyLoadImageFromSelectFile('','*.png;*.gif;*.jpg;*.jpeg;*.bmp)|*.png;*.gif;*.jpg;*.jpeg;*.bmp',aImage);
end;
//******************************************************************************
procedure LoadImageInImage(aImage:TImage;aFileName:string);
begin
  if FileExists( aFileName ) then
    aImage.Picture.LoadFromFile( aFileName );
end;
//******************************************************************************
procedure LoadImageInImage(aImage:TcxImage;aFileName:string);
var evCh:TNotifyEvent;
begin
  try
    evCh := aImage.Properties.OnChange;
    aImage.Properties.OnChange := nil;
    if FileExists( aFileName ) then
      aImage.Picture.LoadFromFile( aFileName );
  finally
    aImage.Properties.OnChange := evCh;
  end;
end;
//******************************************************************************
procedure SaveFromImageToFileJpg( aImage:TImage; aFileName:string );
var MyJPEG : TJPEGImage;
    Bitmap : TBitmap;
begin
  if aImage.Picture <> nil then
  begin
    try
      Bitmap := TBitmap.Create;

      Bitmap.Assign( aImage.Picture.Graphic );
      MyJPEG := TJPEGImage.Create;
      MyJPEG.Assign( Bitmap );
      MyJPEG.SaveToFile(aFileName);
    finally
      MyJPEG.Free;
      Bitmap.Free;
    end;
  end;
end;
//******************************************************************************
procedure SaveFromImageToFilePng( aImage:TImage; aFileName:string );
var MyPng : TdxPNGImage;
    Bitmap : TBitmap;
begin
  if aImage.Picture <> nil then
  begin
    try
      Bitmap := TBitmap.Create;

      Bitmap.Assign( aImage.Picture.Graphic );
      MyPng := TdxPNGImage.Create;
      MyPng.Assign( Bitmap );
      MyPng.SaveToFile(aFileName);
    finally
      MyPng.Free;
      Bitmap.Free;
    end;
  end;
end;
//******************************************************************************
procedure SaveFromImageToFileJpg( aImage:TcxImage; aFileName:string );
var MyJPEG : TJPEGImage;
    Bitmap : TBitmap;
begin
  if (aImage.Picture <> nil)and(aImage.Picture.Graphic<>nil) then
  begin
    try
      Bitmap := TBitmap.Create;

      Bitmap.Assign( aImage.Picture.Graphic );
      MyJPEG := TJPEGImage.Create;
      MyJPEG.Assign( Bitmap );
      MyJPEG.SaveToFile(aFileName);
    finally
      MyJPEG.Free;
      Bitmap.Free;
    end;
  end;
end;
//******************************************************************************
procedure SaveFromImageToFilePng( aImage:TcxImage; aFileName:string );
var MyPng : TdxPNGImage;
    Bitmap : TBitmap;
begin
  if (aImage.Picture <> nil)and(aImage.Picture.Graphic<>nil) then
  begin
    try
      Bitmap := TBitmap.Create;

      Bitmap.Assign( aImage.Picture.Graphic );
      MyPng := TdxPNGImage.Create;
      MyPng.Assign( Bitmap );
      MyPng.SaveToFile(aFileName);
    finally
      MyPng.Free;
      Bitmap.Free;
    end;
  end;
end;
//******************************************************************************
procedure LoadPhotoToImage( Img:TcxImage; aFieldName,aFileEmptyName:String );
begin
  try
    if FileExists(aFieldName) then Img.Picture.LoadFromFile(aFieldName)
    else
    begin
      if (aFileEmptyName<>'') and (FileExists(aFileEmptyName)) then
        Img.Picture.LoadFromFile(aFileEmptyName)
      else
        Img.Picture :=nil;
    end;
  except
  end;
end;
//******************************************************************************
Function MyIfThen(aValue:Boolean;IfTrue,IfFalse:Variant):Variant;
begin
 if aValue then result:=IfTrue
    else result:=IfFalse;
end;
//******************************************************************************
Procedure UpdateValueBySQL(aCon:TAdoConnection;aSql:String;masFieldName:array of String;MasValueForField:array of variant);
var ADoDS:TAdoDataset;
    i:integer;
begin
  try
   ADoDS:=TAdoDataset.Create(nil);
   AdoDS.Connection:=aCon;
   AdoDS.CommandText:=aSql;
   AdoDS.Open;
   AdoDS.Edit;
   for i:=0 to length(MasValueForField)-1 do
       AdoDS.FieldByName(masFieldName[i]).Value:=MasValueForField[i];
   AdoDS.Post;
   AdoDS.Close;
  finally
   FreeAndNil(ADoDS);
  end;
end;
//******************************************************************************
Function SetNormalValueForSql(Avalue:WideString):WideString;
begin
  ReplaseON(AValue,'False','0');
  ReplaseON(AValue,'True','1');

  ReplaseON(AValue,#39 ,'*^*');
  ReplaseON(AValue,#96 ,'*^*');
  ReplaseON(AValue,#145,'*^*');
  ReplaseON(AValue,#146,'*^*');

  ReplaseON(AValue,#34  ,'*&*');
  ReplaseON(AValue,#133 ,'*&*');
  ReplaseON(AValue,#148 ,'*&*');
  ReplaseON(AValue,#147 ,'*&*');

  ReplaseON(AValue,'*^*','''''');
  ReplaseON(AValue,'*&*','"');
  //ReplaseON(AValue,#13#10,#39+'+CHAR(13)+CHAR(10)+'+#39);
  //ReplaseON(AValue,#13,#39+'+CHAR(13)+'+#39);

  Avalue:=#39+AValue+#39 ;
  result:=Avalue;
end;
//******************************************************************************
Procedure PrepareColumnMarkerTag( aView:TcxGRidTableView; masCapt:array of String; MarkerTag:Integer );
var i:integer;
Function CheckColCapt(aCurrColCaption:String):Boolean;
var j:integer;
begin
  result:=false;
  for j:=0 to Length(masCapt)-1 do
      if CompareText(aCurrColCaption,masCapt[j])=0 then
         begin
          result:=true;
          break;
         end;
end;
//******************************************************
begin
  for i:=0 to aView.ColumnCount-1 do
  begin
    if CheckColCapt(AView.Columns[i].Caption) then
       AView.Columns[i].Tag:=MarkerTag;
  end;
end;
//******************************************************************************
Function UpFirstChar(Atext:Widestring):widestring;
var sFirst:Widestring;
begin
 result:='';
 if Atext='' then exit;
 Result:=AnsiLowerCase(Atext);
 sFirst:=AnsiUpperCase(Atext[1]);
 Result[1]:=sFirst[1];
end;
//******************************************************************************d
Function CorrectText(Atext:wideString):wideString;
var Firs:wideString;
    PC:wideString;
    i:integer;
begin
 if Atext='' then exit;
 Atext:=UpFirstChar(Atext);

 Atext:=Atext+'\';

 ReplaseON(Atext,' m.d.',' MD');
 ReplaseON(Atext,' p.c.',' PC');

 ReplaseON(Atext,' m.d',' MD');
 ReplaseON(Atext,' p.c',' PC');


 ReplaseON(Atext,' md ',' MD\\ ');ReplaseON(Atext,' MD\\ ',' MD ');
 ReplaseON(Atext,' pc ',' PC\ '); ReplaseON(Atext,' PC\\ ',' PC ');

 ReplaseON(Atext,' pc\',' PC');
 ReplaseON(Atext,' md\',' MD');

 ReplaseON(Atext,' Ste',' Siute');
 ReplaseON(Atext,' Ste\',' Siute');

 ReplaseON(Atext,' ny ',' N\Y\ ');  ReplaseON(Atext,' N\Y\ ',' NY ');
 ReplaseON(Atext,' ny\',' NY');

 // Ste na Siute

 for i:=1 to length(Atext) do
     if ((AnsiChar(Atext[i-1]) in ['-',' ',',','/','1','2','3','4','5','6','7','8','9','0']) ) and(Copy(Atext,i,3)<>'and')
      then
        begin
         if (I>0)and(not IsStrANumber(Atext[I-1])) then
            Firs:=UpperCase(Atext[I])
            else  Firs:=Atext[I];
            Atext[I]:=Firs[1];
        end;
 //*****************************
 if Atext[Length(Atext)]='\' then
    delete(Atext,Length(Atext),1);
 result:=Atext;
end;
//******************************************************************************
Procedure SaveListCheckViewToIni(AfileIni,AExtKey:String;aView:TcxGRidDbTableView;FieldID:string;aList:TList);
var i:integer;
    id:variant;
    Key:String;
    CurrPath:String;
begin
  CurrPath:=ExtractFilePath(Application.ExeName);
  Key:=aView.Name+'ListSelect'+AExtKey;
  DeleteIniFileSection(CurrPath+AfileIni,Key);
  for i:=0 to aView.ViewData.RecordCount-1 do
      begin
       id:=GetValueFromRecord(FieldID,aView,i);
       if (id<>null)and(aList.IndexOf(Pointer(aView.ViewData.Records[i].RecordIndex)) <> - 1) then
           CreateIniFile(CurrPath+AfileIni,Key, aView.Name+'_ListSelect_'+id, '1');
      end;
end;
//******************************************************************************
Procedure ReadListCheckViewToIni(AfileIni,AExtKey:String;aView:TcxGRidDbTableView;FieldID:string;aList:TList);
var i:integer;
    id:variant;
    Key:String;
    CurrPath:String;
    CurrValue:String;
begin
  aList.clear;
  CurrPath:=ExtractFilePath(Application.ExeName);
  Key:=aView.Name+'ListSelect'+AExtKey;
  for i:=0 to aView.ViewData.RecordCount-1 do
      begin
       id:=GetValueFromRecord(FieldID,aView,i);
       CurrValue:=ReadIniFile(CurrPath+AfileIni,Key, aView.Name+'_ListSelect_'+id);
       if CurrValue='1' then
          aList.Add(Pointer(aView.ViewData.Records[i].RecordIndex));
      end;
end;
//******************************************************************************
Function ChangeDigitAndCharPlace(aStr:WideString):WideString;
var FindChar:Boolean;
    PartStrBefore:WideString;
    i:integer;
    PosEnd:Integer;
begin
 Result:=aStr;
 if Length(aStr)=0 then exit;
 //********************************
 aStr:=Trim(aStr);

 FindChar:=ThisIsChar(aStr[1]); // if Char Ned find All Char Else Need find allDigital
 PartStrBefore:='';
 PosEnd:=0;
 //********************************
 for i:=1 to Length(aStr) do
     begin
      if (FindChar)then
         begin
           if (ThisIsChar(aStr[i]))then PartStrBefore:=PartStrBefore+aStr[i]
               else
                 begin
                  PosEnd:=i;
                  break;
                 end;
         end;
      if (not FindChar) then
          begin
           if (not ThisIsChar(aStr[i])) then PartStrBefore:=PartStrBefore+aStr[i]
               else
                 begin
                  PosEnd:=i;
                  break;
                 end;
          end;
     end;
 //*******************************
 if PosEnd<>0 then
    begin
     Delete(aStr,1,PosEnd-1);
     Result:=aStr+PartStrBefore;
    end;
end;
//******************************************************************************
procedure ClosePDF(AfileName:string);
var PdfOpenHandle:THandle;
begin
   PdfOpenHandle:=FindWindow(nil, 'Adobe Reader');
   if PdfOpenHandle=0 then
      PdfOpenHandle:=FindWindow(nil, 'Adobe Acrobat Professional');

   if PdfOpenHandle<>0 then
      PostMessage(PdfOpenHandle, WM_CLOSE , 0, 0);
end;
//******************************************************************************
Function DigitalIsEven(aValue:Integer):Boolean;
begin
 result:=(aValue mod 2)=0;
end;
//******************************************************************************
Function AddHistoryToCmBox(CBBox:TcxCombobox;Text:String):boolean;
Const MaxHistrory=20;
var i:integer;
    IndFind:Integer;
begin
 if Trim(Text)='' then exit;
 IndFind:=-1;
 for i:=0 to CBBox.Properties.Items.Count-1 do
     begin
       if CompareText(CBBox.Properties.Items.Strings[i],Text)=0 then
          begin
           IndFind:=i;
           break;
          end;
     end;
 //***********************
 if IndFind<>-1 then
    CBBox.Properties.Items.Delete(IndFind);
 //***********************
 CBBox.Properties.Items.Insert(0,Text);
 if CBBox.Properties.Items.Count>MaxHistrory then
    begin
     for i:=CBBox.Properties.Items.Count-1 downto MaxHistrory do
         CBBox.Properties.Items.Delete(i);
    end;
end;
//******************************************************************************
Procedure SaveIniHistoryCmBox(AfileIni,Afolder:String; CBBox:TcxCombobox);
var i:integer;
    CurrPath:String;
begin
 CurrPath:=ExtractFilePath(Application.ExeName)+Afolder;
 CurrPath:=CheckLastSleshOnPath(CurrPath,true);
 DeleteIniFileSection(CurrPath+AfileIni,'HistoryList_'+CBBox.Name);
 //********************************************
 for i:=0 to CBBox.Properties.Items.Count-1 do
     CreateIniFile(CurrPath+AfileIni,CBBox.Owner.Name+'HistoryList_'+CBBox.Name, 'History'+IntToStr(i),CBBox.Properties.Items.Strings[i]);
end;
//******************************************************************************
Procedure LoadFronIniHistoryCmBox(AfileIni,Afolder:String; CBBox:TcxCombobox);
var SectionList : TStringList;
    i:integer;
    CurrPath:String;
    CurrHistory:String;
    Event:TNotifyEvent;
begin
  try
   CurrPath := ExtractFilePath(Application.ExeName)+Afolder;
   CurrPath := CheckLastSleshOnPath(CurrPath,true);
   Event := CBBox.Properties.OnEditValueChanged;
   CBBox.Properties.OnEditValueChanged := nil;
   //********************************************************
   CBBox.Properties.Items.Clear;

   SectionList := ReadIniFileSection(CurrPath+AfileIni, CBBox.Owner.Name+'HistoryList_'+CBBox.Name);
   for i:=0 to SectionList.Count-1 do
   begin
    CurrHistory:=ReadIniFile(CurrPath+AfileIni,CBBox.Owner.Name+'HistoryList_'+CBBox.Name,SectionList.Strings[i]);
    if CurrHistory<>'' then
       CBBox.Properties.Items.Add(CurrHistory);
   end;
   //********************************************************
  finally
    CBBox.Properties.OnEditValueChanged := Event;
  end;
end;
//******************************************************************************
Function GetSumValueByExtParam(aView:TcxGridTableView; ColExtInd,ValueFilter:String;IndSummary:Integer):String;
//var group_row: TcxGridGroupRow;
begin

  {group_row := TcxGridGroupRow(aView.ViewData.Rows[i]);
  aView.Columns[ColEthnicInd].GroupIndex:=1;
  aView.Columns[ColEthnicInd].Visible:=false;
  Result:=aView.DataController.Summary.GroupSummaryDisplayValues[group_row.Index,group_row.Level,IndSummary]; }
end;
//******************************************************************************
(*Procedure BuildDatasetbyViewSummeryGroup(aView:TcxGridTableView;ColGroupInd,IndSummary:Integer;aDataset:TDataset;FiledGoup,FieldRes:String;ParamExtCol:TMyParamBuildDatasetbyViewSummeryGroup);
var SaveGroupCol:integer;
    SaveGroupColVisible:Boolean;

    SaveGroupExtCol:integer;
    SaveGroupExtColVisible:Boolean;
    group_row: TcxGridGroupRow;
    value_var:variant;
    Value_Name:String;
    i:integer;
    j:integer;
    aCountClosed:Integer;
    aCountLevel1:Integer;
    CurrExtColField:String;
Function FindFieldByExcColroupValue(aValue:String):String;
var I:integer;
begin
  result:='';
  for i:=0 to Length(ParamExtCol.ColGroupValueGrop)-1 do
      begin
       if CompareText(ParamExtCol.ColGroupValueGrop[i],aValue)=0 then
          begin
           result:=ParamExtCol.ColToField[i];
           break;
          end;
      end;
end;
begin
  SaveGroupCol:=aView.Columns[ColGroupInd].GroupIndex;
  SaveGroupColVisible:=aView.Columns[ColGroupInd].Visible;

  SaveGroupExtCol:=aView.Columns[ParamExtCol.IndGroupColFromView].GroupIndex;
  SaveGroupExtColVisible:=aView.Columns[ParamExtCol.IndGroupColFromView].Visible;
  try

    aView.Columns[ColGroupInd].GroupIndex:=0;
    aView.Columns[ColGroupInd].Visible:=false;

    aView.Columns[ParamExtCol.IndGroupColFromView].GroupIndex:=1;
    aView.Columns[ParamExtCol.IndGroupColFromView].Visible:=false;

    //******************************************
    if not aDataset.Active then aDataset.Open;
    while not aDataset.Eof do aDataset.Delete;
    //******************************************
    For i:=0 to aView.ViewData.RowCount-1 do
      begin
       if (i<aView.ViewData.RowCount)and(aView.ViewData.Rows[i] is TcxGridGroupRow)  then
          begin
           Value_Name:=aView.ViewData.Rows[i].DisplayTexts[ColGroupInd];

           group_row := TcxGridGroupRow(aView.ViewData.Rows[i]);
           value_var := aView.DataController.Summary.GroupSummaryDisplayValues[group_row.Index , group_row.Level,IndSummary];
           //*******************************
           aDataset.Append;
           aDataset.FieldByName(FiledGoup).AsString:=Value_Name;
           aDataset.FieldByName(fieldRes).Value:=value_var;
           aDataset.post;
           //*******************************

           if group_row.Level=0 then
              begin
               //*******************************************
               {for j:=0 to Length(ParamExtCol.ColToField)-1 do
                   begin
                        aDataset.Edit;
                        aDataset.FieldByName(ParamExtCol.ColToField[j]).Value:=0;
                        aDataset.post;
                   end;  }
               //*******************************************
               j:=i;
               aCountClosed:=aView.ViewData.RowCount;
               try
                 TcxGridGroupRow(aView.ViewData.Rows[i]).Expand(false);// is

                 aCountLevel1:=aView.ViewData.RowCount-aCountClosed;
                 for j:=i+1 to  i+1+aCountLevel1-1 do
                     begin
                      if (aView.ViewData.Rows[j] is TcxGridGroupRow)and(aView.ViewData.Rows[j].Level=1) then
                         begin
                          Value_Name:=aView.ViewData.Rows[j].DisplayTexts[ColGroupInd];
                          value_var:=aView.DataController.Summary.GroupSummaryDisplayValues[j,1,IndSummary];
                          //if value_var='' then value_var:='0';
                          CurrExtColField:=FindFieldByExcColroupValue(Value_Name);
                          if CurrExtColField<>'' then
                             begin
                              aDataset.Edit;
                              aDataset.FieldByName(CurrExtColField).Value:=value_var;
                              aDataset.post;
                             end;
                         end;
                     end;
                finally
                 TcxGridGroupRow(aView.ViewData.Rows[i]).Collapse(false);
                end;
               end;
          end;
      end;
  finally
   aView.Columns[ParamExtCol.IndGroupColFromView].GroupIndex:=SaveGroupExtCol;
   aView.Columns[ParamExtCol.IndGroupColFromView].Visible:=SaveGroupExtColVisible;

   aView.Columns[ColGroupInd].GroupIndex:=SaveGroupCol;
   aView.Columns[ColGroupInd].Visible:=SaveGroupColVisible;
  end;
end;*)
//******************************************************************************
Function ParseTextToList( aText:widestring; Split:array of string;IncludeSpliterToWord:Boolean=false ):TStringList;
var i:integer;
    Str:String;
function CheckOnSplit(aChar:String):Boolean;
var j:integer;
begin
   result := False;
   for j:=0 to Length(Split)-1 do
   if CompareText(aChar,Split[j])=0 then
   begin
     result:=true;
     break;
   end;
end;
//**********************************************
begin
 result:=TStringList.Create;
 Str:='';
 for i:=1 to Length(aText) do
     begin
      if CheckOnSplit(aText[i]) then
      begin
        if not IncludeSpliterToWord then
          result.Add(Trim(Str))
        else  result.Add(Trim(Str)+aText[i] );
        Str:='';
      end
      else Str:=Str+aText[i];
     end;
 if Str<>'' then
    result.Add(Trim(Str));
end;
//******************************************************************************
var ResultHandle:THandle;
    Find:boolean;
    aClassnameForFinder:widestring;
    aControlTextRus:widestring;
    aControlTextEn :widestring;
function  GetControlHandle(AHandle: HWND; ControlTextRus,ControlTextEn, Classname:widestring):THandle;
function FindHandle(AHandle: HWND): boolean; stdcall;
var
   buf, Caption: Array [0..255] of char;
   Acaption:widestring;
   Aclass:Widestring;

begin
   result := true;
   GetClassname(AHandle, buf, 256) ;
   GetWindowText(AHandle, Caption, 256) ;
   Acaption:=Caption;
   Aclass  := buf;
   //*****************************************
   if (AnsiPos(aControlTextRus,Acaption)<>0)or(AnsiPos(aControlTextEn,Acaption)<>0)or((aControlTextRus='')and(aControlTextEn='')and(Acaption='')) then
      Find:=true;
   //*****************************************
   if  (Find)and(AnsiPos(AClassnameForFinder,Aclass)<>0) then
       begin
        ResultHandle:=AHandle;
        find:=false;
       end;
end;
begin
  ResultHandle:=0;
  Find:=false;
  //********************************
  AClassnameForFinder:=Classname;
  aControlTextRus:=ControlTextRus;
  aControlTextEn :=ControlTextEn;
  //********************************
  EnumChildWindows(AHandle, @FindHandle, 0);
  FindHandle(AHandle);
  Result:=ResultHandle;
end;
//******************************************************************************
function PasteFromClipBoardPhoneTo3Edit(Code:String;Edit1,Edit2,Edit3:TCxTextedit):boolean;
var CurrPhone:String;
begin
  result:=false;
  CurrPhone:=Clipboard.AsText;
  CurrPhone:=DeleteAllCharStayJustDigitalFromStr(CurrPhone);
  if (Length(CurrPhone)=11)and(CurrPhone[1]='1') then
      delete(CurrPhone,1,1);
  //***********************************************
  if Length(CurrPhone)=7 then
     CurrPhone:=CurrPhone + Code;
  //***********************************************
  if Length(CurrPhone)=10 then
     begin
       Edit1.Text:=Copy(CurrPhone,1,3);
       Edit2.Text:=Copy(CurrPhone,4,3);
       Edit3.Text:=Copy(CurrPhone,7,4);

       result:=true;
     end;
  //***********************************************
end;
//******************************************************************************
procedure FormatMask(var MaskStr:widestring;Maskchar, MaskValue:widestring);
var CountDigMask:Integer;
    MaskInStr:Widestring;
    REplaseValue:Widestring;
function MaxMask(AMask,charMask:widestring):widestring;
var i:integer;
    res:Widestring;
    k:integer;
    CurrMask:widestring;
begin
 result:='';
 I:=1;
 CurrMask:='';
 k:=Ansipos('%',Amask);
 if k <>0 then
  begin
    res:='';
    while true do
     begin
       CurrMask:=AddNolForLengthNumber(CurrMask,I,charMask);
       if AnsiPos('%'+LowerCase(CurrMask),LowerCase(Amask))<>0 then
          result:='%'+CurrMask
          else break;
       inc(I);
     end;
  end;
end;
begin
   MaskInStr:= MaxMask(MaskStr,Maskchar);
   while MaskInStr<>'' do
   begin
     CountDigMask:=Length(MaskInStr)-1;
     ReplaseValue:=AddNolForLengthNumber(MaskValue,CountDigMask);
     ReplaseOn(MaskStr,MaskInStr, ReplaseValue);
     MaskInStr:= MaxMask(MaskStr,Maskchar);
   end;
end;
//******************************************************************************
function ParseTextInQuotes(ALNGText:wideString;Var StartIndex:Integer;KawChar:WideChar;KawCharEnd:wideChar=#0):wideString;
var i:integer;
    klbegin,klend:Integer;
    idText :string;
begin
  klbegin:=0;
  klend  :=0;
  for i:=StartIndex to length(ALNGText) do
      begin //1
       if ((KawCharEnd<>#0)and(ALNGText[i]=KawCharEnd)and(ALNGText[i-1]<>'\'))or((KawChar=',')and(ALNGText[i]=')')) then
          if klbegin=1 then begin klend:=1;break;end;
       //**************************************************
       if  (ALNGText[i]=KawChar)and(ALNGText[i-1]<>'\')   then
           begin //2
            if klbegin=1 then begin klend:=1;break;end;
            if klbegin=0 then klbegin:=1;
           end; //2
       //**************************************************
       if (klbegin =1)then
           if ((ALNGText[i]=KawChar)and(ALNGText[i-1]='\'))or((ALNGText[i]<>KawChar)) then
              idText :=idText+ALNGText[i];
      end;//1
  StartIndex:=i;
  result:=idText;
end;
//******************************************************************************
function GetInetFile(const fileURL, FileName: string): boolean;
const
  BufferSize = 1024;
var
  hSession, hURL: HInternet;
  Buffer: array[1..BufferSize] of Byte;
  BufferLen: DWORD;
  f: file;
  sAppName: string;
begin
  Result := False;
  sAppName := ExtractFileName(Application.ExeName);
  hSession := InternetOpen(PChar(sAppName),
  INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  try
    hURL := InternetOpenURL(hSession, PChar(fileURL), nil, 0, 0, 0);
    try
      AssignFile(f, FileName);
      Rewrite(f,1);
      repeat
        InternetReadFile(hURL, @Buffer, SizeOf(Buffer), BufferLen);
        BlockWrite(f, Buffer, BufferLen);
      until
        BufferLen = 0;
      CloseFile(f);
      Result := True;
    finally
      InternetCloseHandle(hURL);
    end;
  finally
    InternetCloseHandle(hSession);
  end;
end;
//******************************************************************************
procedure MyNetDownload(Owner:TComponent;Url:WideString;FileName:String);
var memo:TMemoryStream;
    IdHTTP1:TIdHTTP;
    //LHandler: TIdSSLIOHandlerSocketOpenSSL;
begin
 try
   try
     //ShowMessage('Download Before');
     ReplaseON(url,'https://','http://');
     //ShowMessage('Download Strem');
     Memo := TMemoryStream.Create;
     // LHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);

     idHTTP1:=TIdHTTP.Create(Owner);
     //IdHTTP1.IOHandler:=LHandler;
     //ShowMessage('Download IdHTTP Create');
     idHTTP1.HandleRedirects:=True;
     idHTTP1.Get(Url,Memo);
     // ShowMessage('Download Get');
     idHTTP1.Disconnect;
     // ShowMessage('Download Disconnect');
     Memo.SaveToFile(FileName);

   finally
    Memo.Free;
    //LHandler.Free;
    idHTTP1.Free;
   end;
 except
 end;
end;
//******************************************************************************
Function ConvertTimeToZone(aDateTime:TDateTime;TimeShift:real):TDateTime;
var ShiftHour:Integer;
    ShiftMin:Integer;
begin
  ShiftHour:=Trunc (TimeShift);
  ShiftMin:=Round(Frac(TimeShift)*60);
  //ShowMessage(IntToStr(ShiftHour)+'   '+intToStr(ShiftMin));

  aDateTime:=IncHour(aDateTime,ShiftHour);
  aDateTime:=IncMinute(aDateTime,ShiftMin);
  result:=aDateTime;
end;
//******************************************************************************
Function ConvertimeZoneToRealFormat(ShiftPart:String):Real;
var ShiftPartDec:String;
begin
  ShiftPartDec:=ShiftPart;
  ShiftPart:=Copy(ShiftPart,1,3);
  ShiftPartDec:=Copy(ShiftPartDec,4,2);

  result:=StrToInt(ShiftPart)+StrToInt(ShiftPartDec)/60;
end;
//******************************************************************************
Function ConvertimeZoneToStrFormat(ShiftReal:Real):String;
var Symb:String[1];
begin
  if ShiftReal>0 then Symb:='+'
     else Symb:='-';
  ShiftReal:=ABS(ShiftReal);

  result:=Symb + AddNolForLengthNumber(IntToStr(Trunc(ShiftReal)),2)+
          AddNolForLengthNumber(IntTostr(Trunc( frac(ShiftReal)*60)),2);
end;
//******************************************************************************
Function GetTime(aDateTime:TDateTime):TTime;
var  Hour, Min, Sec, MSec: Word;
begin
  DecodeTime(aDateTime,Hour, Min, Sec, MSec);
  result:=EncodeTime(Hour, Min, Sec, MSec);
end;
//******************************************************************************
Function TimeToJustHour(aTime:TTime):TTime;
var  Hour, Min, Sec, MSec: Word;
begin
 DecodeTime(aTime,Hour, Min, Sec, MSec);
 result:=EncodeTime(Hour, 0, 0, 0);
end;
//******************************************************************************
function StringToWideString(const s: AnsiString; codePage: Word): WideString;
var
  l: integer;
begin
  if s = '' then
    Result := ''
else
  begin
    l := MultiByteToWideChar(codePage, MB_PRECOMPOSED, PAnsiChar(@s[1]), -1, nil,
      0);
    SetLength(Result, l - 1);
    if l > 1 then
      MultiByteToWideChar(CodePage, MB_PRECOMPOSED, PAnsiChar(@s[1]),
        -1, PWideChar(@Result[1]), l - 1);
  end;
end; { StringToWideString }
//******************************************************************************
function WideStringToString(const ws: WideString; codePage: Word): AnsiString;
var
  l: integer;
begin
  if ws = '' then
    Result := ''
  else
  begin
    l := WideCharToMultiByte(codePage,
      WC_COMPOSITECHECK or WC_DISCARDNS or WC_SEPCHARS or WC_DEFAULTCHAR,
      @ws[1], - 1, nil, 0, nil, nil);
    SetLength(Result, l - 1);
    if l > 1 then
      WideCharToMultiByte(codePage,
        WC_COMPOSITECHECK or WC_DISCARDNS or WC_SEPCHARS or WC_DEFAULTCHAR,
        @ws[1], - 1, @Result[1], l - 1, nil, nil);
  end;
end; { WideStringToString }
//******************************************************************************
function LStrToWStr(Source: AnsiString):WideString;
begin
  SetThreadLocale($419);
  SetLength(Result,Length(Source));
  MultiByteToWideChar(3,0,@(Source[1]),Length(Source),@(Result[1]),Length(Source)*2);
end;
//******************************************************************************
Function DecPlusInt(Val1,Val2:Integer):integer;
begin
  result:=Val1*10+Val2;
end;
//******************************************************************************
Function FindBeginParam(aLine:wideString;KawChar:widechar;IndexPos:Integer):Integer;
var i:integer;
    Be:boolean;
    En:boolean;
    SavePosBeg:integer;
    CountFind:integer;
begin
 CountFind:=0;
 Be:=false;
 En:=false;
 SavePosBeg:=0;
 result:=0;
 for i:=1 to Length(aLine) do
 begin
   if ((aLine[i]=KawChar)and(Be))or(i=Length(aLine)) then En:=true;
   if (aLine[i]=KawChar)and(not Be) then
       begin
        SavePosBeg:=i;
        Be:=true;
       end;
   //***************************************
   if En then
      begin
        Be:=false;
        En:=false;
        inc(countFind);
      end;
   //***************************************
   if IndexPos=countFind then
      begin
       result:=SavePosBeg;
       break;
      end;
 end;
end;
//******************************************************************************
Procedure CopyDB(aFromDB,aToDB: TDataset;AcceptField:array of String;aFfieldSaveIDFrom:String='';aFfieldSaveIDTo:String='');
var i:integer;
Function CheckField(aField:String):Boolean;
var i:integer;
begin
 result:=true;
 for i:=0 to Length(AcceptField)-1 do
      begin
       if (Comparetext(aField,AcceptField[i])=0) then
           Result:=false;
      end;
end;
//********************************************************
begin
 try
  aFromDB.DisableControls;
  aFromDB.First;
  while not aFromDB.EOF do
     begin
       aToDB.Insert;

       for i := 0 to aFromDB.FieldCount - 1 do
           begin
             if CheckField(aFromDB.Fields[i].FieldName) then
                begin
                 if aToDB.FindField(aFromDB.Fields[i].FieldName)<>nil then
                    aToDB.FieldByName(aFromDB.Fields[i].FieldName).Value:=aFromDB.FieldByName(aFromDB.Fields[i].FieldName).Value;
                end;
             //*****************
             if Comparetext(aFromDB.Fields[i].FieldName,aFfieldSaveIDFrom)=0 then
                aToDB.FieldByName(aFfieldSaveIDTo).Value:=aFromDB.FieldByName(aFromDB.Fields[i].FieldName).Value;
           end;


       aToDB.Post;
       aFromDB.Next;
     end;
 finally
  aFromDB.EnableControls;
 end;
//********************************************************
end;
//******************************************************************************
Procedure CopyMasArray(aMasFrom:TMasValues;var aMasTo:TMasValues);
var i:integer;
begin
 SetLength(aMasTo,Length(aMasFrom));
 for i:=0 to Length(aMasFrom)-1 do
     aMasTo[i]:=aMasFrom[i];
end;
//******************************************************************************
Function ConvertStrToAsciKod(aStr,KodBeforeChar:String;LengthChar:integer=3):String;
var AsciKod:Integer;
    i:integer;
begin
 result:='';
 for i:=1 to Length(aStr) do
     begin
      AsciKod:=Ord(aStr[i]);
      result:=result+AddNolForLengthNumber(KodBeforeChar,LengthChar)+AddNolForLengthNumber(IntToStr(AsciKod),LengthChar);
     end;
end;
//******************************************************************************
Procedure PrepareListPaperSize(PaperName:TStringList;PaperValue:TStringList;PrinterIndex:Integer=-1);
type
  TPaperName = array[0..63] of Char;
  TPaperNameArray = array[1..High(Word) div SizeOf(TPaperName)] of TPaperName;
  PPaperNameArray = ^TPaperNameArray;

  TPaperArray = array [1..High(Integer) div SizeOf(word)] of word;
  PPaperArray = ^TPaperArray;

var
  Device, Driver, Port: array[0..255] of Char;
  hDevMode: THandle;
  i, numPaperFormats, numPaperSizes: integer;
  pPaperFormats: PPaperNameArray;
  pPaper: PPaperArray;
  Curr:Integer;
  numPapers:Integer;
  Currstr:String;
  //CurrPage:widestring;
begin
  Printer.PrinterIndex := PrinterIndex;
  Printer.GetPrinter(Device, Driver, Port, hDevMode);
  numPaperFormats := WinSpool.DeviceCapabilities(Device, Port, DC_PAPERNAMES, nil, nil);
  numPapers          := WinSpool.DeviceCapabilities(Device, Port, DC_PAPERS, nil, nil);
  //*************************
  if numPaperFormats > 0 then
  begin
    GetMem(pPaperFormats, numPaperFormats * SizeOf(TPaperName));
    GetMem(pPaper, numPapers * Sizeof(Word));

    try
      WinSpool.DeviceCapabilities(Device, Port, DC_PAPERNAMES, PChar(pPaperFormats), nil);  // DC_PAPERNames
      WinSpool.DeviceCapabilities(Device, Port, DC_PAPERS, Pchar(pPaper), nil);
      PaperName.Clear;
      PaperValue.Clear;
      for i := 1 to numPaperFormats do
          begin
           //CurrPage:=pPaperFormats^[i]+IntToStr(pPaper^[i]);
           //Curr:=Integer(pPaper^[i]);
           //Currstr:=IntToStr(Curr);

           PaperValue.Add(IntToStr(pPaper^[i]));
           PaperName.Add(pPaperFormats^[i]);

          end;
    finally
      FreeMem(pPaperFormats);
      FreeMem(pPaper);
    end;
  //*************************
  end;
end;
//******************************************************************************
function RegQueryStr(RootKey: HKEY; Key, Name: string;
  Success: PBoolean = nil): string;
var
  Handle: HKEY;
  Res: LongInt;
  DataType, DataSize: DWORD;
  Reg:TRegistry;
begin
  if Assigned(Success) then
    Success^ := False;
  Res := RegOpenKeyEx(RootKey, PChar(Key), 0, KEY_QUERY_VALUE, Handle);
  if Res <> ERROR_SUCCESS then
    Exit;
  Res := RegQueryValueEx(Handle, PChar(Name), nil, @DataType, nil, @DataSize);
  if (Res <> ERROR_SUCCESS) or (DataType <> REG_SZ) then
  begin
    RegCloseKey(Handle);
    Exit;
  end;
  SetString(Result, nil, DataSize - 1);
  Res := RegQueryValueEx(Handle, PChar(Name), nil, @DataType,
    PByte(@Result[1]), @DataSize);
  if Assigned(Success) then
    Success^ := Res = ERROR_SUCCESS;
  RegCloseKey(Handle);
end;
//******************************************************************************
Function ConVertNamePrinterToXLS(aPrinterName:String;ExcelVersion:Real):String;
var PortRegister:string;
Function ParsePort(aStrPort:string):string;
var Pos:integer;
begin
 Pos:=AnsiPos(',',aStrPort);
 if Pos<>0 then
    Result:=Copy(aStrPort,Pos+1,Length(aStrPort)-Pos+1)
     else
       result:=aStrPort;
end;
//********************************************************
begin
  PortRegister:=RegQueryStr(HKEY_CURRENT_USER,'Software\Microsoft\Windows NT\CurrentVersion\Devices', aPrinterName);
  PortRegister:=ParsePort(PortRegister);
  if PortRegister<>'' then
     begin
      if ExcelVersion<12 then Result:=aPrinterName+' ('+PortRegister+')'
         else  Result:=aPrinterName+' on '+PortRegister;
     end
      else Result:=aPrinterName;
end;
//******************************************************************************
Procedure GetListPrinters(List:TStringList;ConvertToXLS:boolean=false;ExcelVersion:Real=11);
//type TPrinterInfos=array of _PRINTER_INFO_2A;
type TPrinterInfos = array[0..0] of  _PRINTER_INFO_2;
var
  p: pointer;
  hpi: _PRINTER_INFO_2A;
  hGlobal: cardinal;
  dwNeeded, dwReturned: DWORD;
  bFlag: boolean;
  i: dword;

//********************************************************

begin
 try
  p := nil;
  EnumPrinters(PRINTER_ENUM_LOCAL, nil, 2, p, 0, dwNeeded, dwReturned);
  if (dwNeeded = 0) then exit;
  GetMem(p,dwNeeded);

  if (p = nil) then exit;
  bFlag := EnumPrinters(PRINTER_ENUM_LOCAL, nil, 2, p, dwneeded, dwNeeded, dwReturned);
  if (not bFlag) then exit;
  //*************************
  List.Clear;
  for i := 0 to dwReturned - 1 do
      begin
       if ConvertToXLS then
          List.Add(TPrinterInfos(p^)[i].pPrinterName+' ('+ ConVertNamePrinterToXLS(TPrinterInfos(p^)[i].pPrinterName+')',ExcelVersion))
           else List.Add(TPrinterInfos(p^)[i].pPrinterName);
      end;
  //*************************
 finally
  FreeMem(p);
 end;
end;
//******************************************************************************
function GetDefaultPrinterA(szPrinter:PAnsiChar; var bufferSize:DWORD):
BOOL; stdcall; external 'winspool.drv' name 'GetDefaultPrinterA';

function GetDefaultPrinterName:string;
var
  lprnName: PAnsiChar;
  lBufSize: DWord;
begin

  GetMem(lprnName, 1000);
  try
     GetDefaultPrinterA(lprnName, lBufSize);
     Result := lprnName;
  finally
     FreeMem(lprnName);
  end;
end;
//******************************************************************************
procedure SetDefaultPrinter(PrinterName: String) ;
var  j: Integer;
     Device : PChar;
     Driver : Pchar;
     Port : Pchar;
     HdeviceMode: Thandle;
     aPrinter : TPrinter;
 begin
    Printer.PrinterIndex := -1;
    getmem(Device, 255) ;
    getmem(Driver, 255) ;
    getmem(Port, 255) ;
    aPrinter := TPrinter.create;
    for j := 0 to Printer.printers.Count-1 do
    begin
      if Printer.printers[j] = PrinterName then
      begin
        aprinter.printerindex := j;
        aPrinter.getprinter(device, driver, port, HdeviceMode) ;
        StrCat(Device, ',') ;
        StrCat(Device, Driver ) ;
        StrCat(Device, Port ) ;
        WriteProfileString('windows', 'device', Device) ;
        StrCopy( Device, 'windows' ) ;
        ShowMessage(String(Device));
        SendMessage(HWND_BROADCAST, WM_WININICHANGE,0, Longint(@Device)) ;
     end;
    end;
    Freemem(Device, 255) ;
    Freemem(Driver, 255) ;
    Freemem(Port, 255) ;
    aPrinter.Free;
 end;
//******************************************************************************
Procedure PrepareListPrinter(PrinterName:TStringList;PrinterValue:TStringList);
var i:integer;
begin
 PrinterName.Clear;
 PrinterValue.Clear;
 //****************************
 for i:=0 to Printer.printers.Count-1 do
      begin
        PrinterName.Add(Printer.printers.Strings[i]);
        PrinterValue.Add(IntToStr(i));
      end;
end;
//******************************************************************************
function FindPrintIndexByName(NamePrint:Widestring):Integer;
var i:integer;
begin
 result:=-1;
 for i:=0 to Printer.printers.Count-1 do
     begin
      if compareTExt(printer.printers.strings[i],NamePrint)=0 then
         begin
          result:=i;
          break;
         end;
     end;
end;
//******************************************************************************
function DateTimeToUnix(dtDate: TDateTime): Longint;
begin
  Result := Round((dtDate - UnixStartDate) * 86400);
end;
//******************************************************************************
function UnixToDateTime(USec: Longint): TDateTime;
begin
  Result := (Usec / 86400) + UnixStartDate;
end;
//******************************************************************************
Function AlignTextToWidth(aText:widestring;aWidth:Integer;AligAddChar:wideChar=' '):widestring;
var ACanvas:TControlCanvas;
begin
 try
  ACanvas := TControlCanvas.Create;
  TControlCanvas(ACanvas).Control := Application.MainForm;
  ACanvas.Font.Assign(Application.MainForm.Font);
  while ACanvas.TextWidth(Atext)<aWidth do
        Atext:=Atext+AligAddChar;
  result:=Atext;
 finally
  ACanvas.Free;
 end;
end;
//******************************************************************************
Function FormingShortlyTextToWidth(aText:widestring;aWidth:Integer;StartBefore:widestring='...'):widestring;
var ACanvas:TControlCanvas;
    CountCharForCopy:integer;
    aWidthStartBefore:integer;
begin
 try
  ACanvas := TControlCanvas.Create;
  TControlCanvas(ACanvas).Control := Application.MainForm;
  ACanvas.Font.Assign(Application.MainForm.Font);
  //*****************************************
  aText:=aText;
  CountCharForCopy:=Length(Atext);
  aWidthStartBefore:= ACanvas.TextWidth(StartBefore);

  while aWidthStartBefore+ACanvas.TextWidth(Copy(Atext,Length(Atext)-CountCharForCopy,CountCharForCopy))>aWidth do
        dec(CountCharForCopy);

  //*****************************************
  result:=StartBefore+Copy(Atext,Length(Atext)-CountCharForCopy+1,CountCharForCopy+1);
 finally
  ACanvas.Free;
 end;
end;
//******************************************************************************
Function FormingShortlyTextToWidthByControl(aControl:TControl; aText:widestring;aWidth:Integer;StartBefore:widestring='...';EndContiniue:widestring='...'):widestring;
var ACanvas:TControlCanvas;
    CountCharForCopy:integer;
    aWidthStartBefore:integer;
    aWidthEndContiniue:Integer;
    CurrNewText:Widestring;
begin
 try
  ACanvas := TControlCanvas.Create;
  TControlCanvas(ACanvas).Control := aControl;
  ACanvas.Font.Assign(Application.MainForm.Font);
  //*****************************************
  aText:=aText;
  CountCharForCopy:=Length(Atext);
  aWidthStartBefore:= ACanvas.TextWidth(StartBefore);
  aWidthEndContiniue:=ACanvas.TextWidth(EndContiniue);

  while aWidthStartBefore+aWidthEndContiniue+ ACanvas.TextWidth(Copy(Atext,Length(Atext)-CountCharForCopy,CountCharForCopy))>aWidth do
        dec(CountCharForCopy);

  CurrNewText:=Copy(aText, Length(Atext)-CountCharForCopy+1,CountCharForCopy+1);
  if CompareText(CurrNewText , aText) = 0 then
   result:=CurrNewText
  else
   result:=StartBefore+CurrNewText +EndContiniue;
 finally
  ACanvas.Free;
 end;
end;
//******************************************************************************
Procedure MergePdfToTemplate(MainPdf,TemplatePdf,ReSultFilaName,PathToPDF_FTK:String);
var CmdSTAMPPage:String;
    AbatFile:TStringList;
    //h:THandle;
begin
  if not FileExists(MainPdf) then exit;
  if not FileExists(TemplatePdf) then exit;
  if not FileExists(PathToPDF_FTK) then exit;

  //***************************************************
  ExistsDir(ExtractFilePath(ReSultFilaName));
  try
    AbatFile:=TStringList.Create;
    CmdSTAMPPage:='"'+PathToPDF_FTK+'" "'+MainPdf+'" multistamp "'+TemplatePdf+'" output "'+ReSultFilaName+'"';
    AbatFile.Add(CmdSTAMPPage);
    AbatFile.SaveToFile(ExtractFilePath(Application.ExeName)+'Pdftk.bat');
    //ShellExecute(Application.MainForm.Handle,'open',PChar(ExtractFilePath(Application.ExeName)+'Pdftk.bat'),nil,nil, SW_HIDE);
    RunExeFileAndWait(ExtractFilePath(Application.ExeName)+'Pdftk.bat');
    sleep(100);
    DeleteFile(PAnsiChar(ExtractFilePath(PathToPDF_FTK)+'Pdftk.bat'));
  finally
    FreeAndNil(AbatFile);
  end;
end;
//******************************************************************************
Procedure SplitPdfToPages(MainPdf,PathOutput,ParamOutput,PathToPDF_FTK:String);
var CmdSTAMPPage:String;
    AbatFile:TStringList;
    OutputParam:String;
begin
  if not FileExists(MainPdf) then exit;
  if not FileExists(PathToPDF_FTK) then exit;
  ExistsDir(ExtractFilePath(PathOutput));
  OutputParam:=CheckLastSleshOnPath(PathOutput,true)+ParamOutput;
  try
      AbatFile:=TStringList.Create;
      CmdSTAMPPage:='"'+PathToPDF_FTK+'" "'+MainPdf+'" burst output "'+OutputParam+'"';
      AbatFile.Add(CmdSTAMPPage);
      AbatFile.SaveToFile(ExtractFilePath(Application.ExeName)+'Pdftk.bat');
      RunExeFileAndWait(ExtractFilePath(Application.ExeName)+'Pdftk.bat');
      sleep(100);
      DeleteFile(PAnsiChar(ExtractFilePath(PathToPDF_FTK)+'Pdftk.bat'));
    finally
      FreeAndNil(AbatFile);
    end;

end;
//******************************************************************************
 //cpdf -add-text "Page 10" -top 20pt -font "Times-Roman" -font-size 20 p010.pdf -o p010new.pdf
Procedure SetPagesToPdf(PdfPagesPath,MaskTextPage,PostText,FontName:wideString;FontSize:Integer;PathToUtil_PDF:String);
var aListFile:TStringList;
    CmdSTAMPPage:String;
    AbatFile:TStringList;
    TempNewFile:widestring;
    FileExt:widestring;
    i:integer;
    CurrText:widestring;
    IndFileName:widestring;
    CurrIndPage:Integer;
begin
  if not DirectoryExists(PdfPagesPath) then exit;
  if not FileExists(PathToUtil_PDF) then exit;
  //****************************************************
  try
    aListFile:=TStringList.Create;
    AbatFile:=TStringList.Create;
    PdfPagesPath:=CheckLastSleshOnPath(PdfPagesPath,true);
    FindFile(PdfPagesPath,aListFile,'*.pdf',1);
    //****************************************************
    for i:=0 to aListFile.Count-1 do
        begin
          TempNewFile:=ExtractFileName(aListFile.strings[i]);
          FileExt:=ExtractFileExt(TempNewFile);
          ReplaseON(TempNewFile,FileExt,'@@REPLACE_TEXT@@');
          ReplaseON(TempNewFile,'@@REPLACE_TEXT@@',FileExt);//'_tmp'

          IndFileName:=aListFile.strings[i];
          CurrIndPage:=GetIndexFromFileName(IndFileName,false);
          CurrText:=MaskTextPage;
          FormatMask(CurrText, 'n', IntToStr(CurrIndPage));
          CmdSTAMPPage:='"'+PathToUtil_PDF+'" -add-text "'+CurrText+'" '+postText+' -font '+'"'+FontName+'"'+' -font-size '+IntToStr(FontSize)+' '+
                          '"'+PdfPagesPath+aListFile.Strings[i]+'" -o "'+PdfPagesPath+TempNewFile+'"';
          AbatFile.Add(CmdSTAMPPage);
          //**********************************
        end;
    AbatFile.SaveToFile(ExtractFilePath(Application.ExeName)+'Pdftk.bat');
  finally
   FreeAndNil(AbatFile);
   aListFile.Free;
  end;
 //*****************************************

  RunExeFileAndWait(ExtractFilePath(Application.ExeName)+'Pdftk.bat');
  sleep(100);
  DeleteFile(PAnsiChar(ExtractFilePath(PathToUtil_PDF)+'Pdftk.bat'));
end;
//******************************************************************************
//function
//begin

//  SHGetFileInfo("", 0, fi, SizeOf(fi), SHGFI_SMALLICON or SHGFI_SYSICONINDEX);

//end;
//******************************************************************************
function GetFileExtAssociatedIcon(const AFileName: string; AIsSmallIcon, AIsLink: Boolean): HIcon;
var FileInfo: TSHFileInfo;
 Flags: Integer;
 SysIl : THandle;
 IconIndex : Word;
begin
  try
    FillChar(FileInfo, SizeOf(TSHFileInfo), 0);
    Flags := SHGFI_ICON or SHGFI_USEFILEATTRIBUTES or IfThen(AIsSmallIcon,SHGFI_SMALLICON) or IfThen(AIsLink, SHGFI_LINKOVERLAY);
    if ExtractFileName(AFileName) <> '' then
      SHGetFileInfo( PChar(AFileName), 0, FileInfo, SizeOf(TSHFileInfo), Flags )
    else
      FileInfo.hIcon :=CopyImage( ExtractAssociatedIcon(hInstance, PChar(AFileName) , IconIndex ), IMAGE_ICON, 16, 16, LR_COLOR);

    Result:= FileInfo.hIcon;
  except
   Result := 0;
  end;
end;
//******************************************************************************
procedure GetFileExtAssociatedIconSaveToFile( FileName,SaveToFile: string; AIsSmallIcon, AIsLink: Boolean; Width,Height:Integer);
var bmp:TPicture;
    BitMap : TBitMap;
begin
  try
    bmp := TPicture.Create;
    BitMap:= TBitMap.Create;
    bmp.Icon.Handle := GetFileExtAssociatedIcon(FileName, AIsSmallIcon, AIsLink);

    BitMap.Transparent:=true;
    BitMap.Width := Width;
    BitMap.Height:= Height;
    BitMap.Canvas.Draw(0 , 0 ,Bmp.Graphic);

    BitMap.SaveToFile( SaveToFile );
  finally
   BitMap.Free;
   bmp.Free;
  end;
end;
//******************************************************************************
procedure IconToBitmap(const Icon: TGraphic; Bitmap: TBitmap;Width,Height:Integer;SeekLeft:Integer=0;SeekTop:Integer=0);
var TempBitmap: TBitmap;
    IconInfo: TIconInfo;
begin
  Bitmap.Width:=Width;
  Bitmap.Height:=Height;
  Bitmap.PixelFormat:=pf24bit;
  Bitmap.Canvas.Draw(SeekLeft,SeekTop,Icon);
  Bitmap.Transparent:=true;
end;
//******************************************************************************
Function BitmapToIco( Bmp: TBitmap ):TIcon;
var ImageList: TImageList;
begin
  result := TIcon.Create;
  ImageList := TImageList.CreateSize(Bmp.Width, Bmp.Height);
  try
    ImageList.AddMasked(Bmp, Bmp.TransparentColor);
    ImageList.GetIcon(0, result);
  finally
    ImageList.Free;
  end;
end;
//******************************************************************************
procedure ImageListIndexToImage( Img:TImage;ImageList:TImageList;ImageIndex:integer );
var Bmp: TBitmap;
begin
  Bmp := TBitmap.Create;
  try
    ImageList.GetBitmap( ImageIndex, Bmp);
    Img.Picture.Bitmap.Assign(Bmp);
    with Bmp.Canvas do
    begin
      Brush.Color := clBtnFace;
      FillRect(ClipRect);
    end;
  finally
    Bmp.Free;
  end;
end;
//******************************************************************************
procedure ImageListIndexToSpeedButton( but:TSpeedButton;ImageList:TImageList;ImageIndex:integer );
var Bmp: TBitmap;
begin
  Bmp := TBitmap.Create;
  try
    ImageList.GetBitmap( ImageIndex, Bmp);
    but.Glyph.Assign( Bmp );
    with Bmp.Canvas do
    begin
      Brush.Color := clBtnFace;
      FillRect(ClipRect);
    end;
  finally
    Bmp.Free;
  end;
end;


function FileGraphicCheckOnSize(FileName:string;SizeW:Integer;SiseH:Integer):Boolean;
var bmp:TPicture;
begin
  try
    bmp:=TPicture.Create;
    bmp.LoadFromFile(FileName);
    result := False;
    if (SizeW =-1 )or( SizeW = bmp.Width ) then
     if ( SiseH = -1 )or( SiseH = bmp.Height ) then result := True;
  finally
   bmp.Free;
  end;
end;
//******************************************************************************
function GetIconFomApplication(aBig:Boolean) :TIcon;
var bmp:TPicture;
    BigHandleIcon:HICON;
    SmallHandleIcon:HICON;
begin
  result:=TIcon.Create;

  result.Handle  := ExtractIconEx( PChar(Application.ExeName) , 0, BigHandleIcon, SmallHandleIcon , 1);
  if aBig then
   result.Handle  := BigHandleIcon
    else result.Handle := SmallHandleIcon ;
end;
//******************************************************************************
procedure JPegToBitmap( FileName:widestring; ToBitmap:TBitmap );
var JPEG: TJPEGImage;
    Bitmap: TBitmap;
begin
  JPEG := TJPEGImage.Create;
  try
    JPEG.LoadFromFile( FileName );
    ToBitmap.Assign( JPEG );
  finally
    JPEG.Free;
  end;
end;
//******************************************************************************
procedure PngToBitmap( FileName:widestring; ToBitmap:TBitmap );
var MyPng : TdxPNGImage;
begin
  MyPng := TdxPNGImage.Create;
  try
    MyPng.LoadFromFile( FileName );
    ToBitmap.Assign( MyPng );
  finally
    MyPng.Free;
  end;

end;
{function findImageIndexByTag(ToImageList:TImageList;Tag:integer):Integer;
var i:Integer;
begin
 // for i:=0 to ToImageList.Count-1 do
 // if ToImageList.
end; }
//******************************************************************************
procedure LoadImagesToListFormPath( aPath:Widestring; ListIndex:TMyStringListIndex; mask:array of String; ToImageList:TImageList );
var i:Integer;
    CurrBmp: TBitmap;
    currFileValueTag:Widestring;
    currImageIndex:Integer;
begin
  try
    CurrBmp:=TBitmap.Create;
    for i:=0 to Length(mask)-1 do
      FindFile( aPath, ListIndex.List, mask[i],1);

    for i:=0 to ListIndex.List.Count-1 do
    begin
       currFileValueTag := ListIndex.List.Strings[i];
       ReplaseON(currFileValueTag,ExtractFileExt( ListIndex.List.Strings[i]),'' );

       if CompareText( ExtractFileExt( ListIndex.List.Strings[i]),'.jpg')=0 then JPegToBitmap(aPath+ListIndex.List.Strings[i],CurrBmp )
       else
        if CompareText( ExtractFileExt( ListIndex.List.Strings[i]),'.png')=0 then
          PngToBitmap( aPath+ListIndex.List.Strings[i], CurrBmp )
        else CurrBmp.LoadFromFile( aPath+ListIndex.List.Strings[i] );

       currImageIndex:=ToImageList.AddIcon( BitmapToIco( CurrBmp ) );
       ListIndex.Index.Add( Pointer(currImageIndex) );

    end;

  finally
    CurrBmp.Free;
  end;
end;
//******************************************************************************
function CheckExtOnGraficFile( ExtFile:String ):Boolean;
begin
  if (ExtFile = '.jpeg')or(ExtFile = '.jpg')or(ExtFile ='.bmp')or
  (ExtFile = '.pcx')or(ExtFile = '.gif')or(ExtFile = '.png') then result := true
  else result := false;
end;
//******************************************************************************
function GetMaskFilterGraphicFiles:string;
begin
  result := '(*.jpg,*.png,*.jpeg,*.gif,*.bmp,*.wmf,*.art)|*.jpg;*.png;*.jpeg;*.gif;*.bmp;*.wmf;*.art';
end;
//******************************************************************************
Function GetFileExtAssociatedIconSaveToStrem( FileName: string; AIsSmallIcon, AIsLink: Boolean; Width,Height:Integer):TMemoryStream;
var bmp:TPicture;
    BitMap : TBitMap;
    ExtFile:String;
    SeekTop:Integer;
begin
  result:= TMemoryStream.Create;
  try
    bmp:=TPicture.Create;
    BitMap:= TBitMap.Create;
    bmp.Icon.Handle := GetFileExtAssociatedIcon(FileName, AIsSmallIcon, AIsLink);
    ExtFile:= LowerCase(ExtractFileExt(FileName));

    if CheckExtOnGraficFile( ExtFile ) then
      SeekTop:=-1
    else SeekTop:=0;

    IconToBitmap( bmp.icon, BitMap, Width, Height, 0, SeekTop);
    BitMap.Transparent := True;
    BitMap.SaveToStream( result );
  finally
   BitMap.Free;
   bmp.Free;
  end;
end;
//******************************************************************************
function GetFileTypeStr(const strFilename: string): string;
var FileInfo: TSHFileInfo;
begin 
  FillChar(FileInfo, SizeOf(FileInfo), #0); 
  SHGetFileInfo(PChar(strFilename), 0, FileInfo, SizeOf(FileInfo), SHGFI_TYPENAME); 
  Result := FileInfo.szTypeName; 
end;
//******************************************************************************
Procedure MyStreamFileCopy( const sourceFileName, targetFileName: String );
var S, T: TFileStream;
Begin
 S := TFileStream.Create( sourceFileName, fmOpenRead );
 try
   T := TFileStream.Create( targetfilename, fmOpenWrite or fmCreate );
   try
     T.CopyFrom(S, S.Size ) ;
   finally
     FlushFileBuffers(T.Handle);
     T.Free;
   end;
 finally
   FlushFileBuffers(S.Handle);
   S.Free;
 end;
End;
//******************************************************************************
function MyFileExists(FileName:String):Boolean;
var Count:Integer;
Begin
  Result :=False;
  While not FileExists( FileName  ) do
  begin
    Sleep(10);
    Inc(Count);
    if Count >= 100 then Exit;         // 10 sec
  end;
  Result :=true;
end;
//******************************************************************************
function MyDeleteFile(FileName:String):Boolean;
var Count:Integer;
begin
  Result :=False;
  while FileIsLock( FileName ) do
  begin
    Sleep(100);
    Inc(Count);
    if Count >= 100 then Exit;        // 10 sec
  end;

  if not FileIsLock( FileName ) then
  begin
    DeleteFile( (FileName) );   //PAnsiChar
    if MyFileExists(FileName) then
    result:=true;
  end;
end;
//******************************************************************************
procedure MyDeleteFilesByListNames( aList:TStringList );
var i:Integer;
begin
  for i:=0 to aList.Count-1 do
  begin
    if FileExists( aList.Strings[i] ) then
      DeleteFile( aList.Strings[i] );
  end;
end;
//******************************************************************************
function GetNewIndexFileName(const aSourceFile: string; aID: Integer = 0): string;
  function CreateFileName(const aFileName: string; aId: Integer): string;
  begin  
    Result := Format('%s%s(%d)%s', [ExtractFilePath(aFileName),
      ChangeFileExt(ExtractFileName(aFileName), ''), aID,
      ExtractFileExt(aFileName)]);
  end;
begin
  Result := aSourceFile;   
  if aID > 0 then Result := CreateFileName(Result, aId);  
  if FileExists(Result) then Result := GetNewIndexFileName(aSourceFile, aId + 1)
end;
//******************************************************************************
procedure MyCopyAndUnBlockFile(FileName , CopyToPath:String);
var NewFileNameTmp: string;
    TempDir:string;
    FileNameNew:String;
    DateLastFileChange:TDateTime;

Procedure CopyFileName(FileNameFrom,FileNameTo:String);
begin
 //FileNameTo:=GetNewFileName(FileNameTo);
 MyCopyFile( FileNameFrom , FileNameTo );
end;

begin
  DateLastFileChange := GetFileDateTime(FileName);

  FileSetDate(FileName, DateTimeToFileDate(Now));
  TempDir := ExtractFilePath(Application.ExeName)+'_TempUnblockFile\';
  FileNameNew:= ExtractFileName( FileName );
  CopyToPath:=CheckLastSleshOnPath(CopyToPath,true);

  try
    ExistsDir( TempDir );
    MyCopyFile( FileName , TempDir + FileNameNew);

    NewFileNameTmp := TempDir + FileNameNew+'_';
    MyStreamFileCopy( TempDir + FileNameNew , NewFileNameTmp );

    if FileExists(NewFileNameTmp) then
    begin
     DeleteFile( PAnsiChar( TempDir + FileNameNew) );
     RenameFile( NewFileNameTmp , TempDir + FileNameNew );

     if ( FileExists( CopyToPath + FileNameNew ) ) then
     begin
       if MyDeleteFile(CopyToPath + FileNameNew) then
         CopyFileName( TempDir + FileNameNew , CopyToPath + FileNameNew )
       else exit;
     end
       else
         if (not FileExists( CopyToPath + FileNameNew )) then
           CopyFileName( TempDir + FileNameNew , CopyToPath + FileNameNew );

     if MyFileExists( CopyToPath + FileNameNew ) then
       SetDateModifiedToFile( CopyToPath + FileNameNew ,  DateLastFileChange  );
    end;
  finally
    DelDir( TempDir , '*.*' );
  end;
end;
//******************************************************************************
procedure RotateBitmap(Bitmap: TBitmap; Angle: Double; BackColor: TColor);
type TRGB = record
       B, G, R: Byte;
     end;
     pRGB = ^TRGB;
     pByteArray = ^TByteArray;
     TByteArray = array[0..32767] of Byte;
     TRectList = array [1..4] of TPoint;

var x, y, W, H, v1, v2: Integer;
    Dest, Src: pRGB;
    VertArray: array of pByteArray;
    Bmp: TBitmap;

  procedure SinCos(AngleRad: Double; var ASin, ACos: Double);
  begin
    ASin := Sin(AngleRad);
    ACos := Cos(AngleRad);
  end;

  function RotateRect(const Rect: TRect; const Center: TPoint; Angle: Double): TRectList;
  var DX, DY: Integer;
      SinAng, CosAng: Double;
    function RotPoint(PX, PY: Integer): TPoint;
    begin
      DX := PX - Center.x;
      DY := PY - Center.y;
      Result.x := Center.x + Round(DX * CosAng - DY * SinAng);
      Result.y := Center.y + Round(DX * SinAng + DY * CosAng);
    end;
  begin
    SinCos(Angle * (Pi / 180), SinAng, CosAng);
    Result[1] := RotPoint(Rect.Left, Rect.Top);
    Result[2] := RotPoint(Rect.Right, Rect.Top);
    Result[3] := RotPoint(Rect.Right, Rect.Bottom);
    Result[4] := RotPoint(Rect.Left, Rect.Bottom);
  end;

  function Min(A, B: Integer): Integer;
  begin
    if A < B then Result := A
             else Result := B;
  end;

  function Max(A, B: Integer): Integer;
  begin
    if A > B then Result := A
             else Result := B;
  end;

  function GetRLLimit(const RL: TRectList): TRect;
  begin
    Result.Left := Min(Min(RL[1].x, RL[2].x), Min(RL[3].x, RL[4].x));
    Result.Top := Min(Min(RL[1].y, RL[2].y), Min(RL[3].y, RL[4].y));
    Result.Right := Max(Max(RL[1].x, RL[2].x), Max(RL[3].x, RL[4].x));
    Result.Bottom := Max(Max(RL[1].y, RL[2].y), Max(RL[3].y, RL[4].y));
  end;

  procedure Rotate;
  var x, y, xr, yr, yp: Integer;
      ACos, ASin: Double;
      Lim: TRect;
  begin
    W := Bmp.Width;
    H := Bmp.Height;
    SinCos(-Angle * Pi/180, ASin, ACos);
    Lim := GetRLLimit(RotateRect(Rect(0, 0, Bmp.Width, Bmp.Height), Point(0, 0), Angle));
    Bitmap.Width := Lim.Right - Lim.Left;
    Bitmap.Height := Lim.Bottom - Lim.Top;
    //Bitmap.Canvas.Brush.Color := BackColor;
    Bitmap.Canvas.FillRect(Rect(0, 0, Bitmap.Width, Bitmap.Height));
    for y := 0 to Bitmap.Height - 1 do begin
      Dest := Bitmap.ScanLine[y];
      yp := y + Lim.Top;
      for x := 0 to Bitmap.Width - 1 do begin
        xr := Round(((x + Lim.Left) * ACos) - (yp * ASin));
        yr := Round(((x + Lim.Left) * ASin) + (yp * ACos));
        if (xr > -1) and (xr < W) and (yr > -1) and (yr < H) then begin
          Src := Bmp.ScanLine[yr];
          Inc(Src, xr);
          Dest^ := Src^;
        end;
        Inc(Dest);
      end;
    end;
  end;

begin
  Bitmap.PixelFormat := pf24Bit;
  Bmp := TBitmap.Create;
  try
    Bmp.Assign(Bitmap);
    W := Bitmap.Width - 1;
    H := Bitmap.Height - 1;
    if Frac(Angle) <> 0.0
      then Rotate
      else
    case Trunc(Angle) of
      -360, 0, 360, 720: Exit;
      90, 270: begin
        Bitmap.Width := H + 1;
        Bitmap.Height := W + 1;
        SetLength(VertArray, H + 1);
        v1 := 0;
        v2 := 0;
        if Angle = 90.0 then v1 := H
                        else v2 := W;
        for y := 0 to H do VertArray[y] := Bmp.ScanLine[Abs(v1 - y)];
        for x := 0 to W do begin
          Dest := Bitmap.ScanLine[x];
          for y := 0 to H do begin
            v1 := Abs(v2 - x)*3;
            with Dest^ do begin
              B := VertArray[y, v1];
              G := VertArray[y, v1+1];
              R := VertArray[y, v1+2];
            end;
            Inc(Dest);
          end;
        end
      end;
      180: begin
        for y := 0 to H do begin
          Dest := Bitmap.ScanLine[y];
          Src := Bmp.ScanLine[H - y];
          Inc(Src, W);
          for x := 0 to W do begin
            Dest^ := Src^;
            Dec(Src);
            Inc(Dest);
          end;
        end;
      end;
      else Rotate;
    end;
  finally
    Bmp.Free;
  end;
end;
//******************************************************************************
Function LoadDataFromBlobFiled( Blob: TBlobField ):TMemoryStream;
var
  ms: TMemoryStream;
begin
  ms := TMemoryStream.Create;
  try
    Blob.SaveToStream(ms);
    ms.Position := 0;
    //Bitmap.LoadFromStream(ms);
  finally
    //ms.Free;
  end;
end;
//******************************************************************************
procedure DBAddBlobFileData( DB:TDataset; fieldName, FileName:String );
var ValueStream:TMemoryStream;
begin
  if not FileExists(FileName) then exit;

  if DB.FieldByName( fieldName ).IsBlob then
  begin
    try
      ValueStream := TMemoryStream.Create;
      ValueStream.LoadFromFile( FileName );
      TBlobField(DB.FieldByName(fieldName)).LoadFromStream( ValueStream );
    finally
      ValueStream.Free;
    end;
  end;
end;
//******************************************************************************
function UrlEncode(Str: string): string;

  function CharToHex(Ch: Char): Integer;
  asm
    and eax, 0FFh
    mov ah, al
    shr al, 4
    and ah, 00fh
    cmp al, 00ah
    jl @@10
    sub al, 00ah
    add al, 041h
    jmp @@20
@@10:
    add al, 030h
@@20:
    cmp ah, 00ah
    jl @@30
    sub ah, 00ah
    add ah, 041h
    jmp @@40
@@30:
    add ah, 030h
@@40:
    shl eax, 8
    mov al, '%'
  end;

var
  i, Len: Integer;
  Ch: Char;
  N: Integer;
  P: PChar;
begin
  Result := '';
  Len := Length(Str);
  P := PChar(@N);
  for i := 1 to Len do
  begin
    Ch := Str[i];
    if Ch in ['0'..'9', 'A'..'Z', 'a'..'z', '_'] then
      Result := Result + Ch
    else
    begin
      if Ch = ' ' then
        Result := Result + '+'
      else
      begin
        N := CharToHex(Ch);
        Result := Result + P;
      end;
    end;
  end;
end;
//******************************************************************************
function UrlDecode(Str: string): string;

  function HexToChar(W: word): Char;
  asm
   cmp ah, 030h
   jl @@error
   cmp ah, 039h
   jg @@10
   sub ah, 30h
   jmp @@30
@@10:
   cmp ah, 041h
   jl @@error
   cmp ah, 046h
   jg @@20
   sub ah, 041h
   add ah, 00Ah
   jmp @@30
@@20:
   cmp ah, 061h
   jl @@error
   cmp al, 066h
   jg @@error
   sub ah, 061h
   add ah, 00Ah
@@30:
   cmp al, 030h
   jl @@error
   cmp al, 039h
   jg @@40
   sub al, 030h
   jmp @@60
@@40:
   cmp al, 041h
   jl @@error
   cmp al, 046h
   jg @@50
   sub al, 041h
   add al, 00Ah
   jmp @@60
@@50:
   cmp al, 061h
   jl @@error
   cmp al, 066h
   jg @@error
   sub al, 061h
   add al, 00Ah
@@60:
   shl al, 4
   or al, ah
   ret
@@error:
   xor al, al
 end;
//************************************   
function GetCh(P: PChar; var Ch: Char): Char;
  begin
    Ch := P^;
    Result := Ch;
  end;
//************************************
var
  P: PChar;
  Ch: Char;
begin
  Result := '';
  P := @Str[1];
  while GetCh(P, Ch) <> #0 do
  begin
    case Ch of
      '+': Result := Result + ' ';
      '%':
        begin
          Inc(P);
          Result := Result + HexToChar(PWord(P)^);
          Inc(P);
        end;
    else
      Result := Result + Ch;
    end;
    Inc(P);
  end;
end;
//******************************************************************************
function BestFitCharcters(const AInput: AnsiString): AnsiString;
const
  CodePage = 20127; //20127 = us-ascii
var
  WS: WideString;
begin
  //if not CheckCyrillicSymbol( AInput ) then
  begin
    WS := WideString(AInput);
    SetLength(Result, WideCharToMultiByte(CodePage, 0, PWideChar(WS), Length(WS), nil, 0, nil, nil));
    WideCharToMultiByte(CodePage, 0, PWideChar(WS), Length(WS), PAnsiChar(Result), Length(Result), nil, nil);
  end;
  // else result := AInput;
end;
//******************************************************************************
function CheckCyrillicSymbol(S: String): Boolean;
type
    TRusSymbol='А'..'я';
    TCyr=Set of TRusSymbol;
var Cyr:TCyr;
i:Integer;
begin
  Result:=False;
  for i:=1 to Length(S) do
  begin
    if s[i] in Cyr then
    begin
      Result:=True;
      break;
    end;
  end;
end;

function BinaryStreamToString(AStream: TMemoryStream): string;
begin
  SetLength(Result, AStream.Size * 2);
  BinToHex(AStream.Memory, PChar(Result), AStream.Size);
end;
//******************************************************************************
procedure StringToBinaryStream(const S: string; AStream: TMemoryStream);
begin
  AStream.Position := 0;
  AStream.Size := Length(S) div 2;
  HexToBin(PChar(S), AStream.Memory, AStream.Size);
end;
//******************************************************************************
procedure GetLinkInfo(lpShellLinkInfoStruct: PShellLinkInfoStruct);
var
  ShellLink: IShellLink;
  PersistFile: IPersistFile;
  AnObj: IUnknown;
begin
  // access to the two interfaces of the object
  AnObj       := CreateComObject(CLSID_ShellLink);
  ShellLink   := AnObj as IShellLink;
  PersistFile := AnObj as IPersistFile;

  // Opens the specified file and initializes an object from the file contents.
  PersistFile.Load(PWChar(WideString(lpShellLinkInfoStruct^.FullPathAndNameOfLinkFile)), 0);
  with ShellLink do
  begin
    // Retrieves the path and file name of a Shell link object.
    GetPath(lpShellLinkInfoStruct^.FullPathAndNameOfFileToExecute,
      SizeOf(lpShellLinkInfoStruct^.FullPathAndNameOfLinkFile),
      lpShellLinkInfoStruct^.FindData,
      SLGP_UNCPRIORITY);  

    // Retrieves the description string for a Shell link object.  
    GetDescription(lpShellLinkInfoStruct^.Description,  
      SizeOf(lpShellLinkInfoStruct^.Description));  

    // Retrieves the command-line arguments associated with a Shell link object.  
    GetArguments(lpShellLinkInfoStruct^.ParamStringsOfFileToExecute,  
      SizeOf(lpShellLinkInfoStruct^.ParamStringsOfFileToExecute));  

    // Retrieves the name of the working directory for a Shell link object.  
    GetWorkingDirectory(lpShellLinkInfoStruct^.FullPathAndNameOfWorkingDirectroy,  
      SizeOf(lpShellLinkInfoStruct^.FullPathAndNameOfWorkingDirectroy));  

    // Retrieves the location (path and index) of the icon for a Shell link object.  
    GetIconLocation(lpShellLinkInfoStruct^.FullPathAndNameOfFileContiningIcon,  
      SizeOf(lpShellLinkInfoStruct^.FullPathAndNameOfFileContiningIcon),  
      lpShellLinkInfoStruct^.IconIndex);  

    // Retrieves the hot key for a Shell link object.  
    GetHotKey(lpShellLinkInfoStruct^.HotKey);  

    // Retrieves the show (SW_) command for a Shell link object.  
    GetShowCmd(lpShellLinkInfoStruct^.ShowCommand);  
  end;  
end;
//******************************************************************************
function GetAttribFileLink(FileLink:String):TShellLinkInfoStruct;
begin
  FillChar(result, SizeOf(result), #0);
  StrPCopy(result.FullPathAndNameOfLinkFile,FileLink);
  GetLinkInfo(@result);
end;
//******************************************************************************
function DamerauLevenshteinDistance(const Str1, Str2: String): Integer;
 
  function Min(const A, B, C: Integer): Integer; 
  begin
    Result := A;
    if B < Result then
      Result := B;
    if C < Result then
      Result := C;
  end;
 
var
  LenStr1, LenStr2: Integer;
  I, J, T, Cost, PrevCost: Integer;
  pStr1, pStr2, S1, S2: PChar;
  D: PIntegerArray;
begin
  LenStr1 := Length(Str1);
  LenStr2 := Length(Str2);
 
  // save a bit memory by making the second index points to the shorter string
  if LenStr1 < LenStr2 then
  begin
    T := LenStr1;
    LenStr1 := LenStr2;
    LenStr2 := T;
    pStr1 := PChar(Str2);
    pStr2 := PChar(Str1);
  end
  else
  begin
    pStr1 := PChar(Str1);
    pStr2 := PChar(Str2);
  end;
 
  // bypass leading identical characters
  while (LenStr2 <> 0) and (pStr1^ = pStr2^) do
  begin
    Inc(pStr1);
    Inc(pStr2);
    Dec(LenStr1);
    Dec(LenStr2);
  end;
 
  // bypass trailing identical characters
  while (LenStr2 <> 0) and ((pStr1 + LenStr1 - 1)^ = (pStr2 + LenStr2 - 1)^) do
  begin
    Dec(LenStr1);
    Dec(LenStr2);
  end;
 
  // is the shorter string empty? so, the edit distance is length of the longer one
  if LenStr2 = 0 then
  begin
    Result := LenStr1;
    Exit;
  end;
 
  // calculate the edit distance
  GetMem(D, (LenStr2 + 1) * SizeOf(Integer));
 
  for I := 0 to LenStr2 do
    D[I] := I;
 
  S1 := pStr1;
  for I := 1 to LenStr1 do
  begin
    PrevCost := I - 1;
    Cost := I;
    S2 := pStr2;
    for J := 1 to LenStr2 do
    begin
      if (S1^ = S2^) or ((I > 1) and (J > 1) and (S1^ = (S2 - 1)^) and (S2^ = (S1 - 1)^)) then
        Cost := PrevCost
      else
        Cost := 1 + Min(Cost, PrevCost, D[J]);
      PrevCost := D[J];
      D[J] := Cost;
      Inc(S2);
    end;
    Inc(S1);
  end;
  Result := D[LenStr2];
  FreeMem(D);
end;
//******************************************************************************
function StringSimilarityRatio(const Str1, Str2: String; IgnoreCase: Boolean=true): Double;
var
  MaxLen: Integer;
  Distance: Integer;
begin
  Result := 1.0;
  if Length(Str1) > Length(Str2) then
    MaxLen := Length(Str1)
  else
    MaxLen := Length(Str2);
  if MaxLen <> 0 then
  begin
    if IgnoreCase then
      Distance := DamerauLevenshteinDistance(LowerCase(Str1), LowerCase(Str2))
    else
      Distance := DamerauLevenshteinDistance(Str1, Str2);
    Result := Result - (Distance / MaxLen);
  end;
end;
//******************************************************************************
Function SplitToWords( Str:widestring ):TStringList;
const splits : array[0..15] of string = ( ',',';',' ','!','?','-','_','+','&','^','@','#','$','*','(',')' );
var i:integer;
begin
  for i:=0 to Length(splits)-1 do
    ReplaseOn(Str,splits[i],#13#10);

  Result:=TStringList.Create;
  Result.Text := Str;
end;
//******************************************************************************
Function SplitToWordsBySpliters( Str:widestring;aSplits:array of String ):TStringList;
var i:Integer;
begin
  for i:=0 to Length(aSplits)-1 do
  ReplaseOn(Str,aSplits[i],#13#10);

  Result:=TStringList.Create;
  Result.Text := Str;
end;
//******************************************************************************
Function StringIsLike(const Str1, Str2: String;DeltaCompare:Real =0.55;CalcMaxCountWords:Boolean=true):Boolean;
var i,j:integer;
    MyWords1:TStringList;
    MyWords2:TStringList;
    CompareResult:Extended;
    CurrRes:Extended;
    MaxWord:Integer;
begin
  try
   CompareResult:=0;
   MyWords1 := SplitToWords( Str1 );
   MyWords2 := SplitToWords( Str2 );
   //*******************************************
   if not CalcMaxCountWords then
   begin
    if MyWords1.Count >= MyWords2.Count then MaxWord := MyWords2.Count
    else MaxWord := MyWords1.Count;
   end
   else
    begin
      if MyWords1.Count >= MyWords2.Count then MaxWord := MyWords1.Count
      else MaxWord := MyWords2.Count;
    end;
   //*******************************************
   for i:=0 to MyWords1.Count-1 do
   begin
     for j:=0 to MyWords2.Count-1 do
     begin
       CurrRes:= StringSimilarityRatio( MyWords1[i] , MyWords2[j] );
       if (CurrRes >= DeltaCompare) then
         CompareResult := CompareResult + 1;
     end;
   end;
   //*******************************************
   CompareResult := CompareResult / MaxWord;
   if (CompareResult>=DeltaCompare ) then result:=true
   else result:=false;
   //*******************************************
  finally
   MyWords1.Free;
   MyWords2.Free;
  end;
end;
//******************************************************************************
function CrackEaGetMail(PathToEaGetMail :Widestring=''):boolean;
var Path64:Widestring;
    Path32:Widestring;
//****************************************
procedure FixFile(Dir:Widestring);
var FileDll:Widestring;
begin
 FileDll:= Dir+'EAGetMailObj.dll';
 if DirectoryExists(Dir)and( FileExists( FileDll ) ) then
 begin
    SetDateModifiedToFile(FileDll, Now);
    result:=true;
 end;
end;
//****************************************
begin
 result:=false;
 Path64:= 'c:\Program Files (x86)\EAGetMail\';
 Path32:= 'c:\Program Files\EAGetMail\';

 FixFile(Path64);
 FixFile(Path32);
 if PathToEaGetMail<>'' then
   FixFile( PathToEaGetMail );
end;
//******************************************************************************
function GetWinDir: string;
var 
  dir: array [0..MAX_PATH] of Char; 
begin 
  GetWindowsDirectory(dir, MAX_PATH); 
  Result := StrPas(dir); 
end;
//******************************************************************************
function MyShowMessageDlg(const Msg: string; DlgType: TMsgDlgType; Buttons: TOptMessageDlgButs ):TOptMessageDlgButRes;
var WinDlgType:Cardinal;
    ButtDlg:Cardinal;
    TitleDlg:string;
    ResMessBox:Cardinal;
    MesHandle:THandle;
begin
   case  DlgType of
      mtWarning:begin WinDlgType := MB_ICONWARNING; TitleDlg:='Увага';   end;
      mtError  :begin WinDlgType := MB_ICONERROR;   TitleDlg:='Помилка'; end;
      mtInformation :begin WinDlgType := MB_ICONINFORMATION; TitleDlg:='Інформація'; end;
      mtConfirmation :begin WinDlgType := MB_ICONQUESTION;  TitleDlg:='Підтвердіть'; end;
      mtCustom  : begin WinDlgType     := MB_USERICON;      TitleDlg:='Повідомлення';end;
   end;
   //*********************************
   case Buttons of
     but_OK: ButtDlg := MB_OK;
     but_OK_CANCEL: ButtDlg:= MB_OKCANCEL;
     but_YES_NO: ButtDlg:= MB_YESNO;
     but_YES_NO_CANCEL: ButtDlg:= MB_YESNOCANCEL;
     but_RETRY_CANCEL: ButtDlg:= MB_RETRYCANCEL;
     but_ABORT_RETRY_IGNORE: ButtDlg:= MB_ABORTRETRYIGNORE;
   end;
  //**********************************
  if Screen.ActiveForm <> nil then MesHandle := Screen.ActiveForm.Handle
  else MesHandle := Application.Handle;

  ResMessBox := MessageBox( MesHandle , PChar( Msg ) , PChar( TitleDlg ), ButtDlg + WinDlgType );
  //**********************************
  case ResMessBox of
   IDOK     : result:= res_OK;
   ID_CANCEL: result:= res_CANCEL;
   ID_ABORT : result:= res_ABORT;
   ID_RETRY : result:= res_RETRY;
   ID_IGNORE: result:= res_IGNORE;
   ID_YES   : result:= res_YES;
   ID_NO    : result:= res_NO;
   ID_CLOSE : result:= res_CLOSE;
   ID_HELP : result:= res_HELP;
  end;
end;
//******************************************************************************
function GetMonthsBetween(FirstDate, LastDate: TDate): integer;
var
 Year, Year1, Month, Month1, Day, Day1: Word;
begin
 DecodeDate(FirstDate,year,month,Day);
 DecodeDate(LastDate,year1,month1,Day1);
 Result:=(year1-year)*12+month1-month;
end;
//******************************************************************************
function ParseTextBetweenMarks(ALNGText:String;Var StartIndex:Integer;KawChar:Char;KawCharEnd:Char=#0):String;
var i:integer;
    klbegin,klend:Integer;
    idText :string;
begin
 klbegin:=0;
 klend  :=0;
    for i:=StartIndex to length(ALNGText) do
        begin //1
         if ((KawCharEnd<>#0)and(ALNGText[i]=KawCharEnd)and(ALNGText[i-1]<>'\'))or((KawChar=',')and(ALNGText[i]=')')) then
            if klbegin=1 then begin klend:=1;break;end;
         //**************************************************
         if KawChar<>#0 then
         begin
           if (ALNGText[i]=KawChar)and(ALNGText[i-1]<>'\')   then
           begin //2
            if klbegin=1 then begin klend:=1;break;end;
            if klbegin=0 then klbegin:=1;
           end; //2
         end
          else
          begin //2
            klbegin:=1;
            if (ALNGText[i] in ['\','/',';',',',' ','?']) then begin klend:=1; klbegin:=0; end;
            if (i=length(ALNGText)) then klend:=1;
          end; //2

         //**************************************************
         if (klbegin =1)then
             if ((ALNGText[i]=KawChar)and(ALNGText[i-1]='\'))or((ALNGText[i]<>KawChar)) then
               idText :=idText + ALNGText[i];

         if klend = 1 then break;      
        end;//1
        
    StartIndex:=i;
    result := idText;
end;
//******************************************************************************
procedure PostKeyEx32(key: Word; const shift: TShiftState; specialkey: Boolean);
type
  TShiftKeyInfo = record
    shift: Byte;
    vkey: Byte;
  end;
  byteset = set of 0..7;
const
  shiftkeys: array [1..3] of TShiftKeyInfo =(
  (shift: Ord(ssCtrl);  vkey: VK_CONTROL),
  (shift: Ord(ssShift); vkey: VK_SHIFT),
  (shift: Ord(ssAlt);   vkey: VK_MENU) );
var
  flag: DWORD;
  bShift: ByteSet absolute shift;
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      if shiftkeys[i].shift in bShift then
       keybd_event(shiftkeys[i].vkey, MapVirtualKey(shiftkeys[i].vkey, 0), 0, 0);
  end; { For }
  if specialkey then
    flag := KEYEVENTF_EXTENDEDKEY
  else
    flag := 0;
  keybd_event(key, MapvirtualKey(key, 0), flag, 0);
  flag := flag or KEYEVENTF_KEYUP;
  keybd_event(key, MapvirtualKey(key, 0), flag, 0);
  for i := 3 downto 1 do
  begin
    if shiftkeys[i].shift in bShift then
      keybd_event(shiftkeys[i].vkey, MapVirtualKey(shiftkeys[i].vkey, 0),
      KEYEVENTF_KEYUP, 0);
  end; { For }
end;
//******************************************************************************
function OpenFileName(ForDir:String;AFilter:String):String;
var OpenDialog:TOpenDialog;
begin
  try
   OpenDialog:=TOpenDialog.Create(nil);
   OpenDialog.InitialDir:=ExistsDir(ForDir);
   OpenDialog.Filter:=AFilter;
   if OpenDialog.Execute then
   begin
     result:=OpenDialog.FileName;
   end
   else result := '^';
  finally
   FreeAndNil(OpenDialog);
  end;
end;
//******************************************************************************
function OpenGraphicFileName(ForDir:String):String;
var OpenDialog:TOpenDialog;
begin
  try
   OpenDialog:=TOpenDialog.Create(nil);
   OpenDialog.InitialDir:=ExistsDir(ForDir);
   OpenDialog.Filter:= GetMaskFilterGraphicFiles;
   if OpenDialog.Execute then
   begin
     result:=OpenDialog.FileName;
   end
   else result := '^';
  finally
   FreeAndNil(OpenDialog);
  end;
end;
//******************************************************************************
Function ShowDialogColor(ACurrentColor:TColor):TColor;
var  EDColorDialog : TColorDialog;
     AColor:TColor;
begin
  EDColorDialog:=TColorDialog.Create(nil);
  EDColorDialog.Color:=ACurrentColor;
  if EDColorDialog.Execute then
    Result := EDColorDialog.Color
  else result := -1;  
end;
//******************************************************************************
function ColorToHtml(DelphiColor:TColor):string;
var
   tmpRGB : TColorRef;
begin
   tmpRGB := ColorToRGB(DelphiColor);
   Result:=Format( '#%.2x%.2x%.2x',
                   [GetRValue(tmpRGB),
                    GetGValue(tmpRGB),
                    GetBValue(tmpRGB)]);
end;
//******************************************************************************
function RGBtoHTMLColor(cl: TColor; ResultType: Word): string;
var codeColor: String[6];
begin
  codeColor := ColorToHtml(cl);

  case ResultType of
    1: Result := 'color="' + codeColor + '"';
    2: Result := 'bgcolor="' + codeColor + '"';
    3: Result := '' + codeColor;
  end;
end;
//******************************************************************************
function HtmlToColor(Color: string): TColor;
begin
 Result := StringToColor('$' + Copy(Color, 6, 2) + Copy(Color, 4, 2) + Copy(Color, 2, 2));
end;
//******************************************************************************
Function ChechInPartWord(MainStr,KeyWord:String;FromIndex:Integer):Boolean;
begin
  result:= CompareText( LowerCase(Copy(MainStr,FromIndex,Length(KeyWord))), LowerCase(KeyWord) )=0;
end;
//******************************************************************************
Function ChechInPartWordArr(MainStr:string; KeyWords:array of String;FromIndex:Integer):Boolean;
var i:Integer;
begin
  result:=False;
  for i:=0 to Length(KeyWords)-1 do
    if ChechInPartWord(MainStr,KeyWords[i],FromIndex) then
    begin
      result:=True;
      break;
    end;
end;
//******************************************************************************
Function ReadParam(AHtmlKod:String;KeyWord:String;KawChar:Char='"'):String;
var IndexBegin:Integer;
    i:integer;
    CopyAHtmlKod:String;
begin
  result:='';

  CopyAHtmlKod :=LowerCase(AHtmlKod);
  for i:= Length(CopyAHtmlKod)-1 downto 0 do
    if Copy(CopyAHtmlKod,i,Length(KeyWord))=LowerCase(KeyWord) then
       begin
        IndexBegin:= i+ length(KeyWord);
        break;
       end;
 if IndexBegin<>0 then
   result :=ParseTextBetweenMarks(AHtmlKod,IndexBegin, KawChar);
end;
//******************************************************************************
function GetIdYoutubeUrl(url:Widestring):WideString;
const VKey ='/v/';
      EmbedKey ='/embed/';
var PosStart:Integer;
begin
  PosStart:= AnsiPos( EmbedKey ,url);

  if (PosStart = 0)and(AnsiPos('?v=',url) <> 0) then
     result:= ReadParam(url, 'v=',#0)
  else
   if (PosStart = 0)and(AnsiPos( VKey, url ) <> 0) then
   begin
     PosStart:=AnsiPos( VKey, url );
     PosStart:= PosStart + Length(VKey);
     result:=ParseTextBetweenMarks(url, PosStart, #0);
   end
   else
   if PosStart <> 0 then
   begin
     PosStart:= PosStart + Length(EmbedKey);
     result:=ParseTextBetweenMarks(url, PosStart, #0);
   end;

end;
//******************************************************************************
function ParseUrlWithoutParam(url:Widestring):WideString;
var PosStart:Integer;
begin
  PosStart:= AnsiPos( '?', url );
  if PosStart<>0 then
    result:=Copy(url,1,PosStart-1)
  else  result := url;
end;
//******************************************************************************
procedure FillDataCheckBox(CheckComboBox:TcxCheckComboBox;AListData:TStringList);
var i:integer;
    CurrItem:TcxCheckComboBoxItem;
begin
 for i:=0 to AListData.Count-1 do
 begin
   CurrItem:=CheckComboBox.Properties.Items.Add;
   CurrItem.Index:=i;
   CurrItem.Description:=AListData.Strings[i];
 end;
end;
//******************************************************************************
function CheckDataInSelectCheckBox( CheckComboBox:TcxCheckComboBox;aText:String ):boolean;
var i:integer;
    AStates: TcxCheckStates;
begin
  result:=false;
  CalculateCheckStates(  CheckComboBox.EditValue , CheckComboBox.Properties.Items, cvfInteger, AStates);

  for i:=0 to CheckComboBox.Properties.Items.Count-1 do
  begin
    if CompareText ( CheckComboBox.Properties.Items[i].Description , aText ) =0 then
    begin
      result:= AStates[i] = cbsChecked;
      Break;
    end;
  end;
end;
//******************************************************************************
Function ConvertFileToBase64(FileName:String;ForHtml:Boolean=false):Widestring;
var
  Fs : TFileStream;
  S : AnsiString;
  ExtFile:WideString;
begin
  if not FileExists(FileName) then Exit;

  Fs := TFileStream.Create(FileName, fmOpenRead + fmShareDenyWrite);
  try
    SetLength(S, Fs.Size);
    Fs.Read(S[1], Fs.Size);
  finally
    FreeAndNil(Fs);
  end;
 
  result := EncodeString(S);
  if ForHtml then
  begin
   ExtFile:=ExtractFileExt(FileName);
   replaseOn( ExtFile, '.','');
   result:= 'data:image/'+ ExtFile+';base64,'+result;
  end;
end;
//******************************************************************************
procedure ConvertBase64ToFile( CodeStrBase64:Widestring; SaveToFileName:String);
var
  Fs : TFileStream;
  S : AnsiString;
begin
  Fs := TFileStream.Create(SaveToFileName, fmCreate);
  S := DecodeString( Trim(CodeStrBase64) );
  try
    Fs.Write(S[1], Length(S));
  finally
    FreeAndNil(Fs);
  end;
end;
//******************************************************************************
function CalculateHeightControlForText(aControl:TWinControl;aText:Widestring;DeltaW:Integer):Integer;
var ACanvas : TControlCanvas;
begin
  ACanvas := TControlCanvas.Create;
  TControlCanvas(ACanvas).Control := aControl;
  result := ACanvas.TextHeight(aText)* Ceil( (ACanvas.TextWidth(aText)+DeltaW) / aControl.Width ) + 2;
end;
//******************************************************************************
Function CalculatePosText( Canvas:TCanvas; Text:String;Rect:TRect;aLignHor:TAlignment; aLignVert:TcxAlignmentVert ):TPoint;
begin
  if aLignHor = taLeftJustify then  result.X:= Rect.Left ;
  if aLignHor = taCenter then result.X:= Rect.Left + ((Rect.Right - Rect.Left) div 2) - Canvas.TextWidth( Text ) div 2;
  if aLignHor = taRightJustify then  result.X:= Rect.Right - Canvas.TextWidth( Text )  ;

  if aLignVert= vaCenter then result.Y:= Rect.Top + ((Rect.Bottom - Rect.Top) div 2) - Canvas.TextHeight( Text ) div 2;
  if aLignVert= vaTop then result.Y:= Rect.Top;// + Canvas.TextHeight( Text ) div 2;
  if aLignVert= vaBottom then result.Y:= Rect.Bottom - Canvas.TextHeight( Text );
end;
//******************************************************************************
procedure PostEditValue(Parent:TControl);
var i:integer;
begin
  for i:=0 to Parent.ComponentCount -1 do
  begin
    if Parent.Components[i] is TcxCustomEdit then
    begin
      TcxCustomEdit(Parent.Components[i]).EditModified:=true;
      TcxCustomEdit(Parent.Components[i]).PostEditValue;
    end;
  end;
end;
//******************************************************************************
function ValidateValueControl( control:TControl; MessError:widestring; NotNol:Boolean=false ):boolean;
begin
 result := true;
 if (control is TcxCustomEdit) then
 begin
   TcxCustomEdit(control).EditModified:=true;
   TcxCustomEdit(control).PostEditValue;
   if ((TcxCustomEdit(control).EditValue = null)or(TcxCustomEdit(control).GetTextLen = 0)) or
      ( (NotNol)and (TcxCustomEdit(control).EditValue = 0 ) ) then
   begin
     MyShowMessageDlg(MessError, mtError, but_OK );
     if TcxCustomEdit(control).Enabled then
       TcxCustomEdit(control).SetFocus;
     result := false;
   end;
 end;
end;
//******************************************************************************
function GenGuid: String;
var id:TGUID;
begin
 if CoCreateGuid(Id) = s_OK then
    result := GUIDToString (Id)
     else result:='';
end;
//******************************************************************************
procedure PositionFormCenter( aForm:TForm; offsetX, offsetY:Integer );
begin
  aForm.Position := poDesigned;

  aForm.Left:= ( Screen.Width div 2 ) - ( aForm.Width div 2 ) + offsetX;
  aForm.Top:= ( Screen.Height div 2 ) - ( aForm.Height div 2 ) + offsetY;
end;
//******************************************************************************
procedure PositionFormCenterFromMainForm( aForm:TForm; offsetX:Integer = 0; offsetY:Integer = 0 );
begin
  if Screen.ActiveForm <>nil then
  begin
    if Screen.ActiveForm.Width >= aForm.Width then
      aForm.Left := ( Screen.ActiveForm.Left + ( Screen.ActiveForm.Width div 2 ) - ( aForm.Width div 2 ) ) + offsetX
    else aForm.Left := ( Screen.ActiveForm.Monitor.Left + ( Screen.ActiveForm.Monitor.Width div 2 ) - ( aForm.Width div 2 ) ) + offsetX;

    if Screen.ActiveForm.Height >= aForm.Height then
      aForm.Top :=  ( Screen.ActiveForm.Top + ( Screen.ActiveForm.Height div 2 ) - ( aForm.Height div 2 ) ) + offsetY
    else aForm.Top := ( Screen.ActiveForm.Monitor.Top + ( Screen.ActiveForm.Monitor.Height div 2 ) - ( aForm.Height div 2 ) ) + offsetY;
  end;
end;
//******************************************************************************
procedure CreateDayWeekOnCheckListBox( ChListBox:TcxCheckListBox; MasDay:array of String );
var i:integer;
    Item:TcxCheckListBoxItem;
begin
  ChListBox.Items.Clear;
  for i:=0 to Length(MasDay)-1 do
  begin
    Item := ChListBox.Items.Add;
    Item.Text := MasDay[i];
  end;

end;
//******************************************************************************
procedure CreateDayWeekOnColumnCombobox( ChComboColumn:TcxCheckComboBoxProperties; MasDay:array of String );
var i:integer;
    Item:TcxCheckComboBoxItem;
begin
  ChComboColumn.Items.Clear;
  for i:=0 to Length(MasDay)-1 do
  begin
    Item := ChComboColumn.Items.Add;
    Item.Description := MasDay[i];
  end;

end;
//******************************************************************************
procedure CreateMonthWeekOnCheckListBox( CmbImage:TcxImageCombobox; MasMonth:array of String );
var i:integer;
    MonthList:TStringList;
begin
  try
    MonthList:=TStringList.Create;
    for i:=0 to Length(MasMonth)-1 do
      MonthList.Add( MasMonth[i] );


    if CmbImage is TcxImageCombobox then FormingImageComboBox( CmbImage,MonthList );
    //if CmbImage is TcxDBTreeListColumn then FormingImageComboboxTreeColumn( CmbImage,MonthList );

    //Procedure FormingImageComboboxTreeColumn(Column:TcxDBTreeListColumn;AlistData,AListDataValue:TStringList;UseDescriptAsValue:Boolean=false);
  finally
    MonthList.Free;
  end;
end;
//******************************************************************************
procedure CreateDayByMonthOnImageListBox( CmbImage:TcxImageCombobox; Month:Integer );
var i:integer;
    DayList:TStringList;
    CountDays:Integer;
begin
   CountDays := DaysInAMonth( YearOf(Now), Month);
   if Month = 2 then CountDays := 29;

   try
     DayList:=TStringList.Create;
     for i:=0 to CountDays-1 do
       DayList.Add( IntToStr( i +1 ) );

     FormingImageComboBox( CmbImage, DayList, True );
   finally
     DayList.Free;
   end;
end;
//******************************************************************************
procedure SetEnabledControlsOnFrom(aForm:TWinControl;En:Boolean);
var i:integer;
begin
  for i:=0 to aForm.ComponentCount-1 do
    if aForm.Components[i] is TControl then TControl(aForm.Components[i]).Enabled :=En;
end;
//******************************************************************************
procedure SetEnabledControlsOnFromByClassName( aForm:TWinControl; ClassName:TClass; En:Boolean );
var i:integer;
begin
  for i:=0 to aForm.ComponentCount-1 do
    if ( aForm.Components[i] is TControl ) and
       ( aForm.Components[i] is ClassName ) then TControl(aForm.Components[i]).Enabled :=  En;
end;
//******************************************************************************
function CheckOnClassName(aCurrControl:TWinControl; AcceptClassName:array of TClass):Boolean;
var i:integer;
begin
  Result := false;
  for i:=0 to Length(AcceptClassName)-1 do
  if aCurrControl is AcceptClassName[i] then
  begin
    result:=True;
    Break;
  end;
end;
//*********************************************************
procedure SetEnabledChildControls( aParent:TWinControl; En:Boolean; AcceptControls:array of TWinControl; AcceptClassName:array of TClass );
var i:Integer;
Function FindControl(aCurrControl:TWinControl):Boolean;
var i:integer;
begin
  Result := false;
  for i:=0 to Length(AcceptControls)-1 do
  if AcceptControls[i] = aCurrControl then
  begin
    result:=True;
    Break;
  end;
end;
//*********************************************************
begin
  for i:=0 to aParent.ComponentCount-1 do
  begin
    if aParent.Components[i] is TWinControl then
    begin
      if ( not FindControl( TWinControl(aParent.Components[i]) )) and
         ( not CheckOnClassName( TWinControl(aParent.Components[i]), AcceptClassName ) ) then TWinControl(aParent.Components[i]).Enabled:=En;
    end;

  end;
end;
//******************************************************************************
function Ping(Host: string; TimeOut:Integer=5000 ): boolean;
var
  hIP: THandle;
  pingBuffer: array[0..31] of Char;
  pIpe: ^icmp_echo_reply;
  pHostEn: PHostEnt;
  wVersionRequested: WORD;
  lwsaData: WSAData;
  error: DWORD;
  destAddress: In_Addr;
begin
  // Создаем handle
  Application.ProcessMessages;
  hIP := IcmpCreateFile();
  GetMem(pIpe, sizeof(icmp_echo_reply) + sizeof(pingBuffer));
  try
    pIpe.Data := @pingBuffer;
    pIpe.DataSize := sizeof(pingBuffer);
    wVersionRequested := MakeWord(1, 1);
    error := WSAStartup( wVersionRequested, lwsaData );
    if (error <> 0) then
    begin
      Application.ProcessMessages;
      Result := False;
      Exit;
    end;
    pHostEn := gethostbyname( PAnsiChar(Host) );
    error := GetLastError();
    if (error <> 0) then
    begin
      Application.ProcessMessages;
      Result := False;
      Exit;
    end;

    Application.ProcessMessages;
    destAddress := PInAddr(pHostEn^.h_addr_list^)^;
    // Посылаем ping-пакет
    IcmpSendEcho(hIP,
      destAddress.S_addr,
      @pingBuffer,
      sizeof(pingBuffer),
      nil,
      pIpe,
      sizeof(icmp_echo_reply) + sizeof(pingBuffer), TimeOut );
    error := GetLastError();
    if (error <> 0) then
    begin
      Result := False;
      Exit;
    end;
    // Смотрим некоторые из вернувшихся данных
    Result := True;
  finally
    IcmpCloseHandle(hIP);
    WSACleanup();
    FreeMem(pIpe);

  end;
end;


function TranslitRusToLat( s:Widestring ):Widestring;
const
  rus: Widestring = 'абвгдеёжзийклмнопрстуфхцчшщьыъэюя';
  lat: array[1..33] of Widestring = ('a', 'b', 'v', 'g', 'd', 'e', 'yo', 'zh', 'z', 'i', 'y', 'k',
  'l', 'm', 'n', 'o', 'p', 'r', 's', 't', 'u', 'f', 'h', 'ts', 'ch', 'sh', 'shch',
  '''', 'y', '''', 'e', 'yu', 'ya');

var p, i: integer;
 begin
   s := widelowercase(s);
   Result := '';
   for i := 1 to Length(s) do
   begin
     p := Pos(s[i], rus);
     if p<1 then
       Result := Result + s[i]
     else
      Result := Result  + lat[p];
   end;
 end;

function TranslitUkrToLat( s:Widestring ):Widestring;
const
  ukr: string = 'абвгґдеєжзиіїйклмнопрстуфхцчшщьюя';
  latFirst: array[1..33] of Widestring = ('a', 'b', 'v', 'h','g', 'd', 'e', 'ie', 'zh', 'z',
                                      'i', 'i','yі','y','k','l', 'm', 'n', 'o', 'p','r',
                                      's', 't', 'u', 'f', 'h', 'ts', 'ch', 'sh', 'shch', '''', 'yu', 'ya');

  lat: array[1..33] of Widestring = ('a', 'b', 'v', 'h','g', 'd', 'e', 'ie', 'zh', 'z',
                                 'i', 'i','і','і','k','l', 'm', 'n', 'o', 'p','r',
                                 's', 't', 'u', 'f', 'h', 'ts', 'ch', 'sh', 'shch', '''', 'іu', 'іa');

var p, i: integer;
begin
   s := widelowercase(s);
   Result := '';
   for i := 1 to Length(s) do
   begin
     p := Pos( s[i], ukr);
     if p < 1 then
       Result := Result + s[i]
     else
     begin
       if i = 1 then Result := Result  + latFirst[p]
       else
          Result := Result  + lat[p];
     end;
   end;
end;

function TranslitRusToUkr( s:Widestring ):Widestring;
const
  rus:  string ='ёыъэеи';
  ukr:  string ='єи еєі';
var p, i: integer;
begin
   s := widelowercase(s);
   Result := '';
   for i := 1 to Length(s) do
   begin
     p := Pos( s[i], Rus);
     if p < 1 then
       Result := Result + s[i]
     else
     begin
       if i = 1 then Result := Result  + ukr[p]
       else
          Result := Result  + ukr[p];
     end;
   end;
end;

function TranslitUkrToRus( s:Widestring ):Widestring;
const
  rus:  string ='ёыэеие';
  ukr:  string ='єиеєії';
var p, i: integer;
begin
   s := widelowercase(s);
   Result := '';
   for i := 1 to Length(s) do
   begin
     p := Pos( s[i], ukr);
     if p < 1 then
       Result := Result + s[i]
     else
     begin
       if i = 1 then Result := Result  + rus[p]
       else
          Result := Result  + rus[p];
     end;
   end;
end;


function TranslitLatToUkr( s:Widestring ):Widestring;
const
  ukr: array[1..60] of Widestring = ('а','б','в','в','г','г','дж','дж','д','е','є','ж','з',
                                    'и','і','ї','и','к','л','м','н','о','п','р','к', 'с','т','у',
                                    'ф','х','ц','ч','ш','щ','ю','я','ю','ія','ю','ж','вськ','цьк','тсь','ськ','льс','льск','рськ','нськ','зьк','х','гі','дж','йе',
                                    'йо','ші','чі','ксті','ксті','джі','ї' );

  lat: array[1..60] of Widestring = ('a', 'b', 'v', 'w', 'h','g', 'q', 'j', 'd', 'e', 'ie', 'zh', 'z',
                                     'i', 'i','yі','y','k','l', 'm', 'n', 'o', 'p','r', 'c',
                                     's', 't', 'u', 'f', 'h', 'ts', 'ch', 'sh', 'shch',  'yu', 'ya',  'iu', 'ia',
                                     'ju','zh','vsk','tsk','ts''','s''k','l''s','lsk','rsk','nsk','z''k','kh','hi','ge','ye','yo','shi','chi','xthi','xthhi','dji','yi' ) ;
var p, i: integer;
begin
   s := Lowercase(s);
   Result := s;
                      
   ReplaseOn(s,'`','''');
   ReplaseOn(s,'''''','@Replace@');
   ReplaseOn(s,'@Replace@','''');
   
   for i:=Length( lat ) downto 1  do
     ReplaseOn(s,lat[i],ukr[i]);

   replaseON(s,'''','ь');
   result:=s;        
end;

function TranslitLatToRus( s:Widestring ):Widestring;
const
  rus: array[1..57] of Widestring = ('а','б','в','в','г','дж','дж','д','е','ё','ж','з','и','й','к','л','м','н',
                    'о','п','р','к','с','т','у','ф','х','ц','ч','ш','щ','ы','э','ю','я','ю','ж','вськ','цьк','тсь','ськ','льс','льск','рськ',
                    'нськ','зьк','х','ги','дж','йе','йо','ши','чи','ксти','ксти','джи','и'  );

  lat: array[1..57] of Widestring = ('a', 'b', 'v', 'w', 'g','q', 'j', 'd', 'e', 'yo', 'zh', 'z', 'i', 'y', 'k',
                                    'l', 'm', 'n', 'o', 'p', 'r', 'c', 's', 't', 'u', 'f', 'h', 'ts', 'ch', 'sh', 'shch',  'y',  'e', 'yu', 'ya','ju',
                                    'zh','vsk','tsk','ts''','s''k','l''s','lsk','rsk','nsk','z''k','kh','hi','ge','ye','yo','shi','chi','xthi','xthhi','dji','yi'   );
var p, i: integer;
begin
   s := Lowercase(s);
   Result := s;

   ReplaseOn(s,'`','''');
   ReplaseOn(s,'''''','@Replace@');
   ReplaseOn(s,'@Replace@','''');

   for i:=Length( lat ) downto 1  do
     ReplaseOn(s,lat[i],rus[i]);

   replaseON(s,'''','ь');
   result:=s;
end;

Function AllWordsInUpFirstChar(aStr:Widestring):Widestring;
var i:integer;
    aListWord:TStringList;
begin
   aListWord := ParseTextToList(aStr,[',',';',' ','!','?','-','_','+','&','^','@','#','$','*','(',')'],True);

   if aListWord.Count<>0 then result:=''
   else result:=aStr;
   
   for i:=0 to aListWord.Count-1 do
     result := result + UpFirstChar(aListWord[i]);
end;
//******************************************************************************
Procedure TestIBDatasetOnDataForm(aOwner:TComponent;SaveProblemToFile:String; Progress:TProgressBar );
var i:integer;
    LogError:TStringList;
procedure SetTestValueForIBQuery(aQry : TIBQuery);
var i:integer;
begin
  for i:=0 to aQry.ParamCount-1 do
  begin
    if aQry.Params[i].DataType in[ftUnknown, ftInteger,ftSmallint, ftLargeint,ftCurrency,ftAutoInc,ftDateTime,ftBytes] then
      aQry.Params[i].Value := Random(10);

    if aQry.Params[i].DataType in[ftString,ftWideString ] then aQry.Params[i].Value :='Test';
  end;
end;
//***********************************************
begin
 try
   ExistsDir( ExtractFilePath(SaveProblemToFile) );

   LogError := TStringList.Create;
   if Progress<>nil then Progress.Max :=aOwner.ComponentCount;
   
   for i:=0 to aOwner.ComponentCount -1 do
   begin
     if ( aOwner.Components[i] is TIBQuery ) or ( aOwner.Components[i] is TIBTable ) then
     begin
       //if aOwner.Components[i].Name = 'OfficeQry' then ShowMessage('dddd');

       //{if ( aOwner.Components[i] is TIBQuery ) then SetTestValueForIBQuery( TIBQuery(aOwner.Components[i]) );
       if (TDataset(aOwner.Components[i]).DataSource <> nil)and
          ( CompareText( TDataset(aOwner.Components[i]).DataSource.Name , 'CompCntryQry')=0 ) then
         LogError.Add( (aOwner.Components[i]).Name );

       try
         if ( aOwner.Components[i] is TIBTable ) or ( ( aOwner.Components[i] is TIBQuery ) and ( Trim( TIBQuery( aOwner.Components[i]).SQL.Text)<>'' ) ) then
           if  not TDataSet(aOwner.Components[i]).Active then TDataSet(aOwner.Components[i]).Open;
       except
         ShowMessage( aOwner.Components[i].Name );
         LogError.Add( (aOwner.Components[i]).Name );
       end;

     end;

     if Progress<>nil then
       Progress.Position := Progress.Position + 1;
       
   end;
 finally
   if LogError.Count > 0 then LogError.SaveToFile( SaveProblemToFile );
   LogError.Free;
 end;

end;
//******************************************************************************
function FoldTwoIntToInt( first, Sec:Integer ): Integer;
begin
 result:= first + (Sec shl 16);
end;
//******************************************************************************
function GetTwoIntFromFoldInt( value: Integer): TPoint;
begin
 result.X := value and $FFFF;
 result.Y := (value shr 16) and $FFFF;
end;
//******************************************************************************
procedure ChangeKeyBoardLayout( klOption:TOptKeyboardLayout = klUkrainian );
var pcKeyboard:PAnsiChar;
    lang: HKL;
begin
  if klOption = klEnglish then pcKeyboard := '00000409';
  if klOption = klRussian then pcKeyboard := '00000419';
  if klOption = klUkrainian then pcKeyboard := '00000422';

  //lang := LoadKeyboardLayout( pcKeyboard, 0);
  //SetActiveKeyboardLayout( lang );
  LoadKeyboardLayout( pcKeyboard, KLF_ACTIVATE);
end;
//******************************************************************************
function FindFormByCaption(Caption:TCaption):TForm;
var i:Integer;
  Form: TForm;
begin
  result := nil;
  for i:=0 to Application.ComponentCount-1 do
  begin
    if (Application.Components[i] is TForm) and
       ( not(csDestroying in TForm(Application.Components[i]).ComponentState  ) ) and 
       (CompareText( TForm( Application.Components[i]).Caption , Caption )=0 ) then
    begin
      result:= TForm( Application.Components[i]);
      Break;
    end;
  end;
end;
//******************************************************************************
function FindFormByCaptionAndRestoreOnTop( aFormCaption:Widestring ):TForm;
begin
  result := FindFormByCaption( aFormCaption );

  if (result <> nil )and(Assigned(result)) then
  begin
    FormFocus(result.Handle, SW_RESTORE );
    //TFrmEditDict(aFrmEditDict).FCurrManager := CurrManager;

    result.FormStyle:= fsStayOnTop;
    result.FormStyle:= fsNormal;

    if not result.Showing then result.Show;

    Exit;
  end;
end;
//******************************************************************************
function GetFormForComponent( aComponent:TComponent ):TForm;
begin
  result := nil;

  if aComponent =  nil then exit;
  if aComponent.Owner = nil then exit;

  if aComponent.Owner is TForm then result :=TForm(aComponent.Owner)
  else
  if aComponent.Owner is TFrame then result:= GetFormForComponent( aComponent.Owner );
end;
//******************************************************************************
function FindDatasourceByDatasetFoComp( aCom:TComponent; aDataset:TDataset ):TDataSource;
var j:Integer;
begin
  result := nil;
  for j:=0 to aCom.ComponentCount-1 do
  begin
    if ( aCom.Components[j] is TDataSource ) and
       ( TDataSource( aCom.Components[j] ).DataSet = aDataset ) then
    begin
      result := TDataSource( aCom.Components[j] );
      Break;
    end;
  end;
end;
//******************************************************************************
function FindDatasourceByDataset(aDataset:TDataset):TDataSource;
var i,j:Integer;
begin
  result:= nil;
  result := FindDatasourceByDatasetFoComp( aDataset.Owner, aDataset );
  if result <> nil then exit;
  
  for i:=0 to Application.ComponentCount-1 do
  begin
    result := FindDatasourceByDatasetFoComp( Application.Components[i], aDataset );
    if result <> nil then exit;
  end;
end;
//******************************************************************************
procedure WebBrowserBlank(WB:TWebBrowser);
begin
  if WB = nil then Exit;

  WB.Navigate('about:blank');
  while WB.ReadyState < READYSTATE_INTERACTIVE do Application.ProcessMessages;
end;
//******************************************************************************
function WebBrowserGetHTMLCode(WebBrowser: TWebBrowser; ACode: TStrings): Boolean;
var
  ps: IPersistStreamInit;
  ss: TStringStream;
  sa: IStream;
begin
  ps := WebBrowser.Document as IPersistStreamInit;
  ss := TStringStream.Create('');
  try
    sa := TStreamAdapter.Create( ss, soReference ) as IStream;
    Result := Succeeded(ps.Save( sa, True ));
    if Result then ACode.Text := ss.DataString;
  finally
    ss.Free;
  end;
end;
//******************************************************************************
procedure WebBrowserSetHTMLCode( WebBrowser: TWebBrowser; HTMLCode: string );
var
  sl: TStringList;
  ms: TMemoryStream;
begin
  if WebBrowser = nil then Exit;
  WebBrowserBlank(WebBrowser);
  //***********************************
  if Assigned(WebBrowser.Document) then
  begin
    sl := TStringList.Create;
    try
      ms := TMemoryStream.Create;
      try
        sl.Text := HTMLCode;
        sl.SaveToStream(ms);
        ms.Seek( 0, 0 );
        (WebBrowser.Document as IPersistStreamInit).Load(TStreamAdapter.Create(ms));
      finally
        ms.Free;
      end;
    finally
      sl.Free;
    end;
  end;
  //***********************************
  while WebBrowser.ReadyState < READYSTATE_INTERACTIVE do Application.ProcessMessages;
  while WebBrowser.OleObject.Document.body.innerHTML='' do Application.ProcessMessages;
end;
//******************************************************************************
function GetCommonPartFromPaths( aPath1:Widestring; aPath2:Widestring ) : Widestring;
var i:Integer;
begin
   result :='';
   for i:=1 to Length( aPath1 ) do
   begin

     if ( Char(aPath1[i] ) in ['\','/'] ) then
     begin
       if CompareText( Copy(aPath1,1,i) , Copy(aPath2,1,i) ) = 0 then
         result:= Copy(aPath1,1,i)
       else
         Break;
     end;

   end;

end;
//******************************************************************************
function PreparePathToWebPath(aPath:Widestring):Widestring;
begin
  ReplaseON(aPath,'\','$SLESH&');
  ReplaseON(aPath,'$SLESH&','\\');

  ReplaseON(aPath,'/','$ASLESH&');
  ReplaseON(aPath,'$ASLESH&','//');
  
  result := aPath;
end;
//******************************************************************************
function PrpareBlockContentToPrefixPathShow( HtmlContent , PathPrefix :String; aColorBGBrowser:string='' ) : TStringList;
var StyleColor:string;
begin
  if aColorBGBrowser<>'' then
    StyleColor:= 'style=" background-color:'+aColorBGBrowser+'; "'
  else StyleColor :='';

  result := TStringList.Create;
  result.Add('<HTML>');
  result.Add('<HEAD>');
  result.Add('<script>');
  result.Add('function prepareSourcePath( TagName,TagChildName, AttrName )');
  result.Add('{');
  result.Add('var PrefixPath = "' + PathPrefix + '";');
  result.Add('var Elements = document.getElementsByTagName( TagName );');
  result.Add('for ( var i=0; i<=Elements.length-1; i++ ){');
  result.Add(' var Element = Elements.item(i); ');
  result.Add(' var value = Element.getAttribute(AttrName);');
  result.Add(' if (value!=null && value!="") Element.setAttribute( AttrName, PrefixPath + value ); ');

  result.Add(' if (TagChildName !="") { ');
  result.Add(' var ElementChilds = Element.getElementsByTagName(TagChildName);');
  result.Add(' for ( var j=0; j<=ElementChilds.length-1; j++ ) {');
  result.Add('    var ElementChild = ElementChilds.item(j); ');
  result.Add('    var valueChild = ElementChild.getAttribute(AttrName); ');
  result.Add(' if (valueChild!=null && valueChild!="") ElementChild.setAttribute( AttrName, PrefixPath + valueChild ); ');
  result.Add('   } ');
  result.Add('  } ');
  result.Add(' } ');
  result.Add('} ');

  result.Add('function PrepareAllPath() ');
  result.Add('{ ');
  result.Add(' prepareSourcePath( "IMG","","src" ); ');
  result.Add(' prepareSourcePath( "TABLE", "TD", "background" );');
  result.Add(' prepareSourcePath( "OBJECT", "", "data" ); ');
  result.Add(' prepareSourcePath( "OBJECT", "VIDEO", "src" );');
  result.Add('} ');
  result.Add('</script> ');
  result.Add('</HEAD> ');
  result.Add('<BODY '+StyleColor+' onload="PrepareAllPath()" > ');

  result.Add( HtmlContent );

  result.Add( '</BODY>' );
  result.Add( '</HTML>' );
end;
//******************************************************************************
function PrpareBlockFileContentToPrefixPathShow( ContentFileName , PathPrefix :String; aColorBGBrowser:string=''  ) : TStringList;
var aHtmlContent:TStringList;
begin
  try
    result := TStringList.Create;

    aHtmlContent := TStringList.Create;
    if FileExists(ContentFileName) then
      aHtmlContent.LoadFromFile( ContentFileName  );

    result := PrpareBlockContentToPrefixPathShow( aHtmlContent.Text , PathPrefix, aColorBGBrowser );

  finally
    aHtmlContent.Free;
  end;
end;
//******************************************************************************
function GetArrPathsFromWebBrowser( WebBrowser: TWebBrowser; TagName, TagChildName, AttrName : string  ):TStringList;
var i,j:integer;
    AttrValue:Variant;
    AttrChildValue:Variant;
    CurrElem:Variant;
    ElemChilds:Variant;
    CurElemChild:Variant;
//***********************************************
procedure AddAttrValue(aValue:Variant);
var CurrAttrValue:Widestring;
begin
   CurrAttrValue:= VarToStr(aValue);
   ReplaseOn(CurrAttrValue,'about:','');
   result.Add( CurrAttrValue );
end;
//***********************************************
begin
  result := TStringList.Create;

  for i:=0 to WebBrowser.OleObject.Document.body.getElementsByTagName('*').length-1 do
  begin
    CurrElem := WebBrowser.OleObject.Document.body.getElementsByTagName('*').item(i);
    if CompareText( CurrElem.tagName , TagName)=0 then
    begin

      AttrValue := CurrElem.getAttribute(AttrName);
      AddAttrValue( AttrValue );

      if TagChildName <> '' then
      begin
        ElemChilds := CurrElem.getElementsByTagName(TagChildName);
        if ( not VarIsEmpty(ElemChilds) ) and
           ( not VarIsClear(ElemChilds) ) and (not VarIsError(ElemChilds) ) then
        begin
          for j:=0 to ElemChilds.length-1 do
          begin
            CurElemChild := ElemChilds.item(j);
            AttrChildValue := CurElemChild.getAttribute(AttrName);
            AddAttrValue( AttrChildValue );
          end;
        end;
      end;

    end;
  end;
end;
//******************************************************************************
procedure SetArrPathsFromWebBrowser( WebBrowser: TWebBrowser; TagName, TagChildName, AttrName : string;PathListObj:TStringList );
var i,j:integer;
    AttrValue:Variant;
    AttrChildValue:Variant;
    CurrElem:Variant;
    ElemChilds:Variant;
    CurElemChild:Variant;
    CounterPath:Integer;
begin
  CounterPath :=0 ;
  for i:=0 to WebBrowser.OleObject.Document.body.getElementsByTagName('*').length-1 do
  begin
    CurrElem := WebBrowser.OleObject.Document.body.getElementsByTagName('*').item(i);
    if CompareText( CurrElem.tagName , TagName)=0 then
    begin

      if PathListObj[CounterPath]<>'' then
        CurrElem.setAttribute(AttrName,PathListObj[CounterPath]);
      inc(CounterPath);

      if TagChildName <> '' then
      begin
        ElemChilds := CurrElem.getElementsByTagName(TagChildName);
        if ( not VarIsEmpty(ElemChilds) ) and
           ( not VarIsClear(ElemChilds) ) and (not VarIsError(ElemChilds) ) then
        begin
          for j:=0 to ElemChilds.length-1 do
          begin
            CurElemChild := ElemChilds.item(j);

            if PathListObj[CounterPath]<>'' then
              CurElemChild.setAttribute(AttrName,PathListObj[CounterPath]);
              
            inc(CounterPath);
          end;
        end;
      end;

    end;
  end;
end;
//******************************************************************************
procedure PreparePathsAttrFromWebBrowser( WebBrowser: TWebBrowser; TagName, TagChildName, AttrName : string; AddPrefixToPath:String='\');
var i,j:integer;
    AttrValue:Variant;
    AttrChildValue:Variant;
    CurrElem:Variant;
    ElemChilds:Variant;
    CurElemChild:Variant;
//***********************************************
procedure PrepareAttrValue( var Elem:Variant );
var AttrValue:Variant;
    CurrAttrValue:Widestring;
begin
   Elem.removeAttribute('designtimeurl');
   AttrValue := Elem.getAttribute(AttrName);
   CurrAttrValue:= VarToStr(AttrValue);
   if CurrAttrValue <>'' then
   begin
     ReplaseOn(CurrAttrValue,'about:','');
     ReplaseOn(CurrAttrValue,'file://','');
     ReplaseOn(CurrAttrValue,'/','\');
     ReplaseOn(CurrAttrValue,' \ ','\');
     ReplaseOn(CurrAttrValue,' \','\');
     ReplaseOn(CurrAttrValue,'\ ','\');
     ReplaseOn(CurrAttrValue,'\\','\');

     if Copy(CurrAttrValue,1,Length(AddPrefixToPath))<>AddPrefixToPath then
       CurrAttrValue := AddPrefixToPath + CurrAttrValue;

     Elem.setAttribute( AttrName, string( CurrAttrValue ) );
   end;
end;
//***********************************************
begin
  for i:=0 to WebBrowser.OleObject.Document.body.getElementsByTagName('*').length-1 do
  begin
    CurrElem := WebBrowser.OleObject.Document.body.getElementsByTagName('*').item(i);
    if CompareText( CurrElem.tagName , TagName)=0 then
    begin

      PrepareAttrValue( CurrElem );

      if TagChildName <> '' then
      begin
        ElemChilds := CurrElem.getElementsByTagName(TagChildName);
        if ( not VarIsEmpty(ElemChilds) ) and
           ( not VarIsClear(ElemChilds) ) and (not VarIsError(ElemChilds) ) then
        begin
          for j:=0 to ElemChilds.length-1 do
          begin
            CurElemChild := ElemChilds.item(j);
            PrepareAttrValue( CurElemChild );
          end;
        end;
      end;

    end;
  end;
end;
//******************************************************************************
function GetTextFromFile( aFileName:widestring ):WideString;
var aList:TStringList;
begin
  result :='';
  if FileExists(aFileName) then
  begin
    try
      aList := TStringList.Create;
      aList.LoadFromFile( aFileName );
      result :=  aList.Text;
    finally
      aList.Free;
    end;
  end;
end;
//******************************************************************************
procedure SaveTextToFile( aText:WideString; aFileName:widestring );
var aList:TStringList;
begin
  ExistsDir( aFileName );
  try
    aList := TStringList.Create;
    aList.Text := aText;
    aList.SaveToFile( aFileName );
  finally
    aList.Free;
  end;
end;
//******************************************************************************
function GetStringFromFileByByte(const FileName: string): String;
var
  FileStream : TFileStream;
  Bytes: array of char;
begin
  result := '';
  FileStream:= TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    if FileStream.Size>0 then
    begin
      SetLength(Bytes, FileStream.Size);
      FileStream.Read(Bytes[0], FileStream.Size);
    end;
    result:= string(Bytes);

  finally
    FileStream.Free;
  end;
end;
//******************************************************************************
function FindStrInFile(FileName,StrToFind: string):boolean;
var
  F : TextFile;
  BuffStr:string;

  var
  FileStream : TFileStream;
  Bytes: array of char;

begin

  Result:= false;
  FileStream:= TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
    if FileStream.Size>0 then begin
      SetLength(Bytes, FileStream.Size);
      FileStream.Read(Bytes[0], FileStream.Size);
    end;
    BuffStr:= string(Bytes);

    if Pos(LowerCase( StrToFind ), LowerCase( BuffStr ) )<>0 then result:=True;
  finally
    FileStream.Free;
  end;


 { hf:=FileOpen(FileName,fmOpenRead);
  size:=GetFileSize(hf,0);
  StrAlloc( pc, size );
  FileRead(hf,pc[0],size);
  FileClose(hf);

 if Pos(LowerCase( StrToFind ), LowerCase( pc) )<>0 then result:=True;
  StrDispose(pc); }


 { result := false;
  try
    AssignFile(F, FileName) ;
    Reset(F) ;
    while not Eof(F) do
    begin

      Readln(F, BuffStr);
      if Pos(LowerCase( StrToFind ), LowerCase( BuffStr) )<>0 then
      begin
        result := True;
        Break;
      end;
    end;

  finally
    CloseFile(F) ;
  end;  }
end;
//******************************************************************************
Function MyGetModulePath:Widestring;
begin
  result := ExtractFilePath ( GetModuleName(HInstance) );
  if Copy(result,1,4)='\\?\' then
    Delete(result,1,4);
end;
//******************************************************************************
function GetParamWebConfig(const FileName: WideString;SectionName,Key:Widestring ): WideString;
var
  XML: IXMLDocument;
  Node, N: IXMLNode;
  I: Integer;
begin
  Result := '';
  XML := TXMLDocument.Create(nil);
  XML.Options := [doNodeAutoCreate, doAttrNull];
  try
    XML.FileName := FileName;
    XML.Active := True;
    Node := XML.DocumentElement;
    Node := Node.ChildNodes[SectionName];         //'appSettings'
    for I:=0 to Node.ChildNodes.Count-1 do
    begin
      N := Node.ChildNodes.Get(I);
      if N.Attributes['key'] = Key then           //'Database'
        Result := N.Attributes['value'];
    end;
  finally
    XML := nil;
  end;
end;
//******************************************************************************
Function GetDosOutput( const CommandLine, WorkDir: String; var
ResultCode: Cardinal ): String;
var StdOutPipeRead, StdOutPipeWrite: THandle;
   SA                             : TSecurityAttributes;
   SI                             : TStartupInfo;
   PI                             : TProcessInformation;
   WasOK                          : Boolean;
   Buffer                         : array[0..255] of Char;
   BytesRead                      : Cardinal;
   Line                           : String;
Begin
   //Application.ProcessMessages;
   With SA do
   Begin
      nLength := SizeOf( SA );
      bInheritHandle := True;
      lpSecurityDescriptor := nil;
   end;
   // создаём пайп для перенаправления стандартного вывода
   CreatePipe( StdOutPipeRead,  // дескриптор чтения
               StdOutPipeWrite, // дескриптор записи
               @SA,              // аттрибуты безопасности
               0                // количество байт принятых для пайпа - 0 по умолчанию
              );
   try
    // Создаём дочерний процесс, используя StdOutPipeWrite в качестве стандартного вывода,
    // а так же проверяем, чтобы он не показывался на экране.
    with SI do
    Begin
       FillChar( SI, SizeOf( SI ), 0 );
       cb := SizeOf( SI );
       dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
       wShowWindow := SW_HIDE;
       hStdInput := GetStdHandle( STD_INPUT_HANDLE ); // стандартный ввод не перенаправляем
       hStdOutput := StdOutPipeWrite;
       hStdError := StdOutPipeWrite;
    end;
 
    //Запускаем компилятор из командной строки
    //WorkDir := ExtractFilePath(CommandLine);
    WasOK := CreateProcess( nil,
                            PChar( CommandLine ),
                            nil,
                            nil,
                            True,
                            0,
                            nil,
                            PChar( WorkDir ),
                            SI,
                            PI );
    // Теперь, когда дескриптор получен, для безопасности закрываем запись.
    // Нам не нужно, чтобы произошло случайное чтение или запись.
    CloseHandle( StdOutPipeWrite );
    // если процесс может быть создан, то дескриптор, это его вывод
    if not WasOK then
     raise Exception.Create( 'Ошибка выполнения или компиляции: ' +
            Chr( 10 ) + Chr( 13 ) + CommandLine )
    else
      try
        // получаем весь вывод до тех пор, пока DOS-приложение не будет завершено
        Line := '';
        Repeat
           // читаем блок символов (могут содержать возвраты каретки и переводы строки)
           WasOK := ReadFile( StdOutPipeRead, Buffer, 255, BytesRead, nil );
           // есть ли что-нибудь ещё для чтения?
           if BytesRead > 0 then
           Begin
              // завершаем буфер PChar-ом
              Buffer[BytesRead] := #0;
              // добавляем буфер в общий вывод
              Line := Line + Buffer;
           end;
           //Application.ProcessMessages;
        Until not WasOK or ( BytesRead = 0 );
        // ждём, пока завершится консольное приложение
        WaitForSingleObject( PI.hProcess, INFINITE );
        ResultCode := 0;
        GetExitCodeProcess( PI.hProcess, ResultCode );
      finally
        // Закрываем все оставшиеся дескрипторы
        CloseHandle( PI.hThread );
        CloseHandle( PI.hProcess );
      end;
   finally
     Result := Line;
     CloseHandle( StdOutPipeRead );
 end;
end;
//******************************************************************************
function RecordsetFromXML(const XML: string): _Recordset;
 var
    RS: Variant;
   Stream: TStringStream;
 begin
   Result := nil;
   if XML = '' then Exit;
   try
     Stream := TStringStream.Create(XML);
     Stream.Position := 0;
     RS := CreateOleObject('ADODB.Recordset');
     RS.Open(TStreamAdapter.Create(Stream) as IUnknown);
     Result := IUnknown(RS) as _Recordset;
   finally
     Stream.Free;
   end;
 end;
//******************************************************************************
function RecordsetToXML(const Recordset: _Recordset): string;
var
  RS: Variant;
 Stream: TStringStream;
begin
 Result := '';
 if Recordset = nil then Exit;
 Stream := TStringStream.Create('');
 try
   RS := CreateOleObject('ADODB.Recordset');
   RS := Recordset;
   RS.Save(TStreamAdapter.Create(stream) as IUnknown, adPersistXML);
   Stream.Position := 0;
   Result := Stream.DataString;
 finally
   Stream.Free;
 end;
end;
//******************************************************************************
function GetCountVisiblePages( PControl:TcxPageControl ):Integer;
var i:integer;
begin
  result :=0;
  for i:=0 to PControl.PageCount -1 do
    if PControl.Pages[i].TabVisible then Inc(result);
end;
//******************************************************************************
function MaskFormatRegExp(Mask:string; Value:String): string;
var
  RegExp : Variant;
  Matches : Variant;
  Match : Variant;
begin
  Result := '';
  try
    RegExp := CreateOleObject('VBScript.RegExp');
    RegExp.Pattern := Mask;
    Matches := RegExp.Execute(Value);
  if Matches.Count > 0 then
  begin
    Match := Matches.Item[0];
    Result := Match.Value;
    Match := Null;
  end;
  finally
    Matches := Null;
    RegExp := Null;
  end;
end;
//******************************************************************************
function FindComponentByName( aCompName:String; aControl:TComponent ):TComponent;
var i:Integer;
begin
  result := aControl.FindComponent( aCompName );
  if result = nil then
  begin
    for i:=0 to aControl.ComponentCount-1 do
    begin
      if aControl.Components[i] is TFrame then
        result := FindComponentByName( aCompName, aControl.Components[i] ); //TFrame(aControl.Components[i]).FindComponent( aCompName );

      if result <> nil then Break;
    end;
  end;
end;
//******************************************************************************
function FindComponentByNameArr( aCompName:array of String; aControl:TComponent;StartIndSearch:Integer=0 ):TComponent;
var i:Integer;
begin
  result := nil;
  
  if (Length(aCompName)=1) and ( CompareText(aCompName[0],aControl.Name)=0 ) then
  begin
    result :=aControl;
    exit;
  end;
    
  for i:=StartIndSearch to Length(aCompName)-1 do
  begin
    result := aControl.FindComponent( aCompName[i] );
    if result <> nil then aControl:= result;
  end;
end;
//******************************************************************************
function StringsToDelimited(Strings: TStrings): string;
var I: Integer;
begin
  Result := '';
  if Assigned(Strings) then
    for I := 0 to Strings.Count - 1 do Result := Result + Strings[I] + ';';
  if Length(Result) > 0 then System.Delete(Result, Length(Result), 1);
end;
//******************************************************************************
procedure DelimitedToStrings(const Delimit: string; Strings: TStrings);
var
  S: string;
  Pos: Integer;
begin
  if not Assigned(Strings) then Exit;
  Pos := 1;
  while Pos <= Length(Delimit) do
  begin
    S := ExtractFieldName(Delimit, Pos);
    if S <> '' then Strings.Add(S);
  end;
end;
//******************************************************************************
function GetSystemFont: TFont;
var
  LogFont: TLogFont;
begin
  Result :=nil;
  
  if SystemParametersInfo(SPI_GETICONTITLELOGFONT, SizeOf(TLogFont), @LogFont, 0) then
    begin
      Result:=TFont.Create;

      Result.Height := LogFont.lfHeight;
      //Font.Orientation := LogFont.lfOrientation;
      Result.Charset := TFontCharset(LogFont.lfCharSet);
      Result.Name := PChar(@LogFont.lfFaceName);

      Result.Style := [];

      if LogFont.lfWeight >= FW_BOLD then
        Result.Style := Result.Style + [fsBold];

      if LogFont.lfItalic = 1 then
        Result.Style := Result.Style + [fsItalic];

      if LogFont.lfUnderline = 1 then
        Result.Style := Result.Style + [fsUnderline];

      if LogFont.lfStrikeOut = 1 then
        Result.Style := Result.Style + [fsStrikeOut];

      case LogFont.lfPitchAndFamily and $F of
        VARIABLE_PITCH: Result.Pitch := fpVariable;
        FIXED_PITCH: Result.Pitch := fpFixed;
        else Result.Pitch := fpDefault;
      end;
    end;
end;
//******************************************************************************
function FindArrKeyWordInStr( KeyWords: Array of widestring; SourceStr:WideString;PrefixKeyWord:Widestring='';EndfixKeyWord:Widestring='' ):TStringList;
var i:integer;
begin
  result:= TStringList.Create;

  for i:=0 to Length( KeyWords )-1 do
  begin
    if AnsiPos( LowerCase( PrefixKeyWord+KeyWords[i]+EndfixKeyWord) , LowerCase( SourceStr) )<>0 then
      result.Add( KeyWords[i] );
  end;

end;
//******************************************************************************
Function FindMenuItemByEventOnClick(Ev:TNotifyEvent;Pm:TPopupMenu ):TMenuItem;
var i:integer;
begin
  result :=nil;
  if @Ev = nil then exit;
  
  for i:=0 to Pm.Items.Count-1 do
    if @Pm.Items.Items[i].OnClick = @Ev then
    begin
      result := Pm.Items.Items[i];
      break;
    end;
end;
//******************************************************************************
procedure SynchronizeButtonPanelAndPmenu(ButPanel:TPanel;Pm:TPopupMenu);
var i:integer;
    CurrMenuItem:TMenuItem;
    OnClickEv:TNotifyEvent;
    CurrEnabled:Boolean;
    CurrVisible:Boolean;
begin
  for i:=0 to ButPanel.ControlCount-1 do
  begin
    OnClickEv := nil;
    CurrMenuItem := nil;
    if ButPanel.Controls[i] is Tpanel then SynchronizeButtonPanelAndPmenu( TPanel( ButPanel.Controls[i]) , Pm );

    if ButPanel.Controls[i] is TButton then
    begin
      OnClickEv := TButton(ButPanel.Controls[i]).OnClick;
      CurrEnabled := TButton(ButPanel.Controls[i]).Enabled;
      CurrVisible := TButton(ButPanel.Controls[i]).Visible;

      CurrMenuItem := FindMenuItemByEventOnClick( TButton(ButPanel.Controls[i]).OnClick, Pm );
    end;

    if ButPanel.Controls[i] is TSpeedButton then 
    begin
      OnClickEv := TButton(ButPanel.Controls[i]).OnClick;
      CurrEnabled := TButton(ButPanel.Controls[i]).Enabled;
      CurrVisible := TButton(ButPanel.Controls[i]).Visible;

      CurrMenuItem := FindMenuItemByEventOnClick( TButton(ButPanel.Controls[i]).OnClick, Pm );
    end;

    if CurrMenuItem <> nil then
    begin
      CurrMenuItem.Visible := ButPanel.Visible and CurrVisible;
      CurrMenuItem.Enabled := CurrEnabled;
    end;
    
  end;
end;
//******************************************************************************
function FindAllClassFrom(Path:String;mask:string='*.dfm'; SubDirFind:Boolean=False ):TStringList;
var i:integer;
    aListFiles:TStringList;
    FileText:TStringList;
    PosClass:Integer;
    CurrClass:String;
    CurrFileName:String;
begin
  result := TStringList.Create;
  try
    aListFiles := TStringList.Create;
    FileText := TStringList.Create;

    if SubDirFind then FindSubDirFiles( Path, mask, aListFiles )
    else FindFile(Path,aListFiles,mask, 1 );

    for i:=0 to aListFiles.Count-1 do
    begin
      CurrFileName :=aListFiles.Strings[i];
      if ExtractFilePath(CurrFileName)='' then CurrFileName:=Path+CurrFileName;

      if FileExists( CurrFileName ) then
      begin
        FileText.LoadFromFile( CurrFileName );
        PosClass :=AnsiPos(':', FileText.Strings[0]);
        if ( PosClass<>0 ) then
        begin
          CurrClass := Copy(FileText.Strings[0],PosClass+1, Length(FileText.Strings[0])-PosClass+1 );
          result.Add( Trim( CurrClass ) );
        end;
      end;
    end;
  finally
    FileText.Free;
    aListFiles.Free;
  end;
end;
//******************************************************************************
function GetNamePathForComponent(aComponent:TComponent):String;
begin
  if TMenuItem(aComponent).Owner is TFrame then
    result := aComponent.Owner.Owner.Name + '.'+ aComponent.Owner.Name+ '.' +aComponent.Name
  else  result := aComponent.Owner.Name+'.'+aComponent.Name;
end;
//******************************************************************************


end.

 if TagChildEleme <> '' then
    begin
      if ElementsChild.all.length <> 0 then
      begin
        for j:=0 to ElementsChild.all.length-1 do
          if CompareText( ElementsChild.all.item(j).tagName , TagChildEleme ) = 0 then
            PrepareCurrElement( ElementsChild.all.item(j) );
      end
       else
       begin
         NewOutherHTML:= ElementsChild.outerHTML;
         Str := UnitProc.ReadParam( NewOutherHTML, 'src' );
         NewParamSrc:= FPrepareSrcElemAndGetNewParamSrc( Str, PathTosave, PathSaveObj, ShowFullPath );
         ReplaseON(NewOutherHTML,Str,NewParamSrc);

         ElementsChild.outerHTML:= NewOutherHTML;
       end;
    end;

{
procedure EnabledControlByTabOrder(OwnerComp:TComponent;JustControl:array of TClass;ComponentNotBlocked:Array of TComponent);
var i,j:Integer;
    MyComponents:Array of TWinControl;
    MySortComponents:Array of TWinControl;
    Len:Integer;
    MinTabOrder:Integer;
    currTabOrder:Integer;
//******************************************************    
function CheckComponentClass(aComp:TComponent):boolean;
var i:Integer;
begin
  result:=false;
  if Length(JustControl) = 0 then result:=True;
  //*******************************************
  for i:=0 to Length(JustControl)-1 do
  begin
    if aComp is JustControl[i] then
    begin
      result:=true;
      Break;
    end;
  end;
end;
//******************************************************
function CheckComponentOnNotBlocked(aComp:TComponent):Boolean;
var i:integer;
begin
  result:=false;
  for i:=0 to Length( ComponentNotBlocked ) -1 do
  begin
    if ComponentNotBlocked[i] = aComp then
    begin
      result:=true;
      break;
    end;
  end;
end;
//******************************************************
function FindNextTabOrder(minTabOrder:Integer):TWinControl;
var i:Integer;
    min:Integer;
    max:Integer;
    currTabOrder:Integer;
begin
   min:= 0;
   max:=0;
   for i:=0 to Length(MyComponents)-1 do
   begin
    if (MyComponents[i].Parent = OwnerComp ) then currTabOrder:= TWinControl(MyComponents[i]).TabOrder
    else currTabOrder:= MyComponents[i].Parent.TabOrder;

    if  max<currTabOrder then max:=currTabOrder;
   end;
   min:=max;
   //***************************************
   for i:=0 to Length(MyComponents)-1 do
   begin
     if (MyComponents[i].Parent = OwnerComp ) then currTabOrder:= TWinControl(MyComponents[i]).TabOrder
     else currTabOrder:= MyComponents[i].Parent.TabOrder;

     if ( currTabOrder < min  )and( currTabOrder >= minTabOrder) then
     begin
      min:=currTabOrder;
      result:=TWinControl(MyComponents[i]);
     end;
   end;
end;
//******************************************************
begin
  Len:=0;
  MinTabOrder:=-1;
  for i:=0 to OwnerComp.Owner.ComponentCount -1 do
  begin
    if (OwnerComp.Owner.Components[i] is TWinControl)and(CheckComponentClass( OwnerComp.Owner.Components[i] )) then
    begin

      if (TWinControl(OwnerComp.Owner.Components[i]).Parent = OwnerComp ) then currTabOrder:= TWinControl(OwnerComp.Owner.Components[i]).TabOrder
      else currTabOrder:= TWinControl(OwnerComp.Owner.Components[i]).Parent.TabOrder;

      if MinTabOrder = -1 then MinTabOrder:= currTabOrder;

      if currTabOrder < MinTabOrder then
      begin
       MinTabOrder:= currTabOrder;
      end;

      Len:=Length(MyComponents);
      SetLength( MyComponents , Len + 1 );


      MyComponents[len] := TWinControl(OwnerComp.Owner.Components[i]);
    end;
  end;
  //***************************************************
  SetLength(MySortComponents , Length(MyComponents) );

  for i:=0 to Length(MyComponents)-1 do
  begin
    MySortComponents[i]:=FindNextTabOrder(minTabOrder);
    minTabOrder:= MySortComponents[i].TabOrder+1;
  end;
  //***************************************************
  for i:=0 to Length(MySortComponents)-1 do
  begin
    if CheckWinControlNotEmpty(MySortComponents[i]) then
    begin
      for j:=i to Length(MySortComponents)-1 do
        if not CheckComponentOnNotBlocked(MySortComponents[j]) then
          MySortComponents[j].Enabled:=false;
      exit;  
    end;
  end;
end;  }

