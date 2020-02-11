select D.*, K.Kind, V.name ClassName, Vend.vendorid, C.name VendorName
from Drive D
left join DrvKinds K on K.DriveKind = D.DriveKind
left join DriveEuroClass V on V.id = D.EuroClass
left join DrvVendors Vend on Vend.driveid = D.driveid
left join Companies C on Vend.vendorid = C.companyid
where  D.DRIVEKIND = :DRIVEKIND
order by K.Kind, D.Model