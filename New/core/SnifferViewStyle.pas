unit SnifferViewStyle;

interface
uses SysUtils, Forms,Classes,Windows,Graphics, cxGridDBTableView, cxGridCustomView, Dialogs, ComCtrls , cxStyles ,
     cxGridTableView,cxGraphics,cxGridCustomTableView,cxCustomData,cxGridBandedTableView,cxGrid,cxClasses,Controls,cxTL;

Type
 TRecDrawPersonal = record
    View:TComponent;
    PeronalDrawHeader:TcxGridColumnCustomDrawHeaderEvent;
    PersonalDrawBandHeader:TcxGridBandCustomDrawHeaderEvent;
    PersonalDrawTreeHeader:TcxTreeListCustomDrawHeaderCellEvent;
 end;
 PRecDrawPersonal =  ^TRecDrawPersonal;

 TImageHeader = record
   ImageList:TImageList;
   ImageIndex:Integer;
 end;

 TRecPropertyGrid = record
    Grid :TcxGrid;
    PersonalExitGrid :TNotifyEvent;
 end;
 PRecPropertyGrid = ^TRecPropertyGrid;

 TEventDrawSortingMark = procedure (ACanvas: TcxCanvas; const R: TRect; AAscendingSorting: Boolean) of object;
 TSnifferViewStyle=class
 private

   FPersonalViewDraw: TList;
   FPesonalGridProperty:TList;

   procedure ViewCustomDrawColumnHeader(Sender: TcxGridTableView;
    ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo; var ADone: Boolean);

   procedure ViewBandedTableViewCustomDrawBandHeader( Sender: TcxGridBandedTableView; ACanvas: TcxCanvas;
    AViewInfo: TcxGridBandHeaderViewInfo; var ADone: Boolean);

   procedure TreeListCustomDrawHeaderCell(Sender: TcxCustomTreeList; ACanvas: TcxCanvas;
    AViewInfo: TcxTreeListHeaderCellViewInfo;var ADone: Boolean);

   procedure FFindAllViewAndInit(OwnerView: TComponent);
   procedure FAddPersonalCxGrid( aComp:TComponent );
   procedure FAddPersonalDrawView( aComp:TComponent );
   function  FFindObjByView(Sender: TComponent):PRecDrawPersonal;
   function  FFindObjByGrid(Sender: TComponent):PRecPropertyGrid;

   procedure SetOptionView(View:TComponent);
   procedure ViewGetCellHeight(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
      ACellViewInfo: TcxGridTableDataCellViewInfo; var AHeight: Integer);

   procedure FGridExit(Sender: TObject);
   procedure FDrawHeaderForAll(StyleHeader:TcxStyle; ACanvas: TcxCanvas;
                               AlignmentHorz: TAlignment;
                               AlignmentVertical: TcxAlignmentVert;
                               HeaderGlyph:TBitMap;
                               ImHeader:TImageHeader;
                               ColumnText:string; Bounds,BoudsText:TRect;
                               SortOrder:TcxDataSortOrder; EventSortMark:TEventDrawSortingMark;
                               HeaderAutoHeight:Boolean );

   procedure FDrawHeader3DView( StyleHeader:TcxStyle; ACanvas: TcxCanvas; AViewInfo: TcxCustomGridViewCellViewInfo);

   function  FGetFontColorHeaderView(Sender: TcxCustomGridTableView):TColor;
   function  FGetStyleHeaderView(Sender: TcxCustomGridTableView):TcxStyle;
   function  FGetStyleHeaderViewColumn(Column: TcxGridColumn):TcxStyle;
   function  FGetStyleHeaderTree(Sender: TcxCustomTreeList):TcxStyle;
   function  FGetFontColorHeaderTree(Sender: TcxCustomTreeList):TColor;
   procedure FDestroyPersonalDraw;
   procedure FDestroyPersonalGridProp;
 public
   constructor Create;
   destructor  Close;

   procedure   InitForComponenets( OwnerView:TComponent );
   procedure   InitPersonalDrawForCxGrid(aGrid:TcxGrid);
 end;

 TRectSniffer = record
   Sniffer:TSnifferViewStyle;
   Component : TComponent;
 end;
 PRectSniffer =^TRectSniffer;

 procedure InitDataModuleSnifferViewStyle;


implementation

uses cxGridLevel;

