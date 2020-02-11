 select EXCURSION.*, 
 ( select Count(Languages.ID) from Languages
   left join EXCURSION_lng on EXCURSION_lng.id_lng = Languages.id and EXCURSION_lng.id_eid = EXCURSION.eid
   where Languages.active_translate is not null and EXCURSION_lng.id_lng is null ) LNGNOTFOUND,
 ( select sum( EXCURSION_lng.change_name ) from EXCURSION_lng where EXCURSION_lng.id_eid = EXCURSION.eid ) LNGCHANGE

 from EXCURSION
 where EXCURSION.id_city_adm_unit=:ID
