 select admin_unit.*,
 ( select Count(Languages.ID) from Languages
  left join admin_unit_lng on admin_unit_lng.id_lng = Languages.id and admin_unit_lng.id_admin_unit = admin_unit.id
  where Languages.active_translate is not null and admin_unit_lng.id_lng is null ) LNGNOTFOUND,
  ( select sum( admin_unit_lng.change_name ) from admin_unit_lng where admin_unit_lng.id_admin_unit = admin_unit.id ) LNGCHANGE

 from admin_unit  where ID_CITY_ADM_UNT_ITEMS_TYPE = :ID

