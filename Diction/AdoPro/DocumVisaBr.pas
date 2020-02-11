unit DocumVisaBr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdActns, ActnList, Menus, DB, StdCtrls, Buttons,
  ComCtrls, ExtCtrls, Mask, DBCtrls, DBTables, AzComboBox, Grids, 
  IBTable, IBCustomDataSet, IBQuery,UnitProjectProc;

type
  TDocumVisaEditDlg = class(TForm)
    LinkQry: TIBQuery;
    LinkQryLINK: TStringField;
    LinkSrc: TDataSource;
    LinkQryTypeName: TStringField;
    LinkQryTYPEID: TIntegerField;
    LinkQryVISADOCLINKID: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure TypeDocComboBoxChange(Sender: TObject);
    procedure LinksDBGridDblClick(Sender: TObject);
    procedure BtnClick(Sender: TObject);
  private
    { Private declarations }
    procedure UpdateBtn;
  public
    { Public declarations }
  protected
    procedure PrepareDataFields;
    procedure StoreDataFields;
  end;

var
  DocumVisaEditDlg: TDocumVisaEditDlg;

function EditDocumVisaRecord(EditState: Integer): Boolean;
function AppendDocumVisaRecord: Boolean;

implementation

uses ServMod, OrderUn;

{$R *.dfm}
function EditDocumVisaRecord(EditState: Integer): Boolean;
begin
 { with TDocumVisaEditDlg.Create(Application) do
    try
      Result := ShowRecord(EditState);
    finally
      Free;
    end;  }
end;

function AppendDocumVisaRecord: Boolean;
begin
  Result := EditDocumVisaRecord(remStateAppend);
end;                                   

procedure TDocumVisaEditDlg.FormCreate(Sender: TObject);
begin
  inherited;
 // NameFieldName := 'VIEWNAME';
 // MemoFieldName := 'MEMO';
 // NameEditControl := DBDocumName;
end;

procedure TDocumVisaEditDlg.FormActivate(Sender: TObject);
begin
  inherited;
  //DBCategory.Text := IntToStr(nDictPartDocumVisa);
  //DMServ.FHiperLink := EmptyStr;
  //UpdateBtn;
end;

procedure TDocumVisaEditDlg.PrepareDataFields;
begin
  inherited;
  //UpdateQuery(LinkQry);
  //UpdateBtn;
end;

procedure TDocumVisaEditDlg.StoreDataFields;
begin
  inherited;
//  DMServ.FHiperLink := LinkEdit.Text
end;

procedure TDocumVisaEditDlg.TypeDocComboBoxChange(Sender: TObject);
begin
  inherited;
//  AddBtn.Enabled := (LinkEdit.Text <> EmptyStr) and (TypeDocComboBox.ItemIndex >= 0);
end;

procedure TDocumVisaEditDlg.LinksDBGridDblClick(Sender: TObject);
begin
  inherited;
  //with EditBtn do if Enabled then Click;
end;

procedure TDocumVisaEditDlg.BtnClick(Sender: TObject);
begin
 { inherited;
  case (Sender as TSpeedButton).Tag of
  0: ExecuteEditLink(EmptyStr, 0, 0);
  1: ExecuteEditLink(LinkQryLINK.Value, LinkQryTYPEID.Value, LinkQryVISADOCLINKID.Value);
  2: with DMServ.UpdLinkProc do
     begin
        ParamByName('DocId').DataType := ftInteger;
        ParamByName('TypeId').DataType := ftInteger;
        ParamByName('Link').DataType := ftString;
        ParamByName('DelLink').Value := 'T';
        ParamByName('VisaDocLinkId').Value := LinkQryVisaDocLinkId.Value;
        ExecProc;
     end
  end;
  UpdateQueryEx(LinkQry);
  UpdateBtn; }
end;

procedure TDocumVisaEditDlg.UpdateBtn;
var En: Boolean;
begin
 { En := (LinkQry.RecordCount > 0) and OkBtn.Enabled;
  EditBtn.Enabled := En;
  DelBtn.Enabled := En; }
end;

end.
