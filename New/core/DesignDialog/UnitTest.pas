unit UnitTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ImgList, ExtCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans,
  dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinPumpkin, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSilver,
  dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
  cxGridCustomTableView, cxGridCardView, cxGridCustomLayoutView, cxGrid,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridTableView,
  cxGridDBTableView, cxContainer, cxCheckListBox, cxGroupBox, cxRadioGroup, 
  ComCtrls, Buttons, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxGridBandedTableView;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ImageList: TImageList;
    ilMain: TImageList;
    btn1: TButton;
    btn2: TButton;
    ImageListBut: TImageList;
    cxDateEdit1: TcxDateEdit;
    LSheet: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    cxStyle48: TcxStyle;
    cxStyle49: TcxStyle;
    cxStyle50: TcxStyle;
    cxStyle51: TcxStyle;
    cxStyle52: TcxStyle;
    cxStyle53: TcxStyle;
    cxStyle54: TcxStyle;
    cxStyle55: TcxStyle;
    cxStyle56: TcxStyle;
    cxStyle57: TcxStyle;
    cxStyle58: TcxStyle;
    cxStyle59: TcxStyle;
    cxStyle60: TcxStyle;
    cxStyle61: TcxStyle;
    cxStyle62: TcxStyle;
    cxStyle63: TcxStyle;
    cxStyle64: TcxStyle;
    cxStyle65: TcxStyle;
    cxStyle66: TcxStyle;
    cxStyle67: TcxStyle;
    cxStyle68: TcxStyle;
    cxStyle69: TcxStyle;
    cxStyle70: TcxStyle;
    cxStyle71: TcxStyle;
    cxStyle72: TcxStyle;
    cxStyle73: TcxStyle;
    cxStyle74: TcxStyle;
    cxStyle75: TcxStyle;
    cxStyle76: TcxStyle;
    cxStyle77: TcxStyle;
    cxStyle78: TcxStyle;
    cxStyle79: TcxStyle;
    cxStyle80: TcxStyle;
    cxStyle81: TcxStyle;
    cxStyle82: TcxStyle;
    cxStyle83: TcxStyle;
    cxStyle84: TcxStyle;
    cxStyle85: TcxStyle;
    cxStyle86: TcxStyle;
    cxStyle87: TcxStyle;
    cxStyle88: TcxStyle;
    cxStyle89: TcxStyle;
    cxStyle90: TcxStyle;
    cxStyle91: TcxStyle;
    cxStyle92: TcxStyle;
    cxStyle93: TcxStyle;
    cxStyle94: TcxStyle;
    cxStyle95: TcxStyle;
    cxStyle96: TcxStyle;
    cxStyle97: TcxStyle;
    cxStyle98: TcxStyle;
    cxStyle99: TcxStyle;
    cxStyle100: TcxStyle;
    cxStyle101: TcxStyle;
    cxStyle102: TcxStyle;
    cxStyle103: TcxStyle;
    cxStyle104: TcxStyle;
    cxStyle105: TcxStyle;
    cxStyle106: TcxStyle;
    cxStyle107: TcxStyle;
    cxStyle108: TcxStyle;
    cxStyle109: TcxStyle;
    cxStyle110: TcxStyle;
    cxStyle111: TcxStyle;
    cxStyle112: TcxStyle;
    cxStyle113: TcxStyle;
    cxStyle114: TcxStyle;
    cxStyle115: TcxStyle;
    cxStyle116: TcxStyle;
    cxStyle117: TcxStyle;
    cxStyle118: TcxStyle;
    cxStyle119: TcxStyle;
    cxStyle120: TcxStyle;
    cxStyle121: TcxStyle;
    cxStyle122: TcxStyle;
    cxStyle123: TcxStyle;
    cxStyle124: TcxStyle;
    cxStyle125: TcxStyle;
    cxStyle126: TcxStyle;
    cxStyle127: TcxStyle;
    cxStyle128: TcxStyle;
    cxStyle129: TcxStyle;
    cxStyle130: TcxStyle;
    cxStyle131: TcxStyle;
    cxStyle132: TcxStyle;
    cxStyle133: TcxStyle;
    cxStyle134: TcxStyle;
    cxStyle135: TcxStyle;
    cxStyle136: TcxStyle;
    cxStyle137: TcxStyle;
    cxStyle138: TcxStyle;
    cxStyle139: TcxStyle;
    cxStyle140: TcxStyle;
    cxStyle141: TcxStyle;
    cxStyle142: TcxStyle;
    cxStyle143: TcxStyle;
    cxStyle144: TcxStyle;
    cxStyle145: TcxStyle;
    cxStyle146: TcxStyle;
    cxStyle147: TcxStyle;
    cxStyle148: TcxStyle;
    cxStyle149: TcxStyle;
    cxStyle150: TcxStyle;
    cxStyle151: TcxStyle;
    cxStyle152: TcxStyle;
    cxStyle153: TcxStyle;
    cxStyle154: TcxStyle;
    cxStyle155: TcxStyle;
    cxStyle156: TcxStyle;
    cxStyle157: TcxStyle;
    cxStyle158: TcxStyle;
    cxStyle159: TcxStyle;
    cxStyle160: TcxStyle;
    cxStyle161: TcxStyle;
    cxStyle162: TcxStyle;
    cxStyle163: TcxStyle;
    cxStyle164: TcxStyle;
    cxStyle165: TcxStyle;
    cxStyle166: TcxStyle;
    cxStyle167: TcxStyle;
    cxStyle168: TcxStyle;
    cxStyle169: TcxStyle;
    cxStyle170: TcxStyle;
    cxStyle171: TcxStyle;
    cxStyle172: TcxStyle;
    cxStyle173: TcxStyle;
    cxStyle174: TcxStyle;
    cxStyle175: TcxStyle;
    cxStyle176: TcxStyle;
    cxStyle177: TcxStyle;
    cxStyle178: TcxStyle;
    cxStyle179: TcxStyle;
    cxStyle180: TcxStyle;
    cxStyle181: TcxStyle;
    cxStyle182: TcxStyle;
    cxStyle183: TcxStyle;
    cxStyle184: TcxStyle;
    cxStyle185: TcxStyle;
    cxStyle186: TcxStyle;
    cxStyle187: TcxStyle;
    cxStyle188: TcxStyle;
    cxStyle189: TcxStyle;
    cxStyle190: TcxStyle;
    cxStyle191: TcxStyle;
    cxStyle192: TcxStyle;
    cxStyle193: TcxStyle;
    cxStyle194: TcxStyle;
    cxStyle195: TcxStyle;
    cxStyle196: TcxStyle;
    cxStyle197: TcxStyle;
    cxStyle198: TcxStyle;
    cxStyle199: TcxStyle;
    cxStyle200: TcxStyle;
    cxStyle201: TcxStyle;
    cxStyle202: TcxStyle;
    cxStyle203: TcxStyle;
    cxStyle204: TcxStyle;
    cxStyle205: TcxStyle;
    cxStyle206: TcxStyle;
    cxStyle207: TcxStyle;
    cxStyle208: TcxStyle;
    cxStyle209: TcxStyle;
    cxStyle210: TcxStyle;
    cxStyle211: TcxStyle;
    cxStyle212: TcxStyle;
    DBCardStyle: TcxGridCardViewStyleSheet;
    DBBandedStyle: TcxGridBandedTableViewStyleSheet;
    DBOtherStyle: TcxGridBandedTableViewStyleSheet;
    DBMonitorStyle: TcxGridBandedTableViewStyleSheet;
    GridTableViewStyle: TcxGridTableViewStyleSheet;
    MyStyle: TcxGridTableViewStyleSheet;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure cxCheckListBox1ClickCheck(Sender: TObject; AIndex: Integer;
      APrevState, ANewState: TcxCheckBoxState);
    procedure cxCheckListBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses DesignDialog;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var aDialog:TDesignDialog;
    res:TDialogTextResult;
