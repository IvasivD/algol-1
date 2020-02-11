 select SERVICE_TYPE.*,

  ( select Count(Languages.ID) from Languages
  left join SERVICE_TYPE_LNG on SERVICE_TYPE_LNG.id_lng = Languages.id and SERVICE_TYPE_LNG.id_service_type =  SERVICE_TYPE.id
  where Languages.active_translate is not null and SERVICE_TYPE_LNG.id_lng is null ) LNGNOTFOUND,
  ( select sum( SERVICE_TYPE_LNG.change_name ) from SERVICE_TYPE_LNG where SERVICE_TYPE_LNG.id_service_type = SERVICE_TYPE.id ) LNGCHANGE

  from SERVICE_TYPE

