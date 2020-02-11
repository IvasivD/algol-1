unit UnitEditText;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls ,UnitProc, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxTextEdit, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, Buttons;

type
  TFrmEditText = class(TForm)
    MemoText: TMemo;
    Panel1: TPanel;
    ButOk: TBitBtn;
    ButCancel: TBitBtn;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

function ShowEditText(Atext:Widestring;aCaptionFrm:String=''):widestring;

var
  FrmEditText: TFrmEditText;

implementation

{$R *.dfm}
//******************************************************************************
function ShowEditText(Atext:Widestring;aCaptionFrm:String=''):widestring;
begin
 try
   Application.CreateForm(TFrmEditText, FrmEditText);

   FrmEditText.MemoText.Text:=Atext;
   if aCaptionFrm<>''
      then FrmEditText.Caption:= aCaptionFrm;
   //***************************************
   if FrmEditText.ShowModal = mrOK then
     result:=FrmEditText.MemoText.Text
   else result:='^';
 finally
   freeAndNil(FrmEditText);
 end;
end;
//******************************************************************************
procedure TFrmEditText.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=VK_ESCAPE then
    ButCancel.Click;
end;

end.
