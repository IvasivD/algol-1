unit ZTView;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DB, 
  Menus, DBTables, StdCtrls, Buttons, ExtCtrls, ActnList, ImgList,
  IBCustomDataSet, IBQuery;

type
  ToptTypeDB = (optTQuery, optTIBQuery);
  TZViewForm = class(TForm)
    TopPanel: TPanel;
    BottomPanel: TPanel;
    CloseBtn: TBitBtn;
    DetailListQuerySrc: TDataSource;
    DetailListQuery: TQuery;
    PopupMenu: TPopupMenu;
    CloseItem: TMenuItem;
    ActionList: TActionList;
    CloseAction: TAction;
    PrintDialog: TPrintDialog;
    PrintAction: TAction;
    PrintItem: TMenuItem;
    PopupMenuSplitter1: TMenuItem;
    ImageList: TImageList;
    RefreshAction: TAction;
    CalculateAction: TAction;
    RefreshItem: TMenuItem;
    PrintBtn: TBitBtn;
    CopyAction: TAction;
    CopyItem: TMenuItem;
    ExecuteAction: TAction;
    SendByMailAction: TAction;
    SendByMailItem: TMenuItem;
    GridFilterCheckBox: TCheckBox;
    PopupMenuSplitter2: TMenuItem;
    DetailListIBQuery: TIBQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure DetailListQueryAfterScroll(DataSet: TDataSet);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure RefreshActionExecute(Sender: TObject);
    procedure CopyActionExecute(Sender: TObject);
    procedure CalculateActionExecute(Sender: TObject);
    procedure ExecuteActionExecute(Sender: TObject);
    procedure PrintActionExecute(Sender: TObject);
    procedure SendByMailActionExecute(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    procedure GridFilterCheckBoxClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormDestroy(Sender: TObject);
  private
    FDetailListQuerySQL: String;
    FDocumentFooter: TStrings;
    FDocumentHeader: TStrings;
    FForerunPrintDialog: Boolean;
    FGridFilterEnabled: Boolean;
    FGridFilterString: String;
    FGridRefuseColumn: TField;
    FGridUniqueColumn: TField;
    FGridUniqueFirst: Integer;
    FUpdateQueryOnActivation: Boolean;
    FPrintOptionPaperA3: Boolean;
    FPrintOptionCopies: Integer;
    FPrintOptionDuplex: Integer;
    FPrintOptionOrientation: Integer;
    procedure DoViewMemo(Pos: TPoint; Field: TField);
    function GetDetailListQuerySQL: String; virtual;
    function GetGridFiltered: Boolean;
    function GetGridFilterString: String;
    procedure SetGridFiltered(const Value: Boolean);
    procedure SetGridFilterEnabled(const Value: Boolean);
    procedure SetGridFilterString(const Value: String);
    procedure InitViewForm;
    function GetWorkDataSet: TDataSet;
    function GetWorkDataSetSQLText: string;
    procedure SetWorkDataSetSQLText(const Value: string);
    function GetWorkDataSetSQL: Tstrings;
    procedure SetWorkDataSetSQL(const Value: Tstrings);
  protected
    procedure DoCopy; virtual;
    procedure DoPrint; virtual; abstract;
    procedure DoSendMail; virtual;
    procedure DoViewHint(const HintMsg: string);
    procedure FillDocumentFooter; virtual;
    procedure FillDocumentHeader; virtual;
    function GetDocumentTitle: string; virtual;
    function MakeDetailListQuerySQL: String; virtual;
    function MakeDetailListQuerySQLFormat: String; virtual;
    procedure PresetDocument;
    procedure PresetPrinter;
    procedure SetDetailListQueryParams; virtual;
    procedure SetWindowSize; virtual;
    procedure UpdateDetailListQuery; virtual;
    procedure ViewHint; virtual;
    procedure ViewMemo(Field: TField); virtual;
    property DocumentTitle: String read GetDocumentTitle;
    property DocumentHeader: TStrings read FDocumentHeader;
    property DocumentFooter: TStrings read FDocumentFooter;
    property ForerunPrintDialog: Boolean read FForerunPrintDialog write FForerunPrintDialog;
    property GridFilterEnabled: Boolean read FGridFilterEnabled write SetGridFilterEnabled;
    property GridFiltered: Boolean read GetGridFiltered write SetGridFiltered;
    property GridFilterString: String read GetGridFilterString write SetGridFilterString;
    property GridRefuseColumn: TField read FGridRefuseColumn write FGridRefuseColumn;
    property GridUniqueColumn: TField read FGridUniqueColumn write FGridUniqueColumn;
    property GridUniqueFirst: Integer read FGridUniqueFirst write FGridUniqueFirst;
    property PrintOptionOrientation: Integer read FPrintOptionOrientation write FPrintOptionOrientation;
    property PrintOptionCopies: Integer read FPrintOptionCopies write FPrintOptionCopies;
    property PrintOptionDuplex: Integer read FPrintOptionDuplex write FPrintOptionDuplex;
    property PrintOptionPaperA3: Boolean read FPrintOptionPaperA3 write FPrintOptionPaperA3;
    property UpdateQueryOnActivation: Boolean read FUpdateQueryOnActivation write FUpdateQueryOnActivation;
    property WorkDataSet: TDataSet read GetWorkDataSet;
    property WorkDataSetSQLText: string read GetWorkDataSetSQLText write SetWorkDataSetSQLText;
    property WorkDataSetSQL: Tstrings read GetWorkDataSetSQL write SetWorkDataSetSQL;
  public
  end;

var
  ZViewForm: TZViewForm;
  FoptTypeDB: ToptTypeDB = optTQuery; 

implementation

uses Printers, VDlgs, PrntUn;

{$R *.DFM}

procedure TZViewForm.DoViewMemo(Pos: TPoint; Field: TField);
var
  VwFrm: TForm;
  XSize, YSize: Integer;
begin
  if ((Field.DataType = ftMemo) or (Field.DataType = ftFmtMemo)) then
  begin
    XSize := Screen.Width div 5;
    YSize := Screen.Height div 5;
    VwFrm := TForm.Create(Application);
    with VwFrm do
    try
      if Pos.X + xSize <= Screen.Width then
        Left := Pos.X + 1 else Left := Pos.X - xSize - 1;
      if Pos.Y + ySize <= Screen.Height then
        Top := Pos.Y + 1 else Top := Pos.Y - ySize - 1;
      Width := xSize;
      Height := ySize;
      BorderIcons := [biSystemMenu];
      BorderStyle := bsSizeToolWin;
      with TMemo.Create(VwFrm) do
      begin
        Parent := VwFrm;
        Align := alClient;
        ScrollBars := ssVertical;
        WordWrap := True;
        Color := clInfoBk;
        Text := Field.AsString;
        ReadOnly := True;
      end;
      KeyPreview := True;
      Caption := Field.DisplayName;
      OnKeyPress := FormKeyPress;
      ShowModal;
    finally
      Free;
    end;
  end;
end;

function TZViewForm.GetDetailListQuerySQL: String;
begin
  Result := FDetailListQuerySQL;
end;

function TZViewForm.GetGridFiltered: Boolean;
begin
  Result := GridFilterCheckBox.Checked;
end;

function TZViewForm.GetGridFilterString: String;
begin
  if GridFiltered then Result := FGridFilterString else Result := '';
  if Result <> '' then Result := Result + ' and';
end;

procedure TZViewForm.SetGridFiltered(const Value: Boolean);
begin
  GridFilterCheckBox.Checked := Value;
  GridFilterCheckBoxClick(nil);
end;

procedure TZViewForm.SetGridFilterEnabled(const Value: Boolean);
begin
  FGridFilterEnabled := Value;
  GridFilterCheckBox.Visible := Value;
  if not Value then GridFiltered := False;
end;

procedure TZViewForm.SetGridFilterString(const Value: String);
begin
  FGridFilterString := Value;
end;

procedure TZViewForm.DoCopy;
begin
end;

procedure TZViewForm.DoSendMail;
begin
end;

procedure TZViewForm.DoViewHint(const HintMsg: string);
begin
  SendMyStatusMsg(HintMsg);
end;

procedure TZViewForm.FillDocumentFooter;
begin
  FDocumentFooter.Clear;
end;

procedure TZViewForm.FillDocumentHeader;
begin
  FDocumentHeader.Clear;
end;

function TZViewForm.GetDocumentTitle: string;
begin
  Result := Caption;
end;

function TZViewForm.MakeDetailListQuerySQL: String;
begin
  if GridFilterEnabled then
    Result := Format(MakeDetailListQuerySQLFormat, [GetGridFilterString])
  else Result := GetDetailListQuerySQL; //DetailListQuery.SQL.Text;
end;

function TZViewForm.MakeDetailListQuerySQLFormat: String;
const sWhere = 'where ';
begin  // override this function for customizing returned SQL statement
  Result := StringReplace(GetDetailListQuerySQL,
    sWhere, sWhere + '%s ', [rfReplaceAll, rfIgnoreCase]);
end;

procedure TZViewForm.PresetDocument;
begin
  FillDocumentHeader;
  FillDocumentFooter;
end;

procedure TZViewForm.PresetPrinter;
begin
  SetPrinterOptions(True, PrintOptionOrientation,
    PrintOptionCopies, PrintOptionDuplex, PrintOptionPaperA3);
end;

procedure TZViewForm.SetDetailListQueryParams;
begin
end;

procedure TZViewForm.SetWindowSize;
begin
  if Position in [poDesigned, poDefault, poDefaultSizeOnly] then
  begin
    Top := yClientWindow;
    Left := (wClientWindow - xClientWindow - Width) div 2;
    if Left < 0 then Left := 0;
  end
  else if Position in [poScreenCenter, poDesktopCenter, poMainFormCenter, poOwnerFormCenter]
  then Height := Application.MainForm.Height * 8 div 10;
end;

procedure TZViewForm.UpdateDetailListQuery;
var
  Id: Integer;
  SId: String;
  BI: Boolean;
begin
  SId := '';
  Id := 0;
  BI := True;
  with WorkDataSet do
  begin
    if not Assigned(FGridUniqueColumn) then Id := 0
    else if FGridUniqueFirst <> 0 then
    begin
      Id := FGridUniqueFirst;
      FGridUniqueFirst := 0;
    end
    else if Active then
      with FGridUniqueColumn do
      begin
        BI := DataType in [ftSmallint, ftInteger, ftWord, ftAutoInc];
        if BI then Id := AsInteger else SId := AsString;
      end
    else SId := '';
    Close;
//    SQL.Text := MakeDetailListQuerySQL;
    WorkDataSetSQLText := MakeDetailListQuerySQL;
    SetDetailListQueryParams;
    Open;
    if Id < 0 then Last
    else if BI and (Id <> 0) then Locate(FGridUniqueColumn.FieldName, Id, [])
    else if not BI and (SId <> '') then Locate(FGridUniqueColumn.FieldName, SId, []);
  end;
end;

procedure TZViewForm.ViewHint;
begin
  DoViewHint('');
end;

procedure TZViewForm.ViewMemo(Field: TField);
begin
  try
    DoViewMemo(Mouse.CursorPos, Field);
  except
  end;
end;

procedure TZViewForm.FormCreate(Sender: TObject);
begin
//  FoptTypeDB := optTQuery;
  InitViewForm;
end;

procedure TZViewForm.FormActivate(Sender: TObject);
begin
//  InitViewForm;
  if UpdateQueryOnActivation then UpdateDetailListQuery;
end;

procedure TZViewForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    Key := #0;
    Close;
  end;
end;

procedure TZViewForm.DetailListQueryAfterScroll(DataSet: TDataSet);
begin
  ViewHint;
end;

procedure TZViewForm.ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
begin
  PrintAction.Enabled := GetWorkDataSet.Active;
end;

procedure TZViewForm.ExecuteActionExecute(Sender: TObject);
begin
  UpdateDetailListQuery;
end;

procedure TZViewForm.RefreshActionExecute(Sender: TObject);
begin
  UpdateDetailListQuery;
end;

procedure TZViewForm.CopyActionExecute(Sender: TObject);
begin
  DoCopy;
end;

procedure TZViewForm.CalculateActionExecute(Sender: TObject);
begin
  UpdateDetailListQuery;
end;

procedure TZViewForm.PrintActionExecute(Sender: TObject);
begin
  PresetPrinter;
  if not ForerunPrintDialog or PrintDialog.Execute then
  begin
    PresetDocument;
    DoPrint;
  end;
end;

procedure TZViewForm.SendByMailActionExecute(Sender: TObject);
begin
  DoSendMail;
end;

procedure TZViewForm.CloseActionExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TZViewForm.GridFilterCheckBoxClick(Sender: TObject);
begin
  UpdateDetailListQuery;
end;

procedure TZViewForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if CanClose then ClearMyStatusMsg;
end;

procedure TZViewForm.FormDestroy(Sender: TObject);
begin
  if Assigned(FDocumentHeader) then FDocumentHeader.Free;
  if Assigned(FDocumentFooter) then FDocumentFooter.Free;
  inherited;
end;

procedure TZViewForm.InitViewForm;
begin
  FGridUniqueColumn := nil;
  FGridUniqueFirst := 0;
  FGridFilterEnabled := False;
  SetWindowSize;                
  FDetailListQuerySQL := WorkDataSetSQLText;
  DetailListQuerySrc.DataSet := WorkDataSet;
  FDocumentHeader := TStringList.Create;
  FDocumentFooter := TStringList.Create;
  FForerunPrintDialog := True;
  FUpdateQueryOnActivation := True;
  FPrintOptionOrientation := DMORIENT_PORTRAIT;
  FPrintOptionCopies := 1;
  FPrintOptionDuplex := DMDUP_VERTICAL;
  FPrintOptionPaperA3 := False;
end;

function TZViewForm.GetWorkDataSet: TDataSet;
begin
  if FoptTypeDB = optTQuery then 
    Result := DetailListQuery
  else 
    Result := DetailListIBQuery;
end;

function TZViewForm.GetWorkDataSetSQLText: string;
begin
  if WorkDataSet is TQuery then Result := (WorkDataSet as TQuery).SQL.Text;
  if WorkDataSet is TIBQuery then Result := (WorkDataSet as TIBQuery).SQL.Text;
end;

procedure TZViewForm.SetWorkDataSetSQLText(const Value: string);
begin
  if WorkDataSet is TQuery then (WorkDataSet as TQuery).SQL.Text := Value;
  if WorkDataSet is TIBQuery then (WorkDataSet as TIBQuery).SQL.Text := Value;
end;

function TZViewForm.GetWorkDataSetSQL: Tstrings;
begin
  if WorkDataSet is TQuery then Result := (WorkDataSet as TQuery).SQL;
  if WorkDataSet is TIBQuery then Result := (WorkDataSet as TIBQuery).SQL;
end;

procedure TZViewForm.SetWorkDataSetSQL(const Value: Tstrings);
begin
  if WorkDataSet is TQuery then (WorkDataSet as TQuery).SQL := Value;
  if WorkDataSet is TIBQuery then (WorkDataSet as TIBQuery).SQL := Value;
end;

end.