{ TSnifferViewStyle }
//******************************************************************************
constructor TSnifferViewStyle.Create;
begin
 FPersonalViewDraw := TList.Create;
 FPesonalGridProperty := TList.Create;
end;
//******************************************************************************
procedure TSnifferViewStyle.FDestroyPersonalDraw;
var i:Integer;
begin
 { for i:=0 to FPersonalViewDraw.Count - 1 do
  begin
    if PRecDrawPersonal(FPersonalViewDraw.Items[i])^.View is TcxGridTableView then
    begin
      TcxGridTableView( PRecDrawPersonal(FPersonalViewDraw.Items[i])^.View ).OnCustomDrawColumnHeader := PRecDrawPersonal( FPersonalViewDraw.List ).PeronalDrawHeader;

      if PRecDrawPersonal(FPersonalViewDraw.Items[i])^.View is TcxGridBandedTableView then
        TcxGridBandedTableView( PRecDrawPersonal(FPersonalViewDraw.Items[i])^.View ).OnCustomDrawBandHeader := PRecDrawPersonal( FPersonalViewDraw.List ).PersonalDrawBandHeader;

      Dispose( PRecDrawPersonal(FPersonalViewDraw.Items[i]) );
    end;
  end;}
  for i:=0 to FPersonalViewDraw.Count - 1 do
  begin
    Dispose(FPersonalViewDraw.Items[i]);
    FPersonalViewDraw.Items[i]:=nil;
  end;
end;
//******************************************************************************
procedure TSnifferViewStyle.FDestroyPersonalGridProp;
var i:Integer;
begin
  {for i:=0 to FPesonalGridProperty.Count - 1 do
  begin
    if PRecPropertyGrid(FPersonalViewDraw.Items[i])^.Grid is TcxGrid then
    begin
      TcxGrid(PRecPropertyGrid(FPersonalViewDraw.Items[i])^.Grid).OnExit :=PRecPropertyGrid(FPersonalViewDraw.Items[i]).PersonalExitGrid;
      //Dispose(PRecPropertyGrid(FPersonalViewDraw.Items[i]) );
    end;
  end; }

  for i:=0 to FPesonalGridProperty.Count-1 do
  begin
    Dispose( PRecDrawPersonal( FPesonalGridProperty.Items[i] ) );
    FPesonalGridProperty.Items[i] := nil;
  end;
end;
//******************************************************************************
destructor TSnifferViewStyle.Close;
begin
 FDestroyPersonalDraw;
 FreeAndNil(FPersonalViewDraw);

 FDestroyPersonalGridProp;
 FreeAndNil(FPesonalGridProperty);
end;
//******************************************************************************
procedure TSnifferViewStyle.InitForComponenets(OwnerView:TComponent);
begin
  FFindAllViewAndInit(OwnerView);
end;
//******************************************************************************
procedure TSnifferViewStyle.SetOptionView(View:TComponent);
begin
 if View is TcxGridTableView then
 begin
   //TcxGridTableView(View).OptionsCustomize.ColumnMoving := false;
   //TcxGridTableView(View).OptionsCustomize.ColumnHorzSizing := false;
   //TcxGridTableView(View).OptionsCustomize.ColumnSorting   := true;
   // TcxGridTableView(View).OptionsCustomize.ColumnGrouping  := false;
   TcxGridTableView(View).OptionsCustomize.ColumnFiltering := false;
   // TcxGridTableView(View).OptionsView.HeaderHeight := 18;
   TcxGridTableView(View).OptionsView.DataRowHeight:= 18;
   TcxGridTableView(View).OptionsView.GridLineColor:=clSilver;
   //TcxGridTableView(View).OnGetCellHeight := ViewGetCellHeight; 
 end;

 if View is TcxCustomTreeList  then
 begin
   //TcxCustomTreeList(View).OptionsCustomizing.ColumnMoving := false;
   TcxCustomTreeList(View).DefaultRowHeight:= 17;
   TcxCustomTreeList(View).OptionsView.GridLineColor:=clSilver;
 end;
end;
//******************************************************************************
procedure TSnifferViewStyle.ViewGetCellHeight(Sender: TcxCustomGridTableView;
  ARecord: TcxCustomGridRecord; AItem: TcxCustomGridTableItem;
  ACellViewInfo: TcxGridTableDataCellViewInfo; var AHeight: Integer);
begin
 //AHeight:=TcxGridTableView(Sender).OptionsView.DataRowHeight;
