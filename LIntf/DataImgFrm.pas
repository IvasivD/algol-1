unit DataImgFrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, DB;

type
  TDatabaseImageForm = class(TForm)
    Panel1: TPanel;
    OkBtn: TBitBtn;
    DataSetComboBox: TComboBox;
    Label1: TLabel;
    FieldListBox: TListBox;
    Label2: TLabel;
    ExportBtn: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure DataSetComboBoxClick(Sender: TObject);
    procedure ExportBtnClick(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
  private
    FDataSet: TDataSet;
  public
    { Public declarations }
  end;

var
  DatabaseImageForm: TDatabaseImageForm;

procedure ShowDatabaseImageForm(DataMod: TDataModule);


implementation

uses IniFiles, DBTables, TourConsts, TempCls{, TmplLIf};

{$R *.DFM}

procedure GetDataSetList(DataMod: TDataModule; Strings: TStrings);
var I: Integer;
begin
  Strings.Clear;
  Strings.Add(SDataModSelectNone);
  with DataMod do
  begin
    Exit;
    ShowMessage(DataMod.ClassName);
    for I := 0 to ComponentCount - 1 do
      if Components[I] is TDBDataSet then
        Strings.AddObject((Components[I] as TDBDataSet).Name, Components[I]);
  end;
end;

procedure ShowDatabaseImageForm(DataMod: TDataModule);
begin
  with TDatabaseImageForm.Create(Application) do
    try
      GetDataSetList(DataMod, DataSetComboBox.Items);
      ShowModal;
    finally
      Free;
    end;
end;

procedure TDatabaseImageForm.FormActivate(Sender: TObject);
begin
  with DataSetComboBox do
    if Items.Count > 0 then ItemIndex := 0 else ItemIndex := -1;
end;

procedure TDatabaseImageForm.DataSetComboBoxClick(Sender: TObject);
var I: Integer;
begin
  with DataSetComboBox do FDataSet := TDataSet(Items.Objects[ItemIndex]);
  ExportBtn.Enabled := Assigned(FDataSet);
  with FieldListBox do
  begin
    Clear;
    if Assigned(FDataSet) then
      with FDataSet do
        for I := 0 to FieldCount - 1 do
          Items.AddObject(Fields[I].DisplayName, Fields[I]);
  end;
end;

procedure TDatabaseImageForm.ExportBtnClick(Sender: TObject);
const
  sModule = 'Module';
  sTitle = 'Title';
  sDisplay = 'Display';
  sMask = 'Mask';
var
  Sect: String;
  I: Integer;
begin
  Sect := GetTemplateDatabaseFileName(Application.ExeName); // file name
  Screen.Cursor := crHourGlass;
  with TIniFile.Create(Sect) do
    try
      Sect := FDataSet.Name;  // section name
      EraseSection(Sect);
      EraseSection(Sect + sDisplay);
      EraseSection(Sect + sMask);
      WriteString(sModule, sTitle, Application.Title);
      for I := 0 to FDataSet.FieldCount - 1 do
        with FDataSet.Fields[I] do
        begin
          WriteString(Sect, FieldName,
            Format('%d;%d;%d', [Integer(DataType), Index, Size]));
          WriteString(Sect + sDisplay, FieldName, DisplayName);
          WriteString(Sect + sMask, FieldName, EditMask);
        end;
    finally
      Free;
      Screen.Cursor := crDefault;
    end;
end;

procedure TDatabaseImageForm.OkBtnClick(Sender: TObject);
begin
  Close;
end;

end.
