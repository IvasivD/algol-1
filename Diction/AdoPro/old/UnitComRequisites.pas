unit UnitComRequisites;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, UnitFrameComRequisites;

type
  TFrmRequisites = class(TForm)
    ModalPanel: TPanel;
    CancelBtn: TBitBtn;
    FrameComRequisites: TFrameComRequisites;
    procedure CancelBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  Procedure ShowUpdateRequisites( Caption:string; ParamFrame:TParamComRequisitesFrame; CanUpdate :Boolean; CurrManager:Integer; FCurManagerName:Widestring );
var
  FrmRequisites: TFrmRequisites;

implementation

{$R *.dfm}

Procedure ShowUpdateRequisites( Caption:string; ParamFrame:TParamComRequisitesFrame; CanUpdate :Boolean; CurrManager:Integer; FCurManagerName:Widestring );
begin
  try
    Application.CreateForm(TFrmRequisites, FrmRequisites);

    FrmRequisites.Caption := Caption;

    FrmRequisites.FrameComRequisites.IntitComRquisitesFrame( ParamFrame, CanUpdate, CurrManager,  FCurManagerName );
    FrmRequisites.FrameComRequisites.FrameRequsiteCompanyPayState.SetEnabled( ParamFrame.ElemCompanyQry.DBBooleanValue['ISENTERPR'],
                                                                             ( ParamFrame.ElemCompanyQry.DBBooleanValue['ASRESIDENT']) or
                                                                             ( ParamFrame.ElemCompanyQry.DB.FieldByName('ASRESIDENT').IsNull ) , False );



    FrmRequisites.FrameComRequisites.ReQueryAllDbOffice;
    FrmRequisites.FrameComRequisites.RefreshControls;
    FrmRequisites.ShowModal;
  finally
    FrmRequisites.FrameComRequisites.DestroyFrame;
    FrmRequisites.Free;
  end;
end;


procedure TFrmRequisites.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

end.
