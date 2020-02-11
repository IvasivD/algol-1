unit SetTable;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics,ComCtrls, Controls, Forms, Dialogs, ComObj, ActiveX, mshtml_tlb,
  OleCtrls, DHTMLEDLib_TLB, StdCtrls, Buttons, ExtCtrls, IEConst, Variants,
  cxTextEdit, cxCheckBox, cxControls, cxContainer, cxEdit, cxMaskEdit,
  cxSpinEdit,    cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue;

const DefWithValue = 500;
      DefHeightValue = 300;

type

  TSizeStyle = record
    value:String;
    StrechPrc:Boolean;
  end;

  TFrmSetTable = class(TForm)
    PageControl: TPageControl;
    TabProperty: TTabSheet;
    Label1: TLabel;
    Bevel1: TBevel;
    Label2: TLabel;
    Label3: TLabel;
    LbSizeCell: TLabel;
    LbWidth: TLabel;
    LbHeight: TLabel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Label4: TLabel;
    SbtSelColorTableBorder: TSpeedButton;
    Label5: TLabel;
    Bevel5: TBevel;
    SbtSelColorTableFon: TSpeedButton;
    SbtSelColorCellBorder: TSpeedButton;
    SbtSelColorCellFon: TSpeedButton;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    SbtSelectPicture: TSpeedButton;
    Label9: TLabel;
    SpEdCountColumn: TcxSpinEdit;
    SpEdCountRow: TcxSpinEdit;
    EdWidth: TcxSpinEdit;
    EdHeight: TcxSpinEdit;
    CheckWidth: TcxCheckBox;
    CheckHeight: TcxCheckBox;
    PanColTableBorder: TPanel;
    cxChBxColorTableBorder: TcxCheckBox;
    cxChBxColorTableFon: TcxCheckBox;
    cxChBxColorCellBorder: TcxCheckBox;
    cxChBxColorCellFon: TcxCheckBox;
    PanColTableFon: TPanel;
    PanColCellBorder: TPanel;
    PanColCellFon: TPanel;
    SpEdCellspacing: TcxSpinEdit;
    SpEdCellpadding: TcxSpinEdit;
    EdImageTableCell: TcxTextEdit;
    SpEdBorderTable: TcxSpinEdit;
    OpenDlgImage: TOpenDialog;
    Panel1: TPanel;
    SbtOK: TSpeedButton;
    SbtClose: TSpeedButton;
    OpenDlgHTML: TOpenDialog;
    procedure cxCheckWidthPropertiesChange(Sender: TObject);
    procedure cxCheckHeightPropertiesChange(Sender: TObject);
    procedure SbtOKClick(Sender: TObject);
    procedure SbtCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SbtSelColorTableBorderClick(Sender: TObject);
    procedure cxChBxColorTableBorderPropertiesChange(Sender: TObject);
    procedure cxChBxColorTableFonPropertiesChange(Sender: TObject);
    procedure cxChBxColorCellBorderPropertiesChange(Sender: TObject);
    procedure cxChBxColorCellFonPropertiesChange(Sender: TObject);
    procedure SbtSelColorTableFonClick(Sender: TObject);
    procedure SbtSelColorCellBorderClick(Sender: TObject);
    procedure SbtSelColorCellFonClick(Sender: TObject);
    procedure SbtSelectPictureClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
     // FHtmlEditor:TWebHtmlEditor;
    { Private declarations }
    //function FGetHeightParam:string;
    //function FGetWidthParam:string;

  public
    { Public declarations }
   AClose:Integer;
   procedure RefreshControl;
   procedure SetCurrPropTable(aDHTMLEdit:TDHTMLEdit;TableBorderColor,TableFonColor,CellBorderColor,CellFonColor:String; TableWidth,TableHeight:Integer);
   procedure GetCurrPropTable(aDHTMLEdit:TDHTMLEdit);
  end;

 THTMLTableResize=class
   private
     FDHTMLEdit:TDHTMLEdit;
     FMouse_X:Integer;
     FMouse_Y:Integer;
     FResizing :boolean;
     FTDElem   :OLEVariant;
     FColSelected  :boolean;
     FRowSelected  :boolean;

   public
     constructor Create(aDHTMLEdit:TDHTMLEdit);
     destructor  Close;
     procedure TableMouseMove;
     procedure TableMouseDown;
     procedure TableMouseUp;
     function  InsertTable(ACaption:String;Modify:Boolean=false):Boolean;
     function  IsElem(TagElem:String): Boolean;
 end;

 function  GetCurCol(El: olevariant): Integer;
 function  GetCurRow(El: olevariant): Integer;
 function  GetParentElement(Target: olevariant): olevariant;

 Procedure ChangeAtributeToCell(table: IHTMLTable;R,C:Integer;AttributeName:String;AtributteValue:OleVariant;Adelete:Boolean=false);
 function  GetAtributeFromCell(table: IHTMLTable;R,C:Integer;AttributeName:String;Adelete:Boolean=false):OleVariant;
 Procedure ChangeColorToCell( table: htmltable; R,C:Integer;Newcolor:String);
 procedure SetPictureToCell(table: htmltable; R,C:Integer;Image:String);
 procedure SetWidthAndHeightOnTable(table: OLEVariant;Awidth:integer=-1;Aheight:integer=-1);
 procedure StyleSizeInTableSize(aTable:OLEVariant);
 Procedure InsertParamTable( var AParam  : OleVariant; Modify:Boolean;TableBorderColor,TableFonColor,CellBorderColor,CellFonColor:string; TableHeight,TableWidth:Integer );

 var
 FrmSetTable: TFrmSetTable;


