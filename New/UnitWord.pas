unit UnitWord;

interface
uses
  WordXP, Variants, SysUtils, OptSet;
const 
  sAlgolStamp = 'Contracts\Печатка Алголя.png';
  sOlegSign = 'Пiдпис Олега.png';

  sForTuorOp = 'Від Туроператора__________________	          ';
  sForTourAg = '	          Від Турагента__________________';   

  sManagerSignaturePath = 'Employees\%d\Signature\';
  
function SingContract(aWordDocum: TWordDocument; aTemplDir: string; AddFooterSign: Boolean;
  aManagerSign: string = sOlegSign): Boolean;

implementation

uses
  TourCmnlIf;

procedure AddFooterSignature(aWordDocum: TWordDocument);
var
  sFooter: string;
  FooterRange: Range;  
begin
  FooterRange := aWordDocum.Sections.Item(1).Footers.Item(wdHeaderFooterPrimary).Range;
  sFooter := FooterRange.Text;
  FooterRange.InsertBefore(sForTuorOp);
  FooterRange.InsertAfter(sForTourAg);
  FooterRange := aWordDocum.Sections.Item(1).Footers.Item(wdHeaderFooterEvenPages).Range;
  sFooter := FooterRange.Text;
  FooterRange.InsertBefore(sForTuorOp);
  FooterRange.InsertAfter(sForTourAg);
end;

function SingContract(aWordDocum: TWordDocument; aTemplDir: string; AddFooterSign: Boolean;
  aManagerSign: string = sOlegSign): Boolean;
var
  nLeft, nTop, nWigth, nHigh, nLeftForSing: OleVariant;
  SaveWithDoc, nRange, NumPage: OleVariant;
  PageCount, I: Integer;
begin
  Result := True;
  try
    if not FileExists(IncludeTrailingBackslash(OptionSet.TemplateFolder) + sAlgolStamp) then
    begin 
      ErrorDlg('Немає файлу електронної печатки!');
      Exit;
    end;
    if not FileExists(aTemplDir + aManagerSign) then
    begin 
      ErrorDlg('Немає файлу електронного підпису менеджера!');
      Exit;
    end;
    PageCount := aWordDocum.ComputeStatistics(wdStatisticPages); 
    if AddFooterSign then AddFooterSignature(aWordDocum);

    nLeft := 90;
    nLeftForSing := 140;    
    nTop := 740;
    nWigth := 70;
    nHigh := 70;
    for I := 0 to PageCount do
    begin
      NumPage := I;
      nRange := aWordDocum.GoTo_(EmptyParam, EmptyParam, NumPage);
      SaveWithDoc := True;                                        
      aWordDocum.Shapes.AddPicture(IncludeTrailingBackslash(OptionSet.TemplateFolder) + sAlgolStamp, 
        EmptyParam, SaveWithDoc, nLeft, nTop, nWigth, nHigh, nRange);      
      aWordDocum.Shapes.AddPicture(aTemplDir + aManagerSign, 
        EmptyParam, SaveWithDoc, nLeftForSing, nTop, nWigth, nHigh, nRange);      
    end;
  except    
    Result := false;
  end
end;

end.
 