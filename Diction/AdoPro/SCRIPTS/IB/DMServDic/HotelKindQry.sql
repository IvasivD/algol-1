 select HOTELKIND.*,
 ( select Count(Languages.ID) from Languages
  left join HOTELKIND_lng on HOTELKIND_lng.id_lng = Languages.id and HOTELKIND_lng.id_hotelkind = HOTELKIND.id
  where Languages.active_translate is not null and HOTELKIND_lng.id_lng is null ) LNGNOTFOUND,
 ( select sum( HOTELKIND_lng.change_name ) from HOTELKIND_lng where HOTELKIND_lng.id_hotelkind = HOTELKIND.id ) LNGCHANGE

 from HOTELKIND



