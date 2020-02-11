unit KeyQueryDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZDlg, StdCtrls, Buttons, ExtCtrls;

type
  TZDialog1 = class(TZDialog)
    PromptLabel: TLabel;
    Edit: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ZDialog1: TZDialog1;

implementation

{$R *.dfm}

end.
