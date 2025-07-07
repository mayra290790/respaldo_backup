<<<<<<< HEAD
#!/usr/bin/ksh
#Variables 
fecha=$(date +%y-%m-%d)
localhost=$(hostname)
QMANAGER1="QM.COBISTS"
QMANAGER2="QM.COBISINT"
DESTINO_BACKUP="/cobishome/backups_SOC2_CTS_1"
DESTINO_BACKUP2="/cobishomeINT/backups_SOC2_CTS_2"
LOGS_PROFILE="/cobishome/backups_SOC2_CTS_1/QM.COBISTS_${localhost}_backup.log"
LOGS_PROFILE2="/cobishomeINT/backups_SOC2_CTS_2/QM.COBISINT_${localhost}_backup.log"

#T=$(date +"%Y%m%d_%H%M%S")
# Crear el directorio si no existe
#mkdir -p "$DESTINO_BACKUP"

# Comando de respaldo
echo "Generando Backup QM.COBISTS " 
dmpmqcfg -m "$QMANAGER1" -a > "$DESTINO_BACKUP/QM.COBISTS_$fecha.mqsc" 

echo "Generando Backup QM.COBISINT " 
dmpmqcfg -m "$QMANAGER2" -a > "$DESTINO_BACKUP2/QM.COBISINT_$fecha.mqsc" 


# Verificación del éxito
if [ $? -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup realizado exitosamente" >> "$LOGS_PROFILE"
	echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup realizado exitosamente" >> "$LOGS_PROFILE2"
else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Error al realizar el backup" >> "$LOGS_PROFILE"
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Error al realizar el backup" >> "$LOGS_PROFILE2"
=======
#!/usr/bin/ksh
#Variables 
fecha=$(date +%y-%m-%d)
localhost=$(hostname)
QMANAGER1="QM.COBISTS"
QMANAGER2="QM.COBISINT"
DESTINO_BACKUP="/cobishome/backups_SOC2_CTS_1"
DESTINO_BACKUP2="/cobishomeINT/backups_SOC2_CTS_2"
LOGS_PROFILE="/cobishome/backups_SOC2_CTS_1/QM.COBISTS_${localhost}_backup.log"
LOGS_PROFILE2="/cobishomeINT/backups_SOC2_CTS_2/QM.COBISINT_${localhost}_backup.log"

#T=$(date +"%Y%m%d_%H%M%S")
# Crear el directorio si no existe
#mkdir -p "$DESTINO_BACKUP"

# Comando de respaldo
echo "Generando Backup QM.COBISTS " 
dmpmqcfg -m "$QMANAGER1" -a > "$DESTINO_BACKUP/QM.COBISTS_$fecha.mqsc" 

echo "Generando Backup QM.COBISINT " 
dmpmqcfg -m "$QMANAGER2" -a > "$DESTINO_BACKUP2/QM.COBISINT_$fecha.mqsc" 


# Verificación del éxito
if [ $? -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup realizado exitosamente" >> "$LOGS_PROFILE"
	echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup realizado exitosamente" >> "$LOGS_PROFILE2"
else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Error al realizar el backup" >> "$LOGS_PROFILE"
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Error al realizar el backup" >> "$LOGS_PROFILE2"
>>>>>>> 7e8873460e85ef9cd782ece6c547d219ad0e430d
fi