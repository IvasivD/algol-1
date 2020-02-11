select L.logdatetime, S.NAME SubCategName, U.Manager,
   L.LogPrompt, L.LogCategory, L.ContractLogId, L.FileName
from ContractLog L
left join LOG_SUBCATEGORY S on S.SubCategory = L.LogCategory
left join TMUser_View U on U.TmUserId = L.UserId
where ContractId = :CompContractId
Order by L.logdatetime
