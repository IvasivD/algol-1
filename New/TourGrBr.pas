unit TourGrBr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ZTBrws, ActnList, Db, StdCtrls, ComCtrls, DBCtrls, Grids, DBGrids,
  ExtCtrls, Buttons, ToolWin;

type
  TTourGroupBrowseForm = class(TZTourBrowseForm)
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TourGroupBrowseForm: TTourGroupBrowseForm;

implementation

uses DataMod;

{$R *.DFM}

procedure TTourGroupBrowseForm.FormActivate(Sender: TObject);
begin       
  with DM do UpdateQuery(GroupQry);
  inherited;
end;

end.