end;
//******************************************************************************
procedure TSnifferViewStyle.FAddPersonalDrawView( aComp:TComponent );   //
var PersonalDraw:PRecDrawPersonal;
    PeronalDrawHeader:TcxGridColumnCustomDrawHeaderEvent;
    PersonalDrawBandHeader:TcxGridBandCustomDrawHeaderEvent;
    PersonalDrawTreeHeader:TcxTreeListCustomDrawHeaderCellEvent;
    PersonalGridExit:TNotifyEvent;
begin
 PeronalDrawHeader:=nil;
 PersonalDrawBandHeader:=nil;
 PersonalDrawTreeHeader:=nil;
 PersonalGridExit := nil;
 //**************************

 if aComp is TcxGridTableView then
 begin
   PeronalDrawHeader := TcxGridTableView(aComp).OnCustomDrawColumnHeader;
   if TcxGridTableView(aComp).Site.Parent is TcxGrid then
     PersonalGridExit  := TcxGrid( TcxGridTableView(aComp).Site.Parent ).OnExit;
 end;

 if aComp is TcxGridBandedTableView then
 begin
   PersonalDrawBandHeader := TcxGridBandedTableView(aComp).OnCustomDrawBandHeader;
   if TcxGridBandedTableView(aComp).Site.Parent is TcxGrid then
     PersonalGridExit  := TcxGrid( TcxGridBandedTableView(aComp).Site.Parent ).OnExit;
 end;

 if aComp is TcxTreeList then PersonalDrawTreeHeader :=  TcxTreeList(aComp).OnCustomDrawHeaderCell;
 //**************************
 if ( @PeronalDrawHeader <> nil )or(@PersonalDrawBandHeader <> nil )or(@PersonalDrawTreeHeader <> nil ) then
 begin
   New(PersonalDraw);
   PersonalDraw.View := TcxCustomGridView(aComp);

   PersonalDraw.PeronalDrawHeader := PeronalDrawHeader;
   PersonalDraw.PersonalDrawBandHeader := PersonalDrawBandHeader;
   PersonalDraw.PersonalDrawTreeHeader := PersonalDrawTreeHeader;

   FPersonalViewDraw.Add( PersonalDraw );
 end;
end;
//******************************************************************************
procedure TSnifferViewStyle.FAddPersonalCxGrid(aComp:TComponent );
var PersonalConfig:PRecPropertyGrid;
    PersonalGridExit:TNotifyEvent;
begin
  if aComp is TcxGrid  then PersonalGridExit:= TcxGrid(aComp).OnExit;

  if ( @PersonalGridExit <> nil ) then
  begin
   New(PersonalConfig);
   PersonalConfig.Grid :=  TcxGrid(aComp);
   PersonalConfig.PersonalExitGrid := PersonalGridExit;

   FPesonalGridProperty.Add( PersonalConfig );
  end;
end;
//******************************************************************************
procedure TSnifferViewStyle.InitPersonalDrawForCxGrid(aGrid:TcxGrid);
var i:Integer;
begin
  for i:=0 to aGrid.Levels.Count-1 do
    FAddPersonalDrawView( aGrid.Levels[i].GridView );
end;
//******************************************************************************
procedure TSnifferViewStyle.FFindAllViewAndInit(OwnerView: TComponent);
var i:Integer;
    CurrComp:TComponent;
begin
  for i:=0 to OwnerView.ComponentCount-1 do
  begin
    CurrComp := OwnerView.Components[i];
    //*********************************************************}
    if CurrComp is TcxGridTableView then
    begin
      FAddPersonalDrawView( TcxGridTableView( CurrComp  ));
      TcxGridTableView( CurrComp ).OnCustomDrawColumnHeader := ViewCustomDrawColumnHeader;
      SetOptionView(TcxGridTableView( CurrComp ));

      if CurrComp is TcxGridBandedTableView then
        TcxGridBandedTableView( CurrComp ).OnCustomDrawBandHeader := ViewBandedTableViewCustomDrawBandHeader;
    end;
    //*********************************************************
    if CurrComp is TcxCustomTreeList then
    begin
      FAddPersonalDrawView( CurrComp );
      SetOptionView(CurrComp);
      TcxTreeList(CurrComp).OnCustomDrawHeaderCell := TreeListCustomDrawHeaderCell;
    end;
    //*********************************************************
    if CurrComp is TcxGrid then
    begin
      FAddPersonalCxGrid( CurrComp );
      TcxGrid(CurrComp).OnExit := FGridExit;
    end;
    //*********************************************************
  end;
