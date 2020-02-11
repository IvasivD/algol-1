unit CntrySelDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZSelDlg, Db, DBTables, StdCtrls, Buttons, ExtCtrls, Grids, DBGrids;

type
  TCountryChooseDlg = class(TZSelectDlg)
    SelQryCOUNTRYID: TIntegerField;
    SelQryNAME: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

{var
  CountrySelectDlg: TCountrySelectDlg;}
  
function ExecuteCountryChooseDlg(var Cntry: Integer): Boolean;


implementation

{$R *.DFM}

function ExecuteCountryChooseDlg(var Cntry: Integer): Boolean;
begin
  with TCountryChooseDlg.Create(Application) do
    try
      KeyValue := Cntry;
      Result := ShowModal = mrOk;
      Cntry := KeyValue;
    finally
      Free;
    end;
end;

{ TCountryChooseDlg }

procedure TCountryChooseDlg.FormCreate(Sender: TObject);
begin
  inherited;
  KeyField := SelQryCOUNTRYID;
end;

end.
