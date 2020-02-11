Select  C.ID, C.ID_COUNTRY, C.NAME, C.ID_ADMIN_UNIT, Cnt.name COUNTRY,  C.SHOWWEB, MC.NAME Capital
from CITY_ADM_UNIT C
left join CITY_ADM_UNIT MC on C.ID_MAIN_CITY = MC.id
left join ADMIN_UNIT on C.id_admin_unit = ADMIN_UNIT.id
left join Countries Cnt on Cnt.CountryId = C.ID_COUNTRY
where ADMIN_UNIT.ID = 1 and C.id_country = 1

