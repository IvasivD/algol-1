select N.CompanyId, N.CompanyNoteId, N.Memo, 
  N.AddDate, M.Manager as AddManager,
  N.VIP, N.BlackList
from CompanyNotes N
  left join TmUser_view M on M.TmUserId = N.AddManId
where CompanyId = :CompanyId
