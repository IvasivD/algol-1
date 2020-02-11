unit UnitInputData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Math,
  Dialogs, cxStyles, cxGraphics, cxEdit, cxVGrid, cxControls,DB,cxCalendar,cxTimeEdit, AdoDB, ADOInt,
  cxInplaceContainer, StdCtrls, ExtCtrls, cxGridTableView, cxDBExtLookupComboBox , cxDBLookupComboBox ,
  cxGridBandedTableView, cxClasses, cxGridCardView ,cxDataStorage,cxImageComboBox,  cxGridDBTableView,
  cxCheckBox , cxButtonEdit, cxTextEdit ,cxFilter, ComCtrls,
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
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, cxImage,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,Core,
  Buttons, cxTL,cxCheckComboBox,cxDropDownEdit,cxBlobEdit,cxMaskEdit;

type

   FilterStore=record
   FieldNameFromValue:array of string;
   ViewFilter        :TcxGRidDBTableView;
   FieldFilterView   :array of string;
 end;

 TUnicalTypeCheckField=(itAnd,itOr);

  TFrmInputData = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    VGrid: TcxVerticalGrid;
    VGridEditorRow1: TcxEditorRow;
    VGridEditorRow2: TcxEditorRow;
    VGridEditorRow3: TcxEditorRow;
    ButOk: TBitBtn;
    ButCancel: TBitBtn;
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
    cxStyle213: TcxStyle;
    cxStyle214: TcxStyle;
    cxStyle215: TcxStyle;
    cxStyle216: TcxStyle;
    DBCardStyle: TcxGridCardViewStyleSheet;
    DBBandedStyle: TcxGridBandedTableViewStyleSheet;
    DBOtherStyle: TcxGridBandedTableViewStyleSheet;
    DBMonitorStyle: TcxGridBandedTableViewStyleSheet;
    GridTableViewStyle: TcxGridTableViewStyleSheet;
    MyStyle: TcxGridTableViewStyleSheet;
    MyStyleTree: TcxTreeListStyleSheet;
    ButShowLog: TSpeedButton;
    procedure ButOkClick(Sender: TObject);
    procedure ButCancelClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure VGridDrawRowHeader(Sender: TObject; ACanvas: TcxCanvas;
      APainter: TcxvgPainter; AHeaderViewInfo: TcxCustomRowHeaderInfo;
      var Done: Boolean);
    procedure VGridDrawValue(Sender: TObject; ACanvas: TcxCanvas;
      APainter: TcxvgPainter; AValueInfo: TcxRowValueInfo;
      var Done: Boolean);
    Procedure EditButClick(Sender: TObject);
    procedure VGridDblClick(Sender: TObject);
    procedure VGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ButShowLogClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure VGridEditValueChanged(Sender: TObject;
      ARowProperties: TcxCustomEditorRowProperties);
    procedure VGridKeyPress(Sender: TObject; var Key: Char);


  private
    FIsUpdate : Boolean;
    FMasUnicalFields :array of string;

    FFunctValidate   : TValidtateBeforePost;
    FUTypeCheck:TUnicalTypeCheckField;
    Function CheckUnicalDataInput(aMasUnicalFields:array of string;aUTypeCheck:TUnicalTypeCheckField):boolean;
    procedure SetFunctValidate(const Value: TValidtateBeforePost);
    { Private declarations }
  public
    Elem:TDBShema;
    View:TcxGridDBTableView;
    //MasMaskTemplate : TMasMaskTemplateArr;
    Aclose:integer;
    //Fview:TcxGRidDBTableView;
    KeyIni:String;

    procedure AddMasUnicalFieldForRow(amasField: array of string;UTypeCheck:TUnicalTypeCheckField);
    property  FunctValidate : TValidtateBeforePost write SetFunctValidate;
  published
    property IsUpdate : Boolean read FIsUpdate write FIsUpdate;
  end;

 var FrmInputData   : TFrmInputData;
 procedure SaveVDataToDB( VGrd:TcxVerticalGrid; aView:TcxGridDBTableView; AcceptFieldName:TVarArr );
 function AddfieldToVGrid( FInputVgrid : TcxVerticalGrid; Column:TcxGridDBColumn; aValue:Variant; FFieldNumber:String ):TcxEditorRow;
 procedure PrepareMaskField( VGrd:TcxVerticalGrid; Aview:TcxGRidDBTableView;  aElem:TDBShemaView  );
  //AlistRow    : Strin

