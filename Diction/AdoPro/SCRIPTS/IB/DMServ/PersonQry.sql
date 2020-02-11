select Pe.CompanyId, Pe.PersonId, Pe.FullName,
  Pe.Name, Pe.SecondName, Pe.Occupation,
  Pe.Dismissed, Pe.NotAccessed,
  N1.CntryCode || ' ' || N1.AreaCode || ' ' || N1.PhoneNo as Phone1,
  N1.CntryCode as Ph1Cntry, N1.AreaCode as Ph1Area, N1.PhoneNo as Ph1Number, N1.Extention as Ph1Ext,
  N2.CntryCode || ' ' || N2.AreaCode || ' ' || N2.PhoneNo as Phone2,
  N2.CntryCode as Ph2Cntry, N2.AreaCode as Ph2Area, N2.PhoneNo as Ph2Number, N2.Extention as Ph2Ext,
  Nf.CntryCode || ' ' || Nf.AreaCode || ' ' || Nf.PhoneNo as Fax,
  Nf.CntryCode as FaxCntry, Nf.AreaCode as FaxArea, Nf.PhoneNo as FaxNumber, Nf.Extention as FaxExt,
  Pe.E_mail, Pe.MobilPhone, Pe.Mobilhone, Pe.HomePhone,
  Pe.PagerOp, Pe.PagerNo, Pe.WorkIcq, Pe.HomeIcq, Pe.Memo, Pe.HomeSkype,Pe.Phone1Id,Pe.Phone2Id, Pe.FAXID, Pe.LASTNAME,Pe.WORKEMAIL, Pe.ADDMANID
from CompPersons Pe
  left join CompPhones N1 on N1.PhoneId = Pe.Phone1Id
  left join CompPhones N2 on N2.PhoneId = Pe.Phone2Id
  left join CompPhones Nf on Nf.PhoneId = Pe.FaxId
where Pe.CompanyId = :CompanyId
  and (Pe.CompanyId <> :OurCompany or Dismissed is null or Dismissed = 'F')
order by Pe.FullName
