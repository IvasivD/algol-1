select Pe.CompanyId, Pe.PersonId,
  Pe.Name, Pe.SecondName, Pe.Occupation,
  Pe.Dismissed, Pe.NotAccessed,
  Pe.LASTNAME,Pe.ADDMANID, Pe.Memo, Pe.NAMEFORCONTRACT, Pe.ID_COMPOFFICES
from CompPersons Pe

where Pe.CompanyId = :CompanyId
  and (Pe.CompanyId <> :OurCompany or Dismissed is null or Dismissed = 'F')
order by Pe.FullName