implementation

uses cxGridCustomTableView, UnitEditText, UnitProc ;

{$R *.dfm}


function CheckAllowNullField( VGrd:TcxVerticalGrid; Aview:TcxGRidDBTableView ):boolean;
var i:integer;
begin
  result:=true;
  for i:=0 to VGrd.Rows.Count-1 do
       begin
        if TcxEditorRow(VGrd.Rows.Items[i]).Visible then
           begin
             if (Aview.Columns[i].DataBinding.Field<>nil)and
                (Aview.Columns[i].DataBinding.Field.Required ) and
                ((TcxEditorRow(VGrd.Rows.Items[i]).Properties.Value=null) ) then
                 begin
                   MessageDlg('Колонка '+ Aview.Columns[i].Caption+' повинна бути заповнена.' , mterror, [mbok], 0);
                   result:=false;
                   break;
                 end;
             //Aview.Columns[i].EditValue:=TcxEditorRow(VGrd.Rows.Items[i]).Properties.Value;
           end;
       end;
end;
//******************************************************************************
{procedure ValidateMaskDisplayValue( Sender:TObject; var DisplayValue: TcxEditValue;
  var ErrorText: TCaption; var Error: Boolean );
begin

end;
}//******************************************************************************
procedure PrepareMaskField( VGrd:TcxVerticalGrid; Aview:TcxGRidDBTableView;  aElem:TDBShemaView );
var i : Integer;
    FiedlTampl:string;
    MaskTemplate : TMasMaskTemplate;
    ValueOnSource : variant;
    IndFieldSource : integer;
begin
  if VGrd.IsEditing then VGrd.HideEdit;
  for i:=0 to VGrd.Rows.Count-1 do
  begin
    if TcxEditorRow(VGrd.Rows.Items[i]).Visible then
    begin
      if Aview.Columns[i].DataBinding.Field <> nil then
      begin

        MaskTemplate := aElem.FindMaskTemplateFieldForField( Aview.Columns[i].DataBinding.FieldName );
        if ( MaskTemplate.FieldName <> '' ) and ( MaskTemplate.ElemeSource <> nil ) and (MaskTemplate.ElemeSource is TDBShema) then
        begin

          IndFieldSource := Aview.GetColumnByFieldName( MaskTemplate.FieldOnElemSource ).Index;
          ValueOnSource := TcxEditorRow( VGrd.Rows.Items[ IndFieldSource ]).Properties.Value;

          if TDBShema(MaskTemplate.ElemeSource).DB.Locate( TDBShema(MaskTemplate.ElemeSource).FieldKod, ValueOnSource , [] ) then
          begin
            // if (TcxEditorRow(VGrd.Rows.Items[i]).Properties.EditPropertiesClass <> TcxMaskEditProperties) then
            TcxEditorRow(VGrd.Rows.Items[i]).Properties.EditPropertiesClass := TcxMaskEditProperties;
            TcxMaskEditProperties(TcxEditorRow(VGrd.Rows.Items[i]).Properties.EditProperties).MaskKind := emkRegExprEx;
            TcxMaskEditProperties(TcxEditorRow(VGrd.Rows.Items[i]).Properties.EditProperties).EditMask := TDBShema(MaskTemplate.ElemeSource).DB.FieldByName(MaskTemplate.FieldSourceTemplateName).AsString;
          end;

        end;
      end;
    end;
  end;
end;
//******************************************************************************
procedure SaveVDataToDB( VGrd:TcxVerticalGrid; aView:TcxGridDBTableView; AcceptFieldName:TVarArr );
var i:integer;
    CurrFiled:String;
    CurrValue:Variant;

function CheckAcceptField(aFieldName:String):Boolean;
var i:integer;
begin
  result := False;

  for i:=0 to Length(AcceptFieldName)-1 do
  if CompareText(aFieldName,AcceptFieldName[i]) = 0 then
  begin
    result := True;
    Break;
  end;

