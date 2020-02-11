 select V.DriveId, V.DriveVendorId, C.CompanyId, C.Name,
 ( select FIRST 1 AVALUE from GET_COMPANY_PARAM (C.CompanyId,'ISPRIVATE') ) ISPRIVATE,
 C.ISVENDOR, C.ISENTERPR, V.vendorid,

 case
     when C.isfiliya = 'T' then C.headofficeid
     else C.companyid
  end CompIdForCntrct,
 case
    when ( ( (C.ORGFORMID is not Null) or (C.IsFiliya = 'T') or (C.OrgFormInName = 'T') )
    and ( C.ISENTERPR is not null or C.ACTIONID Is not Null )
    and ( C.GOVREESTRTYPEID is not Null and C.IDENTCODE Is not Null )
    and ( C.GOVREESTRDATE is not Null and C.TAXPAYSTATEID Is not Null ) ) then 1
  else 0
 end AllDataFill,
 C.ACTIONID,  C.GOVREESTRTYPEID,  C.IDENTCODE, C.GOVREESTRDATE,C.ASRESIDENT

from DrvVendors V
left join Companies C on V.vendorid = C.companyid  
where V.DriveId = :DriveId and V.VendorId = C.CompanyId