select POWER_VOLT_FREQ.*,POWER_VOLT_FREQ.AVALUE||UNIT_MEASUR.short MEASURNAME from POWER_VOLT_FREQ
left join UNIT_MEASUR on UNIT_MEASUR.ID = POWER_VOLT_FREQ.id_unit_measur
