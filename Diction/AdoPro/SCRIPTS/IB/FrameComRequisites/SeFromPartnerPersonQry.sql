select CompanyId, PersonId,
  Name, SecondName, FullName, Occupation, SignRight  from CompPersons
where CompanyId = :CompanyId
  and not SecondName is null and not Occupation is null
  and (Dismissed is null or Dismissed <> 'T' or PersonId = :PersonId)
  and NameForContract is not null
order by SignRight, FullName, Occupation
