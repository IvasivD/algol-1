select C.CompanyId, T.TradeName, Cc.CompContractId, Cc.TillDate
from Companies C
left join CompContracts Cc on Cc.CompanyId = C.CompanyId and
 (Tilldate is Null or (TillDate > 'Now'))
left join TradeNames T on T.TradeNameId = C.TradeNameId
where C.TradeNameId = :TradeNameId and C.HeadOfficeId is not Null
