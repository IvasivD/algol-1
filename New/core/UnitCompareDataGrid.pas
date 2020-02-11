unit UnitCompareDataGrid;

interface
uses DB ,Forms,Controls,SysUtils,Dialogs,Classes ,cxClasses, frmCompareDataGrid, cxVGrid,Graphics,
     cxInplaceContainer ,cxStandardMask, cxStyles,Variants,UnitProc,
     ExtDlgs, cxCalendar, cxTimeEdit, cxVariants, ClipBrd, TypInfo, cxTextEdit,
     cxEdit, cxCheckBox, cxButtonEdit;

type
 TRowVGridDataPram = record
    Value:Variant;
    Caption:Widestring;
 end;

 TEditButProp = record
   ListImage  :TImageList;
   ImageIndex :Integer;
   ButtonEvent:TcxEditButtonClickEvent;
   Hint : WideString;
 end;
 PEditButProp = ^TEditButProp;

 TDataValue = record
   FieldName:WideString;
   Caption :WideString;
   Value :Variant;
   DisplayText:Widestring;
   ValueType:TFieldType;
   Visible:Boolean;
   Compare:Boolean;
   ShowButtonEvent:PEditButProp;
 end; 

 PDataValue = ^TDataValue;
 PDataValueArr = array of array of PDataValue;

 TDataValueParamArr = record
   data : PDataValueArr;

   ShowErrorMessage:boolean;
   SearchInDeleted:Boolean;
   CaptionGrid: WideString;
   CaptionSelect:WideString;
 end;

 TEventUpdate   = function ( valueDataLeft,valueDataRight:TDataValueParamArr;SearchInDeleted:Boolean; ShowMessage:Boolean  ) : integer of object;
 TEventResfresh = procedure( valueDataLeft ,valueDataRight :TDataValueParamArr; SearchInDeleted:Boolean; ShowMessageError :Boolean ) of object;



 TDataValueArr = record
  param:TDataValueParamArr;
  //data : PDataValueArr;

  AcceptAct : TEventUpdate;
  RefreshAct:TEventResfresh;
  NewAct    : TEventUpdate;

  //ShowErrorMessage:boolean;
  //SearchInDeleted:Boolean;
  //CaptionGrid: WideString;
  //CaptionSelect:WideString;
 end;

 TParamFindCheck  = record
   KeyFieldName :string;
   ValueForKeyFieldName:Variant;
 end;
 PParamFindCheck = ^TParamFindCheck;



 TEventGetInfoMessageHelp = function ( valueDataLeft,valueDataRight:TDataValueArr ): Widestring;
 TParamMessageInfo = record
   HeightArea : Integer;
   Font : TFont;
   ColorBg : TColor;
   GetInfoMessageFunc : TEventGetInfoMessageHelp;
 end;
 PParamMessageInfo = ^TParamMessageInfo;

 TCompareDataGrid = class
 private
  FDstFrom :TDataValueArr;
  FDstTo   :TDataValueArr;
  FFrmLimitHeight:Integer;
  FNormalContentStyleLeft:TcxStyle;
  FNormalContentStyleRight:TcxStyle; 
  FMarkDifStyle:TcxStyle;
  FFillSameWhenDifferentCountRows:Boolean;
  FSelectOnlyOne:Boolean;

  FParamFindCheckLeft : PParamFindCheck;
  FParamFindCheckRight : PParamFindCheck;

  procedure FCompareVGrid(VLGrid , VRGrid: TcxVerticalGrid;MarkDifStyle,SplitSelectStyle:TcxStyle);
  procedure FPrepareGrid(VGrid: TcxVerticalGrid; datValue : TDataValueArr;Add:Boolean= false;ShowEmptySelectRow:Boolean=false );
  procedure ButAcceptRightClick(Sender: TObject);
  procedure ButAcceptLeftClick(Sender: TObject);
  procedure ButRefreshRightClick(Sender: TObject);
  procedure ButRefreshLeftClick(Sender: TObject);

  procedure ButNewRightClick(Sender: TObject);
  procedure ButNewLeftClick(Sender: TObject);

  function  FFindCheckedRow( VGrid: TcxVerticalGrid ):TcxCustomRow;
  procedure FVGridEditValueChanged(Sender: TObject; ARowProperties: TcxCustomEditorRowProperties);
  procedure FSelectOnlyOneRow( VGrid: TcxVerticalGrid; ForRowSheck:TcxCustomEditorRowProperties  );
  procedure FAddRowToVerticalGrid( VGrid: TcxVerticalGrid; FieldName, Caption:Widestring; Value:Variant;
                                   DisplayText:widestring;FType:TFieldType;FVisible,FCompare:Boolean;
                                   ShowCheckSelectBoxCaption:String='';ShowButtonEvent:PEditButProp=nil );
  procedure FRefresh(FillSameWhenDifferentCountRows:Boolean);
  function  FCalcHeightGrid(VGrid: TcxVerticalGrid):Integer;
  procedure FSetAutoHeightForm(LimitHeght:Integer);
  procedure FSetFocusRow( VGrid: TcxVerticalGrid; FieldName:string;FieldValue:Variant );
  function  FFindSelectedValueByFocusRowAndFieldName( VGrid: TcxVerticalGrid; FieldName:string ):Variant;
  function  FFindSelectedDataByFocusRowAndFieldName( SearchInData: TDataValueArr;  FieldName:string ):Integer;
  function  FSetCheckByFieldNameAndId( SearchInData: TDataValueArr; FieldName:string; Value:Variant; Check:Boolean=True  ):Integer;
  function  FFindIndexDataByFieldNameAndValue(SearchInData: TDataValueArr; FieldName:string; Value:Variant):Integer;
  function  FFindRowByFieldAndValue(VGrid: TcxVerticalGrid; FieldName:string;FieldValue:Variant):TcxCustomRow;
  function  FFindValueFromFocusRowToUp(VGrid: TcxVerticalGrid;FieldName:string):TRowVGridDataPram;
  function  FFindValueFromFocusRowToDown(VGrid: TcxVerticalGrid;FieldName:string):TRowVGridDataPram;

  procedure FRefreshCheck;
  procedure FPrepareShowMessageInfo(ParamMessageInfo  : PParamMessageInfo);
 public

  constructor Create(SelectOnlyOne:Boolean);
  destructor Close;

  procedure RefreshRightData(DstTo : TDataValueArr);
  procedure RefreshLeftData (DstFrom : TDataValueArr);
  procedure RefreshBothData(DstFrom : TDataValueArr;DstTo : TDataValueArr);
  procedure ButRRefesh;
  procedure ButLRefesh;

  function  isEqualViewData : Boolean;
  function  isEqual(DstFrom , DstTo: TDataValueArr):boolean;
  function  isFindEqualFromInTo( DstFrom , DstTo: TDataValueArr ):boolean;
  procedure SetRFocusRow( FieldName:string;FieldValue:Variant );
  procedure SetLFocusRow( FieldName:string;FieldValue:Variant );
  function  FindSelectedDataByFocusRowAndFieldNameLeft( FieldName:string ):Integer;
  function  FindSelectedDataByFocusRowAndFieldNameRight( FieldName:string ):Integer;
  function  GetFocusedRValue:TRowVGridDataPram;
  function  GetFocusedLValue:TRowVGridDataPram;


  function  FindAndCheckDataByFocusRowAndFieldNameLeft( FieldName:string;aValue:Variant; aCheck:Boolean=True ):Integer;
  function  FindAndCheckDataByFocusRowAndFieldNameRight( FieldName:string;aValue:Variant; aCheck:Boolean=True ):Integer;
  function  FindValueFromLFocusRowToUp(FieldName:string):TRowVGridDataPram;
  function  FindValueFromRFocusRowToUp(FieldName:string):TRowVGridDataPram;
  function  FindValueFromFocusRRowToDown(FieldName:string):TRowVGridDataPram;
  function  FindValueFromFocusLRowToDown(FieldName:string):TRowVGridDataPram;


  procedure Show(CaptionForm:string;
                FrmWidth,FrmLimitHeight,
                GridHeaderWidth:Integer;
                FormResize,FillSameWhenDifferentCountRows:Boolean;
                DstFrom , DstTo: TDataValueArr;
                ButtLeftCaption:Widestring;
                ButtRightCaption:Widestring;
                ButLeftRefreshCaption:Widestring;
                ButRightRefreshCaption:Widestring;
                ButLeftNewCaption:Widestring;
                ButRightNewCaption:Widestring;
                MarkDifStyle:TcxStyle;
                
                ParamFindCheckLeft:PParamFindCheck=nil;
                ParamFindCheckRight:PParamFindCheck=nil;
                ParamMessageInfo  : PParamMessageInfo = nil );

 property  DataFrom:TDataValueArr read FDstFrom ;
 property  DataTo:TDataValueArr read FDstTo ;

 end;

