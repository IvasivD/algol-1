SELECT b.bankid, c.BankCorrId, c.CurrencyId, b.Name, b.Address, b.Swift
FROM Banks b, BankCorrs c WHERE c.BankId = b.BankId
