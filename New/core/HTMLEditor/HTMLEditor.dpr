program HTMLEditor;

uses
  Forms,
  UnitMain in 'UnitMain.pas' {FrmHtmlEditor},
  IeConst in 'IeConst.pas',
  UnitHTMLEditor in 'UnitHTMLEditor.pas',
  UnitProc in '..\UnitProc.pas',
  SetTable in 'SetTable.pas' {FrmSetTable},
  SelectFor in 'SelectFor.pas' {FrmSelectFor},
  EditPicture in 'EditPicture.pas' {FrmEditPicture},
  ProperFlash in 'ProperFlash.pas' {Frm_ProperFlash},
  UnitInsertHyperLink in 'UnitInsertHyperLink.pas' {FrmInsertHyperLink},
  UnitHTMLCodeEditor in 'UnitHTMLCodeEditor.pas',
  SetFrame in 'SetFrame.pas' {FrmUpdateIFrame},
  UnitFrameHTMLEditor in 'UnitFrameHTMLEditor.pas' {FrameHTMLEditor: TFrame},
  UnitSelICon in 'UnitSelICon.pas' {FrmSelICon};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrmHtmlEditor, FrmHtmlEditor);
  FrmHtmlEditor.SetParam( ParamStr(1), ParamStr(2), ParamStr(3) );

  //FrmHtmlEditor.LoadAutoFile:=(ParamStr(1));
  //FrmHtmlEditor.SaveOptFile:=(ParamStr(2));
  //FrmHtmlEditor.PathToImage:=(ParamStr(3));


  Application.Run;
end.
