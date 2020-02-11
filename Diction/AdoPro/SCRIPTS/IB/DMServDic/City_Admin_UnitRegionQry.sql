 Select  C.ID, C.ID_COUNTRY, C.NAME, C.ID_ADMIN_UNIT, C.ID_PARENT,C.ID_MAIN_PARENT, C.ID_MAIN_CITY, C.ID_ADMIN_UNIT_SUB, C.SHOWWEB, ADMIN_UNIT.ID_CITY_ADM_UNT_ITEMS_TYPE,ADMIN_UNIT.name ADMIN_UNIT_NAME,
 MC.NAME MAIN_CITY,
 CASE When ( C.id > 0  ) then
    ( select Count(Languages.ID) from Languages
      left join CITY_ADM_UNIT_lng on CITY_ADM_UNIT_lng.id_lng = Languages.id and CITY_ADM_UNIT_lng.id_city_adm_unit = C.ID
      where Languages.active_translate is not null and CITY_ADM_UNIT_lng.id_lng is null )
    else (
      select Count(Languages.ID) from Languages
      left join CITY_ADM_UNT_ITEMS_TYPE_LNG on CITY_ADM_UNT_ITEMS_TYPE_LNG.id_lng = Languages.id
      left join CITY_ADM_UNT_ITEMS_TYPE on CITY_ADM_UNT_ITEMS_TYPE.id = CITY_ADM_UNT_ITEMS_TYPE_LNG.id_adm_unt_items_type and CITY_ADM_UNT_ITEMS_TYPE_LNG.id_adm_unt_items_type = CITY_ADM_UNT_ITEMS_TYPE.id_parent_fortree
      where Languages.active_translate is not null and CITY_ADM_UNT_ITEMS_TYPE_LNG.id_lng is null )
    END LNGNOTFOUND,
 ( select sum( CITY_ADM_UNIT_lng.change_name ) from CITY_ADM_UNIT_lng where CITY_ADM_UNIT_lng.id_CITY_ADM_UNIT = C.ID ) LNGCHANGE


from CITY_ADM_UNIT C
left join CITY_ADM_UNIT MC on C.ID_MAIN_CITY = MC.id
left join ADMIN_UNIT on C.id_admin_unit = ADMIN_UNIT.id
where ADMIN_UNIT.ID_CITY_ADM_UNT_ITEMS_TYPE = 1 and MC.id_country = :COUNTRYID
