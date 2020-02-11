select distinct O.CountryId, C.Name, C.Memo, (select FIRST 1 NAME from Countries_LNG WHERE id_lng = 350 and C.countryid = Countries_LNG.id_countries ) Name_Eng
from Infrastructures I
left join ObjectLinks O on O.ObjectId = I.InfraId and O.TableName = 'INFRASTRUCTURES'
left join Countries C on C.CountryId = O.CountryId
