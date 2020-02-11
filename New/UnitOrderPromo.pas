unit UnitOrderPromo;

interface

uses core, UnitProc, DB, Controls, Classes;

type
  TTourPromoData = record
    aGroupId: Integer;
    aCompanyId: Variant;
    aPromoFromDate: Variant;
    aPromoName: string;
    aTemplateId: Variant;
    aPromoProgramId: Variant;
    aImageList: TImageList;
    aPromoImgId: Integer;
    aPromoStopImgId: Integer; 
    aMaxPersonOnPromo: Integer; 
    aPersonCount: Integer; 
    aMaxPersForPromo: Integer; 
  end;

function GetPermCreateOrderAndPromoTemplate(aConnectDBParam: TConnectDBParam;
  var aTourPromoData: TTourPromoData): Boolean;
function GetActivePromoData(aConnectDBParam: TConnectDBParam; aTourGroupId: Integer;
  var aTemplateId, aPromoProgramId, aPromoFromDate, aPromoName: Variant): Boolean;
  
implementation

uses
  SysUtils, ZDlg, StdCtrls, Variants, cxImage, Graphics, ExtCtrls, cxEdit, 
  TourCmnlIf, Math, TourConsts;
const
  sSelActiveStopedPromoSQL =
    'select GP.TourTemplateId, GP.TourGroupPromoId, Pp.ProgramName ' +
    '  from TourGroupPromo GP ' +
    '  left join PromoPrograms Pp on Pp.PromoProgramId = GP.PromoProgramId ' +
    ' where GP.TourGroupId = %d and GP.PromoFromDate <= ''NOW'' and ' +
    ' not (GP.PromoTillDate is null or GP.PromoTillDate >= ''NOW'') and ' +
    ' (GP.PromoTillDate is null or GP.PromoTillDate + GP.ExtraTime >= ''NOW'') ';
  sSelActivePromoSQL =
    'select GP.TourTemplateId, GP.TourGroupPromoId, Pp.ProgramName, GP.PromoFromDate ' +
    '  from TourGroupPromo GP ' +
    '  left join PromoPrograms Pp on Pp.PromoProgramId = GP.PromoProgramId ' +
    ' where GP.TourGroupId = %d and GP.PromoFromDate <= ''NOW'' and ' +
    '      (GP.PromoTillDate is null or GP.PromoTillDate >= ''NOW'') ';
  sSelBookingPersonForPromoSQL =
    'select (select count(P.PersonId) from Persons P ' +
    '           left join Orders O on O.OrderId = P.OrderId ' +
    '         where P.Id_TourGroupPromo = %s and ' +
    '               O.State <> 5 and (P.Refused is null or (P.Refused = ''F'') ) ' +
    '       ) MaxPerson, ' +
    '       ( select count(P.PersonId) from Persons P ' +
    '          left join Orders O on O.OrderId = P.OrderId ' +
    '          left join Clients C on C.ClientId = O.ClientId ' +
    '         where Id_TourGroupPromo = %s and C.CompanyId = %s and ' +
    '               O.State <> 5 and (P.Refused is null or (P.Refused = ''F'') ) ' +
    '       ) MaxPersonForAgent ' +
    'from rdb$Database';
  sSelMaxPersonForPromo =
    'select MaxPers, MaxPersAgent from TourGroupPromo where TourGroupPromoId = %s';

  sWarningLessMaxPersonBookingForAgent =
    'Увага!'#13'Перевищено максимальну кількість бронювання туристів %d для агента по даній акції.'#13 +
    'Буде зарезервовано по акції - %s.'#13 +
    'По стандарному шаблону    - %s.'#13 + 
    'Продовжити?';
    
  sWarningLessMaxPersonBookingForPromo =
    'Увага!'#13'Перевищено максимальну кількість бронювання туристів %d по даній акції.'#13 +
    'Буде зарезервовано по акції - %s.'#13 +
    'По стандарному шаблону    - %s.'#13 + 
    'Продовжити?';