implementation

uses UnitProc ,SelectFor;

{$R *.dfm}
function GetParentElement(Target: olevariant): olevariant;
var
  Range: olevariant;
begin
  Range :=
    Target.HTMLEd.selection.createRange ;
  Result := Range.parentElement;
  Range._Release;
end;
//******************************************************************************
procedure StyleSizeInTableSize(aTable:OLEVariant);
var aStyleTable:OLEVariant;
    TableWidth :OLEVariant;
    TableHeight:OLEVariant;
    m:OLEVariant;
begin
 aStyleTable:=aTable.getAttribute('style',m);
 //if aStyleTable<>null then
    begin
     TableWidth := aStyleTable.width;
     TableHeight:= aStyleTable.height;
     aTable.removeAttribute('style',m);
     if TableWidth<>'' then
        aTable.SetAttribute('width',TableWidth,m);
     if TableHeight<>'' then
        aTable.SetAttribute('height',TableHeight,m);
    end;
end;
//******************************************************************************
function GetCurRow(El: olevariant): Integer;
begin
  while El.tagName <> 'TR' do El := El.parentElement;
    Result := (El ).rowIndex;
end;
//******************************************************************************
function GetCurCol(El: olevariant): Integer;
var str:string;
begin
  result:=-1;
  while El.tagName <> 'TD' do
      begin
        str:=El.tagName;
        El := El.parentElement;
      end;
  Result := (El ).cellIndex;
end;
//******************************************************************************
procedure SetWidthAndHeightOnTable(table: OLEVariant;Awidth:integer=-1;Aheight:integer=-1);
var i,j:integer;
    row: OLEVariant;
    m:integer;
    cellOle: OLEVariant;
    AtributteValue:OleVariant;
begin
 for i:=0 to Table.rows.length-1 do
     begin
       row := table.rows.item(i, 0);

       AtributteValue:=Aheight;
       if Aheight=-1 then row.setAttribute('height','',m)
          else if Aheight<>0 then row.setAttribute('height',AtributteValue,m);

       for j:=0 to row.cells.length-1 do
           begin
             AtributteValue:=Awidth;
             cellOle:=row.cells.item(j, 0);
             cellOle.removeAttribute('height',m);// setAttribute('height','',m);

             if Awidth=-1  then cellOle.setAttribute('width','',m)
             else if Awidth<>0 then cellOle.setAttribute('width',AtributteValue,m);
           end;
     end;
end;
//******************************************************************************
Procedure ChangeAtributeToCell(table: IHTMLTable;R,C:Integer;AttributeName:String;AtributteValue:OleVariant;Adelete:Boolean=false);
var cellOle: OLEVariant;
    row: OLEVariant;
    ForSelect:Integer;
    i:integer;
    x:OLEVariant;
    OleTable : OLEVariant;
begin
   //**************************************************************
   OleTable:= table;
   row     := OleTable.rows.item(R, 0);// as htmltablerow;
   //*************************************
   cellOle := row.cells.item(C, 0);
   //*************************************
   cellOle.removeAttribute(AttributeName,x);
   if not Adelete then cellOle.setAttribute(AttributeName,AtributteValue,x);
   //**************************************************************
end;
//******************************************************************************
function GetAtributeFromCell(table: IHTMLTable;R,C:Integer;AttributeName:String;Adelete:Boolean=false):OleVariant;
var row:OLEVariant;
    ForSelect:Integer;
    i:integer;
    x:OLEVariant;
    Atable : htmltable;
    OleTable :OLEVariant;
    cellOle: OLEVariant;
begin
   //**************************************************************
   OleTable:=table;
   row := OleTable.rows.item(R, 0);// as htmltablerow;
   cellOle := row.cells.item(C, 0);

   if not Adelete then result:=cellOle.getAttribute(AttributeName,x)
      else cellOle.removeAttribute(AttributeName,x);
end;
//******************************************************************************
procedure SetPictureToCell(table: htmltable; R,C:Integer;Image:String);
var cell : OLEVariant;//ihtmltablecell;
    row  : OLEVariant;// htmltablerow;
    ForSelect:Integer;
    OleTable:OLEVariant;
begin
  OleTable := table;
  row := OleTable.rows.item(R, 0);// as htmltablerow;

  if ForSelect=-1 then Exit;
  cell:=row.cells.item(C, 0);// as ihtmltablecell;
  cell.background:=OLEVariant(Image);
