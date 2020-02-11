Select P.PartnerId, P.PayForServ, C.CurrencyShort, P.CurrId, Cp.Name PartnerName, P.CompanyId, P.EmbassyId
From Partners P
left join Companies Cp on Cp.Companyid = P.Companyid
left join Currency C on C.CurrencyId = P.CurrId
where P.CountryId = :CountryId
