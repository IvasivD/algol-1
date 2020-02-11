select Cp.CompanyId, Cp.PersonId,
  Cp.Name, Cp.SecondName, Cp.FullName, Cp.Occupation, Cp.SignRight,
  Cph.AreaCode, Cph.PhoneNo
from CompPersons Cp
left join CompPhones Cph on Cph.PhoneId = Cp.Phone1Id
where Cp.CompanyId = :CompanyId
  and not Cp.SecondName is null and not Cp.Occupation is null
  and (Cp.Dismissed is null or Cp.Dismissed <> 'T')
order by Cp.SignRight, Cp.FullName, Cp.Occupation
