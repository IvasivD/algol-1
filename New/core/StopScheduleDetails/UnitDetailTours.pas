unit UnitDetailTours;

interface
uses Dialogs,SysUtils,Windows,Classes,Variants,Controls, DB , IBDatabase ,IBTable,
     UnitIBQuery,cxDBTL ,cxTL,cxPC,cxGridCustomTableView,cxStyles,cxCustomData,
     cxGridDBTableView,cxGraphics,Graphics,UnitProc, ADODB,IBCustomDataSet,Core ;
const ExtExcursionTreeLevel = 'Додаткова екскурсія';

Const OptTourStops = 0;
      OptTourHotel = 1;
      OptTourExcurs = 4;
      OptTourDescript = 10;
      OptTourOther = 6;
type
   TOptShowWebTimeOnTree = (OptShowTimeWeb,OptNotShowTimeWeb,OptShowApproxTimeWeb);
   TOptShowWebOnTree = (OptShowOnWeb,OptNotShowOnWeb);

   TOptAddToTree = (OptTreeAddInsert,OptTreeAddLast,OptTreeAddSub);
   TEventDeleteFromTree = procedure (Dataset:TDataset;KeyField:string; id:Variant) of object;
   TOptValidTree = (OptValidNone,OptValidLocation,OptValidStartStop,OptValidTime,OptValidHotel);

   TTypeDayNodeParent = record
    Day:Integer;
    parent:Integer;
   end;

   TTypeObject = record
    ActionType:variant;
    ObjType:variant;
    ObjId:variant;
    ID:variant;
    ParentID:variant;
    Options:variant;
    ShowOnWeb:Variant;
    ShowTime:Variant;
   end;

   TTypeObjTabShow = record
      TypeObj : Variant;
      Tab : TcxTabSheet;
      View:TcxGridDBTableView;
      FieldIdName:string;
      Dataset : TDataset;
      DatasetParent:TDataset;
      FieldParentKod:String;
      PersonalTabShow:TNotifyEvent;
      EventDelFromTree:TEventDeleteFromTree;
      PersonalViewRecordChange:TcxGridFocusedRecordChangedEvent;
   end;

   TDescriptionTree = record
      Description:WideString;
      ActionStr:WideString;
      TimeStr:WideString;
   end;

   TRepresentObjWeb = record
     TYPEOBJ:Variant;
     ACTIONTYPE:Variant;
     TempRepresentation:Widestring;
   end;

   TRepresentObjWebTime = record
     TIMEOBJ:Variant;
     TYPEOBJ:Variant;
     ACTIONTYPE:Variant;
     TimeFrom:Variant;
     TimeTill:Variant;

     TempRepresentation:Widestring;
   end;

   TDetailTours = class
    private
    function GetTree: TcxDBTreeList;
      private
        FSchedTours:TDataset;
        FFieldSityID :String;
        FFieldActionTime:String;
        //FTree:TcxDBTreeList;
        FTreeElem:TDBShemaTree;

        FTemplateId :Integer;
        FLockOnViewChange:Boolean;
        FLockTabShow:Boolean;
        FListExcursionParent:TStringList;
        FLockLookUp:Boolean;
        FLockTreeDraw:Boolean;
        FSaveMarkFocusedNode:TcxTreeListNode;
        FSaveMarkFocusedID:Variant;

        FMasTypeObjTabShow:array of TTypeObjTabShow;
        FImageListInformError:TImageList;
        FTopVisibleNode : integer;

        FPersonalTreeDatastAfterInsert : TDataSetNotifyEvent;
        FPersonalTreeFocusedNode: TcxTreeListFocusedNodeChangedEvent;
        FPersonalTreeCustomDraw : TcxTreeListCustomDrawEditCellEvent;
        FPersonalCalcTree       : TDataSetNotifyEvent;

        FValidTree:TOptValidTree;

        procedure FSetSortTreeByOrderAndTime;
        procedure FSetSortTreeByTime;

        function  FCheckCurrCountryInDay( TemplateSched: TDataSet;ParentDay:Integer;ObjID,TypeObj,TypeAction:Variant):Boolean;

        function  FGetDescriptionContryCity(TemplateSched: TDataSet):Widestring;
        Function  FGetParentDayForSched(FieldId,FieldDay:String;StartSchedDay,TypeAction:Integer; TemplateSched: TDataSet):Integer;

        Function  FGetIndexExtExcursion(IdParent:Integer):Integer;
        Function  FAddDayToSchedLevelExcursionForCurrentDepartDay(FieldId:String; TemplateSched: TDataSet; StartSchedDay,Options:Integer ):Integer;
        Function  FAddDayToSchedLevelExcursionForCurrentArriveDay(FieldId:String; TemplateSched: TDataSet; StartSchedDay,Options:Integer ):Integer;

        Function  FAddDayToSchedLevelExcursionForCurrent(FieldId,FieldArriveDay,FieldArriveTime,FieldParentItemId:String; TemplateSched: TDataSet; StartSchedDay,ActionType,Options:Integer ):Integer;

        procedure FChangeDayOnNodeChild( Node:TcxTreeListNode;OnDay:Integer );
        procedure FMoveNodeToDay( Node:TcxTreeListNode;OnDay:Integer; Description:Widestring );
        function  FUpdateHotel(TypeObjTab:TTypeObjTabShow):Boolean;
        function  FUpdateExcursion(TypeObjTab:TTypeObjTabShow):Boolean;
        function  FUpdateOther(TypeObjTab:TTypeObjTabShow):Boolean;

        function  FFindObjIdForAllChildNodes( Node:TcxTreeListNode; ObjId:Variant  ):TcxTreeListNode;
        Function  FAddDayToSchedForCurrent( FieldId,FieldDay,FieldTime:String; TemplateSched: TDataSet; StartSchedDay,ActionType,Options:Integer  ):Boolean;

        Function  FAddDayToSchedForCurrentDepartTime(FieldId:String; TemplateSched: TDataSet; StartSchedDay,Options:Integer ):Boolean;
        Function  FAddDayToSchedForCurrentArriveTime(FieldId:String; TemplateSched: TDataSet; StartSchedDay,Options:Integer ):Boolean;

        Function  FFindNodeByParam(FeldName:array of String; FiledValue:array Of Variant):TcxTreeListNode;

        Function  FFindCurrRecTreeNoteById(idTree:Integer):TcxTreeListNode;
        Function  FFindCurrRecDayTreeNote(Day:Integer):TcxTreeListNode;

        Function  FFindNodeByOrderFromNode(aNodeParent:TcxTreeListNode;OrderInd:Integer):TcxTreeListNode;
        Function  FFindDayNodeFromNode(aNode:TcxTreeListNode):TcxTreeListNode;
        Function  FFindCurrRecDayByNode(aNode:TcxTreeListNode):Variant;
        Function  FFindCurrRecDay( Day:Integer):Variant;
        Function  FGetNextOrderForNode(Node:TcxTreeListNode):Integer;
        Function  FGetNextOrderIndex(Day:Integer):Integer;
        Function  FGetChildNodeByObjType( Node:TcxTreeListNode;ObjType:array of Integer  ):Integer;
        Function  FGetNextOrderIndexByObjType(Day:Integer;ObjType:array of Integer ):Integer;

        Function  FGetIdTreeForNode(Node:TcxTreeListNode):variant;

        Function  FAddDay( Day:Integer;DescriptDay:String):integer;
        function  FAddToDB( Descript:Widestring; Parent , Order, ObjId, TYPEOBJ, ActionType:Variant;IsNew:Boolean; Options:variant  ):Integer;

        function  FFindObjInAllDays(  ObjId,ObjType:Variant; TypeAction:Variant ):TcxTreeListNode;
        function  FFindObjInDayActionType( ObjId,ObjType:Variant; Day,ActionType:Variant ):TcxTreeListNode;
        function  FFindHotelInDay( IdHotel:Integer; Day:Integer ):TcxTreeListNode;
        function  FCeckHotelInDay(IdHotel:Integer;Day:Integer):Boolean;

        function  FAddCurrHotelsToSchedTour(  FieldId:String; TemplateHotelDataset : TDataset ):boolean;
        function  FAddHotelToDay(FieldId:String; TemplateHotelDataset : TDataset; Day:Integer;Accommodation :Boolean):Integer;
        function  FGetDescriptCurrHotel( TemplateHotelDataset : TDataset):Widestring;

        function  FFindOrderInNodeByTime(NodeDay:TcxTreeListNode; Time:TDateTime):Integer;
        function  FFindOrderInDayByTime(Day:Integer;Time:TDateTime):Integer;
        function  FCeckExcursionlInDay(ObjId,Day,TypeAction:Integer):Boolean;
        function  FGetDescriptExcursion( TemplateExcursDataset :TDataset ):Widestring;
        function  FGetDescriptOther( TemplateOtherDataset: TDataset ):Widestring;

        function  FAddExcursionToTree(FieldId:String;  TemplateExcursionDataset:TDataset;focused:Boolean=false; Sub:Boolean =false ):Boolean;
        function  FAddNewExcursion(TemplateId:integer;Sub:Boolean):Boolean;
        procedure FMoveDownAllNodeAcceptTypeObj( node : TcxTreeListNode;TypeObj:array of Integer );

        function  FSetFreeSpaceForInsertNode( node : TcxTreeListNode;IndexFree:Integer=2 ):integer;
        function  FAddObjectToTree(node : TcxTreeListNode; Description:String; ObjId,ObjType,ActionType:Variant; OptAdd:TOptAddToTree ):boolean;

        function  FCeckObjForNode(ObjId:Integer;Node:TcxTreeListNode;TypeObj:Integer):Boolean;
        function  FAddDescriptionToTree( FieldId:String; TemplateDescriptionDataset:TDataset;OptAdd:TOptAddToTree):Boolean;
        function  FAddOtherToTree( FieldId:String; TemplateOther:TDataset; OptAdd:TOptAddToTree ):Boolean;

        procedure FReorderDayNode(NodeDay:TcxTreeListNode);
        procedure FAddCurrDay(day:Integer);

        procedure TreeTourSchedFocusedNodeChanged( Sender: TcxCustomTreeList; APrevFocusedNode, AFocusedNode: TcxTreeListNode );
        procedure FTabObjectShow(Sender: TObject);
        function  FFindTabByTypeObj(TypeObj:Variant):TTypeObjTabShow;
        function  FFindTabByTab(Tab : TcxTabSheet):TTypeObjTabShow;
        function  FFindTabByView( View : TcxCustomGridTableView ):TTypeObjTabShow;
        function  FGetTabObjectByNode(Node: TcxTreeListNode):TTypeObjTabShow;

        procedure FStynhronizeObjTypeForUpdate( TypeObj:Variant );
        function  FFindNextSiblingUnicalNode(Node:TcxTreeListNode):TcxTreeListNode;

        procedure FDeleteFromLinkDataset(TypeObject:TTypeObject);
        function  FDelNodesByObjId(ObjType,ObjId:Integer):boolean;
        function  FDelObjectByNode(node:TcxTreeListNode):boolean;

        procedure FDeleteAddExcursion(Node:TcxTreeListNode);
        procedure FDeleteByObjectTypeByOption(TypeObj:Variant; OptionValue:Variant);
        procedure FDeleteByObjectType(TypeObj:Variant);
        procedure FDelObjectByNodeWithDetail( Node:TcxTreeListNode );

        function  FFindLastElemForNode(Node:TcxTreeListNode):TcxTreeListNode;
        function  FAddNewDescription(TemplateId:integer;OptAdd:TOptAddToTree):Boolean;
        function  FAddNewOther(TemplateId,IdOther:integer;OptAdd:TOptAddToTree):Boolean;

        Function  FMoveNode(Node:TcxTreeListNode;Up:boolean):boolean;
        function  FGetOrderNumberForNode( Node:TcxTreeListNode ): integer;
        procedure FUpdateOrder(Node:TcxTreeListNode;NewOrder:Integer);
        function  FGetSelectionColor(Sender: TcxCustomTreeList):TcxStyle;
        function  FCheckIsLastDay(  Node: TcxTreeListNode ):Boolean;

        procedure FShowTextImageInCell(Sender: TcxCustomTreeList;ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo; ImageList:TImageList;ImageIndex:Integer);

        function  FFindValueBeforeNodeForActionType( Node: TcxTreeListNode;ObjType,ActionType:Integer;ResultField:String ):Variant;
        function  FCheckForActionType( Node: TcxTreeListNode; ObjType , ActionType:Integer ):Boolean;
        function  FCheckHotelForDay(Day:Integer;ActionType:Integer):boolean;
        function  FCheckHotelForThisNode( Node: TcxTreeListNode ):Boolean;
        function  FCheckTransferForThisNode( Node: TcxTreeListNode;ActionType:Integer ):Boolean;

        //function  FCheckHotelForThisDay( ADay:Integer ):Boolean;

        procedure FShowTabAndLocateObjId(TypeObjTab:TTypeObjTabShow; CurrObjId:Variant);
        procedure ViewFocusedRecordChanged( Sender: TcxCustomGridTableView; APrevFocusedRecord,
                  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);

        procedure TreeCustomDrawDataCell(Sender: TcxCustomTreeList;
                  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
                  var ADone: Boolean);

        procedure FGenerateDaysIntoTree(TemplateId:Integer; TourDays:Integer);
        procedure FGenerateDaysSchedTour(TypeObj:Variant; TemplateId,StartSchedDay:Integer;JustForFileldKodID:Integer = -1 );
        procedure FAddHotelsToSchedTour( TypeObj:Variant; TemplateId :Integer );
        procedure FAddExcursionToSchedTour(TypeObj:Variant; TemplateId :Integer );
        procedure TreeCalcFields(DataSet: TDataSet);

        Function  FGetRepresentWebTimeByObjAndAction(TypeTime,TypeObj,TypeAction,CurrTime:variant;RepresentWebTime:array of TRepresentObjWebTime ):TRepresentObjWebTime;
        Function  FGetDescriptionForNode(Node:TcxTreeListNode):TDescriptionTree;
        Function  FGetRepresentWebByObjAndAction(TypeObj,TypeAction:variant;RepresentWeb:array of TRepresentObjWeb ):TRepresentObjWeb;

        procedure FPreapareToReadyWebTimeLine(var TemplateWeb:TRepresentObjWeb; var TemplateWebTime:TRepresentObjWebTime  );
        Function  FPreapareToReadyWebLine(TemplateWeb:TRepresentObjWeb;Descript:TDescriptionTree ):Widestring;
      public

        constructor Create(aTreeElem:TDBShemaTree; SchedTours: TDataset; aFieldActionTime,aFieldCityID :String );
        destructor  Close;

        procedure SynhronizeTabAndTree;
        procedure SynhronizeSelectTabForNode(AFocusedNode: TcxTreeListNode);

        function  ValidTree:TOptValidTree;
        procedure Remove;
        procedure TreeDrawFillRect(Sender: TcxCustomTreeList; AViewInfo: TcxTreeListEditCellViewInfo; ACanvas: TcxCanvas );
        procedure SetTreeDataset( aTreeElem:TDBShemaTree );
        procedure SetImageListInformError(ImageList:TImageList);

        function  FindNodeObjId( ObjID, TypeObj:Variant ):TcxTreeListNode;
        procedure EnabledChangeTreeControl;
        procedure DisabledChangeTreeControl;

        procedure SaveScrollPosition;
        procedure RestoreScrollPosition;

        function  CheckLocationForNodePlace( Node: TcxTreeListNode ):Boolean;
        function  CheckLocationForCityidPlace( Node: TcxTreeListNode; CITYID:variant ):Boolean;

        function  CanAddTripForFocusedNode:Boolean;
        function  CanAddHotelForNode(aNode:TcxTreeListNode):Boolean;
        function  CanAddHotelForFocusedNode:Boolean;
        function  CanAddExcursionForFocusedNodeSub:Boolean;

        function  CanAddHotelForDay(aDay:Integer):Boolean;

        procedure UpdateTimeWebTree(optShowWeb:TOptShowWebTimeOnTree);
        procedure UpdateShowWebTree(optShowWeb:TOptShowWebOnTree);

        procedure AddPropertyForTypeObj(TypeObj:Variant;Tab:TcxTabSheet; View:TcxGridDBTableView; DatasetParent:TDataset; FieldParentKod:String; EventDelFromTree: TEventDeleteFromTree );
        function  FocusedNodeTreeByObject( TypeObj,ObjectId:Variant ):Boolean;
        function  FocusedNodeTreeByActionObject( TypeObj,TypeAction, ObjectId:Variant ):Boolean;
        procedure ReorderAllDayNode;
        procedure RefreshDBTree;
        procedure RefreshDBFocusedNode;
        function  GetCountDays:Integer;

        function  GetTabByTypeObj(ObjType:Integer):TTypeObjTabShow;

        function FocusedObjIsStop:boolean;
        function FocusedObjIsHotel:boolean;
        function FocusedObjIsExcursion:boolean;
        function FocusedObjIsDescription:boolean;
        function FocusedObjIsOther:boolean;
        function IsNullFocusedObject:Boolean;

        function FocusedObjValueByFieldName(fieldName:String):variant;

        function GetTypeByNode(Node:TcxTreeListNode):TTypeObject;
        function GetFocusedTypeObject:TTypeObject;

        function GetDayParentForNode(aNode:TcxTreeListNode):TTypeDayNodeParent;
        function GetFocusedDayParent:TTypeDayNodeParent;
        function GetFocusedCityId:Variant;

        function GetTimeActionByNode( Node: TcxTreeListNode ):Double;
        function GetCityIdByNode( Node: TcxTreeListNode ):Variant;
        function GetValueNodeByFieldName( Node: TcxTreeListNode;FieldName:String ):Variant;

        function GetTimeActionByFocusedNode:Double;
        function GetCityIdByFocusedNode( Node: TcxTreeListNode ):Variant;

        function GetCityIdArrivedFromFocusedNode:Variant;
        function GetCityIdArrivedFromNode( Node: TcxTreeListNode ):Variant;

        procedure GenerateForAllTypeObject( TemplateId,DayCount,StartSchedDay:Integer );
        function  AddNewTransfer(TemplateId:integer; StartSchedDay:Integer = 1):Boolean;
        function  AddNewExcursion(TemplateId:integer):Boolean;
        function  AddNewExcursionSub(TemplateId:integer):Boolean;
        function  UpdateExcursion(TemplateId:integer):Boolean;

        procedure UnLinkFocusedNodeFromObjId;
        procedure LinkFocusedNodeToObjId(IdObj:Integer);

        procedure SetMarkFocusedNode;
        procedure GotoMarkFocusedNode;

        procedure SetMarkFocusedID;
        procedure GotoMarkFocusedID;

        procedure UnLockOnViewChange;
        procedure LockOnViewChange;

        function  UpdateTrip(TemplateId:integer ):Boolean;
        function  UpdateHotel(TemplateId:integer):Boolean;
        function  UpdateOther(TemplateId:integer):Boolean;
        
        function  AddNewHotel(TemplateId:integer):Boolean;

        function  InsertNewDescription(TemplateId:integer):Boolean;
        function  AddNewDescription(TemplateId:integer):Boolean;
        function  AddNewDescriptionToSub(TemplateId:integer):Boolean;
        function  AddNewDescriptionForOpt(TemplateId:integer; OptAdd:TOptAddToTree ):Boolean;
        function  AddNewOtherForOpt(TemplateId,IdOther:integer; OptAdd:TOptAddToTree ):Boolean;

        function  DelFocusedObject( DeleteFromTree:Boolean ):Boolean;
        function  RemoveParentStops( IdParentValue:Variant ):Boolean;
        procedure RemoveAllStops;
        procedure RemoveAllHotels;
        procedure RemoveAllExcursions;
        procedure RemoveAllDescriptions;

        Function  MoveNodeDown(Node:TcxTreeListNode):boolean;
        Function  MoveNodeUp(Node:TcxTreeListNode):boolean;

        Function  FormingTour(RepresentWeb:array of TRepresentObjWeb; RepresentObjWebTime: array of TRepresentObjWebTime):TStringList;
        procedure OpenDBTree(ExpandTree:Boolean=true);
     published
        property  Tree:TcxDBTreeList read GetTree;
    end;

