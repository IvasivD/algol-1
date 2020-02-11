select HtlImages.*, R.BuildId from HtlImages
    left join HtlRooms R on R.HotelRoomId = HtlImages.ObjectId
    where HtlImages.HotelId = :HotelId
order by HtlImages.ImgKind, HtlImages.OrderNo
