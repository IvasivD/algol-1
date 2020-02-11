select N.Memo from CompNotes N
where N.CompanyId = :CompanyId and N.CompNoteId = (
  select max(M.CompNoteId) from CompNotes M
  where M.CompanyId = :CompanyId)
