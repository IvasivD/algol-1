  select Services.*,
   ( select Count(Languages.ID) from Languages
  left join Services_LNG on Services_LNG.id_lng = Languages.id and Services_LNG.id_services =  Services.serviceid
  where Languages.active_translate is not null and Services_LNG.id_lng is null ) LNGNOTFOUND,
  ( select sum( Services_LNG.change_name ) from Services_LNG where Services_LNG.id_services = Services.serviceid ) LNGCHANGE

  from Services where ServGroupId = :SERVICEGROUPID

