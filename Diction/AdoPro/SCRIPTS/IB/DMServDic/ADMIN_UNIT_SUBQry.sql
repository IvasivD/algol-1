 select ADMIN_UNIT_SUB.*,

  ( select Count(Languages.ID) from Languages
    left join ADMIN_UNIT_SUB_lng on ADMIN_UNIT_SUB_lng.id_lng = Languages.id and ADMIN_UNIT_SUB_lng.id_admin_unit_sub = ADMIN_UNIT_SUB.id
    where Languages.active_translate is not null and ADMIN_UNIT_SUB_lng.id_lng is null ) LNGNOTFOUND,
  ( select sum( ADMIN_UNIT_SUB_lng.change_name ) from ADMIN_UNIT_SUB_lng where ADMIN_UNIT_SUB_lng.id_admin_unit_sub = ADMIN_UNIT_SUB.id ) LNGCHANGE

 from ADMIN_UNIT_SUB where ID_ADMIN_UNIT = :ID