implementation

uses cxDBData, cxInplaceContainer;

{ TDetailTours }

constructor TDetailTours.Create( aTreeElem:TDBShemaTree; SchedTours: TDataset; aFieldActionTime,aFieldCityID :String );
begin
  FFieldActionTime:=aFieldActionTime;
  FLockOnViewChange:=false;
  FFieldSityID :=aFieldCityID;

  FLockTabShow := False;
  FLockLookUp  := False;
  FLockTreeDraw:= False;

  if aTreeElem<> nil then
    SetTreeDataset( aTreeElem );
    
  FListExcursionParent := TStringList.Create;
  FImageListInformError := nil;
end;
//******************************************************************************
destructor TDetailTours.Close;
begin
 FListExcursionParent.Free;
end;
//******************************************************************************
procedure TDetailTours.SetTreeDataset( aTreeElem:TDBShemaTree );
begin

  if aTreeElem <> nil then
  begin
    FTreeElem := aTreeElem;
    FSchedTours:= FTreeElem.DB;
    FPersonalTreeFocusedNode := FTreeElem.Tree.OnFocusedNodeChanged;
    FPersonalTreeCustomDraw  := FTreeElem.Tree.OnCustomDrawDataCell;

    FTreeElem.Tree.OnCustomDrawDataCell := TreeCustomDrawDataCell;
    EnabledChangeTreeControl;
  end;

  if FSchedTours <> nil then
  begin
    FPersonalCalcTree := FSchedTours.OnCalcFields;
    FPersonalTreeDatastAfterInsert := FSchedTours.AfterInsert;
    //SchedTours.AfterInsert := AfterInsert;
    FSchedTours.OnCalcFields := TreeCalcFields;
  end;
end;
//******************************************************************************

procedure TDetailTours.SetImageListInformError(ImageList:TImageList);
begin
 FImageListInformError:=ImageList;
end;
//******************************************************************************
procedure TDetailTours.DisabledChangeTreeControl;
begin
  Self.FTreeElem.Tree.OnFocusedNodeChanged := nil;
end;
//******************************************************************************
procedure TDetailTours.EnabledChangeTreeControl;
begin
  Self.FTreeElem.Tree.OnFocusedNodeChanged :=  TreeTourSchedFocusedNodeChanged;
end;
//******************************************************************************
procedure TDetailTours.SaveScrollPosition;
begin
  if Self.FTreeElem.Tree.TopVisibleNode <> nil then
    FTopVisibleNode := Self.FTreeElem.Tree.TopVisibleNode.VisibleIndex
  else FTopVisibleNode := -1;
end;
//******************************************************************************
procedure TDetailTours.RestoreScrollPosition;
begin
  if ( Self.FTreeElem.Tree.TopVisibleNode<>nil) and (FTopVisibleNode <> -1) then
    Self.FTreeElem.Tree.TopVisibleNode := Self.FTreeElem.Tree.AbsoluteVisibleItems[ FTopVisibleNode ];
end;
//******************************************************************************
Function TDetailTours.FFindNodeByParam(FeldName:array of String; FiledValue:array Of Variant):TcxTreeListNode;
var  i:integer;
     CurrNode:TcxTreeListNode;
     CountCompare:Integer;
     ColIndex:Integer;
begin
 CurrNode:=Self.FTreeElem.Tree.TopNode;
 Result:=nil;

 while CurrNode<>nil do
 begin
   begin
     CountCompare:=0;
     for i:=0 to Length(FeldName)-1 do
     begin
       ColIndex := Self.FTreeElem.Tree.GetColumnByFieldName(FeldName[i]).ItemIndex;
       if CurrNode.Values[ ColIndex ] = FiledValue[i] then Inc(CountCompare)
       else break;
     end;
     if CountCompare = Length(FiledValue) then
     begin
       result:=CurrNode;
       Break;
     end;
   end;  
   CurrNode:=CurrNode.getNext;
 end;
end;
//******************************************************************************
Function TDetailTours.FFindCurrRecTreeNoteById( idTree:Integer ):TcxTreeListNode;
var TopLevel:TcxTreeListNode;
begin
   TopLevel:=Self.FTreeElem.Tree.TopNode;
   result:=nil;
   while TopLevel<>nil do
   begin
    if (TopLevel<>nil)and(TopLevel.Values[  Self.FTreeElem.Tree.GetColumnByFieldName(Self.FTreeElem.Tree.DataController.KeyField).ItemIndex ] = idTree) then
    begin
      result:=TopLevel;
      Break;
    end;

    TopLevel:=TopLevel.getNext;
   end;
end;
//******************************************************************************
Function TDetailTours.FFindCurrRecDayTreeNote(Day:Integer):TcxTreeListNode;
var TopLevel:TcxTreeListNode;
begin
   TopLevel:=Self.FTreeElem.Tree.TopNode;
   result:=nil;
   while TopLevel<>nil do
   begin
    if (TopLevel<>nil)and(TopLevel.Values[ Self.FTreeElem.Tree.GetColumnByFieldName('STOPORDER').ItemIndex ] = Day) then
    begin
      result:=TopLevel;
      Break;
    end;

    TopLevel:=TopLevel.getNextSibling;
   end;
end;
//******************************************************************************
Function TDetailTours.FFindDayNodeFromNode(aNode:TcxTreeListNode):TcxTreeListNode;
begin
  result:=nil;

  While (aNode<>nil) and (aNode.Level<>0) do aNode := aNode.Parent;
  if (aNode.Level = 0 ) then result:= aNode;
end;
//******************************************************************************
Function TDetailTours.FFindNodeByOrderFromNode(aNodeParent:TcxTreeListNode;OrderInd:Integer):TcxTreeListNode;
begin
  result:=nil;
  aNodeParent:=aNodeParent.getFirstChild;
  while aNodeParent<>nil do
  begin
    if FGetOrderNumberForNode( aNodeParent ) = OrderInd then
    begin
      result:=aNodeParent;
      break;
    end;
    aNodeParent:=aNodeParent.getNextSibling;
  end;
end;
//******************************************************************************
Function TDetailTours.FFindCurrRecDayByNode(aNode:TcxTreeListNode):Variant;
begin
  if aNode <> nil then result:= aNode.values [ Self.FTreeElem.Tree.GetColumnByFieldName( Self.FTreeElem.Tree.DataController.KeyField ).ItemIndex ]
  else result:=null;
end;
//******************************************************************************
Function TDetailTours.FFindCurrRecDay(Day:Integer):Variant;
var DayNode:TcxTreeListNode;
begin
  DayNode:=FFindCurrRecDayTreeNote(Day);
  result :=FFindCurrRecDayByNode(DayNode);
end;
//******************************************************************************
Function TDetailTours.FGetNextOrderForNode(Node:TcxTreeListNode):Integer;
begin
 if Node<>nil then
    result := Node.ChildVisibleCount + 1
  else result:=1;
end;
//******************************************************************************
Function TDetailTours.FGetNextOrderIndex(Day:Integer):Integer;
var DayNode:TcxTreeListNode;
begin
  DayNode:=FFindCurrRecDayTreeNote(Day);
  result := FGetNextOrderForNode( DayNode );
end;
//******************************************************************************
Function TDetailTours.FGetChildNodeByObjType( Node:TcxTreeListNode;ObjType:array of Integer ):Integer;
var ANode: TcxTreeListNode;
    TypeObject:TTypeObject;
function Check(CurrObjType:Integer):Boolean;
var i:Integer;
begin
  Result:=false;
  for i:=0 to Length(ObjType)-1 do
  if  ObjType[i] = CurrObjType then
  begin
   Result:=True;
   Break;
  end;
end;
begin
  Result := 0;
  ANode := Node.getFirstChild;
  while ANode <> nil do
  begin
    TypeObject:=GetTypeByNode(ANode);
    if Check(TypeObject.ObjType) then
      Inc(Result);

    ANode := ANode.getNextSibling;
  end;
end;
//******************************************************************************
Function TDetailTours.FGetNextOrderIndexByObjType(Day:Integer;ObjType:array of Integer ):Integer;
var DayNode:TcxTreeListNode;
begin
  DayNode:=FFindCurrRecDayTreeNote(Day);
  result := FGetChildNodeByObjType( DayNode, ObjType )+1;
end;
//******************************************************************************
Function TDetailTours.FGetIdTreeForNode(Node:TcxTreeListNode):variant;
var TypeObject:TTypeObject;
begin
 TypeObject:=GetTypeByNode(Node);
 if TypeObject.ID <> -1 then result := TypeObject.ID
 else result:=null;
end;
//******************************************************************************
Function TDetailTours.FAddDay( Day:Integer;DescriptDay:String):integer;
begin
 FSchedTours.Append;

 FSchedTours.FieldByName('Description').Value:=  DescriptDay;
 FSchedTours.FieldByName('STOPORDER').AsInteger  := Day;
 FSchedTours.FieldByName('TYPEOBJ').Value :=  null;
 if FSchedTours.FieldByName('PARENT').Value <> null then
   FSchedTours.FieldByName('PARENT').Value:=null;
 FSchedTours.Post;
 result := FSchedTours.FieldByName( Self.FTreeElem.Tree.DataController.KeyField ).asInteger;
end;
//******************************************************************************
function TDetailTours.FGetDescriptionContryCity(TemplateSched: TDataSet):Widestring;
begin
  result:= TemplateSched.FieldByName('COUNTRYNAME').Value+' '+TemplateSched.FieldByName('CITYNAME').Value;
end;
//******************************************************************************
function TDetailTours.FAddToDB( Descript:Widestring; Parent , Order, ObjId, TYPEOBJ, ActionType:Variant;IsNew:Boolean; Options:variant):Integer;
begin
  result:=-1;
  
  if IsNew then FSchedTours.Append
  else FSchedTours.Edit;

  FSchedTours.FieldByName('PARENT').Value := Parent;
  FSchedTours.FieldByName('OBJID').Value  := ObjId;
  
  FSchedTours.FieldByName('STOPORDER').Value := Order;

  FSchedTours.FieldByName('Description').AsString := Descript;
  FSchedTours.FieldByName('TYPEOBJ').Value :=  TYPEOBJ;
  FSchedTours.FieldByName('TYPEACTION').Value :=  ActionType;
  if IsNew then FSchedTours.FieldByName('OPTIONS').Value :=  Options;
  FSchedTours.Post;

  result:= FSchedTours.fieldByName( Self.FTreeElem.Tree.DataController.KeyField ).AsInteger;
end;
//******************************************************************************
function TDetailTours.FCheckCurrCountryInDay( TemplateSched: TDataSet;ParentDay:Integer;ObjID,TypeObj,TypeAction:Variant):Boolean;
var Descript:Widestring;
    aNode:TcxTreeListNode;
begin
 Descript:=FGetDescriptionContryCity(TemplateSched);

 aNode := FFindNodeByParam(['PARENT', 'OBJID','TYPEOBJ','TYPEACTION'], [ParentDay ,ObjID,TypeObj,TypeAction] );
 if aNode <> nil then
 begin
   FSchedTours.Locate(Self.FTreeElem.Tree.DataController.KeyField ,aNode.Values[ Self.FTreeElem.Tree.GetColumnByFieldName(Self.FTreeElem.Tree.DataController.KeyField).ItemIndex ],[] );
   result:=true;
 end
  else result:=false;
end;
//******************************************************************************
function TDetailTours.FindNodeObjId( ObjID, TypeObj:Variant ):TcxTreeListNode;
begin
  result := FFindNodeByParam(['OBJID','TYPEOBJ'], [ObjID,TypeObj] );
end;
//******************************************************************************
Function TDetailTours.FGetParentDayForSched(FieldId,FieldDay:String;StartSchedDay,TypeAction:Integer; TemplateSched: TDataSet):Integer;
var Day:integer;
     ParentDay:Integer;
begin
  result:=-1;
  if TemplateSched.FieldByName(FieldDay).Value = null then exit;

  Day:=TemplateSched.FieldByName(FieldDay).asInteger + StartSchedDay - 1;
  if Day < 1 then exit;
  FAddCurrDay(day);  // If Day Not Found Add
  //**********************************
  result:=FFindCurrRecDay( Day );
end;
//******************************************************************************
function TDetailTours.FFindObjIdForAllChildNodes( Node:TcxTreeListNode; ObjId:Variant ):TcxTreeListNode;
var UntilLevel:Integer;
begin
  result := nil;
  if ObjId =0 then ObjId:= null;
  
  if Node = nil  then Exit;
  UntilLevel:=Node.Level;
  Self.FTreeElem.Tree.Refresh;
  while (Node<>nil) do
  begin
    if GetTypeByNode(Node).Options = ObjId then
    begin
     result := Node;
     break;
    end;
    Node := Node.GetNext;
    if (Node<>nil)and(Node.Level <= UntilLevel) then break;
  end;

end;
//******************************************************************************
Function TDetailTours.FGetIndexExtExcursion(IdParent:Integer):Integer;
var IndFind:Integer;
begin
  IndFind:=FListExcursionParent.IndexOf( IntToStr( IdParent ) );
  if IndFind<>-1 then result:=IndFind+1
  else
  begin
    FListExcursionParent.Add( IntToStr( IdParent ));
    result := FListExcursionParent.Count;
  end;
end;
//******************************************************************************
Function TDetailTours.FAddDayToSchedLevelExcursionForCurrent(FieldId,FieldArriveDay,FieldArriveTime,FieldParentItemId:String; TemplateSched: TDataSet; StartSchedDay,ActionType,Options:Integer ):Integer;
var ParentDay:Integer;
    New:Boolean;
    aNodeDay:TcxTreeListNode;
    findNode:TcxTreeListNode;
    ExNode:TcxTreeListNode;
    Day:Integer;
    OrderTreeExcurs:Integer;
    OrderSched:Integer;
    OptionsExcurs:Integer;
begin
  result:=-1;
  ParentDay:=FGetParentDayForSched( FieldId,FieldArriveDay, StartSchedDay, 1, TemplateSched );
  if ( TemplateSched.fieldByName(FieldArriveDay).Value <> null ) and (TemplateSched.fieldByName(FieldArriveTime).Value <> null) then
  begin
    Day:=TemplateSched.fieldByName(FieldArriveDay).asInteger;
    aNodeDay:=  Self.FFindCurrRecDayTreeNote(TemplateSched.fieldByName(FieldArriveDay).asInteger);
    findNode := FFindObjIdForAllChildNodes( aNodeDay, TemplateSched.FieldByName(FieldParentItemId).value );
    //*************************
    if findNode<>nil then
    begin
      findNode.Focused := True;
      New:=False;
      OrderTreeExcurs:=-1;
    end
     else
     begin
      New:=True;
      OrderTreeExcurs := FFindOrderInDayByTime( Day , frac(TemplateSched.fieldByName(FieldArriveTime).Value) );
     end;
    //*************************
    OptionsExcurs := TemplateSched.FieldByName(FieldParentItemId).AsInteger;

    if New then
      result  := FAddToDB( ExtExcursionTreeLevel +' ('+ IntToStr( FGetIndexExtExcursion(OptionsExcurs) ) +')' , ParentDay, OrderTreeExcurs, null, OptTourExcurs, 0, New, OptionsExcurs  )
    else result:= FSchedTours.fieldByName( self.FTreeElem.Tree.DataController.KeyField ).AsInteger;

    ExNode  := FFindCurrRecTreeNoteById(result);
    OrderSched := FFindOrderInNodeByTime( ExNode , frac(TemplateSched.fieldByName(FieldArriveTime).Value) );

    New:= not FCheckCurrCountryInDay( TemplateSched, result, TemplateSched.fieldByName(FieldId).Value, OptTourStops, ActionType  );
    FAddToDB( FGetDescriptionContryCity( TemplateSched ), result , OrderSched, TemplateSched.FieldByName(FieldId).Value, OptTourStops, ActionType,New,  Options );
  end;
end;
//******************************************************************************
Function TDetailTours.FAddDayToSchedLevelExcursionForCurrentArriveDay(FieldId:String; TemplateSched: TDataSet; StartSchedDay,Options:Integer ):Integer;
begin
  result:=FAddDayToSchedLevelExcursionForCurrent(FieldId,'ARRIVEDAY','ARRIVETIME','PARENTARRIVEID', TemplateSched, StartSchedDay,1,Options);
end;
//******************************************************************************
Function TDetailTours.FAddDayToSchedLevelExcursionForCurrentDepartDay( FieldId:String; TemplateSched: TDataSet; StartSchedDay, Options:Integer ):Integer;
begin
  result:=FAddDayToSchedLevelExcursionForCurrent( FieldId, 'DEPARTDAY', 'DEPARTTIME', 'PARENTDEPARTID', TemplateSched, StartSchedDay, 0, Options );
