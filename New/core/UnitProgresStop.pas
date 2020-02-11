unit UnitProgresStop;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ComCtrls, StdCtrls, ExtCtrls,UnitProc;

type
  TFrmProgresBarStop = class(TForm)
    Panel1: TPanel;
    ProgressBar: TProgressBar;
    Panel2: TPanel;
    ButStopProgress: TSpeedButton;
    LbTitle: TLabel;
    Panel3: TPanel;
    procedure ButStopProgressClick(Sender: TObject);
  private
    FMessageAskForStopActProgres:Widestring;
    CanContinue:Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;
 function  ShowProgres(Caption:Widestring;MessageAskForStopActProgres:Widestring):TProgressBar;
 procedure HideProgres;
 function  CanContinueProgresAction:Boolean;
 procedure SetCurrTitleProgresAction(aText:Widestring);

var
  FrmProgresBarStop: TFrmProgresBarStop;

implementation

{$R *.dfm}
//******************************************************************************
function ShowProgres(Caption:Widestring;MessageAskForStopActProgres:Widestring):TProgressBar;
begin
  Application.CreateForm( TFrmProgresBarStop , FrmProgresBarStop );
  FrmProgresBarStop.FMessageAskForStopActProgres := MessageAskForStopActProgres;
  FrmProgresBarStop.CanContinue := True;
  FrmProgresBarStop.Caption     := Caption;
  result:=FrmProgresBarStop.ProgressBar;

  FrmProgresBarStop.Left:= (Screen.Width div 2)-(FrmProgresBarStop.Width div 2);
  FrmProgresBarStop.Top := (Screen.Height div 2) -FrmProgresBarStop.Height*2;

  FrmProgresBarStop.Show;
end;
//******************************************************************************
procedure HideProgres;
begin
 if FrmProgresBarStop <> nil then
 begin
   FrmProgresBarStop.Free;
   FrmProgresBarStop:=nil;
 end;  
end;
//******************************************************************************
procedure TFrmProgresBarStop.ButStopProgressClick(Sender: TObject);
begin
  if MyShowMessageDlg( FMessageAskForStopActProgres, mtConfirmation, but_YES_NO ) = Res_YES then
   CanContinue:=False;
end;
//******************************************************************************
function CanContinueProgresAction:Boolean;
begin
 if FrmProgresBarStop<> nil then
   result:=FrmProgresBarStop.CanContinue
 else result:=false;
end;
//******************************************************************************
procedure SetCurrTitleProgresAction(aText:Widestring);
begin
 if FrmProgresBarStop<> nil then
   FrmProgresBarStop.LbTitle.Caption := aText;
end;

end.

