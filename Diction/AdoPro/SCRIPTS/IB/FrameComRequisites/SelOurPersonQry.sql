select Cp.CompanyId, Cp.PersonId, Cp.FullName, Cp.Occupation, Cp.SignRight,
    ErrandNo, ErrandFrom, ErrandTo
from CompPersons Cp
left join TMUsers U on U.PersonId = Cp.PersonId
where Cp.CompanyId =  :CompanyId
  and not Cp.SecondName is null and not Cp.Occupation is null
  and (Cp.Dismissed is null or Cp.Dismissed <> 'T' or Cp.PersonId = :PersonId)
  and ((Cp.SignRight = 'A') or (not ErrandNo is Null))
  and NameForContract is not null
order by Cp.SignRight, Cp.FullName, Cp.Occupation
