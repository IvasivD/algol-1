unit PrcntDlg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Buttons, ExtCtrls, Mask;

type
  TPersonPaymentDlg = class(TForm)
    PaymentPanel: TPanel;
    Label7: TLabel;
    Label18: TLabel;
    CtrlPanel: TPanel;
    ErrorLabel: TLabel;
    OkBtn: TBitBtn;
    CancelBtn: TBitBtn;
    Panel1: TPanel;
    DBCalcName: TDBText;
    DBBirthDate: TDBText;
    TouristEditBtn: TSpeedButton;
    RadioGroup1: TRadioGroup;
    ServicePanel: TPanel;
    StaticText1: TStaticText;
    RateStaticText: TStaticText;
    PaymentStaticText: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    RadioGroup2: TRadioGroup;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    CurrStaticText2: TStaticText;
    CurrStaticText3: TStaticText;
    CurrStaticText1: TStaticText;
    DBMemo1: TDBMemo;
    Label3: TLabel;
    Label4: TLabel;
    DBMemo2: TDBMemo;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PersonPaymentDlg: TPersonPaymentDlg;

implementation

uses DataMod;

{$R *.DFM}

end.
