unit StringConsts;
interface

const

// Назва аплікації
  AppNameStr             = 'Готельні тарифи';

resourcestring
// типи тарифів
  RateKindNettoStr       = 'Нетто';
  RateKindBruttoStr      = 'Брутто';
  RateKindCombinedStr    = 'Суміщений';
  RateAnalysisStr        = 'Режим аналізу';

// формати дат
  LongDateFormatStr      = 'dd.mm.yy';
  ShortDateFormatStr     = 'dd.mm';

//розділи в реєстрі
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

// Назва тарифу
  LongRateNameStr        = 'готель %s %s, %s, %s (%s - %s)';
  ShortRateNameStr       = 'Готель %s %s, %s, %s';

// Меню
  RecentMenuStr          = 'Відкривались';

// Стани тарифу
  InDesignStr            = 'Розробляється';
  ReadyStr               = 'Готовий';
  ActiveStr              = 'Діє';
  ClosedStr              = 'Закритий';
  ReadWriteStr           = 'Редагування';
  ReadOnlyStr            = 'Лише читання';

// Вікно зі списком тарифів
  RemoveRateStr          = 'Стерти даний тариф ?';
  RemoveRateConfirmStr   = 'Всі дані цього тарифу будуть втрачені. Ви дійсно хочете стерити тариф ?';
  SelectRateCopyFrom     = 'Вкажіть тариф на базі якого створити новий тариф';

// Вікна налаштування рівнів тарифу
  NettoBruttoStr         = 'Нетто-Брутто';
  SeasonsStr             = 'Сезони';
  FeedsStr               = 'Типи харчування';
  BerthesStr             = 'Розміщення';
  AgesStr                = 'Вікові категорії';
  PeriodsStr             = 'Періоди';
  ViewsStr               = 'Види';
  JoinedTouresStr        = 'Звязки з турами';
  AddNewFeedStr          = 'Додати тип харчування';
  AddNewJoinedTourStr    = 'Додати звязок з туром';
  ModifyFeedStr          = 'Змінити тип харчування %s';
  RemoveFeedStr          = 'Ви насправді хочете видалити тарифи для типу харчування %s ?';
  AddNewViewStr          = 'Додати вид';
  ModifyViewStr          = 'Змінити вид "%s"';
  RemoveViewStr          = 'Ви насправді хочете видалити тарифи для виду "%s" ?';
  EnableSeasonStr        = 'Зробити доступним';
  DisableSeasonStr       = 'Зробити недоступним';
  EnableAgeStr           = 'Зробити доступною';
  DisableAgeStr          = 'Зробити недоступною';
  RemoveAgeStr           = 'Ця операція знищить існуючі тарифи вікової групи "%s". Продовжити ?';
  RemoveSeasonStr        = 'Ця операція знищить існуючі тарифи сезону "%s". Продовжити ?';

// Вікно з детальним тарифом
  AskForSaveBeforeClose  = 'В тарифі "%s" є незбережені зміни. Зберегти перед закриттям ?';
  AskBeforeClose  = 'В послузі "%s" є незбережені тарифи. Зберегти перед закриттям ?';

// Константи для експорту в Excel
  fEXCEL_SUM1Str         = '=ЕСЛИ(ЕПУСТО(%0:s);"";ЕСЛИ(ЯЧЕЙКА("формат";%1:s)="P0";%0:s-%0:s*%1:s;%0:s-%1:s))';
  fEXCEL_SUM2Str         = '=ЕСЛИ(ЕПУСТО(%0:s);"";ЕСЛИ(ЯЧЕЙКА("формат";%1:s)="P0";%0:s-%1:s*%0:s-(%0:s-%1:s*%0:s)*%2:d/(100+%2:d);%0:s-%1:s-(%0:s-%1:s)*%2:d/(100+%2:d)))';
  fEXCEL_VATStr          = '=ЕСЛИ(ЕПУСТО(%0:s);"";ЕСЛИ(ЯЧЕЙКА("формат";%1:s)="P0";(%0:s-%1:s*%0:s)*%2:d/(100+%2:d);(%0:s-%1:s)*%2:d/(100+%2:d)))';
  fEXCEL_PROFITStr       = '=ЕСЛИ(ИЛИ(%0:s="";%1:s="");"";%1:s-%0:s)';
  fEXCEL_GLOBALStr       = '=ЕСЛИ(И(%0:s="";%1:s="");"";Ч(%0:s)+Ч(%1:s))';
  fEXCEL_GLOBAL2Str      = '=ЕСЛИ(%0:s="");"";Ч(%0:s))';
  ExcelLeftHeaderStr     = '&"Arial CYR,Bold"Тариф : ';
  ExcelRightHeaderStr    = '&Я';
  ExcelLeftFooterStr     = '&Д';
  ExcelRightFooterStr    = 'сторінка &С з &К';

// Константи назв заголовків тарифу
  RateSemicolonStr       = 'Тариф : ';
  ViewSemicolonStr       = 'Вид : ';
  RulesSemicolonStr      = 'Правила :';
  VendorSemicolonStr     = 'Постачальник : ';
  RateNettoStr           = 'Тариф Нетто';
  ToPayNettoStr          = 'До оплати Нетто';
  RateBruttoStr          = 'Тариф Брутто';
  ToPayBruttoStr         = 'До оплати Брутто';
  ProfitStr              = 'Профіт';
  RateStr                = 'Тариф';
  DiscountStr            = 'Знижка';
  SummStr                = 'Сума';
  WithoutVATStr          = 'без ПДВ';
  WithVATIncludedStr     = 'в т.ч. ПДВ';
  VATStr                 = 'ПДВ';
  GlobalStr              = 'Загально';
  ToPayStr               = 'До оплати';
  RulesStr               = 'Правила';
  DiscountsStr           = 'Знижки';
  AgentDiscountsStr      = 'Агентські';
  CorporateDiscountStr   = 'Корпоратив';
  PermClientDiscountStr  = 'Пост. клієнт';
  NettoDiscountsStr       = 'Нетто';

// Формули
  PerPersonStr           = 'PP';
  SinglePlaceStr         = 'SGL';
  FeedPaymentStr         = 'допл.харч';

// Помилки
  ErrOpenDatabase        = 'Помилка відкриття бази даних. Програму буде завершено.';
  ErrCommonDatabase      = 'Помилка при роботі з базою даних.';
  ErrorDelWholeRate      = 'Помилка при знищенні тарифу :'#13#10;

// Повідомлення при отриманні тарифу через функції DLL
  ErrNoRateForHotel      = 'Для вказаного готелю немає активного тарифу';
  ErrNoRateForParams     = 'Для вказаного розміщення/харчувння немає тарифу';
  ErrImpossibleLayout    = 'Розміщення вказаних осіб в даному номері неможливе';

// Повідомлення повязані з агентом
  SAgentCtlShow          = 'Показати помічника';
  SAgentCtlHide          = 'Сховати помічника';
  SAgentCtlGreet         = 'Привіт, я %s! А ти хто?';
  SAgentCtlAnounce       = 'Привіт, %s!';
  SAgentSayCompleteStr   = 'Уже готово!';

// Повідомлення форми детального тарифу
  SRateAlredyOpened      = 'Цей тариф уже відкрито для редагування іншим користувачем, або в іншому вікні. Відкрити тільки для читання ?';

//
  CalculateVATStr        = 'Автоматичний розрахунок ПДВ від націнки';
implementation

end.
