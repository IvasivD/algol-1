select CompTaxSystemLog.TaxDetailId, T.TaxSystemId, CompTaxSystemLog.FromDate, CompTaxSystemLog.ToDate, CompTaxSystemLog.ManId, CompTaxSystemLog.EditDate, u.manager, CompTaxSystemLog.COMPANYID,
T.TaxName, D.incometaxabs, D.incometaxval, D.payer, D.PdvSum, D.ToDate TaxSystemToDate,
CompTaxSystemLog.SINGLETAXTYPEID, CompTaxSystemLog.TAXPAYTYPEID, CompTaxSystemLog.TAXPAYCODE, CompTaxSystemLog.TAXPAYREGDATE, CompTaxSystemLog.comptaxsystemlogid
From CompTaxSystemLog
left join TaxSystemDetails D on D.TaxDetailId = CompTaxSystemLog.TaxDetailId
left join TaxSystem T on t.TaxSystemId = D.TaxSystemId
left join tmuser_view U on U.tmuserid = CompTaxSystemLog.ManId
where CompTaxSystemLog.CompanyId = :CompanyId