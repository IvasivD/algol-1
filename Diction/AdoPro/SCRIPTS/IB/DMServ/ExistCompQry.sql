select C.CompanyId, Tr.TradeName ,  C.Name  , C.CompKind from Companies C
left join TradeNames Tr on Tr.TradeNameId = C.TradeNameId
where ((LoCase(C.Name) like :Name) or (LoCase(Tr.TradeName) like :Name)) and C.CompanyId <> :CompanyId
