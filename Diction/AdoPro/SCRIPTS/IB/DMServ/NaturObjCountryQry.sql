select distinct O.CountryId, C.Name, C.Memo, 
( Select NAME FROM COUNTRIES_LNG where ID_COUNTRIES =C.countryid and ID_LNG = 350 ) NAME_ENG

from NaturObjects N
left join ObjectLinks O on O.ObjectId = N.NaturObjectId and O.TableName = 'NATUROBJECTS'
left join Countries C on C.CountryId = O.CountryId
order by C.Name