begin
 try
  aDialog:=TDesignDialog.Create('Мій діалог','c&Заголоок Діалога',0,['Так','Ні','Відмінити','може бути']);
  aDialog.setImageListButton(ImageListBut , [0,1,-1,3]);

  res:=aDialog.ShowDialog;

 finally
  aDialog.Free;
 end;
end;
//******************************************************************************
procedure TForm1.Button2Click(Sender: TObject);
var aDialog:TDesignDialogText;
    aTextAtantion:array[0..2] of string;
    aText:array[0..2] of string;
    blkText : TArrBlockText;
    currBlk: TBlockText;
    res:TDialogTextResult;

begin
 try

  AddToBlockText(blkText, 'r&Увага!', 'l&Стрічка 1{img:0}'+ #13+' sfsfs fsfi ewiyweiruwieo acid{img:1}acid roueworuweoir '+#13+'sf sf sdf '+#13+#13 ,
                           taCenter , 5 ,clGreen,clBlack, 10 );
  AddToBlockText(blkText, '', 'c&Стрічка 2'+ #13+' sfsfs fsfi ewiyweiruwieo acid{img:0}acid roueworuweoir '+#13+'sf sf sdf' ,
                           taCenter , 2 );
  AddToBlockText(blkText, 'r&Увага!', 'l&Стрічка 3'+ #13+' sfsfs fsfi ewiyweiruwieo acid{img:0}acid roueworuweoir '+#13+'sf sf sdf' ,
                           taCenter , 0, clRed,clBlack,10);
  AddToBlockText(blkText, 'r&Увага!', 'l&Стрічка 1{img:0}'+ #13+' sfsfs fsfi ewiyweiruwieo acid{img:0}acid roueworuweoir '+#13+'sf sf sdf' ,
                           taCenter , 0 ,clRed,clBlack,10 );
  AddToBlockText(blkText, '', 'c&Стрічка 2'+ #13+' sfsfs fsfi ewiyweiruwieo acid{img:0}acid roueworuweoir '+#13+'sf sf sdf' ,
                           taCenter , 0 );
  AddToBlockText(blkText, 'r&Увага!', 'l&Стрічка 3'+ #13+' sfsfs fsfi ewiyweiruwieo acid{img:0}acid roueworuweoir '+#13+'sf sf sdf' ,
                           taCenter , 0, clRed,clBlack,10);

  aDialog:=TDesignDialogText.Create('Мій діалог','l&'+'Заголоок Діалога'+#13+'Line2', blkText,  0,['Так','Ні','Відмінити','може бути']);
  aDialog.setImageList(ilMain);
  aDialog.setImageListIcon(ImageList);
  aDialog.setCaptionLayout(tlBottom);
  
  currBlk.PrefixText:='r&Увага!';
  currBlk.MessageStr:='l&Стрічка 4 {img:0}'+#13+' sfsfs fsfi ewiyweiruwieour acid{img:0}acid oweuroueworuweoir ew '+#13+' sf sf sdf';
  //currBlk.Height:=50;
  currBlk.Alignment  :=taCenter;
  currBlk.FontSize   :=8;
  currBlk.FontColor  :=clNavy;
  currBlk.FontColorPrefix:=clRed;

  aDialog.addBlockText( currBlk );
  aDialog.setImageListButton(ImageListBut , []);
  aDialog.setImageIndexButton([0,1,-1,3]);

  res:=aDialog.ShowDialog;
 finally
  aDialog.Free;
 end;
end;

procedure TForm1.btn1Click(Sender: TObject);
var aDialog:TDesignDialogCheck;
    arrayBlock:TArrBlockCheck;
    res:TDialogCheckResult;
    blkText:TArrBlockText;

begin

 try
  AddToBlockCheck(arrayBlock , 0, 'Line 1 Radio',cbsChecked,True,0 );
  AddToBlockCheck(arrayBlock , 1, 'Line 2 Radio',cbsUnChecked,True,1  );
  AddToBlockCheck(arrayBlock , 2, 'Line 3 Radio',cbsUnChecked,false,1  );

  aDialog:=TDesignDialogCheck.Create('Мій діалог','l&Заголоок Діалога', arrayBlock,  0,['Так','Ні','Відмінити','може бути']);
  aDialog.setImageListIcon(ImageList);
  
  aDialog.setImageListButton(ImageListBut , [0,1,-1,3]);
  //AddToBlockText(blkText, '', 'l&Чи ви дійсно бажаєте видаити ?{img:0}',  taCenter , 2 );
   AddToBlockText(blkText, '', 'l&Стрічка 3'+ ' sfsfs fsfi ewiyweiruwieo acid{img:0}acid roueworuweoir ',
                           taCenter , 0, clRed,clBlack,10);

  aDialog.addTextbloc(blkText);


  res:=aDialog.ShowDialog;

  ShowMessage( IntToStr(res.button) +' '+boolToStr(res.ChBx[0].check) );
 finally
   aDialog.Free;

 end;
end;

procedure TForm1.btn2Click(Sender: TObject);
var aDialog:TDesignDialogRadio;
    arrayBlock:TArrBlockCheck;
    res:TDialogRadioResult;
    blkText:TArrBlockText;
begin

 try
 

  AddToBlockCheck(arrayBlock , 0, 'Line 1 Radio',cbsChecked,True,0 );
  AddToBlockCheck(arrayBlock , 1, 'Line 2 Radio',cbsUnChecked,false,1  );
  AddToBlockCheck(arrayBlock , 2, 'Line 3 Radio',cbsUnChecked,True,1  );
  //************************************
  AddToBlockText(blkText, 'r&Увага!', 'l&Стрічка 1{img:0}'+ #13+' sfsfs fsfi ewiyweiruwieo acid{img:0}acid roueworuweoir '+#13+'sf sf sdf '+#13+#13 ,
                           taCenter , 5 ,clGreen,clBlack, 10 );
  AddToBlockText(blkText, '', 'l&Стрічка 2'+ #13+' sfsfs fsfi ewiyweiruwieo acid{img:0}acid roueworuweoir '+#13+'sf sf sdf' ,
                           taCenter , 2 );


  aDialog:=TDesignDialogRadio.Create('Мій діалог','l&Заголоок Діалога', arrayBlock,  0,['Так','Ні','Відмінити','може бути']);
  aDialog.setImageListIcon(ImageList);
  aDialog.addTextbloc(blkText);
  aDialog.setCaptionLayout(tlTop);

  aDialog.setImageListButton(ImageListBut , [0,1,-1,3]);
  res:=aDialog.ShowDialog;

  ShowMessage( IntToStr(res.button) +' '+ IntToStr( res.selectKey ) );
 finally
   aDialog.Free;

 end;
end;

procedure TForm1.cxCheckListBox1ClickCheck(Sender: TObject;
  AIndex: Integer; APrevState, ANewState: TcxCheckBoxState);
var a:String;
begin

end;

procedure TForm1.cxCheckListBox1DrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  Bitmap: TBitmap;      { Temporary variable for the item?s bitmap }
  Offset: Integer;      { Text offset width }
begin
  Bitmap := TBitmap.Create;
  with (Control as TcxCheckListBox).Canvas do  { Draw on control canvas, not on the form. }
      begin
        FillRect(Rect);       { Clear the rectangle. }
        Offset := 2;          { Provide default offset. }
        Bitmap := TBitmap((Control as TcxCheckListBox).Items.Objects[Index]);  { Get the bitmap. }
        if Bitmap <> nil then
        begin

          (*BrushCopy(
            Bounds(Rect.Left + Offset, Rect.Top, Bitmap.Width, Bitmap.Height),
            Bitmap,
            Bounds(0, 0, Bitmap.Width, Bitmap.Height),
            clRed);  {render bitmap}
          Offset := Bitmap.width + 6;    { Add four pixels between bitmap and text. }
           *)
        end;
        //with Rect do
        Canvas.FillRect(Classes.Rect(Rect.Left+2,Rect.Top+2,Rect.Left+2+20,Rect.Bottom-3));
        Canvas.Rectangle(Rect.Left-10,Rect.Top-10,Rect.Left+10,Rect.Top+20);//  TextOut(Rect.Left+2,Rect.Top+2 , 'acid');
               //TextOut(self. Rect.Left + Offset, Rect.Top, (Control as TcxCheckListBox).Items[Index].Index  );  { Display the text. }
      end;
end;

end.
