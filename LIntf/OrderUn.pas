unit OrderUn;

interface

uses Classes, Graphics, TourConsts, Controls, DateUtils, Windows, IBDatabase, cxStyles,UnitProjectProc,UNitProc, core;

{ order payment, insure discounts and documents states support}

type
  TGetPathFile = function(var Fldr, Subj: string; 
    ReferOrderId, TypeFolder: Integer; aSaveExtPdf: Boolean = False): Boolean of object;

  TGetTouristListData = record
    SelectType: Integer;
    AllTourist: Integer; //1 - �������� �������, �� �� �������� �������
    TouristLat: Integer; //
    TouristRefused: Integer; //1 - �� ���������� �������, �� �� �����
    aTypeServiceId: Variant;
  end;
  TGetTouristListProc = procedure(aGetTouristListData: TGetTouristListData) of object;
  
  TPersonListPreviewData = record
    PersonListElem: TDBShemaView;
    ServiceListElem: TDBShemaView;
    aGetTouristListProc: TGetTouristListProc;
    aTouristField: string;
    aTouristLatField: string;
    aReportName: string;
    aReportHeader: string;
    aReportFooter: string;
    aReportSignature: string;
    aTypeServiceId: Integer;
  end;

  PeriodItem = record
    FromDate: TDateTime;
    TillDate: TDateTime;
    ItemId: Integer;
  end;

  TInsurProg = array[0..3,1..6] of real;
  TInsureTax = array[0..3] of TInsurProg;
  TPeriods = array of PeriodItem;

  TDataRecord = record 
    Text: string;
    Email: string;
    OrderId: Integer;
    TouristName: string;
    StoreFolder: Integer;
    GetPathFile: TGetPathFile;
  end;

  TOriginalTrstData = record
    OriginalSurName: String;
    OriginalName: String;
    OriginalSecondName: String;
    OriginalFirstName: String;
    OriginalBirthDate: TDateTime;    
    OriginalPassportNo: String;
    OriginalPassKind: Integer;
    OriginalPassFromDate: TDateTime;
    OriginalPassToDate: TDateTime;
    OriginalKonsul: String;
    OriginalParentId: Integer;
    OriginalMobilPhone: string;
    OriginalNationalityId: Integer;
    OriginalSex: string;
    OriginalEmail: string;
    OriginalOldName: string;
    OriginalOldNameLat: string;
    OriginalBirthCountryId: Integer;
    OriginalBirthLocality: string;
    OriginalOldNameNull: Boolean;    
    OriginalFatherId: Integer;
    OriginalMotherId: Integer;
    OriginalSpouseId: Integer;
    OriginalGuardianId: Integer;
    OriginalChildNotHave: Boolean;
    OriginalLastVisaNull: Boolean;
  end;

  TNewOrderData = record
    PersonCount: Integer;
    MaxPersForPromo: Integer;
    TourId: Integer;
    GroupId: Integer;
    CompanyId: Integer;
    ReservTo: TDateTime; 
    IsGroup: Boolean;
    IsInd: Boolean;
    UseTmpl: Boolean;
    TemplateId: Variant;
    PromoProgramId: Variant;
  end;
//  TGroupDataRecord = record
  
const
  // order payment states
  ordFinished = 0;
  ordTimeOut = 1;
  ordNotPaid = 2;
  ordPartPay = 3;
  ordPaid = 4;
  ordAnnuled = 5;
  ordOverPay = 6;
  ordNullPay = 7;
  ordPaidNotStates = [ordTimeOut, ordNotPaid, ordNullPay];
  ordPayStates = [ordPartPay, ordPaid, ordOverPay];
  ordPaidAllStates = [ordPaid, ordOverPay, ordNullPay];
  //order GroupId
  nVisaDocGroup1 = 815;
  nVisaDocGroup2 = 816;
  nVisaDocGroup3 = 817;
  nVisaDocGroup4 = 818;
  nVisaDocGroup5 = 819;
  nOrderMeetingId = 166;
  nOrderSendingId = 976;
//Visa Country  Id
  nVisaContryIdCzech = 57;
  nVisaContryIdHungary = 97;
  nVisaContryIdPoland = 170;  
//VisaFilling Type
{  nVisaFillingFirma = 0;
  nVisaFillingTourist = 1;
  aVisaFillingType: array[nVisaFillingFirma..nVisaFillingTourist] of string = (
    'Գ���', '������');}
//Visa Note Category
  nVisaNoteFillDate = 0;
  nVisaNoteFillType = 1;
  nVisaNoteBioDate = 2;
  nVisaNoteGivDate = 3;  
  nVisaNoteVisaNo = 4;
  sReturnedDocShablon = '������ ��������� ��� ����������.dot';
  {// person refuse reasons
  prsRefuseByOneSelf = 0;
  prsRefuseByEmbassy = 1;}
  // trip place states
  plcFree = 0;
  plcTimeOut = 1;
  plcUsed = 2;
  plcPartPay = 3;
  plcPaid = 4;
  plcQueue = 5;
  plcOverPay = 6;
  plcReserve = 7;
  plcInaccessible = 8;
//
  cmdAnketState = 'CalcAnketState';
  cmdEmbassy = 'EMBASSYNAME';
  cmdFilingType = 'FILLINGTYPENAME';
  cmdDocState = 'CalcDocumState'; 
  cmdDocTo = 'DOCTO';
  cmdAutoTillDate = 'AUTOFILLTILLDATE';
  cmdFilingDate = 'FILLINGDATE'; 
  cmdBiometrics = 'BIOMETRICS';
  cmdApplForm = 'PRINTMAN'; 
  cmdGivingDate = 'GIVINGDATE';
  cmdGarant = 'GARANTNAME'; 
  cmdPartner = 'PARTNERNAME';
  cmdPassport = 'PASSPORTNO';
  cmdArray: array[0..12] of string = (cmdAnketState, cmdEmbassy, cmdFilingType,
    cmdDocState, cmdDocTo, cmdAutoTillDate, cmdFilingDate, cmdBiometrics, cmdApplForm,
    cmdGivingDate, cmdGarant, cmdPartner, cmdPassport);
  nFormWidthDef = 550;

//
  nPrintInshure = 0;
  nPrintOtherServ = 1;
  nPrintBorderList = 2;
  //Man 49
  nDefDrive = 77;
  // person refuse reasons (refused by ...)
  prfPersonRefuseByNone = -1;
  prfPersonRefuseByOneself = 0;
  prfPersonRefuseByEmbassy = 1;
  prfPersonRefuseByOneAnnul = 8;
  prfPersonRefuseByOrdAnnul = 9;
  prfPersonRefuseByAnnul =
    [prfPersonRefuseByOneAnnul, prfPersonRefuseByOrdAnnul];
  prfPersonRefuseByReasons =
    [prfPersonRefuseByOneself, prfPersonRefuseByEmbassy] +
    prfPersonRefuseByAnnul;
  // insure discount calculation method
  insDiscountCalcClient = 0;
  insDiscountCalcOur = 1;
  insDiscountCalcNone = 2;
  // anket fields completeness states
  acsAnketStateNone = 0;    // ����
  acsAnketStateNotAll = 1;  // �� ��
  acsAnketStateHaveAll = 2; // ��
  // visa view
  nSetOrderTourGrp = 0; //�� ���� �� ����
  nSetOrderCntryDate = 1; //�� ����� �� ���
  // visa documents states
  docDocumentsNotNeed = -1; // �� �������
  docDocumentsNone = 0;     // ����
  docDocumentsNotAll = 1;   // �� ��
  docDocumentsHaveAll = 2;  // ��  //�� ����
  docDocumentsOk = 3;  //��������� // �����������
  docDocumentsReady = 4;    // �����  3
  docDocumentsSent = 5;  // ³��������� ����
  docDocumentsToEmbas = 6;  // �����   4
  docDocumentsToken = 7;  // �������   ����
  docDocumentsRcEmbas = 8;  // ��������  5
  docDocumentsTourist = 9;  // ³�����   6
  docDocumentsInTrst = 10; // � �������
  docDocumentsLast = docDocumentsInTrst;//docDocumentsTourist;
  docDocumentsFromClient = [docDocumentsNone..docDocumentsHaveAll];
  docDocumentsForEmbass = [docDocumentsOk{docDocumentsReady}..docDocumentsRcEmbas];

  pSt: array[docDocumentsNone..docDocumentsLast] of Pointer = (
    @SDataModDocState0, @SDataModDocState1, @SDataModDocState2,
    @SDataModDocState3, @SDataModDocState4, @SDataModDocState5, 
    @SDataModDocState6, @SDataModDocState7, @SDataModDocState8, 
    @SDataModDocState9, @SDataModDocState10);
  
  nDay = 0;
  nNight = 1;
  nWeek = 2;
  nUnitLast = nWeek;
  nStandartInsProg = 1;
  nDeffValStrahSumId = 30;
  nDeffUahStrahSumId = 38;//19;  
  nPDFFileFormat = 17;
  nSendByMail = 4;
  nMaxPermDay = 14;

  nAnketShablon = 1119;
