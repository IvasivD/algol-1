 select ServGroups.*,
 ( select Count(Languages.ID) from Languages
  left join ServGroups_lng on ServGroups_lng.id_lng = Languages.id and ServGroups_lng.id_servgroups = ServGroups.servicegroupid
  where Languages.active_translate is not null and ServGroups_lng.id_lng is null ) LNGNOTFOUND,
  ( select sum( ServGroups_lng.change_servicegroupname ) from ServGroups_lng where ServGroups_lng.id_servgroups = ServGroups.servicegroupid ) LNGCHANGE

 from ServGroups

