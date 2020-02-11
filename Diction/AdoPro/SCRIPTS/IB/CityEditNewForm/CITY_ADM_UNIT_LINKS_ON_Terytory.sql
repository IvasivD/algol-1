select  CL.*, ( select NAME FROM  CITY_PATH_PROC( CL.id_city_adm_unit, null, 0,448 ) ) NAME from CITY_ADM_UNIT_LINKS CL where  CL.id_obj_city_adm_unit =:ID