implementation

{ TCompareDataGrid }
//******************************************************************************
destructor TCompareDataGrid.Close;
begin

end;
//******************************************************************************
constructor TCompareDataGrid.Create(SelectOnlyOne:Boolean);
begin
  FSelectOnlyOne:= SelectOnlyOne;
end;
//******************************************************************************
procedure TCompareDataGrid.FAddRowToVerticalGrid( VGrid: TcxVerticalGrid; FieldName, Caption:Widestring; Value:Variant;
                                                  DisplayText:widestring;FType:TFieldType;FVisible,FCompare:Boolean;
                                                  ShowCheckSelectBoxCaption:String='';
                                                  ShowButtonEvent:PEditButProp=nil );
var NewRow:TcxCustomRow;
begin
 NewRow:=VGrid.AddChild(nil, TcxEditorRow);
 with NewRow as TcxEditorRow do
  begin
    Properties.Caption := Caption;

    NewRow.Height:=18;

    if FType in[ ftInteger ,ftLargeint , ftString ] then
      Properties.EditPropertiesClass := TcxTextEditProperties;
    //**********************
    if FType in[ ftDateTime ] then
      Properties.EditPropertiesClass := TcxDateEditProperties;
    //**********************
    if (FType in[ ftBoolean ]) then
    begin
      if ( String(Value) = DisplayText ) then
        Properties.EditPropertiesClass := TcxCheckBoxProperties
      else Properties.EditPropertiesClass := TcxTextEditProperties;
    end;

    if ShowButtonEvent <> nil then
    begin
      Properties.EditPropertiesClass:=TcxButtonEditProperties;
      if @ShowButtonEvent.ButtonEvent <> nil then
        TcxButtonEditProperties(Properties.EditProperties).OnButtonClick := ShowButtonEvent.ButtonEvent;

      TcxButtonEditProperties(Properties.EditProperties).Images := ShowButtonEvent.ListImage;
      TcxButtonEditProperties(Properties.EditProperties).Buttons.Items[0].Hint := ShowButtonEvent.Hint;
      if ShowButtonEvent.ImageIndex <> -1 then
      begin
        TcxButtonEditProperties(Properties.EditProperties).Buttons.Items[0].Kind := bkGlyph;
        TcxButtonEditProperties(Properties.EditProperties).Buttons.Items[0].ImageIndex := ShowButtonEvent.ImageIndex;
      end;
      
      //Dispose(ShowButtonEvent);
    end;

    Properties.Value:= DisplayText;

    Properties.EditProperties.ReadOnly:= true;
    Properties.HeaderAlignmentHorz:= taLeftJustify;
    Properties.HeaderAlignmentVert:= vaCenter;
    visible := FVisible;

    NewRow.Name:=VGrid.Name + 'Row_'+ FieldName + '_' + IntToStr( NewRow.Index );

    if FCompare then NewRow.Tag := 0
    else NewRow.Tag := -1;

    if FieldName='Empty' then
    begin
      TcxEditorRow(NewRow).Tag := -10;
      TcxEditorRow(NewRow).Properties.Caption := ShowCheckSelectBoxCaption;
      
      if ShowCheckSelectBoxCaption<>'' then
      begin
       Properties.EditPropertiesClass := TcxCheckBoxProperties;
       Properties.Value:=False;
       TcxEditorRow(NewRow).Styles.Header := VGrid.Styles.Header;
      end;
      //else
      //TcxEditorRow(NewRow).Styles.Content := VGrid.Styles.Header;
      //TcxEditorRow(NewRow).Styles.Content.Color := clSilver;
     //************************************
    end;
  end;