end;
//******************************************************************************
Procedure ChangeColorToCell( table: htmltable; R,C:Integer;Newcolor:String);
var cell : OLEVariant;//ihtmltablecell;
    row: OLEVariant;//htmltablerow;
    col: OLEVariant;//htmltablecol;
    ForSelect:Integer;
    i:integer;
    k:integer;
    x:OLEVariant;
    ovtable: olevariant;
begin
  ForSelect:=ShowSelectDialog('Змінити колір для:',200,100, ['Ячейки','Рядка','Колонки'],k);
  if ForSelect=-1 then Exit;
  ovtable:= table;
  //***********************************************  
  row :=  ovtable.rows.item(R, 0);// as htmltablerow;
  col :=  ovtable.rows.item(R, 0);// as disphtmltablecol;
  //***********************************************
  if ForSelect=0 then
    begin
    cell:=row.cells.item(C, 0);// as ihtmltablecell;
    cell.bgColor     := OleVariant( Newcolor );//Newcolor;
    end;
  //***********************************************
  if ForSelect=1 then row.bgColor :=OleVariant( Newcolor ); ;
  //***********************************************
  if ForSelect=2 then
    begin                                               // onselectstart
    for i:=0 to ovtable.rows.length-1 do
        begin
         row := ovtable.rows.item(i, 0); // as htmltablerow;
         cell:=row.cells.item(C, 0);    // as ihtmltablecell;
         cell.bgColor := OleVariant( Newcolor );;
        end;
    end;
end;
//******************************************************************************
procedure TFrmSetTable.cxCheckWidthPropertiesChange(Sender: TObject);
begin
 RefreshControl;
end;
//******************************************************************************
procedure TFrmSetTable.cxCheckHeightPropertiesChange(Sender: TObject);
begin
 RefreshControl;
end;
//******************************************************************************
procedure TFrmSetTable.SbtOKClick(Sender: TObject);
begin
 AClose:=1;
 PageControl.ActivePage:=TabProperty;
 SpEdCellspacing.SetFocus;
 SpEdCellpadding.SetFocus;
 SpEdCellspacing.SetFocus;
 close;
end;
//******************************************************************************
procedure TFrmSetTable.SbtCloseClick(Sender: TObject);
begin
 AClose:=0;
 close;
end;
//******************************************************************************
procedure TFrmSetTable.FormCreate(Sender: TObject);
begin
 AClose:=0;
end;
//******************************************************************************
procedure TFrmSetTable.SbtSelColorTableBorderClick(Sender: TObject);
begin
 PanColTableBorder.Color:= ShowDialogColor(TPanel(sender).Color);
end;
//******************************************************************************
procedure TFrmSetTable.SbtSelColorTableFonClick(Sender: TObject);
begin
  PanColTableFon.Color:=ShowDialogColor(TPanel(sender).Color);
end;
//******************************************************************************
procedure TFrmSetTable.SbtSelColorCellBorderClick(Sender: TObject);
begin
 PanColCellBorder.Color:=ShowDialogColor(TPanel(sender).Color);
end;
//******************************************************************************
procedure TFrmSetTable.SbtSelColorCellFonClick(Sender: TObject);
begin
 PanColCellFon.Color   :=ShowDialogColor(TPanel(sender).Color);
end;
//******************************************************************************
procedure TFrmSetTable.cxChBxColorTableBorderPropertiesChange(
  Sender: TObject);
begin
 PanColTableBorder.Enabled     := cxChBxColorTableBorder.Checked;
 SbtSelColorTableBorder.Enabled:= cxChBxColorTableBorder.Checked;
end;
//******************************************************************************
procedure TFrmSetTable.cxChBxColorTableFonPropertiesChange(
  Sender: TObject);
begin
  PanColTableFon.Enabled      := cxChBxColorTableFon.Checked;
  SbtSelColorTableFon.Enabled := cxChBxColorTableFon.Checked;
end;
//******************************************************************************
procedure TFrmSetTable.cxChBxColorCellBorderPropertiesChange(
  Sender: TObject);
begin
 PanColCellBorder.Enabled     :=cxChBxColorCellBorder.Checked;
 SbtSelColorCellBorder.Enabled:=cxChBxColorCellBorder.Checked;
end;
//******************************************************************************
procedure TFrmSetTable.cxChBxColorCellFonPropertiesChange(Sender: TObject);
begin
 PanColCellFon.Enabled        :=cxChBxColorCellFon.Checked;
 SbtSelColorCellFon.Enabled   :=cxChBxColorCellFon.Checked;
end;
//******************************************************************************
procedure TFrmSetTable.SbtSelectPictureClick(Sender: TObject);
var ForDir:String;
begin
  if OpenDlgHTML.FileName<>'' then
     ForDir:=ExtractFilePath(OpenDlgHTML.FileName)
       else ForDir:=ExtractFilePath(Application.ExeName);
   //if OpenDlgImage.Execute  then
    EdImageTableCell.Text :=OpenFileName(ForDir,'*.jpg|*.jpg|*.swf|*.swf|*.*|*.*');
    //EdImageCell.Text :=ViewOpenFileLink('*.jpg|*.jpg|*.swf|*.swf|*.*|*.*',ForDir);
