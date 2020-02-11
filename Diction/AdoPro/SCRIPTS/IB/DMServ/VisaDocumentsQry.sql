select D.visadocumentid, D.docid, D.isuse , N.Name DocName, D.NeedCount, D.AgeRestriction, D.ExpireMonths, D.comments
from VISADOCUMENTS_NEW D, PERSONDOCUMENTS N
where D.CountryId = :CountryId and N.ID = D.DocId