end;
//******************************************************************************
procedure TCompareDataGrid.FSelectOnlyOneRow( VGrid: TcxVerticalGrid; ForRowSheck:TcxCustomEditorRowProperties );
var i:integer;
begin
  for i:=0 to VGrid.Rows.Count-1 do
  begin
    if TcxEditorRow( VGrid.Rows.Items[i] ).Tag = -10 then
      TcxEditorRow( VGrid.Rows.Items[i] ).Properties.Value:= False;
  end;
  //*********************************************
  if TcxEditorRow( ForRowSheck.Row ).Tag = -10 then
    TcxEditorRow( ForRowSheck.Row ).Properties.Value := True;
  //*********************************************
end;
//******************************************************************************
procedure TCompareDataGrid.FVGridEditValueChanged(Sender: TObject;
  ARowProperties: TcxCustomEditorRowProperties);
begin
 if ( FSelectOnlyOne ) and
    ( ARowProperties.Row.Tag = -10 ) and
    ( ARowProperties.EditPropertiesClass = TcxCheckBoxProperties ) then
 begin
   FSelectOnlyOneRow( TcxVerticalGrid(Sender), ARowProperties );
   if TcxVerticalGrid(Sender).IsEditing then
    TcxVerticalGrid(Sender).HideEdit;
 end;
end;
//******************************************************************************
function TCompareDataGrid.FFindCheckedRow( VGrid: TcxVerticalGrid ):TcxCustomRow;
var i:integer;
begin
  result := nil;
  for i:=0 to VGrid.Rows.Count-1 do
  begin
    if ( VGrid.Rows.Items[i].Tag = -10 ) and
       ( TcxEditorRow( VGrid.Rows.Items[i] ).Properties.Value = True ) then
    begin
      result := VGrid.Rows.Items[i];
      Break;
    end;
  end;
end;
//******************************************************************************
procedure TCompareDataGrid.FPrepareGrid( VGrid: TcxVerticalGrid; datValue : TDataValueArr;Add:Boolean= false;ShowEmptySelectRow:Boolean=false );
var i,j:Integer;
begin
  if not Add then VGrid.ClearRows;
  VGrid.Parent.Visible:= Length(datValue.param.data) <> 0;

  if ShowEmptySelectRow then
    FAddRowToVerticalGrid( VGrid, 'Empty', '', '', '', ftString, True,false, datValue.param.CaptionSelect );
  //********************************************
  for i:=0 to Length( datValue.param.data )-1 do
  begin
    for j:=0 to Length( datValue.param.data[i] )-1 do
    begin
      FAddRowToVerticalGrid( VGrid, datValue.param.data[i][j].FieldName,datValue.param.data[i][j].Caption,
                             datValue.param.data[i][j].Value, datValue.param.data[i][j].DisplayText, datValue.param.data[i][j].ValueType,
                             datValue.param.data[i][j].Visible,datValue.param.data[i][j].Compare,'', datValue.param.data[i][j].ShowButtonEvent  );
    end;
  //********************************************
    if (i <> Length(datValue.param.data)-1) and ( ShowEmptySelectRow ) then
      FAddRowToVerticalGrid( VGrid, 'Empty', '', '', '', ftString, True, false, datValue.param.CaptionSelect, nil );
  end;

  //************************
  VGrid.OnEditValueChanged := FVGridEditValueChanged;
end;
//******************************************************************************
function TCompareDataGrid.isEqual( DstFrom , DstTo: TDataValueArr ):boolean;
var i,j:Integer;
begin
 result:=true;
 for i:=0 to Length(DstFrom.param.data)-1 do
 begin
  for j:=0 to Length( DstFrom.param.data[i] )-1 do
  begin
    if ( DstFrom.param.data[i][j].Visible) and (DstTo.param.data[i][j].Visible) and
       ( DstFrom.param.data[i][j].Compare) and (DstTo.param.data[i][j].Compare) and
       ( ( DstFrom.param.data[i][j].FieldName <> DstTo.param.data[i][j].FieldName ) OR
       ( CompareText( string(DstFrom.param.data[i][j].Value) , string(DstTo.param.data[i][j].Value) ) <> 0 ) ) then
       begin
         result:=False;
         Break;
       end;
  end;
 end;
end;
//******************************************************************************
function TCompareDataGrid.isFindEqualFromInTo( DstFrom , DstTo: TDataValueArr ):boolean;
var i,j:Integer;
begin
 result:=true;
 for i:=0 to Length(DstFrom.param.data)-1 do
 begin
  for j:=0 to Length(DstTo.param.data[i])-1 do
  begin
    if ( DstFrom.param.data[i][j].Visible) and (DstTo.param.data[i][j].Visible) and
       ( DstFrom.param.data[i][j].Compare) and (DstTo.param.data[i][j].Compare) and
       ( ( DstFrom.param.data[i][j].FieldName <> DstTo.param.data[i][j].FieldName ) OR
       ( CompareText( string(DstFrom.param.data[i][j].Value) , string(DstTo.param.data[i][j].Value) ) <> 0 ) ) then
       begin
         result:=False;
         Break;
       end;
  end;
 end;