end;
//******************************************************************************
procedure TFrmSetTable.RefreshControl;
begin
  LbWidth.Enabled   := not CheckWidth.Checked;
  EdWidth.Enabled := not CheckWidth.Checked;

  LbHeight.Enabled      := not CheckHeight.Checked;
  EdHeight.Enabled    := not CheckHeight.Checked;

  if (not CheckWidth.Checked )and(FrmSetTable.EdWidth.Value=100) then FrmSetTable.EdWidth.Value:=DefWithValue;
  if (not CheckHeight.Checked )and(FrmSetTable.EdHeight.Value=100) then FrmSetTable.EdHeight.Value:=DefHeightValue;
end;

procedure TFrmSetTable.FormShow(Sender: TObject);
begin
 RefreshControl;
end;

Procedure InsertParamTable( var AParam  : OleVariant; Modify:Boolean;TableBorderColor,TableFonColor,CellBorderColor,CellFonColor:string; TableHeight,TableWidth:Integer );
var RowAttr:String;
    TableAtr_Str    :String;
    CellAtr_Str     :string;
begin
 //******************************************************
  if not Modify then
     begin
       AParam.NumRows := FrmSetTable.SpEdCountRow.Value;
       AParam.NumCols := FrmSetTable.SpEdCountColumn.Value;
     end;
 //******************************************************
  TableAtr_Str:='id="TableInsert"';     //class=NormalText 

  if TableBorderColor<>'' then TableAtr_Str :=TableAtr_Str+'bordercolor="'+TableBorderColor+'" ' else TableAtr_Str:=TableAtr_Str;

  if TableHeight=-1 then  TableAtr_Str:= TableAtr_Str+ 'height="100%" '
  else TableAtr_Str:= TableAtr_Str+ 'height="'+IntToStr(TableHeight)+'px" ';

  if TableWidth=-1 then TableAtr_Str:= TableAtr_Str+ 'width="100%" '
  else TableAtr_Str:= TableAtr_Str+ 'width="'+IntToStr(TableWidth)+'px" ';


  TableAtr_Str:= TableAtr_Str+'cellspacing="'+IntToStr(FrmSetTable.SpEdCellspacing.Value)+'" ';
  TableAtr_Str:= TableAtr_Str+'cellpadding="'+IntToStr(FrmSetTable.SpEdCellpadding.Value)+'" ';

  TableAtr_Str:= TableAtr_Str+'bgcolor="'+TableFonColor+'" ';
  TableAtr_Str:= TableAtr_Str+'border="'+IntToStr(FrmSetTable.SpEdBorderTable.Value)+'" ';

  if Trim(FrmSetTable.EdImageTableCell.Text)<>'' then TableAtr_Str :=TableAtr_Str+'background="'+FrmSetTable.EdImageTableCell.Text+'" ';
  TableAtr_Str :=TableAtr_Str+'bgcolor="'+CellFonColor+'" ';

  AParam.TableAttrs:=TableAtr_Str;
 //******************************************************
  if CellBorderColor<>'' then CellAtr_Str :='bordercolor="'+CellBorderColor+'" ' else CellAtr_Str :='';
  //if ColWidth<>-1 then  CellAtr_Str :=CellAtr_Str+'width="'+IntToStr(ColWidth)+'" ';


  //if Trim(FrmSetTable.EdImageCell.Text)<>'' then CellAtr_Str :=CellAtr_Str+'background="'+FrmSetTable.EdImageCell.Text+'" ';
  //CellAtr_Str :=CellAtr_Str+'bgcolor="'+CellFonColor+'" ';

  AParam.CellAttrs := CellAtr_Str;
end;


procedure TFrmSetTable.SetCurrPropTable(aDHTMLEdit:TDHTMLEdit;TableBorderColor,TableFonColor,CellBorderColor,CellFonColor:String; TableWidth,TableHeight:Integer);
var dlgTableProps:OleVariant;
    x:OLEVariant;
    StrAtr:String;
    ColorHTML:String;
    ovtable: olevariant;
    Atable : IHTMLTable;
    i,j:integer;
    ctrlrange: ihtmlcontrolrange;
    aValue:Variant;
    HTMLEl :IHTMLElement;
