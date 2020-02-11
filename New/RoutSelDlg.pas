unit RoutSelDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms, StdCtrls, Buttons,
  ExtCtrls, Grids, DBGrids;

type
  TRouteChooseDlg = class(TForm)
    RouteDBGrid: TDBGrid;
    Panel2: TPanel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure RouteDBGridTitleClick(Column: TColumn);
    procedure RouteDBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure RouteDBGridDblClick(Sender: TObject);
  private
    procedure UpdateSelectQuery(RouteId: Longint);
  end;

{var
  RouteChooseDlg: TRouteChooseDlg;}

function ExecuteChooseRouteDlg(At: TPoint; var RouteId: Longint): Boolean;


implementation

uses DB, Graphics, DataMod, VDlgs, OptSet;

{$R *.DFM}

function ExecuteChooseRouteDlg(At: TPoint; var RouteId: Longint): Boolean;
begin
  with TRouteChooseDlg.Create(Application) do
    try
    begin
      Left := Pred(At.x);
      Top := Pred(At.y);
      UpdateSelectQuery(RouteId);
      Result := ShowModal = mrOk;
      if Result then RouteId := DM.RouteSelQryRouteId.AsInteger;
    end;
  finally
    Free;
  end;
end;

{ TRouteChooseDlg }

procedure TRouteChooseDlg.UpdateSelectQuery(RouteId: Integer);
begin
  with DM do
  begin
    UpdateQuery(RouteSelQry);
    RouteSelQry.Locate('RouteId', RouteId, []);
  end;
end;

procedure TRouteChooseDlg.FormCreate(Sender: TObject);
begin
  ScaleDBGridColumns(RouteDBGrid);
end;

procedure TRouteChooseDlg.RouteDBGridTitleClick(Column: TColumn);
var Id: longint;
begin
  if Column.FieldName = 'CalcTransit' then Exit;
  Screen.Cursor := crHourglass;
  Id := DM.RouteSelQryRouteId.AsInteger;
  with DM.RouteSelQry do
    try
      Close;
      SQL[6] := Format('ORDER BY %s', [Column.FieldName]);
      Prepare;
      Open;
      Locate('RouteId', Id, []);
    finally
      Screen.Cursor := crDefault;
    end;
end;

procedure TRouteChooseDlg.RouteDBGridDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if State = [] then
    with (Sender as TDBGrid).Canvas do
    begin
      Brush.Style := bsSolid;
      if DM.RouteSelQryStranger.AsBoolean
        then Brush.Color := OptionSet.Colors[optViewGrids + 1]
        else Brush.Color := (Sender as TDBGrid).Color;
      FrameRect(Rect);
    end;
  (Sender as TDBGrid).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TRouteChooseDlg.RouteDBGridDblClick(Sender: TObject);
begin
  OkBtn.Click;
end;

end.
