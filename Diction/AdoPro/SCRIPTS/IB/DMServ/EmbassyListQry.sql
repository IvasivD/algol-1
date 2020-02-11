 select distinct Co.CompanyId, Co.Name || ', ' || Ci.Name as EmbassyName, E.embassyid, E.countryid, O.countryid OFFICECOUNTRY
  from Companies Co
  left join  CntrEmbassies E on E.EmbassyId = Co.CompanyId and E.CountryId = :COUNTRYID
  left join CompOffices O on O.CompanyId = Co.CompanyId
  left join city_adm_unit Ci on Ci.id = O.id_city_adm_unit
 where Co.AsAmbas = 'T' and E.ParentId is null
 order by Co.Name, Ci.Name