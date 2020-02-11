Select Name MISMATCHNAME, D.docid, D.mismatchid,
           D.DocumMismatchId
From DocumMismatch D
left join Mismatch M on M.Id = D.MismatchId
where DocId = :ViewId