//AnketField
  nAnketFieldBirthDate = 0;
  nAnketFieldBirthLocality = 1;
  nAnketFieldBirthCountry = 2;
  nAnketFieldSex = 3;
  nAnketFieldMarried = 4;
  nAnketFieldNationality = 5;
  nAnketFieldPriorNationality = 6;
  nAnketFieldPassportIssue = 7;
  nAnketFieldPassportIssueAddress = 8;
  nAnketFieldOldSurName = 9;
  nAnketFieldOldSecondName = 10;
  nAnketFieldIdentCode = 11;
  nAnketFieldProfession = 12;
  nAnketFieldOccupation = 13;
  nAnketFieldEmployer = 14;
  nAnketFieldEmplAddress = 15;
  nAnketFieldEmplPhone = 16;
  nAnketFieldAdditAddress = 17;
  nAnketFieldSpouseSurName = 18;
  nAnketFieldSpouseName = 19;
  nAnketFieldSpouseOldSurName = 20;
  nAnketFieldSpouseSecondName = 21;
  nAnketFieldSpouseFirstName = 22;
  nAnketFieldSpouseOldSecondName = 23;
  nAnketFieldSpouseBirthDate = 24;
  nAnketFieldSpouseBirthLocality = 25;
  nAnketFieldSpouseBirthCountry = 26;
  nAnketFieldSpouseNationality = 27;
  nAnketFieldFatherName = 28;
  nAnketFieldFatherNameLat = 29;
  nAnketFieldMotherName = 30;
  nAnketFieldMotherNameLat = 31;
  nAnketFieldMotherOldName = 32;
  nAnketFieldMotherOldNameLat = 33;
  nAnketFieldReturnVisa1No = 34;
  nAnketFieldReturnVisa1Date = 35;
  nAnketFieldReturnVisa2No = 36;
  nAnketFieldReturnVisa2Date = 37;
  nAnketFieldOtherMemo = 38;
  nAnketFieldEndVisaKind = 39;
  nAnketFieldEndVisaIssue = 40;
  nAnketFieldEndVisaNo = 41;
  nAnketFieldEndVisaFrom = 42;
  nAnketFieldEndVisaTill = 43;
  nAnketFieldLastVisit = 44;
  nAnketFieldChild = 45;
  nAnketFieldPosada = 46;
  nAnketFieldSecondName = 47;
  nAnketFieldFirstName = 48;
  nAnketFieldMiddleName = 49;
  nAnketFieldMiddleLName = 50;
  nAnketFieldPassportNo = 51;
  nAnketFieldPassportDate = 52;
  nAnketFieldPassportExpire = 53;
  nAnketFieldHomeAddress = 54;
  nAnketFieldHomePhone = 55;
  nAnketFieldMobilPhone = 56;
  nAnketFieldEmail = 57;
  nAnketFieldBirthNationality = 58;
  nAnketFieldBirthSurName = 59;
  nAnketFieldBirthSurNameLat = 60;
  nAnketFieldFatherSecondName = 61;
  nAnketFieldFatherSecondNameLat = 62;
  nAnketFieldFatherOldName = 63;
  nAnketFieldFatherOldNameLat = 64;
  nAnketFieldFatherBirthDate = 65;
  nAnketFieldFatherBirthCountry = 66;
  nAnketFieldFatherBirthLocality = 67;
  nAnketFieldFatherNationality = 68;
  nAnketFieldMotherSecondName = 69;
  nAnketFieldMotherSecondNameLat = 70;
  nAnketFieldMotherBirthDate = 71;
  nAnketFieldMotherBirthCountry = 72;
  nAnketFieldMotherBirthLocality = 73;
  nAnketFieldMotherNationality = 74;
  nAnketFieldPassportNoInSide = 75;
  nAnketFieldPassDateInSide = 76;
  nAnketFieldPassIssuedInSide = 77;
  nAnketFieldGuardianSecondName = 78;
  nAnketFieldGuardianSecondNameLat = 79;
  nAnketFieldGuardianName = 80;
  nAnketFieldGuardianNameLat = 81;
  nAnketFieldGuardianOldName = 82;
  nAnketFieldGuardianOldNameLat = 83;
  nAnketFieldGuardianBirthDate = 84;
  nAnketFieldGuardianBirthCountry = 85;
  nAnketFieldGuardianBirthLocality = 86;
  nAnketFieldGuardianNationality = 87;
  nAnketFieldGainSum = 88;
  nAnketFieldGainPeriod = 89;
  nAnketFieldEmplEmail = 90;
  nAnketFieldPermStayNo = 91;
  nAnketFieldPermStayIssue = 92;
  nAnketFieldPermStayFrom = 93;
  nAnketFieldPermStayTill = 94;
  nAnketFieldBiometrics = 95;
  nAnketFieldOldVisaCountry = 96;
  nAnketFieldOldVisaNo = 97;
  nAnketFieldOldVisaFrom = 98;
  nAnketFieldOldVisaTill = 99;
  nAnketFieldOldVisaTravelObject = 100;
  nAnketFieldOldVisaEntryCount = 101;
  nAnketFieldOldVisaDayCount = 102;
  nAnketFieldOldVisaEmbasDate = 103;
  nAnketFieldOldVisaEmbasAddress = 104;
  nAnketFieldOccupationTranslate = 105;
  nAnketFieldVisaGarant = 106;
  nAnketFieldVisaGarantAddress = 107;
  nAnketFieldVisaGarantPhone = 108;
  nAnketFieldVisaGarantFax = 109;
  nAnketFieldVisaGarantEmail = 110;
  nAnketFieldVisaGarantPersContName = 111;
  nAnketFieldVisaGarantPersContAddress = 112;
  nAnketFieldVisaGarantPersContPhone = 113;
  nAnketFieldVisaGarantPersContFax = 114;
  nAnketFieldVisaGarantPersContEmail = 115;
  nAnketFieldVisaHotelName = 116;
  nAnketFieldVisaHotelAddresTo = 117;
  nAnketFieldVisaHotelAddresToPhone = 118;
  nAnketFieldVisaHotelAddresToFax = 119;
  nAnketFieldVisaHotelAddresToEmail = 120;
  nAnketFieldVisaPersGarantNationality = 121;
  nAnketFieldVisaPersGarantSurName = 122;
  nAnketFieldVisaPersGarantName = 123;
  nAnketFieldVisaPersGarantBirthDate = 124;
  nAnketFieldVisaPersGarantPhone = 125;
  nAnketFieldVisaPersGarantFax = 126;
  nAnketFieldVisaPersGarantEmail = 127;
  nAnketFieldVisaPersGarantAddress = 128;
  nAnketFieldAdditPhone = 129;
  nAnketFieldFirst = nAnketFieldBirthDate;
  nAnketFieldLast = nAnketFieldAdditPhone;