end;
//******************************************************************************
function TCompareDataGrid.isEqualViewData:Boolean;
begin
 if Length(self.FDstFrom.param.data)=Length(self.FDstTo.param.data) then
   result:= isEqual( self.FDstFrom , self.FDstTo )
 else result:=false;
end;
//******************************************************************************
procedure TCompareDataGrid.FCompareVGrid(VLGrid , VRGrid: TcxVerticalGrid;MarkDifStyle,SplitSelectStyle:TcxStyle);
var i:Integer;
begin
  try
    VLGrid.BeginUpdate;
    VRGrid.BeginUpdate;
    //*********************************
    try
    for i:=0 to VLGrid.Rows.Count-1 do
    begin

     if (TcxEditorRow( VLGrid.Rows.Items[i] ).Properties.Caption <> '')and
        ( i <= VRGrid.Rows.Count-1 )  and
        (TcxEditorRow( VRGrid.Rows.Items[i] ).Properties.Caption<>'')and
        (TcxEditorRow( VRGrid.Rows.Items[i] ).Tag <> -1 ) then
     begin
       If (TcxEditorRow( VLGrid.Rows.Items[i] ).Properties.Caption <> TcxEditorRow( VRGrid.Rows.Items[i] ).Properties.Caption )or
          (TcxEditorRow( VLGrid.Rows.Items[i] ).Properties.Value <> TcxEditorRow( VRGrid.Rows.Items[i] ).Properties.Value ) then
       begin
         TcxEditorRow( VLGrid.Rows.Items[i] ).Styles.Content := MarkDifStyle;
         TcxEditorRow( VRGrid.Rows.Items[i] ).Styles.Content := MarkDifStyle;
       end
        else
        begin
           TcxEditorRow( VLGrid.Rows.Items[i] ).Styles.Content := FNormalContentStyleLeft;
           TcxEditorRow( VRGrid.Rows.Items[i] ).Styles.Content := FNormalContentStyleRight;
        end;
     end;
     
     if ( i <= VRGrid.Rows.Count-1 )and
        ( TcxEditorRow( VRGrid.Rows.Items[i] ).Tag = -10 ) then
     begin
        TcxEditorRow( VLGrid.Rows.Items[i] ).Styles.Content := SplitSelectStyle;
        TcxEditorRow( VRGrid.Rows.Items[i] ).Styles.Content := SplitSelectStyle;
     end;
    end;
    except
     //ShowMessage(IntToStr(i));
    end;
  finally
    VLGrid.EndUpdate;
    VRGrid.EndUpdate;
  end;
end;
//******************************************************************************
procedure TCompareDataGrid.ButAcceptLeftClick(Sender: TObject);
var Res:Integer;
begin
  if @self.FDstFrom.AcceptAct <> nil then 
    Res:=self.FDstFrom.AcceptAct( self.FDstFrom.param, self.FDstTo.param, self.FDstFrom.param.SearchInDeleted, self.FDstFrom.param.ShowErrorMessage );
end;
//******************************************************************************
procedure TCompareDataGrid.ButAcceptRightClick(Sender: TObject);
var Res:Integer;
begin
  if @self.FDstTo.AcceptAct <> nil then
    Res:=self.FDstTo.AcceptAct( self.FDstFrom.param, self.FDstTo.param, self.FDstTo.param.SearchInDeleted, self.FDstTo.param.ShowErrorMessage );
end;
//******************************************************************************
procedure TCompareDataGrid.ButRefreshLeftClick(Sender: TObject);
begin
 if @self.FDstFrom.RefreshAct <> nil then
 self.FDstFrom.RefreshAct(self.FDstFrom.param,self.FDstTo.param, self.FDstFrom.param.SearchInDeleted,self.FDstFrom.param.ShowErrorMessage);
end;
//******************************************************************************
procedure TCompareDataGrid.ButRefreshRightClick(Sender: TObject);
begin
 if @self.FDstTo.RefreshAct <> nil then
   self.FDstTo.RefreshAct(self.FDstFrom.param, self.FDstTo.param,   self.FDstTo.param.SearchInDeleted,self.FDstTo.param.ShowErrorMessage);
end;
//******************************************************************************
procedure TCompareDataGrid.ButNewLeftClick(Sender: TObject);
var Res:Integer;
begin
  if @self.FDstFrom.NewAct <> nil then
    Res:=self.FDstFrom.NewAct( self.FDstFrom.param, self.FDstTo.param, self.FDstFrom.param.SearchInDeleted, self.FDstFrom.param.ShowErrorMessage );
end;
//******************************************************************************
procedure TCompareDataGrid.ButNewRightClick(Sender: TObject);
var Res:Integer;
begin
  if @self.FDstTo.NewAct <> nil then
    Res:=self.FDstTo.NewAct( self.FDstFrom.param, self.FDstTo.param, self.FDstTo.param.SearchInDeleted, self.FDstTo.param.ShowErrorMessage );
end;
//******************************************************************************
procedure TCompareDataGrid.RefreshLeftData(DstFrom : TDataValueArr);
begin
  DstFrom.AcceptAct := FDstFrom.AcceptAct;
  DstFrom.RefreshAct:= FDstFrom.RefreshAct;
  DstFrom.NewAct    := FDstFrom.NewAct;

  DstFrom.param.SearchInDeleted := FDstFrom.param.SearchInDeleted;

  FDstFrom := DstFrom;
  FRefresh(FFillSameWhenDifferentCountRows);
end;
//******************************************************************************
procedure TCompareDataGrid.RefreshRightData(DstTo : TDataValueArr);
begin
  DstTo.AcceptAct := FDstTo.AcceptAct;
  DstTo.RefreshAct:= FDstTo.RefreshAct;
  DstTo.NewAct    := FDstTo.NewAct;

  DstTo.param.SearchInDeleted :=FDstTo.param.SearchInDeleted;

  FDstTo := DstTo;
  FRefresh(FFillSameWhenDifferentCountRows);
