  select SCHEDITEM_TOURS_WEB_TEMPLATE.*,
   ( select Count(Languages.ID) from Languages
  left join SCHED_TOUR_WEB_TEM_LNG on SCHED_TOUR_WEB_TEM_LNG.id_lng = Languages.id and SCHED_TOUR_WEB_TEM_LNG.id_scheditem_tours_web_template =  SCHEDITEM_TOURS_WEB_TEMPLATE.id
  where Languages.active_translate is not null and SCHED_TOUR_WEB_TEM_LNG.id_lng is null ) LNGNOTFOUND,
  ( select sum( SCHED_TOUR_WEB_TEM_LNG.change_representation ) from SCHED_TOUR_WEB_TEM_LNG where SCHED_TOUR_WEB_TEM_LNG.id_scheditem_tours_web_template = SCHEDITEM_TOURS_WEB_TEMPLATE.id ) LNGCHANGE

  from  SCHEDITEM_TOURS_WEB_TEMPLATE
