  select L.HotelBuildId, L.LinkId, L.ServiceId,
  S.HaveValue, L.IntValue, S.MeasureUnit,
  L.HaveCost, L.Cost, L.CurrId, L.Comments,
  S.Name, S.LargeIcon, S.SmallIcon, C.CurrencyShort
  from HBldServLnk L
  left join SERVICES S on S.serviceid = L.serviceid
  left join Currency C on C.CurrencyId = L.CurrId
  where L.HotelBuildId = :HotelBuildId
