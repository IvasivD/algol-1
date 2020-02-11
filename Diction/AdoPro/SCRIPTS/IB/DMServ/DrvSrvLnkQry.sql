select DrvServLinks.DriveId, DrvServLinks.LinkId, DrvServLinks.ServiceId,
S.HaveValue, DrvServLinks.IntValue, S.MeasureUnit,
DrvServLinks.HaveCost, DrvServLinks.Cost,DrvServLinks.CurrId, DrvServLinks.Comments,
S.Name, S.LargeIcon, S.SmallIcon, C.CurrencyShort
from DrvServLinks
left join SERVICES S on S.serviceid =DrvServLinks.serviceid
left join Currency C on C.CurrencyId = DrvServLinks.CurrId
where DrvServLinks.DriveId = :DriveId
