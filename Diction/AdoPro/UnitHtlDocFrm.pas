unit UnitHtlDocFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  ExtCtrls, Buttons, DBActns, ActnList, ComCtrls, ToolWin, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, StdCtrls,ServMod, OptSet,TourConsts, TourCmnlIf,TourStrMag, UnitProc,Core;
const
  sHotels = 'Hotels';
type
  TFrmHotelDocMaster = class(TForm)
    CtrlPanel: TPanel;
    FileSizeLabel: TLabel;
    CancelBtn: TBitBtn;
    GridDocDBTableView1: TcxGridDBTableView;
    GridDocLevel1: TcxGridLevel;
    GridDoc: TcxGrid;
    Panel1: TPanel;
    ToolBar: TToolBar;
    SeparatorBtn1: TToolButton;
    DocCopyToBtn: TToolButton;
    DocRenameBtn: TToolButton;
    SeparatorBtn2: TToolButton;
    DocLaunchBtn: TToolButton;
    DocOpenFolderBtn: TToolButton;
    SeparatorBtn4: TToolButton;
    ActionList: TActionList;
    DocAddAction: TAction;
    DocEditAction: TAction;
    DocDelAction: TAction;
    DocLaunchAction: TAction;
    DocOpenFolderAction: TAction;
    DataSetFirstAction: TDataSetFirst;
    DataSetPriorAction: TDataSetPrior;
    DataSetNextAction: TDataSetNext;
    DataSetLastAction: TDataSetLast;
    DocScanAction: TAction;
    DocPasteAction: TAction;
    DocCopyToAction: TAction;
    DocRenameAction: TAction;
    DocPreviewAction: TAction;
    DocViewLocAction: TAction;
    DocMoveUpAction: TAction;
    DocMoveDnAction: TAction;
    PanelUpdate: TPanel;
    butRefreshDic: TSpeedButton;
    butEditDoc: TSpeedButton;
    butDelDoc: TSpeedButton;
    butAddDoc: TSpeedButton;
    Bevel3: TBevel;
    BevelMainSpliterMoveRows: TBevel;
    butMoveUp: TSpeedButton;
    butMoveDown: TSpeedButton;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    procedure butAddDocClick(Sender: TObject);
    procedure butEditDocClick(Sender: TObject);
    procedure butDelDocClick(Sender: TObject);
    procedure butMoveUpClick(Sender: TObject);
    procedure butMoveDownClick(Sender: TObject);
    procedure DocCopyToBtnClick(Sender: TObject);
    procedure DocRenameBtnClick(Sender: TObject);
    procedure DocLaunchBtnClick(Sender: TObject);
    procedure DocOpenFolderBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FCanUpdate : Boolean;
    FElemHtlDoc:TDBShemaView;
    procedure DoDocRename(const NewName: String);
    procedure DoDocLaunch;
    procedure DoDocOpenFolder;
    procedure FRefreshControls;
  public
    { Public declarations }
  end;

  function GetHotelDocFolder( NameEng, HotelDocId:Widestring ): String;
  Procedure ExecuteHotelDocMaster(  aElemHtlDoc:TDBShemaView; CanUpdate:Boolean  );
var
  FrmHotelDocMaster: TFrmHotelDocMaster;

implementation

{$R *.dfm}

function GetHotelDocFolder( NameEng, HotelDocId:Widestring ): String;
begin
  Result := OptionSet.StoreFolder;
  Result := ExistsDir( Result );
  if DirectoryExists(Result) then
  begin
    Result := IncludeTrailingPathDelimiter(Result) + sHotels +
      PathDelim + NameEng + PathDelim + HotelDocId + PathDelim;
  end else Result :='';
end;

function GetHotelDocFileName( NameEng,HotelDocId, FileName:Widestring ): String;
begin
  Result := IncludeTrailingPathDelimiter( GetHotelDocFolder(NameEng,HotelDocId ) ) + FileName;
end;

Procedure ExecuteHotelDocMaster( aElemHtlDoc:TDBShemaView; CanUpdate:Boolean );
begin
  try
    Application.CreateForm(TFrmHotelDocMaster, FrmHotelDocMaster);
    FrmHotelDocMaster.FCanUpdate:= CanUpdate;
    FrmHotelDocMaster.FElemHtlDoc := aElemHtlDoc;
    FrmHotelDocMaster.ShowModal;

  finally
    FrmHotelDocMaster.Free;
  end;
end;

procedure TFrmHotelDocMaster.butAddDocClick(Sender: TObject);
begin
  //if not FElemHtlDoc.UpdateForm then
  //begin
  FElemHtlDoc.DBInsert( True );
  FRefreshControls;
  //end;
end;

procedure TFrmHotelDocMaster.butEditDocClick(Sender: TObject);
begin
  //if not FElemHtlDoc.UpdateForm then
  //begin
  FElemHtlDoc.DBEdit( True );
  FRefreshControls;
  //end;
end;

procedure TFrmHotelDocMaster.butDelDocClick(Sender: TObject);
begin
  FElemHtlDoc.DBDelete;
  FRefreshControls;
end;

procedure TFrmHotelDocMaster.butMoveUpClick(Sender: TObject);
begin
  FElemHtlDoc.MoveUpRow;
  FRefreshControls;
end;

procedure TFrmHotelDocMaster.butMoveDownClick(Sender: TObject);
begin
  FElemHtlDoc.MoveDownRow;
  FRefreshControls;
end;

