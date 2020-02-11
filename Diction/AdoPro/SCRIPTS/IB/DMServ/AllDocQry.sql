select Distinct(D.TypeDocId), V.DocId, N.NAME ViewName,
  V.TypeId, L.ItemName TypeName
from VisaDocuments_New D
    left join VisaTypeDocs V on D.TypeDocId = V.VisaTypeDocId
    left join NameLists L on L.NameId = V.TypeId
    left join VISADOC N on N.id = V.DocId
where D.CountryId = :CountryId
