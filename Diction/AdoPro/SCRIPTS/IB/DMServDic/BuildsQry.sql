 select HOTEL_BUILDS.*,

 ( select Count(Languages.ID) from Languages
  left join HOTEL_BUILDS_lng on HOTEL_BUILDS_lng.id_lng = Languages.id and HOTEL_BUILDS_lng.id_hotel_builds = HOTEL_BUILDS.id
  where Languages.active_translate is not null and HOTEL_BUILDS_lng.id_lng is null ) LNGNOTFOUND,
  ( select sum( HOTEL_BUILDS_lng.change_name ) from HOTEL_BUILDS_lng where HOTEL_BUILDS_lng.id_hotel_builds = HOTEL_BUILDS.id ) LNGCHANGE

 from HOTEL_BUILDS
