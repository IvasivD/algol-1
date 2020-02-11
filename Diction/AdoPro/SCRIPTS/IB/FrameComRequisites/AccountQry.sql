select A.CompanyId, A.AccountId, A.BankId,
  A.AccountNo, A.AccountNo2,
  B.Name as BankName, B.Address as BankAddress,
  B.MFO as BankMFO, B.SWIFT as BankSWIFT
from CompAccounts A
  left join Banks B on B.BankId = A.BankId
where A.CompanyId = :CompanyId and A.IsCorresp <> 'T'
order by A.AccountId
