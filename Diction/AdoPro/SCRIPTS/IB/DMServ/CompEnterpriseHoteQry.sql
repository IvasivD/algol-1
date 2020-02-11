 select COMPANIES.*, HOTELS.hotelid,
  case  when COMPANIES.isfiliya = 'T' then COMPANIES.headofficeid
 else COMPANIES.companyid end CompIdForCntrct
  from COMPANIES
 left join HOTELS on HOTELS.enterpriseid = COMPANIES.companyid
 where HOTELS.hotelid = :hotelid