begin
 //*************For Table**********************
 //if not self.IsElem('TABLE') then exit;
 //*************For Table**********************
 ctrlrange :=aDHTMLEdit.DOM.selection.createRange as ihtmlcontrolrange;
 HTMLEl:=ctrlrange.commonParentElement;

 if HTMLEl=nil then Exit;
 //************************************************************************
 if TableBorderColor<>'' then HTMLEl.SetAttribute('bordercolor',TableBorderColor,x)
    else HTMLEl.removeAttribute('bordercolor',x);
 //************************************************************************
 HTMLEl.setAttribute('cellspacing',SpEdCellspacing.Value, x);
 HTMLEl.SetAttribute('cellpadding',SpEdCellpadding.Value,x);
 //************************************************************************
 if TableFonColor<>'' then  HTMLEl.setAttribute('bgcolor',TableFonColor, x)
    else  HTMLEl.removeAttribute('bgcolor',x);
 //************************************************************************
 HTMLEl.setAttribute('border',SpEdBorderTable.Value,x);
 //*****************************************************************************
 Atable :=HTMLEl as IHTMLTable;
 ovtable:=HTMLEl;
  for i := 0 to (ovtable.rows.length - 1) do
    for j := 0 to (ovtable.rows.item(i).cells.length - 1) do
        begin
          //********************************************************************
          if CellBorderColor<>'' then  ChangeAtributeToCell(Atable,i,j,'bordercolor',CellBorderColor)
             else ChangeAtributeToCell(Atable,i,j,'bordercolor',CellBorderColor,true);
          //********************************************************************
          if CellFonColor<>'' then ChangeAtributeToCell(Atable,i,j,'bgcolor',CellFonColor)
              else ChangeAtributeToCell(Atable,i,j,'bgcolor',CellFonColor,true);
          //********************************************************************
          //if EdImageCell.Text<>'' then ChangeAtributeToCell(Atable,i,j,'background', EdImageCell.Text)
          //    else ChangeAtributeToCell(Atable,i,j,'background',EdImageCell.Text,true);
          //********************************************************************
        end;
  //*******************************************************      
  if EdImageTableCell.Text<>'' then
    HTMLEl.setAttribute('background',EdImageTableCell.Text,x)
  else HTMLEl.removeAttribute('background',x);
 //*****************************************************************************
  if  MessageDlg('Змінити розміри комірок таблиці ?',mtConfirmation,[mbYes, mbNo],0)=mrYes then
      begin
        if TableWidth=-1 then
           HTMLEl.setAttribute('width','100%',x)
           else
           begin
              HTMLEl.setAttribute('width',TableWidth,x);
             //HTMLEl.removeAttribute('width',x);
              HTMLEl.removeAttribute('style',x);
           end;

         //************************************************************************
        if TableHeight=-1 then
           HTMLEl.setAttribute('height','100%',x)
           else
           begin
             HTMLEl.setAttribute('height',TableHeight,x);
            //HTMLEl.removeAttribute('height',x);
            HTMLEl.removeAttribute('style',x);
           end;
         //************************************************************************
        // SetWidthAndHeightOnTable(Atable, TableWidth,TableHeight);
      end;
end;

{function TFrmSetTable.FGetWidthParam:string;
begin
 if not CheckWidth.Checked then result:= IntToStr(EdWidth.EditValue)
 else result:= '100%';
end;

function TFrmSetTable.FGetHeightParam:string;
begin
 if not CheckHeight.Checked then result:= IntToStr(EdHeight.EditValue)
 else result:= '100%';
end;}

function GetStyleAttribute(HTMLEl :IHTMLElement; attributeName:Widestring):TSizeStyle;
var AValue:OleVariant;
    AFlag:OleVariant;
    AValuStr:Widestring;
begin
  result.value:='';
  result.StrechPrc:=false;
  AValue:=HTMLEl.style.getAttribute(attributeName ,AFlag);
  if (AValue = null)or(AValue = '') then AValue:=HTMLEl.getAttribute( attributeName ,AFlag);
  if (AValue <> null)or(AValue = '') then
  begin
   AValuStr:=AValue;
   if AnsiPos('%',AValuStr)<>0 then Result.StrechPrc:=True
   else Result.StrechPrc:=False;

   ReplaseOn(AValuStr,'"','');
   ReplaseOn(AValuStr,'px','');
   ReplaseOn(AValuStr,'%','');

   result.value:=AValuStr;
  end;
end;

procedure TFrmSetTable.GetCurrPropTable(aDHTMLEdit:TDHTMLEdit);
var StrAtr:String;
    ColorHTML:String;
    Atable : IHTMLTable;
    row    : htmltablerow;
    ctrlrange: ihtmlcontrolrange;
    aValue:Variant;
    x:OLEVariant;
    HTMLEl :IHTMLElement;
    aValueSize:TSizeStyle;
