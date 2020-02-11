select O.OfficeId, O.CompanyId, O.CountryId, O.IsDefault, O.ADDMANID, O.HeadOffice, O.OfficeName, O.TENEMENTNULL,
  O.ZipCode, O.StrKind, O.Address, O.House, O.Tenement,
  O.CityKind, Ci.Name as City, O.ID_CITY_ADM_UNIT, O.SALEPOINT, ( select first 1 ADDRESS from COMPANY_OFFICES_ADDRES(O.OfficeId,1,448 ) ) ALLADDRESS,

  (select NAME from CITY_ADM_UNIT_LNG WHERE id_lng = 350 and Ci.ID = CITY_ADM_UNIT_LNG.id_city_adm_unit) City_eng,
  O.ItsMailAddress,
  C.Name as Country, C.Name_eng as Country_eng, C.LatName,
  (select AVALUE from COUNTRIES_INFO where COUNTRIES_INFO.id_countries = C.CountryId and COUNTRIES_INFO.id_countries_type_info = 14 ) CNTRYCODE

from CompOffices O
  left join Countries C on C.CountryId = O.CountryId
  left join CITY_ADM_UNIT Ci on Ci.id_country = O.CountryId and Ci.Id = O.ID_CITY_ADM_UNIT
where O.CompanyId = :COMPANYID
