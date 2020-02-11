select V.InterestId, V.InterestVendorId, C.CompanyId, C.Name
from IntrstVendors V, Companies C
where V.InterestId = :InterestId and V.VendorId = C.CompanyId
order by C.Name
