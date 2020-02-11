select distinct Co.CompanyId,  E.CNTREMBASSYID, Co.Name as EmbassyName, Ci.Name as CityName, E.OurEmbassy, E.CountryId,E.ForOwnerVisa, COALESCE( E.FUNDINGSUM, 0 ) FUNDINGSUM,E.FUNDINGVAL,E.FUNDINGCOUNT, E.FUNDINGPERIOD, E.InProvince,
COALESCE(E.BANKSUM, 0) BANKSUM, E.BANKVAL, E.BANKCOUNT, E.BANKPERIOD,COALESCE(E.ONTOURSUM, 0) ONTOURSUM, E.OurFiling, E.FilingPlaceWork,PERMTRANSFDOC,PAYBANKSERV,READYTODAYS,AUTOFILLING,USECODE,TypeFunding,READYTOTYPE,APPLTYPEDATE,SERVCOST,SERVCOSTVAL,CURRSERV,COMMENTS

from CntrEmbassies E, Companies Co, CompOffices O, Cities Ci
where E.CountryId = :CountryId
  and Co.CompanyId = E.EmbassyId
  and O.CompanyId = Co.CompanyId
  and Ci.CityId = O.CityId
  and Co.AsAmbas = 'T'
order by Co.Name, Ci.Name
