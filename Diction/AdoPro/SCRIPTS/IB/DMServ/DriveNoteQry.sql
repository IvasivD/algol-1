select N.LeavingId, N.DriveNoteId, N.Memo, N.Deleted,
  N.AddDate, M.Manager as AddManager,
  N.DelDate, D.Manager as DelManager,
  N.DriveId
from DriveNotes N
  left join TmUser_view M on M.TmUserId = N.AddManId
  left join TmUser_view D on D.TmUserId = N.DelManId
where N.DriveId = :DriveId
order by N.AddDate desc, N.DriveNoteId desc