//
  nObdzvinNone = 0;
  nObdzvinNeedCall = 1; //������� ������������ ����:
  nObdzvinPromise = 2; //�������� ��������� ���� ���� ��:
  nObdzvinTakeTour = 3; //������� ���� � �����
  nObdzvinTourOnSite = 4;//6;
  nObdzvinSendMail = 5;
  nObdzvinNeedChangeTour = 6;//�������� ��������� ������� ��:
  nObdzvinPermExtraAgent = 7;//8; // � ����� �� �������� 4%
  nObdzvinToBanExtraAgent = 8; 
  nObdzvinTakenAndRefuse = 9;//4; ������� �� ����������
  nObdzvinRefuse = 10;//5;  ���������� �������� 
  arrTourOnSite = [nObdzvinTourOnSite..nObdzvinToBanExtraAgent];

{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
  pObdzvinState: array[nObdzvinNeedCall..nObdzvinRefuse] of Pointer = (
    @sObdzvinState1, @sObdzvinState2, @sObdzvinState3, @sObdzvinState4,
    @sObdzvinState5, @sObdzvinState6, @sObdzvinState7, @sObdzvinState8,
    @sObdzvinState9, @sObdzvinState10 );
{$WARN UNSAFE_CODE ON}
{$WARN UNSAFE_TYPE ON}
  nTripCostMain = 0;
  nTripCostExtra = 1;
  nTripCostOnce = 2;
  nTripCostOnDay = 3;
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
  pTripCostType: array[nTripCostMain..nTripCostOnDay] of Pointer = (
    @sTripCostType0, @sTripCostType1, @sTripCostType2, @sTripCostType3);
  pTripCostTypeShort: array[nTripCostMain..nTripCostOnDay] of Pointer = (
    @sTripCostTypeShort0, @sTripCostTypeShort1, @sTripCostTypeShort2, @sTripCostTypeShort3);
{$WARN UNSAFE_CODE ON}
{$WARN UNSAFE_TYPE ON}

  nContractSendDoc = 0;
  nContractNeedCall = 1;
  nContractRefuse = 2;
  nContractSuspend = 3;
  nContractCancel = 4;
  nContractRestore = 5;
  nContractRepair = 6;
  nContractStateArr: array[nContractSendDoc..nContractRepair] of integer = (
    8, 0, 80, 95, 97, 97, 98);

  SortByContractNotAgent = -1;
  SortByContractNotCntr = 0;
  SortByContractNeedCall = 1;
  SortByContractSendDoc = 2;
  SortByContractFillData = 3;
  SortByContractAreCntr = 4;
  SortByContractPermEdit = 5;
  SortByContractReReestr = 6;
  SortByContractSendEmail =7;
  SortByContractEmailPrint = 8;
  SortByContractEmailSign = 9;
  SortByContractNotRcv1 = 10;
  SortByContractEmailSendOrgn = 11;
  SortByContractRcvCopy = 12;
  SortByContractRcvCopyPrint = 13;
  SortByContractRcvCopySign = 14;
  SortByContractNotRcv2 = 15;
  SortByContractRcvCopySendOrgn = 16;
  SortByContractExtend = 17;
  SortByContractPrint = 18;
  SortByContractSign = 19;
  SortByContractSendOrgn = 20;
  SortByContractNotRcv = 21;
  SortByContractTakeOrgn = 22;
  SortByContractRcvOrgn = 23;
  SortByContractRefuse = 24;
  SortByContractLast = SortByContractRefuse;
  SortByContractImgArr: array[SortByContractNotCntr..SortByContractLast] of Integer = (
    87, 0, 8, 0, 8, 101, 102, 90, 49, 89, 84, 84, 40, 49, 89, 84, 84, 91, 49, 89, 84, 84, 62, 62, 80); 
  SortByContractLeftImgArr = [SortByContractEmailPrint..SortByContractRcvCopySendOrgn];
  SortByContractImgArr2: array[SortByContractEmailPrint..SortByContractRcvCopySendOrgn] 
    of Integer = (90, 90, 90, 90, 0, 40, 40, 40, 40);
  nCommonNoteRepairWork = 0;
  nCommonNoteTermWork = 1;
  nCommonNoteArr: array[nCommonNoteRepairWork..nCommonNoteTermWork] of Integer = (
    98, 100);

  nOrdrTrstForm = 0;
  nOrdrAnktForm = 1;
  nOrdrVisaForm = 2;

  nOnlyFunding = 1;
  nOnlyBank = 2;
  nFundingOrBank = 3;
  nFundingAndBank = 4;  
    
  TradeOrNetNameArr: array[Boolean] of string = ('���������� �����', '����� �������');
  TradeOrNetNameArr2: array[Boolean] of string = ('���������� �����', '������ �������');  
  TradeOrNetNameArr3: array[Boolean] of string = ('���������� �����', '������ �������');  
  TradeOrNetNameViewArr: array[Boolean] of string = ('����������� ���������� �����', '����������� ������ �������');  
  
  clDocumentState: array[docDocumentsNotNeed..docDocumentsLast] of TColor = (
    clBtnShadow, clWindowText, clWindowText, clWindowText,
    $000080FF, $00FF0080, clFuchsia, clBlue, clMaroon, clGreen, clRed, clRed);//��������� ��� ����� ���������
  clPassportState: array[0..1] of TColor = (clInfoBk, clRed);
  {$WARN UNSAFE_TYPE OFF}
  {$WARN UNSAFE_CODE OFF}
  pDocumentStateIdent: array[docDocumentsNotNeed..docDocumentsLast] of Pointer = (
    @SDataModDocStateN,
    @SDataModDocState0, @SDataModDocState1, @SDataModDocState2,
    @SDataModDocState3, @SDataModDocState4, @SDataModDocState5,
    @SDataModDocState6, @SDataModDocState7, @SDataModDocState8,
    @SDataModDocState9, @SDataModDocState10); //��������� ��� ����� ���������
  pMarriedMUaIdents: array[0..4] of Pointer = (@SVDlgsMarriedMUa0,
          @SVDlgsMarriedMUa1, @SVDlgsMarriedMUa2, @SVDlgsMarriedMUa3, @SVDlgsMarriedMUa4);
//Insure
(* do 16.07.2014
  AgeArr: array[0..5] of Real = (1.5, 1, 1.5, 2, 3, 4); *)
(* do 30.11.2015
  AgeArrCoef: array[0..CountAgeCoef] of Real = (2, 1.3, 1, 1.5, 2, 3, 4); *)
  CountAgeCoef = 6;
//  AgeArrCoef: array[0..CountAgeCoef] of Real = (4, 1.5, 1, 1.5, 2, 3, 4);
{EURO}  
{  InsurProgArr: TInsurProg = ( (5.84, 5.08, 4.57, 4.07, 3.81, 3.56), //Express
                               (4.68, 4.07, 3.66, 3.25, 3.05, 2.85), //Standart
                               (5.38, 4.68, 4.21, 3.74, 3.51, 3.27), //Econom
                               (6.18, 5.38, 4.84, 4.30, 4.03, 3.76));//Business}
(* do 16.07.2014                               
  InsureTaxEUROArr: TInsureTax = (
{10}   ( (0, 0, 0, 0, 0, 0), //Express
         (4.63, 4.03, 3.62, 3.22, 3.01, 2.82), //Standart
         (5.32, 4.63, 4.17, 3.71, 3.48, 3.25), //Econom
         (0, 0, 0, 0, 0, 0) ),//Business
{20}   ( (0, 0, 0, 0, 0, 0), //Express
         (4.88, 4.25, 3.83, 3.40, 3.19, 2.97), //Standart
         (5.62, 4.88, 4.40, 3.91, 3.66, 3.42), //Econom
         (0, 0, 0, 0, 0, 0) ),//Business
{30}   ( (0, 0, 0, 0, 0, 0), //Express
         (5.15, 4.48, 4.03, 3.58, 3.36, 3.14), //Standart
         (5.92, 5.15, 4.63, 4.11, 3.86, 3.60), //Econom
         (6.80, 5.92, 5.32, 4.73, 4.43, 4.14) ),//Business
{50}   ( (0, 0, 0, 0, 0, 0), //Express
         (6.17, 5.37, 4.83, 4.29, 4.03, 3.76), //Standart
         (7.10, 6.17, 5.56, 4.94, 4.63, 4.32), //Econom
         (8.16, 7.10, 6.39, 5.68, 5.32, 4.97) )//Business
           );
{USD}
  InsureTaxUSDArr: TInsureTax = (
       ( (0, 0, 0, 0, 0, 0), //Express
         (3.37, 2.93, 2.64, 2.34, 2.20, 2.05), //Standart
         (3.87, 3.37, 3.03, 2.70, 2.53, 2.35), //Econom
         (0, 0, 0, 0, 0, 0) ),//Business
       ( (0, 0, 0, 0, 0, 0), //Express
         (3.55, 3.09, 2.78, 2.48, 2.32, 2.17), //Standart
         (4.08, 3.55, 3.20, 2.84, 2.66, 2.49), //Econom
         (0, 0, 0, 0, 0, 0)),//Business
       ( (0, 0, 0, 0, 0, 0), //Express
         (3.74, 3.26, 2.93, 2.61, 2.44, 2.28), //Standart
         (4.30, 3.74, 3.37, 2.99, 2.81, 2.62), //Econom
         (4.95, 4.30, 3.87, 3.44, 3.22, 3.01) ),//Business
       ( (0, 0, 0, 0, 0, 0), //Express
          (4.49, 3.91, 3.51, 3.12, 2.93, 2.73), //Standart
          (5.16, 4.49, 4.04, 3.59, 3.37, 3.15), //Econom
          (5.94, 5.16, 4.64, 4.13, 3.87, 3.62) )//Business
            );
*)
(* do 30.11.2015
  InsureTaxEUROArr: TInsureTax = (
{10}   ( (0, 0, 0, 0, 0, 0), //Express
         (6.27, 5.45, 4.90, 4.20, 3.98, 3.71), //Standart
         (7.20, 6.26, 5.64, 4.82, 4.57, 4.26), //Econom
         (0, 0, 0, 0, 0, 0) ),//Business
{20}   ( (0, 0, 0, 0, 0, 0), //Express
         (6.61, 5.75, 5.18, 4.43, 4.20, 3.91), //Standart
         (7.60, 6.61, 5.95, 5.09, 4.83, 4.50), //Econom
         (0, 0, 0, 0, 0, 0) ),//Business
{30}   ( (0, 0, 0, 0, 0, 0), //Express
         (6.96, 6.05, 5.45, 4.66, 4.42, 4.12), //Standart
         (8.00, 6.96, 6.26, 5.36, 5.08, 4.73), //Econom
         (9.21, 8.01, 7.21, 6.17, 5.84, 5.44) ),//Business
{50}   ( (0, 0, 0, 0, 0, 0), //Express
         (8.36, 7.27, 6.54, 5.59, 5.30, 4.94), //Standart
         (9.61, 8.35, 7.52, 6.43, 6.10, 5.68), //Econom
         (11.05, 9.61, 8.65, 7.40, 7.01, 6.53) )//Business
           );
{USD}
  InsureTaxUSDArr: TInsureTax = (
       ( (0, 0, 0, 0, 0, 0), //Express
         (4.56, 3.96, 3.57, 3.05, 2.89, 2.69), //Standart
         (5.24, 4.56, 4.10, 3.51, 3.33, 3.10), //Econom
         (0, 0, 0, 0, 0, 0) ),//Business
       ( (0, 0, 0, 0, 0, 0), //Express
         (4.81, 4.18, 3.76, 3.22, 3.05, 2.84), //Standart
         (5.53, 4.81, 4.33, 3.70, 3.51, 3.27), //Econom
         (0, 0, 0, 0, 0, 0)),//Business
       ( (0, 0, 0, 0, 0, 0), //Express
         (5.06, 4.40, 3.96, 3.39, 3.21, 2.99), //Standart
         (5.82, 5.06, 4.56, 3.90, 3.70, 3.44), //Econom
         (6.70, 5.82, 5.24, 4.48, 4.25, 3.96) ),//Business
       ( (0, 0, 0, 0, 0, 0), //Express
          (6.08, 5.28, 4.76, 4.07, 3.86, 3.59), //Standart
          (6.99, 6.07, 5.47, 4.68, 4.43, 4.13), //Econom
          (8.04, 6.99, 6.29, 5.38, 5.10, 4.75) )//Business
            );  *)
(* ������� �� �������
  InsureTaxEUROArr: TInsureTax = (
{10}   ( (0, 0, 0, 0, 0, 0), //Express
         (0.30, 0.27, 0.25, 0.22, 0.20, 0.17), //Travel
         (0, 0, 0, 0, 0, 0), //MultiTravel 
         (0, 0, 0, 0, 0, 0) ),
{20}   ( (0, 0, 0, 0, 0, 0), 
         (0.32, 0.30, 0.26, 0.23, 0.21, 0.19), //Travel
         (0, 0, 0, 0, 0, 0), //MultiTravel 
         (0, 0, 0, 0, 0, 0) ),
{30}   ( (0, 0, 0, 0, 0, 0), 
         (0.43, 0.39, 0.36, 0.31, 0.27, 0.23), //Travel
         (0, 0, 0, 0, 0, 0), //MultiTravel 
         (0, 0, 0, 0, 0, 0) ),
{50}   ( (0, 0, 0, 0, 0, 0), //Express
         (0.54, 0.49, 0.43, 0.37, 0.35, 0.30), //Travel
         (0, 0, 0, 0, 0, 0), //MultiTravel 
         (0, 0, 0, 0, 0, 0) )
           );
  InsurProgUnh: array[1..6] of real = (0.022, 0.019, 0.016, 0.013, 0.01, 0.008);
  WorkArr: array[0..1] of Real = (1, 2.5);
  WorldArr: array[0..2] of Real = (1, 2, 1.2);
  SportArr: array[0..3] of Real = (1, 1.5, 2, 3.5);
  FamilyArr: array[0..1] of Real = (1, 0.95);
  GroupArr: array[0..4] of Real = (1, 0.95, 0.90, 0.85, 0.80);

  *)
  InsureExchRate = 38;   
  
{  InsurProgUnh: array[1..6] of real = (0.14, 0.20, 0.30, 0.35, 0.45, 0.62);}
{ do 16.07.2014
  InsurProgUnh: array[1..6] of real = (0.154, 0.22, 0.33, 0.385, 0.495, 0.682);  }
(* do 30.11.2015
  InsurProgUnh: array[1..6] of real = (0.21, 0.30, 0.44, 0.52, 0.67, 0.92); *)

  
  SportArrMark: array[0..3] of string = ('', 'AV', 'NS', 'PS');
  sChild: array [Boolean] of string = ('���', '�����');
  sSex: array [Boolean] of string = ('�', '�');
  sSexId: array [Boolean] of Integer = (0, 1);
//
  Val: array[0..2] of String = (' ���', ' USD', ' EUR' );
  Expire: array[0..3] of String = (' ��.', ' ����.', ' ��.', ' �.');
  aOrAnd: array[Boolean] of string = ('���', '��');
  sCurr : array[0..2] of string = ('���','USD','EURO');
  sBool: array[Boolean] of Char = ('F', 'T');
  sEURO = '�';
  FilingImg: array[Boolean] of Integer = (50, 49);
  
  
//Id DocVisa
  nVisaPassportDocId = 693;
  nVisaInsurePoliseDocId = 694;
  nVisaGreenInsPoliseDocId = 709;
  nPermToLeaveId = 718;
  nUnEmployedId = 741;
  nWorkingId = 742;
  nBusinessmenId = 743;
  nStudentId = 744;
  nSchoolBoyId = 745;
  nPensId = 746;
  nHouseHolderId = 747;
  nChildId = 748;
  nVisaTravelDocId = 749;

  nBioPassportId = 1201;//9;

  nOneTimePromo = 1;

  nLengthEDRPOU = 8;
  nLengthIdenCode = 10;
  nLengthTaxPayCode = 12;
  LengthTaxCode: array[Boolean] of Integer = (nLengthIdenCode, nLengthTaxPayCode); 
  
  nAddLogServVisa = 0;
  nAddLogDelServVisa = 23;
  nAddLogSetEmbassy = 1;
  nAddLogTakeDoc = 3;
  nAddLogCall = 7;
  nAddLogHaveAllDoc = 8;
  nAddLogNotAllDoc = 9;
  nAddLogAddUnitedDoc = 10;
  nAddLogAddNewDocInDirect = 11;
  nAddLogAddDelDocInDirect = 16;
  nAddLogSendReportStanDoc = 2;
  nAddLogSendReportGetDoc = 4;
  nAddLogSendReportNewDoc  = 6;
  nAddLogSendReportNotHaveDoc  = 13;
  nAddLogSendReportOldDoc  = 26;
  nAddLogSendConfirmRep  = 27;
  nAddLogSendConfirmAgentRep  = 28;
  nAddLogSendConfirmDetailRep  = 29;
  TypeReport: array[0..4] of Integer = (nAddLogSendReportStanDoc,
    nAddLogSendReportNewDoc, nAddLogSendReportOldDoc,
    nAddLogSendReportNotHaveDoc, nAddLogSendReportGetDoc);
  nContrCategoryCount = 21;
  nExportCategoryCount = 15;
    
  nOncePromoProgram = 1;
  nInsureKindMedical = 12;
  nInsureKindUnhappy = 13;
//doc category
  nOrderDocFolder = 0;
  nGroupDocFolder = 1;
  nVisaDocFolder = 2;
  nPartnerDocFolder = 3;
  nTripDocFolder = 4;
  nPersVisaDocFolder = 5;
  nContractFolder = 6;
  nPersonDocFolder = 7;
//
  nPartnerLicenseDocFolder = 5;  
//doc category
  nOrderOrdrTour = 1;
  nOrderConstract = 2;
  nOrderConfirmation = 3;
  nOrderBill = 4;
  nOrderReport = 5;
  nOrderDocVisa = 6;
  nOrderVisaInform = 7;
  nOrderInfMail = 8;
  nOrderOtherDoc = 9;
  
  sValues: array[0..14] of Pointer = (@SVisaFormORDERID, @SVisaFormTOURISTNAME, 
   @SVisaFormTOURISTNAMEEN, @SVisaFormBIRTHDATE, @SVisaFormISGROUPED, 
   @SVisaFormDOCUMSTATE, @SVisaFormFROMDATE, @SVisaFormToDATE, 
   @SVisaFormENTRYCOUNT, @SVisaFormVISAKIND, @SVisaFormVISANO, 
   @SVisaFormVOUCHERNO, @SVisaFormMANAGER, @SVisaFormVISATAX,
   @SVisaFormVISATAX2);    
//dictionary
  nLocalLang = 448;
  sTablServGroups = 'SERVGROUPS';
  sTablServices = 'SERVICES';
  sTablRoomTypes = 'ROOMTYPES';
  sTablBuilds = 'NAMELISTS';
  sTablHtlTypes = 'NAMELISTS';
  sTablFeedTypes = 'FEEDTYPES';
  sTablHotels = 'HOTELS';
  sTablHtlBuilds = 'HTLBUILDS';
  sTablHtlRooms = 'HTLROOMS';
  sTablHtlSrvLink = 'HTLSERVLNK';
  sTablHtlBldLink = 'HBLDSERVLNK';
  sTablHtlRoomSrvLink ='ROOMSERVLNK';
  sTablExpandRoomName = 'ROOMEXPANDNAMES';
  sTablResortType = 'NAMELISTS';
  sTablResort = 'CITIES';
  sTablNaturObjectType = 'NAMELISTS';
  sTablNaturObject = 'NATUROBJECTS';
  sTablAdminUnitType = 'NAMELISTS';
  sTablProvince = 'PROVINCES';
  sTablRegion = 'TOWNSHIPS';
  sTablBedType = 'BEDTYPES';
  sTablCity = 'CITIES';
  sTablCountry = 'COUNTRIES';
  sTablInfrastructure = 'INFRASTRUCTURES';
  sTablInfraTypeGroup = 'INFRATYPEGROUPS';
  sTablInfraType = 'INFRATYPES';
  sTablExcursShType = 'EXCURSSHABLONTYPES';
  sTablExcursShablons = 'EXCURSSHABLONS';
//  sTablDictSection_Item = 'DICTSECTION_ITEMS';

  CompEventName  = 'one_partner_event';  
  {$WARN UNSAFE_CODE ON}
  {$WARN UNSAFE_TYPE ON}
//
  nGridHeight = 252;

  sManually = 'Manually';
  sCustCash = 'CustCash';
  sCustTravel = 'CustTravel';
  sCustKreditKard = 'CustKreditKard';
  sCustHome = 'CustHome';
  sCustTransport = 'CustTransport';
  sCustOther = 'CustOther';
  sSponsorCash = 'SponsorCash';
  sSponsorHaveHome = 'SponsorHaveHome';
  sSponsorAllCost = 'SponsorAllCost';
  sSponsorTransport = 'SponsorTransport';
  sSponsorOther = 'SponsorOther';
  sSponsorGarant = 'SponsorGarant';

  sHtmlToPdf = 'wkhtmltopdf.exe';

  sVisaDocLibName = 'VisaDocLib.dll';

{***Repos***}
  clValueEditFont: array[Boolean] of TColor = (clRed, clWindowText);

   
type
  TOrderPaymentState = ordFinished..ordNullPay;
  TPlacePayState = plcFree..plcInaccessible;
  TDiscountCalcType = insDiscountCalcClient..insDiscountCalcNone;

const
  ordPaidStates = [ordPartPay, ordPaid, ordOverPay];
  plcPaidStates = [plcPartPay, plcPaid, plcOverPay];
  plcPlacePayStates: array[TPlacePayState] of string = (
    'plcFree', 'plcTimeOut', 'plcUsed', 'plcPartPay', 'plcPaid',
    'plcQueue', 'plcOverPay', 'plcReserve', 'plcInaccessible');

function CalcOrderPaymentState(State, State2: Integer): Integer;
function GetOrderStateColor(
  OrderState: Integer; ActiveOrder: Boolean = False): TColor;
function GetOrderPaymentStateName(State: Integer): string;
function GetPlacePayStateName(State: Integer): string;
//function GetPlacePayStateIdent(State: integer): String;
function GetPersonRefusedByAnnulList: String;
function GetPersonRefusedByOtherList: String;
function GetSQLWhereRefused(
  const RefuseByField: String; HideRefused, HideAnnuled: Boolean): String;
function GetDocumentStateName(State: Integer): string;
procedure AssignDiscountCalcTypes(DiscTypeList: TStrings);

{ order payment method support}

const
  nPayMethodCash = 0;
  nPayMethodBank = 1;
  nPayMethodCard = 2;
  nPayMethodSpsr = 3;
  nPayMethodBart = 4;
  nPayMethodWinn = 5;
  nPayMethodPart = 6;
  nPayMethodCorr = 7;
//  nPayMethodOver = 8;
//  nPayMethodTrns = 7;
  nPayMethodLast = nPayMethodCorr;

  nPayDocBank = 0;

  nReturnMethodRefund = 0;
  nReturnMethodStorno = 1;
  nReturnMethodRecalc = 2;
  
  sBillStatusAnnul = '�����������';
  sBillStatusPaid = '���������';
  sBillStatusStoped = '���������';
  sBillStatusStale = '��������������';
  sBillStatusUnPaid = '�����������';
  sBillStatusPartlyPaid = '�������� ���������';
  sBillStatusOverPaid = '������������';

  sBillName = '�������';
{  sBillPayTypeCash = '������';
  sBillPayTypeOrder = '������� ���������';
  sBillPayTypeCorr = '�����������';
  sBillPayTypeOveg = '���������������'; }
  
  
function PayMethodIdent(Id: Integer): string;
function PayMethodDocumentIdent(Id: Integer): string;
function PayMethodDocumentIdentNew(Id: Integer): string;
procedure PayMethodIdentsToStrings(Strings: TStrings; AddAsObject: Boolean = False);
procedure PayDocumentIdentsToStrings(Strings: TStrings; AddAsObject: Boolean = False);

function ReturnMethodDocumentIdent(Id: Integer): string;

{ cost values of order tiles }

const
  ordOrderTrip = 0;
  ordOrderHotel = 1;
  ordOrderTransfer = 2;
  ordOrderInsure = 3;
  ordOrderExcurs = 4;
  ordOrderVisa = 5;
  ordOrderResort = 6;
  ordOrderOther = 7;

  ordTypeDiscTourist = 1;
  ordTypeDiscAgent   = 2;
  
type
  TOrderService = ordOrderTrip..ordOrderOther;
  TOrderServices = set of ordOrderTrip..ordOrderOther; //TOrderService;

function GetServiceName(Code: Integer): String;

const
  sOrderServDataSet: array[TOrderService] of String = (
    'Places', 'HtlRooming', '', 'PersInsures',
    'PersExcurs', 'PersVisas', 'PersResortTaxes', 'PersOtherServs');
  {sOrderServDataFld: array[TOrderService] of String = (
    'PlaceId', 'RoomingId', '', , 'InsureId',
    'PersExcursId', 'PersVisaId', 'ResortTaxId', 'OtherServId');}

{ calc default OrderReservTo value }

function GetDefaultOrderReservTo(OrderDateTime: TDateTime): TDateTime;
function GetMaximalOrderReservTo(OrderDateTime, TourDateTime: TDateTime): TDateTime;
function GetOptimalOrderReservTo(OrderDateTime, TourDateTime: TDateTime): TDateTime;

{ childs }

const
  // in passport
  sPassportInPass = 'INPASS';
  sSeparator = ',';
  nDefauldChildAgeMax = 12;
  nDefauldChildAgeMax2 = 18;
  nMaxAgeForCzechNotPayVisa = 26;
  nAdultMenMaxAgeForPayVisa = 60;
  nAdultWomenMaxAgeForPayVisa = 55;

function CheckChildAgeByDate(Birth, ByDate: TDateTime): Boolean;
function CheckPersAgeForPayVisa(Birth, ByDate: TDateTime; Sex: string;
  CountryId: Integer): Boolean;
function RegExpp(Fnd, Str: String): Boolean;
procedure DeleteTMPFile;
function ChangeDayLabel(DayCount: Integer; UnitOfTime: Integer = 0): String;
function CheckTrstPassExpire(IssuedDate, ExpireDate, TourDate, FromDate, ToDate: TDateTime;
          DayCount, PassExpireMonths: Integer; PassNo: string): String;
function GetSpecDateLogoFileName(const FileName: String): String;
function GetSpecDateLogoFileFolder: String;
function GetPosadaName(PosadaId: Integer): string;

function GetNetAgencyFileName(const FileName: String): String;
function GetNetAgencyLogoFileFolder: String;
function GetFlagLogoFileFolder: String;
//function DiscAge(DAge: Integer): Integer;
function CheckCorrectDate(aDateEdit, ReestrDate: TDateTime;
  aTag: Integer): Boolean;

const
  nFillingValidDays = 3;

function IsHoliday(D: TDateTime; HolidayList: TStrings): Boolean;  
function CalcFillingFromDate(aDate: TDateTime; 
  const Holidays: String): TDateTime;
function CalcFillingTillDate(aDate: TDateTime; 
  const Holidays: String; ReadyToDays: Integer): TDateTime;
function ColorToHTML(const Color: TColor): string;

function GetUserListIdForElememt(aElem: TDBShema; 
  aElement: string; aSeparator: string = ';'): Variant;
  
implementation

uses SysUtils, Math, OptSet, TourCmnlIf,  RegExpr;

{ pay method naming}

const
  {$WARN UNSAFE_TYPE OFF}
  {$WARN UNSAFE_CODE OFF}
  pRstrPayMethod: array[nPayMethodCash..nPayMethodLast] of Pointer = (
    @SPayDlgMethod0, @SPayDlgMethod1, @SPayDlgMethod2, @SPayDlgMethod3,
    @SPayDlgMethod4, @SPayDlgMethod5, @SPayDlgMethod6, 
    @SPayDlgMethod7);
  pRstrPayMethDoc: array[nPayMethodCash..nPayMethodLast] of Pointer = (
    @SPayDlgMethDoc0, @SPayDlgMethDoc1, @SPayDlgMethDoc2, @SPayDlgMethDoc3,
    @SPayDlgMethDoc4, @SPayDlgMethDoc5, @SPayDlgMethDoc6, 
    @SPayDlgMethDoc7);
  pRstrPayMethDocNew: array[nPayDocBank..nPayDocBank] of Pointer = (
    @SPayDlgMethDoc1);
  pRstrReturnMethDoc: array[nReturnMethodRefund..nReturnMethodRecalc] of Pointer = (
    @sBillRefund, @sBillStorno, @SBillRecalc);
  {$WARN UNSAFE_CODE ON}
  {$WARN UNSAFE_TYPE ON}      

function PayMethodIdent(Id: Integer): string;
begin
  Result := LoadResString(pRstrPayMethod[Id]);
end;

function PayMethodDocumentIdent(Id: Integer): string;
begin
  Result := LoadResString(pRstrPayMethDoc[Id]);
end;

function PayMethodDocumentIdentNew(Id: Integer): string;
begin
  Result := LoadResString(pRstrPayMethDocNew[Id]);
end;

function ReturnMethodDocumentIdent(Id: Integer): string;
begin
  Result := LoadResString(pRstrReturnMethDoc[Id]);
end;

procedure PayMethodIdentsToStrings(Strings: TStrings; AddAsObject: Boolean = False);
begin
  ResourceToStrings(Strings, pRstrPayMethod, AddAsObject);
end;

procedure PayDocumentIdentsToStrings(Strings: TStrings; AddAsObject: Boolean = False);
begin
  ResourceToStrings(Strings, pRstrPayMethDocNew, AddAsObject);
end;

{ order payment state support}

const
  {$WARN UNSAFE_CODE OFF}
  {$WARN UNSAFE_TYPE OFF}
  pOrderPaymentStateNames: array[TOrderPaymentState] of Pointer =
  (@SVDlgsStateNameFinished, @SVDlgsStateNameTimeOut, @SVDlgsStateNameNotPaid,
    @SVDlgsStateNamePartPaid, @SVDlgsStateNamePaid, @SVDlgsStateNameAnnulled,
    @SVDlgsStateNameOverPaid, @SVDlgsStateNameNullPay);
  pPlacePayStateNames: array[TPlacePayState] of Pointer =
  (@SPlaceFrmStateNmFree, @SPlaceFrmStateNmTimeOut, @SPlaceFrmStateNmNotPaid,
    @SPlaceFrmStateNmPartPaid, @SPlaceFrmStateNmPaid, @SPlaceFrmStateNmInQueue,
    @SPlaceFrmStateNmOverPaid, @SPlaceFrmStateNmReserve, @SPlaceFrmStateNmInaccessible);
  pDiscountCalcTypes: array[TDiscountCalcType] of Pointer =
  (@SOrderFrmDiscountCalcClient, @SOrderFrmDiscountCalcOur, @SOrderFrmDiscountCalcNone);
  {pPlacePayStateIdents: array[TPlacePayState] of Pointer =
    (@SPlaceFrmStateIdFree, @SPlaceFrmStateIdTimeOut, @SPlaceFrmStateIdNotPaid,
     @SPlaceFrmStateIdPartPaid, @SPlaceFrmStateIdPaid, @SPlaceFrmStateIdInQueue,
     @SPlaceFrmStateIdInaccessible);}
  {$WARN UNSAFE_CODE ON}
  {$WARN UNSAFE_TYPE ON}

function CalcOrderPaymentState(State, State2: Integer): Integer;
begin
  if State in [ordFinished, ordAnnuled] then Result := State
  else if State = ordNullPay then Result := State2
  else if State2 = ordNullPay then Result := State                                
  else if (State = ordPartPay) or (State2 = ordPartPay) then Result := ordPartPay
  else if (State = ordTimeOut) and (State2 = ordTimeOut) then Result := ordTimeOut
  else if (State = ordNotPaid) and (State2 = ordNotPaid) then Result := ordNotPaid
  else if (State = ordPaid) and (State2 = ordPaid) then Result := ordPaid
  else if (State = ordPaid) and (State2 = ordOverPay)
      or (State2 = ordPaid) and (State = ordOverPay)
    then Result := ordOverPay
  else Result := ordPartPay;
end;

function GetOrderStateColor(
  OrderState: Integer; ActiveOrder: Boolean = False): TColor;
var Shift: Integer;
begin
  if ActiveOrder then Shift := plcInaccessible else Shift := 0;
  case OrderState of
    ordFinished: Result := OptionSet.Colors[0 + Shift];
    ordTimeOut: Result := OptionSet.Colors[1 + Shift];
    ordNotPaid: Result := OptionSet.Colors[2 + Shift];
    ordPartPay: Result := OptionSet.Colors[3 + Shift];
    ordPaid: Result := OptionSet.Colors[4 + Shift];
    ordOverPay: Result := OptionSet.Colors[6 + Shift];
    ordAnnuled: Result := OptionSet.Colors[0 + Shift];
    else Result := clInfoBk;
  end;
end;

function GetOrderPaymentStateName(State: Integer): string;
begin
  Result := LoadResString(pOrderPaymentStateNames[State]);
end;

function GetPlacePayStateName(State: Integer): string;
begin
  Result := LoadResString(pPlacePayStateNames[State]);
end;

function GetPersonRefusedByAnnulList: String;
begin
  Result :=
    Format('%d, %d', [prfPersonRefuseByOneAnnul, prfPersonRefuseByOrdAnnul]);
end;

function GetPersonRefusedByOtherList: String;
begin
  Result := Format('%d, %d', [prfPersonRefuseByOneself, prfPersonRefuseByEmbassy]);
end;

function GetSQLWhereRefused(
  const RefuseByField: String; HideRefused, HideAnnuled: Boolean): String;
const
  sSQLRefuseNot = '%s is null';
  sSQLRefuseBy = '%s in (%s)';
begin
  Result := Format(sSQLRefuseNot, [RefuseByField]);
  if not HideRefused then
    Result := SQLWhereStatementOr(Result,
      Format(sSQLRefuseBy, [RefuseByField, GetPersonRefusedByOtherList]));
  if not HideAnnuled then
    Result := SQLWhereStatementOr(Result,
      Format(sSQLRefuseBy, [RefuseByField, GetPersonRefusedByAnnulList]));
  if Result <> '' then Result := '(' + Result + ')';
end;

function GetDocumentStateName(State: Integer): string;
begin
  Result := LoadResString(pDocumentStateIdent[State]);
end;

procedure AssignDiscountCalcTypes(DiscTypeList: TStrings);
var I: Integer;
begin
  DiscTypeList.Clear;
  for I := Low(TDiscountCalcType) to High(TDiscountCalcType) do
    DiscTypeList.Add(LoadResString(pDiscountCalcTypes[I]));
end;

{ cost values of order tiles }

function GetServiceName(Code: Integer): String;
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_TYPE OFF}
const pSrv: array[TOrderService] of Pointer = (
  @SVDlgsSrvTrip, @SVDlgsSrvRoom, @SVDlgsSrvTrfr, @SVDlgsSrvInsr,
  @SVDlgsSrvExks, @SVDlgsSrvVisa, @SVDlgsSrvRsrt, @SVDlgsSrvOthr);
{$WARN UNSAFE_CODE ON}
{$WARN UNSAFE_TYPE ON}
begin
  Result := LoadResString(pSrv[Code]);
end;

{ calc default OrderReservTo value }

function GetDefaultOrderReservTo(OrderDateTime: TDateTime): TDateTime;
begin
  Result := OrderDateTime + OptionSet.OrderReservTime / 24;
end;

function GetMaximalOrderReservTo(OrderDateTime, TourDateTime: TDateTime): TDateTime;
begin
  Result := Max(TourDateTime, OrderDateTime + OptionSet.OrderHotReservTime / 24);
end;

function GetOptimalOrderReservTo(OrderDateTime, TourDateTime: TDateTime): TDateTime;
begin
  Result := OrderDateTime + OptionSet.OrderReservTime / 24;
  if Result > TourDateTime then
    Result := GetMaximalOrderReservTo(OrderDateTime, TourDateTime);
end;

{ child }

function CheckChildAgeByDate(Birth, ByDate: TDateTime): Boolean;
begin
  Result := YearAgeByDate(Birth, ByDate) < nDefauldChildAgeMax;
end;

function CheckPersAgeForPayVisa(Birth, ByDate: TDateTime; Sex: string;
  CountryId: Integer): Boolean;
const AgeSex: array [Boolean]
        of Integer = (nAdultWomenMaxAgeForPayVisa, nAdultMenMaxAgeForPayVisa);
var maxAge: Integer;
begin
  if CountryId = nVisaContryIdCzech then maxAge := nMaxAgeForCzechNotPayVisa
  else maxAge := nDefauldChildAgeMax2;
  Result := YearAgeByDate(Birth, ByDate) < maxAge;
//  if not Result
//  then Result := YearAgeByDate(Birth, ByDate) > AgeSex[Sex = '�'];
end;

function RegExpp(Fnd, Str: String): Boolean;
const Expr ='(^|;|,|\x0a)%s(;|,|$)';
var RegExp: TRegExpr;
begin
  RegExp :=  TRegExpr.Create;
  try
    RegExp.Expression := Format(Expr,[Fnd]);
    Result := RegExp.Exec(Str);
  finally
    RegExp.Free
  end;
end;

procedure DeleteTMPFile;
var CurrDir: string;
    FileName :TSearchRec;
    ExistsFile :integer;
begin
  CurrDir := GetCurrentDir;
  ExistsFile := FindFirst(GetCurrentDir + '\*.tmp',faAnyFile,FileName);
  if ExistsFile = 0 then DeleteFile(FileName.Name);
  while (FindNext(FileName) = 0) do
        DeleteFile(FileName.Name);
end;

function ChangeDayLabel(DayCount: Integer; UnitOfTime: Integer = 0): String;
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
const OneDayNight: array[nDay..nUnitLast] of Pointer = (@SOneDay, @SOneNight, @SOneWeek);
      TwoDayNight: array[nDay..nUnitLast] of Pointer = (@STwoDays, @STwoNights, @STwoWeeks);
      nDayNight: array[nDay..nUnitLast] of Pointer = (@SnDays, @SnNights, @SnWeeks);
{$WARN UNSAFE_CODE ON}
{$WARN UNSAFE_TYPE ON}
begin
  if ( DayCount mod 100 ) in [11..14] then Result := LoadResString(nDayNight[UnitOfTime])
  else case DayCount mod 10 of
  1:    Result := LoadResString(OneDayNight[UnitOfTime]);
  2..4: Result := LoadResString(TwoDayNight[UnitOfTime]);
  else  Result := LoadResString(nDayNight[UnitOfTime]);
  end
end;

function CheckTrstPassExpire(IssuedDate, ExpireDate, TourDate, FromDate, ToDate: TDateTime;
          DayCount, PassExpireMonths: Integer; PassNo: string): String;
var
  new_msg: String;
  nach_pass, kon_pass, nach_viza, kon_viza, nach_tour, kon_tour: TDate;
  kol_mes: Byte; //day_pass_visa, day_pass_tour: Byte;
  str_need_pass_expire_visa, str_need_pass_expire_tour: String;
begin
 if not ((PassNo = '') or (PassNo = sPassportInPass)) then
 if ExpireDate = 0
  then Result := SDataModWarningPassportExpireIsNull
  else
   begin
    nach_tour:= Trunc(TOURDATE);
    kon_tour:= nach_tour + DAYCOUNT - 1;
    nach_pass:= Trunc(IssuedDate);
    kon_pass:= Trunc(ExpireDate);
    nach_viza:= Trunc(FROMDATE);
    kon_viza:= Trunc(FROMDATE) + DAYCOUNT - 1;//Trunc(TODATE);
    kol_mes:= PassExpireMonths;

    str_need_pass_expire_visa:= DateToStr(DateAddMonth(kon_viza, kol_mes));
    str_need_pass_expire_tour:= DateToStr(DateAddMonth(kon_tour, kol_mes));
//    day_pass_visa:= Trunc(DateAddMonth(kon_viza, kol_mes)) - Trunc(kon_pass);
//    day_pass_tour:= Trunc(DateAddMonth(kon_tour, kol_mes)) - Trunc(kon_pass);
    new_msg:= '';
    //proverka nachala pasporta
    if (nach_pass > nach_viza) or (nach_pass > nach_tour)
    then new_msg:= '����������� ����� 䳿 �������� ��� �������� ���.';

    Result := new_msg;
    if new_msg<> '' then Exit;

    new_msg:= '';
    //okonchanie proverka nachala pasporta

    //proverka okonchaniya pasporta
    if ( kon_pass <= DateAddMonth(kon_viza, kol_mes) )
       then new_msg:= '����������� ����� 䳿 �������� ��� �������� ���.';

    if kon_pass <= nach_tour
       then
         new_msg:= new_msg + ' ����� 䳿 �������� ���������� �� ���� ������� ����!';
     end;
    if new_msg <> '' then Result := new_msg;
end;
{get path to icon SpecialDate}
function GetSpecDateLogoFileFolder: String;
begin
  Result :=
    IncludeTrailingPathDelimiter(
      IncludeTrailingPathDelimiter(OptionSet.StoreFolder) + 'ServisIcons') +
    'SpecialDate';
end;

function GetSpecDateLogoFileName(const FileName: String): String;
begin
  Result := IncludeTrailingPathDelimiter(GetSpecDateLogoFileFolder) + FileName;
end;

function GetPosadaName(PosadaId: Integer): string;
begin
  case PosadaId of
    nUnEmployedId: Result := '��� ����������';
    nWorkingId: Result := '��� ���������';
    nBusinessmenId: Result := '��� ���������';
    nStudentId: Result := '��� ��������';
    nSchoolBoyId: Result := '��� �����';
    nPensId: Result := '��� ���������';
    nHouseHolderId: Result := '��� �������������';
    nChildId: Result := '��� ����';
  end;
end;

function GetNetAgencyFileName(const FileName: String): String;
begin
  Result := IncludeTrailingPathDelimiter(GetNetAgencyLogoFileFolder) + FileName;
end;

function GetNetAgencyLogoFileFolder: String;
begin
  Result :=
    IncludeTrailingPathDelimiter(
      IncludeTrailingPathDelimiter(OptionSet.StoreFolder) + 'ServisIcons') +
    'NetAgency';
end;

function GetFlagLogoFileFolder: String;
begin
  Result :=
    IncludeTrailingPathDelimiter(
      IncludeTrailingPathDelimiter(OptionSet.StoreFolder) + 'ServisIcons') +
    '_FLAGS';
end;
(*
function DiscAge(DAge: Integer): Integer; {���������� � RateTypes}
begin
  case DAge of
   0 :  Result := 0;
   1..3: Result := 1; //1..4: Result := 1;
   60..65 : Result := 3; //60..69 : Result := 3;
   66..75 : Result := 4; //70..74 : Result := 4;
   76..80 : Result := 5; //75..79 : Result := 5;
   81..85 : Result := 6; //80..84 : Result := 6;
   else Result := 2;
  end
end; *)

function CheckCorrectDate(aDateEdit, ReestrDate: TDateTime;
  aTag: Integer): Boolean;
begin
  Result := aDateEdit > 0;
  if not Result then 
    case aTag of
      0: ErrorDlg(SDataModErrorCompPropDateReestr); 
      1: ErrorDlg(SDataModErrorCompPropDateSingleTax);
      2: ErrorDlg(SZTDlgErrRegFromDateIsNull);
    end
  else 
  begin    
    Result := aDateEdit <= Date;
    if not Result then
      case aTag of
        0: ErrorDlg('���� ��������� ��� �������� ��������� �� ���� ���� ������ ��� ��������.');
        1: ErrorDlg('���� ��������� ��� ������ ������� ������� �� ���� ���� ������ ��� ��������.');
        2: ErrorDlg('���� ��������� ��� ������ ��� �� ���� ���� ������ ��� ��������.');
      end
    else begin 
      Result := aDateEdit >= ReestrDate;
      if not Result then
      case aTag of
        1: ErrorDlg('���� ������� 䳿 ������� ������������� �� ���� ���� ������ �� ���� �������� ���������.');
        2: ErrorDlg('���� ��������� ��������� ��� �� ���� ���� ������ �� ���� �������� ���������.');
      end
    end; 
  end;  
end;
//----------------------------------//
function IsHoliday(D: TDateTime; HolidayList: TStrings): Boolean;
var J: Integer;
begin
  Result := False;
  with HolidayList do
    for J := 0 to Count - 1 do
    begin
      if StrToDateDef(HolidayList.Names[J], 0) = D then
      begin
        Result := True;
        Break;
      end;
    end;
end;

function CalcFillingFromDate(aDate: TDateTime; 
  const Holidays: String): TDateTime;
var HolidayList: TStrings;
    I: Integer;
begin
  HolidayList := TStringList.Create;
  try
    DelimitedToStrings(Holidays, HolidayList);
    Result := Now;
    for I := 1 to nFillingValidDays do
    begin
      Result := Result + 1;
      while (DayOfTheWeek(Result) in [6, 7]) or IsHoliday(Result, HolidayList) do Result := Result + 1;
    end;
    if ((Int(aDate) - 21) - Result) > 0 then Result := Int(aDate) - 21;
  finally
    HolidayList.Free;
  end;
  Result := StartOfTheDay(Result);
end;

function CalcFillingTillDate(aDate: TDateTime; 
  const Holidays: String; ReadyToDays: Integer): TDateTime;
var HolidayList: TStrings;
begin
  HolidayList := TStringList.Create;
  try
    DelimitedToStrings(Holidays, HolidayList);
    Result := Int(aDate) - ReadyToDays - 1;
    while (DayOfTheWeek(Result) in [6, 7]) or IsHoliday(Result, HolidayList) do Result := Result - 1;      
  finally
    HolidayList.Free;
  end;
  Result := EndOfTheDay(Result);
end;

function ColorToHTML(const Color: TColor): string;
var
  ColorRGB: Integer;
begin
  ColorRGB := ColorToRGB(Color);
  Result := Format('#%0.2X%0.2X%0.2X',
    [GetRValue(ColorRGB), GetGValue(ColorRGB), GetBValue(ColorRGB)]);
end;    
             
function GetUserListIdForElememt(aElem: TDBShema; 
  aElement: string; aSeparator: string = ';'): Variant;
const
  sGetTourSellersSQL =
    'select list( distinct ID_TMUSER_INFO, ''%s'' ) SellerList from GET_USERS_FOR_ELEMENTS(''%s'',''%s'')  u ' +
    'left join TMUSERs_INFO t on t.id = u.ID_TMUSER_INFO ' +
    'where ID_TMUSER_INFO is not null  and t.notaccessed = 0 and t.dismissed = 0 ';
var aGetTourSellersSQL: string;
begin                                     
  aGetTourSellersSQL := Format(sGetTourSellersSQL, [aSeparator, aElement, aElem.GetProgName]);
  Result := DBGetValue(aElem.DBGetParamConnect, aGetTourSellersSQL, 'SellerList');
end;
end.

