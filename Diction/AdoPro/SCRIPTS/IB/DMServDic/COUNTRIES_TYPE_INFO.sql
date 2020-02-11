  select COUNTRIES_TYPE_INFO.*,
  
  ( select Count(Languages.ID) from Languages
  left join COUNTRIES_TYPE_INFO_lng on COUNTRIES_TYPE_INFO_lng.id_lng = Languages.id and COUNTRIES_TYPE_INFO_lng.id_countries_type_info =  COUNTRIES_TYPE_INFO.id
  where Languages.active_translate is not null and COUNTRIES_TYPE_INFO_lng.id_lng is null ) LNGNOTFOUND,
  ( select sum( COUNTRIES_TYPE_INFO_lng.change_name ) from COUNTRIES_TYPE_INFO_lng where COUNTRIES_TYPE_INFO_lng.id_countries_type_info = COUNTRIES_TYPE_INFO.id ) LNGCHANGE

  from COUNTRIES_TYPE_INFO
