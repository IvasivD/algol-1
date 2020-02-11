select COUNTRIES_INFO.ID, COUNTRIES_INFO.id_countries_type_info, COUNTRIES_TYPE_INFO.NAME,COUNTRIES_TYPE_INFO.table_ind, COUNTRIES_INFO.id_value,  COUNTRIES_INFO.AVALUE,
COUNTRIES_INFO.id_unit_measur,
CASE
   WHEN COUNTRIES_TYPE_INFO.table_ind = 1 THEN ( select CITIES.NAME from CITIES WHERE CITIES.cityid =  COUNTRIES_INFO.id_value )
   WHEN COUNTRIES_TYPE_INFO.table_ind = 2 THEN ( select languages.NAME from languages WHERE languages.id =  COUNTRIES_INFO.id_value )
   WHEN COUNTRIES_TYPE_INFO.table_ind = 3 THEN ( select FORM_GOVERNMENT.NAME from FORM_GOVERNMENT WHERE FORM_GOVERNMENT.id =  COUNTRIES_INFO.id_value )
   WHEN COUNTRIES_TYPE_INFO.table_ind = 4 THEN ( select currency.currencyshort from currency WHERE currency.currencyid =  COUNTRIES_INFO.id_value )
   WHEN COUNTRIES_TYPE_INFO.table_ind = 5 THEN ( select POWER_VOLT_FREQ.avalue from POWER_VOLT_FREQ WHERE POWER_VOLT_FREQ.id =  COUNTRIES_INFO.id_value )
   WHEN COUNTRIES_TYPE_INFO.table_ind = 6 THEN ( select TYPE_POW_SOCKETS.name from TYPE_POW_SOCKETS WHERE TYPE_POW_SOCKETS.id =  COUNTRIES_INFO.id_value )
   WHEN COUNTRIES_TYPE_INFO.table_ind = 7 THEN (select religion.name from religion WHERE religion.ID =  COUNTRIES_INFO.id_value )
   WHEN COUNTRIES_TYPE_INFO.table_ind = 8 THEN (select INTERNACIONAL_ORG.name from INTERNACIONAL_ORG WHERE INTERNACIONAL_ORG.ID =  COUNTRIES_INFO.id_value )
   WHEN COUNTRIES_TYPE_INFO.table_ind = 9 THEN (select TIME_ZONE.NAME from TIME_ZONE WHERE TIME_ZONE.ID =  COUNTRIES_INFO.id_value )
   WHEN COUNTRIES_INFO.id_unit_measur is not null THEN ( select UNIT_MEASUR.short from UNIT_MEASUR where id =  COUNTRIES_INFO.id_unit_measur )
ELSE null
END as ADDVALUE, ID_COUNTRIES 
from COUNTRIES_INFO
left join COUNTRIES_TYPE_INFO on COUNTRIES_TYPE_INFO.id = COUNTRIES_INFO.id_countries_type_info
where ID_COUNTRIES = :COUNTRYID
