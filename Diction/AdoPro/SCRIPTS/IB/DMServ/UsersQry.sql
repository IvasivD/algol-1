  select TM.id,  COMPPERSONS.secondname||' '||COMPPERSONS.name as Manager,
   TM.comppersonid from tmusers_info TM
   left join COMPPERSONS on TM.comppersonid = COMPPERSONS.personid
   where  TM.id =:USERID
