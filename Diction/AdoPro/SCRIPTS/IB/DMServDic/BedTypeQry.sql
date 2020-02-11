 select BedTypes.*,
   ( select Count(Languages.ID) from Languages
  left join BedTypes_lng on BedTypes_lng.id_lng = Languages.id and BedTypes_lng.id_bedtypes = BedTypes.bedtypeid
  where Languages.active_translate is not null and BedTypes_lng.id_lng is null ) LNGNOTFOUND,
  ( select sum( BedTypes_lng.change_name ) from BedTypes_lng where BedTypes_lng.id_bedtypes = BedTypes.bedtypeid ) LNGCHANGE,
  ( select sum( BedTypes_lng.change_shortname ) from BedTypes_lng where BedTypes_lng.id_bedtypes = BedTypes.bedtypeid ) LNGCHANGE_SH
 from BedTypes
