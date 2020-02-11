unit InsKndSelDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZSelDlg, Db, DBTables, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  TInsureKindChooseDlg = class(TZSelectDlg)
    SelQryKINDID: TIntegerField;
    SelQryKINDNAME: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{var
  InsureKindChooseDlg: TInsureKindChooseDlg;}

function ExecuteInsureKindChooseDlg(var Knd: Integer): Boolean;


implementation

{$R *.DFM}

function ExecuteInsureKindChooseDlg(var Knd: Integer): Boolean;
begin
  with TInsureKindChooseDlg.Create(Application) do
    try
      KeyValue := Knd;
      Result := ShowModal = mrOk;
      Knd := KeyValue;
    finally
      Free;
    end;
end;

{ TInsureKindChooseDlg }

procedure TInsureKindChooseDlg.FormCreate(Sender: TObject);
begin
  inherited;
  KeyField := SelQryKINDID;
end;

end.
