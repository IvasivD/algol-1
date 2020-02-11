select O.officeid, O.isdefault, o.HOUSE,o.TENEMENT, ( Select FIRST 1 NAME FROM CITY_PATH_PROC( O.id_city_adm_unit, null,0, 448 ) ) ADDRESS, N.Name as Country
from CompOffices O
 left join Countries N on N.CountryId = O.CountryId
where O.CompanyId = :CompanyId
