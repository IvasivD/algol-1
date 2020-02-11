select D.VISADOCUMENTID,
	 N.name DocName, NT.NAME TypeName, G.GroupName,
	 D.IsUse, sG.name SubGroupName, D.ForInd, D.ForAddManual,
	 D.Returned, D.Transmit, P.name Posada,
	 D.AgeRestriction, D.MarriedState,
	 D.ExpireMonths, D.IssuedMonths,
	 D.ExpirePeriod, D.IssuesPeriod,
	 D.DocForLastCount, D.DocForLastPeriod,
	 D.Summa, D.Funding, D.NeedCount, N.shortname,
	 D.BeginDoc, T.DocId, D.SetOfDocument, D.SAMETYPEDOCID
from VisaDocuments_New D
left join VisaTypeDocs T on T.VisaTypeDocId = D.TypeDocId
left join VISADOCTYPE NT on NT.id = T.TypeId
left join VISADOC N on N.id = T.DocId
left join Posada P on P.id = D.Posada
left join VisaDocGroups_View G on G.VisaDocGroupId = D.VisaDocGroupId
left join VISASUBGROUPDOC sG on sG.id = D.SubGroupId

where D.VisaDocumentId <> :VisaDocumentId
 and D.EmbassyId = :EmbassyId and D.CountryId = :CountryId
 and ((D.SameTypeDocId = :SameTypeDocId) or (D.SetOfDocument = :SetOfDocument))
