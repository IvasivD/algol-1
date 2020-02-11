select OrgFormId, OrgFormName, FullName, ShortName, ShortIdent
from Comp_OrgForms_VIEW
where IsUse is null or (IsUse = 'T')
order by OrderInCategory
