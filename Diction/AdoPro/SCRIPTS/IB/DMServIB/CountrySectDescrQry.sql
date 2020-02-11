select COUNTRY_SECT_DESCRIPTS.*, case
    WHEN (COUNTRY_SECT_DESCRIPTS.dictsectionid is not null) THEN (select first 1 DICTSECTIONS.sectionname from DICTSECTIONS where DICTSECTIONS.dictsectionid = COUNTRY_SECT_DESCRIPTS.dictsectionid )
    WHEN (COUNTRY_SECT_DESCRIPTS.itemid is not null) THEN (select  first 1 DICTSECTION_ITEMS.itemname from DICTSECTION_ITEMS  where DICTSECTION_ITEMS.itemid = COUNTRY_SECT_DESCRIPTS.itemid )
    WHEN (COUNTRY_SECT_DESCRIPTS.name is not null) THEN ( COUNTRY_SECT_DESCRIPTS.name )
    ELSE ''
    END NAME_ITEM
from COUNTRY_SECT_DESCRIPTS
