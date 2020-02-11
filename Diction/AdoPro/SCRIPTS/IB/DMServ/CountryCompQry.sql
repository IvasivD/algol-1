select C.CountryId, C.Name,  (select FIRST 1 NAME from Countries_LNG WHERE id_lng = 350 and C.countryid = Countries_LNG.id_countries ) LatName
from Countries C
where exists (select * from CompOffices O where O.CountryId = C.CountryId)