end;
//******************************************************************************
Function TDetailTours.FAddDayToSchedForCurrent(FieldId,FieldDay,FieldTime:String; TemplateSched: TDataSet; StartSchedDay,ActionType,Options :Integer ):Boolean;
var New:Boolean;
    OrderTree:Integer;
    ParentDay:Variant;
    Day:integer;

begin
  result := false;
  if TemplateSched.IsEmpty then exit;
  //*************************************************************
  ParentDay:=FGetParentDayForSched(FieldId,FieldDay,StartSchedDay,1, TemplateSched);
  if (ParentDay<>-1) and (TemplateSched.fieldByName(FieldTime).Value <> null) then
  begin
    Day:=TemplateSched.FieldByName(FieldDay).asInteger + StartSchedDay - 1;

    //New:= not FCheckCurrCountryInDay( TemplateSched, ParentDay, TemplateSched.fieldByName(FieldId).Value, OptTourStops, ActionType );

    New:= not FocusedNodeTreeByActionObject( OptTourStops, ActionType , TemplateSched.FieldByName( FieldId ).Value );
    OrderTree:= FFindOrderInDayByTime(Day, ( TemplateSched.fieldByName(FieldTime).Value) );

    result := FAddToDB( FGetDescriptionContryCity( TemplateSched ), ParentDay , OrderTree, TemplateSched.FieldByName(FieldId).Value, OptTourStops, ActionType,New, Options)<>-1;
  end;
  //************************************************************
end;
//******************************************************************************
Function TDetailTours.FAddDayToSchedForCurrentArriveTime(FieldId:String; TemplateSched: TDataSet; StartSchedDay,Options:Integer ):Boolean;
begin
  result:=FAddDayToSchedForCurrent(FieldId,'ARRIVEDAY','ARRIVETIME', TemplateSched, StartSchedDay,1,Options );
end;
//******************************************************************************
Function TDetailTours.FAddDayToSchedForCurrentDepartTime(FieldId:String; TemplateSched: TDataSet; StartSchedDay,Options:Integer ):Boolean;
begin
  result:=FAddDayToSchedForCurrent(FieldId,'DEPARTDAY','DEPARTTIME', TemplateSched, StartSchedDay,0, Options );
end;
//******************************************************************************
function TDetailTours.FGetDescriptCurrHotel( TemplateHotelDataset : TDataset):Widestring;
begin
  result:= TemplateHotelDataset.FieldByName('NAME').AsString + ' ' +TemplateHotelDataset.FieldByName('STARS').AsString +' '+
    TemplateHotelDataset.FieldByName('COUNTRY').AsString +' '+TemplateHotelDataset.FieldByName('CITY').AsString;
end;
//******************************************************************************
function TDetailTours.FGetDescriptExcursion( TemplateExcursDataset: TDataset ):Widestring;
begin
  result := TemplateExcursDataset.FieldByName('NAME').AsString;//+' - '+TemplateExcursDataset.FieldByName('City').AsString;
end;
//******************************************************************************
function TDetailTours.FGetDescriptOther( TemplateOtherDataset: TDataset ):Widestring;
begin
  result := TemplateOtherDataset.FieldByName('SERVNAME').AsString;//+' - '+TemplateExcursDataset.FieldByName('City').AsString;
end;
//******************************************************************************
function TDetailTours.FFindObjInAllDays( ObjId,ObjType:Variant; TypeAction:Variant ):TcxTreeListNode;
var  Day:Integer;
     countDay:Integer;
begin
  result:=nil;
  for Day:=1 to GetCountDays do
  begin
    result := FFindObjInDayActionType( ObjId, ObjType, Day, TypeAction );
    if result<> nil then Break;
  end;
end;
//******************************************************************************
function TDetailTours.FFindObjInDayActionType( ObjId,ObjType:Variant; Day, ActionType:Variant ):TcxTreeListNode;
var NodeDay:TcxTreeListNode;
begin
  result:=nil;
  FAddCurrDay(Day);
  
  NodeDay := FFindCurrRecDayTreeNote( Day );
  if NodeDay = nil then exit;
  
  NodeDay := NodeDay.getFirstChild;
  while NodeDay<>nil do
  begin
    if (NodeDay.Values[ self.FTreeElem.Tree.GetColumnByFieldName('OBJID').ItemIndex ] = ObjId ) and
       (NodeDay.Values[ self.FTreeElem.Tree.GetColumnByFieldName('TYPEOBJ').ItemIndex ] = ObjType  ) and
       (NodeDay.Values[ self.FTreeElem.Tree.GetColumnByFieldName('TYPEACTION').ItemIndex ] = ActionType  ) then
    begin
      result:=NodeDay;
      Break;
    end;
    NodeDay:=NodeDay.getNext;
  end;
end;
//******************************************************************************
function TDetailTours.FFindHotelInDay( IdHotel:Integer; Day:Integer ):TcxTreeListNode;
var NodeDay:TcxTreeListNode;
begin
  result:=nil;
  FAddCurrDay(Day);
  
  NodeDay := FFindCurrRecDayTreeNote( Day );
  NodeDay := NodeDay.getFirstChild;
  while NodeDay<>nil do
  begin
    if (NodeDay.Values[ self.FTreeElem.Tree.GetColumnByFieldName('OBJID').ItemIndex ] = IdHotel ) and
       (NodeDay.Values[ self.FTreeElem.Tree.GetColumnByFieldName('TYPEOBJ').ItemIndex ] = OptTourHotel  ) then
    begin
      result:=NodeDay;
      Break;
    end;
    NodeDay:=NodeDay.getNextSibling;
  end;
end;
//******************************************************************************
function TDetailTours.FCeckHotelInDay(IdHotel:Integer;Day:Integer):Boolean;
var NodeDay:TcxTreeListNode;
begin
   result:=false;
   NodeDay:=FFindHotelInDay( IdHotel, Day );
   if NodeDay<>nil then
   begin
     NodeDay.Focused:=true;
     result:=True;
   end;
end;
//******************************************************************************
function TDetailTours.FCeckExcursionlInDay(ObjId,Day,TypeAction:Integer):Boolean;
var Node:TcxTreeListNode;
begin
  result:=false;

  Node:=FFindObjInDayActionType( ObjId,OptTourExcurs, Day,TypeAction );
  result:=Node<>nil;

 { NodeDay := FFindCurrRecDayTreeNote( Day );
  NodeDay := NodeDay.getFirstChild;

  while NodeDay<>nil do
  begin
    if (NodeDay.Values[ FTree.GetColumnByFieldName('OBJID').ItemIndex ] = ObjId ) and
       (NodeDay.Values[ FTree.GetColumnByFieldName('TYPEOBJ').ItemIndex ] = OptTourExcurs   ) and
       (NodeDay.Values[ FTree.GetColumnByFieldName('TYPEACTION').ItemIndex ] = TypeAction )  then
    begin
      result:=True;
      Break;
    end;
    NodeDay:=NodeDay.getNextSibling;
  end; }
end;
//******************************************************************************
function TDetailTours.FCeckObjForNode(ObjId:Integer;Node:TcxTreeListNode;TypeObj:Integer):Boolean;
begin
  result:=false;
  while Node<>nil do
  begin
    if (Node.Values[ self.FTreeElem.Tree.GetColumnByFieldName('OBJID').ItemIndex ] = ObjId ) and
       (Node.Values[ self.FTreeElem.Tree.GetColumnByFieldName('TYPEOBJ').ItemIndex ] = TypeObj   ) then
    begin
      result:=True;
      Break;
    end;
    Node:=Node.getNextSibling;
  end;
end;
//******************************************************************************
function TDetailTours.FAddHotelToDay(FieldId:String; TemplateHotelDataset : TDataset; Day:Integer; Accommodation :Boolean ):Integer;
var NodeDay:TcxTreeListNode;
    NodeOrderFind:TcxTreeListNode;
    CurrStopOrder:variant;
    CurrHotelDesript:WideString;
    ParentId:Variant;
    IsNew:Boolean;
    ObjId:Integer;
    ActionType:Integer;
begin
  FAddCurrDay(Day);  // If Day Not Found Add
  NodeDay := FFindCurrRecDayTreeNote( Day );
  
  if (NodeDay <> nil) then
  begin                                                   
    ParentId := FFindCurrRecDayByNode(NodeDay);
    ObjId :=TemplateHotelDataset.fieldByName(FieldId).AsInteger;

    CurrHotelDesript:= FGetDescriptCurrHotel( TemplateHotelDataset );
    if accommodation then CurrStopOrder :=  FFindOrderInNodeByTime(NodeDay, (TemplateHotelDataset.fieldByName('FROMTIME').AsFloat) ) //NodeDay.ChildVisibleCount+1
    else
     CurrStopOrder:=FFindOrderInNodeByTime(NodeDay, (TemplateHotelDataset.fieldByName('TILLTIME').AsFloat) );

    if Accommodation then ActionType:=0
    else ActionType:=1;

    NodeOrderFind:=FFindNodeByOrderFromNode(NodeDay, CurrStopOrder);

    IsNew  := not FCeckHotelInDay(TemplateHotelDataset.FieldByName(FieldId).AsInteger, Day );
    FAddToDB( CurrHotelDesript , ParentId , CurrStopOrder, ObjId ,OptTourHotel, ActionType,  IsNew , null );
  end;
end;
//******************************************************************************
function TDetailTours.FAddCurrHotelsToSchedTour(  FieldId:String; TemplateHotelDataset : TDataset ):Boolean;
var BeginForAdd:Integer;
    DayCount:Integer;
begin
 result:=false;
 if TemplateHotelDataset.IsEmpty then Exit;

 BeginForAdd := TemplateHotelDataset.FieldByName('BEGINDAY').AsInteger ;
 if TemplateHotelDataset.FieldByName('DAYCOUNT').AsInteger = 0  then
   DayCount := 1
 else DayCount := TemplateHotelDataset.FieldByName('DAYCOUNT').AsInteger;

 FAddHotelToDay(FieldId, TemplateHotelDataset, BeginForAdd ,true);
 FAddHotelToDay(FieldId, TemplateHotelDataset, BeginForAdd + DayCount , false);
 result:=true;
end;
//******************************************************************************
procedure TDetailTours.FAddHotelsToSchedTour( TypeObj:Variant; TemplateId :Integer);
var SaveBmk:TBookmark;
    CurrDay:Integer;
    TypeObjTab: TTypeObjTabShow;
    FieldId:String;
    TemplateHotelDataset : TDataset;
begin
 FTemplateId := TemplateId;
 TypeObjTab:=FFindTabByTypeObj( TypeObj );

 if not TypeObjTab.Dataset.Active then TypeObjTab.Dataset.Open;

 TemplateHotelDataset := TypeObjTab.Dataset;
 FieldId:=TypeObjTab.FieldIdName;

 try
   TemplateHotelDataset.DisableControls;
   SaveBmk:= TemplateHotelDataset.GetBookmark;
   TemplateHotelDataset.First;

   DisabledChangeTreeControl;

   while not TemplateHotelDataset.Eof do
   begin
    FAddCurrHotelsToSchedTour(  FieldId, TemplateHotelDataset );
    TemplateHotelDataset.Next;
   end;
 finally
   TemplateHotelDataset.GotoBookmark( SaveBmk );
   TemplateHotelDataset.EnableControls;
   EnabledChangeTreeControl;
 end;

end;
//******************************************************************************
procedure TDetailTours.FAddCurrDay(day:Integer);
var ParentDay:variant;
begin
  ParentDay := FFindCurrRecDay( day );
  if ParentDay = null then
    ParentDay := FAddDay(  day , 'День' );
end;
//******************************************************************************
procedure TDetailTours.FGenerateDaysIntoTree(TemplateId:Integer; TourDays:Integer);
var i:integer;
begin
  FTemplateId := TemplateId;
  for i:=1 to TourDays do
    FAddCurrDay( i );
end;
//******************************************************************************
procedure TDetailTours.FGenerateDaysSchedTour( TypeObj:Variant; TemplateId,StartSchedDay:Integer;JustForFileldKodID:Integer =-1 );
var i:integer;
    TypeObjTab:TTypeObjTabShow;
    Options:Integer;
    Bmk:TBookMark;
begin
 FTemplateId  :=TemplateId;
 //************************
 FListExcursionParent.Clear;
 TypeObjTab := FFindTabByTypeObj(TypeObj);
 try
   DisabledChangeTreeControl;

   if not TypeObjTab.Dataset.Active then TypeObjTab.Dataset.Open;

   Bmk := TypeObjTab.Dataset.GetBookmark;
   TypeObjTab.Dataset.First;

   While not TypeObjTab.Dataset.Eof do
   begin
     if (TypeObjTab.FieldParentKod<>'') then
       Options:= TypeObjTab.Dataset.FieldByName(TypeObjTab.FieldParentKod).AsInteger
     else Options:=0;

     if (JustForFileldKodID = -1)or (( JustForFileldKodID <> -1 )and(JustForFileldKodID = Options)) then
     begin

       if not TypeObjTab.Dataset.FieldByName('EXTRAARRIVE').AsBoolean then
         FAddDayToSchedForCurrentArriveTime(TypeObjTab.FieldIdName,  TypeObjTab.Dataset, StartSchedDay,Options)
       else
        FAddDayToSchedLevelExcursionForCurrentArriveDay( TypeObjTab.FieldIdName,  TypeObjTab.Dataset,  StartSchedDay,Options );
       //********************
       if not TypeObjTab.Dataset.FieldByName('EXTRADEPART').AsBoolean then
         FAddDayToSchedForCurrentDepartTime(TypeObjTab.FieldIdName,  TypeObjTab.Dataset, StartSchedDay,Options)
       else
         FAddDayToSchedLevelExcursionForCurrentDepartDay( TypeObjTab.FieldIdName,  TypeObjTab.Dataset,  StartSchedDay,Options );
       //********************
     end;
     TypeObjTab.Dataset.Next;

   end;

 finally
   if TypeObjTab.Dataset.BookmarkValid( Bmk ) then
     TypeObjTab.Dataset.GotoBookmark( Bmk );

   EnabledChangeTreeControl;
 end;
end;
//******************************************************************************\
function TDetailTours.FFindOrderInNodeByTime(NodeDay:TcxTreeListNode; Time:TDateTime):Integer;
var aCurrTime:TTime;
begin
  result:=1;
  if NodeDay = nil then exit;

  result:=NodeDay.ChildVisibleCount+1;
  NodeDay := NodeDay.getFirstChild;

  while NodeDay<>nil do
  begin
    if NodeDay.Values[ self.FTreeElem.Tree.GetColumnByFieldName(FFieldActionTime).ItemIndex ] <> null then
      aCurrTime:=Frac( NodeDay.Values[ self.FTreeElem.Tree.GetColumnByFieldName(FFieldActionTime).ItemIndex ])
    else aCurrTime:=0;
    //****************************************
    if ( aCurrTime >= frac( Time ) ) then
    begin
      result:=NodeDay.Values[ self.FTreeElem.Tree.GetColumnByFieldName('STOPORDER').ItemIndex ] ;      // -1 Забрав потестити
      Break;
    end;
    NodeDay:=NodeDay.getNextSibling;
  end;
end;  
//******************************************************************************
function TDetailTours.FFindOrderInDayByTime(Day:Integer;Time:TDateTime):Integer;
var NodeDay:TcxTreeListNode;
    aCurrTime:TTime;
begin
  NodeDay := FFindCurrRecDayTreeNote( Day );
  result:=FFindOrderInNodeByTime( NodeDay, Time );
end;
//******************************************************************************
function TDetailTours.FAddExcursionToTree(FieldId:String; TemplateExcursionDataset:TDataset;focused:Boolean=false; Sub:Boolean =false ):Boolean;
var NodeDay:TcxTreeListNode;
    ParentId:Variant;
    CurrExcursionDesript:WideString;
    OrderIndex:Integer;
    ObjId:Integer;
    New:Boolean;
    Day:Integer;
    typeObj:TTypeObject;

begin
  result:=False;
  if TemplateExcursionDataset.IsEmpty then Exit;
  if self.FTreeElem.Tree.FocusedNode = nil then Exit;
  //****************************************************************
  ObjId :=TemplateExcursionDataset.fieldByName(FieldId).AsInteger;
  if not Sub then
  begin
    Day:= TemplateExcursionDataset.FieldByName('BEGINDAY').AsInteger ;
    FAddCurrDay(day);  // If Day Not Found Add
    if focused then NodeDay := self.FTreeElem.Tree.FocusedNode.Parent
    else NodeDay := FFindCurrRecDayTreeNote( Day ) ;

    ParentId := FFindCurrRecDayByNode(NodeDay);
    New := not FCeckExcursionlInDay( ObjId, Day, 0 );
  end
   else
   begin
     NodeDay := self.FTreeElem.Tree.FocusedNode;
     typeObj := GetTypeByNode(NodeDay);
     ParentId:= typeObj.ID;
     New := not FCeckObjForNode(ObjId, NodeDay.getFirstChild , OptTourExcurs);
   end;
  //**************************************************************** 
  if (NodeDay <> nil) then
  begin
    CurrExcursionDesript:= FGetDescriptExcursion( TemplateExcursionDataset );

    OrderIndex:= FFindOrderInDayByTime(Day, (TemplateExcursionDataset.fieldByName('EXTIME').Value) );
    FAddToDB( CurrExcursionDesript, ParentId, OrderIndex ,ObjId , OptTourExcurs,  0, New, null);
    result:=true;
  end;
end;
//******************************************************************************
procedure TDetailTours.FAddExcursionToSchedTour(TypeObj:Variant; TemplateId :Integer );
var DayCount:Integer;
    BeginForAdd:integer;
    TemplateExcursionDataset : TDataset;
    FieldId:String;
    TypeObjTab:TTypeObjTabShow;
begin
 try
   DisabledChangeTreeControl;

   FTemplateId  :=TemplateId;
   TypeObjTab:=FFindTabByTypeObj(TypeObj);

   if not TypeObjTab.Dataset.Active then TypeObjTab.Dataset.Open;
   TemplateExcursionDataset:=TypeObjTab.Dataset;
   FieldId:=TypeObjTab.FieldIdName;

   TemplateExcursionDataset.First;
   while not TemplateExcursionDataset.Eof do
   begin

    FAddExcursionToTree(FieldId, TemplateExcursionDataset );
    TemplateExcursionDataset.Next;

   end;
 finally
  EnabledChangeTreeControl;
 end;