end;
//******************************************************************************
function TSnifferViewStyle.FFindObjByView(Sender: TComponent):PRecDrawPersonal;
var i:Integer;
begin
 result:=nil;
 if FPersonalViewDraw = nil then Exit;
 
 for i:=0 to FPersonalViewDraw.Count - 1 do
 begin
   if ( PRecDrawPersonal( FPersonalViewDraw.Items[i] )^.View = Sender) then
   begin
     result:= PRecDrawPersonal( FPersonalViewDraw.Items[i] );
     Break;
   end;
 end;
end;
//******************************************************************************
function TSnifferViewStyle.FFindObjByGrid(Sender: TComponent):PRecPropertyGrid;
var i:Integer;
begin
  result:=nil;

  if self = nil then exit;
  if FPersonalViewDraw.count = 0 then exit;

  for i:=0 to FPesonalGridProperty.Count - 1 do        //  Uncess value FPesonalGridProperty
  begin
    if ( PRecPropertyGrid( FPesonalGridProperty.Items[i] )^.Grid = Sender) then
    begin
      result:= PRecPropertyGrid( FPesonalGridProperty.Items[i] );
      Break;
    end;
  end;
end;
//******************************************************************************
function TSnifferViewStyle.FGetFontColorHeaderView(Sender: TcxCustomGridTableView):TColor;
begin
  if TcxGridTableView(Sender).Styles.Header<>nil then
    result := TcxGridTableView(Sender).Styles.Header.TextColor
  else
    result := clBlack;
end;
//******************************************************************************
function TSnifferViewStyle.FGetStyleHeaderView(Sender: TcxCustomGridTableView):TcxStyle;
begin
  if TcxGridTableView(Sender).Styles.Header<>nil then
    result := TcxGridTableView(Sender).Styles.Header
  else
    result := nil;
end;
//******************************************************************************
function TSnifferViewStyle.FGetStyleHeaderViewColumn(Column: TcxGridColumn):TcxStyle;
begin
  if Column.Styles.Header<>nil then
    result := Column.Styles.Header
  else
    result := nil;
end;
//******************************************************************************
function TSnifferViewStyle.FGetStyleHeaderTree(Sender: TcxCustomTreeList):TcxStyle;
begin
  if TcxCustomTreeList(Sender).Styles.ColumnHeader<>nil then
    result := TcxCustomTreeList(Sender).Styles.ColumnHeader
  else
    result := nil;
end;
//******************************************************************************
function TSnifferViewStyle.FGetFontColorHeaderTree(Sender: TcxCustomTreeList):TColor;
begin
  if TcxCustomTreeList(Sender).Styles.ColumnHeader<>nil then
    result := TcxCustomTreeList(Sender).Styles.ColumnHeader.TextColor
  else
    result := clBlack;
end;
//******************************************************************************
procedure TSnifferViewStyle.FGridExit(Sender: TObject);
var CurrProp:PRecPropertyGrid;
begin
  if TcxGrid(Sender).FocusedView = nil then exit;
  if TcxGrid(Sender).FocusedView is TcxCustomGridTableView then
    TcxCustomGridTableView(TcxGrid(Sender).FocusedView).Controller.FocusedRecord.MakeVisible;

  CurrProp := FFindObjByGrid(TComponent(Sender));
  if CurrProp <> nil then
    if @CurrProp^.PersonalExitGrid <> nil then
      CurrProp^.PersonalExitGrid( Sender );
end;
//******************************************************************************
procedure TSnifferViewStyle.FDrawHeaderForAll(StyleHeader:TcxStyle; ACanvas: TcxCanvas;
                                              AlignmentHorz: TAlignment;
                                              AlignmentVertical: TcxAlignmentVert;
                                              HeaderGlyph:TBitMap;
                                              ImHeader:TImageHeader;
                                              ColumnText:string; Bounds,BoudsText:TRect;
                                              SortOrder:TcxDataSortOrder; EventSortMark:TEventDrawSortingMark;
                                              HeaderAutoHeight:Boolean );
var ASortMarkBounds: TRect;
    ASortMarkBoundsPlace: TRect;
    HeaderColor:TColor;
    TextColor:TColor;
    HeaderFont:TFont;
