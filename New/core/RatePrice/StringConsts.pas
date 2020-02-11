unit StringConsts;
interface

const

// ����� ��������
  AppNameStr             = '������� ������';

resourcestring
// ���� �������
  RateKindNettoStr       = '�����';
  RateKindBruttoStr      = '������';
  RateKindCombinedStr    = '��������';
  RateAnalysisStr        = '����� ������';

// ������� ���
  LongDateFormatStr      = 'dd.mm.yy';
  ShortDateFormatStr     = 'dd.mm';

//������ � �����
  HotelRegKeyNameStr     = 'Software\Algol\HotelRate';
  CommonSectionStr       = 'CommonParams';

  LastOpenedMenuStr      = 'LastOpenedMenu';
  RecentRatesCountStr    = 'RecentRatesCount';
  LastOpenedStr          = 'LastOpened';
  StandartToolBarStr     = 'StandartToolBar';
  ShowAssistantStr       = 'AgentVisible';
  RuleToolBarStr         = 'RuleToolBar';
  TableToolBarStr        = 'TableToolBar';
  FormatToolBarStr       = 'FormatToolBar';
  EditToolBarStr         = 'EditToolBar';
  StatusBarStr           = 'StatusBar';
  RateListFilterSecStr   = 'RateListFilter';
  RLFilterFromStr        = 'FilterFrom';
  RLFilterDateFromStr    = 'DateFrom';
  RLFilterTimeFromStr    = 'TimeFrom';
  RLFilterTillStr        = 'FilterTill';
  RLFilterDateTillStr    = 'DateTill';
  RLFilterTimeTillStr    = 'TimeTill';
  RLFilterCurrencyStr    = 'FilterCurrency';
  RLFltCurrencyNameStr   = 'Currency';
  RLFilterVendorStr      = 'FilterVendor';
  RLFltVendorNameStr     = 'Vendor';

// ����� ������
  LongRateNameStr        = '������ %s %s, %s, %s (%s - %s)';
  ShortRateNameStr       = '������ %s %s, %s, %s';

// ����
  RecentMenuStr          = '³����������';

// ����� ������
  InDesignStr            = '�������������';
  ReadyStr               = '�������';
  ActiveStr              = 'ĳ�';
  ClosedStr              = '��������';
  ReadWriteStr           = '�����������';
  ReadOnlyStr            = '���� �������';

// ³��� � ������� �������
  RemoveRateStr          = '������ ����� ����� ?';
  RemoveRateConfirmStr   = '�� ��� ����� ������ ������ �������. �� ����� ������ ������� ����� ?';
  SelectRateCopyFrom     = '������ ����� �� ��� ����� �������� ����� �����';

// ³��� ������������ ���� ������
  NettoBruttoStr         = '�����-������';
  SeasonsStr             = '������';
  FeedsStr               = '���� ����������';
  BerthesStr             = '���������';
  AgesStr                = '³��� �������';
  PeriodsStr             = '������';
  ViewsStr               = '����';
  JoinedTouresStr        = '������ � ������';
  AddNewFeedStr          = '������ ��� ����������';
  AddNewJoinedTourStr    = '������ ������ � �����';
  ModifyFeedStr          = '������ ��� ���������� %s';
  RemoveFeedStr          = '�� �������� ������ �������� ������ ��� ���� ���������� %s ?';
  AddNewViewStr          = '������ ���';
  ModifyViewStr          = '������ ��� "%s"';
  RemoveViewStr          = '�� �������� ������ �������� ������ ��� ���� "%s" ?';
  EnableSeasonStr        = '������� ���������';
  DisableSeasonStr       = '������� �����������';
  EnableAgeStr           = '������� ���������';
  DisableAgeStr          = '������� �����������';
  RemoveAgeStr           = '�� �������� ������� ������� ������ ����� ����� "%s". ���������� ?';
  RemoveSeasonStr        = '�� �������� ������� ������� ������ ������ "%s". ���������� ?';