begin
 //if not self.IsElem('TABLE') then exit;
 //*************For Table**********************

 ctrlrange :=aDHTMLEdit.DOM.selection.createRange as ihtmlcontrolrange;
 HTMLEl:=ctrlrange.commonParentElement;
 if HTMLEl=nil then exit;
 ColorHTML := HTMLEl.getAttribute('bordercolor',x);
 if ColorHTML<>'' then begin PanColTableBorder.Color:=HtmlToColor(ColorHTML); cxChBxColorTableBorder.Checked:=true;end
    else cxChBxColorTableBorder.Checked:=false;
 aValue:=HTMLEl.getAttribute('cellspacing',x);
 if aValue<>'' then
    SpEdCellspacing.Value  :=StrToInt(aValue);//HTMLEl.getAttribute('cellspacing',x);
 //***************************************
 aValue:=HTMLEl.getAttribute('cellpadding',x);
 if aValue<>'' then
    SpEdCellpadding.Value  :=StrToInt(aValue);
  //*****************************************************************************
  aValueSize:=GetStyleAttribute(HTMLEl,'width');
  if aValueSize.value<>'' then
   begin
     EdWidth.EditValue:=aValueSize.value;
     CheckWidth.Checked :=aValueSize.StrechPrc;
   end;
   //*****************************************************************************
   aValueSize:= GetStyleAttribute(HTMLEl, 'height');
   if aValueSize.value<>'' then
   begin
     EdHeight.EditValue:= aValueSize.value;
     CheckHeight.Checked := aValueSize.StrechPrc;
   end;
 //*****************************************************************************
 ColorHTML :=HTMLEl.getAttribute('bgcolor',x);
 if ColorHTML<>'' then begin PanColTableFon.Color:=HtmlToColor(ColorHTML);cxChBxColorTableFon.Checked:=true;end
    else cxChBxColorTableFon.Checked:=false;
 //*****************************************************************************
 aValue:=HTMLEl.getAttribute('border',x);
 if aValue<>'' then SpEdBorderTable.Value :=StrToInt(aValue);
 //*************For Cell********************************************************
 Atable :=HTMLEl as IHTMLTable;
 ColorHTML := GetAtributeFromCell(Atable,0,0,'bordercolor');
 if ColorHTML<>'' then begin PanColCellBorder.Color:=HtmlToColor(ColorHTML); cxChBxColorCellBorder.Checked:=true;end
    else  cxChBxColorCellBorder.Checked:=false;
 ColorHTML := GetAtributeFromCell(Atable,0,0,'bgcolor');
 if ColorHTML<>'' then begin PanColCellFon.Color   :=HtmlToColor(ColorHTML);cxChBxColorCellFon.Checked:=true;end
    else cxChBxColorCellFon.Checked:=false;
  //************
 //aValue:=GetAtributeFromCell(Atable,0,0,'background');
 //if aValue<>null then EdImageCell.Text:=aValue;
 EdImageTableCell.Text:= HTMLEl.GetAttribute('background',x);

 //*****************************************************************************
  aValue:=GetAtributeFromCell(Atable,0,0,'width');
 if (aValue<>Null)and(aValue<>'') then EdWidth.Value:=StrToInt(aValue);//GetAtributeFromCell(Atable,0,0,'width');
 //************
 aValue:=(Atable.rows.item(0, 0) as htmltablerow).getAttribute('height',x);
 if (aValue<>Null)and(aValue<>'') then EdHeight.Value   :=StrToInt(aValue);//GetAtributeFromCell(Atable,0,0,'height');
 
end;
//******************************************************************************

procedure THTMLTableResize.TableMouseMove;
const t=0;
var i ,j      :integer;
    currPoint :TPoint;
    row       : OLEVariant;
    iCell     : integer;
    nCells    : integer;
    rows      : OLEVariant;
    nRows     :integer;
    cell      :OLEVariant;
    width     :integer;
    height    :Integer;

    rect :OLEVariant;// elem.getClientRects()[0];
    left :integer;// rect.left;
    right:integer;// rect.right;
    top  :integer;// rect.top;
    bottom:integer;// = rect.bottom;

    cellOle: OLEVariant;
    cells  : OLEVariant;

    m:OLEVariant;

    TableWidth:Variant;
    TableHeight:Variant;
    aStyleTable:OLEVariant;
