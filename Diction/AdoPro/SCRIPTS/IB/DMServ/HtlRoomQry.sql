select H.HotelRoomId, H.RoomTypeId,  H.Capacity,
  H.HotelId, H.BuildId, H.Comments, H.ChildTo,
  H.RoomCount, H.AddCapacity, H.MinPerson, H.AddCapAdult, H.Deleted,
  H.ExpandNameId,
  H.RoomArea, H.Imported,

 ( select Count(Languages.ID) from Languages
  left join ROOMTYPES_lng on ROOMTYPES_lng.id_lng = Languages.id and ROOMTYPES_lng.id_roomtypes = H.RoomTypeId
  where Languages.active_translate is not null and ROOMTYPES_lng.id_lng is null ) LNGNOTFOUND,
  ( select sum( ROOMTYPES_lng.change_roomtype ) from ROOMTYPES_lng where ROOMTYPES_lng.id_roomtypes = H.RoomTypeId ) LNGCHANGE

from HtlRooms H
  where H.BuildId = :HotelBuildId