end;
//******************************************************************************
procedure TCompareDataGrid.RefreshBothData(DstFrom : TDataValueArr;DstTo : TDataValueArr);
begin
  RefreshLeftData( DstFrom );
  RefreshRightData( DstTo );

  {DstFrom.AcceptAct := FDstFrom.AcceptAct;
  DstTo.AcceptAct   := FDstTo.AcceptAct;

  DstFrom.RefreshAct := FDstFrom.RefreshAct;
  DstTo.RefreshAct   := FDstTo.RefreshAct;

  DstFrom.NewAct     := FDstFrom.NewAct;
  DstTo.NewAct       := FDstTo.NewAct;

  DstFrom.param.SearchInDeleted := FDstFrom.param.SearchInDeleted;
  FDstFrom := DstFrom;

  DstTo.param.SearchInDeleted :=FDstTo.param.SearchInDeleted;
  FDstTo := DstTo;}

  FRefresh(FFillSameWhenDifferentCountRows);
end;
//******************************************************************************
function TCompareDataGrid.FCalcHeightGrid(VGrid: TcxVerticalGrid):Integer;
var i:integer;
    res:Real;
    CountVisible:Integer;
begin
  Result:=0;
  res:=0;
  CountVisible:=0;
  for i:=0 to VGrid.Rows.Count-1 do
  begin
    if VGrid.Rows.Items[i].Visible then
    begin
      if VGrid.Rows.Items[i].Height<>-1 then
        res := res + VGrid.Rows.Items[i].Height + 2
        else res := res + VGrid.OptionsView.RowHeight + 2;
      inc(CountVisible);
    end;
  end;
  Res:=Res - CountVisible ;
  Result:=Round(Res);
end;
//******************************************************************************
procedure TCompareDataGrid.FSetAutoHeightForm(LimitHeght:Integer);
var CalcHeight:Integer;
    CalcLHeight:integer;
    CalcRHeight:integer;

    HeightMessgeInfHelpPanel:Integer;
begin
 if FrmCompareData = nil then exit;

 if FrmCompareData.TextDescriptHelp.Visible then
   HeightMessgeInfHelpPanel := FrmCompareData.TextDescriptHelp.Height
 else HeightMessgeInfHelpPanel :=0;

 CalcLHeight:=FrmCompareData.panelCaptionFrom.Height + 2 + FCalcHeightGrid( FrmCompareData.VGridLeft ) + FrmCompareData.PanelBottomLeft.Height + 3;
 CalcRHeight:=FrmCompareData.panelCaptionTo.Height + 2 + FCalcHeightGrid( FrmCompareData.VGridRight ) + FrmCompareData.PanelBottomRight.Height + 3;

 //FrmCompareData.PanelLeft.Height
 //FrmCompareData.PanelRight.Height

 if CalcLHeight>= CalcRHeight then
   CalcHeight := CalcLHeight
 else CalcHeight:= CalcRHeight;
 
 if CalcHeight <= LimitHeght  then
   FrmCompareData.ClientHeight :=  CalcHeight + HeightMessgeInfHelpPanel
 else
   FrmCompareData.ClientHeight := LimitHeght + HeightMessgeInfHelpPanel;
    
 FrmCompareData.Constraints.MinHeight := FrmCompareData.ClientHeight;
end;
//******************************************************************************
function TCompareDataGrid.FFindRowByFieldAndValue(VGrid: TcxVerticalGrid; FieldName:string;FieldValue:Variant):TcxCustomRow;
var i:Integer;
begin
  result := nil;
  for i:=0 to VGrid.Rows.Count-1 do
  begin

    if (AnsiPos( LowerCase( 'Row_'+ FieldName +'_'), LowerCase( VGrid.Rows.Items[i].Name ) )<> 0) and
       (TcxEditorRow( VGrid.Rows.Items[i] ).Properties.Value = FieldValue ) then
       begin
         result := VGrid.Rows.Items[i];
         break;
       end;

  end;
end;
//******************************************************************************
procedure TCompareDataGrid.FSetFocusRow( VGrid: TcxVerticalGrid; FieldName:string;FieldValue:Variant );
var i:Integer;
    CurrRow:TcxCustomRow;
begin
  CurrRow := FFindRowByFieldAndValue( VGrid, FieldName, FieldValue );
  if CurrRow <> nil then CurrRow.Focused := True;
end;
//******************************************************************************
function TCompareDataGrid.FFindSelectedValueByFocusRowAndFieldName( VGrid: TcxVerticalGrid; FieldName:string ):Variant;
var i:Integer;
    CheckedRow:TcxCustomRow;
begin
  CheckedRow := FFindCheckedRow( VGrid );
  if CheckedRow <> nil then
  begin
    for i:=CheckedRow.Index+1 to VGrid.Rows.Count-1 do
    begin
      if ( VGrid.Rows.Items[i] <> nil ) and ( AnsiPos( LowerCase( 'Row_'+ FieldName +'_') , LowerCase( VGrid.Rows.Items[i].Name)) <>0 ) then
      begin
        result := TcxEditorRow( VGrid.Rows.Items[i] ).Properties.Value;
        break;
      end;
    end;
  end
  else result := null;
end;
//******************************************************************************
function TCompareDataGrid.FFindIndexDataByFieldNameAndValue( SearchInData: TDataValueArr; FieldName:string; Value:Variant ):Integer;
var i,j:Integer;
begin
  result := -1;
  if Value <> null then
    for i:=0 to Length(SearchInData.param.data) -1 do
      for j:=0 to Length(SearchInData.param.data[i]) -1 do
      begin
        if ( CompareText( SearchInData.param.data[i][j]^.FieldName , FieldName) = 0 ) and ( SearchInData.param.data[i][j]^.Value = Value ) then
        begin
          result := i;
          break;
        end;
      end;
end;
//******************************************************************************
function TCompareDataGrid.FFindSelectedDataByFocusRowAndFieldName( SearchInData: TDataValueArr; FieldName:string ):Integer;
var i,j:Integer;
    FindedValue:Variant;
    VGrid: TcxVerticalGrid;