var FConnectDBParam: TConnectDBParam;

procedure CreateImagePromo(AOwner: TWinControl; aLeft, aTop, aImgId: Integer; 
  aTourPromoData: TTourPromoData);
var aImage: TImage;
begin
  aImage := TImage.Create(AOwner);
  aImage.Parent := AOwner;
  aImage.Left := aLeft;
  aImage.Top := aTop;
  aImage.Height := 16;
  aImage.Width := 16;
  aImage.Transparent := True;
  aTourPromoData.aImageList.Draw(aImage.Canvas, 0, 0, aImgId);
end;  

function GetCountPromptTourist(aCount: Integer): string;
begin
  result := CountPromptCaption(aCount, SVDlgsTouristOne, SVDlgsTouristTwo, SVDlgsTouristMore);
end;  

function CheckMaxPersonOnPromo(var aTourPromoData: TTourPromoData): Boolean;
var
  aBookingPersonQry, aMaxPersonForPromoQry: TDataSet;
  aMaxPersBooking, aMaxPersBookingForAgent: Integer;
  aMaxPers, aMaxPersForAgent: Integer;
begin
  Result := True;
  aBookingPersonQry := DBCreate(Format(sSelBookingPersonForPromoSQL, [aTourPromoData.aPromoProgramId, aTourPromoData.aPromoProgramId, aTourPromoData.aCompanyId]), 
    nil, FConnectDBParam );
  aMaxPersonForPromoQry := DBCreate(Format(sSelMaxPersonForPromo, [aTourPromoData.aPromoProgramId]), nil, FConnectDBParam );
  try
    aMaxPers := aMaxPersonForPromoQry.Fields[0].AsInteger;
    aMaxPersForAgent := aMaxPersonForPromoQry.Fields[1].AsInteger;
    aMaxPersBooking := max( aMaxPers - aBookingPersonQry.Fields[0].AsInteger, 0 ) - aTourPromoData.aPersonCount;
    aMaxPersBookingForAgent := max( aMaxPersForAgent - aBookingPersonQry.Fields[1].AsInteger, 0 ) - aTourPromoData.aPersonCount;
    if (aMaxPersForAgent > 0) and (aMaxPersBookingForAgent < 0) then
    begin
      Result := WarningFmtDlgYN(sWarningLessMaxPersonBookingForAgent, [aMaxPersForAgent, 
                GetCountPromptTourist( max(aTourPromoData.aPersonCount - abs(aMaxPersBookingForAgent), 0) ),  
                GetCountPromptTourist( abs(aMaxPersBookingForAgent) ) ]);
      if Result then aTourPromoData.aMaxPersForPromo := max(aTourPromoData.aPersonCount - abs(aMaxPersBookingForAgent), 0);
    end;
    
    if Result and (aMaxPers > 0) and (aMaxPersBooking < 0) and (aTourPromoData.aMaxPersForPromo > 0) then
    begin
      Result := WarningFmtDlgYN(sWarningLessMaxPersonBookingForPromo, [aMaxPers, 
                GetCountPromptTourist( max(aTourPromoData.aPersonCount - abs(aMaxPersBooking), 0) ), 
                GetCountPromptTourist( abs(aMaxPersBooking) )]);
      if Result then aTourPromoData.aMaxPersForPromo := max(aTourPromoData.aPersonCount - abs(aMaxPersBooking), 0);
    end;
    
  finally
    DestroyDB(aBookingPersonQry);
    DestroyDB(aMaxPersonForPromoQry);
  end;
end;

function PermCreateOrder(
  aStopedPromoName: string; aActStopedPromoId, aActStopedTemplateId: Variant;
  var aTourPromoData: TTourPromoData): Boolean;
var SelTemplateForm: TZDialog;
    aLabel: TLabel;
    aChBox1, aChBox2: TRadioButton;
