unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, UnitMergeDataBank,TourMbplIf,OptSet,
  DB, IBDatabase, IBCustomDataSet, IBQuery, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxCalendar;

type
  TFmMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Panel3: TPanel;
    ProgressBarUpdate: TProgressBar;
    Panel10: TPanel;
    ParsePanel: TPanel;
    ButParseNewDB: TButton;
    BankDS: TDataSource;
    IBQueryBank: TIBQuery;
    IBQueryBankBANKID: TIntegerField;
    IBQueryBankNAME: TIBStringField;
    IBQueryBankADDRESS: TIBStringField;
    IBQueryBankSWIFT: TIBStringField;
    IBQueryBankMFO: TIBStringField;
    IBQueryBankMEMO: TMemoField;
    IBQueryBankCOUNTRYID: TIntegerField;
    IBQueryBankGLMFO: TIBStringField;
    IBQueryBankD_OPEN: TDateTimeField;
    IBQueryBankD_CLOSE: TDateTimeField;
    IBQueryBankPARENTID: TIntegerField;
    IBQueryBankDEPCODE: TIBStringField;
    IBQueryBankCalBANK: TStringField;
    IBTransaction: TIBTransaction;
    IBDatabase: TIBDatabase;
    Panel4: TPanel;
    DateEdit: TcxDateEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButParseNewDBClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
     ElemBankNBU:TMergeDataBankNBU;
    { Private declarations }
  public
     AutoParserParam:String;
     { Public declarations }
  end;

var
  FmMain: TFmMain;

implementation

{$R *.dfm}
//******************************************************************************
procedure TFmMain.FormCreate(Sender: TObject);
begin
 AutoParserParam:='';
 try
   OptionSet := TOptionSet.Create;

   IBDatabase.Connected := False;
   IBDatabase.LoginPrompt := False;
   IBDatabase.Params.Values['password']:=' ';
   ChangeLogStrings(IBDatabase.Params);
   IBDatabase.Params.Values['password']:=Trim( IBDatabase.Params.Values['password'] );

   IBDatabase.DatabaseName := OptionSet.DatabaseFolder;
   IBDatabase.Params.Values['user_name']:='SYSDBA';

   ElemBankNBU:=TMergeDataBankNBU.Create( IBDatabase.DatabaseName , IBDatabase.Params.Values['user_name'] , IBDatabase.Params.Values['password'] );
   IBDatabase.Connected:=true;
   
 finally
  OptionSet.Destroy;
 end;

 DateEdit.Date := Now;
end;
//******************************************************************************
procedure TFmMain.FormDestroy(Sender: TObject);
begin
 ElemBankNBU.Close;
end;
//******************************************************************************
procedure TFmMain.ButParseNewDBClick(Sender: TObject);
var a:TDate;
begin
 ElemBankNBU.ParseCourseOfValuteAndUpdate( DateEdit.Date , ProgressBarUpdate );
 if CompareText( AutoParserParam,'new')=0 then Close;
end;
//******************************************************************************
procedure TFmMain.FormShow(Sender: TObject);
begin
 if CompareText( AutoParserParam,'new')=0 then
   ButParseNewDB.Click;
end;
//******************************************************************************
end.