procedure TFrmHotelDocMaster.DocCopyToBtnClick(Sender: TObject);
var FName: String;
    CurrDocFileName:String;
begin
  with SaveDialog do
  begin
    FileName := FElemHtlDoc.DB.FieldByName('FILENAME').asString;
    Filter := OpenDialog.Filter;
    if Execute then
    begin
      FName := GetUNCFileName(FileName);
      if PosSubString(GetUNCFileName(OptionSet.StoreFolder), FName) = 1
        then ErrorFmtDlg(SHtlDocFrmErrorFolderDis, [ExtractFileDir(FileName)])
      else
      begin
        CurrDocFileName:=GetHotelDocFileName( FElemHtlDoc.DB.FieldByName('NAME_ENG').asString,
                        FElemHtlDoc.DB.FieldByName('HOTELID').asString,
                        FElemHtlDoc.DB.FieldByName('FILENAME').asString );
        MyCopyFile( CurrDocFileName, FileName);
      end;
    end;
    FRefreshControls;
  end;
end;

procedure TFrmHotelDocMaster.DoDocRename(const NewName: String);
var CurrFileName:WideString;
begin
  CurrFileName:= GetHotelDocFileName( FElemHtlDoc.DB.FieldByName('NAME_ENG').asString,
                                      FElemHtlDoc.DB.FieldByName('HOTELID').asString,
                                      FElemHtlDoc.DB.FieldByName('FILENAME').asString );

  if RenameFile( CurrFileName,  ExtractFilePath(CurrFileName) + NewName) then
  begin
    FElemHtlDoc.DB.Edit;
    FElemHtlDoc.DB.FieldByName('FILENAME').asString:= ExtractFileName(NewName);
    FElemHtlDoc.DB.Post;
  end;
end;

procedure TFrmHotelDocMaster.DocRenameBtnClick(Sender: TObject);
var OldDir, FName: String;
    CurrDocFileName:String;
begin
  with SaveDialog do
  begin
    Filter := OpenDialog.Filter;
    OldDir := InitialDir;
    CurrDocFileName := GetHotelDocFolder( FElemHtlDoc.DB.FieldByName('NAME_ENG').asString, FElemHtlDoc.DB.FieldByName('HOTELDOCID').asString );
    InitialDir := CurrDocFileName;

    Options := Options + [ofNoChangeDir];
    if Execute then
    begin
      FName := UkraineToEnglish(FileName);
      if PosSubString( GetUNCFileName(CurrDocFileName), GetUNCFileName(FName) ) <> 1 then
        ErrorDlg(SHtlDocFrmErrorFolderChange)
      else
        if FileExists(FileName) then ErrorFmtDlg( SVDlgsFileExistsFatal, [FName] )
      else
        DoDocRename(FName);
    end;
    Options := Options - [ofNoChangeDir];
    InitialDir := OldDir;
    FRefreshControls;
  end;
end;

procedure TFrmHotelDocMaster.DoDocLaunch;
var CurrDocFileName:String;
begin
  CurrDocFileName := GetHotelDocFileName( FElemHtlDoc.DB.FieldByName('NAME_ENG').asString,
                    FElemHtlDoc.DB.FieldByName('HOTELID').asString,
                    FElemHtlDoc.DB.FieldByName('FILENAME').asString );

  ShellOpenDocument( GetLocalFileName( CurrDocFileName ) );
end;

procedure TFrmHotelDocMaster.DoDocOpenFolder;
var CurrDocFileName:String;
begin
  CurrDocFileName := GetHotelDocFileName( FElemHtlDoc.DB.FieldByName('NAME_ENG').asString,
                    FElemHtlDoc.DB.FieldByName('HOTELID').asString,
                    FElemHtlDoc.DB.FieldByName('FILENAME').asString );

  ShellOutward( ExtractFileDir( GetLocalFileName(CurrDocFileName) ), '', '', '', SW_NORMAL );
end;

procedure TFrmHotelDocMaster.DocLaunchBtnClick(Sender: TObject);
begin
  DoDocLaunch;
end;

procedure TFrmHotelDocMaster.DocOpenFolderBtnClick(Sender: TObject);
begin
  DoDocOpenFolder;
end;

procedure TFrmHotelDocMaster.FRefreshControls;
begin
  butEditDoc.Enabled := (FCanUpdate) and (Self.FElemHtlDoc.View.ViewData.RowCount <> 0);
  butDelDoc.Enabled := (FCanUpdate) and (Self.FElemHtlDoc.View.ViewData.RowCount <> 0);
  butMoveUp.Enabled := Self.FElemHtlDoc.CheckMoveUpRow;
  butMoveDown.Enabled := Self.FElemHtlDoc.CheckMoveDownRow;
  DocCopyToBtn.Enabled := (FCanUpdate) and (Self.FElemHtlDoc.View.ViewData.RowCount <> 0);
  DocRenameBtn.Enabled := (FCanUpdate) and (Self.FElemHtlDoc.View.ViewData.RowCount <> 0);
  DocLaunchBtn.Enabled := (FCanUpdate) and (Self.FElemHtlDoc.View.ViewData.RowCount <> 0);
  DocOpenFolderBtn.Enabled := (FCanUpdate) and (Self.FElemHtlDoc.View.ViewData.RowCount <> 0);
end;

procedure TFrmHotelDocMaster.FormShow(Sender: TObject);
begin
  FRefreshControls;
end;

end.   //Elem_HCountryQry.DB.FieldByName('NAME_ENG').asString