//    a: TBitmap;
  function GetTemplateName: string;
  begin
    if aTourPromoData.aPromoProgramId <> null then
    begin
      Result := Format('по діючій акції "%s".', [aTourPromoData.aPromoName]);
      CreateImagePromo(SelTemplateForm, aLabel.Left, aChBox2.Top, aTourPromoData.aPromoImgId, aTourPromoData);
    end
    else
      Result := 'стандартний шаблон.';
  end;
begin
  SelTemplateForm := TZDialog.Create(nil);
  with SelTemplateForm do
  try
    Caption := 'Вибір шаблону';
    Height := 145;
    Width  := 316;    

    aLabel := TLabel.Create(SelTemplateForm);
    aLabel.Parent := SelTemplateForm;
    aLabel.Caption := 'Виберіть шаблон для додавання туристів в замовлення:';
    aLabel.Left := 8;
    aLabel.Top  := 16;

    aChBox1 := TRadioButton.Create(SelTemplateForm);
    aChBox1.Parent := SelTemplateForm;
    aChBox1.Left := aLabel.Left + 24;
    aChBox1.Top := aLabel.Top + aLabel.Height + 8;
    aChBox1.Caption := Format('по зупиненій акції "%s"', [aStopedPromoName]);
    aChBox1.Width := Width - 16;
    aChBox1.Checked := True;
    
    aChBox2 := TRadioButton.Create(SelTemplateForm);
    aChBox2.Parent := SelTemplateForm;
    aChBox2.Left := aLabel.Left + 24;
    aChBox2.Top := aChBox1.Top + aChBox1.Height + 8;
    aChBox2.Caption := GetTemplateName; 
    aChBox2.Width := Width - 16;    
    
    CreateImagePromo(SelTemplateForm, aLabel.Left, aChBox1.Top, aTourPromoData.aPromoStopImgId, aTourPromoData);
        
    CtrlPanel.BevelOuter := bvRaised;
    
    Result := ShowModal = mrOk;
    if Result and aChBox1.Checked then 
    begin 
        aTourPromoData.aPromoProgramId := aActStopedPromoId;
        aTourPromoData.aTemplateId := aActStopedTemplateId;
    end;
  finally
    Free;
  end;
end;
    
function GetPermCreateOrderAndPromoTemplate(aConnectDBParam: TConnectDBParam;
  var aTourPromoData: TTourPromoData): Boolean;
var
  aQuery: TDataSet;
  aStopedPromoName: string;
  aActStopedPromoId, aActStopedTemplateId: Variant;
begin
  FConnectDBParam := aConnectDBParam;
  aQuery := DBCreate(Format(sSelActiveStopedPromoSQL, [aTourPromoData.aGroupId]), nil, FConnectDBParam );
  try
    aQuery.Last;
    aActStopedTemplateId:= aQuery.Fields[0].Value;
    aActStopedPromoId:= aQuery.Fields[1].Value;
    aStopedPromoName := aQuery.Fields[2].AsString;
  finally
    DestroyDB(aQuery);
  end;
  aTourPromoData.aMaxPersonOnPromo := 0;
  Result := ( (aStopedPromoName = '') or PermCreateOrder(aStopedPromoName, aActStopedPromoId, aActStopedTemplateId, aTourPromoData) )
    and ( (aTourPromoData.aPromoProgramId = null) or CheckMaxPersonOnPromo(aTourPromoData) )
end;

function GetActivePromoData(aConnectDBParam: TConnectDBParam; aTourGroupId: Integer;
  var aTemplateId, aPromoProgramId, aPromoFromDate, aPromoName: Variant): Boolean;
var
  aQuery: TDataSet;
begin
  aQuery := DBCreate(Format(sSelActivePromoSQL, [aTourGroupId]), nil, aConnectDBParam );
  try
    aTemplateId := aQuery.Fields[0].Value;
    aPromoProgramId := aQuery.Fields[1].Value;
    aPromoName := aQuery.Fields[2].Value;
    aPromoFromDate := aQuery.Fields[3].Value; 
    Result := not aQuery.Fields[1].IsNull;
  finally
    DestroyDB(aQuery);
  end;
end;

end.

 
