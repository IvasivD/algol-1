Select D.TaxSystemId TAXPAYSTATEID, L.TaxDetailId, L.SINGLETAXTYPEID, L.FromDate SINGLETAXDATE,
    L.TAXPAYCODE, L.TAXPAYTYPEID, L.TAXPAYREGDATE,
    WARRANTYSUM, WARRANTYTERM, LICENSEDATE, LICENSENO, WARRANTYVAL, LICENSETERMIN, Name, TradeNameId
from Companies C
left join CompTaxSystemLog L on L.CompanyId = C.CompanyId and L.FromDate < 'NOW'
  and ((L.ToDate >= 'NOW') or L.ToDate is null)
left join TaxSystemDetails D on D.TaxDetailId = L.TaxDetailId
where C.CompanyId = :CompanyId