end;
//******************************************************************************
procedure TDetailTours.FMoveDownAllNodeAcceptTypeObj( node : TcxTreeListNode;TypeObj:array of Integer );
var TypeObject:TTypeObject;
function Check(CurrObjType:Integer):Boolean;
var i:Integer;
begin
  Result:=false;
  for i:=0 to Length(TypeObj)-1 do
  if  TypeObj[i] = CurrObjType then
  begin
   Result:=True;
   Break;
  end;
end;
//*******************************************
begin
  if node = nil then exit;
  if node.getFirstChild = nil then exit;
  node:=node.getFirstChild;
  while node<>nil do
  begin
    TypeObject:=GetTypeByNode(node);

    if not Check(TypeObject.ObjType) then
    begin
      node.Focused:=True;
      self.FTreeElem.Tree.DataController.DataSet.Edit;
      self.FTreeElem.Tree.DataController.DataSet.FieldByName('STOPORDER').AsInteger:= self.FTreeElem.Tree.DataController.DataSet.FieldByName('STOPORDER').AsInteger*2 ;
      self.FTreeElem.Tree.DataController.DataSet.Post;

      //node.Values[ FTree.GetColumnByFieldName('STOPORDER').ItemIndex ] :=FGetOrderNumberForNode(node)*9999;
    end;

    node:=node.getNextSibling;
  end;
end;
//******************************************************************************
function TDetailTours.FSetFreeSpaceForInsertNode( node : TcxTreeListNode;IndexFree:Integer=2 ):integer;
var currNode:TcxTreeListNode;
    currOrder:Variant;
begin
  if node = nil then exit;
  if node.GetNext = nil then
  begin
    result := FGetNextOrderForNode( Node.Parent );
    exit;
  end;
  currNode:=node.GetNext;

  if currNode.Level = node.Level then result:= FGetOrderNumberForNode( currNode )
  else
  begin
   if currNode.Level > node.Level then result := 2;
   if currNode.Level < node.Level then result := FGetNextOrderForNode( Node.Parent );
  end;
  while (currNode<>nil)and(currNode.Level = node.Level) do
  begin
    currOrder:= currNode.Values[ self.FTreeElem.Tree.GetColumnByFieldName('STOPORDER').ItemIndex ];
    if currOrder = null then currOrder:=1;

    currNode.Values[ self.FTreeElem.Tree.GetColumnByFieldName('STOPORDER').ItemIndex ] := currOrder * IndexFree;
    currNode:=currNode.GetNext;
  end;
end;
//******************************************************************************
function TDetailTours.FAddObjectToTree( node : TcxTreeListNode; Description:String; ObjId,ObjType,ActionType:Variant; OptAdd:TOptAddToTree ):boolean;
var TypeObjTabShow : TTypeObjTabShow;
    ForNode:TcxTreeListNode;
    OrderIndex:Integer;
    ParentId:Variant;
    New:Boolean;
begin
  result:=False;
  TypeObjTabShow := FFindTabByTypeObj( ObjType );

  if TypeObjTabShow.Dataset.IsEmpty then Exit;
  ObjId :=TypeObjTabShow.Dataset.fieldByName(TypeObjTabShow.FieldIdName).AsInteger;
  //**************************************
  if OptAdd = OptTreeAddSub  then
  begin
    ForNode:=self.FTreeElem.Tree.FocusedNode;
    New := not FCeckObjForNode( ObjId, ForNode.getFirstChild ,ObjType);
  end
  else
  begin
    ForNode:=self.FTreeElem.Tree.FocusedNode.Parent;
    New :=  not FCeckObjForNode( ObjId, ForNode.getFirstChild ,ObjType);
  end;
  //**************************************
  ParentId:=FGetIdTreeForNode( ForNode);
  if OptAdd in [OptTreeAddSub,OptTreeAddLast] then OrderIndex:= FGetNextOrderForNode( ForNode )
  else
  if New then OrderIndex := FSetFreeSpaceForInsertNode( Node )
  else OrderIndex := FGetOrderNumberForNode( Node );

  ParentId:=FGetIdTreeForNode( ForNode);
  FAddToDB( Description , ParentId, OrderIndex, ObjId, ObjType, ActionType, New, null );
end;                                             
//******************************************************************************
function TDetailTours.FAddDescriptionToTree( FieldId:String; TemplateDescriptionDataset:TDataset; OptAdd:TOptAddToTree ):Boolean;
var ParentId:Integer;
    ObjId:Variant;
    OrderIndex:Integer;
    New:Boolean;
    ForNode:TcxTreeListNode;
begin
  result := FAddObjectToTree(self.FTreeElem.Tree.FocusedNode, TemplateDescriptionDataset.FieldByName('Name').AsString,
                             TemplateDescriptionDataset.fieldByName(FieldId).AsInteger, OptTourDescript ,0, OptAdd );
end;
//******************************************************************************
function TDetailTours.FAddOtherToTree( FieldId:String; TemplateOther:TDataset; OptAdd:TOptAddToTree ):Boolean;
var ParentId:Integer;
    ObjId:Variant;
    OrderIndex:Integer;
    New:Boolean;
    ForNode:TcxTreeListNode;
begin
  result := FAddObjectToTree(self.FTreeElem.Tree.FocusedNode, TemplateOther.FieldByName('SERVNAME').AsString,
                             TemplateOther.fieldByName(FieldId).AsInteger, OptTourOther,0, OptAdd );
end;
//******************************************************************************
procedure TDetailTours.FReorderDayNode( NodeDay:TcxTreeListNode );
var ChildNodes:array of TcxTreeListNode;
    IndNode:Integer;
    EventOnChangeNode:TNotifyEvent;
begin
 if NodeDay =  nil then exit;
 try
  FLockOnViewChange:=true;
  DisabledChangeTreeControl;

  SetLength(ChildNodes , NodeDay.ChildVisibleCount);
  //***********************************************
  NodeDay := NodeDay.getFirstChild;
  IndNode :=0;
  //***********************************************
  while NodeDay <> nil do
  begin
   ChildNodes[IndNode]:= NodeDay;
   NodeDay := NodeDay.getNextSibling;
   inc(IndNode);
  end;
  //***********************************************
  for IndNode:=0 to Length(ChildNodes)-1 do
  begin
    ChildNodes[IndNode].Focused:=True;
    self.FTreeElem.Tree.DataController.DataSet.Edit;
    self.FTreeElem.Tree.DataController.DataSet.FieldByName('STOPORDER').AsInteger := IndNode + 1;
    self.FTreeElem.Tree.DataController.DataSet.Post;
  end;
  //***********************************************
 finally
   EnabledChangeTreeControl;
   FLockOnViewChange:=false;
 end;
end;
//******************************************************************************
procedure TDetailTours.RefreshDBTree;
var SaveNode:TcxTreeListNode;
begin
 if not self.FTreeElem.Tree.DataController.DataSet.Active then exit;
 
 try
  self.FTreeElem.Tree.DataController.DataSet.DisableControls;
  SaveNode:=self.FTreeElem.Tree.FocusedNode;
  
  if (self.FTreeElem.Tree.DataController.DataSet is TIBCustomDataSet) then
    self.FTreeElem.Tree.DataController.DataSet.Refresh;

  if (self.FTreeElem.Tree.DataController.DataSet is TCustomADODataSet) then
    self.FTreeElem.RequeryCurrentRecord;

 finally
  if SaveNode <> nil  then
    SaveNode.Focused := True;
  self.FTreeElem.Tree.DataController.DataSet.EnableControls;
 end;
end;
//******************************************************************************
procedure TDetailTours.RefreshDBFocusedNode;
var SaveNode:TcxTreeListNode;
    TypeObject : TTypeObject;
    StartAction:TcxTreeListNode;
    FinishAction:TcxTreeListNode;
procedure RefreshNode( aNode:TcxTreeListNode );
begin
  if aNode<>nil then
  begin
    aNode.Focused :=true;
    self.FTreeElem.RequeryCurrentRecord; // Tree.DataController.DataSet.Refresh;
  end;
end;
//*******************************************
begin
  if not self.FTreeElem.Tree.DataController.DataSet.Active then exit;
  if self.FTreeElem.Tree.FocusedNode = nil  then exit;
  
  try
    self.FTreeElem.Tree.DataController.DataSet.DisableControls;
    SaveNode:=self.FTreeElem.Tree.FocusedNode;
    TypeObject := GetTypeByNode(self.FTreeElem.Tree.FocusedNode);

    StartAction  := FFindObjInAllDays( TypeObject.ObjId,TypeObject.ObjType, 0 );
    FinishAction := FFindObjInAllDays( TypeObject.ObjId,TypeObject.ObjType, 1 );

    RefreshNode( StartAction );
    RefreshNode( FinishAction );
    
  finally
    if SaveNode <> nil  then
    SaveNode.Focused := True;
    self.FTreeElem.Tree.DataController.DataSet.EnableControls;
  end;
end;
//******************************************************************************
function TDetailTours.GetCountDays:integer;
var TopLevel:TcxTreeListNode;
begin
  TopLevel := self.FTreeElem.Tree.TopNode;
  result:=0;
  while TopLevel<>nil do
  begin
    TopLevel := TopLevel.getNextSibling;
    inc(result);
  end;
end;
//******************************************************************************
procedure TDetailTours.ReorderAllDayNode;
var TopLevel:TcxTreeListNode;
    SaveNode:TcxTreeListNode;
begin

 //if (FTree.DataController.DataSet is TIBCustomDataSet) then
 self.RefreshDBTree;

 SaveNode:=self.FTreeElem.Tree.FocusedNode;
 try
  TopLevel:=self.FTreeElem.Tree.TopNode;
  while TopLevel<>nil do
  begin
    FReorderDayNode( TopLevel );
    TopLevel := TopLevel.GetNext;
  end;
 finally

  if SaveNode <> nil  then
   SaveNode.Focused := True;

  //if (FTree.DataController.DataSet is TIBCustomDataSet) then
  self.RefreshDBTree;
 end;

end;
//******************************************************************************
procedure TDetailTours.Remove;
begin
 try
  //self.FTreeElem.Tree.BeginUpdate;
  self.FTreeElem.Tree.DataController.DataSet.DisableControls;

  While not self.FTreeElem.Tree.DataController.DataSet.Eof do  self.FTreeElem.Tree.DataController.DataSet.Delete;

 finally
   self.FTreeElem.Tree.DataController.DataSet.EnableControls;
   //self.FTreeElem.Tree.EndUpdate;
 end;
end;
//******************************************************************************
procedure TDetailTours.AddPropertyForTypeObj( TypeObj:Variant; Tab:TcxTabSheet; View:TcxGridDBTableView; DatasetParent:TDataset; FieldParentKod:String; EventDelFromTree: TEventDeleteFromTree );
var Len:Integer;
begin
 Len:=Length( FMasTypeObjTabShow );
 SetLength( FMasTypeObjTabShow , Len+1);
 FMasTypeObjTabShow[Len].TypeObj:= TypeObj;
 FMasTypeObjTabShow[Len].Tab := Tab;
 FMasTypeObjTabShow[Len].View:=View;
 FMasTypeObjTabShow[Len].PersonalViewRecordChange := View.OnFocusedRecordChanged;
 FMasTypeObjTabShow[Len].PersonalTabShow := Tab.OnShow;
 
 FMasTypeObjTabShow[Len].FieldIdName := View.DataController.KeyFieldNames;
 FMasTypeObjTabShow[Len].Dataset := View.DataController.DataSet;

 FMasTypeObjTabShow[Len].DatasetParent := DatasetParent;
 FMasTypeObjTabShow[Len].FieldParentKod := FieldParentKod;

 FMasTypeObjTabShow[Len].EventDelFromTree := EventDelFromTree;

 View.OnFocusedRecordChanged := ViewFocusedRecordChanged;
 Tab.OnShow := FTabObjectShow;
end;
//******************************************************************************
function TDetailTours.FFindTabByTypeObj(TypeObj:Variant):TTypeObjTabShow;
var i:Integer;
begin
  result.Tab:=nil;

  for i:=0 to Length(FMasTypeObjTabShow)-1 do
  begin
    if FMasTypeObjTabShow[i].TypeObj = TypeObj then
      result:=FMasTypeObjTabShow[i];
  end;
end;
//******************************************************************************
function TDetailTours.FFindTabByTab( Tab : TcxTabSheet ):TTypeObjTabShow;
var i:Integer;
begin
  result.Tab:=nil;
  for i:=0 to Length(FMasTypeObjTabShow)-1 do
  begin
    if FMasTypeObjTabShow[i].Tab = Tab then
      result:=FMasTypeObjTabShow[i];
  end;
end;
//******************************************************************************
function TDetailTours.FFindTabByView( View : TcxCustomGridTableView ):TTypeObjTabShow;
var i:Integer;
begin
  result.Tab:=nil;
  for i:=0 to Length(FMasTypeObjTabShow)-1 do
  begin
    if FMasTypeObjTabShow[i].View = View then
      result:=FMasTypeObjTabShow[i];
  end;
end;
//******************************************************************************
procedure TDetailTours.FShowTabAndLocateObjId( TypeObjTab:TTypeObjTabShow; CurrObjId:Variant );
begin
  if (TypeObjTab.Tab<>nil) and
     (TypeObjTab.Tab.PageControl.ActivePage <> TypeObjTab.Tab) then
  try
    FLockTabShow:=True;
    TypeObjTab.Tab.PageControl.ActivePage := TypeObjTab.Tab;
  finally
   FLockTabShow:=false;
  end;
  //****************************
  if CurrObjId <>null then
  begin
   try
    if not TypeObjTab.Dataset.Active then TypeObjTab.Dataset.Open;
   //***********************************
    TypeObjTab.Dataset.DisableControls;

    self.FLockOnViewChange:=True;
    TypeObjTab.Dataset.Locate( TypeObjTab.FieldIdName, CurrObjId, [] );

    if (TypeObjTab.DatasetParent <> nil) and (TypeObjTab.FieldParentKod <>'') then
    begin

      try
        TypeObjTab.DatasetParent.DisableControls;
        TypeObjTab.DatasetParent.Locate( TypeObjTab.FieldParentKod, TypeObjTab.Dataset.FieldByName( TypeObjTab.FieldParentKod ).Value, [] );

      finally
        TypeObjTab.DatasetParent.EnableControls;
      end;

    end;
   //***********************************
   finally
    TypeObjTab.Dataset.EnableControls;
    self.FLockOnViewChange:=false;
   end;
  end;
end;
//******************************************************************************
procedure TDetailTours.TreeTourSchedFocusedNodeChanged( Sender: TcxCustomTreeList;
  APrevFocusedNode, AFocusedNode: TcxTreeListNode);
begin
 if not Sender.IsActive then exit;
 
 try
  if AFocusedNode = nil then exit;

  SynhronizeSelectTabForNode( AFocusedNode );

 finally
   if @FPersonalTreeFocusedNode <> nil then FPersonalTreeFocusedNode( Sender, APrevFocusedNode, AFocusedNode );
 end;
end;
//******************************************************************************
function TDetailTours.FGetTabObjectByNode(Node: TcxTreeListNode):TTypeObjTabShow;
begin
  if Node <> nil  then
    result:= FFindTabByTypeObj( Node.Values[ self.FTreeElem.Tree.GetColumnByFieldName('TYPEOBJ').ItemIndex ] );
end;
//******************************************************************************
function TDetailTours.FocusedNodeTreeByObject( TypeObj, ObjectId:Variant ):Boolean;
var FindNode:TcxTreeListNode;
    TypeObjTab:TTypeObjTabShow;
    CurrObjId:Variant;
begin
  result:=false;
  if ( self.FTreeElem.Tree.FocusedNode<>nil ) and
     ( self.FTreeElem.Tree.FocusedNode.Values[ self.FTreeElem.Tree.GetColumnByFieldName('OBJID').ItemIndex ] = ObjectId ) and
     ( self.FTreeElem.Tree.FocusedNode.Values[ self.FTreeElem.Tree.GetColumnByFieldName('TYPEOBJ').ItemIndex ] = TypeObj )  then
     begin
       result:=True;
       exit;
     end;
  //********************************
  FindNode:=FFindNodeByParam( [ 'OBJID', 'TYPEOBJ' ], [ObjectId, TypeObj] );
  if FindNode <> nil then
  begin
    try
      FindNode.Focused := True;
      result := True;
    finally
      FLockOnViewChange := false;
    end;
  end;
end;
//******************************************************************************
function TDetailTours.FocusedNodeTreeByActionObject( TypeObj, TypeAction, ObjectId:Variant ):Boolean;
var FindNode:TcxTreeListNode;
begin
  result:=false;
  if ( self.FTreeElem.Tree.FocusedNode<>nil ) and
     ( self.FTreeElem.Tree.FocusedNode.Values[ self.FTreeElem.Tree.GetColumnByFieldName('OBJID').ItemIndex ] = ObjectId ) and
     ( self.FTreeElem.Tree.FocusedNode.Values[ self.FTreeElem.Tree.GetColumnByFieldName('TYPEOBJ').ItemIndex ] = TypeObj ) and
      ( self.FTreeElem.Tree.FocusedNode.Values[ self.FTreeElem.Tree.GetColumnByFieldName('TYPEACTION').ItemIndex ] = TypeAction )
     then
     begin
       result:=True;
       exit;
     end;
  //********************************
  FindNode:=FFindNodeByParam( [ 'OBJID', 'TYPEOBJ','TYPEACTION' ], [ObjectId, TypeObj, TypeAction] );
  if FindNode <> nil then
  begin
    FindNode.Focused:=True;
    result:=True;
  end;
end;
//******************************************************************************
procedure TDetailTours.FTabObjectShow(Sender: TObject);
var TypeObjTab:TTypeObjTabShow;
begin
 try
   TypeObjTab:=FFindTabByTab(TcxTabSheet(Sender));
   if FLockTabShow then exit;

   try
     FLockOnViewChange:=True;
     TypeObjTab.Dataset.DisableControls;

     if TypeObjTab.Tab <> nil then
     begin
       if not TypeObjTab.Dataset.Active then TypeObjTab.Dataset.Open;
       if TypeObjTab.Dataset.FieldByName(TypeObjTab.FieldIdName).Value <> null then
         TypeObjTab.Dataset.Locate( TypeObjTab.FieldIdName, TypeObjTab.Dataset.FieldByName(TypeObjTab.FieldIdName).Value, [] );

       self.FocusedNodeTreeByObject( TypeObjTab.TypeObj, TypeObjTab.Dataset.FieldByName( TypeObjTab.FieldIdName ).Value );
     end;
   finally
     FLockOnViewChange:=False;
     TypeObjTab.Dataset.EnableControls;
   end;

 finally
  if @TypeObjTab.PersonalTabShow <> nil then TypeObjTab.PersonalTabShow(Sender); 
 end;

