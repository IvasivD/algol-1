select E.HotelId as EntId, cast( K.Name as varchar(200)) as EntKind
from Hotels E, HOTELKIND K
where E.EnterpriseId = :CompanyId and K.Id = E.HotelKind
union
select E.InterestId as EntId, cast( K.Name as varchar(200)) as EntKind
from Interests E, INTERESTTYPE K
where E.EnterpriseId = :CompanyId and K.ID = E.InterestType
