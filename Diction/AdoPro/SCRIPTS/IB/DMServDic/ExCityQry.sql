select  distinct E.id_city_adm_unit ID, E.countryid ID_COUNTRY,
  CASE
   When ( E.id_city_adm_unit > 0  ) then Ci.Name
   else ( select name from CITY_ADM_UNT_ITEMS_TYPE where id_parent_fortree = E.id_city_adm_unit )
  END CITYNAME,
   CASE
    When ( E.id_city_adm_unit > 0  ) then ( select NAME from CITY_ADM_UNT_ITEMS_TYPE_LNG WHERE id_lng = 350 and E.id_city_adm_unit = CITY_ADM_UNT_ITEMS_TYPE_LNG.id_adm_unt_items_type )
    else ( select CITY_ADM_UNT_ITEMS_TYPE_LNG.NAME from CITY_ADM_UNT_ITEMS_TYPE_LNG
          left join CITY_ADM_UNT_ITEMS_TYPE on CITY_ADM_UNT_ITEMS_TYPE.id = CITY_ADM_UNT_ITEMS_TYPE_LNG.id_adm_unt_items_type
          where CITY_ADM_UNT_ITEMS_TYPE_LNG.id_lng = 350 and E.id_city_adm_unit = CITY_ADM_UNT_ITEMS_TYPE.id_parent_fortree )
    END Name_Eng,
    CASE When ( E.id_city_adm_unit > 0  ) then
    ( select Count(Languages.ID) from Languages
      left join CITY_ADM_UNIT_lng on CITY_ADM_UNIT_lng.id_lng = Languages.id and CITY_ADM_UNIT_lng.id_CITY_ADM_UNIT = E.id_city_adm_unit
     where Languages.active_translate is not null and CITY_ADM_UNIT_lng.id_lng is null )
    else (
      select Count(Languages.ID) from Languages
      left join CITY_ADM_UNT_ITEMS_TYPE_LNG on CITY_ADM_UNT_ITEMS_TYPE_LNG.id_lng = Languages.id
      left join CITY_ADM_UNT_ITEMS_TYPE on CITY_ADM_UNT_ITEMS_TYPE.id = CITY_ADM_UNT_ITEMS_TYPE_LNG.id_adm_unt_items_type and CITY_ADM_UNT_ITEMS_TYPE_LNG.id_adm_unt_items_type = CITY_ADM_UNT_ITEMS_TYPE.id_parent_fortree
      where Languages.active_translate is not null and CITY_ADM_UNT_ITEMS_TYPE_LNG.id_lng is null )
    END LNGNOTFOUND,
   ( select sum( CITY_ADM_UNIT_lng.change_name ) from CITY_ADM_UNIT_lng where CITY_ADM_UNIT_lng.id_CITY_ADM_UNIT = E.id_city_adm_unit ) LNGCHANGE,

   ( Select FIRST 1 NAME FROM CITY_PATH_PROC( Ci.ID_PARENT , null, 0,448 ) ) NAMEPATH
from EXCURSION E
left join CITY_ADM_UNIT Ci on Ci.Id = E.id_city_adm_unit
left join Countries Co on Co.CountryId = Ci.id_country
where E.CountryId = :CountryId
