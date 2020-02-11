unit PrntOrdDlg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZDlg, StdCtrls, AzComboBox, Buttons, ExtCtrls;

type
  TPrintSortOrderDlg = class(TZDialog)
    WorkPanel: TPanel;
    SortOrderLabel: TLabel;
    SortOrderComboBox: TAzComboBox;
    SortGroupBox: TGroupBox;
    CurRadioButton: TRadioButton;
    LatRadioButton: TRadioButton;
  private                               
    procedure AssignSortOrderList(AList: TStrings);
    function GetSortOrderList: TStrings;
    function GetSortOrderIndex: Integer;
    procedure SetSortOrderIndex(const Value: Integer);
    function GetListVarianrt: Integer;
  protected
    property SortOrderList: TStrings read GetSortOrderList;
    property SortOrderIndex: Integer read GetSortOrderIndex write SetSortOrderIndex;
    property ListVarianrt: Integer read GetListVarianrt;
  end;

var
  PrintSortOrderDlg: TPrintSortOrderDlg;

function ExecutePrintSortOrderDlg(ASortList: TStrings; 
  var ASortOrder, AVariant: Integer): Boolean;


implementation

{$R *.dfm}

var
  DefaultSortOrderIndex: Integer = 0;

function ExecutePrintSortOrderDlg(ASortList: TStrings; 
  var ASortOrder, AVariant: Integer): Boolean;
begin
  with TPrintSortOrderDlg.Create(Application) do
    try
      AssignSortOrderList(ASortList);
      Result := ShowModal = mrOk;
      if Result then
      begin
        ASortOrder := SortOrderIndex;
        DefaultSortOrderIndex := ASortOrder;
        AVariant := ListVarianrt;
      end;
    finally
      Free;
    end;
end;

{ TPrintSortOrderDlg }

procedure TPrintSortOrderDlg.AssignSortOrderList(AList: TStrings);
begin
  with SortOrderComboBox, Items do
  begin
    Assign(AList);
    if Count > 0 then ItemIndex := DefaultSortOrderIndex;
  end;
end;

function TPrintSortOrderDlg.GetListVarianrt: Integer;
begin
  if LatRadioButton.Checked then Result := 1 else Result := 0;  
end;

function TPrintSortOrderDlg.GetSortOrderIndex: Integer;
begin
  Result := SortOrderComboBox.ItemIndex;
  if Result = -1 then Result := DefaultSortOrderIndex;
end;

function TPrintSortOrderDlg.GetSortOrderList: TStrings;
begin
  Result := SortOrderComboBox.Items;
end;

procedure TPrintSortOrderDlg.SetSortOrderIndex(const Value: Integer);
begin
  with SortOrderComboBox do
    try
      ItemIndex := Value;
    except
      ItemIndex := DefaultSortOrderIndex;
    end;
end;

end.
