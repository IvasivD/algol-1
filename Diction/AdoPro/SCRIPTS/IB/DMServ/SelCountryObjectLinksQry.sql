select distinct ObjectLinks.countryid, COUNTRIES.name COUNTRINAME
from ObjectLinks
left join COUNTRIES on COUNTRIES.countryid = ObjectLinks.countryid
where ObjectLinks.objectid = :objectid and ObjectLinks.typeobj = :typeobj