begin
  result := -1;
  if FrmCompareData = nil then exit;
  //*****************************  
  if SearchInData.param.data = self.FDstFrom.param.data  then VGrid := FrmCompareData.VGridLeft
  else
  if SearchInData.param.data = self.FDstTo.param.data then VGrid := FrmCompareData.VGridRight;
  //*****************************

  FindedValue := FFindSelectedValueByFocusRowAndFieldName( VGrid, FieldName );
  result := FFindIndexDataByFieldNameAndValue( SearchInData,  FieldName, FindedValue );
end;
//******************************************************************************
function TCompareDataGrid.FFindValueFromFocusRowToUp(VGrid: TcxVerticalGrid;FieldName:string):TRowVGridDataPram;
var i:Integer;
begin
  result.Value := null;
  result.Caption :='';

  for i:= TcxEditorRow(VGrid.FocusedRow).Index Downto 0 do
  begin
    if (AnsiPos( LowerCase( 'Row_'+ FieldName +'_'), LowerCase( VGrid.Rows.Items[i].Name ) )<> 0) then
    begin
      result.value := TcxEditorRow( VGrid.Rows.Items[i] ).Properties.Value;
      result.caption := TcxEditorRow( VGrid.Rows.Items[i] ).Properties.Caption;
      break;
    end;
  end;
end;
//******************************************************************************
function TCompareDataGrid.FindValueFromRFocusRowToUp(FieldName:string):TRowVGridDataPram;
begin
  result := FFindValueFromFocusRowToUp(FrmCompareData.VGridRight, FieldName);
end;
//******************************************************************************
function TCompareDataGrid.FindValueFromLFocusRowToUp(FieldName:string):TRowVGridDataPram;
begin
  result := FFindValueFromFocusRowToUp(FrmCompareData.VGridLeft, FieldName);
end;
//******************************************************************************
function TCompareDataGrid.FFindValueFromFocusRowToDown(VGrid: TcxVerticalGrid;FieldName:string):TRowVGridDataPram;
var i:Integer;
begin
  result.Value := null;
  result.Caption :='';

  for i:= TcxEditorRow(VGrid.FocusedRow).Index to VGrid.Rows.Count-1 do
  begin
    if (AnsiPos( LowerCase( 'Row_'+ FieldName +'_'), LowerCase( VGrid.Rows.Items[i].Name ) )<> 0) then
    begin
      result.value := TcxEditorRow( VGrid.Rows.Items[i] ).Properties.Value;
      result.caption := TcxEditorRow( VGrid.Rows.Items[i] ).Properties.Caption;
      break;
    end;
  end;
end;
//******************************************************************************
function TCompareDataGrid.FindValueFromFocusLRowToDown(FieldName:string):TRowVGridDataPram;
begin
  result := FFindValueFromFocusRowToDown(FrmCompareData.VGridLeft,FieldName);
end;
//******************************************************************************
function TCompareDataGrid.FindValueFromFocusRRowToDown(FieldName:string):TRowVGridDataPram;
begin
  result := FFindValueFromFocusRowToDown(FrmCompareData.VGridRight,FieldName);
end;
//******************************************************************************
function TCompareDataGrid.FSetCheckByFieldNameAndId( SearchInData: TDataValueArr; FieldName:string; Value:Variant; Check:Boolean=True ):Integer;
var i:Integer;
    VGrid: TcxVerticalGrid;
    FindIndexData : Integer;
    CurrRow : TcxCustomRow;
begin
  result := -1;

  if FrmCompareData = nil then exit;
  if SearchInData.param.data = self.FDstFrom.param.data  then VGrid := FrmCompareData.VGridLeft
  else
  if SearchInData.param.data = self.FDstTo.param.data then VGrid := FrmCompareData.VGridRight;
  //*****************************
  FindIndexData := FFindIndexDataByFieldNameAndValue( SearchInData,  FieldName, Value );
  if FindIndexData <> -1 then
  begin
    CurrRow := FFindRowByFieldAndValue( VGrid, FieldName, Value );

    for i := CurrRow.Index downto 0 do
    begin

      if ( VGrid.Rows.Items[i].Tag = -10 ) and
         ( TcxEditorRow( VGrid.Rows.Items[i] ).Properties.EditPropertiesClass = TcxCheckBoxProperties ) then
      begin
        TcxEditorRow( VGrid.Rows.Items[i] ).Properties.Value := Check;
        result := i;
        Break;
      end;

    end;
  end;
end;
//******************************************************************************
procedure TCompareDataGrid.FRefreshCheck;
begin
  if self.FParamFindCheckLeft <> nil then
    FSetCheckByFieldNameAndId( self.FDstFrom, self.FParamFindCheckLeft^.KeyFieldName,self.FParamFindCheckLeft^.ValueForKeyFieldName);

  if self.FParamFindCheckRight <> nil then
    FSetCheckByFieldNameAndId( self.FDstTo, self.FParamFindCheckRight^.KeyFieldName, self.FParamFindCheckRight^.ValueForKeyFieldName);
end;
//******************************************************************************
function TCompareDataGrid.FindSelectedDataByFocusRowAndFieldNameLeft( FieldName:string ):Integer;
begin
  result := FFindSelectedDataByFocusRowAndFieldName( Self.FDstFrom, FieldName );
end;
//******************************************************************************
function TCompareDataGrid.FindSelectedDataByFocusRowAndFieldNameRight( FieldName:string ):Integer;
begin
  result := FFindSelectedDataByFocusRowAndFieldName( Self.FDstTo, FieldName );
end;
//******************************************************************************
function TCompareDataGrid.GetFocusedLValue:TRowVGridDataPram;
begin
   Result.Value := TcxEditorRow(FrmCompareData.VGridLeft.FocusedRow).Properties.Value;
   Result.Caption := TcxEditorRow(FrmCompareData.VGridLeft.FocusedRow).Properties.Caption;
