select FEEDTYPES.*,
  ( select Count(Languages.ID) from Languages
  left join FEEDTYPES_lng on FEEDTYPES_lng.id_lng = Languages.id and FEEDTYPES_lng.id_feedtypes = FEEDTYPES.feedtypeid
  where Languages.active_translate is not null and FEEDTYPES_lng.id_lng is null ) LNGNOTFOUND,

  ( select sum( FEEDTYPES_lng.change_feedname ) from FEEDTYPES_lng where FEEDTYPES_lng.id_feedtypes = FEEDTYPES.feedtypeid ) LNGCHANGE
 from FEEDTYPES