end;
begin
  if aView.DataController.DataSource.DataSet.State in [DsBrowse] then aView.DataController.DataSource.DataSet.Edit;

  //******************************************************
  for i:=0 to VGrd.Rows.Count-1 do
  begin
    if (aView.Columns[i].DataBinding.Field<>nil) and
       (aView.Columns[i].DataBinding.Field.ReadOnly = false) and (aView.Columns[i].DataBinding.Field.Tag<>-1) then
    begin
      CurrFiled:=aView.Columns[i].DataBinding.FieldName;

      if (TcxEditorRow( VGrd.Rows.Items[i]).Tag <> -1) and (not CheckAcceptField(CurrFiled)) then   // {( VGrd.Rows[i].visible ) and } забрав бо не записуэ скриті дані
      begin
        if TcxEditorRow( VGrd.Rows.Items[i]).Properties.Value<>null then
        begin
          CurrValue := TcxEditorRow( VGrd.Rows.Items[i]).Properties.Value;

          if (TcxEditorRow( VGrd.Rows.Items[i]).Properties.EditPropertiesClass = TcxDateEditProperties) or
          (TcxEditorRow( VGrd.Rows.Items[i]).Properties.EditPropertiesClass = TcxTimeEditProperties)then CurrValue:=DateTimeToStr(CurrValue);


          aView.DataController.DataSource.DataSet.FieldByName(CurrFiled).AsString := CurrValue;
        end
         else
           aView.DataController.DataSource.DataSet.FieldByName(CurrFiled).Value:=null;
      end;
    end;
  end;
end;
//******************************************************************************
procedure TFrmInputData.ButOkClick(Sender: TObject);
var ChValidate:boolean;
begin
  ButOk.SetFocus;
  
  SaveVDataToDB( VGrid, self.View,  self.Elem.GetArrStafFieldArr  );
  if ( CheckAllowNullField( VGrid, self.View ) and (CheckUnicalDataInput(FMasUnicalFields,FUTypeCheck) ) ) AND
     CheckUniqFieldNames( Elem, self.View ) then
  begin
    if Elem is TDBShemaView then TDBShemaView(Elem).SaveDataFromInputForm( self.View, false );
    if Elem is TDBShemaTree then TDBShemaTree(Elem).SaveDataFromInputForm( self.View, false );

    if @FFunctValidate <> nil then
      ChValidate := FFunctValidate( self.View.DataController.DataSet )
    else ChValidate:= true;

    FIsUpdate:= False;
    if ChValidate then ModalResult:=mrOk;
  end;
end;
//******************************************************************************
procedure TFrmInputData.ButCancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;
//******************************************************************************
procedure TFrmInputData.FormDestroy(Sender: TObject);
begin
  //SaveContrToIni(self, GetFileNameOptionIni,'',self.KeyIni);
end;
//******************************************************************************
procedure TFrmInputData.FormShow(Sender: TObject);
begin
  //LoadContrFromIni(self, GetFileNameOptionIni ,'',self.KeyIni);
  PositionFormCenterFromMainForm( self );

  ButShowLog.Visible := self.Elem.DBGetParamConnect.TypeConnect <> optTypeConUnknown;
  VGrid.FocusRow(VGrid.FirstVisibleRow,1);
  VGrid.ShowEdit;
  IsUpdate := False;
end;
//******************************************************************************
Function TFrmInputData.CheckUnicalDataInput( aMasUnicalFields:array of string;
                                             aUTypeCheck:TUnicalTypeCheckField ):boolean;
var i:integer;
    j:integer;
    currValue:variant;
    currValueStr:string;
    CountFind:Integer;
    aListData:TStringList;
    aListInputData:TStringList;
    CurrStrData:String;
    SaveFirstRowField:TcxCustomRow;
    CountFieldValueSame:integer;
    UpdateId:variant;
    CurrId:variant;
    Fview:TcxGRidDBTableView;
