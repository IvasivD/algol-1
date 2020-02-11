select  CL.*, ( select NAME FROM  CITY_PATH_PROC( CL.ID_OBJ_CITY_ADM_UNIT, null, 0,448 ) ) NAME from CITY_ADM_UNIT_LINKS CL where CL.id_city_adm_unit =:ID
