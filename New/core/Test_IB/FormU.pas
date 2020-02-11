unit FormU;

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
  StdCtrls, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  IBCustomDataSet, IBQuery,UnitProc;

type
  TForm1 = class(TForm)
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

 TDllFunct = function( DllFunc:Pointer; paramFun:Pointer ):boolean;
 TCreateTrOrdFunc = function( AppHandle: Cardinal; ATour, AGroup, AManager : Integer;
                              CreatePersons: Boolean; var AnOrder: Integer): Boolean;

 TMyParamDll = Record
   AppHandle: Cardinal;
   ATour: Integer;
   AGroup: Integer;
   AManager : Integer;
   CreatePersons: Boolean;
   AnOrder: Integer
 end;
 PMyParamDll = ^TMyParamDll;
 
var
  Form1: TForm1;

implementation

uses
  DMMod, FrmProgress, UnitIBQuery;

const mMax = 10000;
{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var I: Integer;
  Progress: TProgressFormProp;
begin
  try
    Progress := ShowProgress('Зачекайте...', mMax);
  
    for I := 1 to mMax do begin
      Elem_Test.DBAddValues(['NAME', 'ID2'], ['Name = ' + IntToStr(I) , 0]);
      Progress.ProgressBar.Position := Progress.ProgressBar.Position + 1;
      Progress.ProgressCaption.Repaint; 
      Application.ProcessMessages;
    end;  
  finally
    ClosedProgress;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var I: Integer;
  Progress: TProgressFormProp;
begin
  try
    Progress := ShowProgress('Зачекайте...', mMax);
    Elem_Test.DB.First;
    while not Elem_Test.DB.Eof do 
    begin
      Elem_Test.DB.Edit;
      Elem_Test.DB.FieldByName('NAME').AsString := GetLocalIP +' '+ Elem_Test.DB.FieldByName('NAME').AsString;
      Elem_Test.DB.FieldByName('ID2').AsInteger := Elem_Test.DB.FieldByName('ID2').AsInteger + 1;
      Progress.ProgressBar.Position := Progress.ProgressBar.Position + 1;
      Progress.ProgressCaption.Repaint; 
      Elem_Test.DB.Post;
      Elem_Test.DB.Next;
      Application.ProcessMessages;
    end;  
  finally
    ClosedProgress;
  end;
end;

Function ExecFunctDLL( DllName, FunctonName:String; ParamFunct:TDllFunct; paramFun:Pointer ):Variant;
var
  DllFunc:Pointer;
  HLib:THandle;
  N:integer;
begin
  HLib:=0;
  try
    HLib:=LoadLibrary(PAnsiChar(DllName));
    if HLib>HINSTANCE_ERROR then
    begin
      DllFunc:=GetProcAddress(HLib, PAnsiChar( FunctonName ) );
      if Assigned( DllFunc ) then
        ParamFunct( DllFunc , paramFun)
      else
        ShowMessage('Dll Function '+FunctonName+' not found');
    end
     else
       ShowMessage('Can not load library '+DllName );
  finally
    if HLib > HINSTANCE_ERROR then FreeLibrary(HLib);
  end;
end;

function MyDllFunct( DllFunc : Pointer; paramFun:Pointer):boolean;
var Res:Integer;
begin
  Res:=-1;
  if  TCreateTrOrdFunc(DllFunc)(PMyParamDll(paramFun)^.AppHandle,PMyParamDll(paramFun)^.ATour,PMyParamDll(paramFun)^.AGroup,
   PMyParamDll(paramFun)^.AManager,PMyParamDll(paramFun)^.CreatePersons, Res) then


  PMyParamDll(paramFun)^.AnOrder:=Res;
end;


procedure TForm1.Button3Click(Sender: TObject);
var param:PMyParamDll;
begin
 try
   new(param);
   param.AppHandle := 0;
   param.ATour := 424;
   param.AGroup := 34433;
   param.AManager:=72;
   param.CreatePersons := true;

   ExecFunctDLL('OrderLib.dll', 'CreateNewTourOrder',  MyDllFunct , param );


   ShowMessage( IntToStr(param.AnOrder ));
 finally
   Dispose(param);
 end;  
end;

end.