//**********************************************************    
function CheckField(Afield:String):boolean;
var i:integer;
begin
  result:=false;
  for I := 0 to Length(aMasUnicalFields) - 1 do
  if compareText(aMasUnicalFields[i],Afield)=0 then
  begin
    result:=true;
    break;
  end;
end;
//**********************************************************
begin
  result:=true;
  Fview := self.View;
  if length(aMasUnicalFields)=0 then  exit;
  try
    aListData:=TStringList.Create;
    aListInputData:=TStringList.Create;

    UpdateId:=FView.Controller.FocusedRow.Values[ Fview.GetColumnByFieldName( Fview.DataController.KeyFieldNames ).Index ];
    for i:=0 to FView.ViewData.RecordCount - 1 do
        begin
          CurrStrData:='';
          for j:=0 to Length(aMasUnicalFields)- 1 do
          begin
           CurrId:=GetValueFromRecord(Fview.DataController.KeyFieldNames,FView, i);

           if CurrId<>UpdateId then
              begin
               currValue:=GetValueFromRecord(aMasUnicalFields[j],FView, i);
               if currValue=null then currValue:='';
               currValueStr:=String(currValue);
               if currValueStr<>'' then currValueStr:=aMasUnicalFields[j]+'_'+currValueStr;

               if (aUTypeCheck=itAnd)and(currValueStr<>'') then
                  CurrStrData:=CurrStrData+currValueStr;

               if (aUTypeCheck=itOr)and(currValueStr<>'') then
                  aListData.Add(currValueStr);
              end;
          end;
          //************
         if (CurrStrData<>'')and(aUTypeCheck=itAnd) then
             aListData.Add(CurrStrData);
        end;
     //*********************************************
     CurrStrData:='';
     for i:=0 to self.VGrid.Rows.Count-1 do
     begin
      if (TcxEditorRow(self.VGrid.Rows.Items[i]).Visible)and(FView.Columns[i].DataBinding.Field<>nil)and(CheckField(FView.Columns[i].DataBinding.Field.FieldName))then
      begin
       if SaveFirstRowField=nil then
          SaveFirstRowField:=self.VGrid.Rows.Items[i];
       currValue:=TcxEditorRow(self.VGrid.Rows.Items[i]).Properties.Value;
       if currValue=null then currValue:='';
       currValueStr:=String(currValue);
       if currValueStr<>'' then currValueStr:=FView.Columns[i].DataBinding.Field.FieldName+'_'+currValueStr;

       if aUTypeCheck=itAnd then CurrStrData:=CurrStrData+currValueStr;
       if aUTypeCheck=itOr  then
          begin
           if aListData.IndexOf(currValueStr)<>-1 then
              begin
               self.VGrid.Rows.Items[i].Focused:=true;
               MessageDlg('Value already exists.', mtError, [mbok], 0);
               result:=false;
               exit;
              end;
          end;
      end;
     end;
     //*********************************************
     if aUTypeCheck=itAnd then
     begin
       if (CurrStrData<>'')and(aListData.IndexOf(CurrStrData)=-1) then result:=true
       else
       begin
         MessageDlg('Value already exists.', mterror, [mbok], 0);
         if SaveFirstRowField<>nil then
         begin
           SaveFirstRowField.Focused:=true;
           result:=false;
         end;
       end;
     end;
     //*********************************************
  finally
    FreeAndNil(aListData);
    FreeAndNil(aListInputData);
  end;
  //******************************************
end;
//******************************************************************************
procedure TFrmInputData.VGridDrawRowHeader(Sender: TObject;
  ACanvas: TcxCanvas; APainter: TcxvgPainter;
  AHeaderViewInfo: TcxCustomRowHeaderInfo; var Done: Boolean);
