select companies.companyid, companies.Name, TourVendorContracts.id, TourVendorContracts.contractpath
from companies
left join TourVendorContracts on TourVendorContracts.vendorid = companies.companyid
where companies.isvendor = 'T' and
  (select  FIRST 1 AVALUE  from GET_COMPANY_PARAM (companies.CompanyId,'astours'))  = 1
