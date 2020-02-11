 select D.VisaDocumentId, V.DocId, N.Name,
  D.NeedCount, D.AgeRestriction,
  D.ExpireMonths, D.IssuedMonths, D.Comments, D.Summa,
  V.TypeId, L.ItemName TypeName, D.Period, D.IsUse, N.shortname,
  D.ExpirePeriod, D.IssuesPeriod, D.TypeVal, D.TypeDocId,
  D.MarriedState, P.NAME Posada, D.ForInd, D.ForAddManual,
  D.Funding, D.Posada PosadaId, D.Returned, D.Transmit, D.FundingCount,
  D.VisaDocGroupId, G.GroupName, 
  D.BeginDoc, D.DocForLastCount, D.DocForLastPeriod,
  N.onetypedoc,  D.EmbassyId, sG.name SUBGROUPNAME, sG.id SubGroupId,
  DL.Link, D.Comments, D.CountryId, D.BeforeFiling, BeforeFilingPeriod, BankWithOutSum,
  D.SameTypeDocId, D.SetOfDocument, FilingAtWork, ForOwnerVisa
from VisaDocuments_New D
    left join VisaTypeDocs V on D.TypeDocId = V.VisaTypeDocId
    left join VisaDocLinks DL on DL.DocId = V.DocId and DL.TypeId = V.TypeId
    left join NameLists L on L.NameId = V.TypeId
    left join POSADA P on P.ID = D.Posada
    left join VisaDocGroups_View G on G.VisaDocGroupId = D.VisaDocGroupId
    left join VISASUBGROUPDOC sG on sG.id = D.SubGroupId,
    VISADOC N
where D.CountryId = :CountryId and N.id = V.DocId and D.EmbassyId = :COMPANYID
