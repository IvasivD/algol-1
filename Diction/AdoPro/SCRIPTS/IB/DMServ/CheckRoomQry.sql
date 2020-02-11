select H.HotelRoomId from HtlRooms H
where H.BuildId = :HotelBuildId and H.RoomTypeId = :RoomTypeId
  and H.HotelRoomId <> :HotelRoomId
  and ((H.ExpandNameId is null and :ExpandNameId = 0) or (H.ExpandNameId = :ExpandNameId))
  and H.Capacity = :Capacity
  and ((H.AddCapacity is null and :AddCapacity = 0) or (H.AddCapacity = :AddCapacity))
  and ((H.AddCapAdult is null and :AddCapAdult = 0) or (H.AddCapAdult = :AddCapAdult))