end;
//******************************************************************************
function TDetailTours.FFindValueBeforeNodeForActionType( Node: TcxTreeListNode;ObjType,ActionType:Integer;ResultField:String ):Variant;
var CurrTYPEACTION:variant;
    CurrObjType:Variant;
begin
  result:=null;
  While Node<>nil do
  begin
    Node:=Node.GetPrev;
    if (Node = nil) then Break;

    CurrObjType    := Node.Values[ self.FTreeElem.Tree.GetColumnByFieldName('TYPEOBJ').ItemIndex ];
    CurrTYPEACTION := Node.Values[ self.FTreeElem.Tree.GetColumnByFieldName('TYPEACTION').ItemIndex ];

    if (CurrTYPEACTION <> null) and (CurrObjType <> null) and
       (CurrObjType = ObjType ) and
       (CurrTYPEACTION <> ActionType) then                                       //if Found Else Input ActionType - Error
    begin
     result:=0;
     Break;
    end;

    if (CurrObjType = ObjType ) and
       ( CurrTYPEACTION = ActionType ) and (Node.Values[  self.FTreeElem.Tree.GetColumnByFieldName(ResultField).ItemIndex  ] <> null) then
    begin
      result:= Node.Values[  self.FTreeElem.Tree.GetColumnByFieldName(ResultField).ItemIndex  ];
      break;
    end;
  end;
end;
//******************************************************************************
function TDetailTours.FCheckForActionType( Node: TcxTreeListNode; ObjType , ActionType:Integer ):Boolean;
var CurrTYPEACTION:variant;
    CurrObjType:Variant;
begin
  result:=true;
  While Node<>nil do
  begin
    Node:=Node.GetPrev;
    if (Node = nil) then Break;

    CurrObjType    := Node.Values[ self.FTreeElem.Tree.GetColumnByFieldName('TYPEOBJ').ItemIndex ];
    CurrTYPEACTION := Node.Values[ self.FTreeElem.Tree.GetColumnByFieldName('TYPEACTION').ItemIndex ];

    if (CurrTYPEACTION <> null) and (CurrObjType = ObjType ) then
    begin
      if CurrTYPEACTION = ActionType then result:=True
      else result:=False;
      break;
    end;
  end;
end;
//******************************************************************************
function TDetailTours.FCheckHotelForDay( Day:Integer; ActionType:Integer ):boolean;
var Node: TcxTreeListNode;
    CurrObjType:variant;
    CurrTYPEACTION:variant;
begin
  result:=false;
  Node:=FFindCurrRecDayTreeNote(Day);
  While Node<>nil do
  begin
    CurrObjType    := Node.Values[ self.FTreeElem.Tree.GetColumnByFieldName('TYPEOBJ').ItemIndex ];
    CurrTYPEACTION := Node.Values[ self.FTreeElem.Tree.GetColumnByFieldName('TYPEACTION').ItemIndex ];
    if (CurrObjType <> null)and(CurrTYPEACTION <> null) and
       (CurrObjType = OptTourHotel ) and (CurrTYPEACTION = ActionType ) then
    begin
     result:=True;
     Break;
    end;
    Node:=Node.GetNext;
    if (Node<>nil)and(Node.Level = 0) then Break;
  end;
end;
//******************************************************************************
function TDetailTours.FCheckHotelForThisNode( Node: TcxTreeListNode ):Boolean;
var NodeDay: TcxTreeListNode;
begin
  result:=False;
  While Node<>nil do
  begin

    NodeDay := FFindDayNodeFromNode(Node);
    if ( NodeDay <> nil ) then
    begin
      if  ( FCheckHotelForDay( FGetOrderNumberForNode( NodeDay ), 0 ) ) then // 0 - ActionType In Hotel
      begin
        result := True;
        Break;
      end;
      if  ( FCheckHotelForDay( FGetOrderNumberForNode( NodeDay ), 1 ) ) then // 0 - ActionType Out Hotel
      begin
        result := False;
        Break;
      end;
    end;

    Node := Node.GetPrev;
  end;
end;
//******************************************************************************
function TDetailTours.FCheckTransferForThisNode( Node: TcxTreeListNode;ActionType:Integer ):Boolean;
var TypeObject:TTypeObject;
begin
  Node := FFindLastElemForNode( Node );
  result:=false;
  
  While (Node<>nil)and(Node.Level<>0) do
  begin
   TypeObject:=GetTypeByNode(Node);
   if (TypeObject.ObjType = OptTourStops ) then
   begin
     if (TypeObject.ActionType = ActionType ) then
       result:=true
     else  result:=false;
     break;
   end;

   Node := Node.GetPrev;      
  end;
end;
//******************************************************************************
procedure TDetailTours.ViewFocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord;
  ANewItemRecordFocusingChanged: Boolean);
var TypeObjTab:TTypeObjTabShow;
begin
  if AFocusedRecord = nil then exit;
  try
    TypeObjTab := FFindTabByView( Sender );
    if not TypeObjTab.Dataset.Active then TypeObjTab.Dataset.Open;
    
    if not FLockOnViewChange then
      self.FocusedNodeTreeByObject( TypeObjTab.TypeObj , TypeObjTab.Dataset.FieldByName( TypeObjTab.FieldIdName ).Value );

  finally
    if (@TypeObjTab.PersonalViewRecordChange <> nil)and( not FLockOnViewChange ) then
    TypeObjTab.PersonalViewRecordChange(Sender,APrevFocusedRecord,AFocusedRecord,ANewItemRecordFocusingChanged);
  end;
end;
//******************************************************************************
function TDetailTours.FGetSelectionColor(Sender: TcxCustomTreeList):TcxStyle;
begin
 if  Sender.IsFocused then
 begin
   if Sender.Styles.Selection<>nil then
     result:=Sender.Styles.Selection
   else
     result:=nil;
 end
 else
    if Sender.Styles.Inactive<>nil then
     result:=Sender.Styles.Inactive
   else
     result:=nil;
end;
//******************************************************************************
procedure TDetailTours.TreeDrawFillRect(Sender: TcxCustomTreeList; AViewInfo: TcxTreeListEditCellViewInfo; ACanvas: TcxCanvas );
var FocusedStyle:TcxStyle;
begin

 if ( AViewInfo.Focused )and( AViewInfo.Selected ) then
  begin
     FocusedStyle:= FGetSelectionColor( Sender );
     ACanvas.Font.Color := FocusedStyle.TextColor;
     ACanvas.FillRect( AViewInfo.BoundsRect , FocusedStyle.Color );
  end
  else
    ACanvas.FillRect( AViewInfo.BoundsRect , ACanvas.Brush.Color );
end;
//******************************************************************************
procedure TDetailTours.FShowTextImageInCell(Sender: TcxCustomTreeList;ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo; ImageList:TImageList;ImageIndex:integer);
var BoundsRect:TRect;
begin
  if self.FImageListInformError <> nil then
  begin
    TreeDrawFillRect( Sender, AViewInfo, ACanvas );
    BoundsRect:=AViewInfo.BoundsRect;
    BoundsRect.Top:=BoundsRect.Top+2;

    ACanvas.DrawTexT( VarToStr(AViewInfo.DisplayValue), BoundsRect, 0, True);
    ACanvas.DrawImage( self.FImageListInformError,AViewInfo.BoundsRect.Right-16 , AViewInfo.BoundsRect.Top ,ImageIndex ,true );
  end;
end;
//******************************************************************************
function TDetailTours.GetTimeActionByNode( Node: TcxTreeListNode ):Double;
begin
  if (Node<>nil)and(Node.Values[ self.FTreeElem.Tree.GetColumnByFieldName(FFieldActionTime).ItemIndex ]<>null) then
  result:=Frac( Node.Values[ self.FTreeElem.Tree.GetColumnByFieldName(FFieldActionTime).ItemIndex ] )
  else result:=0;
end;
//******************************************************************************
function TDetailTours.GetTimeActionByFocusedNode:Double;
begin
  result:=GetTimeActionByNode( self.FTreeElem.Tree.FocusedNode );
end;
//******************************************************************************
function TDetailTours.GetValueNodeByFieldName( Node: TcxTreeListNode;FieldName:String ):Variant;
begin
  result:= Node.Values[ self.FTreeElem.Tree.GetColumnByFieldName(FieldName).ItemIndex ];
end;
//******************************************************************************
function TDetailTours.GetCityIdByNode( Node: TcxTreeListNode ):Variant;
begin
  if Node <> nil then
  begin
    while Node<>nil do
    begin
      result:= Node.Values[ self.FTreeElem.Tree.GetColumnByFieldName(FFieldSityID).ItemIndex ];
      if result<>null then Break
      else Node:=Node.GetPrev;
    end
  end
   else result := -1;
end;
//******************************************************************************
function TDetailTours.GetFocusedCityId:Variant;
begin
 result := GetCityIdByNode( self.FTreeElem.Tree.FocusedNode );
end;
//******************************************************************************
function TDetailTours.GetCityIdByFocusedNode( Node: TcxTreeListNode ):Variant;
begin
  GetCityIdByNode( self.FTreeElem.Tree.FocusedNode );
end;
//******************************************************************************
function TDetailTours.GetCityIdArrivedFromNode( Node: TcxTreeListNode ):Variant;
begin
 result:=FFindValueBeforeNodeForActionType( Node , OptTourStops, 1 , FFieldSityID);    // 1 - Arrived
end;
//******************************************************************************
function TDetailTours.GetCityIdArrivedFromFocusedNode:Variant;
begin
 result:=GetCityIdArrivedFromNode( self.FTreeElem.Tree.FocusedNode );
end;
//******************************************************************************
function TDetailTours.CheckLocationForCityidPlace( Node: TcxTreeListNode; CITYID:variant ):Boolean;
var BeforeStopArriveCityId:Variant;
begin
 BeforeStopArriveCityId := GetCityIdArrivedFromNode(Node);
 if ( BeforeStopArriveCityId <> null) and                                       // Check Loctaion
    ( BeforeStopArriveCityId <> CITYID ) then result:=true
 else result:=false;
end;
//******************************************************************************
function TDetailTours.CheckLocationForNodePlace( Node: TcxTreeListNode ):Boolean;
begin
  result:=CheckLocationForCityidPlace( Node, GetCityIdByNode( Node ) );
end;
//******************************************************************************
function TDetailTours.FCheckIsLastDay( Node: TcxTreeListNode ):Boolean;
var Day:integer;
    DayNode:TcxTreeListNode;
begin
 result:=False;
 DayNode:=FFindDayNodeFromNode( Node );
 if DayNode <> nil then
 begin
   Day:=FGetOrderNumberForNode( DayNode );
   if Day = GetCountDays then result:=True;
 end;
end;
//******************************************************************************
function TDetailTours.CanAddTripForFocusedNode:Boolean;
var TypeObject:TTypeObject;
begin
  TypeObject := GetTypeByNode( self.FTreeElem.Tree.FocusedNode );
  if ( self.FTreeElem.Tree.FocusedNode<>nil ) and( TypeObject.ObjType = null ) then
   result:= true
  else result :=false; 
end;
//******************************************************************************
function TDetailTours.CanAddHotelForDay(aDay:Integer):Boolean;
var DayNode:TcxTreeListNode;
begin
  DayNode := self.FFindCurrRecDayTreeNote(aDay);
  result := CanAddHotelForNode(DayNode)
end;
//******************************************************************************
function TDetailTours.CanAddHotelForNode( aNode:TcxTreeListNode ):Boolean;
begin
  if aNode <> nil then
    result:=( not FCheckHotelForThisNode( aNode ) ) and
            ( not FCheckTransferForThisNode( aNode , 0 ) ) and
            ( not FCheckIsLastDay( aNode ) )
  else
    result := false;          
end;
//******************************************************************************
function TDetailTours.CanAddHotelForFocusedNode : Boolean;
begin
  result := CanAddHotelForNode( self.FTreeElem.Tree.FocusedNode  );
  {result:=( not FCheckHotelForThisNode( Ftree.FocusedNode ) ) and
          ( not FCheckTransferForThisNode( Ftree.FocusedNode , 0 ) ) and
          ( not FCheckIsLastDay( Ftree.FocusedNode ) ); }
end;
//******************************************************************************
function TDetailTours.CanAddExcursionForFocusedNodeSub:Boolean;
var  TypeObject: TTypeObject;
begin
  result:=false;
  if self.FTreeElem.Tree.FocusedNode = nil then Exit;

  TypeObject := GetTypeByNode( self.FTreeElem.Tree.FocusedNode );
  if ( self.FTreeElem.Tree.FocusedNode.Level >0 ) and
     ( TypeObject.ObjType<>null ) and
     ( TypeObject.ObjType = OptTourExcurs ) then result:=true;
end;
//******************************************************************************
function TDetailTours.ValidTree:TOptValidTree;             //   TOptValidTree = (OptValidNone,OptValidGeo,optValidTime);
var Node:TcxTreeListNode;
    TypeObject:TTypeObject;
    CurrTypeObj:Integer;
begin
 try
  result:= OptValidNone;
  Node := self.FTreeElem.Tree.TopNode;
  while Node<>nil do
  begin
    TypeObject := GetTypeByNode(Node);
    if TypeObject.ObjType<>null then CurrTypeObj:= TypeObject.ObjType
    else CurrTypeObj:=-1;
    //***********************************
    if (TypeObject.ObjType<>Null)and( Node.GetPrev <> nil ) and ( GetTimeActionByNode( Node ) < GetTimeActionByNode( Node.GetPrev ) ) then
    begin
      result:=optValidTime;
      Break;
    end;
    //**********************************
    if  ( ( TypeObject.ObjType = OptTourStops) and (TypeObject.ActionType = 0) ) OR                                 // Check Stops, Hotel,Excursion Location In Same Arrived City
     ( ( CurrTypeObj in [ OptTourHotel, OptTourExcurs ] ) ) then
     if ( CheckLocationForNodePlace( Node ) )  then
     begin
       result:=OptValidLocation;
       Break;
     end;
    //**********************************
    if ( TypeObject.ObjType = OptTourStops) then
      if  ( ( TypeObject.ActionType = 0 ) and ( not FCheckForActionType( Node, OptTourStops , 1 )) ) OR            // Check Stat Stop  OR
       ( ( TypeObject.ActionType = 1 ) and ( not FCheckForActionType( Node, OptTourStops , 0 )) ) THEN          // Check Stop Start
      begin
        result:=OptValidStartStop;
        Break;
      end;
    //**********************************
    if ( Node.Level = 0) and ( Node.getNextSibling <> nil ) and                                      // For Day Check Hotel OR Arrive Stop
    ( not FCheckHotelForThisNode( Node ) )and( not FCheckTransferForThisNode( Node, 0 ) ) then
     begin
       result:=OptValidHotel;
       Break;
     end;
    //**********************************
    Node := Node.GetNext;
  end;
 finally
 end;