begin

  if StyleHeader <> nil then
  begin
    HeaderColor := StyleHeader.Color;
    TextColor := StyleHeader.TextColor;
    HeaderFont := StyleHeader.Font;
  end
   else
   begin
     HeaderColor:= clMenu;
     TextColor:=clBlack;
     HeaderFont:=nil;
   end;

  ACanvas.Canvas.Brush.Color := HeaderColor;
  if HeaderFont<>nil then ACanvas.Canvas.Font := HeaderFont;
  ACanvas.Canvas.Font.Color  := TextColor;
  ACanvas.FillRect(Bounds, HeaderColor);

  if HeaderGlyph <> nil then
    ACanvas.DrawGlyph( Bounds.Left + (( Bounds.Right - Bounds.Left) div 2) -  (HeaderGlyph.Width div 2), Bounds.top , HeaderGlyph , true, HeaderColor);

  if (ImHeader.ImageList<> nil)and(ImHeader.ImageIndex<>-1 ) then
     ACanvas.DrawImage(ImHeader.ImageList , Bounds.left+((Bounds.Right - Bounds.left) div 2 )-8 , Bounds.Top ,ImHeader.ImageIndex ,true);

  ACanvas.DrawTexT( ColumnText, BoudsText, AlignmentHorz , AlignmentVertical, HeaderAutoHeight, false );

  ACanvas.DrawComplexFrame(Bounds, clWhite, $00A0A0A0, [bRight, bBottom], 2);
  ACanvas.DrawComplexFrame(Bounds, clWhite, clBlack, [bLeft, bTop, bRight, bBottom], 1);
  
  if ( @EventSortMark <> nil ) and (SortOrder <> soNone) then
  begin
    ASortMarkBounds.Top := Bounds.Top + 2;
    ASortMarkBounds.Bottom := Bounds.Bottom - 5;
    ASortMarkBounds.Left := Bounds.Right - 16;
    ASortMarkBounds.Right := Bounds.Right - 6;

    ASortMarkBoundsPlace:=ASortMarkBounds;
    ASortMarkBoundsPlace.Bottom:= Bounds.Bottom - 2;
    ASortMarkBoundsPlace.Left:=Bounds.Right-18;
    ASortMarkBoundsPlace.Right:= Bounds.Right-2;

    ACanvas.FillRect(ASortMarkBoundsPlace , HeaderColor );
    EventSortMark( ACanvas, ASortMarkBounds, SortOrder = soAscending );
  end;
end;
//******************************************************************************
procedure TSnifferViewStyle.FDrawHeader3DView( StyleHeader:TcxStyle; ACanvas: TcxCanvas; AViewInfo: TcxCustomGridViewCellViewInfo);
var ASortMarkBounds: TRect;
    ASortMarkBoundsPlace: TRect;
    HitTest: TcxCustomGridHitTest;
    itemCol:TcxCustomGridTableItem;
    Column:TcxGridColumn;
    AlignmentHorz: TAlignment;
    AlignmentVertical: TcxAlignmentVert;
    HeaderGlyph:TBitMap;
    ImHeader:TImageHeader;
begin
  ImHeader.ImageList := nil;
  ImHeader.ImageIndex := -1;


  if AViewInfo is TcxGridColumnHeaderViewInfo then
  begin
    AlignmentHorz:= TcxGridColumnHeaderViewInfo(AViewInfo).Column.HeaderAlignmentHorz;
    AlignmentVertical:= TcxGridColumnHeaderViewInfo(AViewInfo).Column.HeaderAlignmentVert;

    if TcxGridColumnHeaderViewInfo(AViewInfo).Column.HeaderGlyph.Handle <> 0 then
      HeaderGlyph:= TcxGridColumnHeaderViewInfo(AViewInfo).Column.HeaderGlyph
    else HeaderGlyph:=nil;

    if ( TcxGridColumnHeaderViewInfo(AViewInfo).Column.GridView.Images <> nil ) and 
       ( TcxGridColumnHeaderViewInfo(AViewInfo).Column.GridView.Images is TImageList ) then
      ImHeader.ImageList := TImageList( TcxGridColumnHeaderViewInfo(AViewInfo).Column.GridView.Images );

    ImHeader.ImageIndex:= TcxGridColumnHeaderViewInfo(AViewInfo).Column.HeaderImageIndex;

    FDrawHeaderForAll( StyleHeader, ACanvas, AlignmentHorz, AlignmentVertical, HeaderGlyph,ImHeader, AViewInfo.Text, AViewInfo.Bounds, AViewInfo.TextBounds,
                      TcxGridColumnHeaderViewInfo(AViewInfo).Column.SortOrder , AViewInfo.LookAndFeelPainter.DrawSortingMark,
                      TcxGridColumnHeaderViewInfo(AViewInfo).Column.GridView.OptionsView.HeaderAutoHeight )
  end

   Else

    if AViewInfo is TcxGridBandHeaderViewInfo then
    begin
      AlignmentHorz:=TcxGridBandHeaderViewInfo(AViewInfo).Band.HeaderAlignmentHorz;
      AlignmentVertical:= TcxGridBandHeaderViewInfo(AViewInfo).Band.HeaderAlignmentVert;

      HeaderGlyph:= nil;


      FDrawHeaderForAll( StyleHeader, ACanvas, AlignmentHorz, AlignmentVertical, HeaderGlyph,ImHeader, AViewInfo.Text, AViewInfo.Bounds,AViewInfo.TextBounds, soNone, nil,
      TcxGridBandHeaderViewInfo(AViewInfo).GridView.OptionsView.HeaderAutoHeight  );
    end;
