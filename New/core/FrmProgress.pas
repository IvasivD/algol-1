unit FrmProgress;

interface

uses
  Windows, Messages, Classes, SysUtils, Variants, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, UnitAnimationThreadProgress;

type
  TFormProgres = class(TForm)
    Bevel1: TBevel;
    ProgressBar: TProgressBar;
    PanelCaption: TPanel;
    LbProgres: TLabel;
    PanelProgressWait: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FProgresWait : TanimationThreadProgress;
  public
    MainCaption:WideString;
    FCanvasPanel:TControlCanvas;
    //currProgres:TProgressFormProp;

    { Public declarations }
  end;

  TProgressFormProp=record
    ProgressBar:TprogressBar;
    DetailProgressBar:TprogressBar;
    ProgressCaption:TLabel;
    StopProcess:Boolean;
    SbtProcessStop:TSpeedbutton;
    FormProgres: TFormProgres;
  end;

function  ShowProgress( Acaption:Widestring; Amax:Integer=-1; VarProgresFrm :TFormProgres=nil; ShowDetailProgres:Boolean=false ):TProgressFormProp;
procedure ShangeTitleProgres(Acaption:Widestring; aForm:TFormProgres );
function  ShowLockForm( ACaption:Widestring ):TProgressFormProp;
procedure ClosedProgress( aForm:TFormProgres=nil);

var
  FormProgres: TFormProgres;
  HThread :THandle;
  idThread:dword;
  ProgressTimer: TTimer;

  CurProgres:Integer;
  timer1: word = 0;
implementation
//uses Core;

{$R *.dfm}
function ShowProgress( Acaption:Widestring; Amax:Integer=-1; VarProgresFrm :TFormProgres=nil; ShowDetailProgres:Boolean=false ):TProgressFormProp;
var DetailProgres:TProgressBar;
begin
  if VarProgresFrm =  nil then VarProgresFrm := FormProgres;

  if VarProgresFrm=nil then
  begin
    Application.CreateForm(TFormProgres, FormProgres);
    VarProgresFrm := FormProgres;
  end
  else Application.CreateForm( TFormProgres, VarProgresFrm );

  if Amax<>-1 then
    VarProgresFrm.ProgressBar.Max     := Amax;
  VarProgresFrm.ProgressBar.Position  := 0;
  result.ProgressBar :=VarProgresFrm.ProgressBar;
  result.ProgressCaption:=VarProgresFrm.LbProgres;
  result.StopProcess:=false;
  result.FormProgres := VarProgresFrm;

  SetThreadLocale($419);
  VarProgresFrm.MainCaption:=ACaption;

  VarProgresFrm.LbProgres.Caption := ACaption;
  //*****************************************
  if Amax=-1 then
  begin
    VarProgresFrm.Width := VarProgresFrm.LbProgres.Width + 50 ;
    VarProgresFrm.Height:=20;
    CurProgres:=1;
    VarProgresFrm.LbProgres.left := VarProgresFrm.LbProgres.left + 4;

    VarProgresFrm.FProgresWait := TanimationThreadProgress.Create( VarProgresFrm.PanelProgressWait, 200, GetProgresValueChar );
    Application.ProcessMessages;
  end;
  //*****************************************
  if ShowDetailProgres then
  begin
    DetailProgres:=TProgressBar.Create(VarProgresFrm);
    DetailProgres.Align := alBottom;
    DetailProgres.Parent := VarProgresFrm;
    result.DetailProgressBar := DetailProgres;
    VarProgresFrm.Height:=95;
  end
  else result.DetailProgressBar:=nil;  
  //*****************************************
  VarProgresFrm.Show;
  VarProgresFrm.LbProgres.refresh;
  VarProgresFrm.LbProgres.repaint;
  VarProgresFrm.Repaint;
end;
//******************************************************************************
function ShowLockForm( ACaption:Widestring ):TProgressFormProp;
var Amax:Integer;
    r, r1: hRgn;
begin
 if FormProgres=nil then
    Application.CreateForm(TFormProgres, result.FormProgres);

  if result.FormProgres.FCanvasPanel = nil then
    result.FormProgres.FCanvasPanel := TControlCanvas.Create;

  result.FormProgres.Position:= poScreenCenter;
  result.FormProgres.Width := Application.MainForm.Width;
  result.FormProgres.Height := Application.MainForm.Height;

  result.FormProgres.Resize;
  result.FormProgres.Top := 0;
  result.FormProgres.Left :=  0;
  result.FormProgres.Realign;

  result.FormProgres.ProgressBar.Visible := false;

  //FormProgres.AlphaBlendValue := 170;
  //FormProgres.AlphaBlend := true;
  //FormProgres.Color := clGreen;
  //FormProgres.TransparentColorValue := clGreen;
  //FormProgres.TransparentColor := true;

  result.FormProgres.MainCaption := Acaption;
  result.FormProgres.LbProgres.Caption := Acaption;
  result.FormProgres.LbProgres.refresh;
  result.FormProgres.LbProgres.repaint;

  result.FormProgres.PanelCaption.Align := alNone;
  result.FormProgres.PanelCaption.Width := FormProgres.LbProgres.Width + 50;

  result.FormProgres.PanelCaption.Left := (result.FormProgres.Width div 2) - (result.FormProgres.PanelCaption.Width div 2);
  result.FormProgres.PanelCaption.Top  := (result.FormProgres.Height div 2) -(result.FormProgres.PanelCaption.Height div 2);
  result.FormProgres.PanelCaption.ParentColor := false;
  result.FormProgres.PanelCaption.ParentCtl3D := false;
  result.FormProgres.PanelCaption.FullRepaint := false;

  CurProgres:=1;
  result.FormProgres.Show;
end;
//******************************************************************************
procedure ShangeTitleProgres(Acaption:Widestring; aForm:TFormProgres );
begin
  if aForm=nil then exit;
  aForm.PanelCaption.Repaint;
  aForm.LbProgres.Caption:=Acaption;
  aForm.LbProgres.Repaint;
end;
//******************************************************************************
procedure ClosedProgress( aForm:TFormProgres=nil );
begin
 if aForm=nil then
 begin
   try
     FormProgres.free;
    // FreeandNil(FormProgres);
   finally
     //FormProgres:=nil;
   end;
 end
 else
 begin
   try
     if csDestroying in aForm.ComponentState then Exit;
     aForm.free;
     //FreeandNil(aForm);
   finally
     //aForm:=nil;
   end;
 end;
end;
//******************************************************************************
procedure TFormProgres.FormShow(Sender: TObject);
begin
  //if LbProgres.Visible then LbProgres.repaint;
end;

procedure TFormProgres.FormCreate(Sender: TObject);
begin
  FProgresWait:= nil;
  //ActiveFormBeforeEditData := screen.ActiveForm;
  //SetThreadLocale($419);
end;

procedure TFormProgres.FormDestroy(Sender: TObject);
begin
  if FProgresWait<> nil then FProgresWait.Free;
  //ActiveFormBeforeEditData:=nil;
end;

procedure TFormProgres.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action :=caFree;
end;

end.
