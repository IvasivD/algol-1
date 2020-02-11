select N.CompNoteId, N.Memo, N.Deleted,
N.AddDate, M.Manager AddManager, N.DelDate, D.Manager DelManager,
N.TypeNote, T.Name TypeNoteName, N.CategoryNote, N.Ndate,
case
when
Exists (Select CompNoteId from CompNotes
where CompNoteId > N.CompNoteId and typenote = N.typenote
and CategoryNote = N.CategoryNote
and AddDate < N.Ndate  and CompanyId = :CompanyId)
or (N.Ndate >= Cast('NOW' as Date))
then 'T'
else 'F'
end FixNDate
from CompNotes N
left join TmUser_view M on M.TmUserId = N.AddManId
left join TmUser_view D on D.TmUserId = N.DelManId
left join TypeNote T on T.Id = N.TypeNote
where N.CompanyId = :CompanyId

order by AddDate
