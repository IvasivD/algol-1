Unit DMSoapData;

interface

uses SysUtils, Classes, InvokeRegistry, Midas, SOAPMidas, SOAPDm, Provider,
  DB, ADODB, DBClient,UnitProc;

type
  ISoapDM = interface(IAppServerSOAP)
    ['{8792B959-43B9-423D-A454-614A64F1C394}']
  end;

  TSoapDM = class(TSoapDataModule, ISoapDM, IAppServerSOAP, IAppServer)
    ADOConnection: TADOConnection;
    DSPBanks: TDataSetProvider;
    ADOBank: TADODataSet;
    procedure ADOBanksAfterPost(DataSet: TDataSet);
    procedure DSPBanksAfterApplyUpdates(Sender: TObject;
      var OwnerData: OleVariant);
    procedure SoapDataModuleCreate(Sender: TObject);
  private
    procedure prepareDM(DM:TSoapDataModule);
    procedure AddToLogFile(aText:String);
  public

  end;

implementation

{$R *.DFM}

procedure TSoapDMCreateInstance(out obj: TObject);
begin
 obj := TSoapDM.Create(nil);
end;

procedure TSoapDM.AddToLogFile(aText:String);
var aList:TStringList;
    Path:string;
begin
  try
    aList:=TStringList.Create;
    Path := MyGetModulePath;
    aList.Add(aText);
    aList.SaveToFile( Path+'log.txt' );
  finally
    aList.Free;
  end;
end;

procedure TSoapDM.ADOBanksAfterPost(DataSet: TDataSet);

begin
  AddToLogFile('After Pos');

end;

procedure TSoapDM.DSPBanksAfterApplyUpdates(Sender: TObject;
  var OwnerData: OleVariant);
begin
    AddToLogFile('After Apply');
end;

procedure TSoapDM.prepareDM(DM: TSoapDataModule);
var i:Integer;
    Ds:TADODataSet;
    DSP:TDataSetProvider;
begin
  for i:=0 to DM.ComponentCount - 1 do
  begin
    if DM.Components[i] is TADODataSet then
    begin
      Ds := TADODataSet.Create( self );
      Ds.Assign( DM.Components[i] );
    end;

    if DM.Components[i] is TDataSetProvider then
    begin
      DSP := TDataSetProvider.Create( self );
      DSP.Assign( DM.Components[i] );
    end;
  end;
end;

procedure TSoapDM.SoapDataModuleCreate(Sender: TObject);
begin
  //prepareDM( DMDic );
end;

initialization
   InvRegistry.RegisterInvokableClass(TSoapDM, TSoapDMCreateInstance);
   InvRegistry.RegisterInterface(TypeInfo(ISoapDM));
end.
