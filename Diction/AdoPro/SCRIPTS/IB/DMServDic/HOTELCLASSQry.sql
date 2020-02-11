 select  HOTELCLASS.* ,
 ( select Count(Languages.ID) from Languages
  left join HOTELCLASS_lng on HOTELCLASS_lng.id_lng = Languages.id and HOTELCLASS_lng.id_hotelclass = HOTELCLASS.id
  where Languages.active_translate is not null and HOTELCLASS_lng.id_lng is null ) LNGNOTFOUND,
  ( select sum( HOTELCLASS_lng.change_name ) from HOTELCLASS_lng where HOTELCLASS_lng.id_hotelclass = HOTELCLASS.id ) LNGCHANGE

 from HOTELCLASS
