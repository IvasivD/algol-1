select Pe.PersonId, Pe.FullName
from CompPersons Pe, Occupations Oc
where Pe.CompanyId = :CompanyId
  and (Pe.Dismissed = 'F' or Pe.Dismissed is null)
  and Pe.Occupation = Oc.Name
  and Oc.kind = :OccupationKind
  and Oc.ORDERKIND = (
    select min(O.orderkind)
    from CompPersons P, Occupations O
    where P.CompanyId = :CompanyId
      and (P.Dismissed = 'F' or P.Dismissed is null)
      and O.Name = P.Occupation
      and O.kind = :OccupationKind)
