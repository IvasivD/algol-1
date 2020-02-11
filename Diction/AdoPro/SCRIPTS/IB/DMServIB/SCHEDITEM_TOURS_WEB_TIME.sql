  select SCHEDITEM_TOURS_WEB_TIME.*,
  ( select Count(Languages.ID) from Languages
  left join SCHED_TOUR_WEB_TIME_LNG on SCHED_TOUR_WEB_TIME_LNG.id_lng = Languages.id and SCHED_TOUR_WEB_TIME_LNG.id_scheditem_tours_web_time =  SCHEDITEM_TOURS_WEB_TIME.id
  where Languages.active_translate is not null and SCHED_TOUR_WEB_TIME_LNG.id_lng is null ) LNGNOTFOUND,
  ( select sum( SCHED_TOUR_WEB_TIME_LNG.change_representation ) from SCHED_TOUR_WEB_TIME_LNG where SCHED_TOUR_WEB_TIME_LNG.id_scheditem_tours_web_time = SCHEDITEM_TOURS_WEB_TIME.id ) LNGCHANGE

  from SCHEDITEM_TOURS_WEB_TIME

