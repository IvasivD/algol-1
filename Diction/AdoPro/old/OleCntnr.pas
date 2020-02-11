unit OleCntnr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtnrs, ComCtrls, ExtCtrls, ToolWin, Menus;

type
  TOleContainerForm = class(TForm)
    TopToolPanel: TPanel;
    ContainerPanel: TPanel;
    OleContainer: TOleContainer;
    MainMenu: TMainMenu;
    FileMenu: TMenuItem;
    FileShellOpenItem: TMenuItem;
    BottomToolPanel: TPanel;
    FileSeparatorItem1: TMenuItem;
    FileCloseItem: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FileShellOpenItemClick(Sender: TObject);
    procedure FileCloseItemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FOleFileName: String;
    FIsPrnt: Boolean;
    procedure SetOleFileName(const Value: String);
    procedure VerbClick(Sender: TObject);
  public
    property OleFileName: String read FOleFileName write SetOleFileName;
  end;

var
  OleContainerForm: TOleContainerForm;

function ExecuteOleContainerForm(const FileName: String; IsPrnt: Boolean): Boolean;


implementation

uses TourCmnlIf, VDlgs, ServMod;

{$R *.dfm}

function ExecuteOleContainerForm(const FileName: String; IsPrnt: Boolean): Boolean;
begin
  with TOleContainerForm.Create(Application) do
    try
      OleFileName := FileName;
      FIsPrnt := IsPrnt;
      Result := OleContainer.State <> osEmpty;
      ShowModal;
    finally
      Free;
    end;
end;

{ TOleContainerForm }

procedure TOleContainerForm.SetOleFileName(const Value: String);
begin
  if FOleFileName <> Value then
  begin
    FOleFileName := Value;
    Caption := ExtractFileName(Value);
    {OleContainer.CreateObjectFromFile(Value, False);
    OleContainer.DoVerb(ovShow);}
  end;
end;

procedure TOleContainerForm.VerbClick(Sender: TObject);
begin
  with Sender as TMenuItem do
    OleContainer.DoVerb(OleContainer.ObjectVerbs.IndexOf(Caption));
end;

procedure TOleContainerForm.FormCreate(Sender: TObject);
begin
  Top := yClientWindow;
  Height := hClientWindow - Top;
end;

procedure TOleContainerForm.FormActivate(Sender: TObject);
{const
  wdPageFitBestFit = $00000002;}
var 
  I: Integer;
//  ev : OleVariant;
begin
  with OleContainer do
  begin
    CreateObjectFromFile(FOleFileName, False);
    DoVerb(ovShow);

    if (State <> osEmpty) and (ObjectVerbs.Count > 0) then
    begin
      FileMenu.Insert(0, NewLine);
      for I := 0 to ObjectVerbs.Count - 1 do
        FileMenu.Insert(I, NewItem(ObjectVerbs[I], 0, False, True, VerbClick, 0, ''));        
    end;
//    Ev := 2;
//    OleObject.Protect(Ev);
//    if not DMServ.CurManagerAdminPerms[nDictPartCompany] and not FIsPrnt
//    then OleObject.Protect(ev);    
  end;
end;

procedure TOleContainerForm.FileShellOpenItemClick(Sender: TObject);
begin
  //OleContainer.DoVerb();
  if DMServ.CurManagerAdminPerms[nDictPartCompany] then ShellOpenDocument(FOleFileName);
end;

procedure TOleContainerForm.FileCloseItemClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TOleContainerForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OleContainer.DestroyObject;
end;

end.
