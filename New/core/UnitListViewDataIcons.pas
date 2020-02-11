unit UnitListViewDataIcons;

interface
uses ComCtrls,Controls,DB,Graphics,SysUtils, UnitProc,core;
type
  TParamListShowDataIcon = record
    FieldName : String; //Name
    FieldCommnets:string; //'COMMENTS'
    FieldLargeIcon:string; //'LARGEICON'
    FieldSmallIcon:string; // 'SMALLICON'
    FieldCurrencyShort:string;// 'CURRENCYSHORT'
    FieldCost:string;  // COST
    FieldHaveCost:string;//HAVECOST
    FieldLinkId:string;// LINKID
  end;
 TListViewDataIcons = class
    private
      FparamField : TParamListShowDataIcon;
      FListView : TListView;
      FLgImgIndex:TImageList;
      FSmImgIndex:TImageList;
      procedure FPrepareListViewServices;
      procedure FDrawDataItems(  Elem:TDBShemaView; ItslocalLang:Boolean; ItemNo: Integer );
      procedure FDrawServiceItemBySet( aListView:TListView; LgImgIndex,SmImgIndex:TImageList;
                ItemNo: integer; Large, Small: TField; Comments: TMemoField;
                Title, SubTitle: TField; Cost: TField; Have, Obj: TField);

    public
      constructor Create( paramField: TParamListShowDataIcon; ListView: TListView );
      procedure DrawServiceListBySet( Elem:TDBShemaView; ItslocalLang:Boolean );
      procedure SetListViewStyle( ATag: Integer );
      procedure ClearData;
 end;

implementation

{ TListViewDataIcons }
procedure TListViewDataIcons.FPrepareListViewServices;
begin
  FLgImgIndex := TImageList.Create( FListView.Owner );
  FSmImgIndex:= TImageList.Create( FListView.Owner );
  FListView.LargeImages := FLgImgIndex;
  FListView.SmallImages := FSmImgIndex;
end;

procedure AddImageFromField(ImgList: TImageList; ImgField: TBlobField);
var Bitmap, Image: TBitmap;
begin
  Bitmap := TBitmap.Create;
  Image := TBitmap.Create;
  try
    Bitmap.Width := ImgList.Width;
    Bitmap.Height := ImgList.Height;
    if not ImgField.IsNull then //Bitmap.Assign(ImgField);
    begin
      Image.Assign(ImgField);
      Bitmap.Canvas.StretchDraw(Bitmap.Canvas.ClipRect, Image);
    end;
    ImgList.Add(Bitmap, nil);
  finally
    Image.Free;
    Bitmap.Free;
  end;
end;

function GetHaveCostInfo(HaveCost: Integer): string;
const
  nHotelServiceHaveCostInfo: array[0..4] of String = (
    '?', 'так', 'ні', 'част.', '-' );
begin
  Result := (nHotelServiceHaveCostInfo[HaveCost]);
end;

procedure TListViewDataIcons.ClearData;
begin
  FListView.Clear;
end;

procedure TListViewDataIcons.FDrawServiceItemBySet(
  aListView:TListView; LgImgIndex,SmImgIndex:TImageList;
  ItemNo: integer;
  Large, Small: TField; Comments: TMemoField;
  Title, SubTitle: TField; Cost: TField; Have, Obj: TField);
begin
  with aListView do
  begin
    LargeImages := LgImgIndex;
    SmallImages := SmImgIndex;

    AddImageFromField( LgImgIndex, TBlobField(Large) );
    AddImageFromField( SmImgIndex, TBlobField(Small) );

    with Items.Add do
    begin
      Caption := Title.asString ;
      {$WARN UNSAFE_TYPE OFF}
      Data := Pointer(Obj.AsInteger);
      {$WARN UNSAFE_TYPE ON}
      SubItems.Add( TFloatField(Cost).DisplayText);
      SubItems.Add(SubTitle.asSTring );
      SubItems.Add(GetHaveCostInfo(Have.Value));
      SubItems.Add( StringReplace( StringReplace( Comments.AsString, #13, #32, [rfReplaceAll]), #10, '', [rfReplaceAll]) );
      ImageIndex := ItemNo;
    end;
  end;
end;

procedure TListViewDataIcons.FDrawDataItems(  Elem:TDBShemaView; ItslocalLang:Boolean; ItemNo: Integer );
var NameField: TStringField;
    CommentsField: TMemoField;
procedure GetSrvLinkData;
begin
  NameField := Elem.DB.FieldByName( FparamField.FieldName ) as TStringField;
  CommentsField := Elem.DB.FieldByName(FparamField.FieldCommnets) as TMemoField;
end;

begin
   GetSrvLinkData;

   FDrawServiceItemBySet(  FListView, TImageList( FListView.LargeImages) , TImageList( FListView.SmallImages), ItemNo,
                           Elem.DB.FieldByName( FparamField.FieldLargeIcon ), Elem.DB.FieldByName( FparamField.FieldSmallIcon ),
                           CommentsField, NameField,
                           Elem.DB.FieldByName( FparamField.FieldCurrencyShort ), Elem.DB.FieldByName( FparamField.FieldCost ),
                           Elem.DB.FieldByName( FparamField.FieldHaveCost ), Elem.DB.FieldByName( FparamField.FieldLinkId ) );
end;

procedure TListViewDataIcons.DrawServiceListBySet( Elem:TDBShemaView; ItslocalLang:Boolean );
var I: Integer;
begin
  FListView.Clear;
  FListView.SmallImages.Clear;
  FListView.LargeImages.Clear;
  I := 0;

  try
    Elem.DB.DisableControls;
    Elem.SaveBookmark;
    Elem.DB.First;

    while not Elem.DB.Eof do
    begin
      FDrawDataItems( Elem, ItslocalLang, I );
      Inc(I);
      Elem.DB.Next;
    end;
  finally
    Elem.GotoBookmark;
    Elem.DB.EnableControls;
  end;

end;

constructor TListViewDataIcons.Create(paramField: TParamListShowDataIcon; ListView: TListView );
begin
  FparamField := paramField;
  FListView :=ListView;

  FPrepareListViewServices;
end;

procedure TListViewDataIcons.SetListViewStyle( ATag: Integer );
begin
  with FListView do
    case ATag of
      1: ViewStyle := vsIcon;
      2: ViewStyle := vsSmallIcon;
      3: ViewStyle := vsList;
      4: ViewStyle := vsReport;
    end;
end;

end.
 