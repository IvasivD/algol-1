select I.InterestId, I.Name, I.Stars,
  Ci.Name as City,  ( Select NAME FROM COUNTRIES_LNG where ID_COUNTRIES = CO.countryid and ID_LNG = 350 ) COUNTRY_ENG,
  K.name InterestKind, T.NAME InterestType,
  I.CountryId, I.ID_CITY_ADM_UNIT, I.EnterpriseId, I.ShowWeb, I.Comments
from Interests I
  left join Countries Co on Co.CountryId = I.CountryId
  left join CITY_ADM_UNIT Ci on Ci.Id = I.ID_CITY_ADM_UNIT
  left join INTERESTKIND K on K.id = I.InterestKind
  left join INTERESTTYPE T on T.Id = I.InterestType
order by I.Name, I.Stars desc, I.InterestId
