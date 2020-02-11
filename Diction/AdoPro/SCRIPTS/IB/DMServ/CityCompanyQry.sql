select C.Id, C.Name, (select NAME from CITY_ADM_UNIT_LNG WHERE id_lng = 350 and C.ID = id_city_adm_unit) NAME_ENG
from CITY_ADM_UNIT C
where C.ID_Country = :CountryId and exists (select * from CompOffices O where O.Id_CITY_ADM_UNIT = C.ID )
