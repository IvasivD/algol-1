select P.CompanyId, P.OfficeId, P.PhoneId,
  P.CntryCode, P.AreaCode, P.PhoneNo, P.Extention
from CompPhones P
where P.IsFax = 'T' and P.CompanyId = :CompanyId
order by P.CntryCode, P.AreaCode, P.PhoneNo, P.Extention
