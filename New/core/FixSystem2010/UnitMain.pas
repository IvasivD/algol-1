unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Rtti,UnitProc, StrUtils,UnitFrmTest;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function FindAnyClass(const Name: string): TClass;
var
  ctx: TRttiContext;
  typ: TRttiType;
  list: TArray<TRttiType>;
begin
  Result := nil;
  ctx := TRttiContext.Create;
  list := ctx.GetTypes;
  for typ in list do
    begin
      if (typ.IsInstance) and (EndsText(Name, typ.Name)) then
        begin
          Result := typ.AsInstance.MetaClassType;
          break;
        end;
    end;
  ctx.Free;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  ctx: TRttiContext;
  objType: TRttiType;
  Prop: TRttiProperty;

  Path:string;
  ClassesList:TStringList;
  i:integer;
  CRef : TPersistentClass;
  CurrClass : TClass;
   typ: TRttiType;
   CurrForm:TForm;
begin
  {ctx := TRttiContext.Create;
  objType := ctx.GetType(Obj.ClassInfo);
   for Prop in objType.GetProperties do
   if TRttiInstanceType(Prop.Parent).MetaclassType=TClassBase then
     Writeln(Format('The property %s is declarated in the TClassBase class',[Prop.Name]))
   else
     Writeln(Format('The property %s is not declarated in the TClassBase class',[Prop.Name]))}

  Path := ExtractFilePath( Application.ExeName );
  ClassesList := FindAllClassFrom( Path );
  Memo1.Lines.Text:= ClassesList.Text;
  for i:= 0 to ClassesList.Count-1 do
  begin
    {CurrClass:= FindAnyClass(ClassesList.Strings[i]);

    ctx := TRttiContext.Create;
    typ := ctx.FindType('Vcl.StdCtrls.'+ClassesList.Strings[i]);
    if (typ <> nil) and (typ.IsInstance) then c := typ.AsInstance.MetaClassType;
    ctx.Free; }



    CurrClass:= FindAnyClass(ClassesList.Strings[i]);
    if CurrClass<>nil then
    begin
      Application.CreateForm(TComponentClass( CurrClass ), CurrForm );
      //if
      CurrClass.Create;// is TForm then
      //  CurrForm := TForm(CurrClass).Create(self);

      //RegisterClass(TPersistentClass( CurrClass) );
      //CRef := GetClass(ClassesList.Strings[i]);
      //if CRef = nil then RegisterClass(TPersistentClass( CurrClass) );
    end;
  end;
  ClassesList.Free;
  Memo1.Lines.Add('------------');
  for I := 0 to Application.ComponentCount - 1 do
  begin
    Memo1.Lines.Add( Application.Components[i].ClassName );
  end;


end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Application.CreateForm(TFrmTest, FrmTest);
  FrmTest.showModal;
  FrmTest.Free;
end;

end.
