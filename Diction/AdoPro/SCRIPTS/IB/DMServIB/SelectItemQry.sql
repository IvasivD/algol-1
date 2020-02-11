select cd.DictSectionId, cd.Id, id.Descript, d.sectionName, i.itemname, cd.ItemId, cd.CountryId
  from Country_sect_Descripts cd
  left join dictsections d on d.dictsectionid = cd.dictsectionid
  left join dictsection_items i on i.itemid = cd.itemid
  left join Item_Description Id on Id.ItemId = cd.id and Id.TableName = 'COUNTRY_SECT_DESCRIPTS'
 where cd.CountryId = :CountryId 