end;
//******************************************************************************
function TCompareDataGrid.GetFocusedRValue:TRowVGridDataPram;
begin
   Result.Value := TcxEditorRow(FrmCompareData.VGridRight.FocusedRow).Properties.Value;
   Result.Caption := TcxEditorRow(FrmCompareData.VGridRight.FocusedRow).Properties.Caption;
end;
//******************************************************************************
procedure TCompareDataGrid.ButLRefesh;
begin
  FrmCompareData.ButRefreshLeft.Click;
end;
//******************************************************************************
procedure TCompareDataGrid.ButRRefesh;
begin
  FrmCompareData.ButRefreshRight.Click;
end;
//******************************************************************************
function TCompareDataGrid.FindAndCheckDataByFocusRowAndFieldNameLeft( FieldName:string; aValue:Variant; aCheck:Boolean = True ):Integer;
begin
  result := FSetCheckByFieldNameAndId(  Self.FDstFrom, FieldName, aValue, aCheck );
end;
//******************************************************************************
function TCompareDataGrid.FindAndCheckDataByFocusRowAndFieldNameRight( FieldName:string; aValue:Variant; aCheck:Boolean=True ):Integer;
begin
  result := FSetCheckByFieldNameAndId(  Self.FDstTo, FieldName, aValue, aCheck );
end;
//******************************************************************************
procedure TCompareDataGrid.SetLFocusRow( FieldName:string;FieldValue:Variant );
var i:Integer;
begin
  if FrmCompareData <> nil  then
    FSetFocusRow( FrmCompareData.VGridLeft,  FieldName, FieldValue );
end;
//******************************************************************************
procedure TCompareDataGrid.SetRFocusRow( FieldName:string;FieldValue:Variant );
var i:Integer;
begin
  if FrmCompareData <> nil  then
    FSetFocusRow( FrmCompareData.VGridRight,  FieldName, FieldValue );
end;
//******************************************************************************
procedure TCompareDataGrid.FRefresh(FillSameWhenDifferentCountRows:Boolean);
var i:Integer;
    ShowSelectRow:Boolean;
begin
  if FrmCompareData = nil then exit;
  try
    FrmCompareData.VGridLeft.BeginUpdate;
    FrmCompareData.VGridRight.BeginUpdate;

    FrmCompareData.VGridLeft.ClearRows;
    FrmCompareData.VGridRight.ClearRows;

    if FillSameWhenDifferentCountRows then
    begin
      //*************************
      if Length(self.FDstTo.param.data) = Length(self.FDstFrom.param.data) then
      begin
        FPrepareGrid(FrmCompareData.VGridLeft, self.FDstFrom,false,false );
        FPrepareGrid(FrmCompareData.VGridRight,self.FDstTo,false,false );
      end;
      //*************************
      if (Length(self.FDstTo.param.data) > Length(self.FDstFrom.param.data))and(Length(self.FDstFrom.param.data)=1) then
      begin

        for i:=0 to Length(self.FDstTo.param.data)-1 do
        begin
          FPrepareGrid( FrmCompareData.VGridLeft, self.FDstFrom ,true,True);
          //if i <> Length(self.FDstTo.data)-1 then
          // FAddRowToVerticalGrid( FrmCompareData.VGridLeft,'Empty','','','',ftString,True,false);
        end;
        FPrepareGrid( FrmCompareData.VGridRight, self.FDstTo, False, True );
      end;
      //*************************
      if (Length(self.FDstTo.param.data) < Length(self.FDstFrom.param.data))and(Length(self.FDstTo.param.data)=1) then
      begin

        FPrepareGrid( FrmCompareData.VGridRight, self.FDstTo );

        for i:=0 to Length(self.FDstFrom.param.data)-1 do
        begin
          FPrepareGrid( FrmCompareData.VGridLeft, self.FDstTo, True, True);
          //if i <> Length(self.FDstFrom.data)-1 then
          // FAddRowToVerticalGrid( FrmCompareData.VGridRight,'Empty','','','',ftString,True,false);
        end;
      end;
      //*************************
      if (Length(self.FDstTo.param.data) > Length(self.FDstFrom.param.data))and(Length(self.FDstFrom.param.data)>1) then
      begin
        FPrepareGrid( FrmCompareData.VGridLeft, self.FDstFrom ,True,  False );
        FPrepareGrid( FrmCompareData.VGridRight, self.FDstTo, False, False );
      end;
    end
    else
    begin
      FPrepareGrid(FrmCompareData.VGridLeft, self.FDstFrom, True, False);
      FPrepareGrid(FrmCompareData.VGridRight, self.FDstTo,  False, False );
    end;

  finally
    FrmCompareData.VGridLeft.EndUpdate;
    FrmCompareData.VGridRight.EndUpdate;
  end;

  FCompareVGrid(FrmCompareData.VGridLeft , FrmCompareData.VGridRight , FMarkDifStyle, FrmCompareData.cxStyle217 );
  if not FrmCompareData.Showing then
    FSetAutoHeightForm( FFrmLimitHeight );

  if FrmCompareData.Showing then
  begin
    if FrmCompareData.VGridLeft.Rows.Count<>0 then FrmCompareData.VGridLeft.SetFocus;
    if FrmCompareData.VGridRight.Rows.Count<>0 then FrmCompareData.VGridRight.SetFocus;
  end;

  self.FRefreshCheck;

