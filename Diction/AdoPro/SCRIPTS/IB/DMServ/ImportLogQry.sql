Select L.*, U.Manager
from IMPORTHOTELLOG L
left join TmUser_View U on U.tmuserid = L.Managerid
where HOTELID = :HOTELID
