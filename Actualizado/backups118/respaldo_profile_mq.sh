#!/usr/bin/ksh
#Variables 
fecha=$(date +%y-%m-%d)
localhost=$(hostname)
QMANAGER1="QM.COBISTS"
QMANAGER2="QM.COBISTS2"
DESTINO_BACKUP="/cobishome/backups_P690_CTS_1"
DESTINO_BACKUP2="/cobishome2/backups_P690_CTS_2"
LOGS_PROFILE="/./cobishome/backups_P690_CTS_1/QM.COBISTS_${localhost}_backup.log"
LOGS_PROFILE2="/cobishome2/backups_P690_CTS_2/QM.COBISTS2_${localhost}_backup.log"

#T=$(date +"%Y%m%d_%H%M%S")
# Crear el directorio si no existe
#mkdir -p "$DESTINO_BACKUP"

# Comando de respaldo
echo "Generando Backup QM.COBISTS " 
dmpmqcfg -m "$QMANAGER1" -a > "$DESTINO_BACKUP/QM.COBISTS_$fecha.mqsc" 

echo "Generando Backup QM.COBISTS2 " 
dmpmqcfg -m "$QMANAGER2" -a > "$DESTINO_BACKUP2/QM.COBISTS2_$fecha.mqsc" 


# Verificación del éxito
if [ $? -eq 0 ]; then
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Backup realizado exitosamente" >> "$LOGS_PROFILE"
else
    echo "$(date +'%Y-%m-%d %H:%M:%S') - Error al realizar el backup" >> "$LOGS_PROFILE2"
fi