select C.CompanyId, C.Name as EmbassyName,
              E.InProvince ItsKonsul, E.CountryId,
              COALESCE(FUNDINGSUM, 0) FUNDINGSUM, FUNDINGVAL,
              FUNDINGCOUNT, FUNDINGPERIOD,
              COALESCE(BANKSUM, 0) BANKSUM, BANKVAL, BANKCOUNT, BANKPERIOD,
              PERMTRANSFDOC, COALESCE(ONTOURSUM, 0) ONTOURSUM,
              PayBankServ, CurrServ, ReadyToDays, ReadyToType, AutoFilling,
              UseCode, OurFiling, ApplTypeDate,
              ServCost, ServCostVal, E.ParentId, E.CntrEmbassyId,
              Ci.Name CityName, FilingPlaceWork, FullFunding, TYPEFUNDING, E.Comments
              from CntrEmbassies E
              left join Companies C on C.CompanyId = E.EmbassyId
              left join CompOffices Co on Co.CompanyId = C.CompanyId and Co.IsDefault = 'T'
              left join Cities Ci on Ci.CityId = Co.CityId
              where E.CountryId = :CountryId
              and E.OurEmbassy = 'F'
              and ( (E.InProvince is not null) and (E.InProvince <> '') or (E.ForOwnerVisa = 'T') )
              order by Ci.Name, C.Name
