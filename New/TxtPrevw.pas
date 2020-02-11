unit TxtPrevw;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, DBCtrls, Menus, DB;

type
  TTextPreviewForm = class(TForm)
    DBRichEdit: TDBRichEdit;
    PopupMenu: TPopupMenu;
    CloseItem: TMenuItem;
    procedure CloseItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{var
  TextPreviewForm: TTextPreviewForm;}
                                                                         
procedure ShowTextPreviewForm(DataSrc: TDataSource; const FieldName: String);


implementation

{$R *.DFM}

procedure ShowTextPreviewForm(DataSrc: TDataSource; const FieldName: String);
begin
  with TTextPreviewForm.Create(Application) do
    try
      DBRichEdit.DataSource := DataSrc;
      DBRichEdit.DataField := FieldName;
      ShowModal;
    finally
      Free;
    end;
end;

{ TTextPreviewForm }

procedure TTextPreviewForm.CloseItemClick(Sender: TObject);
begin
  Close;
end;

end.
