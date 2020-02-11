Select T.TAXSYSTEMID, T.TAXNAME, D.PAYER, T.COMMENTS,
       D.INCOMETAXABS, D.INCOMETAXVAL, D.PDVSUM, SingleTax, D.TaxDetailId
 from TaxSystem T
 left join TaxSystemDetails D on D.TaxSystemId = T.TaxSystemId
 where FromDate <= 'Now' and (ToDate is null or (ToDate >= 'Now') )
