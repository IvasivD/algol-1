 select COUNTRY_TEMPL_ADM_UNIT.*, admin_unit.name,admin_unit.id_city_adm_unt_items_type,

 ( select Count(Languages.ID) from Languages
  left join admin_unit_lng on admin_unit_lng.id_lng = Languages.id and admin_unit_lng.id_admin_unit = COUNTRY_TEMPL_ADM_UNIT.id_admin_unit
  where Languages.active_translate is not null and admin_unit_lng.id_lng is null ) LNGNOTFOUND,
  ( select sum( admin_unit_lng.change_name ) from admin_unit_lng where admin_unit_lng.id_admin_unit = COUNTRY_TEMPL_ADM_UNIT.id_admin_unit ) LNGCHANGE

 from COUNTRY_TEMPL_ADM_UNIT
 left join admin_unit on COUNTRY_TEMPL_ADM_UNIT.id_admin_unit = admin_unit.id
 where ID_COUNTRY = :CountryId