begin
 try
   FMouse_X:=FDHTMLEdit.DOM.parentWindow.event.x;
   FMouse_Y:=FDHTMLEdit.DOM.parentWindow.event.y;

   //************************************************
   if ( FResizing )then
      begin //11
       row   := FTDElem.parentElement;
       nCells:= row.cells.length;

       for i:= 0 to nCells-1 do
        begin
         cells:=row.cells.item(i);
         if (cells.offsetLeft = FTDElem.offsetLeft) and
            (cells.offsetTop  = FTDElem.offsetTop) then
          begin
            iCell:= i;
            break;
          end;
       end;
      //*********************************************
      rows := row.parentElement.rows;
      nRows := rows.length;
      //*********************************************
      for i:=0 to nRows-1 do
          begin //44
           row:=  rows.item(i);
           cell:= row.cells.item(iCell);
           if VarIsClear( cell ) then break;
           //*****************************************************
           if ( FColSelected ) then
              begin
               width := FMouse_X - cell.offsetLeft;
               if width>0 then
                  cell.width := width;

               FDHTMLEdit.Cursor := crSizeWE;
               screen.Cursor := crSizeWE;
               Application.ProcessMessages;
              end;
           //*****************************************************
           if ( FRowSelected ) and (row.offsetTop = FTDElem.offsetTop) then
              begin  //99
                 //*****************************************************
                 height := FMouse_Y - cell.offsetTop;

                 if height >0 then
                    begin
                      for j:=0 to row.cells.length-1 do
                        row.cells.item(j, 0).removeAttribute('height',m);

                      row.height:= FMouse_Y - row.offsetTop;
                    end;

                 FDHTMLEdit.Cursor:=crSizeNS;
                 screen.Cursor:=crSizeNS;
                 Application.ProcessMessages;
              end;//99
           //*****************************************************
          end; //44
   end //11
   else
   begin  // **

    //*********************************************************
    FTDElem  :=FDHTMLEdit.DOM.elementFromPoint( FMouse_X , FMouse_Y );
    if ( FTDElem.tagName = 'TD' ) //and
       {( FTDElem.parentElement.rowIndex<>0)and
       ( FTDElem.parentElement.rowIndex < FTDElem.parentElement.parentElement.rows.length ) and  }

       {( FTDElem.cellIndex < FTDElem.parentElement.cells.length-1  )} then
    begin  //1
     //ShowMessage( 'Index row:='+IntToStr( FTDElem.parentElement.rowIndex )+'  Len:'+IntToStr( FTDElem.parentElement.parentElement.rows.length ));
     //ShowMessage( 'Index cell:='+IntToStr( FTDElem.cellIndex )+'  Len:'+IntToStr( FTDElem.parentElement.cells.length ));

     rect:=FTDElem.getClientRects.item(0);
     left := rect.left;
     right:= rect.right-1;
     top  := rect.top;
     bottom:= rect.bottom-1;

     if (
         (( FMouse_X >= left - 1 ) and ( FMouse_X  <= left + 1 ) ) or (( FMouse_X >= right-1 ) and ( FMouse_X  <= right + 1 ) )
           AND
               ( FMouse_Y >= top + t )and
               ( FMouse_Y  <= bottom - t ) and (FTDElem.cellIndex < FTDElem.parentElement.cells.length-1) )   then
               begin  //2
                FColSelected:=true;

                FDHTMLEdit.Cursor:=crSizeWE;
                screen.Cursor:=crSizeWE;
                Application.ProcessMessages;
               end  //2
                 else
                  //if ( FMouse_Y >= bottom - t ) and ( FMouse_Y <= bottom + t )

                  if (( FMouse_Y <= top - t )and ((FTDElem.parentElement.rowIndex < FTDElem.parentElement.parentElement.rows.length)and(FTDElem.parentElement.rowIndex>0) )) or
                     (( FMouse_Y >= bottom - t)and(FTDElem.parentElement.rowIndex < FTDElem.parentElement.parentElement.rows.length-1) )
                  //if (( FMouse_Y <= top - t ) or ((FMouse_Y >= bottom - t ) and (FTDElem.parentElement.rowIndex < FTDElem.parentElement.parentElement.rows.length)) ) and
                  //   (( FMouse_Y >= top + t ) or ((FMouse_Y <= bottom + t ) and (FTDElem.parentElement.rowIndex < FTDElem.parentElement.parentElement.rows.length)) )
                  then
                    begin //3
                     //ShowMessage( IntToStr(FTDElem.parentElement.rowIndex)+'  '+IntToStr(FTDElem.parentElement.parentElement.rows.length) );
                     FRowSelected:= true;

                     FDHTMLEdit.Cursor:=crSizeNS;
                     screen.Cursor:=crSizeNS;
                     Application.ProcessMessages;
                   end //3
                    else
                       begin
                         FRowSelected:= false;
                         FColSelected:=false;

                         FDHTMLEdit.Cursor := crDefault;
                         screen.Cursor := crDefault;
                         Application.ProcessMessages;
                       end;
    end //1
    else
      begin //4
        FColSelected:= false;
        FRowSelected:=false;

        FDHTMLEdit.Cursor := crDefault;
        screen.Cursor := crDefault;
        Application.ProcessMessages;
      end;  //4
   end;//**
 except
 end;

end;
//******************************************************************************
procedure THTMLTableResize.TableMouseDown;
var currPoint:TPoint;
begin
   if ( FColSelected )or(FRowSelected) then    // Capture mouse if column border has been selected
      begin
        FTDElem.setCapture;
        FResizing:=true;
      end;
end;
//******************************************************************************
procedure THTMLTableResize.TableMouseUp;
begin
   FTDElem.releaseCapture;          // Release mouse capture
   FResizing:= false;
end;
//******************************************************************************
function THTMLTableResize.IsElem(TagElem:String): Boolean;
var ctrlrange: ihtmlcontrolrange;
    txtrange: ihtmlTxtrange;

function FindElemTxt(El: ihtmlElement):Boolean;
begin
   result:=false;
   if El=nil then exit;
   if El.parentElement=nil then exit;
   if CompareText(El.tagName ,TagElem)=0 then begin result:=true;exit;end;
   if CompareText(El.parentElement.TagName ,TagElem)=0 then begin result:=true; exit; end;
   while (El.parentElement<>nil)and(CompareText(El.parentElement.tagName ,TagElem)<>0) do
     begin
      if CompareText(El.parentElement.tagName ,TagElem)=0 then begin result:=true;break;end;
      El := El.parentElement;
      if El=nil then break;
     end;
