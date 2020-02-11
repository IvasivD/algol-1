select  Co.CompanyId, Co.Name EmbassyName,
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
            left join Companies Co on Co.CompanyId = E.EmbassyId
            left join CompOffices Cof on Cof.CompanyId = Co.CompanyId and Cof.IsDefault = 'T'
            left join Cities Ci on Ci.CityId = Cof.CityId
          where E.ParentId = :CntrEmbassyId and (E.NotUsed is null or (E.NotUsed = 'F'))
            order by Co.Name
