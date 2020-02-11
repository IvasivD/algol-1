 select RoomExpandNames.*,
   ( select Count(Languages.ID) from Languages
  left join RoomExpandNames_lng on RoomExpandNames_lng.id_lng = Languages.id and RoomExpandNames_lng.id_roomexpandnames = RoomExpandNames.expandnameid
  where Languages.active_translate is not null and RoomExpandNames_lng.id_lng is null ) LNGNOTFOUND,
  ( select sum( RoomExpandNames_lng.change_expandname ) from RoomExpandNames_lng where RoomExpandNames_lng.id_roomexpandnames = RoomExpandNames.expandnameid ) LNGCHANGE,
  ( select sum( RoomExpandNames_lng.CHANGE_EXTNAME ) from RoomExpandNames_lng where RoomExpandNames_lng.id_roomexpandnames = RoomExpandNames.expandnameid ) LNGCHANGE_EX
 from RoomExpandNames