var CaptRect:TRect;
begin
  CaptRect := AHeaderViewInfo.CaptionsInfo[0].CaptionRect;
  CaptRect.Left:= 0;

  ACanvas.FillRect( CaptRect, clBtnFace);
  if (not AHeaderViewInfo.Focused) then
  begin
   ACanvas.FillRect( CaptRect, clBtnFace);
   ACanvas.Font       := TcxVerticalGrid(Sender).Styles.Header.Font;
   ACanvas.Font.Color := TcxVerticalGrid(Sender).Styles.Header.TextColor
  end
  else
   begin
     if (AHeaderViewInfo.Focused)and(TcxVerticalGrid(Sender).IsFocused) then
     begin
       ACanvas.Font       := TcxVerticalGrid(Sender).Styles.Selection.Font;
       ACanvas.Font.Color := TcxVerticalGrid(Sender).Styles.Selection.TextColor;
       ACanvas.FillRect( CaptRect, TcxVerticalGrid(Sender).Styles.Selection.Color );
     end
      else
      begin
        ACanvas.Font       := TcxVerticalGrid(Sender).Styles.Inactive.Font;
        ACanvas.Font.Color := TcxVerticalGrid(Sender).Styles.Inactive.TextColor;
        ACanvas.FillRect( CaptRect, TcxVerticalGrid(Sender).Styles.Inactive.Color );
      end;
   end;

  CaptRect.Left:=5;
  ACanvas.DrawTexT( AHeaderViewInfo.CaptionsInfo[0].Caption , CaptRect, taLeftJustify , vaCenter ,False,false );
  //************************************
  if (TcxEditorRow(AHeaderViewInfo.Row).Properties.Caption='')or(AHeaderViewInfo.Row.Focused)  then
  begin
   ACanvas.Brush.Color:=clSilver;
   ACanvas.FillRect(AHeaderViewInfo.ButtonRect);
  end;

  Done:=true;
end;
//******************************************************************************
procedure TFrmInputData.VGridDrawValue(Sender: TObject; ACanvas: TcxCanvas;
  APainter: TcxvgPainter; AValueInfo: TcxRowValueInfo; var Done: Boolean);
begin
  if (TcxEditorRow(AValueInfo.Row).Properties.Caption='')or(AValueInfo.Row.Focused)  then
  begin
    ACanvas.Brush.Color:=clSilver;
    ACanvas.FillRect(AValueInfo.BoundsRect);
  end;
  //*********************************
  if (TcxEditorRow(AValueInfo.Row).Properties.EditProperties<>nil)and
    (TcxEditorRow(AValueInfo.Row).Properties.EditProperties.ReadOnly) then
  begin
    ACanvas.Brush.Color:=clMenu;
    ACanvas.FillRect(AValueInfo.BoundsRect);
  end;
end;
//******************************************************************************
Procedure TFrmInputData.EditButClick(Sender: TObject);
var But:TcxButtonEditProperties;
    BEdit:TObject;
begin
  if TcxEditorRow(self.VGrid.FocusedRow).Properties.EditProperties is TcxButtonEditProperties then
  begin
    But  := TcxButtonEditProperties(TcxEditorRow(self.VGrid.FocusedRow).Properties.EditProperties);
    But.OnButtonClick(Sender,0);
  end;
end;
//******************************************************************************
procedure TFrmInputData.AddMasUnicalFieldForRow(amasField: array of string;UTypeCheck:TUnicalTypeCheckField);
var i:integer;
begin
  SetLength(FMasUnicalFields,Length(amasField));
  for i:=0 to Length(amasField) - 1 do
    FMasUnicalFields[i]:=amasField[i];

  FUTypeCheck:=UTypeCheck;
end;
//******************************************************************************
procedure TFrmInputData.VGridDblClick(Sender: TObject);
begin
  EditButClick(nil);
end;
//******************************************************************************
procedure TFrmInputData.VGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var x,y:word;
begin
  if Key = Vk_Tab then
  begin

    if VGrid.FocusedRow <> VGrid.LastVisibleRow then
    begin
      VGrid.NextVisibleRow(VGrid.FocusedRow).Focused:=true;
      VGrid.ShowEdit;
      Abort;
    end
    else ButOk.SetFocus;

  end
  else
  if Key=Vk_Return then EditButClick(nil);
end;
//******************************************************************************
procedure TFrmInputData.SetFunctValidate(
  const Value: TValidtateBeforePost);
begin
  FFunctValidate:= Value;
