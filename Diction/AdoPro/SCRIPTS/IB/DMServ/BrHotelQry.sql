select H.*,
      G.Name HotelGroup, C.Name CityName,
     ( Select NAME FROM COUNTRIES_LNG where ID_COUNTRIES = H.countryid and ID_LNG = 350 ) COUNTRY_ENG,
      ( select sum((N.Capacity + N.AddCapacity) * N.RoomCount) from HtlRooms N
        where N.HotelId = H.HotelId and (N.Deleted is null or N.Deleted = 'F') ) HotelCapacity ,
      ( CASE
       WHEN (exists (select * from htlrooming r where r.hotelid = H.HotelId )
            or exists (select * from htlroommaps r where r.hotelid = H.HotelId ) ) THEN 'T'
       ELSE 'F'
      END ) AreRoom ,
      ( CASE
       WHEN (exists (select * from ImportHotelLog hl where hl.hotelid = H.HotelId )) THEN 'T'
       ELSE 'F'
       END) Imported,
      ( select cast(K.name as varchar(15)) from HOTELKIND K
       where K.id = H.hotelkind ) HotelKindName,
  
    ( select Count(Languages.ID) from Languages
      left join hotels_lng on hotels_lng.id_lng = Languages.id and hotels_lng.ID_HOTELS = H.HOTELID
      where Languages.active_translate is not null and hotels_lng.id_lng is null ) LNGNOTFOUND,
    ( select sum(hotels_lng.change_name ) from hotels_lng where hotels_lng.ID_HOTELS = H.HOTELID ) LNGCHANGE ,

    ( select Count(Languages.ID) from Languages
      left join HOTELCLASS_lng on HOTELCLASS_lng.id_lng = Languages.id and HOTELCLASS_lng.id_hotelclass = H.CATCLASS1
      where Languages.active_translate is not null and HOTELCLASS_lng.id_lng is null and H.catclass1 is not null ) LNGNOTFOUND_CL1,
    ( select sum(HOTELCLASS_lng.change_name ) from HOTELCLASS_lng where HOTELCLASS_lng.id_hotelclass = H.CATCLASS1 ) LNGCHANGE_CL1,

    ( select Count(Languages.ID) from Languages
      left join HOTELCLASS_lng on HOTELCLASS_lng.id_lng = Languages.id and HOTELCLASS_lng.id_hotelclass = H.catclass2
      where Languages.active_translate is not null and HOTELCLASS_lng.id_lng is null and H.catclass2 is not null ) LNGNOTFOUND_CL2,
    ( select sum(HOTELCLASS_lng.change_name ) from HOTELCLASS_lng where HOTELCLASS_lng.id_hotelclass = H.CATCLASS2 ) LNGCHANGE_CL2,

    ( select Count(Languages.ID) from Languages
      left join HOTELCLASS_lng on HOTELCLASS_lng.id_lng = Languages.id and HOTELCLASS_lng.id_hotelclass = H.catclass3
      where Languages.active_translate is not null and HOTELCLASS_lng.id_lng is null and H.catclass3 is not null  ) LNGNOTFOUND_CL3,
    ( select sum(HOTELCLASS_lng.change_name ) from HOTELCLASS_lng where HOTELCLASS_lng.id_hotelclass = H.CATCLASS2 ) LNGCHANGE_CL3

    from Hotels H
      left join HtlGrps G on G.HotelGroupId = H.GroupId
      left join CITY_ADM_UNIT C on C.Id = H.ID_CITY_ADM_UNIT
      where  H.ID_CITY_ADM_UNIT =  :ID