end;
//******************************************************************************
procedure TCompareDataGrid.FPrepareShowMessageInfo( ParamMessageInfo : PParamMessageInfo );
begin
  if ParamMessageInfo <> nil then
  begin
    FrmCompareData.TextDescriptHelp.Visible := True;

    FrmCompareData.TextDescriptHelp.Caption := ParamMessageInfo^.GetInfoMessageFunc( self.FDstFrom , Self.FDstTo );
    FrmCompareData.TextDescriptHelp.Height := CalculateHeightControlForText( FrmCompareData.TextDescriptHelp, FrmCompareData.TextDescriptHelp.Caption, 120 );
    //FrmCompareData.PanelDescriptionInfoHelp.Height := ParamMessageInfo^.HeightArea;

    FrmCompareData.TextDescriptHelp.Color :=  ParamMessageInfo.ColorBg;
    FrmCompareData.TextDescriptHelp.Color:= ParamMessageInfo.ColorBg;
    
    if ParamMessageInfo.Font <> nil then
      FrmCompareData.TextDescriptHelp.Font :=  ParamMessageInfo.Font;
  end;
  
  if (FrmCompareData.TextDescriptHelp.Caption='') or (ParamMessageInfo = nil) then
    FrmCompareData.TextDescriptHelp.Visible := False;
end;
//******************************************************************************
procedure TCompareDataGrid.Show(CaptionForm:string;
                                FrmWidth, FrmLimitHeight,
                                GridHeaderWidth:Integer;
                                FormResize,FillSameWhenDifferentCountRows:Boolean;
                                DstFrom , DstTo: TDataValueArr;
                                ButtLeftCaption:Widestring;
                                ButtRightCaption:Widestring;
                                ButLeftRefreshCaption:Widestring;
                                ButRightRefreshCaption:Widestring;
                                ButLeftNewCaption:Widestring;
                                ButRightNewCaption:Widestring;

                                MarkDifStyle:TcxStyle;
                                ParamFindCheckLeft : PParamFindCheck = nil;
                                ParamFindCheckRight : PParamFindCheck = nil;
                                ParamMessageInfo  : PParamMessageInfo = nil );
begin

 try
   FDstFrom := DstFrom;
   FDstTo := DstTo;
   FMarkDifStyle := MarkDifStyle;
   FFrmLimitHeight := FrmLimitHeight;
   FFillSameWhenDifferentCountRows:=FillSameWhenDifferentCountRows;

   Application.CreateForm(TFrmCompareData, FrmCompareData);

   if FormResize then FrmCompareData.BorderStyle:=bsSizeable
   else  FrmCompareData.BorderStyle := bsDialog;

   FNormalContentStyleLeft    := FrmCompareData.VGridLeft.Styles.Content;
   FNormalContentStyleRight   := FrmCompareData.VGridRight.Styles.Content;

   FrmCompareData.Caption     := CaptionForm;
   FrmCompareData.StyleSplitAndSelect := FrmCompareData.cxStyle217;

   if ButtLeftCaption<>'' then FrmCompareData.ButAcceptLeft.Caption := ButtLeftCaption
   else FrmCompareData.ButAcceptLeft.Visible := False;

   if ButtRightCaption<>'' then FrmCompareData.ButAcceptRight.Caption := ButtRightCaption
   else FrmCompareData.ButAcceptRight.Visible := False;

   if ButLeftRefreshCaption<>'' then FrmCompareData.ButRefreshLeft.Caption := ButLeftRefreshCaption
   else FrmCompareData.ButRefreshLeft.Visible := False;

   if ButRightRefreshCaption<>'' then FrmCompareData.ButRefreshRight.Caption := ButRightRefreshCaption
   else FrmCompareData.ButRefreshRight.Visible := False;

   if ButLeftNewCaption <> '' then FrmCompareData.ButNewLeft.Caption :=ButLeftNewCaption
   else FrmCompareData.ButNewLeft.Visible := False;

   if ButRightNewCaption <> '' then FrmCompareData.ButNewRight.Caption :=ButRightNewCaption
   else FrmCompareData.ButNewRight.Visible := False;

   FrmCompareData.Constraints.MinWidth := FrmWidth;
   ///FrmCompareData.Constraints.MinHeight:= FrmLimitHeight;

   FrmCompareData.Width := FrmWidth;
   //FrmCompareData.Height:= FrmLimitHeight;

   FrmCompareData.ButAcceptLeft.OnClick := ButAcceptLeftClick;
   FrmCompareData.ButAcceptRight.OnClick := ButAcceptRightClick;

   FrmCompareData.ButRefreshLeft.OnClick := ButRefreshLeftClick;
   FrmCompareData.ButRefreshRight.OnClick := ButRefreshRightClick;

   FrmCompareData.ButNewLeft.OnClick := ButNewLeftClick;
   FrmCompareData.ButNewRight.OnClick := ButNewRightClick;

   if @FDstFrom.RefreshAct=nil then FrmCompareData.ButRefreshLeft.Visible:=false;
   if @FDstTo.RefreshAct=nil then FrmCompareData.ButRefreshRight.Visible:=false;

   if @FDstFrom.NewAct=nil then FrmCompareData.ButNewLeft.Visible:=false;
   if @FDstTo.NewAct=nil then FrmCompareData.ButNewRight.Visible:=false;

   FrmCompareData.VGridLeft.OptionsView.RowHeaderWidth := GridHeaderWidth;
   FrmCompareData.VGridRight.OptionsView.RowHeaderWidth := GridHeaderWidth;
   FrmCompareData.panelCaptionFrom.Caption :=DstFrom.param.CaptionGrid;
   FrmCompareData.panelCaptionTo.Caption := DstTo.param.CaptionGrid;

   self.FParamFindCheckLeft := ParamFindCheckLeft;
   self.FParamFindCheckRight := ParamFindCheckRight;

   self.FPrepareShowMessageInfo( ParamMessageInfo );
   FRefresh( FFillSameWhenDifferentCountRows );

   if not FrmCompareData.VGridRight.Parent.Visible then
   begin
     FrmCompareData.Constraints.MinWidth := FrmCompareData.Width div 2;
     FrmCompareData.Width := FrmCompareData.Constraints.MinWidth;
     FrmCompareData.panelCaptionTo.Realign;
   end;

   FrmCompareData.ShowModal;
   
 finally
   FreeAndNil(FrmCompareData);
 end;
end;
//******************************************************************************
end.
 