end;
//******************************************************************************
function AddfieldToVGrid( FInputVgrid : TcxVerticalGrid; Column:TcxGridDBColumn;aValue:Variant; FFieldNumber:String ):TcxEditorRow;
var RowClas:TcxCustomRowClass;
    d:TcxImageComboBoxItem;
    AlistData:TStringList;
    i:integer;
    item: TcxImageComboBoxItem;
    Items: TcxImageComboBoxItems;
    bmk:TBookmark;
begin
  result:= FInputVgrid.AddChild(nil, TcxEditorRow) as TcxEditorRow ;
  With Result do
    begin
      Properties.EditPropertiesClass := Column.PropertiesClass;
      Properties.Caption := Column.Caption;
      
      if Column.AlternateCaption <>'' then
        Properties.Caption := Column.AlternateCaption;

      Properties.Options.Editing:=Column.Options.Editing;
      if Column.Properties<>nil then
        Properties.EditProperties.ReadOnly:= Column.Properties.ReadOnly;

      FInputVgrid.Rows.Items[FInputVgrid.Rows.Count-1].Name := 'Row_' + Column.DataBinding.FieldName + '_' + IntToStr(FInputVgrid.Rows.Items[FInputVgrid.Rows.Count-1].Index );
      //************************************************************
      Properties.DataBinding.ValueTypeClass:=Column.DataBinding.ValueTypeClass;
      //************************************************************
      Properties.Value := aValue;//Column.EditValue;
      FInputVgrid.Rows.Items[FInputVgrid.Rows.Count-1].Tag:=Column.Tag;

      if (Column.DataBinding.Field=nil)and(Column.PropertiesClass<>TcxButtonEditProperties) then
        FInputVgrid.Rows.Items[FInputVgrid.Rows.Count-1].Visible := false;
      //************************************************************
      if (Column.DataBinding.Field<>nil)and((Column.DataBinding.Field.FieldKind<>fkData)or(Column.DataBinding.Field.ReadOnly)or(Column.Tag=4)) then
      begin
        Properties.EditPropertiesClass :=TcxTextEditProperties;
        TcxTextEditProperties(Properties.EditProperties).ReadOnly := true;
      end;
      //************************************************************
      if (Column.DataBinding.FieldName = FFieldNumber)and( FFieldNumber<>'' )and(Properties.EditProperties<>nil) then
        TcxTextEditProperties(Properties.EditProperties).ReadOnly:=true;
      //************************************************************
      if (Column.DataBinding.Field<>nil)and((Column.DataBinding.Field.FieldKind=fkCalculated)) then
      begin
        Properties.EditPropertiesClass :=TcxTextEditProperties;
        TcxTextEditProperties(Properties.EditProperties).ReadOnly:=true;
      end;
      //************************************************************
      if (Column.Tag=-1)or(Column.Tag=-100)or((Column.DataBinding.Field<>nil)and(Column.DataBinding.Field.ReadOnly))or(not Column.Visible) then
        FInputVgrid.Rows.Items[FInputVgrid.Rows.Count-1].Visible:=false;
      //************************************************************
      if (Column.Tag=100) then FInputVgrid.Rows.Items[FInputVgrid.Rows.Count-1].Visible:=true;
      //************************************************************
      if Column.PropertiesClass=TcxDateEditProperties then
        TcxDateEditProperties(Properties.EditProperties).Assign(TcxDateEditProperties(Column.Properties));
      //************************************************************
      if Column.PropertiesClass=TcxTimeEditProperties then
        TcxTimeEditProperties(Properties.EditProperties).Assign(TcxTimeEditProperties(Column.Properties));
      //************************************************************
      if Column.PropertiesClass=TcxCheckBoxProperties then
        TcxCheckBoxProperties(Properties.EditProperties).Assign(TcxCheckBoxProperties(Column.Properties));
      //************************************************************
      if (Column.PropertiesClass=TcxButtonEditProperties) then
       begin
         TcxButtonEditProperties(Properties.EditProperties).Assign(TcxButtonEditProperties(Column.Properties));
         TcxButtonEditProperties(Properties.EditProperties).ReadOnly:=Column.Properties.ReadOnly;

         //if (Column.Tag=3) then
         //    TcxButtonEditProperties(Properties.EditProperties).OnButtonClick:= FButClickEditText;//TcxButtonEditProperties(Column.Properties).OnButtonClick

         if (Column.Tag=5) then
             TcxButtonEditProperties(Properties.EditProperties).OnButtonClick:= TcxButtonEditProperties(Column.Properties).OnButtonClick;

         Properties.Options.ShowEditButtons:=eisbAlways;
         if (Column.Tag<>-1)and(Column.Visible) then
            FInputVgrid.Rows.Items[FInputVgrid.Rows.Count-1].Visible:=true;

        if (Column.Tag=10) then
            begin
              FInputVgrid.Rows.Items[FInputVgrid.Rows.Count-1].Visible:=true;
              TcxButtonEditProperties(Properties.EditProperties).ReadOnly:=true;
              TcxButtonEditProperties(Properties.EditProperties).OnButtonClick:= TcxButtonEditProperties(Column.Properties).OnButtonClick;
            end;

        if Column.DataBinding.Field=nil then
          TcxTextEditProperties(Properties.EditProperties).ReadOnly:=true;
       end;
      //************************************************************
      if Column.PropertiesClass=TcxExtLookupComboBoxProperties then
        TcxExtLookupComboBoxProperties(Properties.EditProperties).Assign( TcxExtLookupComboBoxProperties(Column.Properties) ) ;
      //************************************************************
      if (Column.PropertiesClass=TcxLookupComboBoxProperties) then
        TcxLookupComboBoxProperties(Properties.EditProperties).Assign(TcxLookupComboBoxProperties(Column.Properties));
      //************************************************************
      if (Column.PropertiesClass=TcxCheckComboBoxProperties) then
        TcxCheckComboBoxProperties(Properties.EditProperties).Assign(TcxCheckComboBoxProperties(Column.Properties));
      //************************************************************
      if Column.Tag = 22  then Properties.Value := Now;
      if Column.PropertiesClass=TcxImageComboBoxProperties then
        TcxImageComboBoxProperties(Properties.EditProperties).Assign(TcxImageComboBoxProperties(Column.Properties));
       //***********************************************************
      if Column.PropertiesClass=TcxComboboxProperties then
        TcxTimeEditProperties(Properties.EditProperties).Assign(TcxTimeEditProperties(Column.Properties));
      if Column.PropertiesClass=TcxBLOBEditProperties then
        TcxBLOBEditProperties(Properties.EditProperties).Assign(TcxBLOBEditProperties(Column.Properties));
      if Column.PropertiesClass=TcxImageProperties then
        TcxImageProperties(Properties.EditProperties).Assign(TcxImageProperties(Column.Properties));
      if Column.PropertiesClass=TcxMaskEditProperties then
      begin
        TcxMaskEditProperties(Properties.EditProperties).Assign(TcxMaskEditProperties(Column.Properties));
        TcxMaskEditProperties(Properties.EditProperties).OnValidate := TcxMaskEditProperties(Column.Properties).OnValidate;
      end;
         //TcxMaskEditProperties(Properties.EditProperties).OnValidate
    end;
end;
//******************************************************************************
procedure TFrmInputData.ButShowLogClick(Sender: TObject);
begin
  if self.Elem.DBGetParamConnect.TypeConnect <> optTypeConUnknown then
    ShowLogCore( self.Elem.DBGetParamConnect, nil, -1, self.Elem.GetValueId, [], self.Elem.StyleMarkLog );
end;
//******************************************************************************
procedure TFrmInputData.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if FIsUpdate then
  begin
    if MyShowMessageDlg( AskChangeDataSave, mtConfirmation, but_YES_NO ) = Res_YES then
      ButOk.click
    else
     ButCancel.Click;

    FIsUpdate := False;
  end;
end;
//******************************************************************************
procedure TFrmInputData.VGridEditValueChanged(Sender: TObject;
  ARowProperties: TcxCustomEditorRowProperties);
begin
  self.IsUpdate := True;
end;
//******************************************************************************
procedure TFrmInputData.VGridKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
  begin
    if VGrid.IsEditing then VGrid.CancelEdit
    else Close;
  end;
end;
//******************************************************************************
end.