end;
//******************************************************************************
begin
   if self.FDHTMLEdit.DOM.selection.type_='Control' then
      begin //1
       ctrlrange :=self.FDHTMLEdit.DOM.selection.createRange as ihtmlcontrolrange;
       if CompareText(ctrlrange.commonParentElement.tagName, TagElem)=0 then result:=true
          else result:=false;
      end //1
       else
         begin //2
           txtrange:=self.FDHTMLEdit.DOM.selection.createRange as ihtmlTxtrange;
           if FindElemTxt(txtrange.parentElement)then result:=true
              else result:=false;
         end; //2
end;
//******************************************************************************
function THTMLTableResize.InsertTable(ACaption:String;Modify:Boolean=false):Boolean;
var textfont: OleVariant;
    tParam  : OleVariant;
    aTableInsert:OleVariant;
    TableWidth:integer;
    TableHeight:integer;
    TableBorderColor:String;
    TableFonColor   :String;
    CellBorderColor :String;
    CellFonColor    :String;
    //**********************
    x:OLEVariant;
    TableAtr_Str    :String;
    CellAtr_Str     :String;
    ctlRg           :IHTMLTxtRange;
    HTMLEl          :IHTMLElement;
    aTableElem      :IHTMLTable;
    cell            :ihtmltablecell;
//******************************************************************************
begin
  try
   Application.CreateForm(TFrmSetTable, FrmSetTable);
   FrmSetTable.Caption :=ACaption;
   if Modify then
      begin
       if self.IsElem('TABLE') then
         FrmSetTable.GetCurrPropTable(self.FDHTMLEdit);
       
       FrmSetTable.SpEdCountColumn.Enabled:=false;
       FrmSetTable.SpEdCountRow.Enabled   :=false;
      end
      else
      begin
        FrmSetTable.EdWidth.Value:=DefWithValue;
        FrmSetTable.EdHeight.Value:=DefHeightValue;
      end;
   FrmSetTable.ShowModal;
   //************************************************
   if FrmSetTable.CheckWidth.Checked  then TableWidth:=-1  else TableWidth  :=FrmSetTable.EdWidth.Value;
   if FrmSetTable.CheckHeight.Checked then TableHeight:=-1 else TableHeight :=FrmSetTable.EdHeight.Value;
   //************************************************
   if FrmSetTable.cxChBxColorTableBorder.Checked then TableBorderColor:=ColorToHtml(FrmSetTable.PanColTableBorder.Color) else  TableBorderColor:='';
   if FrmSetTable.cxChBxColorTableFon.Checked    then TableFonColor   :=ColorToHtml(FrmSetTable.PanColTableFon.Color)    else  TableFonColor:='';
   if FrmSetTable.cxChBxColorCellBorder.Checked  then CellBorderColor :=ColorToHtml(FrmSetTable.PanColCellBorder.Color)  else  CellBorderColor:='';
   if FrmSetTable.cxChBxColorCellFon.Checked     then CellFonColor    :=ColorToHtml(FrmSetTable.PanColCellFon.Color)     else  CellFonColor:='';
    //************************************************
  if FrmSetTable.AClose = 1 then
  begin
    if not Modify then
       begin
         //************************************************
         tParam :=createoleobject('DEInsertTableParam.DEInsertTableParam');
         //*******************************************************
         InsertParamTable( tParam, Modify, TableBorderColor, TableFonColor, CellBorderColor, CellFonColor, TableHeight, TableWidth );
         //*******************************************************
         self.FDHTMLEdit.ExecCommand(DECMD_INSERTTABLE,  OLECMDEXECOPT_DODEFAULT, tParam);
         //*******************************************************
         aTableInsert:=self.FDHTMLEdit.DOM;
         //SetWidthAndHeightOnTable(aTableInsert.getElementById('TableInsert'), -1, -1);   //ColWidth,ColHeight
         aTableInsert.getElementById('TableInsert').removeAttribute('id',x);
       end
        else
         if self.IsElem('TABLE') then
           FrmSetTable.SetCurrPropTable(self.FDHTMLEdit,TableBorderColor,TableFonColor,CellBorderColor,CellFonColor, TableWidth,TableHeight);

    result := True;       
  end
  else result := False;
  finally
   FreeAndNil(FrmSetTable);
  end;
end;
//******************************************************************************

{ THTMLTableResize }

destructor THTMLTableResize.Close;
begin

end;

constructor THTMLTableResize.Create(aDHTMLEdit:TDHTMLEdit);
begin
 FDHTMLEdit := aDHTMLEdit ;
end;

procedure TFrmSetTable.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if  Key = Chr(VK_ESCAPE) then SbtClose.Click;
end;

end.