end; 
//******************************************************************************
procedure TDetailTours.TreeCustomDrawDataCell(Sender: TcxCustomTreeList;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
var DisplayValue:WideString;
    CurrTypeObj:Integer;
    CurrTypeAction:Integer;
begin
 if AViewInfo.Node.Values [ self.FTreeElem.Tree.GetColumnByFieldName('TYPEOBJ').ItemIndex ]<>null then
   CurrTypeObj:= AViewInfo.Node.Values [ self.FTreeElem.Tree.GetColumnByFieldName('TYPEOBJ').ItemIndex ]
 else CurrTypeObj:=-1;
 //**************************
 if AViewInfo.Node.Values [ self.FTreeElem.Tree.GetColumnByFieldName('TYPEACTION').ItemIndex ]<>null then
   CurrTypeAction := AViewInfo.Node.Values [ self.FTreeElem.Tree.GetColumnByFieldName('TYPEACTION').ItemIndex ]
 else CurrTypeAction:=-1;
 //**********************************************************

 if (AViewInfo.Node.Level = 1) then
 begin
   if AViewInfo.DisplayValue <> null then DisplayValue := AViewInfo.DisplayValue
   else DisplayValue:='';
   //***********************
   if ( AnsiPos(ExtExcursionTreeLevel, DisplayValue)<> 0 ) and (  CurrTypeObj = OptTourExcurs ) then
   begin
     if ( not AViewInfo.Focused )and( not AViewInfo.Selected ) then ACanvas.Font.Color := clGreen;
     ACanvas.Font.Style  := [ fsBold ];
   end;
 end;
 //*****************************************
 if self.FLockTreeDraw then Exit;
 //*****************************************
 if ( AViewInfo.Column = self.FTreeElem.Tree.GetColumnByFieldName(FFieldActionTime) )and      // Check Time Before
    ( AViewInfo.Node.GetPrev <> nil ) and
    ( GetTimeActionByNode( AViewInfo.Node ) < GetTimeActionByNode( AViewInfo.Node.GetPrev ) ) then ACanvas.Font.Color := clRed;
 //*****************************************
 if AViewInfo.Column = self.FTreeElem.Tree.GetColumnByFieldName('CalcDescription') then
 begin
 if  ( ( CurrTypeObj = OptTourStops) and (CurrTypeAction=0) ) OR                               // Check Stops, Hotel,Excursion Location In Same Arrived City
     ( ( CurrTypeObj in [OptTourHotel, OptTourExcurs] ) ) then
     if ( CheckLocationForNodePlace(  AViewInfo.Node ) )  then
     begin
       ACanvas.Font.Color := clRed;
       FShowTextImageInCell( Sender, ACanvas, AViewInfo,FImageListInformError, 0 );

       ADone:=True;
     end;
 //*****************************************
 if ( CurrTypeObj = OptTourStops ) then
 begin
   if ( ( CurrTypeAction = 0 ) and ( not FCheckForActionType( AViewInfo.Node, OptTourStops , 1 )) ) OR    // Check Stat Stop  OR
      ( ( CurrTypeAction = 1 ) and ( not FCheckForActionType( AViewInfo.Node, OptTourStops , 0 )) ) THEN  // Check Stop Start
   begin
     ACanvas.Font.Color := clRed;
     FShowTextImageInCell( Sender, ACanvas, AViewInfo,FImageListInformError, 1 );

     ADone:=True;
   end;
   //***********************************************
 end;

 //*****************************************
 if (AViewInfo.Node<>nil)and
    ( AViewInfo.Node.Level = 0) and (AViewInfo.Node.getNextSibling <> nil ) and                                      // For Day Check Hotel OR Arrive Stop
    ( not FCheckHotelForThisNode( AViewInfo.Node ) )and( not FCheckTransferForThisNode( AViewInfo.Node, 0 ) ) then  // 1 - Arrive Transfer 0 - Depart Time
 begin
   FShowTextImageInCell( Sender, ACanvas, AViewInfo,FImageListInformError, 2 );
   ADone:=True;
 end;
 //*****************************************
 end;
 if @FPersonalTreeCustomDraw <> nil then FPersonalTreeCustomDraw( Sender, ACanvas, AViewInfo, ADone );
end;
//******************************************************************************
function TDetailTours.GetDayParentForNode(aNode:TcxTreeListNode):TTypeDayNodeParent;
var DayNode:TcxTreeListNode;
begin
 result.Day:=-1;
 result.parent:=-1;

 if aNode = nil  then exit;
 if aNode.Level = 0 then DayNode:= aNode
 else
  begin
   DayNode := aNode;
   While DayNode.Level <> 0 do DayNode:= DayNode.Parent;
  end;

 result.Day    := DayNode.Values[ self.FTreeElem.Tree.GetColumnByFieldName('STOPORDER').ItemIndex ];
 result.parent := DayNode.Values[ self.FTreeElem.Tree.GetColumnByFieldName( self.FTreeElem.Tree.DataController.KeyField ).ItemIndex ];
end;
//******************************************************************************
function TDetailTours.GetFocusedDayParent:TTypeDayNodeParent;
begin
  result:= GetDayParentForNode( self.FTreeElem.Tree.FocusedNode );
end;
//******************************************************************************
procedure TDetailTours.FStynhronizeObjTypeForUpdate( TypeObj:Variant );
var TypeObjTab:TTypeObjTabShow;
    TObj:TTypeObject;
begin
 TypeObjTab := FFindTabByTypeObj( TypeObj );
 TObj := GetFocusedTypeObject;

 if (self.FTreeElem.Tree.DataController.DataSet.FieldByName('TYPEOBJ').Value <> TypeObj ) or
    (self.FTreeElem.Tree.DataController.DataSet.FieldByName('OBJID').Value <> TObj.ObjId ) then
   self.FocusedNodeTreeByObject( TypeObjTab.TypeObj , TypeObjTab.Dataset.FieldByName( TypeObjTab.FieldIdName ).Value );
end;
//******************************************************************************
procedure TDetailTours.SynhronizeTabAndTree;
var i:Integer;
begin
 for i:=0 to Length(FMasTypeObjTabShow)-1 do
  begin
    if FMasTypeObjTabShow[i].Tab.Showing then
       FStynhronizeObjTypeForUpdate( FMasTypeObjTabShow[i].TypeObj );
  end;
end;
//******************************************************************************
procedure TDetailTours.SynhronizeSelectTabForNode(AFocusedNode: TcxTreeListNode);
var TypeObjTab:TTypeObjTabShow;
    CurrObjId:Variant;
begin
  if AFocusedNode = nil then exit;

  TypeObjTab := FFindTabByTypeObj( AFocusedNode.Values[ self.FTreeElem.Tree.GetColumnByFieldName('TYPEOBJ').ItemIndex ] );
  if TypeObjTab.Tab <> nil then
  begin
    CurrObjId := AFocusedNode.Values[ self.FTreeElem.Tree.GetColumnByFieldName('OBJID').ItemIndex ];
    FShowTabAndLocateObjId( TypeObjTab, CurrObjId );
  end;
end;
//******************************************************************************
procedure TDetailTours.GenerateForAllTypeObject( TemplateId, DayCount , StartSchedDay:Integer );
begin
 try
  self.FTreeElem.Tree.GetColumnByFieldName(FFieldActionTime).SortIndex:=0;
  self.FTreeElem.Tree.BeginUpdate;
  self.FTreeElem.Tree.LockScrollBars;
  self.FLockTreeDraw:=True;

  //if (FTree.DataController.DataSet is TIBCustomDataSet) then
  self.RefreshDBTree;

  FGenerateDaysIntoTree(TemplateId, DayCount  );
  FGenerateDaysSchedTour(OptTourStops,  TemplateId, StartSchedDay );
  FAddHotelsToSchedTour(OptTourHotel, TemplateId );
  FAddExcursionToSchedTour(OptTourExcurs, TemplateId );

  Self.ReorderAllDayNode;
 finally
   if self.FTreeElem.Tree.TopNode<> nil  then self.FTreeElem.Tree.TopNode.Focused:=True;

   //if (FTree.DataController.DataSet is TIBCustomDataSet) then
   self.RefreshDBTree;
   self.FTreeElem.Tree.UnlockScrollBars;

   self.FLockTreeDraw:=false;
   self.FTreeElem.Tree.EndUpdate;
 end;
end;
//******************************************************************************
procedure TDetailTours.TreeCalcFields(DataSet: TDataSet);
var TypeObjTab:TTypeObjTabShow;
begin
 if DataSet.FieldByName('Parent').Value = null then
   DataSet.FieldByName('CalcDescription').AsString := DataSet.FieldByName('Description').AsString +' '+ DataSet.FieldByName('STOPORDER').AsString
 else
  DataSet.FieldByName('CalcDescription').AsString := DataSet.FieldByName('Description').AsString;
 //*********************************

 TypeObjTab:=FFindTabByTypeObj( DataSet.FieldByName('TYPEOBJ').AsInteger );

 if (not FLockLookUp)and(TypeObjTab.Dataset<>nil)and(TypeObjTab.Dataset.Active) then
 begin
   if (DataSet.FieldByName('TYPEACTION').AsInteger = 0) then
     DataSet.FieldByName(FFieldActionTime).Value := DataSet.fieldByName('TIMEFROM').Value;

   if (DataSet.FieldByName('TYPEACTION').AsInteger = 1) then
     DataSet.FieldByName(FFieldActionTime).Value := DataSet.fieldByName('TILLTIME').Value;

   if DataSet.FieldByName(FFieldActionTime).value<>null then
    DataSet.FieldByName(FFieldActionTime).AsFloat := frac( DataSet.FieldByName(FFieldActionTime).AsFloat);
 end;
 //*********************************
 if @FPersonalCalcTree <> nil then FPersonalCalcTree(DataSet);
 
end;
//******************************************************************************
function TDetailTours.AddNewTransfer(TemplateId:integer; StartSchedDay:Integer = 1):Boolean;
var TypeObjTab:TTypeObjTabShow;
    Options:Integer;
begin
 try
  result:=false;
  self.FTreeElem.Tree.LockScrollBars;

  FTemplateId := TemplateId;
  FListExcursionParent.Clear;
  
  TypeObjTab := FFindTabByTypeObj( OptTourStops );
  FStynhronizeObjTypeForUpdate( OptTourStops );

  if (TypeObjTab.DatasetParent <> nil )and(TypeObjTab.FieldParentKod<>'') then
     Options:= TypeObjTab.DatasetParent.FieldByName(TypeObjTab.FieldParentKod).AsInteger
  else Options:=0;


  result := FAddDayToSchedForCurrentArriveTime( TypeObjTab.FieldIdName, TypeObjTab.Dataset,StartSchedDay,Options );
  result := FAddDayToSchedForCurrentDepartTime( TypeObjTab.FieldIdName, TypeObjTab.Dataset,StartSchedDay,Options );

  self.FReorderDayNode(self.FTreeElem.Tree.FocusedNode.Parent );
  self.FocusedNodeTreeByObject( TypeObjTab.TypeObj , TypeObjTab.Dataset.FieldByName( TypeObjTab.FieldIdName ).Value );
 finally
   self.FTreeElem.Tree.UnLockScrollBars;
 end;
end;
//******************************************************************************
function TDetailTours.AddNewHotel(TemplateId:integer):Boolean;
var TypeObjTab:TTypeObjTabShow;
begin
 try
  result:=false;

  self.FTreeElem.Tree.LockScrollBars;
  FTemplateId := TemplateId;
  TypeObjTab := FFindTabByTypeObj( OptTourHotel );
  FStynhronizeObjTypeForUpdate( OptTourHotel );
  result:=FAddCurrHotelsToSchedTour( TypeObjTab.FieldIdName, TypeObjTab.Dataset );

  self.FReorderDayNode(self.FTreeElem.Tree.FocusedNode.Parent );
  self.FocusedNodeTreeByObject( TypeObjTab.TypeObj , TypeObjTab.Dataset.FieldByName( TypeObjTab.FieldIdName ).Value );
  
 finally
   self.FTreeElem.Tree.UnLockScrollBars;
 end;
end;
//******************************************************************************
procedure TDetailTours.FChangeDayOnNodeChild( Node:TcxTreeListNode;OnDay:Integer );
var TypeObject:TTypeObject;
    TypeObjTabShow: TTypeObjTabShow;
    SaveNode:TcxTreeListNode;
begin
 try
   SaveNode:=Node;
   Node := Node.getFirstChild;
   While (Node <> nil)and(Node.Level>SaveNode.Level) do
   begin
     TypeObject := GetTypeByNode(Node);

     TypeObjTabShow := GetTabByTypeObj(TypeObject.ObjType);

     Node.Focused:=true;
     if ( TypeObjTabShow.Dataset.FindField('BEGINDAY')<>nil )and( TypeObjTabShow.Dataset.FieldByName('BEGINDAY').Value <> OnDay ) then
     begin

       TypeObjTabShow.Dataset.Edit;
       TypeObjTabShow.Dataset.FieldByName('BEGINDAY').AsInteger:= OnDay;
       TypeObjTabShow.Dataset.Post;
     end;
     Node := Node.GetNext;
   end;

  finally
    SaveNode.Focused:=true;
  end;
end;
//******************************************************************************
procedure TDetailTours.FMoveNodeToDay( Node:TcxTreeListNode;OnDay:Integer; Description:Widestring );
var NodeDay:TcxTreeListNode;
    NodeCurrDay:TcxTreeListNode;
    ParentId:Integer;
    TypeObject:TTypeObject;
    OrderTree:Integer;
    SaveFocusedNode:TcxTreeListNode;
begin
 if Node = nil then  exit;

 try
  self.SetMarkFocusedID;
  FSetSortTreeByTime;

  SaveFocusedNode := self.FTreeElem.Tree.FocusedNode;
  self.FTreeElem.Tree.LockScrollBars;
  TypeObject := GetTypeByNode(Node);
  NodeCurrDay:= FFindDayNodeFromNode( Node );

  if FGetOrderNumberForNode( NodeCurrDay ) <> OnDay then
  begin
    FAddCurrDay( OnDay );  // If Day Not Found Add
    NodeDay := FFindCurrRecDayTreeNote( OnDay );
    ParentId := FFindCurrRecDayByNode(NodeDay);
  end
  else
   ParentId:= TypeObject.ParentID;

  Node.Focused := True;
  OrderTree:= FFindOrderInDayByTime(OnDay, self.GetTimeActionByNode( Node ) );

  FAddToDB( Description , ParentId , OrderTree, TypeObject.ObjId ,TypeObject.ObjType, TypeObject.ActionType, false , null );
  Self.FReorderDayNode( Node.Parent );
  Node.Focused := True;
  FChangeDayOnNodeChild( Node, OnDay );

 finally
  FSetSortTreeByOrderAndTime;
  if SaveFocusedNode<>nil then
    SaveFocusedNode.Focused:=True;

  self.GotoMarkFocusedID;  
  self.FTreeElem.Tree.UnLockScrollBars;
 end;

end;
//******************************************************************************
function TDetailTours.FUpdateHotel(TypeObjTab:TTypeObjTabShow):Boolean;
var BeginForAdd:Integer;
    DayCount:Integer;
    ObjId:Integer;
    Description:WideString;
    HotelStart:TcxTreeListNode;
    HotelFinish:TcxTreeListNode;
begin

 BeginForAdd := TypeObjTab.Dataset.FieldByName('BEGINDAY').AsInteger ;
 if TypeObjTab.Dataset.FieldByName('DAYCOUNT').AsInteger = 0  then
   DayCount := 1
 else DayCount := TypeObjTab.Dataset.FieldByName('DAYCOUNT').AsInteger;

 ObjId:=TypeObjTab.Dataset.FieldByName(TypeObjTab.FieldIdName).AsInteger;
 Description := FGetDescriptCurrHotel( TypeObjTab.Dataset);
 HotelStart  := FFindObjInAllDays( ObjId,OptTourHotel, 0 ); // знайти поселення в готель
 HotelFinish := FFindObjInAllDays( ObjId,OptTourHotel, 1 );// знайти виселення з готелю
 //*********************************************
 FMoveNodeToDay( HotelStart, BeginForAdd, Description );
 FMoveNodeToDay( HotelFinish,BeginForAdd + DayCount, Description );
 //*********************************************
end;
//******************************************************************************
procedure TDetailTours.FSetSortTreeByTime;
begin
  self.FTreeElem.Tree.GetColumnByFieldName('STOPORDER').SortOrder:=soNone;

  self.FTreeElem.Tree.GetColumnByFieldName(FFieldActionTime).SortOrder:=soAscending;
  self.FTreeElem.Tree.GetColumnByFieldName(FFieldActionTime).SortIndex:=0;
end;
//******************************************************************************
procedure TDetailTours.FSetSortTreeByOrderAndTime;
begin
  self.FTreeElem.Tree.GetColumnByFieldName(FFieldActionTime).SortOrder := soNone;
  self.FTreeElem.Tree.GetColumnByFieldName('STOPORDER').SortOrder := soAscending;
  self.FTreeElem.Tree.GetColumnByFieldName('STOPORDER').SortIndex := 0;

  self.FTreeElem.Tree.GetColumnByFieldName(FFieldActionTime).SortOrder := soAscending;
  self.FTreeElem.Tree.GetColumnByFieldName(FFieldActionTime).SortIndex := 1;
end;
//******************************************************************************
function TDetailTours.UpdateTrip( TemplateId:integer ):Boolean;
var TypeObjTab:TTypeObjTabShow;
    ShedIDByOptions:Integer;
begin
  result:=false;
  FTemplateId := TemplateId;
  try
    LockControl( self.FTreeElem.Tree, true );
    self.SaveScrollPosition;

    TypeObjTab := FFindTabByTypeObj( OptTourStops );
    if (TypeObjTab.DatasetParent <> nil) and (TypeObjTab.FieldParentKod <>'') then
      ShedIDByOptions:= TypeObjTab.DatasetParent.fieldByName( TypeObjTab.FieldParentKod ).AsInteger
    else ShedIDByOptions:=-1;
    FStynhronizeObjTypeForUpdate( OptTourStops );

    FGenerateDaysSchedTour( OptTourStops, TemplateId, 1, ShedIDByOptions );
    Self.ReorderAllDayNode;
    self.RefreshDBFocusedNode;
    TypeObjTab.Tab.PageControl.ActivePage := TypeObjTab.Tab;

  finally
    self.RestoreScrollPosition;
    LockControl( self.FTreeElem.Tree, false );
  end;
end;
//******************************************************************************
function TDetailTours.UpdateHotel(TemplateId:integer):Boolean;
var TypeObjTab:TTypeObjTabShow;
begin
  result:=false;
  FTemplateId := TemplateId;
  try
    LockControl( self.FTreeElem.Tree, true );
    self.SaveScrollPosition;

    TypeObjTab := FFindTabByTypeObj( OptTourHotel );
    FStynhronizeObjTypeForUpdate( OptTourHotel );
  
    if not FocusedNodeTreeByObject( TypeObjTab.TypeObj , TypeObjTab.Dataset.FieldByName( TypeObjTab.FieldIdName ).Value ) then
    begin
      result:=AddNewHotel(TemplateId);
      result:=FUpdateHotel(TypeObjTab);
    end
    else
     result:=FUpdateHotel(TypeObjTab);
    Self.ReorderAllDayNode; 
    self.RefreshDBFocusedNode;
    TypeObjTab.Tab.PageControl.ActivePage := TypeObjTab.Tab;

  finally
    self.RestoreScrollPosition;
    LockControl( self.FTreeElem.Tree, false );
  end;
end;
//******************************************************************************
function TDetailTours.FUpdateExcursion(TypeObjTab:TTypeObjTabShow):Boolean;
var BeginForAdd:Integer;
    ObjId:Integer;
    Description:WideString;
    ExcursStart:TcxTreeListNode;
begin
  BeginForAdd := TypeObjTab.Dataset.FieldByName('BEGINDAY').AsInteger ;
  ObjId:=TypeObjTab.Dataset.FieldByName(TypeObjTab.FieldIdName).AsInteger;
  Description := FGetDescriptExcursion( TypeObjTab.Dataset);

  ExcursStart  := FFindObjInAllDays( ObjId,OptTourExcurs, 0 );        // find Start Excursion
  FMoveNodeToDay( ExcursStart, BeginForAdd, Description );
end;
//******************************************************************************
function TDetailTours.FUpdateOther(TypeObjTab:TTypeObjTabShow):Boolean;
var BeginForAdd:Integer;
    ObjId:Integer;
    Description:WideString;
    ServOtherStart:TcxTreeListNode;
begin
  BeginForAdd := TypeObjTab.Dataset.FieldByName('BEGINDAY').AsInteger ;
  ObjId:=TypeObjTab.Dataset.FieldByName(TypeObjTab.FieldIdName).AsInteger;
  Description := FGetDescriptOther( TypeObjTab.Dataset);

  ServOtherStart  := FFindObjInAllDays( ObjId,OptTourOther, 0 );        // find Start Excursion
  FMoveNodeToDay( ServOtherStart, BeginForAdd, Description );
end;
//******************************************************************************
function TDetailTours.UpdateExcursion(TemplateId:integer):Boolean;
var TypeObjTab:TTypeObjTabShow;
    Node:TcxTreeListNode;
begin
 try
    LockControl( self.FTreeElem.Tree, true );
    self.SaveScrollPosition;

    Node := self.FTreeElem.Tree.FocusedNode;
    result:=false;
    FTemplateId := TemplateId;

    TypeObjTab := FFindTabByTypeObj( OptTourExcurs );
    FStynhronizeObjTypeForUpdate( OptTourExcurs );

    if not FocusedNodeTreeByObject( TypeObjTab.TypeObj , TypeObjTab.Dataset.FieldByName( TypeObjTab.FieldIdName ).Value ) then
      result:= AddNewExcursion(TemplateId)
    else
     result:=FUpdateExcursion(TypeObjTab);

   self.RefreshDBFocusedNode;
   TypeObjTab.Tab.PageControl.ActivePage := TypeObjTab.Tab;
 finally
   if Node <> nil then
     Node.Focused := true;

   self.RestoreScrollPosition;
   LockControl( self.FTreeElem.Tree, false );
 end;
end;
//******************************************************************************
function TDetailTours.FAddNewExcursion(TemplateId:integer; Sub:Boolean):Boolean;
var TypeObjTab:TTypeObjTabShow;
begin
 try
  result:=false;

  self.FTreeElem.Tree.LockScrollBars;
  FTemplateId := TemplateId;
  TypeObjTab := FFindTabByTypeObj( OptTourExcurs );
  FStynhronizeObjTypeForUpdate( OptTourExcurs );

  result:=FAddExcursionToTree( TypeObjTab.FieldIdName, TypeObjTab.Dataset , True, Sub);
  self.FReorderDayNode(self.FTreeElem.Tree.FocusedNode.Parent );
  self.FocusedNodeTreeByObject( TypeObjTab.TypeObj , TypeObjTab.Dataset.FieldByName( TypeObjTab.FieldIdName ).Value );

 finally
   self.FTreeElem.Tree.UnLockScrollBars;
 end;
end;
//******************************************************************************
function TDetailTours.AddNewExcursion(TemplateId:integer):Boolean;
begin
  result := FAddNewExcursion( TemplateId, false );
  self.RefreshDBFocusedNode;
end;
//******************************************************************************
function TDetailTours.AddNewExcursionSub(TemplateId:integer):Boolean;
begin
  result := FAddNewExcursion( TemplateId,true );
  self.RefreshDBFocusedNode;
end;
//******************************************************************************
procedure TDetailTours.LinkFocusedNodeToObjId(IdObj:Integer);
var Node:TcxTreeListNode;
begin
  Node := self.FTreeElem.Tree.FocusedNode;
  self.FTreeElem.Tree.DataController.DataSet.Edit;
  self.FTreeElem.Tree.DataController.DataSet.FieldByName('OBJID').Value := IdObj;
  self.FTreeElem.Tree.DataController.DataSet.Post;

  self.RefreshDBFocusedNode;
  if Node <> nil then
    Node.Focused := true;
end;
//******************************************************************************
procedure TDetailTours.UnLinkFocusedNodeFromObjId;
var Node:TcxTreeListNode;
begin
  Node := self.FTreeElem.Tree.FocusedNode;
  self.FTreeElem.Tree.DataController.DataSet.Edit;
  self.FTreeElem.Tree.DataController.DataSet.FieldByName('OBJID').Value := null;
  self.FTreeElem.Tree.DataController.DataSet.Post;
  self.RefreshDBFocusedNode;
  if Node <> nil then
    Node.Focused := true;
end;
//******************************************************************************
procedure TDetailTours.SetMarkFocusedID;
begin
  FSaveMarkFocusedID := self.FTreeElem.Tree.DataController.DataSet.fieldByName(self.FTreeElem.Tree.DataController.KeyField).Value;
end;
//******************************************************************************
procedure TDetailTours.GotoMarkFocusedID;
begin
  if FSaveMarkFocusedID <> null then
    self.FTreeElem.Tree.DataController.DataSet.Locate( self.FTreeElem.Tree.DataController.KeyField,FSaveMarkFocusedID,[] );
    
  FSaveMarkFocusedID := null;
end;
//******************************************************************************
procedure TDetailTours.SetMarkFocusedNode;
begin
 FSaveMarkFocusedNode:=self.FTreeElem.Tree.FocusedNode;
end;
//******************************************************************************
procedure TDetailTours.GotoMarkFocusedNode;
begin
 if FSaveMarkFocusedNode<>nil then FSaveMarkFocusedNode.Focused:=True;
end;
//******************************************************************************
procedure TDetailTours.LockOnViewChange;
begin
  FLockOnViewChange:=True;
end;
//******************************************************************************
procedure TDetailTours.UnLockOnViewChange;
begin
  FLockOnViewChange:=false;
end;
//******************************************************************************
function TDetailTours.FAddNewDescription(TemplateId:integer;OptAdd:TOptAddToTree):Boolean;
var TypeObjTab:TTypeObjTabShow;
    Parent:Integer;
    TypeObject : TTypeObject;
begin
 try
  result:=false;

  self.FTreeElem.Tree.LockScrollBars;
  FTemplateId := TemplateId;
  TypeObjTab := FFindTabByTypeObj( OptTourDescript );
  FStynhronizeObjTypeForUpdate( OptTourDescript );

  TypeObject := GetTypeByNode( self.FTreeElem.Tree.FocusedNode );

  if TypeObject.ID <> -1 then
  begin
    result := FAddDescriptionToTree(TypeObjTab.FieldIdName, TypeObjTab.Dataset, OptAdd );
    Self.FReorderDayNode(self.FTreeElem.Tree.FocusedNode.Parent );
    self.FocusedNodeTreeByObject( TypeObjTab.TypeObj , TypeObjTab.Dataset.FieldByName( TypeObjTab.FieldIdName ).Value );

    if (self.FTreeElem.Tree.DataController.DataSet is TIBCustomDataSet) then
      TypeObjTab.Dataset.Refresh;

    if (self.FTreeElem.Tree.DataController.DataSet is TCustomADODataSet) then
      TCustomADODataSet(TypeObjTab.Dataset).Requery;
  end;

   TypeObjTab.Tab.PageControl.ActivePage := TypeObjTab.Tab;
 finally
   self.FTreeElem.Tree.UnLockScrollBars;
 end;
end;
//******************************************************************************
function TDetailTours.FAddNewOther(TemplateId, IdOther:integer;OptAdd:TOptAddToTree):Boolean;
var TypeObjTab:TTypeObjTabShow;
begin
 try
   result:=false;

   self.FTreeElem.Tree.LockScrollBars;
   FTemplateId := TemplateId;
   TypeObjTab := FFindTabByTypeObj( OptTourOther );
   FStynhronizeObjTypeForUpdate( OptTourOther );
  
   result := FAddOtherToTree(TypeObjTab.FieldIdName, TypeObjTab.Dataset, OptAdd );
   self.FReorderDayNode(self.FTreeElem.Tree.FocusedNode.Parent );
   self.FocusedNodeTreeByObject( TypeObjTab.TypeObj , TypeObjTab.Dataset.FieldByName( TypeObjTab.FieldIdName ).Value );

   TypeObjTab.Tab.PageControl.ActivePage := TypeObjTab.Tab;
 finally
   self.FTreeElem.Tree.UnLockScrollBars;
 end;
end;
//******************************************************************************
function TDetailTours.InsertNewDescription(TemplateId:integer):Boolean;
var TypeObjTab:TTypeObjTabShow;
    Parent:Integer;
    TypeObject : TTypeObject;
begin
 FAddNewDescription(TemplateId , OptTreeAddInsert);
end;
//******************************************************************************
function TDetailTours.AddNewDescription(TemplateId:integer):Boolean;
var TypeObjTab:TTypeObjTabShow;
    Parent:Integer;
    TypeObject : TTypeObject;
begin
  FAddNewDescription(TemplateId , OptTreeAddLast);
end;
//******************************************************************************
function TDetailTours.AddNewDescriptionToSub(TemplateId:integer):Boolean;
var TypeObjTab:TTypeObjTabShow;
    Parent:Integer;
    TypeObject : TTypeObject;
begin
  FAddNewDescription(TemplateId , OptTreeAddSub);
  self.RefreshDBFocusedNode;
end;
//******************************************************************************
function TDetailTours.AddNewDescriptionForOpt(TemplateId:integer; OptAdd:TOptAddToTree ):Boolean;
var TypeObjTab:TTypeObjTabShow;
    Parent:Integer;
    TypeObject : TTypeObject;
begin
  FAddNewDescription(TemplateId , OptAdd);
  self.RefreshDBFocusedNode;
end;
//******************************************************************************
function TDetailTours.AddNewOtherForOpt(TemplateId, IdOther:integer; OptAdd:TOptAddToTree ):Boolean;
var TypeObjTab:TTypeObjTabShow;
    Parent:Integer;
    TypeObject : TTypeObject;
begin
  FAddNewOther(TemplateId, IdOther, OptAdd);
  self.RefreshDBFocusedNode;
end;
//******************************************************************************
function TDetailTours.UpdateOther(TemplateId:integer):Boolean;
var TypeObjTab:TTypeObjTabShow;
    Node:TcxTreeListNode;
begin
  result:=false;
  FTemplateId := TemplateId;

  TypeObjTab := FFindTabByTypeObj( OptTourOther );
  FStynhronizeObjTypeForUpdate( OptTourOther );

  if not FocusedNodeTreeByObject( TypeObjTab.TypeObj , TypeObjTab.Dataset.FieldByName( TypeObjTab.FieldIdName ).Value ) then
  begin
    result:= AddNewOtherForOpt( TemplateId, TypeObjTab.Dataset.FieldByName( TypeObjTab.FieldIdName ).Value, OptTreeAddInsert );
    result:=FUpdateOther( TypeObjTab );
  end
  else
   result:=FUpdateOther( TypeObjTab );

  self.RefreshDBFocusedNode;
  TypeObjTab.Tab.PageControl.ActivePage := TypeObjTab.Tab;
end;
//******************************************************************************
function TDetailTours.GetTypeByNode(Node:TcxTreeListNode):TTypeObject;
begin
  result.ObjID :=null;
  result.ObjType:=null;
  result.ID:=null;
  if Node = nil then exit;
  
  result.ObjId := Node.Values[ self.FTreeElem.Tree.GetColumnByFieldName('OBJID').ItemIndex ];
  result.ObjType := Node.Values[ self.FTreeElem.Tree.GetColumnByFieldName('TYPEOBJ').ItemIndex ];
  result.ActionType := Node.Values[ self.FTreeElem.Tree.GetColumnByFieldName('TYPEACTION').ItemIndex ];

  result.ID    := Node.Values[ self.FTreeElem.Tree.GetColumnByFieldName(self.FTreeElem.Tree.DataController.KeyField).ItemIndex ];
  Result.ParentID:=  Node.Values[ self.FTreeElem.Tree.GetColumnByFieldName(self.FTreeElem.Tree.DataController.ParentField).ItemIndex ];

  result.Options  := Node.Values[ self.FTreeElem.Tree.GetColumnByFieldName('OPTIONS').ItemIndex ];
  Result.ShowOnWeb:= Node.Values[ self.FTreeElem.Tree.GetColumnByFieldName('CalcShowWeb').ItemIndex ];
  Result.ShowTime := Node.Values[ self.FTreeElem.Tree.GetColumnByFieldName('CalcShowTimeWeb').ItemIndex ];
end;
//******************************************************************************
function TDetailTours.GetFocusedTypeObject:TTypeObject;
begin
  result := GetTypeByNode(self.FTreeElem.Tree.FocusedNode);
end;
//******************************************************************************
function TDetailTours.GetTabByTypeObj(ObjType:Integer):TTypeObjTabShow;
begin
  result := FFindTabByTypeObj( ObjType );
end;
//******************************************************************************
function TDetailTours.FocusedObjIsStop:boolean;
begin
  result:=GetFocusedTypeObject.ObjType = OptTourStops ;
end;
//******************************************************************************
function TDetailTours.FocusedObjIsHotel:boolean;
begin
  result:=GetFocusedTypeObject.ObjType = OptTourHotel ;
end;
//******************************************************************************
function TDetailTours.FocusedObjIsExcursion:boolean;
begin
  result:=GetFocusedTypeObject.ObjType = OptTourExcurs ;
end;
//******************************************************************************
function TDetailTours.FocusedObjIsDescription:boolean;
begin
  result:=GetFocusedTypeObject.ObjType = OptTourDescript ;
end;
//******************************************************************************
function TDetailTours.FocusedObjIsOther:boolean;
begin
  result:=GetFocusedTypeObject.ObjType = OptTourOther ;
end;
//******************************************************************************
function TDetailTours.FocusedObjValueByFieldName(fieldName:String):variant;
begin
  if self.FTreeElem.Tree.FocusedNode<>nil then
    result := self.FTreeElem.Tree.FocusedNode.Values[ self.FTreeElem.Tree.GetColumnByFieldName(fieldName).ItemIndex ]
  else result := null;
end;
//******************************************************************************
function TDetailTours.IsNullFocusedObject:Boolean;
var TypeObject:TTypeObject;
begin
  TypeObject := GetTypeByNode( self.FTreeElem.Tree.FocusedNode );
  result:= TypeObject.ObjId = null;
end;
//******************************************************************************
function TDetailTours.FDelNodesByObjId(ObjType,ObjId:Integer):boolean;
var aNode:TcxTreeListNode;
    TypeObj:TTypeObject;
    DelNodes:array of TcxTreeListNode;
    ParentDelNode: TcxTreeListNode;
    i:Integer;
    len:Integer;
begin
 aNode:=self.FTreeElem.Tree.TopNode;
 while aNode <> nil do
 begin

   TypeObj := GetTypeByNode(aNode);
   if (TypeObj.ObjId <> null) and (TypeObj.ObjType = ObjType) and (TypeObj.ObjId = ObjId) then
   begin
     Len:=Length(DelNodes);
     SetLength(DelNodes , Len+1);
     DelNodes[len] := aNode;
   end;

   aNode := aNode.GetNext;
 end;
 //**************Delete**Find**Nodes*****
 for i:=0 to Length(DelNodes)-1 do
 begin
   DelNodes[i].Focused:=True;
   ParentDelNode:= DelNodes[i].Parent;

   self.FTreeElem.Tree.DataController.DataSet.Delete;
   if ParentDelNode<>nil then
     FReorderDayNode( ParentDelNode );
 end;

 result := Length(DelNodes) <> 0;  // find and Deleted
 //************************************** 
end;
//******************************************************************************
procedure TDetailTours.FDeleteFromLinkDataset(TypeObject:TTypeObject);
var TypeObjTab:TTypeObjTabShow;
begin
  TypeObjTab := FFindTabByTypeObj( TypeObject.ObjType );
  if @TypeObjTab.EventDelFromTree<>nil then TypeObjTab.EventDelFromTree(TypeObjTab.Dataset,TypeObjTab.FieldIdName,TypeObject.ObjId);
end;
//******************************************************************************
function TDetailTours.FDelObjectByNode(node:TcxTreeListNode):boolean;
var TypeObject:TTypeObject;
    FocusParent:TcxTreeListNode;
    TypeObjTab:TTypeObjTabShow;
begin
 result:=false;
 TypeObject := GetTypeByNode( node );
 if (TypeObject.ObjId = -1)or(TypeObject.ObjType =-1) then Exit;

 if ( TypeObject.ObjId<>null ) and ( FDelNodesByObjId( TypeObject.ObjType, TypeObject.ObjId ) ) then
  begin
    FDeleteFromLinkDataset(TypeObject);
    result:=True;
  end
   else
   begin
    node.Focused:=True;

    if (self.FTreeElem.Tree.DataController.DataSet is TIBCustomDataSet) then
      TypeObjTab.Dataset.Refresh;

    if (self.FTreeElem.Tree.DataController.DataSet is TCustomADODataSet) then
      TCustomADODataSet(TypeObjTab.Dataset).Requery;

    self.FTreeElem.Tree.DataController.DataSet.Delete;
   end;
end;
//******************************************************************************
procedure TDetailTours.FDeleteAddExcursion(Node:TcxTreeListNode);
var OptionsExcurs:Integer;
    TypeObject:TTypeObject;
    Bmk:TbookMark;
begin
 TypeObject:=GetTypeByNode(Node);
 OptionsExcurs := TypeObject.Options;

 try
   Bmk := FSchedTours.GetBookmark;
   FSchedTours.Edit;
   FSchedTours.FieldByName('Description').AsString := ExtExcursionTreeLevel +' ('+ IntToStr( FGetIndexExtExcursion(OptionsExcurs) ) +')';
   FSchedTours.FieldByName('OBJID').Value :=  null;
   FSchedTours.Post;
   FDeleteFromLinkDataset(TypeObject);
 finally
   FSchedTours.GotoBookmark( Bmk );
 end;
end;
//******************************************************************************
procedure TDetailTours.FDelObjectByNodeWithDetail(Node:TcxTreeListNode);
var aNode:TcxTreeListNode;
    ParentDelNode:TcxTreeListNode;
    TypeObject:TTypeObject;
    SaveFocusedNode:TcxTreeListNode;
    aPrevNode:TcxTreeListNode;
begin
  SaveFocusedNode:= Node;
  aNode := FFindLastElemForNode( Node );
  //*************************************************
  while (aNode<>nil)and(aNode <> SaveFocusedNode) do
  begin
    aPrevNode := aNode.GetPrev;
    TypeObject := GetTypeByNode( aNode );
    
    aNode.Delete;
    FDeleteFromLinkDataset(TypeObject);
    aNode:=aPrevNode;
  end;
  //*************************************************  
  ParentDelNode:=SaveFocusedNode.Parent;
  FDelObjectByNode( SaveFocusedNode );
  if ParentDelNode<>nil then
    FReorderDayNode( ParentDelNode );
end;
//******************************************************************************
function TDetailTours.FFindLastElemForNode(Node:TcxTreeListNode):TcxTreeListNode;
var UntilLevel:Integer;
begin
  result := Node;
  if Node = nil  then Exit;
  UntilLevel:=Node.Level;

  while (Node<>nil) do
  begin
    result := Node;
    Node := Node.GetNext;
    if ( Node<>nil ) and ( Node.Level <= UntilLevel ) then break;
  end;
end;
//******************************************************************************
function TDetailTours.DelFocusedObject( DeleteFromTree:Boolean ):Boolean;
var aPaentNode:TcxTreeListNode;
    TypeObjTab:TTypeObjTabShow;
    isDeletedExcurs:Boolean;
begin
  if self.FTreeElem.Tree.FocusedNode = nil then exit;

  isDeletedExcurs:=false;

  if self.FTreeElem.Tree.FocusedNode.getPrevSibling <> nil then
    aPaentNode := self.FTreeElem.Tree.FocusedNode.getPrevSibling
  else
   if self.FTreeElem.Tree.FocusedNode.getNextSibling <> nil then
     aPaentNode := self.FTreeElem.Tree.FocusedNode.getNextSibling
  else aPaentNode:=self.FTreeElem.Tree.FocusedNode.Parent;

  if (self.GetFocusedTypeObject.ObjType = OptTourExcurs)and(self.FTreeElem.Tree.FocusedNode.HasChildren) then  // Якщо Видаляється екскурсія в якої є проїзд
  begin
    FDeleteAddExcursion(self.FTreeElem.Tree.FocusedNode);
    isDeletedExcurs := true;
  end
  else
  begin
    FDelObjectByNodeWithDetail( self.FTreeElem.Tree.FocusedNode );

    //********************************
    if ( DeleteFromTree ) and ( aPaentNode <> nil ) and ( aPaentNode.Level<>-1 ) then
    begin
      aPaentNode.Focused := True;

      //if ( FTree.DataController.DataSet is TIBCustomDataSet ) then
      self.RefreshDBTree;
    end;
  end;
  //********************************
  if (not isDeletedExcurs ) and ( DeleteFromTree ) and ( self.FTreeElem.Tree.FocusedNode <> nil ) then
  begin
    TypeObjTab := FGetTabObjectByNode( self.FTreeElem.Tree.FocusedNode);
    if TypeObjTab.Tab<>nil then
      FShowTabAndLocateObjId( TypeObjTab, Self.GetFocusedTypeObject.ID );

    self.SynhronizeTabAndTree;
  end
   else
    if not isDeletedExcurs then SynhronizeTabAndTree;
end;
//******************************************************************************
function TDetailTours.FFindNextSiblingUnicalNode(Node:TcxTreeListNode):TcxTreeListNode;
var TypeObject:TTypeObject;
    SaveTypeNode:TTypeObject;
begin
  SaveTypeNode := GetTypeByNode( Node );
  Node:= Node.getNextSibling;

  while (Node<>nil) and (GetTypeByNode(Node).ObjId=SaveTypeNode.ObjId) do
  begin
    if  Node.getNextSibling<>nil then Node:= Node.getNextSibling
    else  Node:= Node.getNext;
  end;
  result:=Node;
end;
//******************************************************************************
procedure TDetailTours.FDeleteByObjectTypeByOption( TypeObj:Variant; OptionValue:Variant );
var TopLevel:TcxTreeListNode;
    NextNode:TcxTreeListNode;
    TypeObject:TTypeObject;
    TypeObjTab:TTypeObjTabShow;
begin
  try
    self.FTreeElem.Tree.BeginUpdate;
    FLockOnViewChange:=true;
    TopLevel := self.FTreeElem.Tree.TopNode;
    TypeObjTab := FFindTabByTypeObj( TypeObj );

    while TopLevel<>nil do
    begin
      TypeObject := GetTypeByNode( TopLevel );

      if (TypeObject.ObjType = TypeObj)and(  TypeObject.Options = OptionValue ) then
      begin
        if ( TypeObj = OptTourStops ) and ( TopLevel.Level > 1 ) then TopLevel := TopLevel.Parent;

        NextNode := TopLevel.Parent;
        FDelObjectByNodeWithDetail( TopLevel );
        TopLevel := NextNode;
      end
      else TopLevel:=TopLevel.getNext;
    end;
 finally
   self.FTreeElem.Tree.EndUpdate;
   FLockOnViewChange:=false;
 end;
end;
//******************************************************************************
procedure TDetailTours.FDeleteByObjectType(TypeObj:Variant);
var TopLevel:TcxTreeListNode;
    NextNode:TcxTreeListNode;
    TypeObject:TTypeObject;
begin
 try
  self.FTreeElem.Tree.BeginUpdate;
  FLockOnViewChange:=true;
  TopLevel := self.FTreeElem.Tree.TopNode;
  while TopLevel<>nil do
  begin
    TypeObject := GetTypeByNode( TopLevel );
    if TypeObject.ObjType = TypeObj then
    begin
      if ( TypeObj = OptTourStops ) and ( TopLevel.Level > 1 ) then TopLevel := TopLevel.Parent;

      NextNode := TopLevel.Parent;
      FDelObjectByNodeWithDetail( TopLevel );
      TopLevel := NextNode;
    end
    else TopLevel:=TopLevel.getNext;
  end;
 finally
   self.FTreeElem.Tree.EndUpdate;
   FLockOnViewChange:=false;
 end;
end;
//******************************************************************************
function TDetailTours.RemoveParentStops( IdParentValue:Variant ):Boolean;
begin
   FDeleteByObjectTypeByOption( OptTourStops, IdParentValue );
   result := true;
end;
//******************************************************************************
procedure TDetailTours.RemoveAllStops;
begin
  FDeleteByObjectType( OptTourStops );
end;
//******************************************************************************
procedure TDetailTours.RemoveAllHotels;
begin
  FDeleteByObjectType( OptTourHotel );
end;
//******************************************************************************
procedure TDetailTours.RemoveAllExcursions;
begin
  FDeleteByObjectType( OptTourExcurs );
end;
//******************************************************************************
procedure TDetailTours.RemoveAllDescriptions;
begin
  FDeleteByObjectType( OptTourDescript );
end;
//******************************************************************************
function TDetailTours.FGetOrderNumberForNode( Node:TcxTreeListNode ): integer;
begin
  if Node <> nil then
  begin
   if Node.Values[ self.FTreeElem.Tree.GetColumnByFieldName('STOPORDER').ItemIndex ]<>null then
     result:= Node.Values[ self.FTreeElem.Tree.GetColumnByFieldName('STOPORDER').ItemIndex ]
   else result:=-1;
  end
  else result:=-1;
end;
//******************************************************************************
procedure TDetailTours.FUpdateOrder( Node:TcxTreeListNode; NewOrder:Integer );
begin
  Node.Focused:=True;
  try
    self.FTreeElem.Tree.BeginUpdate;
    self.FTreeElem.Tree.DataController.DataSet.Edit;
    self.FTreeElem.Tree.DataController.DataSet.FieldByName('STOPORDER').AsInteger:=NewOrder;
    self.FTreeElem.Tree.DataController.DataSet.Post;
  finally
    self.FTreeElem.Tree.EndUpdate;
  end;
end;
//******************************************************************************
procedure TDetailTours.UpdateTimeWebTree(optShowWeb:TOptShowWebTimeOnTree);
var opt:Integer;
begin
  if optShowWeb = OptShowTimeWeb then opt:=0;
  if optShowWeb = OptNotShowTimeWeb then opt:=1;
  if optShowWeb = OptShowApproxTimeWeb then opt:=2;
  //***********************************************
  try
    self.FTreeElem.Tree.BeginUpdate;
    self.FTreeElem.Tree.DataController.DataSet.Edit;
    self.FTreeElem.Tree.DataController.DataSet.FieldByName('WEBSHOWTIME').AsInteger:=opt;
    self.FTreeElem.Tree.DataController.DataSet.Post;
  finally
    self.FTreeElem.Tree.EndUpdate;
  end;
end;
//******************************************************************************
procedure TDetailTours.UpdateShowWebTree(optShowWeb:TOptShowWebOnTree);
var opt:Integer;
begin
  if optShowWeb = OptShowOnWeb then opt:=0;
  if optShowWeb = OptNotShowOnWeb then opt:=1;
  //***********************************************
  try
    self.FTreeElem.Tree.BeginUpdate;
    self.FTreeElem.Tree.DataController.DataSet.Edit;
    self.FTreeElem.Tree.DataController.DataSet.FieldByName('WEBSHOW').AsInteger:=opt;
    self.FTreeElem.Tree.DataController.DataSet.Post;
  finally
    self.FTreeElem.Tree.EndUpdate;
  end;
end;
//******************************************************************************
Function TDetailTours.FMoveNode(Node:TcxTreeListNode;Up:boolean):boolean;
var PrevOrder:Integer;
    FirstNode: TcxTreeListNode;
    SecNode:TcxTreeListNode;
    OrderSec:Integer;
begin
 result:=false;
 if Up then
 begin
   FirstNode:= Node.getPrevSibling;
   SecNode:= Node;
   OrderSec:= FGetOrderNumberForNode( FirstNode );

   FUpdateOrder( FirstNode, FGetOrderNumberForNode( SecNode ) );
   FUpdateOrder( SecNode, OrderSec );
   result:=True;
 end
  else
  begin
   FirstNode:= Node;
   SecNode:= Node.getNextSibling;
   OrderSec:= FGetOrderNumberForNode( SecNode );

   FUpdateOrder( SecNode, FGetOrderNumberForNode( FirstNode ) );
   FUpdateOrder( FirstNode,OrderSec );

   result:=True;
  end;
  Node.Focused:=True;
end;
//******************************************************************************
Function TDetailTours.MoveNodeUp(Node:TcxTreeListNode):boolean;
begin
  result:=FMoveNode(Node, True);
end;
//******************************************************************************
Function TDetailTours.MoveNodeDown(Node:TcxTreeListNode):boolean;
begin
  result:=FMoveNode(Node, false);
end;
//******************************************************************************
procedure TDetailTours.OpenDBTree(ExpandTree:Boolean=true);
begin
 if not self.FTreeElem.Tree.DataController.DataSet.Active then
  self.FTreeElem.Tree.DataController.DataSet.Open;
 //*******************************
 //if self.FTree.TopNode<> nil then
 //  self.FTree.TopNode.Focused:=True;
 //*******************************
 if ExpandTree then self.FTreeElem.Tree.FullExpand;
end;
//******************************************************************************
Function TDetailTours.FGetDescriptionForNode(Node:TcxTreeListNode):TDescriptionTree;
begin
  if Node.Values[ self.FTreeElem.Tree.GetColumnByFieldName('CalcDescription').ItemIndex ]<>null then
    result.Description:= Node.Values[ self.FTreeElem.Tree.GetColumnByFieldName('CalcDescription').ItemIndex ]
  else
    result.Description:='';
  //***************************
  if Node.Texts[ self.FTreeElem.Tree.GetColumnByFieldName('TYPEACTION').ItemIndex ]<>null then
    result.ActionStr:=Node.Texts[ self.FTreeElem.Tree.GetColumnByFieldName('TYPEACTION').ItemIndex ]
  else
    result.ActionStr:='';
  //***************************
   if Node.Values[ self.FTreeElem.Tree.GetColumnByFieldName(FFieldActionTime).ItemIndex ]<>null then
    result.TimeStr := FormatDateTime( 'hh:mm', Frac( Node.Values[ self.FTreeElem.Tree.GetColumnByFieldName(FFieldActionTime).ItemIndex ]) )
  else
    result.TimeStr:='';
end;
//******************************************************************************
Function TDetailTours.FGetRepresentWebTimeByObjAndAction(TypeTime,TypeObj,TypeAction,CurrTime:variant;RepresentWebTime:array of TRepresentObjWebTime ):TRepresentObjWebTime;
var i:Integer;
begin
  for i:=0 to Length(RepresentWebTime)-1 do
  begin
    //**********************************
    if ((CurrTime <> null)and( (RepresentWebTime[i].TimeFrom<=CurrTime )and(RepresentWebTime[i].TimeTill >= CurrTime )) )and
       ( (RepresentWebTime[i].TYPEOBJ = TypeObj)and(RepresentWebTime[i].ACTIONTYPE = TypeAction)and(RepresentWebTime[i].TIMEOBJ = TypeTime )  ) then
    begin
      result:= RepresentWebTime[i];
      exit;
    end;
    //**********************************
    if ( CurrTime = null )and
       ( (RepresentWebTime[i].TYPEOBJ = TypeObj)and(RepresentWebTime[i].ACTIONTYPE = TypeAction)and(RepresentWebTime[i].TIMEOBJ = TypeTime )  ) then
    begin
      result:= RepresentWebTime[i];
      exit;
    end;
    //**********************************
  end;
end;
//******************************************************************************
Function TDetailTours.FGetRepresentWebByObjAndAction(TypeObj,TypeAction:variant;RepresentWeb:array of TRepresentObjWeb ):TRepresentObjWeb;
var i:Integer;
begin
  for i:=0 to Length(RepresentWeb)-1 do
  begin
    if (RepresentWeb[i].TYPEOBJ = TypeObj)and(RepresentWeb[i].ACTIONTYPE = TypeAction) then
    begin
      result.TYPEOBJ := RepresentWeb[i].TYPEOBJ;
      result.ACTIONTYPE := RepresentWeb[i].ACTIONTYPE;
      Result.TempRepresentation:=RepresentWeb[i].TempRepresentation;
      
      exit;
    end;
  end;
end;
//******************************************************************************
procedure TDetailTours.FPreapareToReadyWebTimeLine(var TemplateWeb:TRepresentObjWeb; var TemplateWebTime:TRepresentObjWebTime );
var CurrTime:WideString;
begin
 //if TemplateWebTime.TIMEOBJ = -1 then begin TemplateWeb.TempRepresentation:=''; Exit;end;
 if TemplateWebTime.TIMEOBJ <> 1 then
 begin
   CurrTime:=TemplateWebTime.TempRepresentation;

   ReplaseOn( TemplateWeb.TempRepresentation ,'#TIME', '#LABELTIME' );
   ReplaseOn( TemplateWeb.TempRepresentation ,'#LABELTIME',TemplateWebTime.TempRepresentation );
 end
 else
 begin
   ReplaseOn( TemplateWeb.TempRepresentation ,'#TIME','');    // 1- Time not For Show
 end;
end;
//******************************************************************************
Function TDetailTours.FPreapareToReadyWebLine(TemplateWeb:TRepresentObjWeb;Descript:TDescriptionTree ):Widestring;
begin
 result:= TemplateWeb.TempRepresentation;
 ReplaseOn(result,'#NAME', Descript.Description);
 ReplaseOn(result,'#TYPE', Descript.ActionStr);
 ReplaseOn(result,'#TIME', Descript.TimeStr);
end;
//******************************************************************************
Function TDetailTours.FormingTour(RepresentWeb:array of TRepresentObjWeb;RepresentObjWebTime: array of TRepresentObjWebTime):TStringList;
var Node:TcxTreeListNode;
    CurrDesript:TDescriptionTree;
    CurrTypeObj:TTypeObject;
    CurrAction :Variant;
    CurrActionStr:WideString;
    SubStr:WideString;
    SubStrTime:WideString;
    SpaceLevel:WideString;
    MarkFirstDayAfter:Boolean;
    MarkStartText:Boolean;
    currTemplateWeb:TRepresentObjWeb;
    currTemplateWebTime:TRepresentObjWebTime;
    currWebLine:Widestring;
    CurrTime:Double;
//*********************************************************
function GetSpaceFromLevel(aLevel:Integer):WideString;
var i:Integer;
begin
  result:='';
  for i:=0 to aLevel-1 do
   result:= result+'&#160&#160&#160';
end;
//*********************************************************    
begin
  result := TStringList.Create;
  MarkFirstDayAfter:=false;
  Node := self.FTreeElem.Tree.TopNode;
  result.Add('<DIV class="Tour">');
  while Node <> nil do
  begin
    SubStr:='';
    SubStrTime:='';
    SpaceLevel := '';

    if Node.Level =0 then
    begin
     if MarkFirstDayAfter then result.Add( ' </DIV>' );
     result.Add( ' <DIV class="Day_'+IntToStr(FGetOrderNumberForNode(Node))+'">' );

     MarkFirstDayAfter:=True;
    end;

    CurrDesript:= FGetDescriptionForNode(Node);
    CurrTypeObj := GetTypeByNode(Node);
    if CurrTypeObj.ObjType = null then
      CurrAction:=null
    else CurrAction := CurrTypeObj.ActionType;

    if CurrTypeObj.ShowOnWeb <> 1 then
    begin
      CurrTime    := GetTimeActionByNode(Node);

      CurrActionStr := CurrDesript.ActionStr;
      currTemplateWeb :=FGetRepresentWebByObjAndAction( CurrTypeObj.ObjType, CurrAction, RepresentWeb );

      //currTemplateWebTime.TIMEOBJ := -1;
      currTemplateWebTime := FGetRepresentWebTimeByObjAndAction( CurrTypeObj.ShowTime, CurrTypeObj.ObjType, CurrAction, CurrTime, RepresentObjWebTime );
      FPreapareToReadyWebTimeLine( currTemplateWeb, currTemplateWebTime );

      if CurrTypeObj.ShowTime = 1 then ReplaseON( currTemplateWeb.TempRepresentation, '#TIME', '');
      currWebLine := FPreapareToReadyWebLine( currTemplateWeb, CurrDesript );

      if CurrTypeObj.ObjType <> null then
      begin
        if MarkStartText then result.Add('   <div class="TourDescript">');
        result.Add('<div>'+ currWebLine+'</div>' );
        MarkStartText:=False;
      end
       else
        begin
         result.Add('   <div class="h1">'+currWebLine+'</div>' );
         MarkStartText:=True;
        end;

      if (Node.GetNext=nil)or(Node.GetNext.Level<Node.Level ) then result.Add( '   </div> ' );

    end;

    Node:=Node.GetNext;
    if Node = nil then
      result.Add( ' </DIV>' );
  end;
  result.Add( '</DIV>' );
end;
//******************************************************************************
function TDetailTours.GetTree: TcxDBTreeList;
begin
  result := self.FTreeElem.Tree;
end;

end.



 {if (not FLockLookUp)and(TypeObjTab.Dataset.Active) then
 begin
   if (TypeObjTab.FieldStartTime<>'')and(DataSet.FieldByName('TYPEACTION').AsInteger = 0) then
     DataSet.FieldByName('CalcActionTime').Value := TypeObjTab.Dataset.Lookup( TypeObjTab.FieldIdName, DataSet.FieldByName('OBJID').Value, TypeObjTab.FieldStartTime );

   if (TypeObjTab.FieldEndTime<>'')and(DataSet.FieldByName('TYPEACTION').AsInteger = 1) then
     DataSet.FieldByName('CalcActionTime').Value := TypeObjTab.Dataset.Lookup( TypeObjTab.FieldIdName, DataSet.FieldByName('OBJID').Value, TypeObjTab.FieldEndTime );

   if DataSet.FieldByName('CalcActionTime').value<>null then
    DataSet.FieldByName('CalcActionTime').AsFloat := frac( DataSet.FieldByName('CalcActionTime').AsFloat);
 end; }
