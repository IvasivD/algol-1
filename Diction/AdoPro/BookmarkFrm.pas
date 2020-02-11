unit BookmarkFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AzEdit, Buttons, ExtCtrls;

type
  TBookmarkForm = class(TForm)
    BookmarkLabel: TLabel;
    BookmarkEdit: TAzEdit;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  BookmarkForm: TBookmarkForm;
function ExecuteBookmarksDlg(var Bookmark_Name: string): Boolean;

implementation

uses TourCmnlIf;
{$R *.dfm}
function ExecuteBookmarksDlg(var Bookmark_Name: string): Boolean;
begin
  with TBookmarkForm.Create(Application) do
  try
    Result := ShowModal = mrOk;
    if Result then Bookmark_Name := BookmarkEdit.Text;
  finally
    Free;
  end;
end;

procedure TBookmarkForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  CanClose := Trim(BookmarkEdit.Text) <> EmptyStr;
  if not CanClose then ErrorDlg('Поле "Закладка" мусить бути вказане.');
end;

end.
