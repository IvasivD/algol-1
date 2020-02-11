  select cd.DictSectionId, cd.Id, d.sectionName, i.itemname
  from Country_sect_Descripts cd
  left join dictsections d on d.dictsectionid = cd.dictsectionid
  left join dictsection_items i on i.itemid = cd.itemid
  where cd.DictSectionId = :DictSectionId
