  select KINDSTREET.*,
  ( select Count(Languages.ID) from Languages
  left join KINDSTREET_lng on KINDSTREET_lng.id_lng = Languages.id and KINDSTREET_lng.id_kindstreet =  KINDSTREET.id
  where Languages.active_translate is not null and KINDSTREET_lng.id_lng is null ) LNGNOTFOUND,
  ( select sum( KINDSTREET_lng.change_name ) from KINDSTREET_lng where KINDSTREET_lng.id_kindstreet = KINDSTREET.id ) LNGCHANGE

  from KINDSTREET