end;
//******************************************************************************
procedure TSnifferViewStyle.ViewCustomDrawColumnHeader(Sender: TcxGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridColumnHeaderViewInfo;
  var ADone: Boolean);
var PersDraw:PRecDrawPersonal;
    StyleHeader : TcxStyle;
begin
  AViewInfo.DrawPressed := false;
  StyleHeader := FGetStyleHeaderView(Sender);
  if ( FGetStyleHeaderViewColumn( AViewInfo.Column)<>nil ) then
   StyleHeader :=FGetStyleHeaderViewColumn( AViewInfo.Column);

  if ( ( StyleHeader <> nil ) and ( StyleHeader.Tag <> -100 ) ) or (StyleHeader = nil)  then
  begin
    FDrawHeader3DView( StyleHeader, ACanvas, AViewInfo);
    ADone := true;
  end;

  PersDraw:= FFindObjByView( Sender );
  if PersDraw <> nil then
  if @PersDraw^.PeronalDrawHeader<>nil then PersDraw^.PeronalDrawHeader(Sender, ACanvas, AViewInfo, ADone);
end;
//******************************************************************************
procedure TSnifferViewStyle.ViewBandedTableViewCustomDrawBandHeader(
  Sender: TcxGridBandedTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridBandHeaderViewInfo; var ADone: Boolean);
var PersDraw:PRecDrawPersonal;
begin
  FDrawHeader3DView( FGetStyleHeaderView(Sender),  ACanvas, AViewInfo);
  ADone := true;

  PersDraw:= FFindObjByView( Sender );
  if PersDraw <> nil then
    if @PersDraw^.PersonalDrawBandHeader<>nil then PersDraw^.PersonalDrawBandHeader(Sender, ACanvas, AViewInfo, ADone);
end;
//******************************************************************************
procedure TSnifferViewStyle.TreeListCustomDrawHeaderCell(Sender: TcxCustomTreeList;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListHeaderCellViewInfo;
  var ADone: Boolean);
var PersDraw:PRecDrawPersonal;
    ImHeader:TImageHeader;
begin
  ImHeader.ImageList := nil;
  ImHeader.ImageIndex := -1;

  if (Sender.Images<>nil) and (Sender.Images is TImageList) then
    ImHeader.ImageList := TImageList(Sender.Images);


  FDrawHeaderForAll(FGetStyleHeaderTree(Sender), ACanvas,
                    AViewInfo.AlignHorz, AViewInfo.AlignVert,
                    AViewInfo.Glyph , ImHeader , AViewInfo.Text, AViewInfo.BoundsRect, AViewInfo.TextBounds ,
                    AViewInfo.SortOrder, AViewInfo.LookAndFeelPainterClass.DrawSortingMark,AViewInfo.TreeList.OptionsView.HeaderAutoHeight );
  ADone:=True;

  PersDraw:= FFindObjByView( Sender );
  if PersDraw <> nil then
    if @PersDraw^.PersonalDrawTreeHeader<>nil then PersDraw^.PersonalDrawTreeHeader( Sender, ACanvas, AViewInfo, ADone);
end;
//******************************************************************************
var
 hhk: HHOOK;
 ListSniffer:TList;