// ³��� � ��������� �������
  AskForSaveBeforeClose  = '� ������ "%s" � ���������� ����. �������� ����� ��������� ?';
  AskBeforeClose  = '� ������ "%s" � ���������� ������. �������� ����� ��������� ?';

// ��������� ��� �������� � Excel
  fEXCEL_SUM1Str         = '=����(������(%0:s);"";����(������("������";%1:s)="P0";%0:s-%0:s*%1:s;%0:s-%1:s))';
  fEXCEL_SUM2Str         = '=����(������(%0:s);"";����(������("������";%1:s)="P0";%0:s-%1:s*%0:s-(%0:s-%1:s*%0:s)*%2:d/(100+%2:d);%0:s-%1:s-(%0:s-%1:s)*%2:d/(100+%2:d)))';
  fEXCEL_VATStr          = '=����(������(%0:s);"";����(������("������";%1:s)="P0";(%0:s-%1:s*%0:s)*%2:d/(100+%2:d);(%0:s-%1:s)*%2:d/(100+%2:d)))';
  fEXCEL_PROFITStr       = '=����(���(%0:s="";%1:s="");"";%1:s-%0:s)';
  fEXCEL_GLOBALStr       = '=����(�(%0:s="";%1:s="");"";�(%0:s)+�(%1:s))';
  fEXCEL_GLOBAL2Str      = '=����(%0:s="");"";�(%0:s))';
  ExcelLeftHeaderStr     = '&"Arial CYR,Bold"����� : ';
  ExcelRightHeaderStr    = '&�';
  ExcelLeftFooterStr     = '&�';
  ExcelRightFooterStr    = '������� &� � &�';

// ��������� ���� ��������� ������
  RateSemicolonStr       = '����� : ';
  ViewSemicolonStr       = '��� : ';
  RulesSemicolonStr      = '������� :';
  VendorSemicolonStr     = '������������ : ';
  RateNettoStr           = '����� �����';
  ToPayNettoStr          = '�� ������ �����';
  RateBruttoStr          = '����� ������';
  ToPayBruttoStr         = '�� ������ ������';
  ProfitStr              = '������';
  RateStr                = '�����';
  DiscountStr            = '������';
  SummStr                = '����';
  WithoutVATStr          = '��� ���';
  WithVATIncludedStr     = '� �.�. ���';
  VATStr                 = '���';
  GlobalStr              = '��������';
  ToPayStr               = '�� ������';
  RulesStr               = '�������';
  DiscountsStr           = '������';
  AgentDiscountsStr      = '��������';
  CorporateDiscountStr   = '����������';
  PermClientDiscountStr  = '����. �볺��';
  NettoDiscountsStr       = '�����';

// �������
  PerPersonStr           = 'PP';
  SinglePlaceStr         = 'SGL';
  FeedPaymentStr         = '����.����';

// �������
  ErrOpenDatabase        = '������� �������� ���� �����. �������� ���� ���������.';
  ErrCommonDatabase      = '������� ��� ����� � ����� �����.';
  ErrorDelWholeRate      = '������� ��� ������� ������ :'#13#10;

// ����������� ��� �������� ������ ����� ������� DLL
  ErrNoRateForHotel      = '��� ��������� ������ ���� ��������� ������';
  ErrNoRateForParams     = '��� ��������� ���������/��������� ���� ������';
  ErrImpossibleLayout    = '��������� �������� ��� � ������ ����� ���������';

// ����������� ������� � �������
  SAgentCtlShow          = '�������� ��������';
  SAgentCtlHide          = '������� ��������';
  SAgentCtlGreet         = '�����, � %s! � �� ���?';
  SAgentCtlAnounce       = '�����, %s!';
  SAgentSayCompleteStr   = '��� ������!';

// ����������� ����� ���������� ������
  SRateAlredyOpened      = '��� ����� ��� ������� ��� ����������� ����� ������������, ��� � ������ ���. ³������ ����� ��� ������� ?';

//
  CalculateVATStr        = '������������ ���������� ��� �� �������';
implementation

end.
