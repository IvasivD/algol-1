select Ct.CompContractId, coalesce(Cn.Name, Ct.OnlyRegName) ContractName, Ct.OnlyReg, Ct.ADDMANID,Ct.COMPANYID,Ct.ONLYREGNAME,Ct.OURPERSONID,Ct.ITSPERSONID,
  Ct.FromDate, Ct.TillDate, Ct.WriteDate, Ct.SignDate,
  O.Fullname as OurPerson, P.Fullname as ItsPerson,
  M0.Manager as Creator, M1.Manager as Sender,
  M2.Manager as CopyRcver, M3.Manager as OrigRcver,
  Ct.IsPrinted, Ct.IsSend, Ct.IsRcvCopy, Ct.IsRcvOrig,
  Ct.FileName, Ct.TemplVer, Ct.Comments, Ct.NumContract, 
  Ct.ISSIGN, Ct.ISSENDORIG, Ct.InValid, Ct.IsExtend,
  Ct.RcvCopyDate, Ct.ContractType, Ct.PermReReestr
from CompContracts Ct
  left join CompPersons O on O.PersonId = Ct.OurPersonId
  left join CompPersons P on P.PersonId = Ct.ItsPersonId
  left join TMUSER_VIEW M0 on M0.TmUserId = Ct.AddManId
  left join TMUSER_VIEW M1 on M1.TmUserId = Ct.SndManId
  left join TMUSER_VIEW M2 on M2.TmUserId = Ct.RcvCopyManId
  left join TMUSER_VIEW M3 on M3.TmUserId = Ct.RcvOrigManId
  left join COMP_CONTRACTS_KIND Cn on Cn.ID = Ct.ContractType
where Ct.CompanyId = :CompIdForCntrct
order by Ct.ContractType, Ct.WriteDate, Ct.FromDate, Ct.TillDate, Ct.SignDate