function FindComponentByClassName(className:String):TComponent;
var i:Integer;
begin
  result:=nil;
  for i:=0 to Application.ComponentCount-1 do
    if (Application.Components[i].ClassName = className) then
    begin
      if (Application.Components[i] is TForm) or (Application.Components[i] is TDataModule) then
          result := Application.Components[i];
      Break;
    end;
end;

function CreateSniffer(Component:TComponent):TSnifferViewStyle;
var i:Integer;
    PShifElem:PRectSniffer;
begin
  result:=nil;
  for i:=0 to ListSniffer.Count -1 do
  if PRectSniffer(ListSniffer.Items[i]).Component = Component then exit;

  result := TSnifferViewStyle.Create;
  New(PShifElem);
  PShifElem.Sniffer:=Result;
  PShifElem.Component := Component;

  ListSniffer.Add( PShifElem );
end;

procedure InitDataModuleSnifferViewStyle;
var i:integer;
    Res:TSnifferViewStyle;
begin
  for i:=0 to Application.ComponentCount-1 do
  begin
    if (Application.Components[i] is  TDataModule) then
    begin
      Res := CreateSniffer( Application.Components[i] );
      if Res <> nil then Res.InitForComponenets( Application.Components[i] );
    end;
  end;
end;

procedure DestroySniffer(Component:TComponent);
var i:Integer;
begin
  for i:=0 to ListSniffer.Count-1 do
  begin
   if PRectSniffer(ListSniffer.Items[i]).Component = Component then
   begin
      PRectSniffer(ListSniffer.Items[i]).Sniffer.Destroy;
      Dispose( PRectSniffer(ListSniffer.Items[i]) );
      ListSniffer.Delete( i );
      Break;
   end;
  end;
end;

procedure DestroyAllSniffer;
var i:Integer;
begin
 for i:=0 to ListSniffer.Count-1 do
  begin
    PRectSniffer(ListSniffer.Items[i]).Sniffer.Close;
    Dispose( PRectSniffer(ListSniffer.Items[i]) );
  end;
end;

function CBT_FUNC(nCode: Integer; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
const
  ClassNameBufferSize = 1024;
var
 hWindow: HWND;
 RetVal : Integer;
 FormClassName:String;
 ClassNameBuffer: Array[0..ClassNameBufferSize-1] of Char;
 FormComponents:TComponent;
 CurrSniff: TSnifferViewStyle;
begin
   Result := CallNextHookEx(hhk, nCode, wParam, lParam);
   if nCode<0 then exit;
     case nCode of
       HCBT_ACTIVATE:
       begin
         hWindow := HWND(wParam);
         if (hWindow>0) then
         begin
            RetVal := GetClassName(wParam, ClassNameBuffer, SizeOf(ClassNameBuffer));
            if RetVal>0 then
            begin
              SetString(FormClassName , ClassNameBuffer, RetVal);
              FormComponents := FindComponentByClassName( FormClassName );

              if FormComponents <> nil then
                 begin
                  CurrSniff := CreateSniffer( FormComponents );
                  if CurrSniff <> nil then CurrSniff.InitForComponenets( FormComponents );       //InitPersonalDrawForCxGrid(TcxGrid(FormComponents));//
                 end;

              OutputDebugString(ClassNameBuffer);
            end;
         end;
       end;

     HCBT_DESTROYWND:
       begin
         hWindow := HWND(wParam);
         if (hWindow>0) then
         begin
            RetVal := GetClassName(wParam, ClassNameBuffer, SizeOf(ClassNameBuffer));
            if RetVal>0 then
            begin

              SetString( FormClassName , ClassNameBuffer, RetVal );

              FormComponents:= FindComponentByClassName( FormClassName );
              if FormComponents <> nil then
                DestroySniffer( FormComponents );

              OutputDebugString(ClassNameBuffer);
            end;

         end;
       end;
     end;
end;

Procedure InitSnifferViewStyle();
var
  dwThreadID : DWORD;
begin
  ListSniffer:=TList.Create;

  dwThreadID := GetCurrentThreadId;
  hhk := SetWindowsHookEx(WH_CBT, @CBT_FUNC, hInstance, dwThreadID);
  if hhk=0 then RaiseLastOSError;

end;

Procedure KillSnifferViewStyle();
begin
  DestroyAllSniffer;
  
  ListSniffer.Free;
  if ( hhk <> 0 ) then
    UnhookWindowsHookEx(hhk);
end;

initialization
  InitSnifferViewStyle();


finalization
  KillSnifferViewStyle();

end.
