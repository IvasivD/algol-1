select C.TaxDetailId, T.TaxSystemId, C.FromDate, C.ToDate, C.ManId, C.EditDate, u.manager, C.COMPANYID,
  T.TaxName, D.incometaxabs, D.incometaxval, D.payer, D.PdvSum, D.ToDate TaxSystemToDate,
C.SINGLETAXTYPEID, C.TAXPAYTYPEID, C.TAXPAYCODE, C.TAXPAYREGDATE, comptaxsystemlogid
From CompTaxSystemLog C
left join TaxSystemDetails D on D.TaxDetailId = C.TaxDetailId
left join TaxSystem T on t.TaxSystemId = D.TaxSystemId
left join tmuser_view U on U.tmuserid = C.ManId
where C.CompanyId = :CompanyId
order by C.FromDate
