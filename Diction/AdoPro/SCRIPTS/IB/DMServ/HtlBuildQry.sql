select H.HotelBuildId, H.HotelId, H.BuildId, H.Deleted, H.Comments,  H.Stars,
 ( select Count(Languages.ID) from Languages
  left join HOTEL_BUILDS_lng on HOTEL_BUILDS_lng.id_lng = Languages.id and HOTEL_BUILDS_lng.id_hotel_builds = H.buildid
  where Languages.active_translate is not null and HOTEL_BUILDS_lng.id_lng is null ) LNGNOTFOUND,
  ( select sum( HOTEL_BUILDS_lng.change_name ) from HOTEL_BUILDS_lng where HOTEL_BUILDS_lng.id_hotel_builds = H.buildid ) LNGCHANGE

from HtlBuilds H
where H.HotelId = :HotelId
